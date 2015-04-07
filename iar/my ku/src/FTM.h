/*
 * AI_FTM_PWM.h
 *
 *  Created on: Sep 26, 2014
 *      Author: Administrator
 */

#ifndef _FTM_H_
#define _FTM_H_

#include"all.h"
/***************************0~7用于switch,8~11用于判断是哪个通道CHx,12~15用于判断是哪个模块FTMx*********************************************/
#define FTM0_CH0_PTC1   0X0000     //PTC1、PTA3            PTA3不要用（与Jtag、SWD冲突）
#define FTM0_CH0_PTA3   0X0001    
#define FTM0_CH1_PTA4   0X0102    //PTC2、PTA4
#define FTM0_CH1_PTC2   0X0103   
#define FTM0_CH2_PTA5   0x0204    //PTC3、PTA5
#define FTM0_CH2_PTC3   0x0205    
#define FTM0_CH3_PTA6   0x0306    //PTC4、PTA6
#define FTM0_CH3_PTC4   0x0307   
#define FTM0_CH4_PTA7   0x0408    //PTD4、PTA7
#define FTM0_CH4_PTD4   0x0409  
#define FTM0_CH5_PTD5   0x050a   //PTD5、PTA0            PTA0不要用（与Jtag、SWD冲突）
#define FTM0_CH5_PTA0   0x050b  
#define FTM0_CH6_PTD6   0x060c   //PTD6、PTA1            PTA1不要用（与Jtag冲突）
#define FTM0_CH6_PTA1   0x060d  
#define FTM0_CH7_PTD7   0x070e   //PTD7、PTA2            PTA2不要用（与Jtag冲突）
#define FTM0_CH7_PTA2   0x070f 
//      模块通道    端口          可选范围              建议
#define FTM1_CH0_PTA12  0x1010     //PTA8、PTA12、PTB0
#define FTM1_CH0_PTA8   0x1011     
#define FTM1_CH0_PTB0   0x1012   
#define FTM1_CH1_PTA13  0x1113     //PTA9、PTA13、PTB1
#define FTM1_CH1_PTA9   0x1114   
#define FTM1_CH1_PTB1   0x1115   
//      模块通道    端口          可选范围              建议
#define FTM2_CH0_PTA10  0x2016   //PTA10、PTB18
#define FTM2_CH0_PTB18	0x2017   
#define FTM2_CH1_PTA11  0x2118   //PTA11、PTB19
#define FTM2_CH1_PTB19  0x2119  
//      模块通道    端口          可选范围              建议
#define FTM3_CH0_PTD0  	0x301a  	//ALT4
#define FTM3_CH1_PTD1   0x311b  	//ALT4
#define FTM3_CH2_PTD2   0x321c  	//ALT4
#define FTM3_CH3_PTD3   0x331d    	//ALT4
#define FTM3_CH4_PTC8   0x341e    	//ALT3
#define FTM3_CH5_PTC9   0x351f    	//ALT3
#define FTM3_CH6_PTC10  0x3620    	//ALT3
#define FTM3_CH7_PTC11  0x3721    	//ALT3
#define FTM3_CH0_PTE5   0x3022  	//ALT6
#define FTM3_CH1_PTE6   0x3123  	//ALT6
#define FTM3_CH2_PTE7   0x3224 		//ALT6
#define FTM3_CH3_PTE8   0x3325    	//ALT6
#define FTM3_CH4_PTE9   0x3426    	//ALT6
#define FTM3_CH5_PTE10  0x3527    	//ALT6
#define FTM3_CH6_PTE11  0x3628    	//ALT6
#define FTM3_CH7_PTE12  0x3729    	//ALT6

/*****************************************************************************/

//正交解码模块通道  端口          可选范围              建议
#define FTM1_QDPHA  PTA12       //PTA8、PTA12、PTB0
#define FTM1_QDPHB  PTA13       //PTA9、PTA13、PTB1
#define FTM2_QDPHA  PTA10       //PTA10、PTB18
#define FTM2_QDPHB  PTA11       //PTA11、PTB19

#define EPWM_MODE 1
#define CPWM_MODE 2
   
//定义FTM模块号
typedef enum
{
    FTM0,
    FTM1,
    FTM2,
    FTM3,
    FTM_MAX,
} FTMn_e;

//定义FTM 通道号
typedef enum
{

    FTM_CH0,
    FTM_CH1,
    FTM_CH2,
    FTM_CH3,
    FTM_CH4,
    FTM_CH5,
    FTM_CH6,
    FTM_CH7,

} FTM_CHn_e;

/*********************** 输入捕捉 **************************/
//FTM 输入捕捉配置
typedef enum
{
    FTM_Rising,               //上升沿捕捉
    FTM_Falling,              //下降沿捕捉
    FTM_Rising_or_Falling     //跳变沿捕捉
} FTM_Input_cfg;

/*********************** PWM **************************/

//PWM频率做不高.因为频率越高,精度就越低,也就是说单位时间占PWM周期的比例越大.
//而精度越高,PWM的频率就越低.所以很难做到精度高,且PWM频率高
//若 CPWMS = 1 ，即双边捕捉脉冲，则精度可以做高,因为mod的值可以填大一点,因为bus频率 要除以2
extern void FTM_PWM_Init(uint8 Mode, uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty);
extern void FTM_PWM_Set_Freq(FTMn_e Ftmn, FTM_CHn_e CHx, uint32 Freq);
extern void FTM_PWM_Set_Duty(uint8 Ftmn, uint8 CHx, float Duty);
extern void FTM_IC_Init(uint16 Ftmn_CHx_PTnx, FTM_Input_cfg cfg);
extern void FTM_Ch_Int_Enable(FTMn_e Ftmn, FTM_CHn_e CHx);
extern void FTM_Ch_Int_Dis(FTMn_e Ftmn, FTM_CHn_e CHx);
extern void FTM_EPWM_Init(uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty);
extern void FTM_CPWM_Init(uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty);
extern void FTM_EPWM_Set_Freq(FTMn_e Ftmn, FTM_CHn_e CHx, uint32 Freq);
extern void FTM_CPWM_Set_Freq(FTMn_e Ftmn, FTM_CHn_e CHx, uint32 Freq);
extern void FTM_TimeOut_Int_Enable(FTMn_e Ftmn, FTM_CHn_e CHx);
extern void FTM_TimeOut_Int_Disable(FTMn_e Ftmn, FTM_CHn_e CHx);
extern void FTM_Clear_TimeOut(uint8 Ftmn);
extern void FTM_Clear_Channal_Event(uint8 Ftmn, uint8 CHx);
#endif /* AI_FTM_PWM_H_ */
