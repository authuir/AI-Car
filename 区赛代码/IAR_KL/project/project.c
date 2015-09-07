#include "all.h"

float count_pwm1=0,count_pwm2=0;
float Mid_PWM = 13.82;
extern uint8 Adjust_Runtime;

void ecode_init()
{
	GPIO_INIT(PORTC,17,0);
	GPIO_INIT(PORTC,11,0);
	GPIOPULL_SET(PORTC,17,PULL_DOWN);
	GPIOPULL_SET(PORTC,11,PULL_DOWN);
	tpm_pulse_init(TPM2,TPM_CLKIN0,TPM_PS_1); //初始化 TPM2 为脉冲累加，输入管脚为 TPM_CLKIN0_PIN ，分频系数为 1
	lptmr_pulse_init(LPT0_ALT2,0xffff, LPT_Rising);    //初始化脉冲计数器，用LPT0_ALT2，即PTC5输入，每隔INT_COUNT产生中断（需要开中断才能产生中断），上升沿触发
	
}
void ecode_get(float * get1,float* get2)
{
	if(GPIO_GET(PORTC,17)) { *get1=(float)tpm_pulse_get(TPM2)/-1;}
	else { *get1=(float)tpm_pulse_get(TPM2);}
	if(!GPIO_GET(PORTC,11)) {*get2=(float)lptmr_pulse_get()/-1; }
	else {*get2=lptmr_pulse_get();} 
	ecode_clear();
}
void ecode_clear()
{
	tpm_pulse_clean(TPM2);
	lptmr_pulse_clean();
}
void OLED_init()
{
	LCD_6x8Str(2,0,"RunTime: ");
	LCD_6x8Str(2,1,"driver: ");
	LCD_6x8Str(2,2,"middle_p:");
	LCD_6x8Str(2,3,"sub_a:");
	LCD_6x8Str(2,4,"forward:");
	LCD_6x8Str(2,5,"sub_slow:");
	LCD_6x8Str(2,6,"middle_d:");
	display(13,0,Adjust_Runtime);
	display(13,1,driver);
	display(13,2,middle_p);
	display(13,3,sub_a);
	display(13,4,for_ward);
	display(13,5,sub_slow);
	display(13,6,middle_d);
}

extern Line center_2;
void show_all_TFT(uint8 flag)
{
	/*  if(flag==1)
	{
	show_image(0,0,X_MAX,Y_MAX,date);
	show_dot(left_line,left_dot,RED);
	show_dot(right_line,right_dot,BLUE);
	show_dot(center,dot_num,0);
}*/
	if(flag==2)
	{
		clear_image();
		show_dot_change(left_line,left_dot,RED);
		show_dot_change(right_line,right_dot,BLUE);
		show_dot_change2(center,center_dot,0);
		show_line(k_output,b);
		LCD_ShowNum(220,100,abs(k_output*100),3,16);
		LCD_ShowNum(220,150,get_servo,3,16);
	}
	if(flag==1)
	{
		show_real_pic(0,0,X_MAX,Y_MAX,date);
		show_dot(left_line,left_dot,RED);
		show_dot(right_line,right_dot,BLUE);
		//show_dot_change(center,dot_num,0);
	}
	
}

void display_Big_Num(uint8 x,uint8 y,uint32 xxx)
{
	
	LCD_6x8char(x,y,xxx/100000+48);
	LCD_6x8char(x+1,y,xxx%100000/10000+48);
	LCD_6x8char(x+2,y,xxx%10000/1000+48);
	LCD_6x8char(x+3,y,xxx%1000/100+48);
	LCD_6x8char(x+4,y,xxx%100/10+48);
	LCD_6x8char(x+5,y,xxx%10+48);
}

void display(uint8 x,uint8 y,float xxx)
{
	int32 num=xxx*100;
	if(num<0)
	{
		LCD_6x8char(x-1,y,'-');
		num=num*(-1);
	}
	else LCD_6x8char(x-1,y,' ');
	LCD_6x8char(x,y,num/10000+48);
	LCD_6x8char(x+1,y,num%10000/1000+48);
	LCD_6x8char(x+2,y,num%1000/100+48);
	LCD_6x8char(x+3,y,'.');
	LCD_6x8char(x+4,y,num%100/10+48);
	LCD_6x8char(x+5,y,num%10+48);
}

