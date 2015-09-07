/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MK60_ftm.c
 * @brief      TPM��ʱ��������
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-08-22
 */

#ifndef _MK60_TPM_H_
#define _MK60_TPM_H_

//����TPMģ���
typedef enum
{
    TPM0,
    TPM1,
    TPM2,

    TPM_MAX,
} TPMn_e;

//����TPM ͨ����
typedef enum
{

    TPM_CH0,
    TPM_CH1,
    TPM_CH2,
    TPM_CH3,
    TPM_CH4,
    TPM_CH5,
    TPM_CH6,
    TPM_CH7,

} TPM_CHn_e;

typedef enum
{
    TPM_CLKIN0,
    TPM_CLKIN1,
} TPM_CLKIN_e;

//��Ƶϵ��
typedef enum
{
    TPM_PS_1,
    TPM_PS_2,
    TPM_PS_4,
    TPM_PS_8,
    TPM_PS_16,
    TPM_PS_32,
    TPM_PS_64,
    TPM_PS_128,

    TPM_PS_MAX,
}TPM_PS_e;

//���ڿ�ʼ���� ���� ���ؼ���
typedef enum
{
    EXTRG_IN,       //�ⲿ����
    CMP0_OUT,       //CMP0 ���

    TRG_CFG_RES0,   //����
    TRG_CFG_RES1,   //����

    PIT0_TRG,       //PIT0 ����
    PIT1_TRG,       //PIT0 ����

    TRG_CFG_RES2,   //����
    TRG_CFG_RES3,   //����

    TPM0_OVER,      //TPM0���
    TPM1_OVER,      //TPM1���
    TPM2_OVER,      //TPM2���

    TRG_CFG_RES4,   //����

    RTC_ALARM,      //RTC����
    RTC_SEC,        //RTC���ж�

    LPTMR_TRG,      //LPTMR ����

    TRG_CFG_RES5,   //����


}TPMx_TRG_CFG_e;


/*********************** PWM **************************/

#define TPM0_PRECISON 1000u     //����ռ�ձȾ��ȣ�100������Ϊ1%��1000u�򾫶�Ϊ0.1%������ռ�ձ� duty �βδ��룬��ռ�ձ�Ϊ duty/TPM_PRECISON
#define TPM1_PRECISON 10000u     //����ռ�ձȾ��ȣ�100������Ϊ1%��1000u�򾫶�Ϊ0.1%������ռ�ձ� duty �βδ��룬��ռ�ձ�Ϊ duty/TPM_PRECISON
#define TPM2_PRECISON 1000u     //����ռ�ձȾ��ȣ�100������Ϊ1%��1000u�򾫶�Ϊ0.1%������ռ�ձ� duty �βδ��룬��ռ�ձ�Ϊ duty/TPM_PRECISON


#define FTM_PWM_Init  tpm_pwm_init
#define FTM_PWM_Set_Duty tpm_pwm_duty
extern void  tpm_pwm_init(TPMn_e, TPM_CHn_e, uint32 freq, uint32 duty);  //��ʼ��TPM��PWM���ܲ�����Ƶ�ʡ�ռ�ձȡ�����ͨ�����ռ�ձȡ�ͬһ��TPM����ͨ����PWMƵ����һ���ģ���3��TPM

extern void  tpm_pwm_duty(TPMn_e, TPM_CHn_e,              uint32 duty);  //����ͨ��ռ�ձ�,ռ�ձ�Ϊ ��duty * ���ȣ� % ����� TPM_PRECISON ����Ϊ 1000 ��duty = 100 ����ռ�ձ� 100*0.1%=10%
extern void  tpm_pwm_freq(TPMn_e,            uint32 freq);               //����TPM��Ƶ�ʣ���Ƶ�ʺ���Ҫ��������ռ�ձȣ�



extern void     tpm_pulse_init(TPMn_e tpmn,TPM_CLKIN_e clkin,TPM_PS_e ps);
extern void     tpm_pulse_clean (TPMn_e tpmn);
extern uint16    tpm_pulse_get (TPMn_e tpmn);

#endif  //_MK60_TPM_H_



