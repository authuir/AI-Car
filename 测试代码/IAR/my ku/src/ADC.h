#ifndef __ADC_H__
#define __ADC_H__

#define ADC0 0
#define ADC1 128
#define ADC2 1
#define ADC3 129

#define ADC_SC1A_BASE 0X4003B000
#define ADC_SC1B_BASE 0X4003B004
#define ADC_CFG1_BASE 0X4003B008
#define ADC_CFG2_BASE 0X4003B00C
#define ADC_RA_BASE   0X4003B010
#define ADC_RB_BASE   0X4003B014

#define ADC_CV1_BASE  0X4003B018
#define ADC_CV2_BASE  0X4003B01C

#define ADC_SC2_BASE  0X4003B020
#define ADC_SC3_BASE  0X4003B024
//DIFF=0时位数选择
#define bite_8        0
#define bite_12        1
#define bite_10        2
#define bite_16        3
//DIFF=1时位数选择
#define bite_9        0
#define bite_13        1
#define bite_11        2
#define bite_16        3

//硬件平均功能sample选择
#define Sample_4      0
#define Sample_8      1
#define Sample_16     2
#define Sample_32     3
//输入触发引脚选择 DIFF=0
#define DADP0         0
#define DADP1         1
#define DADP2         2
#define DADP3         3
#define AD4           4
#define AD5           5
#define AD6           6
#define AD7           7
#define AD8           8
#define AD9           9
#define AD10          10
#define AD11          11
#define AD12          12
#define AD13          13
#define AD14          14
#define AD15          15
#define AD16          16
#define AD17          17
#define AD18          18
#define AD19          19
#define AD20          20
#define AD21          21
#define AD22          22
#define AD23          23  

//输入差分形式DIFF=1
#define DAD0          0
#define DAD1          1
#define DAD2          2
#define DAD3          3

//触发选择：
#define Trigger_once    0
#define Trigger_always  1    

//硬件出发设置参数：
//1,触发选择PDB或选择Alternate trigger for ADC
#define PDB_Trigger       0
#define Alternate_Trigger 1
//2,触发通道选择
#define Pre_A         0
#define Pre_B         1
//若为Alternate 触发(trigger_select)
#define External_Trigger 0
#define HIGH_SPEED_COM0  1
#define HIGH_SPEED_COM1  2
#define HIGH_SPEED_COM2  3
#define PIT0_Trigger     4
#define PIT1_Trigger     5
#define PIT2_Trigger     6
#define PIT3_Trigger     7
#define FTM0_Trigger     8
#define FTM1_Trigger     9
#define FTM2_Trigger     10
#define FTM3_Trigger     11
#define RTC_alarm        12
#define RTC_seconds      13
#define LOW_POWER        14
#define HIGH_SPEED_COM3  15

//mux_channel
#define channal_a        0
#define channal_b        1

//Clock_select
#define Bus_clock        0
#define Bus_clock_Div2   1
#define ALternate_clock  2
#define Asyn_clock       3

//Clock_Divide
#define DIV_1            0
#define DIV_2            1
#define DIV_4            2
#define DIV_8            3
//speed configure
#define HIGH_SPEED       1
#define NORMAL_SPEED     0

//sample_time select 
#define ADCK_24          0
#define ADCK_16          1
#define ADCK_10          2
#define ADCK_6           3
//*************************************
//简介：使能ADC时钟
//参数：ADC_NUM：ADC0~3
//*************************************
void ADC_Enable(uint32 ADC_NUM);
//******************************************************************
//函数简介：ADC软件触发:软件触发只能触发一次，不能设定成连续触发
//软件触发方式，只有SC1A可以用，SC1B-N不可以用，
//建议软件出发只使用A,硬件出发仅使用B，本代码采用设计
//默认设定的long_sample_time可修改
//参数：ADC_NUM:ADC0~3
//      channel:0-24
//      accuracy:bite_8~16
//********************************************************************
void ADCINIT_A(uint32 ADC_NUM,uint32 mux_channel,uint8 channal,uint8 accuracy);
void ADC_channal(uint32 ADC_NUM,uint8 channal);
//返回ADC状态值
uint8 ADC_S_A(uint32 ADC_NUM);
uint8 ADC_S_B(uint32 ADC_NUM);
//取ADC转换后的值，函数内部清除标志
void ADC_VALUE_A(uint32 ADC_NUM,uint16 *value);
void ADC_VALUE_B(uint32 ADC_NUM,uint16 *value);
//关闭ADC，选择通道11111关闭
void ADC_Disable_A(uint32 ADC_NUM);
void ADC_Disable_B(uint32 ADC_NUM);

//****************************************************************
//简介：硬件平均功能
//参数：ADC_NUM:ADC0~3
//      samples_num:sample_4，sample_8,sample_16,sample_32
//****************************************************************
void HardWare_ave(uint32 ADC_NUM,char samples_num);

//****************************************************************
//简介：配置硬件触发AD
//参数：ADC_NUM:ADC0~3
//      triggle_mode：PDB_Trigger，Alternate_Trigger
//      Pre_trigger：Pre_A，Pre_B
//      trigger_select:可以配置成PIT ,FTM等，
//      具体看ADC.h定义,只有Alternate_Trigger模式才有用
//***************************************************************
void ADCHardWare_INIT(uint32 ADC_NUM,char trigger_mode,char Pre_trigger,uint32 trigger_select);

//***************************************************************
//简介：配置b通道参数
//***************************************************************
void ADCINIT_B(uint32 ADC_NUM,uint32 channel,uint8 accuracy);

//***************************************************************
//硬件触发设置：
//trigger_mode:选择Trigger_once，Trigger_always
//sample_ave：Sample_4，Sample_8，Sample_16，Sample_32
//***************************************************************
void ADCHardWare_configure(uint32 ADC_NUM,uint32 trigger_mode,char sample_ave);

//****************************************************************************
//设置ADC转换速度和长采样时间
//参数：
//      speed:HIGH_SPEED,NORMAL_SPEED
//      sample_time:ADCK_24,ADCK_16,ADCK_10,ADCK_6
//****************************************************************************
void ADC_Speed(uint32 ADC_NUM,char speed,char sample_time);

//*****************************************************************************
//简介：差分模式AD采样,只采用A,长采样时间
//参数：channel:DAD0~4
//      accuracy:bite9  11  13  16
//*************************************************************************
void ADC_DIFF_A(uint32 ADC_NUM,uint32 channel,char accuracy);   //??
#endif