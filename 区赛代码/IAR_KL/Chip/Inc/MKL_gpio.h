/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,野火科技
 *     All rights reserved.
 *     技术讨论：野火初学论坛 http://www.chuxue123.com
 *
 *     除注明出处外，以下所有内容版权均属野火科技所有，未经允许，不得用于商业用途，
 *     修改内容时必须保留野火科技的版权声明。
 *
 * @file       MK60_gpio.h
 * @brief      gpio驱动头文件
 * @author     野火科技
 * @version    v5.0
 * @date       2013-06-26
 */
#ifndef __MK60_GPIO_H__
#define __MK60_GPIO_H__

#include "MKL_gpio_cfg.h"

/*
 * 定义管脚方向
 */
typedef enum GPIO_CFG
{
    //这里的值不能改！！！
    GPI         = 0,                                //定义管脚输入方向      GPIOx_PDDRn里，0表示输入，1表示输出
    GPO         = 1,                                //定义管脚输出方向
} GPIO_CFG;

#define HIGH  1u
#define LOW   0u

extern  GPIO_MemMapPtr      GPIOX[PTX_MAX];
#define GPIOX_BASE(PTxn)    GPIOX[PTX(PTxn)]       //GPIO模块的地址


/****************************外部使用****************************/

extern void    gpio_init  (PTXn_e, GPIO_CFG, uint8 data);    //初始化gpio
extern void    gpio_ddr   (PTXn_e, GPIO_CFG);                //设置引脚数据方向
extern void    gpio_set   (PTXn_e,           uint8 data);    //设置引脚状态
extern void    gpio_turn  (PTXn_e);                          //反转引脚状态
extern uint8   gpio_get   (PTXn_e);                          //读取引脚状态

//如下 4个 函数 的 PTxn 只能是 宏定义，不能是 变量

extern void PORT_Enable_ALL(void);

//如下  函数 的 PTxn 可以是  宏定义，也可以是 变量


//n位操作
#define GPIO_SET_NBIT(NBIT,PTxn,data)   GPIO_PDOR_REG(GPIOX_BASE(PTxn)) =   (                                                   \
                                                                                (                                               \
                                                                                    GPIO_PDOR_REG(GPIOX_BASE(PTxn))             \
                                                                                    &                                           \
                                                                                    ((uint32)( ~(((1<<NBIT)-1)<<PTn(PTxn))))    \
                                                                                )                                               \
                                                                                |   ((data)                                     \
                                                                                    &(                                          \
                                                                                        ((1<<NBIT)-1)                           \
                                                                                            <<PTn(PTxn)                         \
                                                                                     ))                                         \
                                                                            )


#define GPIO_DDR_NBIT(NBIT,PTxn,ddr)   GPIO_PDDR_REG(GPIOX_BASE(PTxn))  =   (                                                   \
                                                                                (                                               \
                                                                                    GPIO_PDDR_REG(GPIOX_BASE(PTxn))             \
                                                                                    &                                           \
                                                                                    ((uint32)( ~(((1<<NBIT)-1)<<PTn(PTxn))))    \
                                                                                )                                               \
                                                                                |   ((ddr)                                      \
                                                                                    &(                                          \
                                                                                        ((1<<NBIT)-1)                           \
                                                                                        <<PTn(PTxn)                             \
                                                                                    ))                                          \
                                                                            )

#define GPIO_T_NBIT(NBIT,PTxn,data)   GPIO_PTOR_REG(GPIOX_BASE(PTxn))  =   (                                                    \
                                                                                (                                               \
                                                                                    GPIO_PTOR_REG(GPIOX_BASE(PTxn))             \
                                                                                    &                                           \
                                                                                    ((uint32)( ~(((1<<NBIT)-1)<<PTn(PTxn))))    \
                                                                                )                                               \
                                                                                |   ((data)                                     \
                                                                                    &(                                          \
                                                                                        ((1<<NBIT)-1)                           \
                                                                                        <<PTn(PTxn)                             \
                                                                                    ))                                          \
                                                                            )


#define GPIO_GET_NBIT(NBIT,PTxn)    (( GPIO_PDIR_REG(GPIOX_BASE(PTxn))>>PTn(PTxn) ) & ((1<<NBIT)-1))



