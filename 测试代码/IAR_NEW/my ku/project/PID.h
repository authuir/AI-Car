#ifndef __PID_H__
#define __PID_H__
//*********************��������
extern float idealPitch,idealRoll,idealYaw;//����Ԥ�ڽǶ�
extern float Kpx,Kix,Kdx,Kdx_test;//����x���������Ƕȵ�PID����
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