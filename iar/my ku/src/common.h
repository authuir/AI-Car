#ifndef __COMMON_H__
#define __COMMON_H__

#define EnableInterrupts asm("CPSIE i");
#define DisableInterrupts asm("CPSID i");
extern unsigned int SYS_CLOCK;
typedef unsigned char                       uint8;
typedef unsigned short int                  uint16;
typedef unsigned int                        uint32;    //无符号位数
typedef unsigned long int                   uint64;

typedef volatile    uint8                   vuint8;
typedef volatile    uint16                  vuint16;
typedef volatile    uint32                  vuint32;    //不优化无符号位数

typedef char                                int8;
typedef short int                           int16;
typedef int                                 int32;      //有符号位数
typedef long int                            int64;

typedef volatile int8                       vint8;
typedef volatile int16                      vint16;
typedef volatile int32                      vint32;     //不优化符号位
#define HWREG(x)                                                              \
        (*((volatile uint32 *)(x)))
#define HWREG16(x)                                                             \
        (*((volatile uint16 *)(x)))
#define HWREG8(x)                                                             \
        (*((volatile uint8 *)(x)))

#define BSET(REGISTER,WEI) REGISTER|=(1<<(WEI))
#define BCLE(REGISTER,WEI) REGISTER&=~(1<<(WEI))
#define BGET(REGISTER,WEI) ((REGISTER>>(WEI))&1)

#define SYS_CLOCK_150M 0X4E    //0x4e:最小板  0x18:四旋翼
#define SYS_CLOCK_100M 0X10
void SYS_CLOCK_SET(uint32 X,uint32 div_core,uint32 div_bus,uint32 div_flexbus,uint32 flash);

//*********************************************
//函数名称：void PORT_Enable(uint32 x)
//简介：使能端口时钟
//参数：PORTA,PORTB,PORTC,PORTD,PORTE,PORTF
//**********************************************
void PORT_Enable(uint32 X);


//*********************************************
//函数名称：void PORT_Disable(uint32 x)
//简介：关闭端口时钟
//参数：PORTA,PORTB,PORTC,PORTD,PORTE,PORTF
//**********************************************
void PORT_Disable(uint32 X);
//**********************************************
//函数名称：void PORT_Enable_ALL(void);
//简介：打开所有端口时钟
//***********************************************
void PORT_Enable_ALL(void);

//设置端口的复用功能
void PORT_Configuer(uint32 port,uint32 pin,uint8 select);










#endif