#include "all.h"
uint8 a;
//****************************************************************
//初始化I2C，参数定义在I2C.h
//波特率可选，在函数内部 修改。
//***************************************************************
void I2C_INIT(uint32 I2C_NUM,char PIN_NUM)
 {
     SIM_SCGC4|=(uint32)(1<<(6+I2C_NUM));
     switch(PIN_NUM)
      {
      case I2C0_PB0_PB1:
                PORT_Enable(PORTB);
                PORTB_PCR0=PORT_PCR_MUX(2);
                PORTB_PCR1=PORT_PCR_MUX(2);
                break;
      case I2C0_PB2_PB3:
                PORT_Enable(PORTB);
                PORTB_PCR2=PORT_PCR_MUX(2);
                PORTB_PCR3=PORT_PCR_MUX(2);
                break;
      case I2C1_PC10_PC11:
                PORT_Enable(PORTC);
                PORTC_PCR10=PORT_PCR_MUX(2);
                PORTC_PCR11=PORT_PCR_MUX(2);
                break;
      case I2C0_PD8_PD9:
                PORT_Enable(PORTD);
                PORTD_PCR8=PORT_PCR_MUX(2);
                PORTD_PCR9=PORT_PCR_MUX(2);
                break;
      case I2C1_PE0_PE1:
                PORT_Enable(PORTE);
                PORTE_PCR0=PORT_PCR_MUX(6);
                PORTE_PCR1=PORT_PCR_MUX(6);
                break;
      }
     //设置MULT和ICR,波特率
     HWREG8(I2C_F_BASE+I2C_NUM*(0X1000))=baud_rate;//可修改，波特率为I2C baud rate = bus speed (Hz)/(mul × SCL divider),此处为390.625k
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=I2C_C1_IICIE_MASK;
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=I2C_C1_IICEN_MASK;//使能I2C//mpu6050要写TXAK=0|I2C_C1_TXAK_MASK

 }

//*************************************************************************
//信号产生函数：signal:Start,Stop
//*************************************************************************
void I2C_signal(uint32 I2C_NUM,uint8 signal)
 {
     if(signal)  HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=I2C_C1_MST_MASK;
     else HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=~I2C_C1_MST_MASK;
 }

//*************************************************************************
//信号产生函数：x:anwser,translate,等待应答和等待传输完成
//返回值：1：收到 应答信号或一个字节传输完成
//        0：接受或传输失败
//*************************************************************************
uint8 I2C_wait(uint32 I2C_NUM,uint8 x)
 {
     uint16 i;
     for(i=0;i<0xff*10;i++)
      {
          if(x) 
           {
               if((HWREG8(I2C_S_BASE+I2C_NUM*(0X1000))&I2C_S_RXAK_MASK)==0)
                   return 1;
           }
          else 
           {
               if((HWREG8(I2C_S_BASE+I2C_NUM*(0X1000))&I2C_S_IICIF_MASK)!=0)
                {
                    HWREG8(I2C_S_BASE+I2C_NUM*(0X1000))|=I2C_S_IICIF_MASK;//清除标志
                   return 1;
                }
           }
      }
     if(i>=0xff*10) return 0;
     else  return 1;
 }
//*************************************************************************
//简介：接受一个字节
//DeviceAddr:设备地址
//AccessAddr：访问地址
//返回值：1表示成功，0表示失败
//*************************************************************************
uint8 I2C_R1(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 *data)
 {
      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;//设置为发送模式
     I2C_signal(I2C_NUM,Start);                 //发送开始信号
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//发送设备地址
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=AccessAddr;  //发送访问地址
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0x04;//当MCU为主机模式时，写1产生一个重新开始信号
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)|0x01;
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XEF;        //TX=0,MCU设置为接受模式
     *data=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));         //读出I2C D,准备接受数据 
      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
     I2C_signal(I2C_NUM,Stop); 
      *data=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));
      //读出接受到的一个数据
      SYSDelay_us(20);
      return 1;
 }
//*************************************************************************
//简介：向从机写一个字节,针对有存储器的从机
//DeviceAddr:设备地址
//AccessAddr：访问地址
//返回值：1表示成功，0表示失败
//*************************************************************************
uint8 I2C_W1(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 data)
 {
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;        //TX=1,MCU设置成发送模式
     I2C_signal(I2C_NUM,Start);                 //发送开始信号
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//发送设备地址
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=AccessAddr;  //发送访问地址
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=data;
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
     I2C_signal(I2C_NUM,Stop);
     SYSDelay_us(5);
     return 1;
 }


//*************************************************************************
//简介：接受N个字节
//DeviceAddr:设备地址
//AccessAddr：访问地址
//返回值：1表示成功，0表示失败
//*************************************************************************
uint8 I2C_RN(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 len,uint8 *data)
 {
    HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;//设置为发送模式
     I2C_signal(I2C_NUM,Start);                 //发送开始信号
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//发送设备地址
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=AccessAddr;  //发送访问地址
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0x04;//当MCU为主机模式时，写1产生一个重新开始信号
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)|0x01;
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XEF;        //TX=0,MCU设置为接受模式
     *data=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));         //读出I2C D,准备接受数据 
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XF7;
     if(!(I2C_wait(I2C_NUM,translate))) return 0;       //等待一个字节数据传输完成
     while(len)
      {
        *data=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));         //读出I2C D,准备接受数据 
        if(len==1) HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X08;
        else HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XF7;
        if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        len--;
        data++;
      } 
      I2C_signal(I2C_NUM,Stop); 
     SYSDelay_us(70);
      return 1;
 }

//*************************************************************************
//简介：向从机写N个字节
//DeviceAddr:设备地址
//AccessAddr：访问地址
//返回值：1表示成功，0表示失败
//*************************************************************************
uint8 I2C_WN(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 N,uint8 *data)
 {
     uint8 i;
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;        //TX=1,MCU设置成发送模式
     I2C_signal(I2C_NUM,Start);                 //发送开始信号
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//发送设备地址
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=AccessAddr;  //发送访问地址
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
     for(i=0;i<N;i++)
      {
        HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=*data;
        if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
        data++; 
      }
     I2C_signal(I2C_NUM,Stop);
     SYSDelay_us(70);
     return 1;
 }

//***************************************************************************
//I2C中断的开启和关闭
//*************************************************************************
void I2CINT_Enable(uint32 I2C_NUM)
 {
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=I2C_C1_IICIE_MASK;
 }

void I2CINT_Disable(uint32 I2C_NUM)
 {
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=~I2C_C1_IICIE_MASK;
 }