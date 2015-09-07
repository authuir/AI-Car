#include "all.h"
#define Confirm_Times 10
#define ir_num  3
uint8 Loop_Count = 0;
extern uint8 flag_photo;
extern uint8 IS_Stop_ByIR;
uint8 IR_Val = 0;     
uint8 IS_After_6s = 0,Not_Started = 1,Ready_Stop = 0;
uint8 open_6s=0;
uint8 Confirm_Start = 0;
uint8 Confirm_Ready_Stop = 0;
uint8 Confirm_Stop = 0;

uint32 ir_counter=0;

uint32 ir_counter_Big=0;
uint32 ir_counter_Small=0;
uint32 ir_counter_AB=0;

uint8 ir_num_Big=0;
uint8 ir_num_Small=0;
uint8 ir_num_AB=0;


uint32 ir_flag_Big=0;
uint32 ir_flag_Small=0;
uint32 ir_flag_AB=0;



#define L1_R1 ((GPIO_GET(PORTD,7)==1)&&(GPIO_GET(PORTD,6)==1))
#define L1_R0 ((GPIO_GET(PORTD,7)==1)&&(GPIO_GET(PORTD,6)==0))
#define L0_R1 ((GPIO_GET(PORTD,7)==0)&&(GPIO_GET(PORTD,6)==1))
#define L0_R0 ((GPIO_GET(PORTD,7)==0)&&(GPIO_GET(PORTD,6)==0))

void my_systick_delay(uint32 time)
{
    if(time == 0)
    {
        return;
    }

    ASSERT(time <= (SysTick_RVR_RELOAD_MASK >> SysTick_RVR_RELOAD_SHIFT));  //24位

    SYST_CSR = 0x00;                        //先关了 systick ,清标志位

    SYST_RVR = time;                        //设置延时时间

    SYST_CVR = 0x00;                        //清空计数器

    SYST_CSR = ( 0
                 | SysTick_CSR_ENABLE_MASK       //使能 systick
                 //| SysTick_CSR_TICKINT_MASK    //使能中断 (注释了表示关闭中断)
                 | SysTick_CSR_CLKSOURCE_MASK    //时钟源选择 ( core clk)
               );

    while( !(SYST_CSR & SysTick_CSR_COUNTFLAG_MASK))   //等待时间到
    {
      if(flag_photo)
        break;
    }

}

void my_systick_delay_ms(uint32 ms)
{
    while(ms--)
    {
        my_systick_delay(SYSTICK_CLK_KHZ);
       if(flag_photo)
        break;
    }
}
void IR_INIT()
{
	GPIO_INIT(PORTD,6,INPUT);
	GPIO_INIT(PORTD,7,INPUT);
	GPIOPULL_SET(PORTD,6,PULL_DOWN);
	GPIOPULL_SET(PORTD,7,PULL_DOWN);
}

uint8 IR_Have_times=0,IR_counter=0;
#if 0
uint8 IR_Get()
 {
     IR_counter++;
     if ( (GPIO_GET(PORTD,7) == 1)&&(GPIO_GET(PORTD,6) == 1) )
      {
          IR_Have_times++;IR_counter=0;
      }
     else if((GPIO_GET(PORTD,7) == 0)&&(GPIO_GET(PORTD,6) == 0))
      {
          IR_Have_times=0;IR_counter++;
      }
     else IR_counter=0;
     if(IR_Have_times>=3)
      {
          ir_flag_AB=1;
      }
     if(IR_counter>5) ir_flag_AB=0;
     if(ir_flag_AB)
      {
          LED_ON(led0,led_on);
		LED_ON(led1,led_on);
      }
     else
      {
           LED_ON(led0,led_off);
		LED_ON(led1,led_off);
      }
 }
#endif
#if 1
uint8 IR_Get()
{
	/////////////////Small////////////////////
	if( (GPIO_GET(PORTD,6) == 1))
	{
		
			if(ir_counter_Small==ir_num)
			{
				LED_ON(led0,led_on);
				ir_flag_Small=1;
				ir_counter_Small=0;
				
			}
			else
			{
				ir_counter_Small++;
			}
		
	}
	else
	{
		LED_ON(led0,led_off);
		ir_flag_Small=0;
                ir_counter_Small=0;
	}
////////////////////////Big///////////////////////
	if( (GPIO_GET(PORTD,7) == 1))
	{
		
			if(ir_counter_Big==ir_num)
			{
				LED_ON(led1,led_on);
				ir_flag_Big=1;
				ir_counter_Big=0;
				
			}
			else
			{
				ir_counter_Big++;
			}
		
	}
	else
	{
		LED_ON(led1,led_off);
		ir_flag_Big=0;
                ir_counter_Big=0;
	}

////////////////////AB////////////////////
	   if(ir_flag_Big&&ir_flag_Small)
        {
          ir_flag_AB=1;
        }
        else
        {
          ir_flag_AB=0;
        }
	return 0;
}
#endif

void IR_Control()
{
	
#if 0
	uint8 L_IR=0,R_IR=0;
	L_IR = GPIO_GET(PORTD,7);
	R_IR = GPIO_GET(PORTD,6);
	if (L_IR)
		LED_ON(led0,led_on);
	else
		LED_ON(led0,led_off);
	if (R_IR)
		LED_ON(led1,led_on);
	else
		LED_ON(led1,led_off);
#endif
	
	IR_Get();
//	Loop_Count++;
//	if (Loop_Count == 4)
//	{
//		Loop_Count = 0;
		if ((!(ir_flag_AB==1))&& IS_After_6s==0 && Not_Started==1)
		{
			start_run=1;
			Not_Started = 0;
			PIT_Enable(PIT0);
			open_6s=1;
		}
		if ( (IS_After_6s==1)&&(IS_Stop_ByIR==1) )
		{
			if (ir_flag_AB)
			{
				Ready_Stop = 1;
			}
			if ( ir_flag_Big==0 && ir_flag_Small==0 && (Ready_Stop==1) )
			{
				driver=0;
				close_motor=1;
			}
		}
//	}
	
	
	/*
	if ((!L1_R1)&& IS_After_6s==0 && Not_Started==1)
	{
	if (Confirm_Start==Confirm_Times)
	{
	start_run=1;
	Not_Started = 0;
	PIT_Enable(PIT0);
	open_6s=1;
}
	Confirm_Start++;
} else {
	Confirm_Start = 0;
}
	if ( (IS_After_6s==1)&&(IS_Stop_ByIR==1) )
	{
	if (L1_R1)
	{
	if (Confirm_Ready_Stop == Confirm_Times)
	Ready_Stop = 1;
	Confirm_Ready_Stop++;
} else {
	Confirm_Ready_Stop = 0;
}
	if ( L0_R0 && (Ready_Stop==1) )
	{
	if (Confirm_Stop == Confirm_Times)
	{
	Ready_Stop = 1;
	Confirm_Stop = 1;
	driver=0;
	close_motor=1;
}
	Confirm_Stop++;
} else {
	Confirm_Stop = 0;
}
	
}
	*/
}
