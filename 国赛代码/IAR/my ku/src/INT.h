#ifndef __INT_H__
#define __INT_H__
#include "INT.h"
//中断使用方法：
//      DisableInterrupts
//      Enable_IRQ();    中断向量号查MK60F15.H,对应号
//        {INI_Enable();}     使能某中断中断服务，比如GPIOINT_Enable()
//       在main函数中写函数入口，查start_up.s中的函数名
//      EnableInterrupts



//********************************************************
//函数名：void Enable_IRQ(int IRQ_NUM)
//参数：IRQ_NUM,中断向量号
//简介：使能某一中断
//********************************************************
void Enable_IRQ(int IRQ_NUM);

//********************************************************
//函数名：void Disable_IRQ(int IRQ_NUM)
//参数：IRQ_NUM,中断向量号
//简介：去掉使能某一中断
//********************************************************
void Disable_IRQ(int IRQ_NUM);

//******************************************************************
//函数名称：void SET_IRQ_PRIOR(INT IRQ_NUM,INT IRQ_PRIOR);
//参数：IRQ_NUM中断向量号    IRQ_PRIOR:优先级设定  0-16
//******************************************************************
void SET_IRQ_PRIOR(int IRQ_NUM,int IRQ_PRIOR);






#endif