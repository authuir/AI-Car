#include "all.h"
//**********************************************
//�������ƣ�void GPIO_Enable(port,pin)
//��飺GPIOʹ��
//������port�˿ڣ�PORTA,PORTB,PORTC.~PORTF
//      pin���ţ�0-31
//**********************************************
void GPIO_Enable(uint32 port,uint32 pin)
 {
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=(uint32)~(7<<8);
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=(uint32)(1<<8);
 }
//**********************************************
//�������ƣ�void GPIO_Disable( port ,pin)
//��飺GPIOȥʹ��
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//*************************************************
void GPIO_Disable(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=~(7<<8);
 }

//*******************************************************
//�������ƣ�void GPIO_INIT(port,pin,dir)
//��飺��ʼ���˿ڣ��趨����
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//*******************************************************
void GPIO_INIT(uint32 port,uint32 pin,uint32 dir)
 {
     PORT_Enable(port);
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=(uint32)~(7<<8);
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=(uint32)(1<<8);
     if(dir)
        HWREG(GPIO_PDDR_BASE+port*(0x40))|=(1<<pin);
     else HWREG(GPIO_PDDR_BASE+port*(0x40))&=~(1<<pin);
 }

//*******************************************************
//�������ƣ�void GPIO_SET(port,pin,date)
//��飺�趨�˿������ƽ������Ҫ��ʼ���������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ��������ʽ
//      date:�ߵ͵�ƽ 
//********************************************************
void GPIO_SET(uint32 port,uint32 pin,uint32 date)
 {
       if(date)
        HWREG(GPIO_PDOR_BASE+port*(0x40))|=(1<<pin);
     else HWREG(GPIO_PDOR_BASE+port*(0x40))&=~(1<<pin);
 }

//*******************************************************
//�������ƣ�uint32 GPIO_GET(port,pin)
//��飺�趨�˿������ƽ������Ҫ��ʼ������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//����ֵ������״̬,Ĭ��Ϊ�ߵ�ƽ������1
//********************************************************
uint32 GPIO_GET(uint32 port,uint32 pin)
 {
    return (uint32)(HWREG(GPIO_PDIR_BASE+port*(0x40))>>pin)&(0x00000001);
 }

//*******************************************************
//�������ƣ�void GPIO_OPPSITE(port,pin)
//��飺�趨�˿������ƽ������Ҫ��ʼ���������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//********************************************************
void GPIO_OPPSITE(uint32 port , uint32 pin)
 {
    HWREG(GPIO_PTOR_BASE +port*(0x40))|=(1<<pin);
 }


//***********************************************************
//�������ƣ�void GPIO_DSE(uint32 port,uint32 pin)
//��飺�趨����ǿ�ȣ��ô˺�����������Ϊhigh drive
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIO_DSE(uint32 port ,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<6;
 }
//***********************************************************
//�������ƣ�void GPIO_ODE(uint32 port,uint32 pin)
//��飺�趨ΪOPEN DRAIN���ô˺�������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIO_ODE(uint32 port ,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<5;
 }
   //***********************************************************
//�������ƣ�void GPIO_PFE(uint32 port,uint32 pin)
//��飺�趨ΪPassive Filter
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIO_PFE(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<4;
 }
  //***********************************************************
//�������ƣ�void GPIO_PFE(uint32 port,uint32 pin)
//��飺�趨Ϊlow slew rate
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIO_SER(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<2;
 }

//*************************************************************
//�������ƣ�void GPIOPULL_Enable(uint32 port,uint32 pin)
//��飺�趨Ϊʹ��������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIOPULL_Enable(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<1;
 }
//*************************************************************
//�������ƣ�void GPIOPULL_Disable(uint32 port,uint32 pin)
//��飺�趨Ϊȥʹ��������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//***********************************************************
void GPIOPULL_Disable(uint32 port,uint32 pin)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=~(1<<1);
 }


//*************************************************************
//�������ƣ�void GPIOPULL_SET(uint32 port,uint32 pin,uint32 state)
//��飺�趨������
//������port�˿ڣ�PORTA---PORTF
//      pin���ţ�0-31
//      state:PULL_UP,PULL_DOWN
//***********************************************************
void GPIOPULL_SET(uint32 port ,uint32 pin,uint32 state)
 {
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<1;
    if(state) HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1;
    else HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=~((uint32)1);
 }



//*************************************************************************
//�������ƣ�GPIOINT_Eable(port,pin)
//��飺ʹ�ܶ˿��ж�
//������port:PORTA-PORTF
//      pin:0-31
//      mode:�˿�ģʽ��
//*************************************************************************
void GPIOINT_Enable(uint32 port,uint32 pin,uint32 mode)
 {
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=0xfff0ffff;//������
    HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=(mode<<16);
 }

