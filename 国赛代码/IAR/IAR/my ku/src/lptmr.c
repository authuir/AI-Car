#include "all.h"
void LPTMR_init(u16 CountNUM)
{
    SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;  //�� PORTA ʱ��
    PORTC_PCR5 = PORT_PCR_MUX(0x03);    //��PTA19��ʹ�� ALT6
    SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;    //ʹ��LPTģ��ʱ��

    LPTMR0_CSR = 0x00;                      //��LPT ����ʱ�ӷ�Ƶ

    LPTMR0_CMR = CountNUM;                       //���ñȽ�ֵ

    LPTMR_PSR_REG(LPTMR0_BASE_PTR) = LPTMR_PSR_PCS(1) | LPTMR_PSR_PBYP_MASK | LPTMR_PSR_PRESCALE(2);
  
    LPTMR0_CSR = LPTMR_CSR_TPS(2) | LPTMR_CSR_TMS_MASK   | LPTMR_CSR_TEN_MASK   ;
    //         TPS 01 �ܽţ�LPTMR_ALT2  TMS 1 �������ģʽ   TPP 1 �½���    TEN 1 ʹ�ܶ�ʱ��     TIE 1 �����ж�               
}
