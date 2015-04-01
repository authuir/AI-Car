#include "all.h"

//����һ����СΪ7�����飬����1-7λ��Ч
//��ʼ��������C1-C6�Ĵ�����ֵ
//*************************************************************************
//��飺��ӻ�дһ���ֽ�,����޴洢���Ĵӻ�
//DeviceAddr:�豸��ַ
//AccessAddr�����ʵ�ַ
//����ֵ��1��ʾ�ɹ���0��ʾʧ��
//*************************************************************************
uint8 I2C_W1_new(uint32 I2C_NUM,uint8 DeviceAddr,uint8 command)
 {
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;        //TX=1,MCU���óɷ���ģʽ
     I2C_signal(I2C_NUM,Start);                 //���Ϳ�ʼ�ź�
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//�����豸��ַ
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=command;
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     I2C_signal(I2C_NUM,Stop);
     SYSDelay_ms(5);
     return 1;
 }
uint8 I2C_R1_new(uint32 I2C_NUM,uint8 DeviceAddr,uint8 command,uint16* data)
 {
     uint8 HIGH,LOW;
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;        //TX=1,MCU���óɷ���ģʽ
     I2C_signal(I2C_NUM,Start);                 //���Ϳ�ʼ�ź�
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//�����豸��ַ
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=command;
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0x04;//��MCUΪ����ģʽʱ��д1����һ�����¿�ʼ�ź�
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)|0x01;
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XEF;        //TX=0,MCU����Ϊ����ģʽ
     HIGH=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));         //����I2C D,׼���������� 
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     HIGH=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));         //����I2C D,׼���������� 
     LOW=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000)); 
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     I2C_signal(I2C_NUM,Stop); 
     *data=((uint16)(HIGH))<<8+(uint16)(LOW);    //�������ܵ���һ������
      SYSDelay_ms(1);
      return 1;
 }
void MS5611_Init(uint16 Cal_C[]) 
{ 
      uint16 i;
      I2C_W1_new( I2C1,  MS5611_SlaveAddress,MS5611_RST);
      SYSDelay_ms(1000);
      for(i=1;i<=6;i++)       //��C1-C6,����������
      {
          I2C_W1_new(I2C1,MS5611_SlaveAddress,MS5611_PROM_RD+i*2);
          I2C_R1_new(I2C1, MS5611_SlaveAddress,MS5611_PROM_RD+i*2,&Cal_C[i]);
      SYSDelay_ms(10); 
      }
}
//д�����
uint32 MS5611_DO_CONVERSION(uint8 command)
{
     uint32 conversion=0;
     uint8 conv1,conv2,conv3;
     I2C_W1_new( I2C1, MS5611_SlaveAddress,  command);//������
     //SYSDelay_ms(1);
     I2C_R1(I2C1, MS5611_SlaveAddress, 0,&conv1);
     I2C_R1(I2C1, MS5611_SlaveAddress, 1,&conv2);
     I2C_R1(I2C1, MS5611_SlaveAddress, 2,&conv3);
     conversion=((uint32)conv1)*65535+((uint32)conv2)*256+(uint32)conv3; 
     return conversion;
}

int64 MS5611_get(uint16 CX[])
{ 
      uint32 D2_Temp,D1_Pres;
      int32 dT,TEMP,T2;
      int64 OFF,SENS,Pressure,OFF2,SENS2;
      D2_Temp= MS5611_DO_CONVERSION(D2_OSR); 
      SYSDelay_ms(10); 
      dT=D2_Temp - (((uint64)CX[5])<<8); 
      TEMP=2000+dT*((uint64)CX[6])/8388608; 
      D1_Pres= MS5611_DO_CONVERSION(D1_OSR);
     // SYSDelay_us(100); 
      OFF=(uint64)CX[2]*65536+((uint64)CX[4]*dT)/128; 
      SENS=(uint64)CX[1]*32768+((uint64)CX[3]*dT)/256; 
      if(TEMP<2000) 
      { 
          // second order temperature compensation when under 20 degrees C 
          T2    = (dT*dT) / 0x80000000; 
          OFF2  = 5*(TEMP-2000)*(TEMP-2000)/2; 
          SENS2 = 5*(TEMP-2000)*(TEMP-2000)/4; 
          TEMP  = TEMP - T2; 
          OFF  = OFF - OFF2; 
          SENS  = SENS - SENS2;	
      }
      Pressure=((int64)D1_Pres*SENS/2097152-OFF)/32768;
      return Pressure;
} 

