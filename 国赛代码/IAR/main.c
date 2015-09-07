#include "all.h"
#if 1
uint8 sensor[8];
uint32 speed_start=0,speed_end=150000000;
int16  image_i=0,image_j=0,k=0,image_n=0,t=0,read_da1;
uint16 n=0;
uint8 flag_photo=0,start_encode=0;
float sum_error,middle_output=0;
uint8 IS_After_6s = 0,Not_Started = 1,Ready_Stop = 0;
float pwm_add[5]={0};
float input_servor=500;
float frequence=0,control_k;
uint8 IR_Val = 0;     uint8 tft_flag=3;   
float count_pwm1_tmp = 0;
float count_pwm2_tmp = 0;
extern float desier_driver1;
extern float desier_driver2;
extern uint8 Adjust_RunTimeOut;
uint32 CNTS_BMQ_Left = 0,CNTS_BMQ_Right = 0;
const uint16 get_hang[X_MAX] = {0 ,1 ,2 ,3 ,4 ,5 ,7 ,8 ,9 ,10 ,11 ,12 ,14 ,15 ,16 ,17 ,18 ,19 ,21 ,22 ,23 ,24 ,25 ,26 ,28 ,29 ,30 ,31 ,32 ,33 ,35 ,36 ,37 ,38 ,39 ,40 ,42 ,43 ,44 ,45 ,46 ,47 ,49 ,50 ,51 ,52 ,53 ,54 ,56 ,57 ,58 ,59 ,60 ,61 ,63 ,64 ,65 ,66 ,67 ,68 ,70 ,71 ,72 ,73 ,74 ,75 ,77 ,78 ,79 ,80 ,81 ,82 ,84 ,85 ,86 ,87 ,88 ,89 ,91 ,92 ,93 ,94 ,95 ,96 ,98 ,99 ,100 ,101 ,102 ,103 ,105 ,106 ,107 ,108 ,109 ,110 ,112 ,113 ,114 ,115 ,116 ,117 ,119 ,120 ,121 ,122 ,123 ,124 ,126 ,127 ,128 ,129 ,130 ,131 ,133 ,134 ,135 ,136 ,137 ,138 ,140 ,141 ,142 ,143 ,144 ,145 ,147 ,148 ,149 ,150 ,151 ,152 ,154 ,155 ,156 ,157 ,158 ,159 ,161 ,162 ,163 ,164 ,165 ,166 ,168 ,169 ,170 ,171 ,172 ,173};
extern uint8 type;
extern uint8  Ready_Stop_Time;
void main()
 {
     SYS_CLOCK_SET(SYS_CLOCK_150M,1,2,3,6);
     //配置NMI引脚为GPIO  除去NMI功能
     GPIO_INIT(PORTA,4,1);GPIO_SET(PORTA,4,1);
     DisableInterrupts
     //VSYNC中断
     GPIO_INIT(VSYNC_PORT,VSYNC_PIN,INPUT);
     GPIOPULL_SET(VSYNC_PORT,VSYNC_PIN,PULL_UP);
     Enable_IRQ(INT_PORTC);
     GPIOINT_Enable(VSYNC_PORT,VSYNC_PIN,LEVEL_RISING);
     //HREF中断
     GPIO_INIT(HREF_PORT,HREF_PIN,INPUT);
     GPIOPULL_SET(HREF_PORT,HREF_PIN,LEVEL_RISING);
     //PCLK中断
     GPIO_INIT(PCLK_PORT,PCKL_PIN,INPUT);
     GPIOPULL_SET(PCLK_PORT,PCKL_PIN,PULL_DOWN);
     GPIOINT_Enable(PCLK_PORT,PCKL_PIN,DMA_RISING);
     
     //DMA初始化
     DMA_Init_new(DMAMUX0, DMA_CH0,Src_PORTC,Y_MAX+15,1,DMA_Normal_Mode);
     DMA_Source_new(DMA_CH0, 0X400FF0D0,0, DMA_8BIT, 0);
     DMA_Destination_new(DMA_CH0, date,1, DMA_8BIT, 0);
     //DMA_Int_Enable(DMA_CH0,DMA_MAJOR);
	
	 //设置输入端口
     GPIO_INIT(PORTD,0,INPUT);
     GPIO_INIT(PORTD,1,INPUT);
     GPIO_INIT(PORTD,2,INPUT);
     GPIO_INIT(PORTD,3,INPUT);
     GPIO_INIT(PORTD,4,INPUT);
     GPIO_INIT(PORTD,5,INPUT);
     GPIO_INIT(PORTD,6,INPUT);
     GPIO_INIT(PORTD,7,INPUT);
     GPIOPULL_SET(PORTD,0,PULL_DOWN);
     GPIOPULL_SET(PORTD,1,PULL_DOWN);
     GPIOPULL_SET(PORTD,2,PULL_DOWN);
     GPIOPULL_SET(PORTD,3,PULL_DOWN);
     GPIOPULL_SET(PORTD,4,PULL_DOWN);
     GPIOPULL_SET(PORTD,5,PULL_DOWN);
     GPIOPULL_SET(PORTD,6,PULL_DOWN);
     GPIOPULL_SET(PORTD,7,PULL_DOWN);
     
     //UART
     GPIOType_UART(PORTB_16_17);
     UART_INIT(UART0,75000,38400);
     UART_FIFO_read_init(UART0);
     Enable_IRQ(INT_UART0_RX_TX);
     UARTINT_Enable(UART0,RIE);
     
     //蜂鸣器初始化
     bee_init();
     
	//SCCB_INIT
	SCCB_init();
	//SCCB_Catch();
	MT34_init();   
    servo_driver_init();
     
	//电机初始化
	motor_PWM_init();
     //SD初始化
    SD_Init();
	
    //PIT0
	//用于电机控制
    PIT_CLOCK_Enable
    PIT_INIT(PIT0,150000*3 ,DEBUG_STOP);
    Enable_IRQ(INT_PIT0);
    PITINT_Enable(PIT0);
   
    //PIT2
	//用于红外检测
    PIT_INIT(PIT2,1500000,DEBUG_STOP);
    Enable_IRQ(INT_PIT2);
    PIT_Enable(PIT2);
    PITINT_Enable(PIT2);

     led_init();
     //OLED
     LCD_Init();
     GPIO_INIT(RST_PORT,RST_PIN,1);
     GPIO_INIT(DC_PORT,DC_PIN,1);
     GPIOType_SPI(SPI0,SPI0_PCS0_PTA14,SPI0_SCK_PTA15,SPI0_SOUT_PTA16,SPI0_SIN_PTA17);
     SPI_init(SPI0,MASTER);
     TFT_Init();
 	//    LCD_ShowString(200,10,30,30,16,"PID:");
     //key_init
     Key_init();
     Switch_init();
	GPIOPULL_SET(PORTC,3,PULL_DOWN);
	IR_INIT();
	QD_init_FTM();
    
	SET_IRQ_PRIOR(INT_PORTC,0);						//摄像头中断
	SET_IRQ_PRIOR(INT_PORTB,5);						//红外中断
	SET_IRQ_PRIOR(INT_PIT0,4);							//电机控制定时器中断
	SET_IRQ_PRIOR(INT_PIT1,8);							//红外中断
	SET_IRQ_PRIOR(INT_PIT2,9);	
    SET_IRQ_PRIOR(INT_UART0_RX_TX,10);			//串口中断
    
	EnableInterrupts
	uint8 sour_i,sour_j,key_num=0;
	ThouSet();
	ChooseMode();
	while(1)
	{
		if (RUN_TIME_MODE == 0)
		{
			IR_Val = IR_GET();
			if (IR_Val==0 && IS_After_6s==0 && Not_Started==1)
			{
					start_run=1;
					Not_Started = 0;
					PIT_INIT(PIT1,150000000*Ready_Stop_Time,DEBUG_STOP);
					Enable_IRQ(INT_PIT1);
					PITINT_Enable(PIT1);
					PIT_Enable(PIT0);
					PIT_Enable(PIT1);
			}
			if ( (IS_After_6s==1)&& Switch_get(3)==0 )
			{
				if (IR_Val == 1)
					Ready_Stop = 1;
				    if ( ((IR_Val==0 )&&( Ready_Stop == 1))  )
				    {
						driver=0;
						close_motor=1;Ready_Stop=0;
					}
				}
		} else {
			if((mulu==0)&&(start_run==0)) 
				OLED_image();
			if((key_num=Key_get())!=0)  
				key_run(key_num);
			if (Adjust_RunTimeOut == 1)
			{
				driver=0;
				close_motor=1;
			}
		}
             //蜂鸣器驱动
     if(((RUN_TIME_MODE==0)&&((type==7)||(type==4)||(type==3)||(angle_type!=0)))||(Ready_Stop))
      {
          Buzzer_on;
      }
     else Buzzer_off;
		  if(flag_photo)
		  {
              
              //send_line_other(UART0,1,count_pwm1);
              //send_line_other(UART0,2,desier_driver1);
              flag_photo=0;
			CAM_get();
            //show_all_TFT(1);
//			middle_p=tran_servo_p( get_servo);
            if((type==0)||(type==7))
			middle_output=middle_PID_control(middle_p,0,middle_d);
            else middle_output=middle_PID_control(middle_p,0,0);
			pwm_add[0]=pwm_add[1];
			pwm_add[1]=pwm_add[2];
			pwm_add[2]=500-middle_output;
            if(pwm_add[2]<200) pwm_add[2]=200;
            if(pwm_add[2]>800) pwm_add[2]=800;
            
#if 1
            input_servor=(pwm_add[2]);
			servo_set(input_servor);
            //display_Big_Num(13,5,CNTS_BMQ_Right);
            //display_Big_Num(13,6,CNTS_BMQ_Left);
#endif
            if(RUN_TIME_MODE==1)
             {
                 if(Switch_get(0)==0)    show_all_TFT(1);
                 else if(Switch_get(1)==0)  show_all_TFT(2);
             }
            GPIOINT_Clear(PORTC);
            Enable_IRQ(INT_PORTC);
            GPIOINT_Enable(VSYNC_PORT,VSYNC_PIN,LEVEL_RISING);
		  }
    }
 }
