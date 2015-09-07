#include "all.h"


#define BUS_CLK		75000000
#define MCGFFCLK 	48828

FTM_MemMapPtr FTMn[4] = {FTM0_BASE_PTR, FTM1_BASE_PTR, FTM2_BASE_PTR,FTM3_BASE_PTR}; //定义三个指针数组保存 Ftmn_e 的地址

/*************************PWM占空比 = (CnV-CNTIN)/(MOD-CNTIN+1)**************/
/*************************PWM频率 = Bus_CLK / 2^CPWM / 2^PS / Mod************/

/********************************** 高频 *****************************************	
 * 	EPWM(PS=0,CPWM=0)							CPWM(PS=0,CPWM=1)
 * 	Frequency	Mod		Duty			Frequency	Mod		Duty	
 * 	3.75M Hz	20(勉强,波形失真比较严重)		
 * 	...			...
 * 	2.5M Hz  	30(波形失真,勉强接受)                   2M Hz           (理论是18.75,但必须为整数)(波形失真,勉强接受)
 * 	....		...					...		...
 * 	1M Hz		75
 * 	...			...
 * 	757.5K Hz	99					378.78K Hz	99
 * 	
 ********************************** 中高频 **************************************
 *************************** 最理想的PWM频率范围 ********************************
 * 	Mod >= 100
 * 	EPWM(PS=*,CPWM=0)					CPWM(PS=*,CPWM=1)
 * 	Frequency	Duty					Frequency	Duty
 * 	1200~750k	N*1%(100<=Mod<1000)			600~375K	N*1%
 * 	10~1200		N*0.1%					5~600		N*0.1%
 ********************************** 低频 ***************************************** 	
 * 	以上都是以总线时钟为FTM的时钟
 * 	理论上用MCGFFCLK时钟可以做到0.0008Hz,但配置的时候出了点问题,没配出来			
 */
//参数:Mode	EPWM_MODE,CPWM_MODE
void FTM_PWM_Init(uint8 Mode, uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty)
{
	if(Mode == EPWM_MODE)
		FTM_EPWM_Init(Ftmn_CHx_PTnx, Freq, Duty);
	else
		FTM_CPWM_Init(Ftmn_CHx_PTnx, Freq, Duty);
}
void FTM_PWM_Set_Freq(FTMn_e Ftmn, FTM_CHn_e CHx, uint32 Freq)
{
	if((FTM_SC_REG(FTMn[Ftmn]) & FTM_SC_CPWMS_MASK) == FTM_SC_CPWMS_MASK)
		FTM_CPWM_Set_Freq(Ftmn, CHx, Freq);
	else
		FTM_EPWM_Set_Freq(Ftmn, CHx, Freq);
}
/**********************************************************************/
/* 简介:设置EPWM,CPWM的占空比,频率不变
 * 例程:FTM_PWM_Set_Duty(FTM0, FTM_CH0, 0.8);
 * 参数: 	Ftmn:	FTM0~2	
 * 		CHx:	FTM_CH0
 * 		Freq:	范围:
 * 					当PWM为EPWM:	BUS_CLK/0xFFFF/128*105/100~~BUS_CLK/100	
 * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,精度达到1%,剩余的精度达到0.1%
 * 								如果BUS_CLK=75MHz,则9~750 000.  1.2K~750K,精度达到1%,9~1.2K,精度达到0.1%
 * 					当PWM为CPWM:	BUS_CLK/2/0xFFFF/128*105/100~~BUS_CLK/2/100	
 * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,精度达到1%,剩余的精度达到0.1%
 * 								如果BUS_CLK=75MHz,则5~375 000.  0.6K~375K,精度达到1%,9~0.6K,精度达到0.1%
 */
/*********************************************************************/
void FTM_PWM_Set_Duty(uint8 Ftmn, uint8 CHx, float Duty)
{
	uint16 mod = 0;
	do
	{
		mod = FTM_MOD_REG(FTMn[Ftmn]);
	}while(mod == 0);
	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)((float)(mod)*Duty-0.5);
	//FTM_CNT_REG(FTMn[Ftmn])   = 0;                         //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
}	

