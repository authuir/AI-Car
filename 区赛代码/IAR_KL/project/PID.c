#include "all.h"
float input = 0, input_sum = 0, input_dif = 0, output = 0;
//middle 
float middle_sum_max = 20, middle_sum_min = -20, middle_input_last = 0,middle_previe=0, middle_sum = 0;
//k
float k_sum_max = 20, k_sum_min = -20, k_input_last = 0, k_sum = 0, k_output = 0;
//speed        
float speed_sum_max = 10000, speed_sum_min = -10000, speed_last_error1 = 0,speed_last_twoerror1=0,speed_last_error2=0,speed_last_twoerror2=0,speed_error2=0,speed_error1 = 0;
//差速PID
float sub_a=1.02,sub_k=1;
//差速减速PID
float sub_slow = 1.2;
uint8 close_motor=0;
float middle_p=5,middle_d=7,k_p=400,speed_p=10,sub_p=1,k_ptemp,speed_i=0.004,speed_d=0,min_speed=18;
float get_servo=0,middle_input=0;

float middle_PID_control(float p, float i, float d)
{
	float  middle_output = 0;
#if 1
	
	middle_previe=middle_input_last;
	middle_input_last = middle_input;
	middle_input=get_servo-Y_MAX_OUT/2;
	middle_sum += middle_input;
	if (middle_sum>middle_sum_max) middle_sum = middle_sum_max;
	else if (middle_sum<middle_sum_min) middle_sum = middle_sum_min;
	if(get_servo>Y_MAX_OUT/2)
		p=p+0.5*0.001*(get_servo-Y_MAX_OUT/2)*(get_servo-Y_MAX_OUT/2);//平方  不同斜率下的P的函数
	// p=5+((count_pwm1+count_pwm2)/2-driver)*k;
	
	middle_output = p*middle_input + i*middle_sum + d*(middle_input-middle_input_last);
#else
	middle_output = 175 * k_output;
#endif
	return middle_output;
}


//查表法
float tran_servo_p(int32 Servo_Val)
{
	if (Servo_Val<90)
		return 7.19;
	else if (Servo_Val<100)
		return 6.99;
	else if (Servo_Val<110)
		return 7.79;
	else if (Servo_Val<115)
		return 8.39;
	else if (Servo_Val<120)
		return 8.59;	
	else if (Servo_Val<130)
		return 9.99;
	else if (Servo_Val<140)
		return 10.19;
	else if (Servo_Val<145)
		return 9.39;	
	else if (Servo_Val<150)
		return 7.89;	
	else if (Servo_Val<155)
		return 5.79;	
	else if (Servo_Val<160)
		return 4.60;
	else if (Servo_Val<165)
		return 4.00;	
	else if (Servo_Val<170)
		return 6.76;	
	else if (Servo_Val<175)
		return 6.59;	
	else if (Servo_Val<180)
		return 6.79;	
	else if (Servo_Val<190)
		return 6.39;	
	else if (Servo_Val<200)
		return 6.59;
	else if (Servo_Val<205)
		return 5.99;	
	else if (Servo_Val<220)
		return 5.59;	
	else
		return 5.99;		
}

//MATLAB拟合
/*
float	tran_server_p(int32 server_val)
{
	int32 temp=0;
	
	#if 1
	if(server_val>155)
	{
		temp=2*server_val*server_val-838*server_val+164100;
		if(temp>15000)
			temp=15000;
		if(temp<0)
			temp=0;
		return  (float)(temp/10000);
	}
	else
	{
		temp=11*server_val*server_val-1723*server_val+133500;
		if(temp>15000)
			temp=15000;
		if(temp<0)
			temp=0;
		return  (float)(temp/10000);
	}
	
	#endif
	
	#if 0
	if(server_val>155)
	{
		temp=7*server_val*server_val-2317*server_val+188000;
		if(temp>15000)
			temp=15000;
		if(temp<0)
			temp=0;
		return  (float)(temp/1000);
	}
	else
	{
		temp=5*server_val*server_val-1587*server_val+134400;
		if(temp>15000)
			temp=15000;
		if(temp<0)
			temp=0;
		return  (float)(temp/1000);
	}
	
	#endif
}*/