int image_temp=0;
void PORTC_IRQHandler(void)
 {
     uint32 port_date=PORTC_ISFR;
     if(port_date&0X8000)
      {
          PORTC_ISFR|=0X8000;
#if 1  //逐行扫描
          if((image_i==get_hang[image_temp]))
		{
			 DMA_Enable_new(DMAMUX0,DMA_CH0);
			image_temp++;
		}
         
#endif
          if(image_i>=TRUE_X_MAX)
           {
               flag_photo=1;image_temp=0;
               Disable_IRQ(INT_PORTC);
               GPIOINT_Disable(HREF_PORT,HREF_PIN);
               DMA_Disable_new(DMAMUX0,DMA_CH0);
               DMA_SetDestAddress(DMA_CH0, date);   
               
           }
          image_i++;
      }
     if(port_date&0X20000)
      {
	  image_i=0;image_j=0;
          PORTC_ISFR|=0X20000;
          start_encode=1;
          image_n++;
          GPIOINT_Disable(VSYNC_PORT,VSYNC_PIN);
          GPIOINT_Enable(HREF_PORT,HREF_PIN,LEVEL_RISING);
      }
 }
void DMA0_DMA16_IRQHandler(void)
 {
     DMA_Clear_Int(DMA_CH0);
 }
void PIT0_IRQHandler(void)
 {
     image_n=0;
     n++;
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
     PITINT_Clear(PIT0);
 }
