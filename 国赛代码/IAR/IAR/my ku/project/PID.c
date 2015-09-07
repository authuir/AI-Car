#include "all.h"
float input = 0, input_sum = 0, input_dif = 0, output = 0;
//middle 
float middle_sum_max = 20, middle_sum_min = -20, middle_input_last = 0,middle_previe=0, middle_sum = 0;
//k
float k_sum_max = 20, k_sum_min = -20, k_input_last = 0, k_sum = 0, k_output = 0;;
//speed        
float speed_sum_max = 10000, speed_sum_min = -10000, speed_last_error1 = 0,speed_last_twoerror1=0,speed_last_error2=0,speed_last_twoerror2=0,speed_error2=0,speed_error1 = 0;
//差速PID
float sub_a=0.44,sub_k=1;
uint8 close_motor=0;
float middle_p=7,k_p=400,speed_p=10,sub_p=1,k_ptemp,speed_i=0.04,speed_d=0,min_speed=18;
float get_servo=0,middle_input=0;
float middle_PID_control(float p, float i, float d)
 {
     float  middle_output = 0;
          middle_previe=middle_input_last;
     middle_input_last = middle_input;
     middle_input=get_servo-Y_MAX_OUT/2;
     middle_sum += middle_input;
     if (middle_sum>middle_sum_max) middle_sum = middle_sum_max;
     else if (middle_sum<middle_sum_min) middle_sum = middle_sum_min;
     middle_output = p*middle_input + i*middle_sum + d*(middle_input-middle_input_last);
     return middle_output;
 }
float  driver = 20;float speed_output = 0,desier_driver1=0,desier_driver2=0;

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
void desier_get(float p_k,float a,float k)
 {
     float k_in;
     if(k_output>0) k_in=k_output;
     else k_in=k_output/-1;
#if 1
     desier_driver1=driver*(1-k_in*p_k);
     desier_driver2=driver*(1-k_in*p_k);  //弯道减速
     if(close_motor==0)
      {
          if(desier_driver1<min_speed) desier_driver1=min_speed;
          if(desier_driver2<min_speed) desier_driver2=min_speed;
      }
     if(k_output<0)
      desier_driver2=desier_driver2*(k+a*k_output*7/20);//差速
     else 
     desier_driver1=desier_driver1*(k-a*k_output*7/20);
         
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
     if(motor_pwm1>90)  motor_pwm1=90;
     if(motor_pwm2>90)  motor_pwm2=90;
     if(motor_pwm3>90)  motor_pwm3=90;
     if(motor_pwm4>90)  motor_pwm4=90;
#if 0       //被动差速
     if(k_output>0) motor_pwm1=motor_pwm3;
     else motor_pwm3=motor_pwm1;
#endif
     motor_dutyset(motor_pwm1, motor_pwm2, motor_pwm3, motor_pwm4);

#endif  
 }