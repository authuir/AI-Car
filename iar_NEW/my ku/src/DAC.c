#include "all.h"

//*****************************************************
//DAC初始化函数
//参数：DAC0.DAC1
//*****************************************************
void DAC_INIT(uint32 DAC_NUM)
 {
     SIM_SCGC2|=(uint32)1<<(DAC_NUM+12);
     HWREG8(DAC_C0_BASE+DAC_NUM*(0X1000))|=
         DAC_C0_DACEN_MASK
          |DAC_C0_DACRFS_MASK|DAC_C0_DACTRGSEL_MASK;
     HWREG8(DAC_C2_BASE +DAC_NUM*(0X1000))=(uint32)(0|DAC_C2_DACBFRP(0));
     HWREG8(DAC_DATL_BASE+DAC_NUM*(0X1000))=0;
     HWREG8(DAC_DATH_BASE+DAC_NUM*(0X1000))=0;
 }

//*********************************************************
//输出电压函数   毫伏为单位
//*********************************************************
void DAC_OUT(uint32 DAC_NUM,uint16 mv)
 {
     uint16 value=0;
     value=mv*4096/3300;
     HWREG8(DAC_DATH_BASE+DAC_NUM*(0X1000))=value>>8;
     HWREG8(DAC_DATL_BASE+DAC_NUM*(0X1000))=value&0xff;
 }