void PIT1_IRQHandler(void)
 {
	PITINT_Clear(PIT1);
	if (RUN_TIME_MODE == 0)
		IS_After_6s = 1;
	else if (RUN_TIME_MODE == 1 )
		Adjust_RunTimeOut = 1;
	PIT_Disable(PIT1);
 }
void UART0_RX_TX_IRQHandler(void)
 {
     uint8 dateddd[8];
     float ddddddd;
     DisableInterrupts
     UART_FIFO_Read_value(UART0,dateddd);
     P1_I1_D1_change(&speed_p,&speed_i,&speed_d,dateddd);
     P2_I2_D2_change(&driver,&ddddddd,&ddddddd,dateddd);
     EnableInterrupts
 }
uint32 IR_times=0,IRtime=0;
uint32 start_IR ,end_IR;
uint32 IR_GET_value=0,IR_OK_TIMES=0;  //IR_GET=1时接受到信号
void PORTB_IRQHandler(void)
 {
     if((PORTB_ISFR&0x0C00)==0x0C00) IR_times++;//两个都检测到
	if(IR_times==1)
	{
		start_IR=PIT_Read(PIT2);
	}
	if(IR_times==2)
	{
		IR_times=0;
		end_IR=PIT_Read(PIT2);
		if(start_IR>end_IR)
			IRtime=(start_IR-end_IR)/750;								//100左右就正常
		if((IRtime>80)&&(IRtime<120)) IR_OK_TIMES++;
			else {IR_OK_TIMES=0;}
		if(IR_OK_TIMES>=3) 
			IR_GET_value=1;
		
      }
     PORTB_ISFR&=0x0C00;
	 PIT_Reload(PIT2,1500000);
 }
void PIT2_IRQHandler(void)
 {
     PITINT_Clear(PIT2);
     IR_OK_TIMES=0;
	 IR_GET_value=0;
 }
#endif


void HardFault_Handler()
 {
     while(1)
      {
          Buzzer_on;SYSDelay_ms(100);
           Buzzer_off;SYSDelay_ms(100);
           
           motor_dutyset(0,0,0,0);
      }
 }
void NMI_Handler()
 {
     while(1)
      {
          Buzzer_on;SYSDelay_ms(500);
           Buzzer_off;SYSDelay_ms(500);
           
           motor_dutyset(0,0,0,0);
      }
 }
