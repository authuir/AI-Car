#include "all.h"


#define BUS_CLK		75000000
#define MCGFFCLK 	48828

FTM_MemMapPtr FTMn[4] = {FTM0_BASE_PTR, FTM1_BASE_PTR, FTM2_BASE_PTR,FTM3_BASE_PTR}; //��������ָ�����鱣�� Ftmn_e �ĵ�ַ

/*************************PWMռ�ձ� = (CnV-CNTIN)/(MOD-CNTIN+1)**************/
/*************************PWMƵ�� = Bus_CLK / 2^CPWM / 2^PS / Mod************/

/********************************** ��Ƶ *****************************************	
 * 	EPWM(PS=0,CPWM=0)							CPWM(PS=0,CPWM=1)
 * 	Frequency	Mod		Duty			Frequency	Mod		Duty	
 * 	3.75M Hz	20(��ǿ,����ʧ��Ƚ�����)		
 * 	...			...
 * 	2.5M Hz  	30(����ʧ��,��ǿ����)                   2M Hz           (������18.75,������Ϊ����)(����ʧ��,��ǿ����)
 * 	....		...					...		...
 * 	1M Hz		75
 * 	...			...
 * 	757.5K Hz	99					378.78K Hz	99
 * 	
 ********************************** �и�Ƶ **************************************
 *************************** �������PWMƵ�ʷ�Χ ********************************
 * 	Mod >= 100
 * 	EPWM(PS=*,CPWM=0)					CPWM(PS=*,CPWM=1)
 * 	Frequency	Duty					Frequency	Duty
 * 	1200~750k	N*1%(100<=Mod<1000)			600~375K	N*1%
 * 	10~1200		N*0.1%					5~600		N*0.1%
 ********************************** ��Ƶ ***************************************** 	
 * 	���϶���������ʱ��ΪFTM��ʱ��
 * 	��������MCGFFCLKʱ�ӿ�������0.0008Hz,�����õ�ʱ����˵�����,û�����			
 */
//����:Mode	EPWM_MODE,CPWM_MODE
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
/* ���:����EPWM,CPWM��ռ�ձ�,Ƶ�ʲ���
 * ����:FTM_PWM_Set_Duty(FTM0, FTM_CH0, 0.8);
 * ����: 	Ftmn:	FTM0~2	
 * 		CHx:	FTM_CH0
 * 		Freq:	��Χ:
 * 					��PWMΪEPWM:	BUS_CLK/0xFFFF/128*105/100~~BUS_CLK/100	
 * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,���ȴﵽ1%,ʣ��ľ��ȴﵽ0.1%
 * 								���BUS_CLK=75MHz,��9~750 000.  1.2K~750K,���ȴﵽ1%,9~1.2K,���ȴﵽ0.1%
 * 					��PWMΪCPWM:	BUS_CLK/2/0xFFFF/128*105/100~~BUS_CLK/2/100	
 * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,���ȴﵽ1%,ʣ��ľ��ȴﵽ0.1%
 * 								���BUS_CLK=75MHz,��5~375 000.  0.6K~375K,���ȴﵽ1%,9~0.6K,���ȴﵽ0.1%
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
	//FTM_CNT_REG(FTMn[Ftmn])   = 0;                         //��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ������������ CNTIN ��ֵ��
}	

/***************************** EPWM  ***********************************/
/* ע��:��Ĭ��������ʱ��75MHz,�������ʱ�Ӳ�����75MHz,��������.�����MCGFLLʱ��(48.828kHz),PWMƵ�ʿ���������
 * ���:��ʼ��EPWMΪ(���ض���)edge-aligned,Ƶ��,ռ�ձ�
 * ����:FTM_EPWM_Init(FTM0_CH0_PTC1, 10000, 0.5);//Ƶ��Ϊ10k,ռ�ձ�Ϊ50%�ı���EPWM
 * ����: 	Ftmn_CHx_PTnx:	����FTM.h�ļ�
 * 		Freq:			��Χ:BUS_CLK/0xFFFF/128*105/100~~BUS_CLK/100	
 * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,���ȴﵽ1%,ʣ��ľ��ȴﵽ0.1%
 * 								���BUS_CLK=75MHz,��9~750 000.  1.2K~750K,���ȴﵽ1%,9~1.2K,���ȴﵽ0.1%
 * 		Duty:			0~1
 */
