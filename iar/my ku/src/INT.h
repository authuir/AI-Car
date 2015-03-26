#ifndef __INT_H__
#define __INT_H__
#include "INT.h"
//�ж�ʹ�÷�����
//      DisableInterrupts
//      Enable_IRQ();    �ж������Ų�MK60F15.H,��Ӧ��
//        {INI_Enable();}     ʹ��ĳ�ж��жϷ��񣬱���GPIOINT_Enable()
//       ��main������д������ڣ���start_up.s�еĺ�����
//      EnableInterrupts



//********************************************************
//��������void Enable_IRQ(int IRQ_NUM)
//������IRQ_NUM,�ж�������
//��飺ʹ��ĳһ�ж�
//********************************************************
void Enable_IRQ(int IRQ_NUM);

//********************************************************
//��������void Disable_IRQ(int IRQ_NUM)
//������IRQ_NUM,�ж�������
//��飺ȥ��ʹ��ĳһ�ж�
//********************************************************
void Disable_IRQ(int IRQ_NUM);

//******************************************************************
//�������ƣ�void SET_IRQ_PRIOR(INT IRQ_NUM,INT IRQ_PRIOR);
//������IRQ_NUM�ж�������    IRQ_PRIOR:���ȼ��趨  0-16
//******************************************************************
void SET_IRQ_PRIOR(int IRQ_NUM,int IRQ_PRIOR);






#endif