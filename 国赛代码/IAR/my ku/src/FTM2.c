#include "all.h"
#if 0
void FTM_PWM_Init(uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty)
 {
     uint16 Ftmn = 4,CHx = 8, PS = 0, mod = 0;
     uint32 FTM_NUM=0;
    double temp = 0;
    switch(Ftmn_CHx_PTnx & 0xF000) //写保护禁止 
    	{
    		case 0x0000:Ftmn = 0;FTM_NUM=FTM0;SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;FTM0_MODE |= FTM_MODE_WPDIS_MASK;break;
    		case 0x1000:Ftmn = 1;FTM_NUM=FTM1;SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;FTM1_MODE |= FTM_MODE_WPDIS_MASK;break;
    		case 0x2000:Ftmn = 2;FTM_NUM=FTM2;SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;FTM2_MODE |= FTM_MODE_WPDIS_MASK;break;
    		case 0x3000:Ftmn = 3;FTM_NUM=FTM3;SIM_SCGC3 |= SIM_SCGC3_FTM3_MASK;FTM3_MODE |= FTM_MODE_WPDIS_MASK;break;
    	}
    	switch(Ftmn_CHx_PTnx & 0x0F00)
    	{
    		case 0x0000:CHx = 0;break;
    		case 0x0100:CHx = 1;break;
    		case 0x0200:CHx = 2;break;
    		case 0x0300:CHx = 3;break;
    		case 0x0400:CHx = 4;break;
    		case 0x0500:CHx = 5;break;
    		case 0x0600:CHx = 6;break;
    		case 0x0700:CHx = 7;break;
    	}	
    	switch(Ftmn_CHx_PTnx & 0x00FF)
    	{
    	case 0 :PORT_Enable(PORTC);PORT_Configuer(PORTC, 1,  4);break;
    	case 1 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 3,  3);break;
    	case 2 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 4,  3);break;
    	case 3 :PORT_Enable(PORTC);PORT_Configuer(PORTC, 2,  4);break;
    	case 4 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 5,  3);break;
    	case 5 :PORT_Enable(PORTC);PORT_Configuer(PORTC, 3,  4);break;
    	case 6 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 6,  3);break;
    	case 7 :PORT_Enable(PORTC);PORT_Configuer(PORTC, 4,  4);break;
    	case 8 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 7,  3);break;
    	case 9 :PORT_Enable(PORTD);PORT_Configuer(PORTD, 4,  4);break;
    	case 10:PORT_Enable(PORTD);PORT_Configuer(PORTD, 5,  4);break;
    	case 11:PORT_Enable(PORTA);PORT_Configuer(PORTA, 0,  3);break;
    	case 12:PORT_Enable(PORTD);PORT_Configuer(PORTD, 6,  4);break;
    	case 13:PORT_Enable(PORTA);PORT_Configuer(PORTA, 1,  3);break;
    	case 14:PORT_Enable(PORTD);PORT_Configuer(PORTD, 7,  4);break;
    	case 15:PORT_Enable(PORTA);PORT_Configuer(PORTA, 2,  3);break;		
    	case 16:PORT_Enable(PORTA);PORT_Configuer(PORTA, 12, 3);break;
    	case 17:PORT_Enable(PORTA);PORT_Configuer(PORTA, 8,  3);break;
    	case 18:PORT_Enable(PORTB);PORT_Configuer(PORTB, 0,  3);break;
    	case 19:PORT_Enable(PORTA);PORT_Configuer(PORTA, 13, 3);break;
    	case 20:PORT_Enable(PORTA);PORT_Configuer(PORTA, 9,  3);break;
    	case 21:PORT_Enable(PORTB);PORT_Configuer(PORTB, 1,  3);break;
    	case 22:PORT_Enable(PORTA);PORT_Configuer(PORTA, 10, 3);break;
    	case 23:PORT_Enable(PORTB);PORT_Configuer(PORTB, 18, 3);break;
    	case 24:PORT_Enable(PORTA);PORT_Configuer(PORTA, 11, 3);break;
    	case 25:PORT_Enable(PORTB);PORT_Configuer(PORTB, 19, 3);break;
    	case 26:PORT_Enable(PORTD);PORT_Configuer(PORTD, 0,  4);break;
    	case 27:PORT_Enable(PORTD);PORT_Configuer(PORTD, 1,  4);break;
    	case 28:PORT_Enable(PORTD);PORT_Configuer(PORTD, 2,  4);break;
    	case 29:PORT_Enable(PORTD);PORT_Configuer(PORTD, 3,  4);break;
    	case 30:PORT_Enable(PORTC);PORT_Configuer(PORTC, 8,  3);break;
    	case 31:PORT_Enable(PORTC);PORT_Configuer(PORTC, 9,  3);break;
    	case 32:PORT_Enable(PORTC);PORT_Configuer(PORTC, 10, 3);break;
    	case 33:PORT_Enable(PORTC);PORT_Configuer(PORTC, 11, 3);break;
    	case 34:PORT_Enable(PORTE);PORT_Configuer(PORTE, 5,  6);break;
    	case 35:PORT_Enable(PORTE);PORT_Configuer(PORTE, 6,  6);break;
    	case 36:PORT_Enable(PORTE);PORT_Configuer(PORTE, 7,  6);break;
    	case 37:PORT_Enable(PORTE);PORT_Configuer(PORTE, 8,  6);break;
    	case 38:PORT_Enable(PORTE);PORT_Configuer(PORTE, 9,  6);break;
    	case 39:PORT_Enable(PORTE);PORT_Configuer(PORTE, 10, 6);break;
    	case 40:PORT_Enable(PORTE);PORT_Configuer(PORTE, 11, 6);break;
    	case 41:PORT_Enable(PORTE);PORT_Configuer(PORTE, 12, 6);break;
    	}
	if(Freq >= BUS_CLK/0xFFFF*105/100)
		PS = 0;
	else if(Freq >= BUS_CLK/0xFFFF*105/100/2)
		PS = 1;
	else if(Freq >= BUS_CLK/0xFFFF*105/100/4)
		PS = 2;
	else if(Freq >= BUS_CLK/0xFFFF*105/100/8)
		PS = 3;
	else if(Freq >= BUS_CLK/0xFFFF*105/100/16)
		PS = 4;
	else if(Freq >= BUS_CLK/0xFFFF*105/100/32)
		PS = 5;
	else if(Freq >= BUS_CLK/0xFFFF*105/100/64)
		PS = 6;
	else if(Freq >= BUS_CLK/0xFFFF*105/100/128)
		PS = 7;
    
         HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx)&= ~FTM_CnSC_ELSA_MASK;
         HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx)|= FTM_CnSC_MSB_MASK | FTM_CnSC_ELSB_MASK;
         HWREG(FTM_SC_BASE+FTM_NUM*FTM_OFFSET)&= ~FTM_SC_CPWMS_MASK;//选择边沿对齐,
        HWREG(FTM_SC_BASE+FTM_NUM*FTM_OFFSET)|= (FTM_SC_PS(PS)|FTM_SC_CLKS(1) ); 
        temp = (double)(BUS_CLK)/Freq;
        mod = (uint16)(temp / (1<<PS) +0.5);
        HWREG(FTM_MOD_BASE+FTM_NUM*FTM_OFFSET)=mod-1;
        HWREG(FTM_CNTIN_BASE+FTM_NUM*FTM_OFFSET)=0;
        HWREG(FTM_CnV_BASE+FTM_NUM*FTM_OFFSET+ch_offset*CHx)=(uint16)((float)(mod)*Duty + 0.1+0.5-1);
         HWREG(FTM_CNT_BASE+FTM_NUM*FTM_OFFSET)=1;
 }

