#ifndef __I2C_H__
#define __I2C_H__

#define I2C0        0
#define I2C1        1
#define I2C_A1_BASE 0X40066000
#define I2C_F_BASE  0X40066001
#define I2C_C1_BASE 0X40066002
#define I2C_S_BASE  0X40066003
#define I2C_D_BASE  0X40066004



#define baud_rate  0x8d 
/*0x8d :390.625K   
0x95:213.07k
0xbf:4.882k //最低
0x66:97.65k
0x80:937.5k
0x8b:468.75k
0x4d:781.25k
0x40
*/


//引脚定义
#define I2C0_PB0_PB1    0

#define I2C0_PB2_PB3    1

#define I2C1_PC10_PC11  2 

#define I2C0_PD8_PD9    3

#define I2C1_PE0_PE1    4

//传输信号定义：
#define  Start          1
#define  Stop           0
//传输应答定义：
#define  answer         1
#define  translate      0
//****************************************************************
//初始化I2C，参数定义在I2C.h
//波特率可选，在函数内部 修改。
//***************************************************************
void I2C_INIT(uint32 I2C_NUM,char PIN_NUM);

//*************************************************************************
//信号产生函数：signal:Start,Stop
//*************************************************************************
void I2C_signal(uint32 I2C_NUM,uint8 signal);

//*************************************************************************
//信号产生函数：x:anwser,translate,等待应答和等待传输完成
//返回值：1：收到 应答信号或一个字节传输完成
//        0：接受或传输失败
//*************************************************************************
uint8 I2C_wait(uint32 I2C_NUM,uint8 x);

//*************************************************************************
//简介：接受一个字节
//DeviceAddr:设备地址
//AccessAddr：访问地址
//*************************************************************************
uint8 I2C_R1(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 *data);

//*************************************************************************
//简介：发送一个字节
//DeviceAddr:设备地址
//AccessAddr：访问地址
//返回值：1表示成功，0表示失败
//*************************************************************************
uint8 I2C_W1(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 data);
//*************************************************************************
//简介：接受N个字节
//DeviceAddr:设备地址
//AccessAddr：访问地址
//返回值：1表示成功，0表示失败
//*************************************************************************
uint8 I2C_RN(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 N,uint8 data[]);

//*************************************************************************
//简介：向从机写N个字节
//DeviceAddr:设备地址
//AccessAddr：访问地址
//返回值：1表示成功，0表示失败
//*************************************************************************
uint8 I2C_WN(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 N,uint8 data[]);

//***************************************************************************
//I2C中断的开启和关闭
//*************************************************************************
void I2CINT_Enable(uint32 I2C_NUM);
void I2CINT_Disable(uint32 I2C_NUM);


#endif