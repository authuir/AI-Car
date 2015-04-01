#ifndef __PIT_H__
#define __PIT_H__
//PIT�õ�  bus clock
#define PIT0 0
#define PIT1 1
#define PIT2 2
#define PIT3 3
#define PIT_LDVAL_BASE 0X40037100
#define PIT_CVAL_BASE  0x40037104
#define PIT_TCTRL_BASE 0X40037108
#define PIT_TFLG_BASE  0X4003710C
#define DEBUG_CONTINUE 0
#define DEBUG_STOP     1
#define PIT_CLOCK_Enable SIM_SCGC6|=SIM_SCGC6_PIT_MASK;//ʹ��PITģ��

//*********************************************************************
//��������void PIT_INIT(uint32 PIT_NUM,uint32 TIMEOUT,uint32 WAY_DEBUG)
//������PIT_NUM��PIT0~3
//      TIMEOUT:װ��ֵ
//      WAY_DEBUG��ʱ���Ƿ���DEBUG�����У�DEBUG_CONTINUE,DEBUG_STOP
//*********************************************************************
void PIT_INIT(uint32 PIT_NUM,uint32 TIMEOUT,uint32 WAY_DEBUG);


//*********************************************************************
//��������void PIT_Enable(uint32 PIT_NUM)
//������PIT_NUM��PIT0~3
//��飺�򿪶�ʱ����ʼ����
//*********************************************************************
void PIT_Enable(uint32 PIT_NUM);

//*********************************************************************
//��������void PIT_Disable(uint32 PIT_NUM)
//������PIT_NUM��PIT0~3
//��飺�رն�ʱ����ʼ����
//*********************************************************************
void PIT_Disable(uint32 PIT_NUM);


//******************************************************************
//��������uint32 PIT_Read(uint32 PIT_NUM)
//��飺��ȡ��ǰ��ʱ����ֵ
//************************************************************
uint32 PIT_Read(uint32 PIT_NUM);
//*********************************************************************
//��������void PIT_Reload(uint32 PIT_NUM,uint32 TIMEOUT)
//��飺����װ��PIT��ֵ
//*******************************************************************
void PIT_Reload(uint32 PIT_NUM,uint32 TIMEOUT);


//PIT�ж�ʹ�ܺ���
void PITINT_Enable(uint32 PIT_NUM);

//PITPIT�ж�ȥʹ�ܺ���
void PITINT_Disable(uint32 PIT_NUM);

//PIT�жϱ�־���
void PITINT_Clear(uint32 PIT_NUM);

#endif