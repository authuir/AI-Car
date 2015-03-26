#include "all.h"
extern uint32 SYS_CLOCK=0;

//*****************************************************************************************
//ʱ�����ú���
//��������SYS_CLOCK_SET(uint32 X,uint32 div_core,uint32 div_bus,uint32 div_flexbus,uint32 flash)
//������X:SYS_CLOCK_150M,SYS_CLOCK_100M,
//      div_core :�ں�ʱ�ӷ�Ƶϵ��
//      div_bus:ϵͳʱ�ӷ�Ƶϵ��
//      div_flexbus��flashʱ�ӷ�Ƶϵ��
//MAX:core:150M   BUS:75M  FLEXBUS:50M   FLASH  25M
//****************************************************************************************
void SYS_CLOCK_SET(uint32 X,uint32 div_core,uint32 div_bus,uint32 div_flexbus,uint32 flash)
  {
    //FEI---->FBE
      OSC0_CR=0x80;
      MCG_C2=0x1c;
      MCG_C1=MCG_C1_CLKS(2)|MCG_C1_FRDIV(3);
      while(!(MCG_S&MCG_S_OSCINIT0_MASK)){};
      while((MCG_S&MCG_S_IREFST_MASK)){};
      while((((MCG_S&MCG_S_CLKST_MASK)>>MCG_S_CLKST_SHIFT)!=0x2)){};
      //�Ѿ�����FBEģʽ
      MCG_C5=MCG_C5_PRDIV0(X/16);
      //FBE--->PBE
      MCG_C6=0x40;
      MCG_C6|=MCG_C6_VDIV0(X%16);
      SIM_CLKDIV1=SIM_CLKDIV1_OUTDIV1(div_core-1)|SIM_CLKDIV1_OUTDIV2(div_bus-1)|SIM_CLKDIV1_OUTDIV3(div_flexbus-1)|SIM_CLKDIV1_OUTDIV4(flash-1);
      while(!(MCG_S&MCG_S_PLLST_MASK)){};
      while(!(MCG_S&MCG_S_LOCK0_MASK)){};
      //�����Ѿ�����PBEģʽ
      //PBE--->PEE
      MCG_C1&=~MCG_C1_CLKS_MASK;
      while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
      //�����Ѿ�����PEEģʽ��
      switch(X)
       {
       case SYS_CLOCK_150M:SYS_CLOCK=150000000;break;
       case SYS_CLOCK_100M:SYS_CLOCK=100000000;break;
       }
      PORT_Enable_ALL();
  }

//*********************************************
//�������ƣ�void PORT_Enable(uint32 x)
//��飺ʹ�ܶ˿�ʱ��
//������PORTA,PORTB,PORTC,PORTD,PORTE,PORTF
//**********************************************
void PORT_Enable(uint32 X)
 {
     HWREG(0X40048038)|=(1<<(9+X));
 }


//*********************************************
//�������ƣ�void PORT_Disable(uint32 x)
//��飺�رն˿�ʱ��
//������PORTA,PORTB,PORTC,PORTD,PORTE,PORTF
//**********************************************
void PORT_Disable(uint32 X)
 {
     SIM_SCGC5&=~(1<<(9+X));
 }


//**********************************************
//�������ƣ�void PORT_Enable_ALL(void);
//��飺�����ж˿�ʱ��
//***********************************************
void PORT_Enable_ALL(void)
 {
     SIM_SCGC5|=(SIM_SCGC5_PORTA_MASK|SIM_SCGC5_PORTB_MASK|SIM_SCGC5_PORTC_MASK|SIM_SCGC5_PORTD_MASK|SIM_SCGC5_PORTE_MASK
         |SIM_SCGC5_PORTF_MASK);
 }
//���ö˿ڵĸ��ù���
void PORT_Configuer(uint32 port,uint32 pin,uint8 select)
 {
     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=PORT_PCR_MUX(select);
 }