void FTM_PWM_Set_Duty(uint8 Ftmn, uint8 CHx, float Duty)
{
	uint32 mod = 0;
	mod =  HWREG(FTM_MOD_BASE+FTM_NUM*FTM_OFFSET);
	HWREG(FTM_CnV_BASE+FTM_NUM*FTM_OFFSET+ch_offset*CHx)=(uint16)((float)(mod)*Duty-0.5);
}	

void FTM_IC_Init(uint16 Ftmn_CHx_PTnx, FTM_Input_cfg cfg)
{

        uint32 Ftmn,CHx;
        uint32 FTM_NUM=0;
        switch(Ftmn_CHx_PTnx & 0xF000) //写保护禁止 
            	{
            		case 0x0000:Ftmn = 0;FTM_NUM=0;SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;FTM0_MODE |= FTM_MODE_WPDIS_MASK;break;
            		case 0x1000:Ftmn = 1;FTM_NUM=1;SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;FTM1_MODE |= FTM_MODE_WPDIS_MASK;break;
            		case 0x2000:Ftmn = 2;FTM_NUM=2;SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;FTM2_MODE |= FTM_MODE_WPDIS_MASK;break;
            		case 0x3000:Ftmn = 3;FTM_NUM=3;SIM_SCGC3 |= SIM_SCGC3_FTM3_MASK;FTM3_MODE |= FTM_MODE_WPDIS_MASK;break;
            	}
            	switch(Ftmn_CHx_PTnx & 0x0F00)
            	{
            		case 0x0000:CHx = 0;break;
            		case 0x0100:CHx = 1;break;
            		case 0x0200:CHx = 2;break;
            		case 0x0300:CHx = 3;break;
            		case 0x0400:CHx = 4;break;
            		case 0x0500:CHx = 5;break;
            		case 0x0600:CHx = 6;break;
            		case 0x0700:CHx = 7;break;
            	}	
            	switch(Ftmn_CHx_PTnx & 0x00FF)
            	{
            	case 0 :PORT_Configuer(PORTC, 1,  4);break;
            	case 1 :PORT_Configuer(PORTA, 3,  3);break;
            	case 2 :PORT_Configuer(PORTA, 4,  3);break;
            	case 3 :PORT_Configuer(PORTC, 2,  4);break;
            	case 4 :PORT_Configuer(PORTA, 5,  3);break;
            	case 5 :PORT_Configuer(PORTC, 3,  4);break;
            	case 6 :PORT_Configuer(PORTA, 6,  3);break;
            	case 7 :PORT_Configuer(PORTC, 4,  4);break;
            	case 8 :PORT_Configuer(PORTA, 7,  3);break;
            	case 9 :PORT_Configuer(PORTD, 4,  4);break;
            	case 10:PORT_Configuer(PORTD, 5,  4);break;
            	case 11:PORT_Configuer(PORTA, 0,  3);break;
            	case 12:PORT_Configuer(PORTD, 6,  4);break;
            	case 13:PORT_Configuer(PORTA, 1,  3);break;
            	case 14:PORT_Configuer(PORTD, 7,  4);break;
            	case 15:PORT_Configuer(PORTA, 2,  3);break;		
            	case 16:PORT_Configuer(PORTA, 12, 3);break;
            	case 17:PORT_Configuer(PORTA, 8,  3);break;
            	case 18:PORT_Configuer(PORTB, 0,  3);break;
            	case 19:PORT_Configuer(PORTA, 13, 3);break;
            	case 20:PORT_Configuer(PORTA, 9,  3);break;
            	case 21:PORT_Configuer(PORTB, 1,  3);break;
            	case 22:PORT_Configuer(PORTA, 10, 3);break;
            	case 23:PORT_Configuer(PORTB, 18, 3);break;
            	case 24:PORT_Configuer(PORTA, 11, 3);break;
            	case 25:PORT_Configuer(PORTB, 19, 3);break;
            	case 26:PORT_Configuer(PORTD, 0,  4);break;
            	case 27:PORT_Configuer(PORTD, 1,  4);break;
            	case 28:PORT_Configuer(PORTD, 2,  4);break;
            	case 29:PORT_Configuer(PORTD, 3,  4);break;
            	case 30:PORT_Configuer(PORTC, 8,  3);break;
            	case 31:PORT_Configuer(PORTC, 9,  3);break;
            	case 32:PORT_Configuer(PORTC, 10, 3);break;
            	case 33:PORT_Configuer(PORTC, 11, 3);break;
            	case 34:PORT_Configuer(PORTE, 5,  6);break;
            	case 35:PORT_Configuer(PORTE, 6,  6);break;
            	case 36:PORT_Configuer(PORTE, 7,  6);break;
            	case 37:PORT_Configuer(PORTE, 8,  6);break;
            	case 38:PORT_Configuer(PORTE, 9,  6);break;
            	case 39:PORT_Configuer(PORTE, 10, 6);break;
            	case 40:PORT_Configuer(PORTE, 11, 6);break;
            	case 41:PORT_Configuer(PORTE, 12, 6);break;
            	}
	/******************* 设置为输入捕捉功能 *******************/
    switch(cfg)
    {
        //输入捕捉模式下：DECAPEN = 0 ， DECAPEN = 0 ，CPWMS = 0， MSnB:MSnA = 0

        // ELSnB:ELSnA         1          10          11
        // 配置             上升沿      下降沿      跳变沿

    case FTM_Rising:    //上升沿触发
        HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx)|=  ( FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK );                   //置1
        HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) &= ~( FTM_CnSC_ELSB_MASK  | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        break;

    case FTM_Falling:   //下降沿触发
        HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) |= (FTM_CnSC_ELSB_MASK  | FTM_CnSC_CHIE_MASK );                    //置1
        HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) &= ~( FTM_CnSC_ELSA_MASK | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        break;

    case FTM_Rising_or_Falling: //上升沿、下降沿都触发
        HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) |=  ( FTM_CnSC_ELSB_MASK | FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK ); //置1
        HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) &= ~( FTM_CnSC_MSB_MASK  | FTM_CnSC_MSA_MASK); //清0
        break;
    }
    HWREG(FTM_SC_BASE+FTM_NUM*FTM_OFFSET)= FTM_SC_CLKS(0x1);       //选择 bus 时钟
    HWREG(FTM_COMBINE_BASE+FTM_NUM*FTM_OFFSET) = 0;
    HWREG(FTM_MODE_BASE+FTM_NUM*FTM_OFFSET)    &= ~FTM_MODE_FTMEN_MASK;    //使能FTM
    HWREG(FTM_CNTIN_BASE+FTM_NUM*FTM_OFFSET)   = 0;
    HWREG(FTM_MOD_BASE+FTM_NUM*FTM_OFFSET) = 0; 
    HWREG(FTM_CNT_BASE+FTM_NUM*FTM_OFFSET)   = 0;//计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
    HWREG(FTM_STATUS_BASE+FTM_NUM*FTM_OFFSET)  = 0x00;               //清中断标志位
}


