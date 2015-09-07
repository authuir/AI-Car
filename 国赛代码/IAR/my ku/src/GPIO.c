#include "all.h"
//**********************************************
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
     PORT_Enable(port);
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
//函数名称：void GPIO_ODE(uint32 port,uint32 pin)
//简介：设定为OPEN DRAIN，用此函数数，
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//***********************************************************
void GPIO_ODE(uint32 port ,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<5;
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
/**********************************************************************/
/* 简介:初始化GPIO   
 * 例程:GPIO_Init(PTA,GPIO_PIN_10,INTPUT_UP,IRQC_HIGH);
 * 参数: 			PTx:		PTA,PTB,PTC,PTD,PTE
 * 			GPIO_PIN_x:	GPIO_PIN_0,GPIO_PIN_1,......,GPIO_PIN_31
 * 			Dir_Data:	OUTPUT_HIGH,OUTPUT_LOW,INTPUT_UP,INTPUT_DOWN,INTPUT
 * 			Irqc:		IRQC_DIS,IRQC_DMA_RISING,IRQC_DMA_FALLING,IRQC_DMA_BOTH_EDGE,
 * 						IRQC_LOW,IRQC_RISING,IRQC_FALLING,IRQC_BOTH_EDGE,IRQC_HIGH
 */
/*********************************************************************/
void GPIO_Init(uint8 Ptx,uint8 Pins,uint8 Dir_Data,uint8 Irqc)
{
	PORT_MemMapPtr PORTx_BASE_PTR;
	GPIO_MemMapPtr PTx_BASE_PTR;
	
	switch(Ptx)//使能PORTx的时钟
	{
		case 1:PTx_BASE_PTR =PTA_BASE_PTR;PORTx_BASE_PTR = PORTA_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;break;
		case 2:PTx_BASE_PTR =PTB_BASE_PTR;PORTx_BASE_PTR = PORTB_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;break;
		case 3:PTx_BASE_PTR =PTC_BASE_PTR;PORTx_BASE_PTR = PORTC_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;break;
		case 4:PTx_BASE_PTR =PTD_BASE_PTR;PORTx_BASE_PTR = PORTD_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;break;
		case 5:PTx_BASE_PTR =PTE_BASE_PTR;PORTx_BASE_PTR = PORTE_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK;break;
	}
	PORT_PCR_REG(PORTx_BASE_PTR,Pins) &= ~PORT_PCR_LK_MASK;
	PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_MUX(0x01) | PORT_PCR_ISF_MASK;
		//复用管脚为GPIO功能, 确定触发模式 ,开启上拉或下拉电阻
		//不锁住引脚控制寄存器[15:0]
		//写1清零中断标志位
	switch(Dir_Data)
	{
		case 1:
		{
			GPIO_PDDR_REG(PTx_BASE_PTR) |= 0x1u<<Pins;		//设置端口方向为输出
			GPIO_PSOR_REG(PTx_BASE_PTR) |= 0x1u<<Pins;		//输出高电平
			break;
		}
		case 2:
		{
			GPIO_PDDR_REG(PTx_BASE_PTR) |= 0x1u<<Pins;		//设置端口方向为输出
			GPIO_PSOR_REG(PTx_BASE_PTR) &= (~0x1u<<Pins);	//输出低电平
			break;
		}
		//输入时配置上下拉是因为要消除悬空态,和区分高低态
		case 3:
		{
			GPIO_PDDR_REG(PTx_BASE_PTR) &= (~0x1u<<Pins);			//设置端口方向为输入
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_IRQC(Irqc);//配置中断类型
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;//使能上下拉功能,配置上拉
			break;
		}
		case 4:
		{
			GPIO_PDDR_REG(PTx_BASE_PTR) &= (~0x1u<<Pins);			//设置端口方向为输入
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_IRQC(Irqc);//配置中断类型
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) &= ~PORT_PCR_PS_MASK;
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_PE_MASK;//使能上下拉功能,配置下拉
			break;
		}
		case 5:
		{
			GPIO_PDDR_REG(PTx_BASE_PTR) &= (~0x1u<<Pins);			//设置端口方向为输入
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_IRQC(Irqc);//配置中断类型
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) &= ~PORT_PCR_PE_MASK;//禁能上下拉功能
			break;
		}
	}

}



