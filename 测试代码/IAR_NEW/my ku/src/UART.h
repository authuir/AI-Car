#ifndef __UART_H__
#define __UART_H__

#define UART0 0
#define UART1 1
#define UART2 2
#define UART3 3
#define UART4 128
#define UART5 129

#define UART_C1_BASE        0X4006A002
#define UART_C2_BASE        0X4006A003
#define UART_C3_BASE        0X4006A006
#define UART_C4_BASE        0X4006A00A
#define UART_BDH_BASE       0X4006A000
#define UART_BDL_BASE       0X4006A001
#define UART_S1_BASE        0X4006A004
#define UART_D_BASE         0X4006A007
//FIFO�Ĵ�����UART0��1����8��FIFO����ڣ�����Ϊ1��
#define UART_PFIFO_BASE     0X4006A010
#define UART_CFIFO_BASE     0X4006A011
#define UART_SFIFO_BASE     0X4006A012
#define UART_TWFIFO_BASE    0X4006A013
#define UART_TCFIFO_BASE    0X4006A014
#define UART_RWFIFO_BASE    0X4006A015
#define UART_RCFIFO_BASE    0X4006A016
#define TX_clear            0x80
#define RX_clear            0x40
//UART���Ŷ��壺
//UART0:
#define PORTD_6_7      0//???
#define PORTB_16_17    1
#define PORTA_14_15    2
#define PORTA_1_2      13
//UART1:
#define PORTE_0_1      3 
#define PORTC_3_4      4
//UART2:
#define PORTD_2_3      5//???
//UART3:
#define PORTE_4_5      6
#define PORTB_10_11    7
#define PORTC_16_17    8
//UART4:
#define PORTE_24_25    9
#define PORTC_14_15    10
//UART5:
#define PORTE_8_9      11
#define PORTD_8_9      12

//�ж�ʹ��λ����
#define ILIE 4
#define RIE  5
#define TCIE 6
#define TIE  7
#define PEIE 0
#define FEIE 1
#define NEIE 2
#define ORIE 3


#define FIFO_BIT 8
//**********************
#define pose_power  0
#define pose_pitch  1
#define pose_roll   2
#define pose_yaw    3
//**********************
//******************************************************************
//��������void GPIOType_UART(uint32 PORT_R_T)
//��飺����UART����
//��������,.H�����ж���
//******************************************************************
void GPIOType_UART(uint32 PORT_R_T);

//******************************************************************************
//�������ƣ�void  UART_INIT(uint32 UART_NUM,uint32 SYS_CLOCK,uint32 BAUD)
//��飺UART��ʼ������
//������UART_NUM   ��UART0-5
//      SYS_CLOCK:ϵͳʱ��
//      BAUD:�趨������       //�����
//*******************************************************************************
void  UART_INIT(uint32 UART_NUM,uint32 BUS_CLOCK,uint32 BAUD);


//******************************************************************************
//��������uint8 UART_RE1(uint32 UART_NUM,uint *fp)
//��飺����һ������
//������UART_NUM:0-5
//      fp:�ж��Ƿ��յ�����  1��ʾ�ɹ���0��ʾʧ��
//*****************************************************************************
uint8 UART_R1(uint32 UART_NUM,uint8 *fp);

//***********************************************************************************\
//�������ƣ�uint8 UART_S1(uint32 UART_NUM,uint8 ch)
//��飺����һ���ֽ�
//������UART_NUM:UART0~5
//      ch:�ֽ�
//����ֵ��1��ʾ���ͳɹ���0��ʾʧ��
//***********************************************************************************
uint8 UART_S1(uint32 UART_NUM,uint8 ch);


//****************************************************************************
//��������uint8 UART_RN(uint32 UART_NUM,uint32 lenth,uint8* date) 
//��飺����N���ֽ�
//������UART_NUM  0~5
//      lenth:�ַ�������
//      date:������������      
//****************************************************************************
uint8 UART_RN(uint32 UART_NUM,uint32 lenth,uint8* date);

//****************************************************************************
//��������uint8 UART_SN(uint32 UART_NUM,uint32 lenth,uint8* date) 
//��飺����N���ֽ�
//������UART_NUM  0~5
//      lenth:�ַ�������
//      date:������������    
//����ֵ��1�ɹ���0ʧ��
//****************************************************************************
uint8 UART_SN(uint32 UART_NUM,uint32 lenth,uint8* date);

//*************************************************************************
//�������ƣ�uint8 UART_SS(uint32 UART_NUM,void *buff)
//��飺����һ���ַ���
//������NART_NUM0~5,   "STRING"
//************************************************************************
uint8 UART_SS(uint32 UART_NUM,void *buff);

//*************************************************************
//��������void UARTINT_Enable(uint32 UART_NUM,uint32 INT_CLASS)
//��飺ʹ���жϵ�����
//������UART_NUM0~5  
//      INT_CLASS:ILIE��RIE��TCIE��TIE��PEIE��FEIE��NEIE��ORIE
//˵�������жϴ򿪺󣬱�����Enable_IRQ()�򿪶�Ӧ�����Ųſ�ʹ��
//*************************************************************
void UARTINT_Enable(uint32 UART_NUM,uint32 INT_CLASS);

//***************************************************************
//ͬ  UARTINT_Enable,�رն�Ӧ�ж�
//**************************************************************
void UARTINT_Disable(uint32 UART_NUM,uint32 INT_CLASS);

//***************************************************************
//�������ܣ�ʹ��FIFO����  K60  UART0��UART1���Ϊ8������Ϊ1
//��ʼ�����Ĺ���,���书����ʱ������,bit��ʾһ�δ����������
//***************************************************************
void UART_FIFO_read_init(uint32 UART_NUM);
void UART_FIFO_Read_value(uint32 UART_NUM,uint8* date);

//***************************************************************
//��ȡ��ǰ��������ʣ���TX,RX��ֵ
//***************************************************************
void UART_CountRead(uint32 UART_NUM,uint8* TX_count,uint8* RX_count);
//***************************************************************

#endif