void led_init()
{
	GPIO_INIT(PORTE,22,OUTPUT);
	GPIO_INIT(PORTE,23,OUTPUT);
	GPIO_SET(PORTE,22,1);
	GPIO_SET(PORTE,23,1);
}

void LED_ON(uint8 led_num,uint8 date)
{
	GPIO_SET(PORTE,led_num,date);
}

void motor_PWM_init()
{
	FTM_PWM_Init(TPM0, TPM_CH3, 15000, 0);
	FTM_PWM_Init(TPM0, TPM_CH2, 15000, 0);
	FTM_PWM_Init(TPM0, TPM_CH5, 15000, 0);
	FTM_PWM_Init(TPM0, TPM_CH4, 15000, 0);
}

void motor_dutyset(float pwm1_duty,float pwm2_duty,float pwm3_duty,float pwm4_duty)
{
	FTM_PWM_Set_Duty(TPM0,TPM_CH3,pwm1_duty*10);
	FTM_PWM_Set_Duty(TPM0,TPM_CH2,pwm2_duty*10);
	FTM_PWM_Set_Duty(TPM0,TPM_CH5,pwm3_duty*10);
	FTM_PWM_Set_Duty(TPM0,TPM_CH4,pwm4_duty*10);
}

void servo_driver_init()
{
	FTM_PWM_Init(TPM1, TPM_CH0, 100, 1382);
}

void servo_set(float duty)
{
	duty=(duty-500)*(17.4-10.4)/1000+Mid_PWM ;
	if(duty<10.4) duty=10.4;
	if(duty>17.4) duty=17.4;
	FTM_PWM_Set_Duty(TPM1, TPM_CH0,(uint32)((duty)*100));
}

void translate_uart(short acc)
{
	if(acc<0)
	{
		UART_S1(UART0,'-');
		acc=acc*(-1);
	}
	UART_S1(UART0,(uint8)(acc/10000)+48);
	UART_S1(UART0,(uint8)(acc%10000/1000)+48);
	UART_S1(UART0,(uint8)(acc%1000/100)+48);
	UART_S1(UART0,'.');
	UART_S1(UART0,(uint8)(acc%100/10)+48);
	UART_S1(UART0,(uint8)(acc%10)+48);
	UART_S1(UART0,' ');
}
union 
{
	uint8 a[4];
	float val;
}xg;
union
{
	uint8 a[4];
	uint32 val;
}xi;
union 
{
	uint8 a[4];
	int32 val;
}xh;
void send_flot(uint32 UART_NUM,float val)
{
	xg.val=val;
	UART_SS(UART_NUM,"flot");
	UART_S1(UART_NUM,xg.a[3]);
	UART_S1(UART_NUM,xg.a[2]);
	UART_S1(UART_NUM,xg.a[1]);
	UART_S1(UART_NUM,xg.a[0]);
}
void send_float_other(uint32 UART_NUM,float val)
{
	xg.val=val;
	UART_S1(UART_NUM,0X55);
	UART_S1(UART_NUM,0X0F);
	UART_S1(UART_NUM,xg.a[0]);
	UART_S1(UART_NUM,xg.a[1]);
	UART_S1(UART_NUM,xg.a[2]);
	UART_S1(UART_NUM,xg.a[3]);
	UART_S1(UART_NUM,0XAA);
}
void send_int32(uint32 UART_NUM,int val)
{
	xh.val=val;
	UART_SS(UART_NUM,"in32");
	UART_S1(UART_NUM,xh.a[3]);
	UART_S1(UART_NUM,xh.a[2]);
	UART_S1(UART_NUM,xh.a[1]);
	UART_S1(UART_NUM,xh.a[0]);
}
void send_line(uint32 UART_NUM,char line_num,float val)
{
	xg.val=val;
	UART_SS(UART_NUM,"lin");
	UART_S1(UART_NUM,line_num+48);
	UART_S1(UART_NUM,xg.a[3]);
	UART_S1(UART_NUM,xg.a[2]);
	UART_S1(UART_NUM,xg.a[1]);
	UART_S1(UART_NUM,xg.a[0]);
}

