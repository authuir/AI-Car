#ifndef __DAC_H__
#define __DAC_H__
#define DAC0 0
#define DAC1 1

#define DAC_C0_BASE 0X400CC021
#define DAC_C1_BASE 0X400CC022
#define DAC_C2_BASE 0X400CC023

#define DAC_DATL_BASE 0X400CC000
#define DAC_DATH_BASE 0x400cc001

//*****************************************************
//DAC初始化函数
//参数：DAC0.DAC1
//*****************************************************
void DAC_INIT(uint32 DAC_NUM);

//*********************************************************
//输出电压函数   毫伏为单位
//*********************************************************
void DAC_OUT(uint32 DAC_NUM,uint16 mv);



#endif