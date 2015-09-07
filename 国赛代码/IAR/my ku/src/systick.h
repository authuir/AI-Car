#ifndef __SYSTICK_H__
#define __SYSTICK_H__
extern  uint32 fac_us;
extern uint32 fac_ms;
void SYSTICK_INIT(uint32 time_us);
void SYSDelay_us(uint32 us);//0-100ms
void SYSDelay_ms(uint32 ms);
void SYST_Enable(void);
void SYSTINT_CLEAR(void);
void SYSTINT_Enable(void);
void SYSDelay_100ns(uint32 ns);












#endif