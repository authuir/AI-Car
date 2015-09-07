#ifndef __DMA_H__
#define __DMA_H__

#include"all.h"

#define DMA_Normal_Mode		0x00u
#define DMA_Periodic_Mode   0x40u//DMAMUX_CHCFG_TRIG_MASK//只有通道0~3有周期触发模式

#define DMA_DCHPRIn_BASE 40008100



//寄存器定义
#define DMA_TCD_CSR_OFF 0X101C   
#define DMA_SERQ_BASE   0X4000801B
#define DMA_CERQ_BASE   0X4000801A



#define DMA_MAJOR	2
#define DMA_HALF	4

#define DMAMUX0	0
#define DMAMUX1	1

#define DMA_8BIT    0
#define DMA_16BIT   1
#define DMA_32BIT   2
#define DMA_16BYTE  4

#define DMA_CH0     0
#define DMA_CH1     1
#define DMA_CH2     2
#define DMA_CH3     3
#define DMA_CH4     4
#define DMA_CH5     5
#define DMA_CH6     6
#define DMA_CH7     7
#define DMA_CH8     8
#define DMA_CH9     9
#define DMA_CH10    10
#define DMA_CH11    11
#define DMA_CH12    12
#define DMA_CH13    13
#define DMA_CH14    14
#define DMA_CH15    15
#define DMA_CH16    16
#define DMA_CH17    17
#define DMA_CH18    18
#define DMA_CH19    19
#define DMA_CH20    20 
#define DMA_CH21    21
#define DMA_CH22    22
#define DMA_CH23    23 
#define DMA_CH24    24
#define DMA_CH25    25
#define DMA_CH26    26
#define DMA_CH27    27
#define DMA_CH28    28
#define DMA_CH29    29
#define DMA_CH30    30
#define DMA_CH31    31

#define Src_Reserved 1
#define Src_UART0_R	 2
#define Src_UART0_T	 3
#define Src_UART1_R	 4
#define Src_UART1_T	 5
#define Src_UART2_R	 6
#define Src_UART2_T	 7
#define Src_UART3_R	 8
#define Src_UART3_T	 9
#define Src_UART4_R	 10
#define Src_UART4_T	 11
#define Src_UART5_R	 12
#define Src_UART5_T	 13

#define Src_I2S0_R	 14
#define Src_I2S0_T   15

#define Src_SPI0_R	 16
#define Src_SPI0_T	 17
#define Src_SPI1_R	 18
#define Src_SPI1_T	 19

#define Src_CH0_FTM0 24
#define Src_CH1_FTM0 25
#define Src_CH2_FTM0 26
#define Src_CH3_FTM0 27
#define Src_CH4_FTM0 28
#define Src_CH5_FTM0 29
#define Src_CH6_FTM0 30
#define Src_CH7_FTM0 31
#define Src_CH0_FTM1 32
#define Src_CH1_FTM1 33
#define Src_CH0_FTM2 34
#define Src_CH1_FTM2 35
#define Src_CH0_FTM3 36
#define Src_CH1_FTM3 37
#define Src_CH2_FTM3 38
#define Src_CH3_FTM3 39

#define Src_ADC0     40
#define Src_ADC1     41
#define Src_CMP0     42
#define Src_CMP1     43
#define Src_CMP2     44
#define Src_DAC0     45
#define Src_DAC1     46
#define Src_CMT      47    
#define Src_PDB      48

#define Src_PORTA    49
#define Src_PORTB    50
#define Src_PORTC    51
#define Src_PORTD    52
#define Src_PORTE    53

#define Src_CH4_FTM3 54
#define Src_CH5_FTM3 55
#define Src_CH6_FTM3 56
#define Src_CH7_FTM3 57

#define Src_ALWAYS_58 58
#define Src_ALWAYS_59 59   
#define Src_ALWAYS_60 60   
#define Src_ALWAYS_61 61   
#define Src_ALWAYS_62 62   
#define Src_ALWAYS_63 63   
//void DMA_Init_new(uint8 DMAMUXx, uint8 CHx, uint8 TriggerSource,uint16 majorLoop,uint16 minorLoop,uint8 TrggerSourceMode);
//void DMA_Source_new(uint8 CHx, uint32 Src_Addr,int32 Src_AddrOffset, uint32 Src_DataSize, int32 Adjust_Src_Addr);
//void DMA_Destination_new(uint8 CHx, uint32 Dest_Addr,int32 Dest_Addr_Offset, uint32 Dest_DataSize, int32 Adjust_Dest_Addr);
//void DMA_Enable_new(uint8 DMAMUXx,uint8 CHx);
//void DMA_Disable_new(uint8 DMAMUXx,uint8 CHx);
//void DMA_SetDestAddress(uint8 CHx,uint32 address);
//void DMA_SetSourceAddress(uint8 CHx,uint32 address);


extern void DMA_Clear_Int(uint8 CHx);
extern void DMA_Init(uint8 DMAMUXx, uint8 CHx, uint32 Source,uint8 Mode);
extern void DMA_Source(uint8 CHx, uint32 Src_Addr,int32 Src_AddrOffset, uint32 Src_DataSize, int32 Reset_Src_Addr);
extern void DMA_Destination(uint8 CHx, uint32 Dest_Addr,int32 Dest_Addr_Offset, uint32 Dest_DataSize, int32 Reset_Dest_Addr);
extern void DMA_Int_Enable(uint8 CHx, uint32 Int_Type);
extern void DMA_Int_Disable(uint8 CHx);
extern void DMA_AutoClose_Enable(uint8 CHx);
extern void DMA_AutoClose_Disable(uint8 CHx);
extern void DMA_Major_Loop_Num(uint8 CHx, uint16 Cycles);
extern void DMA_Minor_Bytes(uint8 CHx, uint16 Bytes);
extern void DMA_Software_Initiate(uint8 CHx);
extern void DMA_Enable();
extern void DMA_Disable();
extern void DMA_Channal_Enable(uint8 CHx);
extern void DMA_Channal_Disable(uint8 CHx);

extern void DMA_Debug_Enable(uint8 CHx);
extern void DMA_Debug_Disable(uint8 CHx);
extern void DMA_Set_Group_Priority(uint8 CHx, uint8 Group0_Priority, uint8 Group1_Priority);
extern void DMA_Set_Channel_Priority(uint8 CHx, uint8 Priority);
extern uint8 DMA_Get_Channel_Priority(uint8 CHx);
extern uint8 DMA_Get_Group_Priority(uint8 CHx);
//extern 
#endif