void send_line_other(uint32 UART_NUM,char line_num,float xxx)
{
	xg.val=xxx;
	UART_S1(UART_NUM,0X55);
	UART_S1(UART_NUM,0X0F+line_num*0x10);
	UART_S1(UART_NUM,xg.a[0]);
	UART_S1(UART_NUM,xg.a[1]);
	UART_S1(UART_NUM,xg.a[2]);
	UART_S1(UART_NUM,xg.a[3]);
	UART_S1(UART_NUM,0XAA);
}
void read_pose(uint32 UART_NUM,char* data)
{
	float driver_get;
	if((data[0]==8)&&(data[1]==0)&&(data[2]==2)&&(data[3]==3))
	{
		xg.a[0]=data[7];
		xg.a[1]=data[6];
		xg.a[2]=data[5];
		xg.a[3]=data[4];
		driver_get=(float)xg.val;
		servo_set(driver_get);
	}
	if((data[0]==8)&&(data[1]==1)&&(data[2]==2)&&(data[3]==3))
	{
		xg.a[0]=data[7];
		xg.a[1]=data[6];
		xg.a[2]=data[5];
		xg.a[3]=data[4];
		driver_get=(float)xg.val;
		motor_dutyset(0,driver_get,0,driver_get);
	}
}
void change_par(char* data,float *date)
{
	if((data[0]==8)&&(data[1]==2)&&(data[2]==2)&&(data[3]==3))
	{
		xg.a[0]=data[7];
		xg.a[1]=data[6];
		xg.a[2]=data[5];
		xg.a[3]=data[4];
		*date=(float)xg.val;
	}
	if((data[0]==8)&&(data[1]==3)&&(data[2]==2)&&(data[3]==3))
	{
		xg.a[0]=data[7];
		xg.a[1]=data[6];
		xg.a[2]=data[5];
		xg.a[3]=data[4];
		*date=(float)xg.val;
	}
	if((data[0]==8)&&(data[1]==4)&&(data[2]==2)&&(data[3]==3))
	{
		xg.a[0]=data[7];
		xg.a[1]=data[6];
		xg.a[2]=data[5];
		xg.a[3]=data[4];
		*date=(float)xg.val;
	}
}

void P1_I1_D1_change(float* P1,float* I1,float* D1,char* dateeee)
{
	if((dateeee[0]==0xaa)&&(dateeee[1]==0xab)&&(dateeee[2]==0xac)&&(dateeee[3]==0xad))
	{
		xg.a[0]=dateeee[4];
		xg.a[1]=dateeee[5];
		xg.a[2]=dateeee[6];
		xg.a[3]=dateeee[7];
		*P1=xg.val;
	}
	if((dateeee[0]==0xba)&&(dateeee[1]==0xbb)&&(dateeee[2]==0xbc)&&(dateeee[3]==0xbd))
	{
		xg.a[0]=dateeee[4];
		xg.a[1]=dateeee[5];
		xg.a[2]=dateeee[6];
		xg.a[3]=dateeee[7];
		*I1=xg.val;
	}
	if((dateeee[0]==0xca)&&(dateeee[1]==0xcb)&&(dateeee[2]==0xcc)&&(dateeee[3]==0xcd))
	{
		xg.a[0]=dateeee[4];
		xg.a[1]=dateeee[5];
		xg.a[2]=dateeee[6];
		xg.a[3]=dateeee[7];
		*D1=xg.val;
	}
}
void P2_I2_D2_change(float* P2,float* I2,float* D2,char* daeett)
{
	if((daeett[0]==0xda)&&(daeett[1]==0xdb)&&(daeett[2]==0xdc)&&(daeett[3]==0xdd))
	{
		xg.a[0]=daeett[4];
		xg.a[1]=daeett[5];
		xg.a[2]=daeett[6];
		xg.a[3]=daeett[7];
		*P2=xg.val;
	}
	if((daeett[0]==0xea)&&(daeett[1]==0xeb)&&(daeett[2]==0xec)&&(daeett[3]==0xed))
	{
		xg.a[0]=daeett[4];
		xg.a[1]=daeett[5];
		xg.a[2]=daeett[6];
		xg.a[3]=daeett[7];
		*I2=xg.val;
	}
	if((daeett[0]==0xfa)&&(daeett[1]==0xfb)&&(daeett[2]==0xfc)&&(daeett[3]==0xfd))
	{
		xg.a[0]=daeett[4];
		xg.a[1]=daeett[5];
		xg.a[2]=daeett[6];
		xg.a[3]=daeett[7];
		*D2=xg.val;
	}
}
//********************************************************************************************