/*********************************************************************/
void FTM_EPWM_Init(uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty)
{
	uint16 Ftmn = 4,CHx = 8, PS = 0, mod = 0;
    double temp = 0;
    switch(Ftmn_CHx_PTnx & 0xF000) //д������ֹ 
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
	/******************** ѡ�����ģʽΪ ���ض���EPWM,�ȸߺ�� *******************/
	FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~FTM_CnSC_ELSA_MASK;
	FTM_CnSC_REG(FTMn[Ftmn], CHx) |= FTM_CnSC_MSB_MASK | FTM_CnSC_ELSB_MASK;
	// MSnB:MSnA = 1x;CPWMS = 0	���ض���PWM
	// ELSnB:ELSnA = 10     	�ȸߺ��
	// ELSnB:ELSnA = 11    	 	�ȵͺ��
	/******************** ����ʱ�Ӻͷ�Ƶ ********************/
	FTM_SC_REG(FTMn[Ftmn]) &= ~FTM_SC_CPWMS_MASK;//ѡ����ض���,
	FTM_SC_REG(FTMn[Ftmn]) |= (FTM_SC_PS(PS)|FTM_SC_CLKS(1) );          
	//��Ƶ���ӣ���Ƶϵ�� = 2^PS.   ʱ��ѡ�� 0��ûѡ��ʱ�ӣ����ã� 1��bus ʱ�ӣ� 2��MCGFFCLK�� 3��EXTCLK�� ��SIM_SOPT4 ѡ������ܽ� FTM_CLKINx��
	// FTM_SC_TOIE_MASK        //����ж�ʹ�ܣ�ע���˱�ʾ ��ֹ����жϣ� 
    temp = (double)(BUS_CLK)/Freq;
    mod = (uint16)(temp / (1<<PS) +0.5);
	//	mod = (uint16)( (((double)(BUS_CLK)/Freq) /(1<<(FTM_SC_REG(FTMn[Ftmn])&FTM_SC_CPWMS_MASK)) / (1<<PS) +0.5) );
	FTM_MOD_REG(FTMn[Ftmn]) = (mod - 1);                        //ģ��, EPWM������Ϊ ��MOD - CNTIN + 0x0001
	FTM_CNTIN_REG(FTMn[Ftmn]) = 0;                          //��������ʼ��ֵ�����������ȣ�(CnV - CNTIN).
	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)((float)(mod)*Duty + 0.1+0.5-1);
	FTM_CNT_REG(FTMn[Ftmn])   = 1;                          //��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ������������ CNTIN ��ֵ��
}
/***************************** CPWM  ***********************************/
/* ע��:��Ĭ��������ʱ��75MHz,�������ʱ�Ӳ�����75MHz,��������.�����MCGFLLʱ��(48.828kHz),PWMƵ�ʿ���������
 * ���:��ʼ��CPWMΪ(�м����)Center-aligned,Ƶ��,ռ�ձ�
 * ����:FTM_CPWM_Init(FTM0_CH0_PTC1, 10000, 0.5);//Ƶ��Ϊ10k,ռ�ձ�Ϊ50%�ı���EPWM
 * ����: 	Ftmn_CHx_PTnx:	����FTM.h�ļ�
 * 		Freq:			��Χ:BUS_CLK/2/0xFFFF/128*105/100~~BUS_CLK/2/100	
 * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,���ȴﵽ1%,ʣ��ľ��ȴﵽ0.1%
 * 								���BUS_CLK=75MHz,��5~375 000.  0.6K~375K,���ȴﵽ1%,9~0.6K,���ȴﵽ0.1%
 * 		Duty:			0~1
 */