void FTM_TimeOut_Int_Enable(uint32 FTM_NUM, uint32 CHx)
{
    HWREG(FTM_SC_BASE+FTM_NUM*FTM_OFFSET) |= FTM_SC_TOIE_MASK;  	
    if(FTM_NUM>=128) FTM_NUM=FTM_NUM%126;
    Enable_IRQ(78 + FTM_NUM);
}
void FTM_TimeOut_Int_Disable(uint32 FTM_NUM, uint32 CHx)
{
    HWREG(FTM_SC_BASE+FTM_NUM*FTM_OFFSET )&=~ FTM_SC_TOIE_MASK;  	
    if(FTM_NUM>=128) FTM_NUM=FTM_NUM%126;
    Disable_IRQ(78 + FTM_NUM);
}


void FTM_Ch_Int_Enable(uint32 FTM_NUM, uint32 CHx)
{
	HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) |= FTM_CnSC_CHIE_MASK;
    if(FTM_NUM>=128) FTM_NUM=FTM_NUM%126;
    Enable_IRQ(78 + FTM_NUM);
}
void FTM_Ch_Int_Dis(FTMn_e Ftmn, FTM_CHn_e CHx)
{
	HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) &= ~FTM_CnSC_CHIE_MASK;
	if(FTM_NUM>=128) FTM_NUM=FTM_NUM%126;
    Disable_IRQ(78 + FTM_NUM);
}





#endif