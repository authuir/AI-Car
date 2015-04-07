#ifndef __PID_H__
#define __PID_H__
//*********************变量定义
extern float idealPitch,idealRoll,idealYaw;//定义预期角度
extern float Kpx,Kix,Kdx,Kdx_test;//定义x轴上三个角度的PID参数
extern float Kpy,Kiy,Kdy,Kdy_test;
extern float Kpz,Kiz,Kdz;

extern float PWM1,PWM2,PWM3,PWM4;
extern float driver1,driver2,driver3,driver4;
extern float temp1,temp2;
extern float Pitch_error,Roll_error,Yaw_error;
extern float Pit_out,Rol_out,Yaw_out;
extern float sum_pitch,sum_Roll,sum_Yaw;


void PID_init();
void PID_Control();






#endif