#include "all.h"

//******************************************************************
//函数名：void GPIOType_UART(uint32 PORT_R_T)
//简介：定义UART引脚
//参数：略,.H里面有定义
//******************************************************************
void GPIOType_UART(uint32 PORT_R_T)
 {
     switch(PORT_R_T)
      {
          //UART0
      case PORTD_6_7:PORTD_PCR6|=PORT_PCR_MUX(0X3);
                      PORTD_PCR7|=PORT_PCR_MUX(0X3);
                      break;
      case PORTB_16_17:PORTB_PCR16|=PORT_PCR_MUX(0x3);
                       PORTB_PCR17|=PORT_PCR_MUX(0X3);
                       break;
      case PORTA_14_15:PORTA_PCR14|=PORT_PCR_MUX(0X3);
                        PORTA_PCR15|=PORT_PCR_MUX(0X3);
                        break;
     case PORTA_1_2:  PORTA_PCR1|=PORT_PCR_MUX(0X2);
                        PORTA_PCR2|=PORT_PCR_MUX(0X2);
                        break;
         //UART1
      case PORTE_0_1:PORTE_PCR0|=PORT_PCR_MUX(0X3);
                      PORTE_PCR1|=PORT_PCR_MUX(0X3);
                        break;
      case PORTC_3_4:PORTC_PCR3|=PORT_PCR_MUX(0X3);
                      PORTC_PCR4|=PORT_PCR_MUX(0X3);
                      break;
      //UART2
      case PORTD_2_3:PORTD_PCR2|=PORT_PCR_MUX(0X3);
                     PORTD_PCR3|=PORT_PCR_MUX(0X3);
                     break;
      //UART3
      case PORTE_4_5:PORTE_PCR4|=PORT_PCR_MUX(0X3);
                      PORTE_PCR5|=PORT_PCR_MUX(0X3);
                      break;
      case PORTB_10_11:PORTB_PCR10|=PORT_PCR_MUX(0X3);
                        PORTB_PCR11|=PORT_PCR_MUX(0X3);
                       break;
      case PORTC_16_17:PORTC_PCR16|=PORT_PCR_MUX(0X3);
                       PORTC_PCR17|=PORT_PCR_MUX(0X3);
                       break;
      //UART4
      case  PORTE_24_25:PORTE_PCR24|=PORT_PCR_MUX(0X3);
                        PORTE_PCR25|=PORT_PCR_MUX(0X3);
                        break;
      case PORTC_14_15:PORTC_PCR14|=PORT_PCR_MUX(0X3);
                        PORTC_PCR15|=PORT_PCR_MUX(0X3);
                        break;
      //UART5
      case PORTE_8_9:PORTE_PCR8|=PORT_PCR_MUX(0X3);
                      PORTE_PCR9|=PORT_PCR_MUX(0X3);
                      break;
      case PORTD_8_9:PORTD_PCR8|=PORT_PCR_MUX(0X3);
                      PORTD_PCR9|=PORT_PCR_MUX(0X3);
                      break;             
                       
      }
 }
