/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MKL_gpio.c
 * @brief      gpio��������
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-06-26
 */

/*
 * ����ͷ�ļ�
 */
#include "common.h"
#include "MKL_port.h"
#include "MKL_gpio.h"


/*
 * ��������
 */
#if 1   //���� GPIO ���� ���� ����һ�� �� ����IO ���ڶ����� ��ͨIO
GPIO_MemMapPtr GPIOX[PTX_MAX] = {(GPIO_MemMapPtr)FPTA_BASE_PTR, (GPIO_MemMapPtr)FPTB_BASE_PTR, (GPIO_MemMapPtr)FPTC_BASE_PTR, (GPIO_MemMapPtr)FPTD_BASE_PTR, (GPIO_MemMapPtr)FPTE_BASE_PTR}; //�������ָ�����鱣�� GPIOX �ĵ�ַ
#else
GPIO_MemMapPtr GPIOX[PTX_MAX] = {PTA_BASE_PTR,PTB_BASE_PTR,PTC_BASE_PTR, PTD_BASE_PTR, PTE_BASE_PTR}; //�������ָ�����鱣�� GPIOX �ĵ�ַ

#endif


/*!
 *  @brief      ��ʼ��gpio
 *  @param      PTxn    �˿�
 *  @param      cfg     ���ŷ���,0=����,1=���
 *  @param      data    �����ʼ״̬,0=�͵�ƽ,1=�ߵ�ƽ ����������Ч��
 *  @since      v5.0
 *  Sample usage:       gpio_init (PTA8, GPI,0);    //��ʼ�� PTA8 �ܽ�Ϊ����
 */
void gpio_init (PTXn_e ptxn, GPIO_CFG cfg, uint8 data)
{


    //�˿ڷ���������뻹�����
    if(  cfg == GPI )
    {
        //���ö˿ڷ���Ϊ����
        GPIO_PDDR_REG(GPIOX_BASE(ptxn)) &= ~(1 << PTn(ptxn));       // GPIO PDDR �ܽź� ��0������Ӧ�ܽ�����Ϊ�˿ڷ�������
    }
    else
    {
        //���ö˿ڷ���Ϊ���
        GPIO_PDDR_REG(GPIOX_BASE(ptxn)) |= (1 << PTn(ptxn));        // GPIO PDDR �ܽź� ��1������Ӧ�ܽ�����Ϊ�˿ڷ������

        //�˿��������
        if(data == 0)
        {
            GPIO_PDOR_REG(GPIOX_BASE(ptxn)) &= ~(1 << PTn(ptxn));   // GPIO PDOR �ܽź� ��0������Ӧ�ܽ�����Ϊ�˿�����͵�ƽ
        }
        else
        {
            GPIO_PDOR_REG(GPIOX_BASE(ptxn))  |= (1 << PTn(ptxn));   // GPIO PDOR �ܽź� ��1������Ӧ�ܽ�����Ϊ�˿�����ߵ�ƽ
        }
    }

    //���ùܽ�ΪGPIO����
    port_init( ptxn, ALT1);
}

/*!
 *  @brief      �����������ݷ���
 *  @param      PTxn    �˿�
 *  @param      cfg     ���ŷ���,0=����,1=���
 *  @since      v5.0
 *  Sample usage:       gpio_ddr (PTA8, GPI);    //���� PTA8 �ܽ�Ϊ����
 */
void    gpio_ddr   (PTXn_e ptxn, GPIO_CFG cfg)
{
    //�˿ڷ���������뻹�����
    if(  cfg == GPI )
    {
        //���ö˿ڷ���Ϊ����
        GPIO_PDDR_REG(GPIOX_BASE(ptxn)) &= ~(1 << PTn(ptxn));           // GPIO PDDR �ܽź� ��0������Ӧ�ܽ�����Ϊ�˿ڷ�������
    }
    else
    {
        //���ö˿ڷ���Ϊ���
        GPIO_PDDR_REG(GPIOX_BASE(ptxn)) |= (1 << PTn(ptxn));            // GPIO PDDR �ܽź� ��1������Ӧ�ܽ�����Ϊ�˿ڷ������
    }
}