float  driver = 85;float speed_output = 0,desier_driver1=0,desier_driver2=0;
extern float input_servor;
float PID_control_k(float p, float i, float d)
{
	float ka_output, k_sum = 0, input_error = 0;
	input_error = k_output;
	k_sum += input_error;
	if (k_sum >= k_sum_max) k_sum = k_sum_max;
	else if (k_sum <= k_sum_min) k_sum = k_sum_min;
	//p=p*(count_pwm2/desier_driver1+count_pwm1/desier_driver2)/2;//速度和p关系
	//if(p<100) p=100;
	ka_output = p*input_error + i*k_sum + d*(input_error - k_input_last);
	k_input_last = input_error;
	return ka_output;
}
extern uint16 type;
void desier_get(float p_k,float a,float k) //获得期望速度
{
	float k_in;
	if(k_output>0) k_in=k_output;
	else k_in=k_output/-1;
    float driver_temp=driver;
    if((close_motor==0)&&(type==4)||(type==7))driver_temp=50;
#if 1
	driver_temp=driver_temp*(1-k_in*p_k*k_in);
    if(driver_temp<0) driver_temp=0;
	if(close_motor==0)
	{
		if(driver_temp<50) driver_temp=50;
	}
	desier_driver1=driver_temp/(-0.0006369*input_servor + 1.322);
	desier_driver2=driver_temp*(-0.0006369*input_servor + 1.322);//差速
	if(desier_driver1<0) desier_driver1=0;
	if(desier_driver2<0) desier_driver2=0;
#endif
}
float motor_1=10,motor_2=10;
void PID_speed(float p1, float i1, float d1, float p2, float i2, float d2)
{
#if 1
	//motor1
	float motor_pwm1, motor_pwm2, motor_pwm3, motor_pwm4;
	speed_last_twoerror1=speed_last_error1;
	speed_last_error1 = speed_error1;
	speed_error1=desier_driver1-count_pwm1 ;
	if(close_motor==1)
	{
		i1*=20;i2*=20;
	}
	motor_1+=p1*(speed_error1- speed_last_error1)+ i1*speed_error1+d1*((speed_error1-speed_last_error1)-(speed_last_error1-speed_last_twoerror1));
	
	
	if(motor_1>0) {motor_pwm1=motor_1;motor_pwm2=0;}
	else {motor_pwm1=0;motor_pwm2=motor_1/-1;}
	
	//motor2 
	speed_last_twoerror2=speed_last_error2;
	speed_last_error2 = speed_error2;
	speed_error2=desier_driver2-count_pwm2 ;
	
	motor_2+=p2*(speed_error2- speed_last_error2)+ i2*speed_error2+d2*((speed_error2-speed_last_error2)-(speed_last_error2-speed_last_twoerror2)); 
	if(motor_2>0) {motor_pwm3=motor_2;motor_pwm4=0;}
	else {motor_pwm3=0;motor_pwm4=motor_2/-1;}
	
	motor_pwm1/=2;motor_pwm2/=2;motor_pwm3/=2;motor_pwm4/=2;
	if(motor_pwm1>99)  motor_pwm1=99;
	if(motor_pwm2>99)  motor_pwm2=99;
	if(motor_pwm3>99)  motor_pwm3=99;
	if(motor_pwm4>99)  motor_pwm4=99;
#if 0       //被动差速
	if(k_output>0) motor_pwm1=motor_pwm3;
	else motor_pwm3=motor_pwm1;
#endif
	motor_dutyset(motor_pwm1, motor_pwm2, motor_pwm3, motor_pwm4);
	
#endif  
}