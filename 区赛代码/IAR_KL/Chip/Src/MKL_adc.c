/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MK60_adc.c
 * @brief      ADC����
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-08-28
 */

#include "common.h"
#include "MKL_adc.h"

ADC_MemMapPtr ADCN[1] = {ADC0_BASE_PTR}; //����һ��ָ�����鱣�� ADCN �ĵ�ַ

static void     adc_start   (ADCn_Ch_e, ADC_nbit);    //��ʼadcת��

/*!
 *  @brief      ADC��ʼ��
 *  @param      ADCn_Ch_e    ADCͨ��
 *  @since      v5.0
 *  @note       �˳�ʼ����֧���������������ÿ��ͨ����֧��ADC ���������
                ����˵���� ADCn_Ch_e ��ע��˵��
 *  Sample usage:       adc_init (ADC0_SE10 );    //��ʼ�� ADC0_SE10 ��ʹ�� PTA7 �ܽ�
 */
void adc_init(ADCn_Ch_e adcn_ch)
{

    uint8 adcn = adcn_ch >> 5 ;
    //uint8 ch = adcn_ch & 0x1F;
    //ADC_MemMapPtr adc_ptr = ADCN[adcn];

    switch(adcn)
    {
    case ADC0:       /*   ADC0  */
        SIM_SCGC6 |= (SIM_SCGC6_ADC0_MASK );        //����ADC0ʱ��
        SIM_SOPT7 &= ~(SIM_SOPT7_ADC0ALTTRGEN_MASK  | SIM_SOPT7_ADC0PRETRGSEL_MASK);
        SIM_SOPT7 |= SIM_SOPT7_ADC0TRGSEL(0);
        break;

    default:
        ASSERT(0);
    }

    switch(adcn_ch)
    {

    case ADC0_SE0:
        port_init(PTE20, ALT0);
        break;
    case ADC0_SE1:
        port_init(PTE16, ALT0);
        break;
    case ADC0_SE2:
        port_init(PTE18, ALT0);
        break;
    case ADC0_SE3:
        port_init(PTE22, ALT0);
        break;
    case ADC0_SE4a:
        port_init(PTE21, ALT0);
        break;
    case ADC0_SE5a:
        port_init(PTE17, ALT0);
        break;
    case ADC0_SE6a:
        port_init(PTE19, ALT0);
        break;
    case ADC0_SE7a:
        port_init(PTE23, ALT0);
        break;
    case ADC0_SE8:
        port_init(PTB0, ALT0);
        break;
    case ADC0_SE9:
        port_init(PTB1, ALT0);
        break;
    case ADC0_SE11:
        port_init(PTC2, ALT0);
        break;
    case ADC0_SE12:
        port_init(PTB2, ALT0);
        break;
    case ADC0_SE13:
        port_init(PTB3, ALT0);
        break;
    case ADC0_SE14:
        port_init(PTC0, ALT0);
        break;
    case ADC0_SE15:
        port_init(PTC1, ALT0);
        break;
    case ADC0_SE23:
        port_init(PTE30, ALT0);
        break;

    case Temp0_Sensor:   // Temperature Sensor,�ڲ��¶Ȳ���������ADC����
    case VREFH0:         // �ο��ߵ�ѹ,����ADC���� ,�����Ϊ 2^n-1
    case VREFL0:         // �ο��͵�ѹ,����ADC���� ,�����Ϊ 0
        break;

    default:
        ASSERT(0);      //���ԣ����ݵĹܽŲ�֧�� ADC ��������������뻻 �����ܽ�
        break;
    }

#if 0
    //��������ģʽ
    ADC_SC1_REG(adc_ptr,0) =  (0
                               | ADC_SC1_ADCH(ch)           //ͨ��ѡ��
                               //| ADC_SC1_DIFF_MASK        //���ģʽѡ��ע�ͱ�ʾ ��ͨ����

                               );

    ADC_SC3_REG(adc_ptr) =
#endif

}

/*!
 *  @brief      ��ȡADC����ֵ(��֧��Bͨ��)
 *  @param      ADCn_Ch_e    ADCͨ��
 *  @param      ADC_nbit     ADC���ȣ� ADC_8bit,ADC_12bit, ADC_10bit, ADC_16bit ��
 *  @return     ����ֵ
 *  @since      v5.0
 *  Sample usage:       uint16 var = adc_once(ADC0_SE10, ADC_8bit);
 */
