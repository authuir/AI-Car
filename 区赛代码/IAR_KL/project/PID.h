#ifndef __PID_H__
#define __PID_H__


extern float input,input_sum,input_dif,input_last,output;
//middle 
extern float middle_sum_max,middle_sum_min,middle_input_last,middle_previe,middle_sum;
//k
extern float k_sum_max,k_sum_min,k_input_last,k_sum,k_output;
//speed        
extern float middle_p,middle_d,k_p,speed_p,sub_p,k_ptemp,speed_i,speed_d,min_speed;
extern uint8 close_motor;
extern float sub_a,sub_k,sub_slow;
extern float get_servo;
float middle_PID_control(float p,float i,float d);
float PID_control_k(float p,float i,float d);
void PID_speed(float p1, float i1, float d1, float p2, float i2, float d2);
float PID_Fitting();
void desier_get(float p_k,float a,float k);
extern float motor_1,motor_2;
float	tran_servo_p(int32 server_val);



#endif