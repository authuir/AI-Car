#ifndef __PIT_H__
#define __PIT_H__
//PIT用的  bus clock
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
#define PIT_CLOCK_Enable SIM_SCGC6|=SIM_SCGC6_PIT_MASK;//使能PIT模块

//*********************************************************************
//函数名：void PIT_INIT(uint32 PIT_NUM,uint32 TIMEOUT,uint32 WAY_DEBUG)
//参数：PIT_NUM：PIT0~3
//      TIMEOUT:装载值
//      WAY_DEBUG：时钟是否在DEBUG下运行，DEBUG_CONTINUE,DEBUG_STOP
//*********************************************************************
void PIT_INIT(uint32 PIT_NUM,uint32 TIMEOUT,uint32 WAY_DEBUG);


//*********************************************************************
//函数名：void PIT_Enable(uint32 PIT_NUM)
//参数：PIT_NUM：PIT0~3
//简介：打开定时器开始工作
//*********************************************************************
void PIT_Enable(uint32 PIT_NUM);

//*********************************************************************
//函数名：void PIT_Disable(uint32 PIT_NUM)
//参数：PIT_NUM：PIT0~3
//简介：关闭定时器开始工作
//*********************************************************************
void PIT_Disable(uint32 PIT_NUM);


//******************************************************************
//函数名：uint32 PIT_Read(uint32 PIT_NUM)
//简介：读取当前计时器的值
//************************************************************
uint32 PIT_Read(uint32 PIT_NUM);
//*********************************************************************
//函数名：void PIT_Reload(uint32 PIT_NUM,uint32 TIMEOUT)
//简介：重新装载PIT的值
//*******************************************************************
void PIT_Reload(uint32 PIT_NUM,uint32 TIMEOUT);


//PIT中断使能函数
void PITINT_Enable(uint32 PIT_NUM);

//PITPIT中断去使能函数
void PITINT_Disable(uint32 PIT_NUM);

//PIT中断标志清除
void PITINT_Clear(uint32 PIT_NUM);

#endif