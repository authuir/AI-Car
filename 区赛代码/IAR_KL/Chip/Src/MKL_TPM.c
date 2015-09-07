/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MKL_TPM.c
 * @brief      TPM��ʱ��������
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-08-22
 */

/*
 * ����ͷ�ļ�
 */
#include "common.h"
#include  "MKL_TPM.h"

/*
 * ��������
 */
TPM_MemMapPtr TPMN[3] = {TPM0_BASE_PTR, TPM1_BASE_PTR, TPM2_BASE_PTR}; //��������ָ�����鱣�� TPMn_e �ĵ�ַ


void tpm_port_mux(TPMn_e tpmn, TPM_CHn_e ch)
{
    switch(tpmn)
    {
    case TPM0:
        SIM_SCGC6 |= SIM_SCGC6_TPM0_MASK;       //ʹ��TPM0ʱ��
        switch(ch)
        {
        case TPM_CH0:
            if((TPM0_CH0_PIN == PTC1) || (TPM0_CH0_PIN == PTD0) )
            {
                port_init(TPM0_CH0_PIN, ALT4);
            }
            else if((TPM0_CH0_PIN == PTE24) || (TPM0_CH0_PIN == PTA3) )
            {
                port_init(TPM0_CH0_PIN, ALT3);
            }
            else
            {
                ASSERT(0);                      //���ùܽ�����
            }
            break;

        case TPM_CH1:
            if((TPM0_CH1_PIN == PTC2) || (TPM0_CH1_PIN == PTD1))
            {
                port_init(TPM0_CH1_PIN, ALT4);
            }
            else if((TPM0_CH1_PIN == PTA4) || (TPM0_CH1_PIN == PTE25) )
            {
                port_init(TPM0_CH1_PIN, ALT3);
            }
            else
            {
                ASSERT(0);                      //���ùܽ�����
            }
            break;

        case TPM_CH2:
            if((TPM0_CH2_PIN == PTC3) || (TPM0_CH2_PIN == PTD2) )
            {
                port_init(TPM0_CH2_PIN, ALT4);
            }
            else if((TPM0_CH2_PIN == PTA5) || (TPM0_CH2_PIN == PTE29) )
            {
                port_init(TPM0_CH2_PIN, ALT3);
            }
            else
            {
                ASSERT(0);                      //���ùܽ�����
            }
            break;

        case TPM_CH3:
            if((TPM0_CH3_PIN == PTC4) || (TPM0_CH3_PIN == PTD3) )
            {
                port_init(TPM0_CH3_PIN, ALT4);
            }
            else if((TPM0_CH3_PIN == PTA6) || (TPM0_CH3_PIN == PTE30))
            {
                port_init(TPM0_CH3_PIN, ALT3);
            }
            else
            {
                ASSERT(0);                      //���ùܽ�����
            }
            break;

        case TPM_CH4:
            if(TPM0_CH4_PIN == PTD4)
            {
                port_init(TPM0_CH4_PIN, ALT4);
            }
            else if((TPM0_CH4_PIN == PTC8) || (TPM0_CH4_PIN == PTA7) || (TPM0_CH4_PIN == PTE31) )
            {
                port_init(TPM0_CH4_PIN, ALT3);
            }
            else
            {
                ASSERT(0);                      //���ùܽ�����
            }
            break;

        case TPM_CH5:
            if(TPM0_CH5_PIN == PTD5)
            {
                port_init(TPM0_CH5_PIN, ALT4);
            }
            else if((TPM0_CH5_PIN == PTA0)  || (TPM0_CH5_PIN == PTC9)  ||   (TPM0_CH5_PIN == PTE26)    )
            {
                port_init(TPM0_CH5_PIN, ALT3);
            }
            else
            {
                ASSERT(0);                      //���ùܽ�����
            }
            break;

        default:
            return;
        }
        break;

    case TPM1:
        SIM_SCGC6 |= SIM_SCGC6_TPM1_MASK;       //ʹ��TPM1ʱ��
        switch(ch)
        {
        case TPM_CH0:
            if((TPM1_CH0_PIN == PTE20) || (TPM1_CH0_PIN == PTA12) || (TPM1_CH0_PIN == PTB0) )
            {
                port_init(TPM1_CH0_PIN, ALT3);
            }
            else
            {
                ASSERT(0);                      //���ùܽ�����
            }
            break;


        case TPM_CH1:
            if((TPM1_CH1_PIN == PTE21) || (TPM1_CH1_PIN == PTA13) || (TPM1_CH1_PIN == PTB1) )
            {
                port_init(TPM1_CH1_PIN, ALT3);
            }
            else
            {
                ASSERT(0);                      //���ùܽ�����
            }
            break;

        default:
            return;
        }
        break;

    case TPM2:
        SIM_SCGC6 |= SIM_SCGC6_TPM2_MASK;                           //ʹ��TPM2ʱ��
        switch(ch)
        {
        case TPM_CH0:
            if((TPM2_CH0_PIN == PTA1) || (TPM2_CH0_PIN == PTB2) || (TPM2_CH0_PIN == PTB18) || (TPM2_CH0_PIN == PTE22) )
            {
                port_init(TPM2_CH0_PIN, ALT3);
            }
            else
            {
                ASSERT(0);                      //���ùܽ�����
            }
            break;

        case TPM_CH1:
            if((TPM2_CH1_PIN == PTA2) || (TPM2_CH1_PIN == PTB3)|| (TPM2_CH1_PIN == PTB19)|| (TPM2_CH1_PIN == PTE23))
            {
                port_init(TPM2_CH1_PIN, ALT3);
            }
            else
            {
                ASSERT(0);                      //���ùܽ�����
            }
            break;

        default:
            return;
        }
        break;
    default:
        break;
    }
}