/***************************** EPWM  ***********************************/
/* 注意:我默认用总线时钟75MHz,如果总线时钟不等于75MHz,则重新算.如果用MCGFLL时钟(48.828kHz),PWM频率可以做更低
 * 简介:初始化EPWM为(边沿对齐)edge-aligned,频率,占空比
 * 例程:FTM_EPWM_Init(FTM0_CH0_PTC1, 10000, 0.5);//频率为10k,占空比为50%的边沿EPWM
 * 参数: 	Ftmn_CHx_PTnx:	放在FTM.h文件
 * 		Freq:			范围:BUS_CLK/0xFFFF/128*105/100~~BUS_CLK/100	
 * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,精度达到1%,剩余的精度达到0.1%
 * 								如果BUS_CLK=75MHz,则9~750 000.  1.2K~750K,精度达到1%,9~1.2K,精度达到0.1%
 * 		Duty:			0~1
 */
/*********************************************************************/
void FTM_EPWM_Init(uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty)
{
	uint16 Ftmn = 4,CHx = 8, PS = 0, mod = 0;
    double temp = 0;
    switch(Ftmn_CHx_PTnx & 0xF000) //写保护禁止 
    	{
    		case 0x0000:Ftmn = 0;SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;FTM0_MODE |= FTM_MODE_WPDIS_MASK;break;
    		case 0x1000:Ftmn = 1;SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;FTM1_MODE |= FTM_MODE_WPDIS_MASK;break;
    		case 0x2000:Ftmn = 2;SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;FTM2_MODE |= FTM_MODE_WPDIS_MASK;break;
    		case 0x3000:Ftmn = 3;SIM_SCGC3 |= SIM_SCGC3_FTM3_MASK;FTM3_MODE |= FTM_MODE_WPDIS_MASK;break;
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
	/******************** 选择输出模式为 边沿对齐EPWM,先高后低 *******************/
	FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~FTM_CnSC_ELSA_MASK;
	FTM_CnSC_REG(FTMn[Ftmn], CHx) |= FTM_CnSC_MSB_MASK | FTM_CnSC_ELSB_MASK;
	// MSnB:MSnA = 1x;CPWMS = 0	边沿对齐PWM
	// ELSnB:ELSnA = 10     	先高后低
	// ELSnB:ELSnA = 11    	 	先低后高
	/******************** 配置时钟和分频 ********************/
	FTM_SC_REG(FTMn[Ftmn]) &= ~FTM_SC_CPWMS_MASK;//选择边沿对齐,
	FTM_SC_REG(FTMn[Ftmn]) |= (FTM_SC_PS(PS)|FTM_SC_CLKS(1) );          
	//分频因子，分频系数 = 2^PS.   时钟选择， 0：没选择时钟，禁用； 1：bus 时钟； 2：MCGFFCLK； 3：EXTCLK（ 由SIM_SOPT4 选择输入管脚 FTM_CLKINx）
	// FTM_SC_TOIE_MASK        //溢出中断使能（注释了表示 禁止溢出中断） 
    temp = (double)(BUS_CLK)/Freq;
    mod = (uint16)(temp / (1<<PS) +0.5);
	//	mod = (uint16)( (((double)(BUS_CLK)/Freq) /(1<<(FTM_SC_REG(FTMn[Ftmn])&FTM_SC_CPWMS_MASK)) / (1<<PS) +0.5) );
	FTM_MOD_REG(FTMn[Ftmn]) = (mod - 1);                        //模数, EPWM的周期为 ：MOD - CNTIN + 0x0001
	FTM_CNTIN_REG(FTMn[Ftmn]) = 0;                          //计数器初始化值。设置脉冲宽度：(CnV - CNTIN).
	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)((float)(mod)*Duty + 0.1+0.5-1);
	FTM_CNT_REG(FTMn[Ftmn])   = 1;                          //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
}
/***************************** CPWM  ***********************************/
/* 注意:我默认用总线时钟75MHz,如果总线时钟不等于75MHz,则重新算.如果用MCGFLL时钟(48.828kHz),PWM频率可以做更低
 * 简介:初始化CPWM为(中间对齐)Center-aligned,频率,占空比
 * 例程:FTM_CPWM_Init(FTM0_CH0_PTC1, 10000, 0.5);//频率为10k,占空比为50%的边沿EPWM
 * 参数: 	Ftmn_CHx_PTnx:	放在FTM.h文件
 * 		Freq:			范围:BUS_CLK/2/0xFFFF/128*105/100~~BUS_CLK/2/100	
 * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,精度达到1%,剩余的精度达到0.1%
 * 								如果BUS_CLK=75MHz,则5~375 000.  0.6K~375K,精度达到1%,9~0.6K,精度达到0.1%
 * 		Duty:			0~1
 */
