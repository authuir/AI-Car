#ifndef __PROJECT_H__
#define __PROJECT_H__

extern float flag_PID;
void display(uint8 x,uint8 y,int32 num);
void display_DMP(uint8 x,uint8 y,int32 num);
void motor_PWM_init(uint32 Freq,float duty);
void motor_dutyset(float pwm1_duty,float pwm2_duty,float pwm3_duty,float pwm4_duty);
void translate_uart(short acc);

void send_float(uint32 UART_NUM,float val);
void send_uint32(uint32 UART_NUM,uint32 val);
void send_uint32(uint32 UART_NUM,uint32 val);
void send_flot(uint32 UART_NUM,float val);
//传输数据到六条曲线显示，line_num:1-6,表示曲线标号
//val:要传输的数值
void send_line(uint32 UART_NUM,char line_num,float val);
//**************************************************************
//pose_mode:pose_power
//          pose_pitch
//          pose_roll
//          pose_yaw
//**************************************************************
void read_pose(uint32 UART_NUM,char* data);

void led_init();
void led_set(char led1,char led2,char led3,char led4);
void led_shake();
void P1_I1_D1_change(float* P1,float* I1,float* D1,char* data);
void P2_I2_D2_change(float* P2,float* I2,float* D2,char* data);
extern uint16 POWER_reslut;
void ADC_init_fly();
void ADC_power_fly(uint16* result);













#endif