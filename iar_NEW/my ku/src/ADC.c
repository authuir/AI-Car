#include "all.h"
//*************************************
//简介：使能ADC时钟
//参数：ADC_NUM：ADC0~3
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
//在ADC使能后配置引脚，自己写，比如 PORTB  17配置成复用功能3
//则：PORTB_PCR15|=PORT_PCR_MUX(3);
//或者使用已有函数，PORT_Configure,不过一般端口引脚默认为AD采样模式，可以不用设置
//特殊的需要设置
//******************************************************************

//******************************************************************
//函数简介：ADC软件触发,默认为软件触发，直接用ADCINIT_A函数
//          软件触发方式
//参数：ADC_NUM:ADC0~3
//      channel:0-24
//      accuracy:bite_8~16
//********************************************************************

void ADCINIT_A(uint32 ADC_NUM,uint32 mux_channel,uint8 channal,uint8 accuracy)
 {
     HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))&=~ADC_SC1_ADCH_MASK;
     //HWREG(ADC_CFG1_BASE +ADC_NUM*(0X1000))|=ADC_CFG1_ADIV(0)|ADC_CFG1_ADICLK(0);
     //默认采用BUS_CLOCK和00分频
     HWREG(ADC_CFG1_BASE +ADC_NUM*(0X1000))|=ADC_CFG1_MODE(accuracy)|ADC_CFG1_ADLSMP_MASK;//精度选择以及长时间采样保证精度
     HWREG(ADC_CFG2_BASE+ADC_NUM*(0X1000))|=mux_channel<<4;
     HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))|=ADC_SC1_ADCH(channal);
 }
void ADC_channal(uint32 ADC_NUM,uint8 channal)
 {
     HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))|=ADC_SC1_ADCH(channal);
 }
//返回ADC状态值
uint8 ADC_S_A(uint32 ADC_NUM)
 {
     return (uint8)((HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))>>7)&(0X01));
 }
//取ADC_A转换后的值
void ADC_VALUE_A(uint32 ADC_NUM,uint16 *value)
 {
     *value=HWREG(ADC_RA_BASE+ADC_NUM*(0X1000));
      HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))&=~(ADC_SC1_COCO_MASK);
     //清除标志 
 }

//***************************************************************
//关闭ADC，选择通道11111关闭
void ADC_Disable_A(uint32 ADC_NUM)
 {
     HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))|=ADC_SC1_ADCH_MASK;
 }

//***************************************************************

//****************************************************************
//简介：硬件平均功能,测试：若采用软件触发，使用此功能或者连续转换，效果会变差，数据不稳定
//      软件触发建议采用单次触发模式
//参数：ADC_NUM:ADC0~3
//      samples_num:sample_4，sample_8,sample_16,sample_32
//****************************************************************

void HardWare_ave(uint32 ADC_NUM,char samples_num)
 {
     HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=ADC_SC3_AVGE_MASK;
     HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=(uint32)samples_num;
 }

//****************************************************************
//简介：配置硬件触发AD时钟
//参数：ADC_NUM:ADC0~3
//      triggle_mode：PDB_Trigger，Alternate_Trigger
//      Pre_trigger：Pre_A，Pre_B
//      trigger_select:可以配置成PIT ,FTM等，
//      具体看ADC.h定义,只有Alternate_Trigger模式才有用
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
     HWREG(ADC_SC2_BASE+ADC_NUM*(0X1000))|=ADC_SC2_ADTRG_MASK;//设置成硬件触发
 }
//***************************************************************
//硬件触发设置：
//trigger_mode:选择Trigger_once，Trigger_always
//sample_ave：Sample_4，Sample_8，Sample_16，Sample_32
//***************************************************************
void ADCHardWare_configure(uint32 ADC_NUM,uint32 trigger_mode,char sample_ave)
 {
     HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=ADC_SC3_AVGE_MASK;
     if(trigger_mode) 
          HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=ADC_SC3_ADCO_MASK;
     HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=sample_ave;
 }
//****************************************************************************
//设置ADC转换速度和长采样时间
//参数：
//      speed:HIGH_SPEED,NORMAL_SPEED
//      sample_time:ADCK_24,ADCK_16,ADCK_10,ADCK_6
//****************************************************************************
void ADC_Speed(uint32 ADC_NUM,char speed,char sample_time)
 {
     HWREG(ADC_CFG2_BASE +ADC_NUM*(0X1000))&=~(ADC_CFG2_ADHSC_MASK|ADC_CFG2_ADLSTS_MASK);
     HWREG(ADC_CFG2_BASE +ADC_NUM*(0X1000))|=(uint32)((speed<<2)|(sample_time));
 }

//*****************************************************************************
//简介：差分模式AD采样,只采用A,长采样时间
//参数：channel:DAD0~4
//      accuracy:bite9  11  13  16
//*************************************************************************
void ADC_DIFF_A(uint32 ADC_NUM,uint32 channel,char accuracy)
 {
     HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))&=~ADC_SC1_ADCH_MASK;
     HWREG(ADC_CFG1_BASE+ADC_NUM*(0X1000))|=ADC_CFG1_ADLSMP_MASK|ADC_CFG1_MODE(accuracy);
     HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))|=ADC_SC1_DIFF_MASK|ADC_SC1_ADCH(channel);
 }