/*!
 *  @brief      ��������״̬
 *  @param      PTxn    �˿�
 *  @param      data    �����ʼ״̬,0=�͵�ƽ,1=�ߵ�ƽ ����������Ч��
 *  @since      v5.0
 *  @warning    ��ر�֤���ݷ���Ϊ�����DEBUGģʽ�£��ж��Խ��м�⣩
 *  Sample usage:       gpio_set (PTA8, 1);    // PTA8 �ܽ� ��� 1
 */
void gpio_set (PTXn_e ptxn, uint8 data)
{
    ASSERT( BIT_GET( GPIO_PDDR_REG(GPIOX_BASE(ptxn)) , PTn(ptxn)) == GPO ); // ���ԣ���� ��������Ƿ�Ϊ���
                                                                            // ��ȡ GPIO PDDR �ܽź� ���Ƚ��Ƿ�Ϊ���

    //�˿��������
    if(data == 0)
    {
        GPIO_PDOR_REG(GPIOX_BASE(ptxn)) &= ~(1 << PTn(ptxn));   // GPIO PDOR �ܽź� ��0������Ӧ�ܽ�����Ϊ�˿�����͵�ƽ
    }
    else
    {
        GPIO_PDOR_REG(GPIOX_BASE(ptxn))  |= (1 << PTn(ptxn));   // GPIO PDOR �ܽź� ��1������Ӧ�ܽ�����Ϊ�˿�����ߵ�ƽ
    }
}


/*!
 *  @brief      ��ת����״̬
 *  @param      PTxn    �˿�
 *  @since      v5.0
 *  @warning    ��ر�֤���ݷ���Ϊ�����DEBUGģʽ�£��ж��Խ��м�⣩
 *  Sample usage:       gpio_turn (PTA8);    // PTA8 �ܽ� ��� ��ת
 */
void gpio_turn (PTXn_e ptxn)
{
    ASSERT( BIT_GET( GPIO_PDDR_REG(GPIOX_BASE(ptxn)) , PTn(ptxn)) == GPO ); // ���ԣ���� ��������Ƿ�Ϊ���
                                                                            // ��ȡ GPIO PDDR �ܽź� ���Ƚ��Ƿ�Ϊ���

    GPIO_PTOR_REG( GPIOX_BASE(ptxn))  =  1 << (PTn(ptxn ));                 // GPIO PTOR ptxn ��1��������0 ������Ӧ�ܽ�����Ϊ�˿������ת������λ����
                                                                            // �˴������� BIT_SET ���������1 ����Ϊ���뱣֤����λ ���䣬����λֱ����0����
}

/*!
 *  @brief      ��ȡ��������״̬
 *  @param      PTxn    �˿�
 *  @return     �ܽŵ�״̬��1Ϊ�ߵ�ƽ��0Ϊ�͵�ƽ
 *  @since      v5.0
 *  @warning    ��ر�֤���ݷ���Ϊ���루DEBUGģʽ�£��ж��Խ��м�⣩
 *  Sample usage:       uint8 pta8_data = gpio_get (PTA8);    // ��ȡ PTA8 �ܽ� �����ƽ
 */
uint8 gpio_get(PTXn_e ptxn)
{
    ASSERT( BIT_GET( GPIO_PDDR_REG(GPIOX_BASE(ptxn)) , PTn(ptxn)) == GPI ); // ���ԣ���� ��������Ƿ�Ϊ����
                                                                            // ��ȡ GPIO PDDR �ܽź� ���Ƚ��Ƿ�Ϊ����

    return ((GPIO_PDIR_REG(GPIOX_BASE(ptxn)) >> PTn(ptxn )) & 0x01);        // ��ȡ GPIO PDIR ptxn ״̬������ȡ�ܽ������ƽ
}





//�Լ��Ŀ�
///**********************************************
//�������ƣ�void GPIO_Enable(port,pin)
//��飺GPIOʹ��
//������port�˿ڣ�PORTA,PORTB,PORTC.~PORTF
//      pin���ţ�0-31
//**********************************************
void GPIO_Enable(uint32 port,uint32 pin)
 {
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=(uint32)~(7<<8);
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=(uint32)(1<<8);
 }
