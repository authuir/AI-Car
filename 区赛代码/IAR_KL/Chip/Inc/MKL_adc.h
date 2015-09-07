/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MK60_adc.h
 * @brief      ADC����
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-08-28
 */


#ifndef __MK60_ADC_H__
#define __MK60_ADC_H__ 1

typedef enum
{
    // ---------------------------------ADC0-------------------------
    ADC0_DP0 = 0,   // PTE20
    ADC0_SE0 = 0,

    ADC0_DP1 = 1,   // PTE16
    ADC0_SE1 = 1,

    ADC0_DP2 = 2,   // PTE18
    ADC0_SE2 = 2,

    ADC0_DP3 = 3,   // PTE22
    ADC0_SE3 = 3,

    ADC0_DM0 = 4,   // PTE21
    ADC0_SE4a= 4,

    ADC0_DM1 = 5,   // PTE17
    ADC0_SE5a= 5,

    ADC0_DM2 = 6,   // PTE19
    ADC0_SE6a= 6,

    ADC0_DM3 = 7,   // PTE23
    ADC0_SE7a= 7,

    ADC0_SE4b= 4,   // PTE29     ��֧�����ADC�����ݽ��������ADC���ᵱ�� aͨ������

    ADC0_SE5b= 5,   // PTD1      ��֧�����ADC�����ݽ��������ADC���ᵱ�� aͨ������

    ADC0_SE6b= 6,   // PTD5      ��֧�����ADC�����ݽ��������ADC���ᵱ�� aͨ������

    ADC0_SE7b= 7,   // PTD6      ��֧�����ADC�����ݽ��������ADC���ᵱ�� aͨ������

    ADC0_SE8,       // PTB0

    ADC0_SE9,       // PTB1

    ADC0_RES0,      // ����

    ADC0_SE11,      // PTC2

    ADC0_SE12,      // PTB2

    ADC0_SE13,      // PTB3

    ADC0_SE14,      // PTC0

    ADC0_SE15,      // PTC1

    ADC0_RES1,      // ����

    ADC0_RES2,      // ����

    ADC0_RES3,      // ����

    ADC0_RES4,      // ����

    ADC0_RES5,      // ����

    ADC0_RES6,      // ����

    ADC0_RES7,      // ����

    ADC0_SE23,      // PTE30

    DAC0_OUT = ADC0_SE23, // PTE30  DAC0��� ,���� ADC�����ᵱ�� ADC0_SE23  ����

    ADC0_RES8,      // ����

    ADC0_RES9,      // ����

    Temp0_Sensor,   // Temperature Sensor,�ڲ��¶Ȳ���������ADC����
    Bandgap0,       // �¶Ȳ����ṹ��϶��׼Դ   ��֧��ADC
    ADC0_RES10,     // ����
    VREFH0,         // �ο��ߵ�ѹ,����ADC���� ,�����Ϊ 2^n-1
    VREFL0,         // �ο��͵�ѹ,����ADC���� ,�����Ϊ 0
    Module0_Dis,    // ��֧�� ADC



} ADCn_Ch_e;

typedef enum  //ADCģ��
{
    ADC0,
    ADC1
} ADCn_e;

//����λ��
typedef enum ADC_nbit
{
    ADC_8bit   = 0x00,
    ADC_10bit  = 0x02,
    ADC_12bit  = 0x01,
    ADC_16bit  = 0x03
} ADC_nbit;


//�ⲿ�����ӿ�����
extern void     adc_init  	(ADCn_Ch_e);              	//ADC��ʼ��
extern uint16   adc_once   	(ADCn_Ch_e, ADC_nbit);    	//�ɼ�һ��һ·ģ������ADֵ


extern void     adc_stop    (ADCn_e);                   //ֹͣADCת��


#endif /* __MK60_ADC16_H__ */
