#include "all.h"
//*********************************************************************
//��������void PIT_INIT(uint32 PIT_NUM,uint32 TIMEOUT,uint32 WAY_DEBUG)
//������PIT_NUM��PIT0~3
//      TIMEOUT:װ��ֵ
//      WAY_DEBUG��ʱ���Ƿ���DEBUG�����У�DEBUG_CONTINUE,DEBUG_STOP
//*********************************************************************
void PIT_INIT(uint32 PIT_NUM,uint32 TIMEOUT,uint32 WAY_DEBUG)
 {
     PIT_MCR&=~PIT_MCR_MDIS_MASK;
     PIT_MCR|=WAY_DEBUG;
     HWREG(PIT_LDVAL_BASE+PIT_NUM*(0X10))=TIMEOUT/2;
 }
//*********************************************************************
//��������void PIT_Enable(uint32 PIT_NUM)
//������PIT_NUM��PIT0~3
//��飺�򿪶�ʱ����ʼ����
//*********************************************************************
void PIT_Enable(uint32 PIT_NUM)
 {
     HWREG(PIT_TCTRL_BASE +PIT_NUM*(0X10))|=PIT_TCTRL_TEN_MASK;
 }
//*********************************************************************
//��������void PIT_Disable(uint32 PIT_NUM)
//������PIT_NUM��PIT0~3
//��飺�رն�ʱ����ʼ����
//*********************************************************************
void PIT_Disable(uint32 PIT_NUM)
 {
     HWREG(PIT_TCTRL_BASE+PIT_NUM*(0X10))&=~PIT_TCTRL_TEN_MASK;
 }

//******************************************************************
//��������uint32 PIT_Read(uint32 PIT_NUM)
//��飺��ȡ��ǰ��ʱ����ֵ
//************************************************************
uint32 PIT_Read(uint32 PIT_NUM)
 {
     return (uint32)HWREG(PIT_CVAL_BASE+PIT_NUM*(0X10));
 }
//*********************************************************************
//��������void PIT_Reload(uint32 PIT_NUM,uint32 TIMEOUT)
//��飺����װ��PIT��ֵ
//*******************************************************************
void PIT_Reload(uint32 PIT_NUM,uint32 TIMEOUT)
 {
     PIT_Disable(PIT_NUM);
     HWREG(PIT_LDVAL_BASE+PIT_NUM*(0X10))=TIMEOUT/2;
     PIT_Enable(PIT_NUM);
 }


//PIT�ж�ʹ�ܺ���
void PITINT_Enable(uint32 PIT_NUM)
 {
     HWREG(PIT_TCTRL_BASE+PIT_NUM*(0X10))|=PIT_TCTRL_TIE_MASK;
 }
//PITPIT�ж�ȥʹ�ܺ���
void PITINT_Disable(uint32 PIT_NUM)
 {
     HWREG(PIT_TCTRL_BASE+PIT_NUM*(0X10))&=~PIT_TCTRL_TIE_MASK;
 }
//PIT�жϱ�־���
void PITINT_Clear(uint32 PIT_NUM)
 {
     HWREG(PIT_TFLG_BASE+PIT_NUM*(0X10))|=PIT_TFLG_TIF_MASK;
 }









