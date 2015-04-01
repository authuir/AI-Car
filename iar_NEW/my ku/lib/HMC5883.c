#include "all.h"
#include "math.h"


//����ѡ��ģʽ,��·ģʽ����6050����ģʽ      
#define MPU6050_I2C_BYPASS_MODE
//#define HMC5883_I2C_MASTER_MODE


//**************************************
//���ã��ϳ�����
//˵��: �ϳ�HMC5883L��Ӧ�����Ĵ���
//		�ĵ��ֽ�����Ϊ˫�ֽ�����
//		16λ���ֽ�����8λ������һ�Ĵ���ֵ
//����: ���غϳɵ�˫�ֽ��ַ�������
//**************************************
int16 HMC5883_GetData( uint8 REG_Address )
{
            uint8 H, L,I2C_CH=1;
	    I2C_R1(I2C_CH, HMC5883_SlaveAddress, REG_Address, 	&H);
	    I2C_R1(I2C_CH, HMC5883_SlaveAddress, REG_Address+1, 	&L);
	    return (int16)((((uint16)H)<< 8 ) | L);    //�ϳ�����
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
      I2C_W1( I2C_CH, 0x68, USER_CTRL,    0x20);//ʹ��MPU6050����ģʽ
      I2C_W1( I2C_CH, 0x68, I2C_MST_CTRL, 0x0d);
      //I2C_W1( I2C_CH, 0x68, I2C_MST_CTRL, 0x4d);//���õȴ��ӻ������ݴ����mpu6050,����MPU6050����ģʽ��������400khz
      
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,(HMC5883_SlaveAddress&0x7f));//���λ�Ƕ�дλ,���λ��λ��MPU6050��HMC5883,������д
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_REG,  HMC_A);//���ò�����Ϊ8��,�������������Ϊ30Hz
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_DO,   (0x60|0x14));//I2C_SLV0_DO��ֵ������ӻ�HMC5883   
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X01);//���ô���һ���ֽ�  
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X81);//���λʹ��,����λ��1ָ����һ���ֽ�
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X01); 
      
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,(HMC5883_SlaveAddress&0x7f));//���λ�Ƕ�дλ,���λ��λ��MPU6050��HMC5883,������д
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_DO,   0x60);//I2C_SLV0_DO��ֵ������ӻ�HMC5883   
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X01);//���ô���һ���ֽ�  
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X81);
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X01); 
      
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,(HMC5883_SlaveAddress&0x7f));//���λ�Ƕ�дλ,���λ��λ��MPU6050��HMC5883,������д
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_REG,  HMC_Mode);//дHMC5883L����ģʽ�Ĵ���
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_DO,   0X00);//I2C_SLV0_DO��ֵ������ӻ�HMC5883 //����HMC5883L��������  //0x01��һ���� 
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X01);//���ô���һ���ֽ�  
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X81);//дһ�����ݵ�HMC5883L,ʹ�����豸
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL, 0X01); 
}


#if defined (MPU6050_I2C_BYPASS_MODE)//�������
//atan2(y,x)��������˼������ԭ��Ϊ��㣬ָ��(x,y)������������ƽ������x��������֮��ĽǵĽǶ�
//atan2(y,x)��ȡֵ��Χ���� -PI �� PI ֮�䣨������ -PI��
void HMC5883_Init()
{         
  uint8 I2C_CH=1;
        MPU6050_I2C_BYPASS();
	I2C_W1( I2C_CH, HMC5883_SlaveAddress, HMC_A, 	 (0x60|0x14));//���ò�����Ϊ8��,�������������Ϊ30Hz
	I2C_W1( I2C_CH, HMC5883_SlaveAddress, HMC_B, 	 0x60);//����660Gain(LSB/Gauss),�����м�ֵ
	I2C_W1( I2C_CH, HMC5883_SlaveAddress, HMC_Mode, 	 0X00);//����Ϊ��������
}
void HMC5883_Read(double* Compass_Angle)
{
		//16-bit 2��s complement value
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
#define EXT_SENS_DATA_00        0x49//MPU6050�ļĴ�����ַ
void HMC5883_Read(double* Compass_Angle)
{
  uint8 I2C_CH=1;
      int16 Compass_X,Compass_Y,Compass_Z;
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,        (HMC5883_SlaveAddress|0x80));//���λ�Ƕ�дλ,���λ��λ��MPU6050��HMC5883,������д
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_REG,         HMC_XH);//��HMC 0x03�Ĵ�����ʼ��ȡ  
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x06);//����ȡ6���Ĵ���   
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x86);//����λָ����ȡ6���Ĵ���,���λָʹ�� 
      I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0X06); 
      //16-bit 2��s complement value  
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
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,        (HMC5883_SlaveAddress|0x80));//���λ�Ƕ�дλ,���λ��λ��MPU6050��HMC5883,������д
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_REG,         HMC_SA);//��HMC 0x03�Ĵ�����ʼ��ȡ  
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x03);   
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x83);
                   I2C_R1(I2C_CH, 0x68, 0x49,                  &test[0]);
                   I2C_R1(I2C_CH, 0x68, 0x49+1,                &test[1]);
                   I2C_R1(I2C_CH, 0x68, 0x49+2,                &test[2]);
                   SYSDelay_ms(1000);break;
           case 1:
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,        (HMC5883_SlaveAddress|0x80));//���λ�Ƕ�дλ,���λ��λ��MPU6050��HMC5883,������д
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_REG,         HMC_SA);//��HMC 0x03�Ĵ�����ʼ��ȡ  
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x03);   
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_CTRL,        0x83);
                   I2C_R1(I2C_CH, 0x68, 0x49,                  &test[1]);
                   I2C_R1(I2C_CH, 0x68, 0x49+1,                &test[2]);
                   I2C_R1(I2C_CH, 0x68, 0x49+2,                &test[0]);
                   SYSDelay_ms(1000);break;
           case 2:
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_ADDR,        (HMC5883_SlaveAddress|0x80));//���λ�Ƕ�дλ,���λ��λ��MPU6050��HMC5883,������д
                   I2C_W1( I2C_CH, 0x68, I2C_SLV0_REG,         HMC_SA);//��HMC 0x03�Ĵ�����ʼ��ȡ  
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



