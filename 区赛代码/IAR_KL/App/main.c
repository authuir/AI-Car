#include "all.h"
//定义行列数
uint8 sensor[8];
uint32 speed_start=0,speed_end=150000000;
int16  image_i=0,image_j=0,k=0,image_n=0,t=0,read_da1;
uint16 n=0;
int i ,j;uint8 image_test;
uint8 flag_photo=0,start_encode=0;
float sum_error,middle_output=0;
float pwm_add[5]={0};
float input_servor=500;
float frequence=0,control_k;
uint8 tft_flag=3;   
float count_pwm1_tmp = 0;
float count_pwm2_tmp = 0;
extern float desier_driver1;
extern float desier_driver2;
extern uint8 Adjust_RunTimeOut;

uint32 CNTS_BMQ_Left = 0,CNTS_BMQ_Right = 0;
void PORTC_D_IRQHandler();
void PIT_IRQHandler();
uint32 get_irq1,get_irq2;
extern uint8 Adjust_Runtime;
extern uint8 Open_TFT;
extern uint8 type;
uint8 moutiong=0;
#if 1
unsigned int volatile * tmp = (unsigned int volatile *)0X4007F004;
const uint16 get_hang[X_MAX] = {0,1,2,3,4,5,6,8,9,10,11,12,13,14,16,17,18,19,20,21,22,24,25,26,27,28,29,30,32,33,34,35,36,37,38,40,41,42,43,44,45,46,48,49,50,51,52,53,54,56,57,58,59,60,61,62,64,65,66,67,68,69,70,72,73,74,75,76,77,78,80,81,82,83,84,85,86,88,89,90,91,92,93,94,96,97,98,99,100,101,102,104,105,106,107,108,109,110,112,113,114,115,116,117,118,120,121,122,123,124,125,126,128,129,130,131,132,133,134,136,137,138,139,140,141,142,144,145,146,147};