//******************************************************************************
//函数名称：void  UART_INIT(uint32 UART_NUM,uint32 SYS_CLOCK,uint32 BAUD)
//简介：UART初始化函数
//参数：UART_NUM   从UART0-5
//      SYS_CLOCK:系统时钟
//      BAUD:设定波特率       //待解决
//*******************************************************************************
void UART_INIT(uint32 UART_NUM,uint32 BUS_CLOCK,uint32 BAUD)
 {
      uint16 sbr,brfa;
      uint8 temp;
      if(UART_NUM<4)
        SIM_SCGC4|=1<<(UART_NUM+10);
    else SIM_SCGC1|=1<<(UART_NUM+6-124);
      //关闭串口发送与接受功能
      HWREG8(UART_C2_BASE+UART_NUM*(0X1000))&=~(UART_C2_TE_MASK|UART_C2_RE_MASK);
      //配置串口工作模式：8位无校验模式
      HWREG8(UART_C1_BASE +UART_NUM*(0X1000))=0;
      //配置baud rate:
      //串口0，1使用的内核时钟，其他串口使用总线时钟，一般设定内核时钟为总线时钟的2倍
      if(UART_NUM<2) BUS_CLOCK+=BUS_CLOCK;
      sbr=(BUS_CLOCK*1000)/(BAUD*16);           
      if(sbr>0x1fff) sbr=0x1fff;
      temp=HWREG8(UART_BDH_BASE+UART_NUM*(0X1000))&(~(0X1F));
      HWREG8(UART_BDH_BASE+UART_NUM*(0X1000))=(uint8)temp|UART_BDH_SBR((sbr&0x1f00)>>8);
      HWREG8(UART_BDL_BASE+UART_NUM*(0X1000))=(uint8)(sbr&UART_BDL_SBR_MASK);
      brfa=(BUS_CLOCK*1000)/(BAUD)-(sbr*32);
      temp=HWREG8(UART_C4_BASE+UART_NUM*(0X1000))&(~UART_C4_BRFA(0X1F));
      HWREG8(UART_C4_BASE+UART_NUM*(0X1000))=(uint8)temp|UART_C4_BRFA(brfa);
      //启动发送接受
      HWREG8(UART_C2_BASE+UART_NUM*(0X1000))|=(uint8)(UART_C2_TE_MASK|UART_C2_RE_MASK);
 }
//******************************************************************************
//函数名：uint8 UART_RE1(uint32 UART_NUM,uint *fp)
//简介：接受一个数据
//参数：UART_NUM:0-5
//      fp:判断是否收到数据  1表示成功，0表示失败
//*****************************************************************************
uint8 UART_R1(uint32 UART_NUM,uint8 *fp)
 {
    uint32 t;
    uint8 date;
    for(t=0;t<0xfbbb;t++)
     { 
         if((HWREG8(UART_S1_BASE+UART_NUM*(0X1000))>>5)&(0X01))
          {
              date=HWREG8(UART_D_BASE +UART_NUM*(0X1000));
              *fp=1;
              break;
          }//endif
     }//end for
    if(t>=0xfbbb)
     {
         date=0xff;
         *fp=0;//未收到数据
     }
    return date;
 }

//***********************************************************************************\
//函数名称：uint8 UART_S1(uint32 UART_NUM,uint8 ch)
//简介：发送一个字节
//参数：UART_NUM:UART0~5
//      ch:字节
//返回值：1表示发送成功，0表示失败
//***********************************************************************************
uint8 UART_S1(uint32 UART_NUM,uint8 ch)
 {
      uint32 t;
      for(t=0;t<0xfbbb;t++)
       {
           //判断发送缓冲区是否为空
           if((HWREG8(UART_S1_BASE+UART_NUM*(0X1000))>>7)&(0X01))
            {
                HWREG8(UART_D_BASE +UART_NUM*(0X1000))=ch;
                break;
            }
       }
       if(t>=0xfbbb) return 0;//超时发送
       else return 1;//表明数据发送成功
 }

//****************************************************************************
//函数名：uint8 UART_RN(uint32 UART_NUM,uint32 lenth,uint8* date) 
//简介：接受N个字节
//参数：UART_NUM  0~5
//      lenth:字符串长度
//      date:接受数据数组      
//****************************************************************************
uint8 UART_RN(uint32 UART_NUM,uint32 lenth,uint8* date)
 {
        uint32 i;
        uint8 flag=1;
        for(i=0;(i<lenth)&&(flag==1);i++)
         {
             date[i]=UART_R1(UART_NUM,&flag);
         }
        if(i>=lenth) return 1;//接受成功   （有差异？？？）
        else return 0;
 }

//****************************************************************************
//函数名：uint8 UART_SN(uint32 UART_NUM,uint32 lenth,uint8* date) 
//简介：发送N个字节
//参数：UART_NUM  0~5
//      lenth:字符串长度
//      date:接受数据数组    
//返回值：1成功，0失败
//****************************************************************************
uint8 UART_SN(uint32 UART_NUM,uint32 lenth,uint8* date)
 {
     uint32 i;
     for(i=0;i<lenth;i++)
      {
          if(!UART_S1(UART_NUM,date[i]))
              break;
      }
     if(i>=lenth)
         return 1;//表示成功
     else return 0;//失败
 }