/*********************************************************************/
void FTM_CPWM_Init(uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty)
{
	uint16 Ftmn = 4,CHx = 8, PS = 0, mod = 0;
	switch(Ftmn_CHx_PTnx & 0xF000) //写保护禁止 
	    	{
	    		case 0x0000:Ftmn = 0;SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;FTM0_MODE |= FTM_MODE_WPDIS_MASK;break;
	    		case 0x1000:Ftmn = 1;SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;FTM1_MODE |= FTM_MODE_WPDIS_MASK;break;
	    		case 0x2000:Ftmn = 2;SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;FTM2_MODE |= FTM_MODE_WPDIS_MASK;break;
	    		case 0x3000:Ftmn = 3;SIM_SCGC3 |= SIM_SCGC3_FTM3_MASK;FTM3_MODE |= FTM_MODE_WPDIS_MASK;break;
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
	if(Freq >= BUS_CLK/2/0xFFFF*105/100)
		PS = 0;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/2)
		PS = 1;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/4)
		PS = 2;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/8)
		PS = 3;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/16)
		PS = 4;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/32)
		PS = 5;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/64)
		PS = 6;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/128)
		PS = 7;
	/******************** 选择输出模式为中间对齐CPWM,先高后低 *******************/
	FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~FTM_CnSC_ELSA_MASK;
	FTM_CnSC_REG(FTMn[Ftmn], CHx) |= FTM_CnSC_ELSB_MASK;
	// MSnB:MSnA = xx;CPWMS = 1;	中间对齐PWM
	// ELSnB:ELSnA = 10     		先高后低
	// ELSnB:ELSnA = 11    	 		先低后高
	/******************** 配置时钟和分频 ********************/
	FTM_SC_REG(FTMn[Ftmn]) |= FTM_SC_CPWMS_MASK;//选择中间对齐,
	FTM_SC_REG(FTMn[Ftmn]) |= (FTM_SC_PS(PS)|FTM_SC_CLKS(1) );          
	//分频因子，分频系数 = 2^PS.   时钟选择， 0：没选择时钟，禁用； 1：bus 时钟； 2：MCGFFCLK； 3：EXTCLK（ 由SIM_SOPT4 选择输入管脚 FTM_CLKINx）
	// FTM_SC_TOIE_MASK        //溢出中断使能（注释了表示 禁止溢出中断） 
	mod = (uint16)( (((double)(BUS_CLK)/Freq) /2 / (1<<PS) +0.5) );
	FTM_MOD_REG(FTMn[Ftmn]) = (mod - 1);                        //模数, EPWM的周期为 ：MOD - CNTIN + 0x0001
	FTM_CNTIN_REG(FTMn[Ftmn]) = 0;                          //计数器初始化值。设置脉冲宽度：(CnV - CNTIN).
	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)((float)(mod)*Duty+0.5-1);
	FTM_CNT_REG(FTMn[Ftmn])   = 0;                          //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
}
/**********************************************************************/
//频率只能改小,不能改大,可能是没配置好,因为我用了或等于|=,已解决
/* 简介:设置EPWM的频率,占空比不变
 * 例程:FTM_EPWM_Set_Freq(FTM0, FTM_CH0, 5000);//5K频率,占空比不变的PWM
 * 参数: 	Ftmn:	FTM0~3	
 * 		CHx:	FTM_CH0
 * 		Freq:	范围:(当PWM为EPWM)	BUS_CLK/0xFFFF/128*105/100~~BUS_CLK/100	
 * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,精度达到1%,剩余的精度达到0.1%
 * 								如果BUS_CLK=75MHz,则9~750 000.  1.2K~750K,精度达到1%,9~1.2K,精度达到0.1%
 */
