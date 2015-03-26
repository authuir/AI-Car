#include "all.h"
float flag_PID=0;
void led_init()
 {
     GPIO_INIT(PORTC,5,OUTPUT);
     GPIO_INIT(PORTC,6,OUTPUT);
     GPIO_INIT(PORTC,7,OUTPUT);
     GPIO_INIT(PORTC,8,OUTPUT);
 }
void led_set(char led1,char led2,char led3,char led4)
 {
          GPIO_SET(PORTC,5,led1);
          GPIO_SET(PORTC,6,led2);
          GPIO_SET(PORTC,7,led3);
          GPIO_SET(PORTC,8,led4);
 }
void led_shake()
 {
          GPIO_OPPSITE(PORTC,5);
          GPIO_OPPSITE(PORTC,6);
          GPIO_OPPSITE(PORTC,7);
          GPIO_OPPSITE(PORTC,8);
 }
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

void display_DMP(uint8 x,uint8 y,int32 num)
 {
     LCD_8x16char(x,y,num/1000+48);
     LCD_8x16char(x+1,y,num%1000/100+48);
     LCD_8x16char(x+2,y,',');
     LCD_8x16char(x+3,y,num%100/10+48);
     LCD_8x16char(x+4,y,num%10+48);
     LCD_8x16char(x+5,y,'%');
 }
void motor_PWM_init(uint32 Freq,float duty)
 {
    FTM_PWM_Init(EPWM_MODE, FTM3_CH0_PTE5, Freq, duty);
    FTM_PWM_Init(EPWM_MODE, FTM0_CH3_PTA6, Freq, duty);
    FTM_PWM_Init(EPWM_MODE, FTM1_CH0_PTA8, Freq, duty);
    FTM_PWM_Init(EPWM_MODE, FTM2_CH0_PTA10,Freq, duty);
 }
void motor_dutyset(float pwm1_duty,float pwm2_duty,float pwm3_duty,float pwm4_duty)
 {
     FTM_PWM_Set_Duty(FTM3, FTM_CH0,(pwm1_duty/100));
     FTM_PWM_Set_Duty(FTM0, FTM_CH3,(pwm2_duty/100));
     FTM_PWM_Set_Duty(FTM1, FTM_CH0,(pwm3_duty/100));
     FTM_PWM_Set_Duty(FTM2, FTM_CH0,(pwm4_duty/100));
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
     if((data[0]==0xa0)&&(data[1]==0xa1)&&(data[2]==0xa2)&&(data[3]==0xa3))
     {
          xh.a[0]=data[4];
          xh.a[1]=data[5];
          xh.a[2]=data[6];
          xh.a[3]=data[7];
          driver1=driver2=driver3=driver4=(float)xh.val/100;
      }
     if((data[0]==0xb0)&&(data[1]==0xb1)&&(data[2]==0xb2)&&(data[3]==0xb3))
     {
          xh.a[0]=data[4];
          xh.a[1]=data[5];
          xh.a[2]=data[6];
          xh.a[3]=data[7];
          //idealPitch=(float)xh.val;
          Kpz=0+(float)xh.val/10;
      }
     if((data[0]==0xc0)&&(data[1]==0xc1)&&(data[2]==0xc2)&&(data[3]==0xc3))
     {
          xh.a[0]=data[4];
          xh.a[1]=data[5];
          xh.a[2]=data[6];
          xh.a[3]=data[7];
          //idealRoll=xh.val;
          Kiz=0+(float)xh.val/1800;
          /*switch((uint8)flag_PID)
           {
           case 1:Kix=0.05+(float)xh.val/180/18;break;
           case 2:Kiy=0.05+(float)xh.val/180/18;break;
           }*/
      }
     if((data[0]==0xd0)&&(data[1]==0xd1)&&(data[2]==0xd2)&&(data[3]==0xd3))
     {
          xh.a[0]=data[4];
          xh.a[1]=data[5];
          xh.a[2]=data[6];
          xh.a[3]=data[7];
          //idealYaw=xh.val;
          Kpz=0+(float)xh.val/72;
          /*switch((uint8)flag_PID)
           {
           case 1:Kdx=0.5+(float)xh.val/36;break;
           case 2:Kdy=0.5+(float)xh.val/36;break;
           }*/
      }
     if((data[0]==0x00)&&(data[1]==0x11)&&(data[2]==0x22)&&(data[3]==0x33))
     {
          driver1=driver2=driver3=driver4=3;
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
uint16 POWER_reslut=0;
void ADC_init_fly()
 {
     SIM_SCGC6|=SIM_SCGC6_ADC0_MASK;
     SIM_SOPT7|=SIM_SOPT7_ADC0ALTTRGEN_MASK
                |SIM_SOPT7_ADC0TRGSEL(4);
     ADC0_SC1A&=~ADC_SC1_ADCH_MASK;
     ADC0_CFG1|=ADC_CFG1_ADIV(3)|ADC_CFG1_ADLSMP_MASK
                |ADC_CFG1_MODE(1)|ADC_CFG1_ADICLK(2);
     ADC0_CFG2|=ADC_CFG2_MUXSEL_MASK|ADC_CFG2_ADLSTS(0);
     ADC0_SC2|=ADC_SC2_ADTRG_MASK;
     ADC0_SC3|=ADC_SC3_ADCO_MASK|ADC_SC3_AVGE_MASK
                |ADC_SC3_AVGS(1);
     ADC0_SC1A|=ADC_SC1_ADCH(5);
 }
void ADC_power_fly(uint16* result)
 {
     uint16 value;
      while((ADC0_SC1A&ADC_SC1_COCO_MASK)!=ADC_SC1_COCO_MASK)
      {}
      value=ADC0_RA;
      *result=(value*3300/4096)*133/33;
 }
//********************************************************************************************