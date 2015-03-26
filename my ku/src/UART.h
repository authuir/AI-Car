#ifndef __UART_H__
#define __UART_H__

#define UART0 0
#define UART1 1
#define UART2 2
#define UART3 3
#define UART4 128
#define UART5 129

#define UART_C1_BASE        0X4006A002
#define UART_C2_BASE        0X4006A003
#define UART_C3_BASE        0X4006A006
#define UART_C4_BASE        0X4006A00A
#define UART_BDH_BASE       0X4006A000
#define UART_BDL_BASE       0X4006A001
#define UART_S1_BASE        0X4006A004
#define UART_D_BASE         0X4006A007
//FIFO寄存器：UART0和1包含8个FIFO传输口，其他为1个
#define UART_PFIFO_BASE     0X4006A010
#define UART_CFIFO_BASE     0X4006A011
#define UART_SFIFO_BASE     0X4006A012
#define UART_TWFIFO_BASE    0X4006A013
#define UART_TCFIFO_BASE    0X4006A014
#define UART_RWFIFO_BASE    0X4006A015
#define UART_RCFIFO_BASE    0X4006A016
#define TX_clear            0x80
#define RX_clear            0x40
//UART引脚定义：
//UART0:
#define PORTD_6_7      0//???
#define PORTB_16_17    1
#define PORTA_14_15    2
#define PORTA_1_2      13
//UART1:
#define PORTE_0_1      3 
#define PORTC_3_4      4
//UART2:
#define PORTD_2_3      5//???
//UART3:
#define PORTE_4_5      6
#define PORTB_10_11    7
#define PORTC_16_17    8
//UART4:
#define PORTE_24_25    9
#define PORTC_14_15    10
//UART5:
#define PORTE_8_9      11
#define PORTD_8_9      12

//中断使能位定义
#define ILIE 4
#define RIE  5
#define TCIE 6
#define TIE  7
#define PEIE 0
#define FEIE 1
#define NEIE 2
#define ORIE 3


#define FIFO_BIT 8
//**********************
#define pose_power  0
#define pose_pitch  1
#define pose_roll   2
#define pose_yaw    3
//**********************
//******************************************************************
//函数名：void GPIOType_UART(uint32 PORT_R_T)
//简介：定义UART引脚
//参数：略,.H里面有定义
//******************************************************************
void GPIOType_UART(uint32 PORT_R_T);

//******************************************************************************
//函数名称：void  UART_INIT(uint32 UART_NUM,uint32 SYS_CLOCK,uint32 BAUD)
//简介：UART初始化函数
//参数：UART_NUM   从UART0-5
//      SYS_CLOCK:系统时钟
//      BAUD:设定波特率       //待解决
//*******************************************************************************
void  UART_INIT(uint32 UART_NUM,uint32 BUS_CLOCK,uint32 BAUD);


//******************************************************************************
//函数名：uint8 UART_RE1(uint32 UART_NUM,uint *fp)
//简介：接受一个数据
//参数：UART_NUM:0-5
//      fp:判断是否收到数据  1表示成功，0表示失败
//*****************************************************************************
uint8 UART_R1(uint32 UART_NUM,uint8 *fp);

//***********************************************************************************\
//函数名称：uint8 UART_S1(uint32 UART_NUM,uint8 ch)
//简介：发送一个字节
//参数：UART_NUM:UART0~5
//      ch:字节
//返回值：1表示发送成功，0表示失败
//***********************************************************************************
uint8 UART_S1(uint32 UART_NUM,uint8 ch);


//****************************************************************************
//函数名：uint8 UART_RN(uint32 UART_NUM,uint32 lenth,uint8* date) 
//简介：接受N个字节
//参数：UART_NUM  0~5
//      lenth:字符串长度
//      date:接受数据数组      
//****************************************************************************
uint8 UART_RN(uint32 UART_NUM,uint32 lenth,uint8* date);

//****************************************************************************
//函数名：uint8 UART_SN(uint32 UART_NUM,uint32 lenth,uint8* date) 
//简介：发送N个字节
//参数：UART_NUM  0~5
//      lenth:字符串长度
//      date:接受数据数组    
//返回值：1成功，0失败
//****************************************************************************
uint8 UART_SN(uint32 UART_NUM,uint32 lenth,uint8* date);

//*************************************************************************
//函数名称：uint8 UART_SS(uint32 UART_NUM,void *buff)
//简介：传输一个字符串
//参数：NART_NUM0~5,   "STRING"
//************************************************************************
uint8 UART_SS(uint32 UART_NUM,void *buff);

//*************************************************************
//函数名：void UARTINT_Enable(uint32 UART_NUM,uint32 INT_CLASS)
//简介：使能中断的类型
//参数：UART_NUM0~5  
//      INT_CLASS:ILIE，RIE，TCIE，TIE，PEIE，FEIE，NEIE，ORIE
//说明：此中断打开后，必须用Enable_IRQ()打开对应向量号才可使用
//*************************************************************
void UARTINT_Enable(uint32 UART_NUM,uint32 INT_CLASS);

//***************************************************************
//同  UARTINT_Enable,关闭对应中断
//**************************************************************
void UARTINT_Disable(uint32 UART_NUM,uint32 INT_CLASS);

//***************************************************************
//函数功能：使能FIFO功能  K60  UART0和UART1深度为8，其余为1
//初始化读的功能,传输功能暂时不考虑,bit表示一次传输的数据数
//***************************************************************
void UART_FIFO_read_init(uint32 UART_NUM);
void UART_FIFO_Read_value(uint32 UART_NUM,uint8* date);

//***************************************************************
//读取当前缓冲器中剩余的TX,RX的值
//***************************************************************
void UART_CountRead(uint32 UART_NUM,uint8* TX_count,uint8* RX_count);
//***************************************************************

#endif