/*!
 *  @brief      ��ʼ��TPM ��PWM ����
 *  @param      TPMn_e    ģ��ţ�TPM0��  TPM1��  TPM2��
 *  @param      TPM_CHn_e     ͨ���ţ�CH0~CH7��
 *  @param      freq    Ƶ�ʣ���λΪHz��
 *  @param      duty    ռ�ձȷ��ӣ�ռ�ձ� = duty / TPMn_PRECISON
 *  @since      v5.0
 *  @note       ͬһ��TPM��PWMƵ���Ǳ���һ���ģ���ռ�ձȿɲ�һ������3��TPM�����������3����ͬƵ��PWM
 *  Sample usage:       TPM_PWM_init(TPM0, TPM_CH6,200, 10);    //��ʼ�� TPM0_CH6 Ϊ Ƶ�� 200Hz ��PWM��ռ�ձ�Ϊ 10/TPM0_PRECISON
 */
void tpm_pwm_init(TPMn_e tpmn, TPM_CHn_e ch, uint32 freq, uint32 duty)
{
    uint32 clk_hz ;
    uint16 mod;
    uint8  ps;
    uint16 cv;

    ASSERT( ((tpmn == TPM0)&& (ch <= TPM_CH5)) || ( (tpmn == TPM1 || tpmn == TPM2 ) && (ch <= TPM_CH1))   );  //��鴫�ݽ�����ͨ���Ƿ���ȷ

    /******************* ����ʱ�� �� ����IO��*******************/
    tpm_port_mux(tpmn,ch);

    /*       ����Ƶ������        */
    //  �� CPWMS = 1 ����˫�߲�׽���壬�� PMWƵ�� =  pllƵ��/2 /2 /(2^Ԥ��Ƶ����)/ģ��
    //  �� CPWMS = 0 �������߲�׽���壬�� PMWƵ�� =  pllƵ��/2    /(2^Ԥ��Ƶ����)/ģ��
    //  EPWM������ ��MOD - CNTIN + 0x0001   (CNTIN ��Ϊ0)
    //  �����ȣ�CnV - CNTIN

    //  ģ�� MOD < 0x10000
    //  Ԥ��Ƶ���� PS  < 0x07
    //  Ԥ��Ƶ���� PS ԽСʱ��ģ�� mod ��Խ�󣬼�����Խ��׼��PWM�����Ϊ׼ȷ
    //  MOD  = clk_hz/(freq*(1 << PS)) < 0x10000  ==>  clk_hz/(freq*0x10000) < (1<< PS)  ==>  (clk_hz/(freq*0x10000) >> PS) < 1
    //  �� (((clk_hz/0x10000 )/ freq ) >> PS ) < 1

    // �� CPWMS = 1 ����˫�߲�׽����Ϊ��
    clk_hz = (pll_clk_mhz * 1000 * 1000) >> 1 ; // pllƵ�� / 2

    mod = (clk_hz >> 16 ) / freq ;      // ��ʱ�� mod ����һ��
    ps = 0;
    while((mod >> ps) >= 1)             // �� (mod >> ps) < 1 ���˳� while ѭ�� ������ PS ����Сֵ
    {
        ps++;
    }

    ASSERT(ps <= 0x07);         // ���ԣ� PS ���Ϊ 0x07 ��������ֵ���� PWMƵ�����ù��ͣ��� Bus Ƶ�ʹ���

    mod = (clk_hz >> ps) / freq;// �� MOD ��ֵ

    switch(tpmn)                // ��ֵ CNTIN ��Ϊ0 �������ȣ�CnV - CNTIN ���� CnV ���� �������ˡ�
    {
        // EPWM������ �� MOD - CNTIN + 0x0001 == MOD - 0 + 1
        // �� CnV = (MOD - 0 + 1) * ռ�ձ� = (MOD - 0 + 1) * duty/ TPM_PRECISON
    case TPM0:
        cv = (duty * (mod - 0 + 1)) / TPM0_PRECISON;
        break;

    case TPM1:
        cv = (duty * (mod - 0 + 1)) / TPM1_PRECISON;
        break;

    case TPM2:
        cv = (duty * (mod - 0 + 1)) / TPM2_PRECISON;
        break;

    default:
        break;
    }

    /******************** ѡ�����ģʽΪ ���ض���PWM *******************/
    //ͨ��״̬���ƣ�����ģʽ��ѡ�� ���ػ��ƽ
    TPM_CnSC_REG(TPMN[tpmn], ch) &= ~TPM_CnSC_ELSA_MASK;
    TPM_CnSC_REG(TPMN[tpmn], ch)  = TPM_CnSC_MSB_MASK | TPM_CnSC_ELSB_MASK;
    // MSnB:MSnA = 1x       ���ض���PWM
    // ELSnB:ELSnA = 10     �ȸߺ��
    // ELSnB:ELSnA = 11     �ȵͺ��

    /******************** ����ʱ�Ӻͷ�Ƶ ********************/
    SIM_SOPT2 &= ~ SIM_SOPT2_TPMSRC_MASK;
    SIM_SOPT2 |= SIM_SOPT2_TPMSRC(1);        //     00 Clock disabled  01 MCGFLLCLK clock, or MCGPLLCLK/2  10 OSCERCLK clock   11 MCGIRCLK clock

    TPM_SC_REG(TPMN[tpmn])    = ( 0
                                  //| TPM_SC_CPWMS_MASK         //0�������ؼ���ģʽ ��1�� �����ؼ���ģʽѡ�� ��ע���˱�ʾ 0��
                                  | TPM_SC_PS(ps)             //��Ƶ���ӣ���Ƶϵ�� = 2^PS
                                  | TPM_SC_CMOD(1)
                                );
    TPM_MOD_REG(TPMN[tpmn])   = mod;                        //ģ��, EPWM������Ϊ ��MOD - CNTIN + 0x0001
    TPM_CnV_REG(TPMN[tpmn], ch) = cv;
    TPM_CNT_REG(TPMN[tpmn])   = 0;                          //��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ�����������0��
}