/*********************************************************************/
void FTM_CPWM_Init(uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty)
{
	uint16 Ftmn = 4,CHx = 8, PS = 0, mod = 0;
	switch(Ftmn_CHx_PTnx & 0xF000) //д������ֹ 
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
	/******************** ѡ�����ģʽΪ�м����CPWM,�ȸߺ�� *******************/
	FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~FTM_CnSC_ELSA_MASK;
	FTM_CnSC_REG(FTMn[Ftmn], CHx) |= FTM_CnSC_ELSB_MASK;
	// MSnB:MSnA = xx;CPWMS = 1;	�м����PWM
	// ELSnB:ELSnA = 10     		�ȸߺ��
	// ELSnB:ELSnA = 11    	 		�ȵͺ��
	/******************** ����ʱ�Ӻͷ�Ƶ ********************/
	FTM_SC_REG(FTMn[Ftmn]) |= FTM_SC_CPWMS_MASK;//ѡ���м����,
	FTM_SC_REG(FTMn[Ftmn]) |= (FTM_SC_PS(PS)|FTM_SC_CLKS(1) );          
	//��Ƶ���ӣ���Ƶϵ�� = 2^PS.   ʱ��ѡ�� 0��ûѡ��ʱ�ӣ����ã� 1��bus ʱ�ӣ� 2��MCGFFCLK�� 3��EXTCLK�� ��SIM_SOPT4 ѡ������ܽ� FTM_CLKINx��
	// FTM_SC_TOIE_MASK        //����ж�ʹ�ܣ�ע���˱�ʾ ��ֹ����жϣ� 
	mod = (uint16)( (((double)(BUS_CLK)/Freq) /2 / (1<<PS) +0.5) );
	FTM_MOD_REG(FTMn[Ftmn]) = (mod - 1);                        //ģ��, EPWM������Ϊ ��MOD - CNTIN + 0x0001
	FTM_CNTIN_REG(FTMn[Ftmn]) = 0;                          //��������ʼ��ֵ�����������ȣ�(CnV - CNTIN).
	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)((float)(mod)*Duty+0.5-1);
	FTM_CNT_REG(FTMn[Ftmn])   = 0;                          //��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ������������ CNTIN ��ֵ��
}
/**********************************************************************/
//Ƶ��ֻ�ܸ�С,���ܸĴ�,������û���ú�,��Ϊ�����˻����|=,�ѽ��
/* ���:����EPWM��Ƶ��,ռ�ձȲ���
 * ����:FTM_EPWM_Set_Freq(FTM0, FTM_CH0, 5000);//5KƵ��,ռ�ձȲ����PWM
 * ����: 	Ftmn:	FTM0~3	
 * 		CHx:	FTM_CH0
 * 		Freq:	��Χ:(��PWMΪEPWM)	BUS_CLK/0xFFFF/128*105/100~~BUS_CLK/100	
 * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,���ȴﵽ1%,ʣ��ľ��ȴﵽ0.1%
 * 								���BUS_CLK=75MHz,��9~750 000.  1.2K~750K,���ȴﵽ1%,9~1.2K,���ȴﵽ0.1%
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
	FTM_MOD_REG(FTMn[Ftmn]) = (mod - 1);                        //ģ��, EPWM������Ϊ ��MOD - CNTIN + 0x0001
	FTM_CNTIN_REG(FTMn[Ftmn]) = 0;                          //��������ʼ��ֵ�����������ȣ�(CnV - CNTIN).
	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)(mod*bili+0.5-1);
	FTM_CNT_REG(FTMn[Ftmn])   = 0;                          //��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ������������ CNTIN ��ֵ��
}	
/**********************************************************************/
//Ƶ��ֻ�ܸ�С,���ܸĴ�,������û���ú�,��Ϊ�����˻����|=,�ѽ��
/* ���:����CPWM��Ƶ��,ռ�ձȲ���
 * ����:FTM_CPWM_Set_Freq(FTM0, FTM_CH0, 5000);//5KƵ��,ռ�ձȲ����PWM
 * ����: 	Ftmn:	FTM0~2	
 * 		CHx:	FTM_CH0
 * 		Freq:	��Χ:(��PWMΪCPWM)	BUS_CLK/2/0xFFFF/128*105/100~~BUS_CLK/2/100	
 * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,���ȴﵽ1%,ʣ��ľ��ȴﵽ0.1%
 * 								���BUS_CLK=75MHz,��5~375 000.  0.6K~375K,���ȴﵽ1%,9~0.6K,���ȴﵽ0.1%
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
	FTM_MOD_REG(FTMn[Ftmn]) = (mod - 1);                        //ģ��, EPWM������Ϊ ��MOD - CNTIN + 0x0001
	FTM_CNTIN_REG(FTMn[Ftmn]) = 0;                          //��������ʼ��ֵ�����������ȣ�(CnV - CNTIN).
	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)(mod*bili+0.5-1);
	FTM_CNT_REG(FTMn[Ftmn])   = 0;                          //��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ������������ CNTIN ��ֵ��
}	

/***************************** Input Capture ***********************************/
/* ע��:�ܲ⵽���������Ƶ������BUS_CLK/4,����׽��ʱ,��������ֵд��CnV.�����������Ƶ,���Ƶ��ʱ1s
 * ���:��ʼ�����벶׽
 * ����:	FTM_IC_Init(FTM0_CH0_PTC1, FTM_Rising);
 * ����: 	Ftmn_CHx_PTnx:	����FTM.h�ļ�
 * 		cfg:			FTM_Rising,FTM_Falling,FTM_Rising_or_Falling
 */
