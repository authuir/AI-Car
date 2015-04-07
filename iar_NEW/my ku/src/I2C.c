#include "all.h"
uint8 a;
//****************************************************************
//��ʼ��I2C������������I2C.h
//�����ʿ�ѡ���ں����ڲ� �޸ġ�
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
     //����MULT��ICR,������
     HWREG8(I2C_F_BASE+I2C_NUM*(0X1000))=baud_rate;//���޸ģ�������ΪI2C baud rate = bus speed (Hz)/(mul �� SCL divider),�˴�Ϊ390.625k
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=I2C_C1_IICIE_MASK;
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=I2C_C1_IICEN_MASK;//ʹ��I2C//mpu6050ҪдTXAK=0|I2C_C1_TXAK_MASK

 }

//*************************************************************************
//�źŲ���������signal:Start,Stop
//*************************************************************************
void I2C_signal(uint32 I2C_NUM,uint8 signal)
 {
     if(signal)  HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=I2C_C1_MST_MASK;
     else HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=~I2C_C1_MST_MASK;
 }

//*************************************************************************
//�źŲ���������x:anwser,translate,�ȴ�Ӧ��͵ȴ��������
//����ֵ��1���յ� Ӧ���źŻ�һ���ֽڴ������
//        0�����ܻ���ʧ��
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
                    HWREG8(I2C_S_BASE+I2C_NUM*(0X1000))|=I2C_S_IICIF_MASK;//�����־
                   return 1;
                }
           }
      }
     if(i>=0xff*10) return 0;
     else  return 1;
 }
//*************************************************************************
//��飺����һ���ֽ�
//DeviceAddr:�豸��ַ
//AccessAddr�����ʵ�ַ
//����ֵ��1��ʾ�ɹ���0��ʾʧ��
//*************************************************************************
uint8 I2C_R1(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 *data)
 {
      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;//����Ϊ����ģʽ
     I2C_signal(I2C_NUM,Start);                 //���Ϳ�ʼ�ź�
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//�����豸��ַ
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=AccessAddr;  //���ͷ��ʵ�ַ
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0x04;//��MCUΪ����ģʽʱ��д1����һ�����¿�ʼ�ź�
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)|0x01;
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XEF;        //TX=0,MCU����Ϊ����ģʽ
     *data=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));         //����I2C D,׼���������� 
      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     I2C_signal(I2C_NUM,Stop); 
      *data=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));
      //�������ܵ���һ������
      SYSDelay_us(20);
      return 1;
 }
//*************************************************************************
//��飺��ӻ�дһ���ֽ�,����д洢���Ĵӻ�
//DeviceAddr:�豸��ַ
//AccessAddr�����ʵ�ַ
//����ֵ��1��ʾ�ɹ���0��ʾʧ��
//*************************************************************************
uint8 I2C_W1(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 data)
 {
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;        //TX=1,MCU���óɷ���ģʽ
     I2C_signal(I2C_NUM,Start);                 //���Ϳ�ʼ�ź�
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//�����豸��ַ
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=AccessAddr;  //���ͷ��ʵ�ַ
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=data;
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     I2C_signal(I2C_NUM,Stop);
     SYSDelay_us(5);
     return 1;
 }


//*************************************************************************
//��飺����N���ֽ�
//DeviceAddr:�豸��ַ
//AccessAddr�����ʵ�ַ
//����ֵ��1��ʾ�ɹ���0��ʾʧ��
//*************************************************************************
uint8 I2C_RN(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 len,uint8 *data)
 {
    HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;//����Ϊ����ģʽ
     I2C_signal(I2C_NUM,Start);                 //���Ϳ�ʼ�ź�
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//�����豸��ַ
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=AccessAddr;  //���ͷ��ʵ�ַ
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0x04;//��MCUΪ����ģʽʱ��д1����һ�����¿�ʼ�ź�
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)|0x01;
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XEF;        //TX=0,MCU����Ϊ����ģʽ
     *data=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));         //����I2C D,׼���������� 
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XF7;
     if(!(I2C_wait(I2C_NUM,translate))) return 0;       //�ȴ�һ���ֽ����ݴ������
     while(len)
      {
        *data=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));         //����I2C D,׼���������� 
        if(len==1) HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X08;
        else HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XF7;
        if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
        len--;
        data++;
      } 
      I2C_signal(I2C_NUM,Stop); 
     SYSDelay_us(70);
      return 1;
 }

//*************************************************************************
//��飺��ӻ�дN���ֽ�
//DeviceAddr:�豸��ַ
//AccessAddr�����ʵ�ַ
//����ֵ��1��ʾ�ɹ���0��ʾʧ��
//*************************************************************************
uint8 I2C_WN(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 N,uint8 *data)
 {
     uint8 i;
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;        //TX=1,MCU���óɷ���ģʽ
     I2C_signal(I2C_NUM,Start);                 //���Ϳ�ʼ�ź�
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//�����豸��ַ
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=AccessAddr;  //���ͷ��ʵ�ַ
     if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
     if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
     for(i=0;i<N;i++)
      {
        HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=*data;
        if(!(I2C_wait(I2C_NUM,translate))) return 0;  //�ȴ�һ���ֽ����ݴ������
        if(!(I2C_wait(I2C_NUM,answer)))   return 0;//�ȴ��ӻ�Ӧ��
        data++; 
      }
     I2C_signal(I2C_NUM,Stop);
     SYSDelay_us(70);
     return 1;
 }

//***************************************************************************
//I2C�жϵĿ����͹ر�
//*************************************************************************
void I2CINT_Enable(uint32 I2C_NUM)
 {
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=I2C_C1_IICIE_MASK;
 }

void I2CINT_Disable(uint32 I2C_NUM)
 {
     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=~I2C_C1_IICIE_MASK;
 }