//**********************************************
//�������ƣ�void GPIO_Disable( port ,pin)
//��飺GPIOȥʹ��
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//*************************************************
void GPIO_Disable(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=~(7<<8);
 }

//*******************************************************
//�������ƣ�void GPIO_INIT(port,pin,dir)
//��飺��ʼ���˿ڣ��趨����
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
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
//�������ƣ�void GPIO_SET(port,pin,date)
//��飺�趨�˿������ƽ������Ҫ��ʼ���������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ��������ʽ
//      date:�ߵ͵�ƽ 
//********************************************************
void GPIO_SET(uint32 port,uint32 pin,uint32 date)
 {
       if(date)
        HWREG(GPIO_PDOR_BASE+port*(0x40))|=(1<<pin);
     else HWREG(GPIO_PDOR_BASE+port*(0x40))&=~(1<<pin);
 }

//*******************************************************
//�������ƣ�uint32 GPIO_GET(port,pin)
//��飺�趨�˿������ƽ������Ҫ��ʼ������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//����ֵ������״̬,Ĭ��Ϊ�ߵ�ƽ������1
//********************************************************
uint32 GPIO_GET(uint32 port,uint32 pin)
 {
    return (uint32)(HWREG(GPIO_PDIR_BASE+port*(0x40))>>pin)&(0x00000001);
 }

//*******************************************************
//�������ƣ�void GPIO_OPPSITE(port,pin)
//��飺�趨�˿������ƽ������Ҫ��ʼ���������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//********************************************************
void GPIO_OPPSITE(uint32 port , uint32 pin)
 {
    HWREG(GPIO_PTOR_BASE +port*(0x40))|=(1<<pin);
 }


//***********************************************************
//�������ƣ�void GPIO_DSE(uint32 port,uint32 pin)
//��飺�趨����ǿ�ȣ��ô˺�����������Ϊhigh drive
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIO_DSE(uint32 port ,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<6;
 }

   //***********************************************************
//�������ƣ�void GPIO_PFE(uint32 port,uint32 pin)
//��飺�趨ΪPassive Filter
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIO_PFE(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<4;
 }
  //***********************************************************
//�������ƣ�void GPIO_PFE(uint32 port,uint32 pin)
//��飺�趨Ϊlow slew rate
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIO_SER(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<2;
 }

//*************************************************************
//�������ƣ�void GPIOPULL_Enable(uint32 port,uint32 pin)
//��飺�趨Ϊʹ��������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIOPULL_Enable(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<1;
 }
//*************************************************************
//�������ƣ�void GPIOPULL_Disable(uint32 port,uint32 pin)
//��飺�趨Ϊȥʹ��������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIOPULL_Disable(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=~(1<<1);
 }


//*************************************************************
//�������ƣ�void GPIOPULL_SET(uint32 port,uint32 pin,uint32 state)
//��飺�趨������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//      state:PULL_UP,PULL_DOWN
//***********************************************************
void GPIOPULL_SET(uint32 port ,uint32 pin,uint32 state)
 {
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<1;
    if(state) HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1;
    else HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=~((uint32)1);
 }



//*************************************************************************
//�������ƣ�GPIOINT_Eable(port,pin)
//��飺ʹ�ܶ˿��ж�
//������port:PORTA-PORTF
//      pin:0-31
//      mode:�˿�ģʽ��
//*************************************************************************
void GPIOINT_Enable(uint32 port,uint32 pin,uint32 mode)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=0xfff0ffff;//������
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=(mode<<16);
 }

//*************************************************************************
//�������ƣ�GPIOINT_Disable(port,pin)
//��飺ȥʹ�ܶ˿��ж�
//������port:PORTA-PORTF
//      pin:0-31
//*************************************************************************
void GPIOINT_Disable(uint32 port,uint32 pin)
 {
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=0XFFF0FFFF;//������
 }

//*************************************************************************
//��������void GPIOINT_Clear(uint32 PORT)
//����жϱ�־
//*************************************************************************
void GPIOINT_Clear(uint32 PORT)
 {
    HWREG(PORT_ISFR+PORT*(0x1000))|=0XFFFFFFFF;
 }