/*********************************************************************/
void FTM_EPWM_Set_Freq(FTMn_e Ftmn, FTM_CHn_e CHx, uint32 Freq)
{
	uint16 mod = 0,val,PS = 8;
	float bili = 0;
	do
	{
		mod = FTM_MOD_REG(FTMn[Ftmn]);
	}while(mod == 0);
	val = (FTM_CnV_REG(FTMn[Ftmn], CHx) + 1);
	bili = (float)(val)/(mod + 1);
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
    	FTM_SC_REG(FTMn[Ftmn]) &= ~FTM_SC_PS_MASK;
	FTM_SC_REG(FTMn[Ftmn]) |= FTM_SC_PS(PS);
	mod = (uint16)( (((double)(BUS_CLK)/Freq) / (1<<PS) +0.5) );
	FTM_MOD_REG(FTMn[Ftmn]) = (mod - 1);                        //模数, EPWM的周期为 ：MOD - CNTIN + 0x0001
	FTM_CNTIN_REG(FTMn[Ftmn]) = 0;                          //计数器初始化值。设置脉冲宽度：(CnV - CNTIN).
	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)(mod*bili+0.5-1);
	FTM_CNT_REG(FTMn[Ftmn])   = 0;                          //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
}	
/**********************************************************************/
//频率只能改小,不能改大,可能是没配置好,因为我用了或等于|=,已解决
/* 简介:设置CPWM的频率,占空比不变
 * 例程:FTM_CPWM_Set_Freq(FTM0, FTM_CH0, 5000);//5K频率,占空比不变的PWM
 * 参数: 	Ftmn:	FTM0~2	
 * 		CHx:	FTM_CH0
 * 		Freq:	范围:(当PWM为CPWM)	BUS_CLK/2/0xFFFF/128*105/100~~BUS_CLK/2/100	
 * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,精度达到1%,剩余的精度达到0.1%
 * 								如果BUS_CLK=75MHz,则5~375 000.  0.6K~375K,精度达到1%,9~0.6K,精度达到0.1%
 */
/*********************************************************************/
void FTM_CPWM_Set_Freq(FTMn_e Ftmn, FTM_CHn_e CHx, uint32 Freq)
{
	uint16 mod = 0,val,PS = 8;
	float bili = 0;
	do
	{
		mod = FTM_MOD_REG(FTMn[Ftmn]);
	}while(mod == 0);
	val = (FTM_CnV_REG(FTMn[Ftmn], CHx) + 1);
	bili = (float)(val)/(mod + 1);
	if(Freq >= BUS_CLK/2/0xFFFF*105/100)
		PS = 0;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/2)
		PS = 1;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/4)
		PS = 2;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/8)
		PS = 3;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/16)
		PS = 4;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/32)
		PS = 5;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/64)
		PS = 6;
	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/128)
		PS = 7;
    	FTM_SC_REG(FTMn[Ftmn]) &= ~FTM_SC_PS_MASK;
	FTM_SC_REG(FTMn[Ftmn]) |= FTM_SC_PS(PS);
	mod = (uint16)( (((double)(BUS_CLK)/Freq) / 2/ (1<<PS) +0.5) );
	FTM_MOD_REG(FTMn[Ftmn]) = (mod - 1);                        //模数, EPWM的周期为 ：MOD - CNTIN + 0x0001
	FTM_CNTIN_REG(FTMn[Ftmn]) = 0;                          //计数器初始化值。设置脉冲宽度：(CnV - CNTIN).
	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)(mod*bili+0.5-1);
	FTM_CNT_REG(FTMn[Ftmn])   = 0;                          //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
}	

/***************************** Input Capture ***********************************/
/* 注意:能测到的最大输入频率少于BUS_CLK/4,当捕捉到时,计数器的值写入CnV.不能用来测低频,测低频定时1s
 * 简介:初始化输入捕捉
 * 例程:	FTM_IC_Init(FTM0_CH0_PTC1, FTM_Rising);
 * 参数: 	Ftmn_CHx_PTnx:	放在FTM.h文件
 * 		cfg:			FTM_Rising,FTM_Falling,FTM_Rising_or_Falling
 */