void main()
{
	DisableInterrupts
	*tmp  = 6;
	SET_IRQ_PRIOR(PORTC_PORTD_VECTORn,0);
	SET_IRQ_PRIOR(PIT_VECTORn,3);
	//VSYNC中断
	GPIO_INIT(VSYNC_PORT,VSYNC_PIN,INPUT);
	GPIOPULL_SET(VSYNC_PORT,VSYNC_PIN,PULL_UP);
	GPIOINT_Enable(VSYNC_PORT,VSYNC_PIN,LEVEL_RISING);
	//HREF中断
	GPIO_INIT(HREF_PORT,HREF_PIN,INPUT);
	GPIOPULL_SET(HREF_PORT,HREF_PIN,LEVEL_RISING);
	//PCLK中断
	GPIO_INIT(PCLK_PORT,PCKL_PIN,INPUT);
	GPIOPULL_SET(PCLK_PORT,PCKL_PIN,PULL_DOWN);
	
	GPIOINT_Enable(PCLK_PORT,PCKL_PIN,DMA_RISING);
	Enable_IRQ(PORTC_PORTD_IRQn);
	set_vector_handler(PORTC_PORTD_VECTORn ,PORTC_D_IRQHandler); 
	//设置输入端口
	GPIO_INIT(PORTB,16,INPUT);
	GPIO_INIT(PORTB,17,INPUT);
	GPIO_INIT(PORTB,18,INPUT);
	GPIO_INIT(PORTB,19,INPUT);
	GPIO_INIT(PORTB,20,INPUT);
	GPIO_INIT(PORTB,21,INPUT);
	GPIO_INIT(PORTB,22,INPUT);
	GPIO_INIT(PORTB,23,INPUT);
	GPIOPULL_SET(PORTB,16,PULL_UP);
	GPIOPULL_SET(PORTB,17,PULL_UP);
	GPIOPULL_SET(PORTB,18,PULL_UP);
	GPIOPULL_SET(PORTB,19,PULL_UP);
	GPIOPULL_SET(PORTB,20,PULL_UP);
	GPIOPULL_SET(PORTB,21,PULL_UP);
	GPIOPULL_SET(PORTB,22,PULL_UP);
	GPIOPULL_SET(PORTB,23,PULL_UP);
	//DMA初始化
	dma_portx2buff_init(DMA_CH0, (void*) &PTB_B2_IN, date, PTC8, DMA_BYTE1, Y_MAX);
	DMA_EN(DMA_CH0);
	
	//UART
	UART_INIT(UART0,9600);
	//SCCB_INIT
	SCCB_init();
	//SCCB_Catch();
	MT34_init();   
	servo_driver_init();
	//电机初始化
	motor_PWM_init();
	//SD初始化
	// SD_Init();
	//PIT
	pit_init_ms(PIT0, 3);                                //初始化PIT0，定时时间为： 1000ms
	set_vector_handler(PIT_VECTORn ,PIT_IRQHandler);
	Enable_IRQ(PIT_IRQn);
	PITINT_Enable(PIT0);
	//OLED
	LCD_Init();
	//OLED_init();
	//TFT初始化
	spi_init(SPI1,SPI_PCS0,MASTER,25000*1000);//不知道是不是这么设置波特率
	GPIO_INIT(RST_PORT,RST_PIN,1);
	GPIO_INIT(DC_PORT,DC_PIN,1);
	TFT_Init();
    //陀螺仪初始化
	i2c_init(I2C0,400*1000);
	Init_L3G4200D();
	//key_init
	led_init();
	Key_init();
	Switch_init();
	GPIOPULL_SET(PORTC,3,PULL_DOWN);
	float frequence=0,control_k;
	IR_INIT();
	ecode_init();
	EnableInterrupts
	ThouSet();
	ChooseMode();
	uint8 tft_flag=3;   
	uint8 sour_i,sour_j,key_num=0;
	IR_Get();
	IR_Get();
	IR_Get();
	IR_Get();
	IR_Get();
	IR_Get();	
	IR_Get();
	IR_Get();
	IR_Get();
	IR_Get();
	IR_Get();
	IR_Get();	
	
	
	
	while(1)
	{
        //moutiong=IS_Meet_Mount();
		if (RUN_TIME_MODE == 0)
		{
		//				start_run=1;
            //	PIT_Enable(PIT0);
            //	open_6s=1;
            /********************省赛停车代码****************/
            IR_Control();
            my_systick_delay_ms(2);
            /************************end***********/	
		/*	display(13,4,desier_driver1);
			display(13,5,desier_driver2);
			display(13,6,k_output);*/
		} else {
		//	IR_Val = IR_GET();
			if((mulu<0)&&(start_run==0)) 
				OLED_image();
			if((key_num=Key_get())!=0)  
				key_run(key_num);
			if (Adjust_RunTimeOut == 1)
			{
				driver=0;
				close_motor=1;
				OLED_init();
			}
/*			display(0,8,desier_driver2);
			display(0,8,desier_driver1);*/
			if (Open_TFT)
				show_all_TFT(Open_TFT);
			
		}
		if(flag_photo)
		{
			flag_photo=0;
			CAM_get();
            //show_all_TFT(1);
//			middle_p=tran_servo_p( get_servo);
           // if(type==0)
			middle_output=middle_PID_control(middle_p,0,middle_d);
          //  else middle_output=middle_PID_control(middle_p,0,0);
			pwm_add[0]=pwm_add[1];
			pwm_add[1]=pwm_add[2];
			pwm_add[2]=500-middle_output;
            if(pwm_add[2]<200) pwm_add[2]=200;
            if(pwm_add[2]>800) pwm_add[2]=800;
             //GPIOINT_Enable(VSYNC_PORT,VSYNC_PIN,LEVEL_RISING);
			//display_Big_Num(13,3,CNTS_BMQ_Left);
            //display_Big_Num(13,5,CNTS_BMQ_Right);
#if 1
            input_servor=pwm_add[2];
			servo_set(input_servor);image_test++;
			//servo_set(900);
#endif
		}
	}
}
#if  1
int16 image_temp=0;
void PORTC_D_IRQHandler()
{
	uint32 port_date=PORTC_ISFR;
	if(port_date&0X80)
	{
		PORTC_ISFR|=0X80;
#if 1  //逐行扫描
		if(image_i==get_hang[image_temp])
		{
			dma_repeat(DMA_CH0, (void*) &PTB_B2_IN, date+image_temp,Y_MAX);
			image_temp++;
		}
#endif
		if(image_i>=TRUE_X_MAX)
		{
			flag_photo=1;
			GPIOINT_Disable(HREF_PORT,HREF_PIN); 
			GPIOINT_Disable(VSYNC_PORT,VSYNC_PIN);
		}
		image_i++;
	}
	if(port_date&0X40)
	{
		image_i=0;image_j=0;image_temp=0;
		PORTC_ISFR|=0X40;
		start_encode=1;
		image_n++;
		GPIOINT_Disable(VSYNC_PORT,VSYNC_PIN);
        //GPIOINT_Enable(VSYNC_PORT,VSYNC_PIN,LEVEL_RISING);
		GPIOINT_Enable(HREF_PORT,HREF_PIN,LEVEL_RISING);
	}
}
#endif

uint32 in_PIT_times=0;
uint8 flag_6s=0;
void PIT_IRQHandler()
{
    //float driver_temp=driver;
	extern uint8 IS_After_6s;
	PIT_Flag_Clear(PIT0);
	n++;
	if(n>=333)
	{
		n=0;
        UART_S1(UART0,image_test);
		image_test=0;
		image_n=0;
	}
	in_PIT_times++;//进一次中断控制一次电机，3ms控制一镒
	if(start_run==1)
     {
         desier_get(sub_slow,sub_a,sub_k);//获得期望速度
         ecode_get(&count_pwm1,&count_pwm2);
         count_pwm1_tmp = count_pwm1;
         count_pwm2_tmp = count_pwm2;
         CNTS_BMQ_Left += count_pwm1;
         CNTS_BMQ_Right += count_pwm2;
         PID_speed(speed_p,speed_i,speed_d,speed_p,speed_i,speed_d);
        //driver=driver_temp;
     }
	if((in_PIT_times>2000)&&(flag_6s==0)&&(open_6s==1)) 
	{
		flag_6s=1;
		if (RUN_TIME_MODE == 0)
			IS_After_6s = 1;
	}
	if ((in_PIT_times>333*Adjust_Runtime)&&(Adjust_RunTimeOut==0))
	{
		if (RUN_TIME_MODE == 1 )
		{
			Adjust_RunTimeOut = 1;
            driver=0;
            close_motor=1;
			LCD_clear();
		}
	}
}
#endif
