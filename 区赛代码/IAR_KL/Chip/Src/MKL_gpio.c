/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,野火科技
 *     All rights reserved.
 *     技术讨论：野火初学论坛 http://www.chuxue123.com
 *
 *     除注明出处外，以下所有内容版权均属野火科技所有，未经允许，不得用于商业用途，
 *     修改内容时必须保留野火科技的版权声明。
 *
 * @file       MKL_gpio.c
 * @brief      gpio驱动函数
 * @author     野火科技
 * @version    v5.0
 * @date       2013-06-26
 */

/*
 * 包含头文件
 */
#include "common.h"
#include "MKL_port.h"
#include "MKL_gpio.h"


/*
 * 定义数组
 */
#if 1   //两种 GPIO 操作 方法 ，第一个 是 快速IO ，第二个是 普通IO
GPIO_MemMapPtr GPIOX[PTX_MAX] = {(GPIO_MemMapPtr)FPTA_BASE_PTR, (GPIO_MemMapPtr)FPTB_BASE_PTR, (GPIO_MemMapPtr)FPTC_BASE_PTR, (GPIO_MemMapPtr)FPTD_BASE_PTR, (GPIO_MemMapPtr)FPTE_BASE_PTR}; //定义五个指针数组保存 GPIOX 的地址
#else
GPIO_MemMapPtr GPIOX[PTX_MAX] = {PTA_BASE_PTR,PTB_BASE_PTR,PTC_BASE_PTR, PTD_BASE_PTR, PTE_BASE_PTR}; //定义五个指针数组保存 GPIOX 的地址

#endif


/*!
 *  @brief      初始化gpio
 *  @param      PTxn    端口
 *  @param      cfg     引脚方向,0=输入,1=输出
 *  @param      data    输出初始状态,0=低电平,1=高电平 （对输入无效）
 *  @since      v5.0
 *  Sample usage:       gpio_init (PTA8, GPI,0);    //初始化 PTA8 管脚为输入
 */
void gpio_init (PTXn_e ptxn, GPIO_CFG cfg, uint8 data)
{


    //端口方向控制输入还是输出
    if(  cfg == GPI )
    {
        //设置端口方向为输入
        GPIO_PDDR_REG(GPIOX_BASE(ptxn)) &= ~(1 << PTn(ptxn));       // GPIO PDDR 管脚号 清0，即对应管脚配置为端口方向输入
    }
    else
    {
        //设置端口方向为输出
        GPIO_PDDR_REG(GPIOX_BASE(ptxn)) |= (1 << PTn(ptxn));        // GPIO PDDR 管脚号 置1，即对应管脚配置为端口方向输出

        //端口输出数据
        if(data == 0)
        {
            GPIO_PDOR_REG(GPIOX_BASE(ptxn)) &= ~(1 << PTn(ptxn));   // GPIO PDOR 管脚号 清0，即对应管脚配置为端口输出低电平
        }
        else
        {
            GPIO_PDOR_REG(GPIOX_BASE(ptxn))  |= (1 << PTn(ptxn));   // GPIO PDOR 管脚号 置1，即对应管脚配置为端口输出高电平
        }
    }

    //复用管脚为GPIO功能
    port_init( ptxn, ALT1);
}

/*!
 *  @brief      设置引脚数据方向
 *  @param      PTxn    端口
 *  @param      cfg     引脚方向,0=输入,1=输出
 *  @since      v5.0
 *  Sample usage:       gpio_ddr (PTA8, GPI);    //设置 PTA8 管脚为输入
 */
void    gpio_ddr   (PTXn_e ptxn, GPIO_CFG cfg)
{
    //端口方向控制输入还是输出
    if(  cfg == GPI )
    {
        //设置端口方向为输入
        GPIO_PDDR_REG(GPIOX_BASE(ptxn)) &= ~(1 << PTn(ptxn));           // GPIO PDDR 管脚号 清0，即对应管脚配置为端口方向输入
    }
    else
    {
        //设置端口方向为输出
        GPIO_PDDR_REG(GPIOX_BASE(ptxn)) |= (1 << PTn(ptxn));            // GPIO PDDR 管脚号 置1，即对应管脚配置为端口方向输出
    }
}

