#ifndef __GPIO_H__
#define __GPIO_H__
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

#define PORT_PIN_0          1u
#define PORT_PIN_1          2u
#define PORT_PIN_2          4u
#define PORT_PIN_3          8u
#define PORT_PIN_4          0x10
#define PORT_PIN_5          0x20
#define PORT_PIN_6          0x40
#define PORT_PIN_7          0x80
#define PORT_PIN_8          0x100
#define PORT_PIN_9          0x200
#define PORT_PIN_10         0x400
#define PORT_PIN_11         0x800
#define PORT_PIN_12         0x1000
#define PORT_PIN_13         0x2000
#define PORT_PIN_14         0x4000
#define PORT_PIN_15         0x8000
#define PORT_PIN_16         0x10000
#define PORT_PIN_17         0x20000
#define PORT_PIN_18         0x40000
#define PORT_PIN_19         0x80000
#define PORT_PIN_20         0x100000
#define PORT_PIN_21         0x200000
#define PORT_PIN_22         0x400000
#define PORT_PIN_23         0x800000
#define PORT_PIN_24         0x1000000
#define PORT_PIN_25         0x2000000
#define PORT_PIN_26         0x4000000
#define PORT_PIN_27         0x8000000
#define PORT_PIN_28         0x10000000
#define PORT_PIN_29         0x20000000
#define PORT_PIN_30         0x40000000
#define PORT_PIN_31         0x80000000
//**********************************************
//函数名称：void GPIO_Enable(void port,pin)
//简介：GPIO使能
//参数：port端口：PORTA,PORTB,PORTC.~PORTF
//      pin引脚：0-31
//**********************************************
void GPIO_Enable(uint32 port,uint32 pin);


//**********************************************
//函数名称：void GPIO_Disable( port ,pin)
//简介：GPIO去使能
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//*************************************************
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
//      pin引脚：0-31
//********************************************************
void GPIO_SET(uint32 port,uint32 pin,uint32 date);


//*******************************************************
//函数名称：void GPIO_GET(port,pin)
//简介：设定端口输出电平，首先要初始化设置输出
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
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
//函数名称：void GPIO_ODE(uint32 port,uint32 pin)
//简介：设定为OPEN DRAIN，用此函数数，
//参数：port端口：PORTA---PORTF
//      pin引脚：0-31
//***********************************************************
void GPIO_ODE(uint32 port ,uint32 pin);

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

#define OUTPUT_HIGH	1
#define	OUTPUT_LOW	2
#define	INTPUT_UP	3
#define	INTPUT_DOWN	4
#define	INTPUT		5

#define	IRQC_DIS			0
#define	IRQC_DMA_RISING		1
#define	IRQC_DMA_FALLING	2
#define	IRQC_DMA_BOTH_EDGE	3
#define	IRQC_LOW			8
#define	IRQC_RISING			9
#define	IRQC_FALLING		10
#define	IRQC_BOTH_EDGE		11
#define	IRQC_HIGH			12

#define GPIO_PIN_0              0  // GPIO pin 0
#define GPIO_PIN_1              1  // GPIO pin 1
#define GPIO_PIN_2              2  // GPIO pin 2
#define GPIO_PIN_3              3  // GPIO pin 3
#define GPIO_PIN_4              4  // GPIO pin 4
#define GPIO_PIN_5              5  // GPIO pin 5
#define GPIO_PIN_6              6  // GPIO pin 6
#define GPIO_PIN_7              7  // GPIO pin 7
#define GPIO_PIN_8              8  // GPIO pin 8
#define GPIO_PIN_9              9   // GPIO pin 9
#define GPIO_PIN_10             10  // GPIO pin 10
#define GPIO_PIN_11             11  // GPIO pin 11
#define GPIO_PIN_12             12  // GPIO pin 12
#define GPIO_PIN_13             13  // GPIO pin 13
#define GPIO_PIN_14             14  // GPIO pin 14
#define GPIO_PIN_15             15  // GPIO pin 15
#define GPIO_PIN_16             16  // GPIO pin 16
#define GPIO_PIN_17             17  // GPIO pin 17
#define GPIO_PIN_18             18  // GPIO pin 18
#define GPIO_PIN_19             19  // GPIO pin 19
#define GPIO_PIN_20             20  // GPIO pin 20
#define GPIO_PIN_21             21  // GPIO pin 21
#define GPIO_PIN_22             22  // GPIO pin 22
#define GPIO_PIN_23             23  // GPIO pin 23
#define GPIO_PIN_24             24  // GPIO pin 24
#define GPIO_PIN_25             25  // GPIO pin 25
#define GPIO_PIN_26             26  // GPIO pin 26
#define GPIO_PIN_27             27  // GPIO pin 27
#define GPIO_PIN_28             28  // GPIO pin 28
#define GPIO_PIN_29             29  // GPIO pin 29
#define GPIO_PIN_30             30  // GPIO pin 30
#define GPIO_PIN_31             31  // GPIO pin 31

#define BIT_0              0x00000001  // 相应bit 0
#define BIT_1              0x00000002  // 相应bit 1
#define BIT_2              0x00000004  // 相应bit 2
#define BIT_3              0x00000008  // 相应bit 3
#define BIT_4              0x00000010  // 相应bit 4
#define BIT_5              0x00000020  // 相应bit 5
#define BIT_6              0x00000040  // 相应bit 6
#define BIT_7              0x00000080  // 相应bit 7
#define BIT_8              0x00000100  // 相应bit 8
#define BIT_9              0x00000200  // 相应bit 9
#define BIT_10            0x00000400  // 相应bit 10
#define BIT_11            0x00000800  // 相应bit 11
#define BIT_12            0x00001000  // 相应bit 12
#define BIT_13            0x00002000  // 相应bit 13
#define BIT_14            0x00004000  // 相应bit 14
#define BIT_15            0x00008000  // 相应bit 15
#define BIT_16            0x00010000  // 相应bit 16
#define BIT_17            0x00020000  // 相应bit 17
#define BIT_18            0x00040000  // 相应bit 18
#define BIT_19            0x00080000  // 相应bit 19
#define BIT_20            0x00100000  // 相应bit 20
#define BIT_21            0x00200000  // 相应bit 21
#define BIT_22            0x00400000  // 相应bit 22
#define BIT_23            0x00800000  // 相应bit 23
#define BIT_24            0x01000000  // 相应bit 24
#define BIT_25            0x02000000  // 相应bit 25
#define BIT_26            0x04000000  // 相应bit 26
#define BIT_27            0x08000000  // 相应bit 27
#define BIT_28            0x10000000  // 相应bit 28
#define BIT_29            0x20000000  // 相应bit 29
#define BIT_30            0x40000000  // 相应bit 30
#define BIT_31            0x80000000  // 相应bit 31

#define PTA 1
#define PTB 2
#define PTC 3
#define PTD 4
#define PTE 5

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
void GPIO_Init(uint8 Ptx,uint8 Pins,uint8 Dir_Data,uint8 Irqc);







#endif