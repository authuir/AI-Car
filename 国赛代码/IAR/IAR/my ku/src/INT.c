#include "all.h"
//********************************************************
//��������void Enable_IRQ(int IRQ_NUM)
//������IRQ_NUM,�ж�������
//��飺ʹ��ĳһ�ж�
//********************************************************
void Enable_IRQ(int IRQ_NUM)
 {
    int DIV;
    if(IRQ_NUM>121) IRQ_NUM=121;//ȷ��IRQ���Ƿ���Ч
    DIV=(IRQ_NUM-16)/32;//ȷ��NVIC�жϿ��ƼĴ�����ţ�0��1��2��3��
    switch(DIV)
     {
         case 0:{
         NVICICPR0=1<<((IRQ_NUM-16)%32);//�����жϹ�������Ĵ���
         NVICISER0=1<<((IRQ_NUM-16)%32);//��λ�ж�ʹ�����üĴ���
         break;
     }
     case 1:{
         NVICICPR1=1<<((IRQ_NUM-16)%32);//�����жϹ�������Ĵ���
         NVICISER1=1<<((IRQ_NUM-16)%32);//��λ�ж�ʹ�����üĴ���
         break;
     }
     case 2:{
         NVICICPR2=1<<((IRQ_NUM-16)%32);//�����жϹ�������Ĵ���
         NVICISER2=1<<((IRQ_NUM-16)%32);//��λ�ж�ʹ�����üĴ���
         break;
     }
     case 0x3:{
         NVICICPR3=1<<((IRQ_NUM-16)%32);//�����жϹ�������Ĵ���
         NVICISER3=1<<((IRQ_NUM-16)%32);//��λ�ж�ʹ�����üĴ���
         break;
     }
     }
 }

//********************************************************
//��������void Disable_IRQ(int IRQ_NUM)
//������IRQ_NUM,�ж�������
//��飺ȥ��ʹ��ĳһ�ж�
//********************************************************
void Disable_IRQ(int IRQ_NUM)
 {
    int DIV;
    if(IRQ_NUM>121) IRQ_NUM=121;//ȷ��IRQ���Ƿ���Ч
    DIV=(IRQ_NUM-16)/32;
    switch(DIV)
     {
     case 0x0:
            NVICICER0=1<<((IRQ_NUM-16)%32);//��λ�ж�ʹ������Ĵ���
            break;
     case 0x1:
            NVICICER1=1<<((IRQ_NUM-16)%32);//��λ�ж�ʹ������Ĵ���
            break;
     case 0x2:
            NVICICER2=1<<((IRQ_NUM-16)%32);//��λ�ж�ʹ������Ĵ���
            break;
     case 0x3:
            NVICICER3=1<<((IRQ_NUM-16)%32);//��λ�ж�ʹ������Ĵ���
            break;
     }
 }

//******************************************************************
//�������ƣ�void SET_IRQ_PRIOR(INT IRQ_NUM,INT IRQ_PRIOR);
//������IRQ_NUM�ж�������    IRQ_PRIOR:���ȼ��趨  0-16
//******************************************************************
void SET_IRQ_PRIOR(int IRQ_NUM,int IRQ_PRIOR)
 {
    uint32 *prio_reg;//�趨IRQ���ȼ�ָ��
     if(IRQ_NUM>121) IRQ_NUM=121;//ȷ��IRQ���Ƿ���Ч
     if(IRQ_PRIOR>15) IRQ_PRIOR=15;//ȷ�����ȼ��Ƿ��ڷ�Χ�ڣ���16�����ȼ�
     prio_reg=(uint32 *)(((uint32)&NVICIP0)+4*((IRQ_NUM-16)/4));//����IRQ��Ӧ��NVICX
     *prio_reg=((IRQ_PRIOR&0X0F)<<(8*((IRQ_NUM-16)%4)+4));
 }









