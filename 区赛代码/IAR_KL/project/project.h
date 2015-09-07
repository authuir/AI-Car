#include "Catch.h" 
#ifndef __PROJECT_H__
#define __PROJECT_H__
#define led_on  0
#define led_off 1
#define led0    22
#define led1    23
extern uint32 IR_GET_value;
extern uint32 POWER_reslut;
extern uint32 BTN_result;
void ecode_get(float * get1,float* get2);
void ecode_clear();
void ecode_init();
void show_all_TFT(uint8 flag);
void display(uint8 x,uint8 y,float xxx);
void led_init();
void LED_ON(uint8 led_num,uint8 date);
void motor_PWM_init();
void motor_dutyset(float pwm1_duty,float pwm2_duty,float pwm3_duty,float pwm4_duty);
void servo_driver_init();
void servo_set(float duty);
void translate_uart(short acc);
void send_flot(uint32 UART_NUM,float val);
void send_float_other(uint32 UART_NUM,float val);
void send_int32(uint32 UART_NUM,int val);
void send_line(uint32 UART_NUM,char line_num,float val);
void show_real_pic(uint16 x,uint16 y,uint16 hang,uint16 lie,uint8  date1[X_MAX][Y_MAX]);
void send_line_other(uint32 UART_NUM,char line_num,float xxx);
void read_pose(uint32 UART_NUM,char* data);
void change_par(char* data,float *date);
void power_test_init();
uint8 power_value();
void BTN_current_init();
void BTN_value();

extern float count_pwm1,count_pwm2;
void P1_I1_D1_change(float* P1,float* I1,float* D1,char* dateeee);
void P2_I2_D2_change(float* P2,float* I2,float* D2,char* daeett);

#endif