/*!
 *  @brief      设置引脚状态
 *  @param      PTxn    端口
 *  @param      data    输出初始状态,0=低电平,1=高电平 （对输入无效）
 *  @since      v5.0
 *  @warning    务必保证数据方向为输出（DEBUG模式下，有断言进行检测）
 *  Sample usage:       gpio_set (PTA8, 1);    // PTA8 管脚 输出 1
 */
void gpio_set (PTXn_e ptxn, uint8 data)
{
    ASSERT( BIT_GET( GPIO_PDDR_REG(GPIOX_BASE(ptxn)) , PTn(ptxn)) == GPO ); // 断言，检测 输出方向是否为输出
                                                                            // 获取 GPIO PDDR 管脚号 ，比较是否为输出

    //端口输出数据
    if(data == 0)
    {
        GPIO_PDOR_REG(GPIOX_BASE(ptxn)) &= ~(1 << PTn(ptxn));   // GPIO PDOR 管脚号 清0，即对应管脚配置为端口输出低电平
    }
    else
    {
        GPIO_PDOR_REG(GPIOX_BASE(ptxn))  |= (1 << PTn(ptxn));   // GPIO PDOR 管脚号 置1，即对应管脚配置为端口输出高电平
    }
}


/*!
 *  @brief      反转引脚状态
 *  @param      PTxn    端口
 *  @since      v5.0
 *  @warning    务必保证数据方向为输出（DEBUG模式下，有断言进行检测）
 *  Sample usage:       gpio_turn (PTA8);    // PTA8 管脚 输出 反转
 */
void gpio_turn (PTXn_e ptxn)
{
    ASSERT( BIT_GET( GPIO_PDDR_REG(GPIOX_BASE(ptxn)) , PTn(ptxn)) == GPO ); // 断言，检测 输出方向是否为输出
                                                                            // 获取 GPIO PDDR 管脚号 ，比较是否为输出

    GPIO_PTOR_REG( GPIOX_BASE(ptxn))  =  1 << (PTn(ptxn ));                 // GPIO PTOR ptxn 置1，其他清0 ，即对应管脚配置为端口输出反转，其他位不变
                                                                            // 此处不能用 BIT_SET 这个宏来置1 ，因为必须保证其他位 不变，其他位直接清0即可
}

/*!
 *  @brief      读取引脚输入状态
 *  @param      PTxn    端口
 *  @return     管脚的状态，1为高电平，0为低电平
 *  @since      v5.0
 *  @warning    务必保证数据方向为输入（DEBUG模式下，有断言进行检测）
 *  Sample usage:       uint8 pta8_data = gpio_get (PTA8);    // 获取 PTA8 管脚 输入电平
 */
uint8 gpio_get(PTXn_e ptxn)
{
    ASSERT( BIT_GET( GPIO_PDDR_REG(GPIOX_BASE(ptxn)) , PTn(ptxn)) == GPI ); // 断言，检测 输出方向是否为输入
                                                                            // 获取 GPIO PDDR 管脚号 ，比较是否为输入

    return ((GPIO_PDIR_REG(GPIOX_BASE(ptxn)) >> PTn(ptxn )) & 0x01);        // 获取 GPIO PDIR ptxn 状态，即读取管脚输入电平
}





//自己的库
///**********************************************
//函数名称：void GPIO_Enable(port,pin)
//简介：GPIO使能
//参数：port端口：PORTA,PORTB,PORTC.~PORTF
//      pin引脚：0-31
//**********************************************
void GPIO_Enable(uint32 port,uint32 pin)
 {
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=(uint32)~(7<<8);
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=(uint32)(1<<8);
 }
//**********************************************
//函数名称：void GPIO_Disable( port ,pin)
//简介：GPIO去使能
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//*************************************************
void GPIO_Disable(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=~(7<<8);
 }

