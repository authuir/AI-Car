/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MK60_gpio.h
 * @brief      gpio����ͷ�ļ�
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-06-26
 */
#ifndef __MK60_GPIO_H__
#define __MK60_GPIO_H__

#include "MKL_gpio_cfg.h"

/*
 * ����ܽŷ���
 */
typedef enum GPIO_CFG
{
    //�����ֵ���ܸģ�����
    GPI         = 0,                                //����ܽ����뷽��      GPIOx_PDDRn�0��ʾ���룬1��ʾ���
    GPO         = 1,                                //����ܽ��������
} GPIO_CFG;

#define HIGH  1u
#define LOW   0u

extern  GPIO_MemMapPtr      GPIOX[PTX_MAX];
#define GPIOX_BASE(PTxn)    GPIOX[PTX(PTxn)]       //GPIOģ��ĵ�ַ


/****************************�ⲿʹ��****************************/

extern void    gpio_init  (PTXn_e, GPIO_CFG, uint8 data);    //��ʼ��gpio
extern void    gpio_ddr   (PTXn_e, GPIO_CFG);                //�����������ݷ���
extern void    gpio_set   (PTXn_e,           uint8 data);    //��������״̬
extern void    gpio_turn  (PTXn_e);                          //��ת����״̬
extern uint8   gpio_get   (PTXn_e);                          //��ȡ����״̬

//���� 4�� ���� �� PTxn ֻ���� �궨�壬������ ����

extern void PORT_Enable_ALL(void);

//����  ���� �� PTxn ������  �궨�壬Ҳ������ ����


//nλ����
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



//****GPIO�˿��ж�Ҫʹ��ʱ�ӣ�����Ҫʹ������
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
//�жϷ�ʽ
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
//�������ƣ�void GPIO_INIT(port,pin,dir)
//��飺��ʼ���˿ڣ��趨����
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//*******************************************************
void GPIO_INIT(uint32 port,uint32 pin,uint32 dir);

//*******************************************************
//�������ƣ�void GPIO_SET(port,pin,date)
//��飺�趨�˿������ƽ������Ҫ��ʼ���������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ��������ʽ
//      date:�ߵ͵�ƽ 
//********************************************************
void GPIO_SET(uint32 port,uint32 pin,uint32 date);

//*******************************************************
//�������ƣ�uint32 GPIO_GET(port,pin)
//��飺�趨�˿������ƽ������Ҫ��ʼ������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//����ֵ������״̬,Ĭ��Ϊ�ߵ�ƽ������1
//********************************************************
uint32 GPIO_GET(uint32 port,uint32 pin);

//*******************************************************
//�������ƣ�void GPIO_OPPSITE(port,pin)
//��飺�趨�˿������ƽ������Ҫ��ʼ���������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//********************************************************
void GPIO_OPPSITE(uint32 port , uint32 pin);


//***********************************************************
//�������ƣ�void GPIO_DSE(uint32 port,uint32 pin)
//��飺�趨����ǿ�ȣ��ô˺�����������Ϊhigh drive
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIO_DSE(uint32 port ,uint32 pin);

   //***********************************************************
//�������ƣ�void GPIO_PFE(uint32 port,uint32 pin)
//��飺�趨ΪPassive Filter
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIO_PFE(uint32 port,uint32 pin);
  //***********************************************************
//�������ƣ�void GPIO_PFE(uint32 port,uint32 pin)
//��飺�趨Ϊlow slew rate
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIO_SER(uint32 port,uint32 pin);

//*************************************************************
//�������ƣ�void GPIOPULL_Enable(uint32 port,uint32 pin)
//��飺�趨Ϊʹ��������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIOPULL_Enable(uint32 port,uint32 pin);
//*************************************************************
//�������ƣ�void GPIOPULL_Disable(uint32 port,uint32 pin)
//��飺�趨Ϊȥʹ��������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIOPULL_Disable(uint32 port,uint32 pin);


//*************************************************************
//�������ƣ�void GPIOPULL_SET(uint32 port,uint32 pin,uint32 state)
//��飺�趨������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//      state:PULL_UP,PULL_DOWN
//***********************************************************
void GPIOPULL_SET(uint32 port ,uint32 pin,uint32 state);



//*************************************************************************
//�������ƣ�GPIOINT_Eable(port,pin)
//��飺ʹ�ܶ˿��ж�
//������port:PORTA-PORTF
//      pin:0-31
//      mode:�˿�ģʽ��
//*************************************************************************
void GPIOINT_Enable(uint32 port,uint32 pin,uint32 mode);

//*************************************************************************
//�������ƣ�GPIOINT_Disable(port,pin)
//��飺ȥʹ�ܶ˿��ж�
//������port:PORTA-PORTF
//      pin:0-31
//*************************************************************************
void GPIOINT_Disable(uint32 port,uint32 pin);

//*************************************************************************
//��������void GPIOINT_Clear(uint32 PORT)
//����жϱ�־
//*************************************************************************
void GPIOINT_Clear(uint32 PORT);
#endif      //__MK60_GPIO_H__
