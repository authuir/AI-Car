#include "all.h"
//*************************************
//��飺ʹ��ADCʱ��
//������ADC_NUM��ADC0~3
//*************************************
void ADC_Enable(uint32 ADC_NUM)
 {
     switch(ADC_NUM)
      {
      case ADC0:SIM_SCGC6|=SIM_SCGC6_ADC0_MASK;break;
      case ADC1:SIM_SCGC3|=SIM_SCGC3_ADC1_MASK;break;
      case ADC2:SIM_SCGC6|=SIM_SCGC6_ADC2_MASK;break;
      case ADC3:SIM_SCGC3|=SIM_SCGC3_ADC3_MASK;break;
      }
 }
//******************************************************************
//��ADCʹ�ܺ��������ţ��Լ�д������ PORTB  17���óɸ��ù���3
//��PORTB_PCR15|=PORT_PCR_MUX(3);
//����ʹ�����к�����PORT_Configure,����һ��˿�����Ĭ��ΪAD����ģʽ�����Բ�������
//�������Ҫ����
//******************************************************************

//******************************************************************
//������飺ADC�������,Ĭ��Ϊ���������ֱ����ADCINIT_A����
//          ���������ʽ
//������ADC_NUM:ADC0~3
//      channel:0-24
//      accuracy:bite_8~16
//********************************************************************

void ADCINIT_A(uint32 ADC_NUM,uint32 mux_channel,uint8 channal,uint8 accuracy)
 {
     HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))&=~ADC_SC1_ADCH_MASK;
     //HWREG(ADC_CFG1_BASE +ADC_NUM*(0X1000))|=ADC_CFG1_ADIV(0)|ADC_CFG1_ADICLK(0);
     //Ĭ�ϲ���BUS_CLOCK��00��Ƶ
     HWREG(ADC_CFG1_BASE +ADC_NUM*(0X1000))|=ADC_CFG1_MODE(accuracy)|ADC_CFG1_ADLSMP_MASK;//����ѡ���Լ���ʱ�������֤����
     HWREG(ADC_CFG2_BASE+ADC_NUM*(0X1000))|=mux_channel<<4;
     HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))|=ADC_SC1_ADCH(channal);
 }
void ADC_channal(uint32 ADC_NUM,uint8 channal)
 {
     HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))|=ADC_SC1_ADCH(channal);
 }
//����ADC״ֵ̬
uint8 ADC_S_A(uint32 ADC_NUM)
 {
     return (uint8)((HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))>>7)&(0X01));
 }
//ȡADC_Aת�����ֵ
void ADC_VALUE_A(uint32 ADC_NUM,uint16 *value)
 {
     *value=HWREG(ADC_RA_BASE+ADC_NUM*(0X1000));
      HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))&=~(ADC_SC1_COCO_MASK);
     //�����־ 
 }

//***************************************************************
//�ر�ADC��ѡ��ͨ��11111�ر�
void ADC_Disable_A(uint32 ADC_NUM)
 {
     HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))|=ADC_SC1_ADCH_MASK;
 }

//***************************************************************

//****************************************************************
//��飺Ӳ��ƽ������,���ԣ����������������ʹ�ô˹��ܻ�������ת����Ч��������ݲ��ȶ�
//      �������������õ��δ���ģʽ
//������ADC_NUM:ADC0~3
//      samples_num:sample_4��sample_8,sample_16,sample_32
//****************************************************************

void HardWare_ave(uint32 ADC_NUM,char samples_num)
 {
     HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=ADC_SC3_AVGE_MASK;
     HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=(uint32)samples_num;
 }

//****************************************************************
//��飺����Ӳ������ADʱ��
//������ADC_NUM:ADC0~3
//      triggle_mode��PDB_Trigger��Alternate_Trigger
//      Pre_trigger��Pre_A��Pre_B
//      trigger_select:�������ó�PIT ,FTM�ȣ�
//      ���忴ADC.h����,ֻ��Alternate_Triggerģʽ������
//***************************************************************
void ADCHardWare_INIT(uint32 ADC_NUM,char trigger_mode,char Pre_trigger,uint32 trigger_select)
 {
     HWREG(ADC_CFG1_BASE+ADC_NUM*(0X1000))|=ADC_CFG1_ADICLK(2);
     switch(ADC_NUM)
      {
      case ADC0:    if(trigger_mode) SIM_SOPT7|=SIM_SOPT7_ADC0ALTTRGEN_MASK;
                    if(Pre_trigger) SIM_SOPT7|=SIM_SOPT7_ADC0PRETRGSEL_MASK;
                    SIM_SOPT7|=trigger_select;break;
      case ADC1:    if(trigger_mode) SIM_SOPT7|=SIM_SOPT7_ADC1ALTTRGEN_MASK;
                    if(Pre_trigger) SIM_SOPT7|=SIM_SOPT7_ADC1PRETRGSEL_MASK;
                    SIM_SOPT7|=trigger_select<<8;break;
      case ADC2:    if(trigger_mode) SIM_SOPT7|=SIM_SOPT7_ADC2ALTTRGEN_MASK;
                    if(Pre_trigger) SIM_SOPT7|=SIM_SOPT7_ADC2PRETRGSEL_MASK;
                    SIM_SOPT7|=trigger_select<<16;break;
      case ADC3:    if(trigger_mode) SIM_SOPT7|=SIM_SOPT7_ADC3ALTTRGEN_MASK;
                    if(Pre_trigger) SIM_SOPT7|=SIM_SOPT7_ADC3PRETRGSEL_MASK;
                    SIM_SOPT7|=trigger_select<<24;break;
      }
     HWREG(ADC_SC2_BASE+ADC_NUM*(0X1000))|=ADC_SC2_ADTRG_MASK;//���ó�Ӳ������
 }
//***************************************************************
//Ӳ���������ã�
//trigger_mode:ѡ��Trigger_once��Trigger_always
//sample_ave��Sample_4��Sample_8��Sample_16��Sample_32
//***************************************************************
void ADCHardWare_configure(uint32 ADC_NUM,uint32 trigger_mode,char sample_ave)
 {
     HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=ADC_SC3_AVGE_MASK;
     if(trigger_mode) 
          HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=ADC_SC3_ADCO_MASK;
     HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=sample_ave;
 }
//****************************************************************************
//����ADCת���ٶȺͳ�����ʱ��
//������
//      speed:HIGH_SPEED,NORMAL_SPEED
//      sample_time:ADCK_24,ADCK_16,ADCK_10,ADCK_6
//****************************************************************************
void ADC_Speed(uint32 ADC_NUM,char speed,char sample_time)
 {
     HWREG(ADC_CFG2_BASE +ADC_NUM*(0X1000))&=~(ADC_CFG2_ADHSC_MASK|ADC_CFG2_ADLSTS_MASK);
     HWREG(ADC_CFG2_BASE +ADC_NUM*(0X1000))|=(uint32)((speed<<2)|(sample_time));
 }

//*****************************************************************************
//��飺���ģʽAD����,ֻ����A,������ʱ��
//������channel:DAD0~4
//      accuracy:bite9  11  13  16
//*************************************************************************
void ADC_DIFF_A(uint32 ADC_NUM,uint32 channel,char accuracy)
 {
     HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))&=~ADC_SC1_ADCH_MASK;
     HWREG(ADC_CFG1_BASE+ADC_NUM*(0X1000))|=ADC_CFG1_ADLSMP_MASK|ADC_CFG1_MODE(accuracy);
     HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))|=ADC_SC1_DIFF_MASK|ADC_SC1_ADCH(channel);
 }