//*******************************************************
//函数名称：void GPIO_INIT(port,pin,dir)
//简介：初始化端口，设定方向
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//*******************************************************
void GPIO_INIT(uint32 port,uint32 pin,uint32 dir)
 {
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=(uint32)~(7<<8);
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=(uint32)(1<<8);
     if(dir)
        HWREG(GPIO_PDDR_BASE+port*(0x40))|=(1<<pin);
     else HWREG(GPIO_PDDR_BASE+port*(0x40))&=~(1<<pin);
 }

//*******************************************************
//函数名称：void GPIO_SET(port,pin,date)
//简介：设定端口输出电平，首先要初始化设置输出
//参数：port端口：PORTA---PORTF
//      pin引脚：用与的形式
//      date:高低电平 
//********************************************************
void GPIO_SET(uint32 port,uint32 pin,uint32 date)
 {
       if(date)
        HWREG(GPIO_PDOR_BASE+port*(0x40))|=(1<<pin);
     else HWREG(GPIO_PDOR_BASE+port*(0x40))&=~(1<<pin);
 }

//*******************************************************
//函数名称：uint32 GPIO_GET(port,pin)
//简介：设定端口输出电平，首先要初始化设置
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//返回值：引脚状态,默认为高电平，返回1
//********************************************************
uint32 GPIO_GET(uint32 port,uint32 pin)
 {
    return (uint32)(HWREG(GPIO_PDIR_BASE+port*(0x40))>>pin)&(0x00000001);
 }

//*******************************************************
//函数名称：void GPIO_OPPSITE(port,pin)
//简介：设定端口输出电平，首先要初始化设置输出
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//********************************************************
void GPIO_OPPSITE(uint32 port , uint32 pin)
 {
    HWREG(GPIO_PTOR_BASE +port*(0x40))|=(1<<pin);
 }


//***********************************************************
//函数名称：void GPIO_DSE(uint32 port,uint32 pin)
//简介：设定驱动强度，用此函数数，驱动为high drive
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//***********************************************************
void GPIO_DSE(uint32 port ,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<6;
 }

   //***********************************************************
//函数名称：void GPIO_PFE(uint32 port,uint32 pin)
//简介：设定为Passive Filter
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//***********************************************************
void GPIO_PFE(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<4;
 }
  //***********************************************************
//函数名称：void GPIO_PFE(uint32 port,uint32 pin)
//简介：设定为low slew rate
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//***********************************************************
void GPIO_SER(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<2;
 }

//*************************************************************
//函数名称：void GPIOPULL_Enable(uint32 port,uint32 pin)
//简介：设定为使能上下拉
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//***********************************************************
void GPIOPULL_Enable(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<1;
 }
//*************************************************************
//函数名称：void GPIOPULL_Disable(uint32 port,uint32 pin)
//简介：设定为去使能上下拉
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//***********************************************************
void GPIOPULL_Disable(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=~(1<<1);
 }


//*************************************************************
//函数名称：void GPIOPULL_SET(uint32 port,uint32 pin,uint32 state)
//简介：设定上下拉
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//      state:PULL_UP,PULL_DOWN
//***********************************************************
void GPIOPULL_SET(uint32 port ,uint32 pin,uint32 state)
 {
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<1;
    if(state) HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1;
    else HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=~((uint32)1);
 }



//*************************************************************************
//函数名称：GPIOINT_Eable(port,pin)
//简介：使能端口中断
//参数：port:PORTA-PORTF
//      pin:0-31
//      mode:端口模式：
//*************************************************************************
void GPIOINT_Enable(uint32 port,uint32 pin,uint32 mode)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=0xfff0ffff;//先清零
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=(mode<<16);
 }

//*************************************************************************
//函数名称：GPIOINT_Disable(port,pin)
//简介：去使能端口中断
//参数：port:PORTA-PORTF
//      pin:0-31
//*************************************************************************
void GPIOINT_Disable(uint32 port,uint32 pin)
 {
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=0XFFF0FFFF;//先清零
 }

//*************************************************************************
//函数名：void GPIOINT_Clear(uint32 PORT)
//清楚中断标志
//*************************************************************************
void GPIOINT_Clear(uint32 PORT)
 {
    HWREG(PORT_ISFR+PORT*(0x1000))|=0XFFFFFFFF;
 }