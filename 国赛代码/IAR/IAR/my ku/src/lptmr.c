#include "all.h"
void LPTMR_init(u16 CountNUM)
{
    SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;  //打开 PORTA 时钟
    PORTC_PCR5 = PORT_PCR_MUX(0x03);    //在PTA19上使用 ALT6
    SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;    //使能LPT模块时钟

    LPTMR0_CSR = 0x00;                      //关LPT 设置时钟分频

    LPTMR0_CMR = CountNUM;                       //设置比较值

    LPTMR_PSR_REG(LPTMR0_BASE_PTR) = LPTMR_PSR_PCS(1) | LPTMR_PSR_PBYP_MASK | LPTMR_PSR_PRESCALE(2);
  
    LPTMR0_CSR = LPTMR_CSR_TPS(2) | LPTMR_CSR_TMS_MASK   | LPTMR_CSR_TEN_MASK   ;
    //         TPS 01 管脚：LPTMR_ALT2  TMS 1 脉冲计数模式   TPP 1 下降沿    TEN 1 使能定时器     TIE 1 开启中断               
}