/*!
 *  @brief      ����TPM ��PWM ͨ��ռ�ձ�
 *  @param      TPMn_e    ģ��ţ�TPM0��  TPM1��  TPM2��
 *  @param      TPM_CHn_e     ͨ���ţ�CH0~CH7��
 *  @param      duty    ռ�ձȷ��ӣ�ռ�ձ� = duty / TPMn_PRECISON
 *  @since      v5.0
 *  @note       ͬһ��TPM��PWMƵ���Ǳ���һ���ģ���ռ�ձȿɲ�һ������3��TPM�����������3����ͬƵ��PWM
 *  Sample usage:       TPM_PWM_Duty(TPM0, TPM_CH6, 10);    //���� TPM0_CH6ռ�ձ�Ϊ 10/TPM0_PRECISON
 */
void tpm_pwm_duty(TPMn_e tpmn, TPM_CHn_e ch, uint32 duty)
{
    uint32 cv;
    uint32 mod = 0;

    ASSERT( ((tpmn == TPM0)&& (ch <= TPM_CH5)) || ( (tpmn == TPM1 || tpmn == TPM2 ) && (ch <= TPM_CH1))   );  //��鴫�ݽ�����ͨ���Ƿ���ȷ

    switch(tpmn)
    {
    case TPM0:
        ASSERT(duty <= TPM0_PRECISON);     //�ö��Լ�� ռ�ձ��Ƿ����
        break;

    case TPM1:
        ASSERT(duty <= TPM1_PRECISON);     //�ö��Լ�� ռ�ձ��Ƿ����
        break;

    case TPM2:
        ASSERT(duty <= TPM2_PRECISON);     //�ö��Լ�� ռ�ձ��Ƿ����
        break;

    default:
        break;
    }


    //ռ�ձ� = (CnV-CNTIN)/(MOD-CNTIN+1)

    do
    {
        mod = TPM_MOD_REG(TPMN[tpmn]);        //��ȡ MOD ��ֵ
    }
    while(mod == 0);      //��һ�Σ�������0 ����Ҫ���ȡ���Ρ�

    switch(tpmn)
    {
    case TPM0:
        cv = (duty * (mod - 0 + 1)) / TPM0_PRECISON;
        break;

    case TPM1:
        cv = (duty * (mod - 0 + 1)) / TPM1_PRECISON;
        break;

    case TPM2:
        cv = (duty * (mod - 0 + 1)) / TPM2_PRECISON;
        break;
    default:
        break;
    }

    // ����TPMͨ��ֵ
    TPM_CnV_REG(TPMN[tpmn], ch) = cv;

}

