#include "all.h"
//*********************************************************************
//函数名：void PIT_INIT(uint32 PIT_NUM,uint32 TIMEOUT,uint32 WAY_DEBUG)
//参数：PIT_NUM：PIT0~3
//      TIMEOUT:装载值
//      WAY_DEBUG：时钟是否在DEBUG下运行，DEBUG_CONTINUE,DEBUG_STOP
//*********************************************************************
void PIT_INIT(uint32 PIT_NUM,uint32 TIMEOUT,uint32 WAY_DEBUG)
 {
     PIT_MCR&=~PIT_MCR_MDIS_MASK;
     PIT_MCR|=WAY_DEBUG;
     HWREG(PIT_LDVAL_BASE+PIT_NUM*(0X10))=TIMEOUT/2;
 }
//*********************************************************************
//函数名：void PIT_Enable(uint32 PIT_NUM)
//参数：PIT_NUM：PIT0~3
//简介：打开定时器开始工作
//*********************************************************************
void PIT_Enable(uint32 PIT_NUM)
 {
     HWREG(PIT_TCTRL_BASE +PIT_NUM*(0X10))|=PIT_TCTRL_TEN_MASK;
 }
//*********************************************************************
//函数名：void PIT_Disable(uint32 PIT_NUM)
//参数：PIT_NUM：PIT0~3
//简介：关闭定时器开始工作
//*********************************************************************
void PIT_Disable(uint32 PIT_NUM)
 {
     HWREG(PIT_TCTRL_BASE+PIT_NUM*(0X10))&=~PIT_TCTRL_TEN_MASK;
 }

//******************************************************************
//函数名：uint32 PIT_Read(uint32 PIT_NUM)
//简介：读取当前计时器的值
//************************************************************
uint32 PIT_Read(uint32 PIT_NUM)
 {
     return (uint32)HWREG(PIT_CVAL_BASE+PIT_NUM*(0X10));
 }
//*********************************************************************
//函数名：void PIT_Reload(uint32 PIT_NUM,uint32 TIMEOUT)
//简介：重新装载PIT的值
//*******************************************************************
void PIT_Reload(uint32 PIT_NUM,uint32 TIMEOUT)
 {
     PIT_Disable(PIT_NUM);
     HWREG(PIT_LDVAL_BASE+PIT_NUM*(0X10))=TIMEOUT/2;
     PIT_Enable(PIT_NUM);
 }


//PIT中断使能函数
void PITINT_Enable(uint32 PIT_NUM)
 {
     HWREG(PIT_TCTRL_BASE+PIT_NUM*(0X10))|=PIT_TCTRL_TIE_MASK;
 }
//PITPIT中断去使能函数
void PITINT_Disable(uint32 PIT_NUM)
 {
     HWREG(PIT_TCTRL_BASE+PIT_NUM*(0X10))&=~PIT_TCTRL_TIE_MASK;
 }
//PIT中断标志清除
void PITINT_Clear(uint32 PIT_NUM)
 {
     HWREG(PIT_TFLG_BASE+PIT_NUM*(0X10))|=PIT_TFLG_TIF_MASK;
 }









