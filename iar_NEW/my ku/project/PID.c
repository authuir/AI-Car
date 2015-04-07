#include "all.h"
float idealPitch=0.0f,idealRoll=0.0f,idealYaw=0.0f;//定义预期角度
float Kpx=0.0f,Kix=0.0f,Kdx=0.0f,Kdx_test=0.0f,Kdy_test=0.0f;//定义x轴上三个角度的PID参数
float Kpy=0.0f,Kiy=0.0f,Kdy=0.0f;
float Kpz=0.0f,Kiz=0.0f,Kdz=0.0f;

float PWM1=0.0f,PWM2=0.0f,PWM3=0.0f,PWM4=0.0f;
float driver1=0.0f,driver2=0.0f,driver3=0.0f,driver4=0.0f;
float small_angle = 6;
float max_sum=10000,min_sum=-10000;
float sum_pitch=0.0f,sum_Roll=0.0f,sum_Yaw=0.0f;

float Pitch_error,Roll_error,Yaw_error;
float Pit_out,Rol_out,Yaw_out;

float last_Roll_gyro=0;
float temp1=2.5,temp2=1;
float PWM2_Last,PWM4_Last;
void PID_init()
 {
        idealPitch = 0;
        idealRoll = 0;
        idealYaw = 0;
        Kpx =11;//1.3电机
        Kix = 0.05;//undone
        Kdx = 2.2;
        Kdx_test=2.2;
        Kpy = 9.5;//2,4电机
        Kiy = 0.055;//undone
        Kdy = 2.2;
        Kdy_test=2.2;
        Kpz = 0;
        Kiz = 0;
        Kdz = 0;
        driver1 = driver2 = driver3 = driver4 =3.6;    //di油門
 }
void PID_Control()//十字模型
 {
       DisableInterrupts
//****************************** P **************************************
       Pitch_error = Pitch - idealPitch;
       Roll_error  = Roll  - idealRoll;
       Yaw_error   = Yaw   - idealYaw;
//****************************** I **************************************
       if((Roll_error<1)&&(Roll_error>-1)) Roll_error=0;
       if((Pitch_error<1)&&(Pitch_error>-1)) Pitch_error=0;
       sum_pitch += Pitch_error;
       sum_Roll  += Roll_error;
       sum_Yaw   += Yaw_error;
      
       if(sum_pitch>max_sum) sum_pitch=max_sum;
       else if(sum_pitch<min_sum) sum_pitch=min_sum;
       if(sum_Roll>max_sum) sum_Roll=max_sum;
       else if(sum_Roll<min_sum) sum_Roll=min_sum;
       if(sum_Yaw>max_sum) sum_Yaw=max_sum;
       else if(sum_Yaw<min_sum) sum_Yaw=min_sum;
                  
                  
//****************************** D(角速度) **************************************
       //角速度项是阻尼项，使四轴速度为0
      #if 1
      if((1<Pitch_error<20)||(-1>Pitch_error>-20))
          Kdx=Kdx_test;
      else Kdx=0;
      if((1<Roll_error<20)||(-1>Roll_error>-20))
          Kdy=Kdy_test;
      else Kdy=0;
      #endif
       Pit_out = Kpx*Pitch_error +Kix*sum_pitch + Kdx*gyro[1];
       Rol_out = Kpy*Roll_error  +Kiy*sum_Roll  + Kdy*gyro[0];//当四号电机向上，gyro[0]为正，Roll也为正
       Yaw_out = Kpz*Yaw_error   +Kiz*sum_Yaw   - Kdz*gyro[2];
      if((Pitch_error<60)&&(Pitch_error>-60)&&(Roll_error<60)&&(Roll_error>-60)&&(Yaw_error<180)&&(Yaw_error>-180))
      {
          PWM1=driver1+Pit_out/300-Rol_out/300-Yaw_out/500;
          PWM2=driver2-Pit_out/300-Rol_out/300+Yaw_out/500;
          PWM3=driver3-Pit_out/300+Rol_out/300-Yaw_out/500;
          PWM4=driver4+Pit_out/300+Rol_out/300+Yaw_out/500;
      }
      else 
      {
          driver1=driver2=driver3=driver4=2;
          PWM1=PWM2=PWM3=PWM4=2;
          motor_dutyset(PWM1,PWM2,PWM3,PWM4);
          while(1)
           {
               led_shake();
               SYSDelay_ms(50);
               DisableInterrupts
           }
          
      }
      
      #if 0
      PWM2 = (PWM2 + PWM2_Last )/2;
      PWM4 = (PWM4 + PWM4_Last )/2;
      PWM2_Last = PWM2;
      PWM4_Last = PWM4;
      #endif 
      EnableInterrupts
 }