uint16 adc_once(ADCn_Ch_e adcn_ch, ADC_nbit bit) //�ɼ�ĳ·ģ������ADֵ
{
    ADCn_e adcn = (ADCn_e)(adcn_ch >> 5) ;

    uint16 result = 0;

    adc_start(adcn_ch, bit);      //����ADCת��

    while (( ADC_SC1_REG(ADCN[adcn], 0 ) & ADC_SC1_COCO_MASK ) != ADC_SC1_COCO_MASK);   //ֻ֧�� Aͨ��
    result = ADC_R_REG(ADCN[adcn], 0);
    ADC_SC1_REG(ADCN[adcn], 0) &= ~ADC_SC1_COCO_MASK;
    return result;
}

/*!
 *  @brief      ����ADC�������(��֧��Bͨ��)
 *  @param      ADCn_Ch_e    ADCͨ��
 *  @param      ADC_nbit     ADC���ȣ� ADC_8bit,ADC_12bit, ADC_10bit, ADC_16bit ��
 *  @since      v5.0
 *  @note       �˺����ڲ����ã������󼴿ɵȴ����ݲɼ����
 *  Sample usage:       adc_start(ADC0_SE10, ADC_8bit);
 */
void adc_start(ADCn_Ch_e adcn_ch, ADC_nbit bit)
{
    ADCn_e adcn = (ADCn_e)(adcn_ch >> 5) ;
    uint8 ch = (uint8)(adcn_ch & 0x1F);

    //��ʼ��ADCĬ������
    ADC_CFG1_REG(ADCN[adcn]) = (0
                                //| ADC_CFG1_ADLPC_MASK         //ADC�������ã�0Ϊ�������ģ�1Ϊ�͹���
                                | ADC_CFG1_ADIV(2)              //ʱ�ӷ�Ƶѡ��,��Ƶϵ��Ϊ 2^n,2bit
                                | ADC_CFG1_ADLSMP_MASK          //����ʱ�����ã�0Ϊ�̲���ʱ�䣬1 Ϊ������ʱ��
                                | ADC_CFG1_MODE(bit)
                                | ADC_CFG1_ADICLK(0)            //0Ϊ����ʱ��,1Ϊ����ʱ��/2,2Ϊ����ʱ�ӣ�ALTCLK����3Ϊ �첽ʱ�ӣ�ADACK����
                               );


    ADC_CFG2_REG(ADCN[adcn])  = (0
                                 //| ADC_CFG2_MUXSEL_MASK       //ADC����ѡ��,0Ϊaͨ����1Ϊbͨ����
                                 //| ADC_CFG2_ADACKEN_MASK      //�첽ʱ�����ʹ��,0Ϊ��ֹ��1Ϊʹ�ܡ�
                                 | ADC_CFG2_ADHSC_MASK          //��������,0Ϊ����ת�����У�1Ϊ����ת������
                                 | ADC_CFG2_ADLSTS(0)           //������ʱ��ѡ��ADCKΪ4+n������ѭ��������ѭ����0Ϊ20��1Ϊ12��2Ϊ6��3Ϊ2
                                );

    //д�� SC1A ����ת��
    ADC_SC1_REG(ADCN[adcn], 0 ) = (0
                                   | ADC_SC1_AIEN_MASK          // ת������ж�,0Ϊ��ֹ��1Ϊʹ��
                                   //| ADC_SC1_DIFF_MASK        // ���ģʽʹ��,0Ϊ���ˣ�1Ϊ���
                                   | ADC_SC1_ADCH( ch )
                                  );

    //ADC_SC1_REG(ADCN[adcn], 1 ) = 0;
}

/*!
 *  @brief      ֹͣADC�������
 *  @param      ADCn_e       ADCģ��ţ� ADC0�� ADC1��
 *  @since      v5.0
 *  Sample usage:       adc_stop(ADC0);
 */
void adc_stop(ADCn_e adcn)
{
    ADC_SC1_REG(ADCN[adcn], 0) = (0
                                  | ADC_SC1_AIEN_MASK                       // ת������ж�,0Ϊ��ֹ��1Ϊʹ��
                                  //| ADC_SC1_DIFF_MASK                     // ���ģʽʹ��,0Ϊ���ˣ�1Ϊ���
                                  | ADC_SC1_ADCH(Module0_Dis)               //����ͨ��ѡ��,�˴�ѡ���ֹͨ��
                                 );
}