/*********************************************************************/
void FTM_IC_Init(uint16 Ftmn_CHx_PTnx, FTM_Input_cfg cfg)
{

        uint32 Ftmn,CHx;
        switch(Ftmn_CHx_PTnx & 0xF000) //写保护禁止 
            	{
            		case 0x0000:Ftmn = 0;SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;FTM0_MODE |= FTM_MODE_WPDIS_MASK;break;
            		case 0x1000:Ftmn = 1;SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;FTM1_MODE |= FTM_MODE_WPDIS_MASK;break;
            		case 0x2000:Ftmn = 2;SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;FTM2_MODE |= FTM_MODE_WPDIS_MASK;break;
            		case 0x3000:Ftmn = 3;SIM_SCGC3 |= SIM_SCGC3_FTM3_MASK;FTM3_MODE |= FTM_MODE_WPDIS_MASK;break;
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
        FTM_CnSC_REG(FTMn[Ftmn], CHx) |=  ( FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK );                   //置1
        FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~( FTM_CnSC_ELSB_MASK  | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        break;

    case FTM_Falling:   //下降沿触发
        FTM_CnSC_REG(FTMn[Ftmn], CHx) |= (FTM_CnSC_ELSB_MASK  | FTM_CnSC_CHIE_MASK );                    //置1
        FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~( FTM_CnSC_ELSA_MASK | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        break;

    case FTM_Rising_or_Falling: //上升沿、下降沿都触发
        FTM_CnSC_REG(FTMn[Ftmn], CHx) |=  ( FTM_CnSC_ELSB_MASK | FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK ); //置1
        FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~( FTM_CnSC_MSB_MASK  | FTM_CnSC_MSA_MASK); //清0
        break;
    }
    FTM_SC_REG(FTMn[Ftmn]) = FTM_SC_CLKS(0x1);       //选择 bus 时钟
    FTM_COMBINE_REG(FTMn[Ftmn]) = 0;
    FTM_MODE_REG(FTMn[Ftmn])    &= ~FTM_MODE_FTMEN_MASK;    //使能FTM
    FTM_CNTIN_REG(FTMn[Ftmn])   = 0;
    FTM_MOD_REG(FTMn[Ftmn]) = 0; 
    FTM_CNT_REG(FTMn[Ftmn])   = 0;//计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
    FTM_STATUS_REG(FTMn[Ftmn])  = 0x00;               //清中断标志位
}
/***************************** 计数器溢出中断使能  ***********************************/
/* 简介:	PWM模式时,当计数器的值=mod,产生溢出中断.
 * 例程:	FTM_TimeOut_Int_Enable(FTM0, FTM_CH0);
 * 参数: 	Ftmn:	FTM0~3
 * 		CHx:	FTM_CH0~7		
 */
/*********************************************************************/
void FTM_TimeOut_Int_Enable(FTMn_e Ftmn, FTM_CHn_e CHx)
{
    FTM_SC_REG(FTMn[Ftmn]) |= FTM_SC_TOIE_MASK;  	
    Enable_IRQ(78 + Ftmn);
}
void FTM_TimeOut_Int_Disable(FTMn_e Ftmn, FTM_CHn_e CHx)
{
    FTM_SC_REG(FTMn[Ftmn]) |= FTM_SC_TOIE_MASK;  	
    Enable_IRQ(78 + Ftmn);
}
/***************************** 通道事件中断使能  ***********************************/
/* 简介:	PWM模式时,当计数器的值=CnL,产生通道中断.当IC模式,触发则产生通道中断
 * 例程:	FTM_CH_INT_Enable(FTM0, FTM_CH0);
 * 参数: 	Ftmn:	FTM0~3
 * 		CHx:	FTM_CH0~7		
 */
/*********************************************************************/
void FTM_Ch_Int_Enable(FTMn_e Ftmn, FTM_CHn_e CHx)
{
	FTM_CnSC_REG(FTMn[Ftmn], CHx) |= FTM_CnSC_CHIE_MASK;
	Enable_IRQ(78 + Ftmn);
}
void FTM_Ch_Int_Dis(FTMn_e Ftmn, FTM_CHn_e CHx)
{
	FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~FTM_CnSC_CHIE_MASK;
	Disable_IRQ(78 + Ftmn);
}

void FTM_Clear_TimeOut(uint8 Ftmn)
{
	switch(Ftmn)
	{
		case FTM0:FTM0_SC &= ~FTM_SC_TOF_MASK;break;//清除第0个模块FTM0溢出中断标志位
		case FTM1:FTM1_SC &= ~FTM_SC_TOF_MASK;break;
		case FTM2:FTM2_SC &= ~FTM_SC_TOF_MASK;break;
		case FTM3:FTM3_SC &= ~FTM_SC_TOF_MASK;break;
	}
}
void FTM_Clear_Channal_Event(uint8 Ftmn, uint8 CHx)
{
	switch(Ftmn)
	{
		case FTM0:FTM0_CnSC(CHx) &= ~FTM_CnSC_CHF_MASK;break; //清第0个模块FTM0的第0个通道中断标志位
		case FTM1:FTM1_CnSC(CHx) &= ~FTM_CnSC_CHF_MASK;break;
		case FTM2:FTM2_CnSC(CHx) &= ~FTM_CnSC_CHF_MASK;break;
		case FTM3:FTM3_CnSC(CHx) &= ~FTM_CnSC_CHF_MASK;break;
	}
}



//////////////////////////////// 以下为正交解码 //////////////////////////////////////////

/*!
 *  @brief      初始化FTM 的正交解码 功能
 *  @param      Ftmn_e    模块号（ FTM1、  FTM2）
 *  @since      v5.0
 *  Sample usage:       FTM_QUAD_Init(FTM1);    //初始化 FTM1 为正交解码模式
 */
/*void FTM_QUAD_Init(Ftmn_e Ftmn)
{
    ASSERT( (Ftmn == FTM1) || (Ftmn == FTM2 ) ); //检查传递进来的通道是否正确
*/
    /******************* 开启时钟 和 复用IO口*******************/
 /*   switch(Ftmn)
    {

    case FTM1:
        SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;       //使能FTM1时钟
        if(FTM1_QDPHA == PTA8)                  //管脚复用
        {
            Port_Init(FTM1_QDPHA, ALT6);
        }
        else if(FTM1_QDPHA == PTA12)
        {
            Port_Init(FTM1_QDPHA, ALT7);
        }
        else if(FTM1_QDPHA == PTB0)
        {
            Port_Init(FTM1_QDPHA, ALT6);
        }
        else
        {
            ASSERT(0);                          //断言，配置的管脚不符合要求
        }

        if(FTM1_QDPHB == PTA9)
        {
            Port_Init(FTM1_QDPHB, ALT6);
        }
        else if(FTM1_QDPHB == PTA13)
        {
            Port_Init(FTM1_QDPHB, ALT7);
        }
        else if(FTM1_QDPHB == PTB1)
        {
            Port_Init(FTM1_QDPHB, ALT6);
        }
        else
        {
            ASSERT(0);                          //断言，配置的管脚不符合要求
        }
        break;

    case FTM2:
        SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                           //使能FTM2时钟
        if(FTM2_QDPHA == PTA10)                  //管脚复用
        {
            Port_Init(FTM2_QDPHA, ALT6);
        }
        else if(FTM2_QDPHA == PTB18)
        {
            Port_Init(FTM2_QDPHA, ALT6);
        }
        else
        {
            ASSERT(0);                          //断言，配置的管脚不符合要求
        }

        if(FTM2_QDPHB == PTA11)                  //管脚复用
        {
            Port_Init(FTM2_QDPHA, ALT6);
        }
        else if(FTM2_QDPHB == PTB19)
        {
            Port_Init(FTM2_QDPHA, ALT6);
        }
        else
        {
            ASSERT(0);                          //断言，配置的管脚不符合要求
        }
        break;
    default:
        ASSERT(0);                              //断言，配置的模块有误
        break;
    }

    FTM_MODE_REG(Ftmn[Ftmn])  |=    (0
                                     | FTM_MODE_WPDIS_MASK  //写保护禁止
                                     //| FTM_MODE_FTMEN_MASK   //使能 FTM
                                    );
    FTM_QDCTRL_REG(Ftmn[Ftmn]) |=   (0
                                    | FTM_QDCTRL_QUADMODE_MASK
                                     );
    FTM_CNTIN_REG(Ftmn[Ftmn])   = 0;
    FTM_MOD_REG(Ftmn[Ftmn])     = FTM_MOD_MOD_MASK;
    FTM_QDCTRL_REG(Ftmn[Ftmn]) |=   (0
                                    | FTM_QDCTRL_QUADEN_MASK
                                     );
    FTM_MODE_REG(Ftmn[Ftmn])  |= FTM_QDCTRL_QUADEN_MASK;
    FTM_CNT_REG(Ftmn[Ftmn])     = 0;                    //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
}*/

/*!
 *  @brief      获取FTM 正交解码 的脉冲数
 *  @param      Ftmn_e    模块号（ FTM1、  FTM2）
 *  @since      v5.0
 *  Sample usage:       int16 count = FTM_QUAD_get(FTM1);    //获取  FTM1 交解码 的脉冲数
 */
/*int16 FTM_QUAD_Get(Ftmn_e Ftmn)
{
    int16 val;
    ASSERT( (Ftmn == FTM1) || (Ftmn == FTM2 ) );        //检查传递进来的通道是否正确
    val = FTM_CNT_REG(Ftmn[Ftmn]);

    return val;
}*/

/*!
 *  @brief      清 FTM 正交解码 的脉冲数
 *  @param      Ftmn_e    模块号（ FTM1、  FTM2）
 *  @since      v5.0
 *  Sample usage:       FTM_QUAD_clean(FTM1);    //复位 FTM1 正交解码 的脉冲数
 */
/*void FTM_QUAD_Clean(Ftmn_e Ftmn)
{
    ASSERT( (Ftmn == FTM1) || (Ftmn == FTM2 ) ); //检查传递进来的通道是否正确

    FTM_CNT_REG(Ftmn[Ftmn])     = 0;             //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
}*/