//*************************************************************************
//函数名称：uint8 UART_SS(uint32 UART_NUM,void *buff)
//简介：传输一个字符串
//参数：NART_NUM0~5,   "STRING"
//************************************************************************
uint8 UART_SS(uint32 UART_NUM,void *buff)
 {
     uint32 i;
     uint8 *date=(uint8 *)buff;
     for(i=0;date[i]!='\0';i++)
      {
          if(!UART_S1(UART_NUM,date[i]))
              return 1;
      }
     return 0;
     
 }

//*************************************************************
//函数名：void UARTINT_Enable(uint32 UART_NUM,uint32 INT_CLASS)
//简介：使能中断的类型
//参数：UART_NUM0~5  
//      INT_CLASS:ILIE，RIE，TCIE，TIE，PEIE，FEIE，NEIE，ORIE
//说明：此中断打开后，必须用Enable_IRQ()打开对应向量号才可使用
//*************************************************************
void UARTINT_Enable(uint32 UART_NUM,uint32 INT_CLASS)
 {
     if(INT_CLASS<4)
         HWREG8(UART_C3_BASE+UART_NUM*(0X1000))|=1<<INT_CLASS;
     else HWREG8(UART_C2_BASE +UART_NUM*(0X1000))|=1<<INT_CLASS;
 }

//***************************************************************
//同  UARTINT_Enable,关闭对应中断
//**************************************************************
void UARTINT_Disable(uint32 UART_NUM,uint32 INT_CLASS)
 {
     if(INT_CLASS<4)
         HWREG8(UART_C3_BASE +UART_NUM*(0X1000))&=~((uint32)1<<INT_CLASS);
     else HWREG8(UART_C2_BASE +UART_NUM*(0X1000))&=~((uint32)1<<INT_CLASS);
 }

//***************************************************************
//函数功能：使能FIFO功能  K60  UART0和UART1深度为8，其余为1
//初始化读的功能,传输功能暂时不考虑,bit表示一次传输的数据数
//***************************************************************
void UART_FIFO_read_init(uint32 UART_NUM)
 {
     HWREG8(UART_C2_BASE+UART_NUM*(0X1000))&=~(UART_C2_TE_MASK|UART_C2_RE_MASK);//关闭TE,RE才可以开启FIFO
     HWREG8(UART_PFIFO_BASE+UART_NUM*(0X1000))|=UART_PFIFO_RXFE_MASK;
     HWREG8(UART_TWFIFO_BASE+UART_NUM*(0X1000))=0;
     HWREG8(UART_RWFIFO_BASE +UART_NUM*(0X1000))=FIFO_BIT;
     HWREG8(UART_C2_BASE+UART_NUM*(0X1000))|=(UART_C2_TE_MASK|UART_C2_RE_MASK);//打开TX,RX使用配置完成的FIFO
 }
void UART_FIFO_Read_value(uint32 UART_NUM,uint8* date)
 {
     uint8 i,clear;
     clear=HWREG8(UART_S1_BASE+UART_NUM*(0X1000));//读S1清标志位
     for(i=0;i<8;i++)
      {
         *date=HWREG8(UART_D_BASE+UART_NUM*(0X1000));
         date++;
      }
     HWREG8(UART_CFIFO_BASE+UART_NUM*(0X1000))|=0X40;//清空接受缓存，可删减
 }
/*
void UART_FIFO_Send(uint32 UART_NUM,uint8 date[])
 {
     uint8 i;
     for(i=0;i<8;i++)
      {
          
      }
 }*/
//***************************************************************
//读取当前缓冲器中剩余的TX,RX的值
//***************************************************************
void UART_CountRead(uint32 UART_NUM,uint8* TX_count,uint8* RX_count)
 {
     *TX_count=HWREG(UART_TCFIFO_BASE+UART_NUM*(0X1000));
     *RX_count=HWREG(UART_RCFIFO_BASE+UART_NUM*(0X1000));
 }
