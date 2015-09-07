#ifndef __COMMON_H__
#define __COMMON_H__

#define EnableInterrupts asm("CPSIE i");
#define DisableInterrupts asm("CPSID i");
extern unsigned int SYS_CLOCK;
typedef unsigned char                       uint8;
typedef unsigned short int                  uint16;
typedef unsigned int                        uint32;    //�޷���λ��
typedef unsigned long int                   uint64;

typedef volatile    uint8                   vuint8;
typedef volatile    uint16                  vuint16;
typedef volatile    uint32                  vuint32;    //���Ż��޷���λ��

typedef char                                int8;
typedef short int                           int16;
typedef int                                 int32;      //�з���λ��
typedef long int                            int64;

typedef volatile int8                       vint8;
typedef volatile int16                      vint16;
typedef volatile int32                      vint32;     //���Ż�����λ
#define HWREG(x)                                                              \
        (*((volatile uint32 *)(x)))
#define HWREG16(x)                                                             \
        (*((volatile uint16 *)(x)))
#define HWREG8(x)                                                             \
        (*((volatile uint8 *)(x)))

#define BSET(REGISTER,WEI) REGISTER|=(1<<(WEI))
#define BCLE(REGISTER,WEI) REGISTER&=~(1<<(WEI))
#define BGET(REGISTER,WEI) ((REGISTER>>(WEI))&1)

#define SYS_CLOCK_150M 0X4E    //0x4e:��С��  0x18:������
#define SYS_CLOCK_100M 0X10
void SYS_CLOCK_SET(uint32 X,uint32 div_core,uint32 div_bus,uint32 div_flexbus,uint32 flash);

//*********************************************
//�������ƣ�void PORT_Enable(uint32 x)
//��飺ʹ�ܶ˿�ʱ��
//������PORTA,PORTB,PORTC,PORTD,PORTE,PORTF
//**********************************************
void PORT_Enable(uint32 X);


//*********************************************
//�������ƣ�void PORT_Disable(uint32 x)
//��飺�رն˿�ʱ��
//������PORTA,PORTB,PORTC,PORTD,PORTE,PORTF
//**********************************************
void PORT_Disable(uint32 X);
//**********************************************
//�������ƣ�void PORT_Enable_ALL(void);
//��飺�����ж˿�ʱ��
//***********************************************
void PORT_Enable_ALL(void);

//���ö˿ڵĸ��ù���
void PORT_Configuer(uint32 port,uint32 pin,uint8 select);










#endif