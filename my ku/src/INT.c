#include "all.h"
//********************************************************
//函数名：void Enable_IRQ(int IRQ_NUM)
//参数：IRQ_NUM,中断向量号
//简介：使能某一中断
//********************************************************
void Enable_IRQ(int IRQ_NUM)
 {
    int DIV;
    if(IRQ_NUM>121) IRQ_NUM=121;//确定IRQ号是否有效
    DIV=(IRQ_NUM-16)/32;//确定NVIC中断控制寄存器组号（0，1，2，3）
    switch(DIV)
     {
         case 0:{
         NVICICPR0=1<<((IRQ_NUM-16)%32);//设置中断挂起清除寄存器
         NVICISER0=1<<((IRQ_NUM-16)%32);//置位中断使能设置寄存器
         break;
     }
     case 1:{
         NVICICPR1=1<<((IRQ_NUM-16)%32);//设置中断挂起清除寄存器
         NVICISER1=1<<((IRQ_NUM-16)%32);//置位中断使能设置寄存器
         break;
     }
     case 2:{
         NVICICPR2=1<<((IRQ_NUM-16)%32);//设置中断挂起清除寄存器
         NVICISER2=1<<((IRQ_NUM-16)%32);//置位中断使能设置寄存器
         break;
     }
     case 0x3:{
         NVICICPR3=1<<((IRQ_NUM-16)%32);//设置中断挂起清除寄存器
         NVICISER3=1<<((IRQ_NUM-16)%32);//置位中断使能设置寄存器
         break;
     }
     }
 }

//********************************************************
//函数名：void Disable_IRQ(int IRQ_NUM)
//参数：IRQ_NUM,中断向量号
//简介：去掉使能某一中断
//********************************************************
void Disable_IRQ(int IRQ_NUM)
 {
    int DIV;
    if(IRQ_NUM>121) IRQ_NUM=121;//确定IRQ号是否有效
    DIV=(IRQ_NUM-16)/32;
    switch(DIV)
     {
     case 0x0:
            NVICICER0=1<<((IRQ_NUM-16)%32);//置位中断使能清除寄存器
            break;
     case 0x1:
            NVICICER1=1<<((IRQ_NUM-16)%32);//置位中断使能清除寄存器
            break;
     case 0x2:
            NVICICER2=1<<((IRQ_NUM-16)%32);//置位中断使能清除寄存器
            break;
     case 0x3:
            NVICICER3=1<<((IRQ_NUM-16)%32);//置位中断使能清除寄存器
            break;
     }
 }

//******************************************************************
//函数名称：void SET_IRQ_PRIOR(INT IRQ_NUM,INT IRQ_PRIOR);
//参数：IRQ_NUM中断向量号    IRQ_PRIOR:优先级设定  0-16
//******************************************************************
void SET_IRQ_PRIOR(int IRQ_NUM,int IRQ_PRIOR)
 {
    uint32 *prio_reg;//设定IRQ优先级指针
     if(IRQ_NUM>121) IRQ_NUM=121;//确定IRQ号是否有效
     if(IRQ_PRIOR>15) IRQ_PRIOR=15;//确定优先级是否在范围内，共16个优先级
     prio_reg=(uint32 *)(((uint32)&NVICIP0)+4*((IRQ_NUM-16)/4));//设置IRQ对应的NVICX
     *prio_reg=((IRQ_PRIOR&0X0F)<<(8*((IRQ_NUM-16)%4)+4));
 }