//****GPIO端口中断要使能时钟，不需要使能输入
#define PORT_BASE 0X40049000
#define PORT_ISFR 0X400490A0
#define GPIO_PDDR_BASE 0X400FF014
#define GPIO_PDOR_BASE 0X400FF000
#define GPIO_PDIR_BASE 0X400FF010
#define GPIO_PTOR_BASE 0x400ff00c
#define PULL_UP 1
#define PULL_DOWN 0
#define PORTA 0
#define PORTB 1
#define PORTC 2
#define PORTD 3
#define PORTE 4
#define PORTF 5
#define INPUT 0
#define OUTPUT 1
//中断方式
#define DMA_RISING          0x1
#define DMA_FALLING         0x2
#define DMA_EITHER          0x3
#define LEVEL_LOW           0x8
#define LEVEL_RISING        0x9
#define LEVEL_FALLING       0xa
#define LEVEL_EITHER        0xb
#define LEVEL_HIGH          0xc


void GPIO_Enable(uint32 port,uint32 pin);
void GPIO_Disable(uint32 port,uint32 pin);

//*******************************************************
//函数名称：void GPIO_INIT(port,pin,dir)
//简介：初始化端口，设定方向
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//*******************************************************
void GPIO_INIT(uint32 port,uint32 pin,uint32 dir);

//*******************************************************
//函数名称：void GPIO_SET(port,pin,date)
//简介：设定端口输出电平，首先要初始化设置输出
//参数：port端口：PORTA---PORTF
//      pin引脚：用与的形式
//      date:高低电平 
//********************************************************
void GPIO_SET(uint32 port,uint32 pin,uint32 date);

//*******************************************************
//函数名称：uint32 GPIO_GET(port,pin)
//简介：设定端口输出电平，首先要初始化设置
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//返回值：引脚状态,默认为高电平，返回1
//********************************************************
uint32 GPIO_GET(uint32 port,uint32 pin);

//*******************************************************
//函数名称：void GPIO_OPPSITE(port,pin)
//简介：设定端口输出电平，首先要初始化设置输出
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//********************************************************
void GPIO_OPPSITE(uint32 port , uint32 pin);


//***********************************************************
//函数名称：void GPIO_DSE(uint32 port,uint32 pin)
//简介：设定驱动强度，用此函数数，驱动为high drive
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//***********************************************************
void GPIO_DSE(uint32 port ,uint32 pin);

   //***********************************************************
//函数名称：void GPIO_PFE(uint32 port,uint32 pin)
//简介：设定为Passive Filter
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//***********************************************************
void GPIO_PFE(uint32 port,uint32 pin);
  //***********************************************************
//函数名称：void GPIO_PFE(uint32 port,uint32 pin)
//简介：设定为low slew rate
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//***********************************************************
void GPIO_SER(uint32 port,uint32 pin);

//*************************************************************
//函数名称：void GPIOPULL_Enable(uint32 port,uint32 pin)
//简介：设定为使能上下拉
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//***********************************************************
void GPIOPULL_Enable(uint32 port,uint32 pin);
//*************************************************************
//函数名称：void GPIOPULL_Disable(uint32 port,uint32 pin)
//简介：设定为去使能上下拉
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//***********************************************************
void GPIOPULL_Disable(uint32 port,uint32 pin);


//*************************************************************
//函数名称：void GPIOPULL_SET(uint32 port,uint32 pin,uint32 state)
//简介：设定上下拉
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//      state:PULL_UP,PULL_DOWN
//***********************************************************
void GPIOPULL_SET(uint32 port ,uint32 pin,uint32 state);



//*************************************************************************
//函数名称：GPIOINT_Eable(port,pin)
//简介：使能端口中断
//参数：port:PORTA-PORTF
//      pin:0-31
//      mode:端口模式：
//*************************************************************************
void GPIOINT_Enable(uint32 port,uint32 pin,uint32 mode);

//*************************************************************************
//函数名称：GPIOINT_Disable(port,pin)
//简介：去使能端口中断
//参数：port:PORTA-PORTF
//      pin:0-31
//*************************************************************************
void GPIOINT_Disable(uint32 port,uint32 pin);

//*************************************************************************
//函数名：void GPIOINT_Clear(uint32 PORT)
//清楚中断标志
//*************************************************************************
void GPIOINT_Clear(uint32 PORT);
#endif      //__MK60_GPIO_H__