/*********************************************************************/
void FTM_IC_Init(uint16 Ftmn_CHx_PTnx, FTM_Input_cfg cfg)
{

        uint32 Ftmn,CHx;
        switch(Ftmn_CHx_PTnx & 0xF000) //д������ֹ 
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
	/******************* ����Ϊ���벶׽���� *******************/
    switch(cfg)
    {
        //���벶׽ģʽ�£�DECAPEN = 0 �� DECAPEN = 0 ��CPWMS = 0�� MSnB:MSnA = 0

        // ELSnB:ELSnA         1          10          11
        // ����             ������      �½���      ������

    case FTM_Rising:    //�����ش���
        FTM_CnSC_REG(FTMn[Ftmn], CHx) |=  ( FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK );                   //��1
        FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~( FTM_CnSC_ELSB_MASK  | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //��0
        break;

    case FTM_Falling:   //�½��ش���
        FTM_CnSC_REG(FTMn[Ftmn], CHx) |= (FTM_CnSC_ELSB_MASK  | FTM_CnSC_CHIE_MASK );                    //��1
        FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~( FTM_CnSC_ELSA_MASK | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //��0
        break;

    case FTM_Rising_or_Falling: //�����ء��½��ض�����
        FTM_CnSC_REG(FTMn[Ftmn], CHx) |=  ( FTM_CnSC_ELSB_MASK | FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK ); //��1
        FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~( FTM_CnSC_MSB_MASK  | FTM_CnSC_MSA_MASK); //��0
        break;
    }
    FTM_SC_REG(FTMn[Ftmn]) = FTM_SC_CLKS(0x1);       //ѡ�� bus ʱ��
    FTM_COMBINE_REG(FTMn[Ftmn]) = 0;
    FTM_MODE_REG(FTMn[Ftmn])    &= ~FTM_MODE_FTMEN_MASK;    //ʹ��FTM
    FTM_CNTIN_REG(FTMn[Ftmn])   = 0;
    FTM_MOD_REG(FTMn[Ftmn]) = 0; 
    FTM_CNT_REG(FTMn[Ftmn])   = 0;//��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ������������ CNTIN ��ֵ��
    FTM_STATUS_REG(FTMn[Ftmn])  = 0x00;               //���жϱ�־λ
}
/***************************** ����������ж�ʹ��  ***********************************/
/* ���:	PWMģʽʱ,����������ֵ=mod,��������ж�.
 * ����:	FTM_TimeOut_Int_Enable(FTM0, FTM_CH0);
 * ����: 	Ftmn:	FTM0~3
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
/***************************** ͨ���¼��ж�ʹ��  ***********************************/
/* ���:	PWMģʽʱ,����������ֵ=CnL,����ͨ���ж�.��ICģʽ,���������ͨ���ж�
 * ����:	FTM_CH_INT_Enable(FTM0, FTM_CH0);
 * ����: 	Ftmn:	FTM0~3
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
		case FTM0:FTM0_SC &= ~FTM_SC_TOF_MASK;break;//�����0��ģ��FTM0����жϱ�־λ
		case FTM1:FTM1_SC &= ~FTM_SC_TOF_MASK;break;
		case FTM2:FTM2_SC &= ~FTM_SC_TOF_MASK;break;
		case FTM3:FTM3_SC &= ~FTM_SC_TOF_MASK;break;
	}
}
void FTM_Clear_Channal_Event(uint8 Ftmn, uint8 CHx)
{
	switch(Ftmn)
	{
		case FTM0:FTM0_CnSC(CHx) &= ~FTM_CnSC_CHF_MASK;break; //���0��ģ��FTM0�ĵ�0��ͨ���жϱ�־λ
		case FTM1:FTM1_CnSC(CHx) &= ~FTM_CnSC_CHF_MASK;break;
		case FTM2:FTM2_CnSC(CHx) &= ~FTM_CnSC_CHF_MASK;break;
		case FTM3:FTM3_CnSC(CHx) &= ~FTM_CnSC_CHF_MASK;break;
	}
}



//////////////////////////////// ����Ϊ�������� //////////////////////////////////////////

/*!
 *  @brief      ��ʼ��FTM ���������� ����
 *  @param      Ftmn_e    ģ��ţ� FTM1��  FTM2��
 *  @since      v5.0
 *  Sample usage:       FTM_QUAD_Init(FTM1);    //��ʼ�� FTM1 Ϊ��������ģʽ
 */
/*void FTM_QUAD_Init(Ftmn_e Ftmn)
{
    ASSERT( (Ftmn == FTM1) || (Ftmn == FTM2 ) ); //��鴫�ݽ�����ͨ���Ƿ���ȷ
*/
    /******************* ����ʱ�� �� ����IO��*******************/
 /*   switch(Ftmn)
    {

    case FTM1:
        SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;       //ʹ��FTM1ʱ��
        if(FTM1_QDPHA == PTA8)                  //�ܽŸ���
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
            ASSERT(0);                          //���ԣ����õĹܽŲ�����Ҫ��
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
            ASSERT(0);                          //���ԣ����õĹܽŲ�����Ҫ��
        }
        break;

    case FTM2:
        SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                           //ʹ��FTM2ʱ��
        if(FTM2_QDPHA == PTA10)                  //�ܽŸ���
        {
            Port_Init(FTM2_QDPHA, ALT6);
        }
        else if(FTM2_QDPHA == PTB18)
        {
            Port_Init(FTM2_QDPHA, ALT6);
        }
        else
        {
            ASSERT(0);                          //���ԣ����õĹܽŲ�����Ҫ��
        }

        if(FTM2_QDPHB == PTA11)                  //�ܽŸ���
        {
            Port_Init(FTM2_QDPHA, ALT6);
        }
        else if(FTM2_QDPHB == PTB19)
        {
            Port_Init(FTM2_QDPHA, ALT6);
        }
        else
        {
            ASSERT(0);                          //���ԣ����õĹܽŲ�����Ҫ��
        }
        break;
    default:
        ASSERT(0);                              //���ԣ����õ�ģ������
        break;
    }

    FTM_MODE_REG(Ftmn[Ftmn])  |=    (0
                                     | FTM_MODE_WPDIS_MASK  //д������ֹ
                                     //| FTM_MODE_FTMEN_MASK   //ʹ�� FTM
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
    FTM_CNT_REG(Ftmn[Ftmn])     = 0;                    //��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ������������ CNTIN ��ֵ��
}*/

/*!
 *  @brief      ��ȡFTM �������� ��������
 *  @param      Ftmn_e    ģ��ţ� FTM1��  FTM2��
 *  @since      v5.0
 *  Sample usage:       int16 count = FTM_QUAD_get(FTM1);    //��ȡ  FTM1 ������ ��������
 */
/*int16 FTM_QUAD_Get(Ftmn_e Ftmn)
{
    int16 val;
    ASSERT( (Ftmn == FTM1) || (Ftmn == FTM2 ) );        //��鴫�ݽ�����ͨ���Ƿ���ȷ
    val = FTM_CNT_REG(Ftmn[Ftmn]);

    return val;
}*/

/*!
 *  @brief      �� FTM �������� ��������
 *  @param      Ftmn_e    ģ��ţ� FTM1��  FTM2��
 *  @since      v5.0
 *  Sample usage:       FTM_QUAD_clean(FTM1);    //��λ FTM1 �������� ��������
 */
/*void FTM_QUAD_Clean(Ftmn_e Ftmn)
{
    ASSERT( (Ftmn == FTM1) || (Ftmn == FTM2 ) ); //��鴫�ݽ�����ͨ���Ƿ���ȷ

    FTM_CNT_REG(Ftmn[Ftmn])     = 0;             //��������ֻ�е�16λ���ã�д�κ�ֵ���˼Ĵ������������ CNTIN ��ֵ��
}*/