/*!
 *  @brief      ����TPM��Ƶ��
 *  @param      freq    Ƶ�ʣ���λΪHz��
 *  @since      v5.0
 *  @note       �޸�PWMƵ�ʺ󣬱������ TPM_PWM_Duty ��������ռ�ձȡ�ͬһ��ģ�飬PWMƵ�ʱ�����ͬ��
 *  Sample usage:       TPM_PWM_freq(TPM0,200);    //���� TPM0 �� Ƶ�� Ϊ 200Hz
 */
void tpm_pwm_freq(TPMn_e tpmn, uint32 freq)             //����TPM��Ƶ��
{
    uint32 clk_hz ;
    uint32 mod;
    uint8 ps;


    /*       ����Ƶ������        */
    // �� CPWMS = 1 ����˫�߲�׽����Ϊ��
    clk_hz = (pll_clk_mhz * 1000 * 1000) >> 1 ; // pllƵ�� / 2

    mod = (clk_hz >> 16 ) / freq ;      // ��ʱ�� mod ����һ��
    ps = 0;
    while((mod >> ps) >= 1)             // �� (mod >> ps) < 1 ���˳� while ѭ�� ������ PS ����Сֵ
    {
        ps++;
    }

    ASSERT(ps <= 0x07);         // ���ԣ� PS ���Ϊ 0x07 ��������ֵ���� PWMƵ�����ù��ͣ��� Bus Ƶ�ʹ���

    mod = (clk_hz >> ps) / freq;// �� MOD ��ֵ


    TPM_SC_REG(TPMN[tpmn])    = ( 0
                                  //| TPM_SC_CPWMS_MASK         //0�������ؼ���ģʽ ��1�� �����ؼ���ģʽѡ�� ��ע���˱�ʾ 0��
                                  | TPM_SC_PS(ps)             //��Ƶ���ӣ���Ƶϵ�� = 2^PS
                                  | TPM_SC_CMOD(1)
                                  //| TPM_SC_CLKS(1)            //ʱ��ѡ�� 0��ûѡ��ʱ�ӣ����ã� 1��bus ʱ�ӣ� 2��MCGFFCLK�� 3��EXTCLK�� ��SIM_SOPT4 ѡ������ܽ� TPM_CLKINx��
                                  //| TPM_SC_TOIE_MASK        //����ж�ʹ�ܣ�ע���˱�ʾ ��ֹ����жϣ�
                                );
    TPM_MOD_REG(TPMN[tpmn])   = mod;                        //ģ��, EPWM������Ϊ ��MOD - CNTIN + 0x0001
    TPM_CNT_REG(TPMN[tpmn])   = 0;                          //��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ������������ CNTIN ��ֵ��
}