//*************************************************************************
//�������ƣ�GPIOINT_Disable(port,pin)
//��飺ȥʹ�ܶ˿��ж�
//������port:PORTA-PORTF
//      pin:0-31
//*************************************************************************
void GPIOINT_Disable(uint32 port,uint32 pin)
 {
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=0XFFF0FFFF;//������
 }

//*************************************************************************
//��������void GPIOINT_Clear(uint32 PORT)
//����жϱ�־
//*************************************************************************
void GPIOINT_Clear(uint32 PORT)
 {
    HWREG(PORT_ISFR+PORT*(0x1000))|=0XFFFFFFFF;
 }
/**********************************************************************/
/* ���:��ʼ��GPIO   
 * ����:GPIO_Init(PTA,GPIO_PIN_10,INTPUT_UP,IRQC_HIGH);
 * ����: 			PTx:		PTA,PTB,PTC,PTD,PTE
 * 			GPIO_PIN_x:	GPIO_PIN_0,GPIO_PIN_1,......,GPIO_PIN_31
 * 			Dir_Data:	OUTPUT_HIGH,OUTPUT_LOW,INTPUT_UP,INTPUT_DOWN,INTPUT
 * 			Irqc:		IRQC_DIS,IRQC_DMA_RISING,IRQC_DMA_FALLING,IRQC_DMA_BOTH_EDGE,
 * 						IRQC_LOW,IRQC_RISING,IRQC_FALLING,IRQC_BOTH_EDGE,IRQC_HIGH
 */
/*********************************************************************/
void GPIO_Init(uint8 Ptx,uint8 Pins,uint8 Dir_Data,uint8 Irqc)
{
	PORT_MemMapPtr PORTx_BASE_PTR;
	GPIO_MemMapPtr PTx_BASE_PTR;
	
	switch(Ptx)//ʹ��PORTx��ʱ��
	{
		case 1:PTx_BASE_PTR =PTA_BASE_PTR;PORTx_BASE_PTR = PORTA_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;break;
		case 2:PTx_BASE_PTR =PTB_BASE_PTR;PORTx_BASE_PTR = PORTB_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;break;
		case 3:PTx_BASE_PTR =PTC_BASE_PTR;PORTx_BASE_PTR = PORTC_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;break;
		case 4:PTx_BASE_PTR =PTD_BASE_PTR;PORTx_BASE_PTR = PORTD_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;break;
		case 5:PTx_BASE_PTR =PTE_BASE_PTR;PORTx_BASE_PTR = PORTE_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK;break;
	}
	PORT_PCR_REG(PORTx_BASE_PTR,Pins) &= ~PORT_PCR_LK_MASK;
	PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_MUX(0x01) | PORT_PCR_ISF_MASK;
		//���ùܽ�ΪGPIO����, ȷ������ģʽ ,������������������
		//����ס���ſ��ƼĴ���[15:0]
		//д1�����жϱ�־λ
	switch(Dir_Data)
	{
		case 1:
		{
			GPIO_PDDR_REG(PTx_BASE_PTR) |= 0x1u<<Pins;		//���ö˿ڷ���Ϊ���
			GPIO_PSOR_REG(PTx_BASE_PTR) |= 0x1u<<Pins;		//����ߵ�ƽ
			break;
		}
		case 2:
		{
			GPIO_PDDR_REG(PTx_BASE_PTR) |= 0x1u<<Pins;		//���ö˿ڷ���Ϊ���
			GPIO_PSOR_REG(PTx_BASE_PTR) &= (~0x1u<<Pins);	//����͵�ƽ
			break;
		}
		//����ʱ��������������ΪҪ��������̬,�����ָߵ�̬
		case 3:
		{
			GPIO_PDDR_REG(PTx_BASE_PTR) &= (~0x1u<<Pins);			//���ö˿ڷ���Ϊ����
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_IRQC(Irqc);//�����ж�����
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;//ʹ������������,��������
			break;
		}
		case 4:
		{
			GPIO_PDDR_REG(PTx_BASE_PTR) &= (~0x1u<<Pins);			//���ö˿ڷ���Ϊ����
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_IRQC(Irqc);//�����ж�����
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) &= ~PORT_PCR_PS_MASK;
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_PE_MASK;//ʹ������������,��������
			break;
		}
		case 5:
		{
			GPIO_PDDR_REG(PTx_BASE_PTR) &= (~0x1u<<Pins);			//���ö˿ڷ���Ϊ����
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_IRQC(Irqc);//�����ж�����
			PORT_PCR_REG(PORTx_BASE_PTR,Pins) &= ~PORT_PCR_PE_MASK;//��������������
			break;
		}
	}

}



