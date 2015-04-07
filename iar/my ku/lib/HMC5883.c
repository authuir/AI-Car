#include "all.h"
#include "math.h"


//请先选择模式,旁路模式还是6050主控模式      
#define MPU6050_I2C_BYPASS_MODE
//#define HMC5883_I2C_MASTER_MODE


//**************************************
//作用：合成数据
//说明: 合成HMC5883L对应两个寄存器
//		的单字节数据为双字节数据
//		16位高字节左移8位加上下一寄存器值
//返回: 返回合成的双字节字符型数据
//**************************************
int16 HMC5883_GetData( uint8 REG_Address )
{
            uint8 H, L,I2C_CH=1;
	    I2C_R1(I2C_CH, HMC5883_SlaveAddress, REG_Address, 	&H);
	    I2C_R1(I2C_CH, HMC5883_SlaveAddress, REG_Address+1, 	&L);
	    return (int16)((((uint16)H)<< 8 ) | L);    //合成数据
}
void MPU6050_I2C_BYPASS()
{
  uint8 I2C_CH=1;
        I2C_W1( I2C_CH, 0x68, USER_CTRL,  0X00);//When I2C_MST_EN is set to 1, I2C Master Mode is enabled. In this mode, the MPU-60X0 acts as the I2C Master to the external sensor slave devices on the auxiliary I2C bus
        SYSDelay_us(20);
        I2C_W1( I2C_CH, 0x68, 0x37,   0X02);//When this bit is equal to 1 and I2C_MST_EN (Register 106 bit[5]) is equal to 0, the host application processor will be able to directly access the auxiliary I2C bus of the MPU-60X0.
        SYSDelay_us(20);
}
void MPU6050_I2C_MASTER()
{
  uint8 I2C_CH=1;
      I2C_W1( I2C_CH, 0x68, USER_CTRL,    0x20);//使能MPU6050主机模式
      I2C_W1( I2C_CH, 0x68, I2C_MST_CTRL, 0x0d);
      //I2C_W1( I2C_CH, 0x68, I2C_MST_CTRL, 0x4d);//设置等待从机把数据传输进mpu6050,设置MPU6050主机模式传输速率400khz
      
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,(HMC5883_SlaveAddress&0x7f));//最高位是读写位,最高位置位则MPU6050读HMC5883,清零则写
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_REG,  HMC_A);//设置采样数为8次,设置数据输出率为30Hz
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_DO,   (0x60|0x14));//I2C_SLV0_DO的值传输给从机HMC5883   
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X01);//设置传输一个字节  
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X81);//最高位使能,低四位的1指传输一个字节
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X01); 
      
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,(HMC5883_SlaveAddress&0x7f));//最高位是读写位,最高位置位则MPU6050读HMC5883,清零则写
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_DO,   0x60);//I2C_SLV0_DO的值传输给从机HMC5883   
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X01);//设置传输一个字节  
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X81);
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X01); 
      
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,(HMC5883_SlaveAddress&0x7f));//最高位是读写位,最高位置位则MPU6050读HMC5883,清零则写
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_REG,  HMC_Mode);//写HMC5883L工作模式寄存器
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_DO,   0X00);//I2C_SLV0_DO的值传输给从机HMC5883 //设置HMC5883L连续测量  //0x01单一测量 
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X01);//设置传输一个字节  
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X81);//写一个数据到HMC5883L,使能子设备
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X01); 
}