//////////////////////////////// ����Ϊ���PWM  //////////////////////////////////////////


//////////////////////////////// ����Ϊ�������  //////////////////////////////////////////
void tpm_pulse_init(TPMn_e tpmn,TPM_CLKIN_e clkin,TPM_PS_e ps)
{
    ASSERT(ps < TPM_PS_MAX);

    //���� ����
    switch(tpmn)
    {
    case TPM0:
        SIM_SCGC6 |= SIM_SCGC6_TPM0_MASK;       //ʹ��TPM0ʱ��


        break;
    case TPM1:
        SIM_SCGC6 |= SIM_SCGC6_TPM1_MASK;       //ʹ��TPM1ʱ��
        break;

    case TPM2:
        SIM_SCGC6 |= SIM_SCGC6_TPM2_MASK;       //ʹ��TPM2ʱ��
        break;
    default:
        ASSERT(0);
    }

    if(clkin == TPM_CLKIN0)
    {
        SIM_SOPT4 &= ~( SIM_SOPT4_TPM2CLKSEL_MASK << tpmn );
        port_init(TPM_CLKIN0_PIN,ALT4);
    }
    else if(clkin == TPM_CLKIN1)
    {
        SIM_SOPT4 |= ( SIM_SOPT4_TPM2CLKSEL_MASK << tpmn );
        port_init(TPM_CLKIN1_PIN,ALT4);
    }
    else
    {
        ASSERT(0);              //���ԣ�clkin ֻ�� 0 �� 1
    }
    SIM_SOPT2 &= ~ SIM_SOPT2_TPMSRC_MASK;
    SIM_SOPT2 |= SIM_SOPT2_TPMSRC(1);
    TPM_SC_REG(TPMN[tpmn])    = ( 0
                                  //| TPM_SC_CPWMS_MASK         //0�������ؼ���ģʽ ��1�� �����ؼ���ģʽѡ�� ��ע���˱�ʾ 0��
                                  | TPM_SC_PS(ps)             //��Ƶ���ӣ���Ƶϵ�� = 2^PS
                                  | TPM_SC_CMOD(2)
                               );
    TPM_MOD_REG(TPMN[tpmn])   = 0xFFFF;
    TPM_CNT_REG(TPMN[tpmn])   = 0;                          //��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ�����������0��
}



//��ռ���ֵ
void     tpm_pulse_clean (TPMn_e tpmn)
{
    TPM_CNT_REG(TPMN[tpmn])   = 0;                          //��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ�����������0��
}

//��ȡ����ֵ
extern uint16     tpm_pulse_get (TPMn_e tpmn)
{
    return (uint16)TPM_CNT_REG(TPMN[tpmn]);                          //��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ�����������0��
}

