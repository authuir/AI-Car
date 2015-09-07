#include "all.h"
uint32 fac_us;
uint32 fac_ms;
uint32 fac_ns;
void SYSTICK_INIT(uint32 time_us)
 {
    SYST_CSR|=SysTick_CSR_CLKSOURCE_MASK;
    fac_us=SYS_CLOCK/1000000;
    SYST_RVR=time_us*fac_us;
 }
void SYSDelay_us(uint32 us)
 {
    fac_us=SYS_CLOCK/1000000;
     SYST_RVR=fac_us*us;
     SYST_CVR=10;
     SYST_CSR|=SysTick_CSR_CLKSOURCE_MASK;
     SYST_CSR|=SysTick_CSR_ENABLE_MASK;
     while(!((SYST_CSR>>16)&(0x01)))
      {
      }
 }
void SYSDelay_100ns(uint32 ns)
 {
     fac_ns=SYS_CLOCK/10000000;
     SYST_RVR=fac_ns*ns;
     SYST_CVR=10;
     SYST_CSR|=SysTick_CSR_CLKSOURCE_MASK;
     SYST_CSR|=SysTick_CSR_ENABLE_MASK;
     while(!((SYST_CSR>>16)&(0x01)))
      {
      }
 }
void SYSDelay_ms(uint32 ms)
 {
     int i;
     for(i=0;i<ms;i++)
      {
          SYSDelay_us(1000);
      }
 }
void SYST_Enable(void)
 {
     SYST_CSR|=SysTick_CSR_ENABLE_MASK;
 }
void SYSTINT_CLEAR(void)
 {
        SYST_CSR&=~(1<<16);
 }
void SYSTINT_Enable(void)
 {
     SYST_CSR|=(0x1)<<1;
 }