#if defined (MPU6050_I2C_BYPASS_MODE)//搭到总线上
//atan2(y,x)所表达的意思是坐标原点为起点，指向(x,y)的射线在坐标平面上与x轴正方向之间的角的角度
//atan2(y,x)的取值范围介于 -PI 到 PI 之间（不包括 -PI）
void HMC5883_Init()
{         
  uint8 I2C_CH=1;
        MPU6050_I2C_BYPASS();
	I2C_W1( I2C_CH, HMC5883_SlaveAddress, HMC_A, 	 (0x60|0x14));//设置采样数为8次,设置数据输出率为30Hz
	I2C_W1( I2C_CH, HMC5883_SlaveAddress, HMC_B, 	 0x60);//设置660Gain(LSB/Gauss),这是中间值
	I2C_W1( I2C_CH, HMC5883_SlaveAddress, HMC_Mode, 	 0X00);//设置为连续测试
}
void HMC5883_Read(double* Compass_Angle)
{
		//16-bit 2’s complement value
        int16 Compass_X,Compass_Y,Compass_Z;
        Compass_X=HMC5883_GetData( HMC_XH );
	Compass_Y=HMC5883_GetData( HMC_YH );
        Compass_Z=HMC5883_GetData( HMC_ZH );
        *Compass_Angle= atan2((double)Compass_Z,(double)Compass_X) * (180 / PI) + 180;
}
void HMC5883_Self_Test(uint8 test[3])
{
  uint8 I2C_CH=1;
   while(1)
   {
        for(uint8 i = 0; i < 3; i++)
        {
          switch(i)
          {
              case 0:I2C_R1(I2C_CH, HMC5883_SlaveAddress, HMC_SA, 	&test[0]);
                     I2C_R1(I2C_CH, HMC5883_SlaveAddress, HMC_SB, 	&test[1]);
                     I2C_R1(I2C_CH, HMC5883_SlaveAddress, HMC_SC, 	&test[2]);
                     SYSDelay_ms(1000);break;
              case 1:I2C_R1(I2C_CH, HMC5883_SlaveAddress, HMC_SA, 	&test[1]);
                     I2C_R1(I2C_CH, HMC5883_SlaveAddress, HMC_SB, 	&test[2]);
                     I2C_R1(I2C_CH, HMC5883_SlaveAddress, HMC_SC, 	&test[0]);
                     SYSDelay_ms(1000);break;
              case 2:I2C_R1(I2C_CH, HMC5883_SlaveAddress, HMC_SA, 	&test[2]);
                     I2C_R1(I2C_CH, HMC5883_SlaveAddress, HMC_SB, 	&test[0]);
                     I2C_R1(I2C_CH, HMC5883_SlaveAddress, HMC_SC, 	&test[1]);
                     SYSDelay_ms(1000);break;
          }
        }
    }
}

#elif defined (HMC5883_I2C_MASTER_MODE)
void HMC5883_Init()
{
      MPU6050_I2C_MASTER();
}
#define EXT_SENS_DATA_00        0x49//MPU6050的寄存器地址
void HMC5883_Read(double* Compass_Angle)
{
  uint8 I2C_CH=1;
      int16 Compass_X,Compass_Y,Compass_Z;
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,        (HMC5883_SlaveAddress|0x80));//最高位是读写位,最高位置位则MPU6050读HMC5883,清零则写
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_REG,         HMC_XH);//从HMC 0x03寄存器开始读取  
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x06);//向后读取6个寄存器   
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x86);//低四位指向后读取6个寄存器,最高位指使能 
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0X06); 
      //16-bit 2’s complement value  
      Compass_X = MPU6050_GetData(EXT_SENS_DATA_00);
      Compass_Y = MPU6050_GetData(EXT_SENS_DATA_00+2);
      Compass_Z = MPU6050_GetData(EXT_SENS_DATA_00+4);
      *Compass_Angle= atan2((double)Compass_Z,(double)Compass_X) * (180 / PI) + 180;
}

void HMC5883_Self_Test(uint8 test[3])
{
  uint8 I2C_CH=1;
  while(1)
   {
      for(uint8 i = 0; i < 3; i++)
      {
           switch(i)
           {
           case 0:
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,        (HMC5883_SlaveAddress|0x80));//最高位是读写位,最高位置位则MPU6050读HMC5883,清零则写
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_REG,         HMC_SA);//从HMC 0x03寄存器开始读取  
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x03);   
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x83);
                   I2C_R1(I2C_CH, 0x68, 0x49,                  &test[0]);
                   I2C_R1(I2C_CH, 0x68, 0x49+1,                &test[1]);
                   I2C_R1(I2C_CH, 0x68, 0x49+2,                &test[2]);
                   SYSDelay_ms(1000);break;
           case 1:
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,        (HMC5883_SlaveAddress|0x80));//最高位是读写位,最高位置位则MPU6050读HMC5883,清零则写
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_REG,         HMC_SA);//从HMC 0x03寄存器开始读取  
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x03);   
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x83);
                   I2C_R1(I2C_CH, 0x68, 0x49,                  &test[1]);
                   I2C_R1(I2C_CH, 0x68, 0x49+1,                &test[2]);
                   I2C_R1(I2C_CH, 0x68, 0x49+2,                &test[0]);
                   SYSDelay_ms(1000);break;
           case 2:
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,        (HMC5883_SlaveAddress|0x80));//最高位是读写位,最高位置位则MPU6050读HMC5883,清零则写
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_REG,         HMC_SA);//从HMC 0x03寄存器开始读取  
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x03);   
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x83);
                   I2C_R1(I2C_CH, 0x68, 0x49,                  &test[2]);
                   I2C_R1(I2C_CH, 0x68, 0x49+1,                &test[0]);
                   I2C_R1(I2C_CH, 0x68, 0x49+2,                &test[1]);
                   SYSDelay_ms(1000);break;
          }
      }
   }
}
#endif



