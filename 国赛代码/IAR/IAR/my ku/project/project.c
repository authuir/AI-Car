#include "all.h"

float count_pwm1,count_pwm2;
void ecode_get(float * get1,float* get2)
 {
     if(GPIO_GET(PORTC,1)) { *get2=(int16)((uint16)(0-FTM1_CNT));}
     else  {*get2=(float)((uint16)(0-FTM1_CNT))/-1;}
     if(!GPIO_GET(PORTC,4)) {*get1=(int16)((uint16)(0-FTM2_CNT));}
     else {*get1=(float)((uint16)(0-FTM2_CNT))/-1;}
      ecode_clear();
 }
void ecode_clear()
 {
     FTM1_CNT=1; FTM2_CNT=1;
 }

void OLED_init()
 {
     LCD_6x8Str(0,0,"*");
     LCD_6x8Str(2,0,"TH_: ");
     LCD_6x8Str(2,1,"driver: ");
     LCD_6x8Str(2,2,"middle_p:");
     LCD_6x8Str(2,3,"k_p:");
     LCD_6x8Str(2,4,"sub_a:");
     LCD_6x8Str(2,5,"sub_k:");
     LCD_6x8Str(2,6,"run_time:");
     display(13,0,threshold);
     display(13,1,driver);
     display(13,2,middle_p);
     display(13,3,k_p);
     display(13,4,sub_a);
     display(13,5,sub_p);
     display(13,6,run_time);
 }

void IR_INIT()
 {
	GPIO_INIT(PORTA,6,INPUT);
	GPIOPULL_SET(PORTA,6,PULL_UP);
	GPIO_INIT(PORTA,7,INPUT);
	GPIOPULL_SET(PORTA,7,PULL_UP);
    GPIOPULL_SET(PORTA,6,PULL_DOWN);
    GPIOPULL_SET(PORTA,7,PULL_DOWN);
    Enable_IRQ(INT_PORTA);
    GPIOINT_Enable(PORTA,6,LEVEL_RISING);
   // GPIOINT_Enable(PORTA,7,LEVEL_RISING);
    
 }

/*
*		1表示灯亮   0表示灯灭
*/
uint8 get_flat=0,get_flag_times=0;
extern uint32 IR_GET_value;
uint8 IR_GET()
 {
     if(IR_GET_value==1)
      {
              LED_ON(led1,led_on);
              return 1;
      }
     else 
      {
           LED_ON(led1,led_off);
              return 0;
      }
 }

extern Line center_2;
void show_all_TFT(uint8 flag)
 {
     if(flag==1)
      {
          show_image(0,0,X_MAX,Y_MAX,date);
          show_dot(left_line,left_dot,RED);
          show_dot(right_line,right_dot,BLUE);
          show_dot(center,dot_num,0);
      }
     if(flag==2)
      {
          clear_image();
          show_dot_change(left_line,left_dot,RED);
         show_dot_change(right_line,right_dot,BLUE);
          show_dot_change2(ave_line,ave_dot,0);
          //show_dot_change2(center,center_dot,0);
          show_line(k_output,b);
        LCD_ShowNum(220,100,abs(k_output*100),3,16);
        LCD_ShowNum(220,150,get_servo,3,16);
      }
     if(flag==3)
      {
	show_real_pic(0,0,X_MAX,Y_MAX,date);
	show_dot(left_line,left_dot,RED);
        show_dot(right_line,right_dot,BLUE);
        //show_dot_change(center,dot_num,0);
      }

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
     GPIO_INIT(PORTD,11,OUTPUT);
     GPIO_INIT(PORTD,12,OUTPUT);
     GPIO_SET(PORTD,11,1);
     GPIO_SET(PORTD,12,1);
 }
void LED_ON(uint8 led_num,uint8 date)
 {
     GPIO_SET(PORTD,led_num,date);
 }
void motor_PWM_init()
 {
     FTM_PWM_Init(EPWM_MODE, FTM3_CH4_PTC8, 10000, 0);
     FTM_PWM_Init(EPWM_MODE, FTM3_CH5_PTC9, 10000, 0);
     FTM_PWM_Init(EPWM_MODE, FTM3_CH6_PTC10, 10000, 0);
     FTM_PWM_Init(EPWM_MODE, FTM3_CH7_PTC11, 10000, 0);
 }
void motor_dutyset(float pwm1_duty,float pwm2_duty,float pwm3_duty,float pwm4_duty)
 {
      FTM_PWM_Set_Duty(FTM3,FTM_CH4,pwm1_duty/100);
      FTM_PWM_Set_Duty(FTM3,FTM_CH5,pwm2_duty/100);
      FTM_PWM_Set_Duty(FTM3,FTM_CH6,pwm4_duty/100);
      FTM_PWM_Set_Duty(FTM3,FTM_CH7,pwm3_duty/100);
 }
//×?μí6%￡?×???8.5%
void servo_driver_init()
 {
     FTM_PWM_Init(EPWM_MODE, FTM0_CH2_PTA5, 100,0.1408);
 }
void servo_set(float duty)
 {
     duty=(duty-500)*(17-11)/1000+14.08;
     if(duty<11) duty=11;
     if(duty>17) duty=17;
     FTM_PWM_Set_Duty(FTM0, FTM_CH2,(duty)/100);
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
void power_test_init()
 {
    ADC_Enable(ADC0);
    ADCINIT_A(ADC0,channal_b,DADP1,bite_12);
 }
uint32 POWER_reslut,POWER_ERROR_TIMES=0; 
uint8 power_value()
 {
    uint16 value=0;
     while(!ADC_S_A(ADC0));
      ADC_VALUE_A(ADC0,&value);
      POWER_reslut=((uint32)(value)*3300*133/33/4096);
      if(POWER_reslut<7500) 
       {
           POWER_ERROR_TIMES++;
           if(POWER_ERROR_TIMES>10)
               return 0;
       }
      else 
       {
           POWER_ERROR_TIMES=0;
           return 1;
       }
 }

void BTN_current_init()
 {
    ADC_Enable(ADC1);
    ADCINIT_A(ADC1,channal_b,DADP1,bite_12);
 }
uint32 BTN_result=0;
uint32 dddd[100]={0};uint16 ddd=0;
void BTN_value()
 {
     uint16 value=0;
     while(!ADC_S_A(ADC1));
      ADC_VALUE_A(ADC1,&value);
      BTN_result=((uint32)(value)*3300/4096);
      if(BTN_result>100)
       {
      dddd[ddd++]=BTN_result;
      if(ddd==100 ) ddd=0;
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