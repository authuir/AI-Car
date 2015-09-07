#include "all.h"



void display(uint8 x,uint8 y,int32 num)
 {
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

void motor_PWM_init()
 {
     GPIO_INIT(PORTA,6,OUTPUT);
     GPIO_INIT(PORTA,7,OUTPUT);
     GPIO_INIT(PORTA,8,OUTPUT);
     GPIO_INIT(PORTA,9,OUTPUT);
     GPIO_SET(PORTA,6,1);
     GPIO_SET(PORTA,9,0);
     GPIO_SET(PORTA,8,1);
     FTM_PWM_Init(EPWM_MODE, FTM0_CH4_PTA7, 50, 0);
 }
void motor_dutyset(float pwm1_duty)
 {
      FTM_PWM_Set_Duty(FTM0,FTM_CH4,pwm1_duty/100);
 }
void servo_driver_init()
 {
     FTM_PWM_Init(EPWM_MODE, FTM2_CH0_PTA10, 50, 0);
 }
void servo_set(float duty)
 {
     FTM_PWM_Set_Duty(FTM2, FTM_CH0,((15-duty)/100));
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
//***********************************************************************************************
//只适用用学长写的上位机，可删除
//传输一个float类型值给上位机
void send_float(uint32 UART_NUM,float val)
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
void send_uint32(uint32 UART_NUM,uint32 val)
 {
     xi.val=val;
     UART_SS(UART_NUM,"ui32");
     UART_S1(UART_NUM,xi.a[3]);
     UART_S1(UART_NUM,xi.a[2]);
     UART_S1(UART_NUM,xi.a[1]);
     UART_S1(UART_NUM,xi.a[0]);
 }
void send_flot(uint32 UART_NUM,float val)
 {
     xg.val=val;
     UART_SS(UART_NUM,"flot");
     UART_S1(UART_NUM,xg.a[3]);
     UART_S1(UART_NUM,xg.a[2]);
     UART_S1(UART_NUM,xg.a[1]);
     UART_S1(UART_NUM,xg.a[0]);
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
//传输数据到六条曲线显示，line_num:1-6,表示曲线标号
//val:要传输的数值
void send_line(uint32 UART_NUM,char line_num,float val)
 {
     xg.val=val;
     UART_S1(UART_NUM,0X55);
     UART_S1(UART_NUM,0X0F+line_num*0x10);
     UART_S1(UART_NUM,xg.a[0]);
     UART_S1(UART_NUM,xg.a[1]);
     UART_S1(UART_NUM,xg.a[2]);
     UART_S1(UART_NUM,xg.a[3]);
     UART_S1(UART_NUM,0XAA);
 }
void send_line2(uint32 UART_NUM,char line_num,float val)
 {
     xg.val=val;
     UART_SS(UART_NUM,"lin");
     UART_S1(UART_NUM,line_num+48);
     UART_S1(UART_NUM,xg.a[3]);
     UART_S1(UART_NUM,xg.a[2]);
     UART_S1(UART_NUM,xg.a[1]);
     UART_S1(UART_NUM,xg.a[0]);
 }
void read_pose(uint32 UART_NUM,char* data)
 {
     float driver;
     if((data[0]==8)&&(data[1]==0)&&(data[2]==2)&&(data[3]==3))
     {
          xg.a[0]=data[7];
          xg.a[1]=data[6];
          xg.a[2]=data[5];
          xg.a[3]=data[4];
          driver=(float)xg.val;
          servo_set(driver);
      }
     if((data[0]==8)&&(data[1]==1)&&(data[2]==2)&&(data[3]==3))
      {
          xg.a[0]=data[7];
          xg.a[1]=data[6];
          xg.a[2]=data[5];
          xg.a[3]=data[4];
          driver=(float)xg.val;
          motor_dutyset(driver);
      }
 }
void P1_I1_D1_change(float* P1,float* I1,float* D1,char* data)
 {
     if((data[0]==0xaa)&&(data[1]==0xab)&&(data[2]==0xac)&&(data[3]==0xad))
      {
          xg.a[0]=data[4];
          xg.a[1]=data[5];
          xg.a[2]=data[6];
          xg.a[3]=data[7];
          *P1=xg.val;
      }
     if((data[0]==0xba)&&(data[1]==0xbb)&&(data[2]==0xbc)&&(data[3]==0xbd))
      {
          xg.a[0]=data[4];
          xg.a[1]=data[5];
          xg.a[2]=data[6];
          xg.a[3]=data[7];
          *I1=xg.val;
      }
     if((data[0]==0xca)&&(data[1]==0xcb)&&(data[2]==0xcc)&&(data[3]==0xcd))
      {
          xg.a[0]=data[4];
          xg.a[1]=data[5];
          xg.a[2]=data[6];
          xg.a[3]=data[7];
          *D1=xg.val;
      }
 }
void P2_I2_D2_change(float* P2,float* I2,float* D2,char* data)
 {
     if((data[0]==0xda)&&(data[1]==0xdb)&&(data[2]==0xdc)&&(data[3]==0xdd))
      {
          xg.a[0]=data[4];
          xg.a[1]=data[5];
          xg.a[2]=data[6];
          xg.a[3]=data[7];
          *P2=xg.val;
      }
     if((data[0]==0xea)&&(data[1]==0xeb)&&(data[2]==0xec)&&(data[3]==0xed))
      {
          xg.a[0]=data[4];
          xg.a[1]=data[5];
          xg.a[2]=data[6];
          xg.a[3]=data[7];
          *I2=xg.val;
      }
     if((data[0]==0xfa)&&(data[1]==0xfb)&&(data[2]==0xfc)&&(data[3]==0xfd))
      {
          xg.a[0]=data[4];
          xg.a[1]=data[5];
          xg.a[2]=data[6];
          xg.a[3]=data[7];
          *D2=xg.val;
      }
 }
//********************************************************************************************