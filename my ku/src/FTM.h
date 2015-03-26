/*
 * AI_FTM_PWM.h
 *
 *  Created on: Sep 26, 2014
 *      Author: Administrator
 */

#ifndef _FTM_H_
#define _FTM_H_

#include"all.h"
/***************************0~7����switch,8~11�����ж����ĸ�ͨ��CHx,12~15�����ж����ĸ�ģ��FTMx*********************************************/
#define FTM0_CH0_PTC1   0X0000     //PTC1��PTA3            PTA3��Ҫ�ã���Jtag��SWD��ͻ��
#define FTM0_CH0_PTA3   0X0001    
#define FTM0_CH1_PTA4   0X0102    //PTC2��PTA4
#define FTM0_CH1_PTC2   0X0103   
#define FTM0_CH2_PTA5   0x0204    //PTC3��PTA5
#define FTM0_CH2_PTC3   0x0205    
#define FTM0_CH3_PTA6   0x0306    //PTC4��PTA6
#define FTM0_CH3_PTC4   0x0307   
#define FTM0_CH4_PTA7   0x0408    //PTD4��PTA7
#define FTM0_CH4_PTD4   0x0409  
#define FTM0_CH5_PTD5   0x050a   //PTD5��PTA0            PTA0��Ҫ�ã���Jtag��SWD��ͻ��
#define FTM0_CH5_PTA0   0x050b  
#define FTM0_CH6_PTD6   0x060c   //PTD6��PTA1            PTA1��Ҫ�ã���Jtag��ͻ��
#define FTM0_CH6_PTA1   0x060d  
#define FTM0_CH7_PTD7   0x070e   //PTD7��PTA2            PTA2��Ҫ�ã���Jtag��ͻ��
#define FTM0_CH7_PTA2   0x070f 
//      ģ��ͨ��    �˿�          ��ѡ��Χ              ����
#define FTM1_CH0_PTA12  0x1010     //PTA8��PTA12��PTB0
#define FTM1_CH0_PTA8   0x1011     
#define FTM1_CH0_PTB0   0x1012   
#define FTM1_CH1_PTA13  0x1113     //PTA9��PTA13��PTB1
#define FTM1_CH1_PTA9   0x1114   
#define FTM1_CH1_PTB1   0x1115   
//      ģ��ͨ��    �˿�          ��ѡ��Χ              ����
#define FTM2_CH0_PTA10  0x2016   //PTA10��PTB18
#define FTM2_CH0_PTB18	0x2017   
#define FTM2_CH1_PTA11  0x2118   //PTA11��PTB19
#define FTM2_CH1_PTB19  0x2119  
//      ģ��ͨ��    �˿�          ��ѡ��Χ              ����
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

//��������ģ��ͨ��  �˿�          ��ѡ��Χ              ����
#define FTM1_QDPHA  PTA12       //PTA8��PTA12��PTB0
#define FTM1_QDPHB  PTA13       //PTA9��PTA13��PTB1
#define FTM2_QDPHA  PTA10       //PTA10��PTB18
#define FTM2_QDPHB  PTA11       //PTA11��PTB19

#define EPWM_MODE 1
#define CPWM_MODE 2
   
//����FTMģ���
typedef enum
{
    FTM0,
    FTM1,
    FTM2,
    FTM3,
    FTM_MAX,
} FTMn_e;

//����FTM ͨ����
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

/*********************** ���벶׽ **************************/
//FTM ���벶׽����
typedef enum
{
    FTM_Rising,               //�����ز�׽
    FTM_Falling,              //�½��ز�׽
    FTM_Rising_or_Falling     //�����ز�׽
} FTM_Input_cfg;

/*********************** PWM **************************/

//PWMƵ��������.��ΪƵ��Խ��,���Ⱦ�Խ��,Ҳ����˵��λʱ��ռPWM���ڵı���Խ��.
//������Խ��,PWM��Ƶ�ʾ�Խ��.���Ժ����������ȸ�,��PWMƵ�ʸ�
//�� CPWMS = 1 ����˫�߲�׽���壬�򾫶ȿ�������,��Ϊmod��ֵ�������һ��,��ΪbusƵ�� Ҫ����2
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
