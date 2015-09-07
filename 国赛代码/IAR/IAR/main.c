#include "all.h"
#if 1
uint8 sensor[8];
uint32 speed_start=0,speed_end=150000000;
int16  i=0,j=0,k=0,image_n=0,t=0,read_da1;
uint16 n=0;
uint8 flag_photo=0,start_encode=0;
float sum_error,middle_output=0;
uint8 IS_After_6s = 0,Not_Started = 1,Ready_Stop = 0;
     float pwm_add[5]={0};
          float frequence=0,control_k;
uint8 IR_Val = 0;     uint8 tft_flag=3;   

void main()
 {
     SYS_CLOCK_SET(SYS_CLOCK_150M,1,2,3,6);
     DisableInterrupts
         //VSYNC?D??
     GPIO_INIT(VSYNC_PORT,VSYNC_PIN,INPUT);
     GPIOPULL_SET(VSYNC_PORT,VSYNC_PIN,PULL_UP);
     Enable_IRQ(INT_PORTC);
     GPIOINT_Enable(VSYNC_PORT,VSYNC_PIN,LEVEL_RISING);
     //HREF?D??
     GPIO_INIT(HREF_PORT,HREF_PIN,INPUT);
     GPIOPULL_SET(HREF_PORT,HREF_PIN,LEVEL_RISING);
     //PCLK?D??
     GPIO_INIT(PCLK_PORT,PCKL_PIN,INPUT);
     GPIOPULL_SET(PCLK_PORT,PCKL_PIN,PULL_DOWN);
     GPIOINT_Enable(PCLK_PORT,PCKL_PIN,DMA_RISING);
     
     //DMA3?ê??ˉ
     DMA_Init_new(DMAMUX0, DMA_CH0,Src_PORTC,Y_MAX+15,1,DMA_Normal_Mode);
     DMA_Source_new(DMA_CH0, 0X400FF0D0,0, DMA_8BIT, 0);
     DMA_Destination_new(DMA_CH0, date,1, DMA_8BIT, 0);
     //DMA_Int_Enable(DMA_CH0,DMA_MAJOR);
     //éè??ê?è????ú
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
     UART_INIT(UART0,75000,115200);
     UART_FIFO_read_init(UART0);
     Enable_IRQ(61);
     UARTINT_Enable(UART0,RIE);
     //SCCB_INIT
     SCCB_init();
     //SCCB_Catch();
    MT34_init();   
     servo_driver_init();
     
     //μ??ú3?ê??ˉ
     motor_PWM_init();
     //SD3?ê??ˉ
    SD_Init();
    //PIT
    PIT_CLOCK_Enable
    PIT_INIT(PIT0,150000,DEBUG_STOP);
  
    Enable_IRQ(INT_PIT0);
    PITINT_Enable(PIT0);
   
    
    //PIT2
    PIT_INIT(PIT2,1500000,DEBUG_STOP);
    Enable_IRQ(INT_PIT2);
    PIT_Enable(PIT2);
    PITINT_Enable(PIT2);
     //ó??è??éè??
     SET_IRQ_PRIOR(INT_PORTC,0);
     SET_IRQ_PRIOR(INT_PORTA,7);
     SET_IRQ_PRIOR(INT_PIT0,5);
	 SET_IRQ_PRIOR(INT_PIT1,6);
     SET_IRQ_PRIOR(INT_PIT1,8);
     SET_IRQ_PRIOR(61,5);
     //LED3?ê??ˉ
     led_init();
     //OLED
     LCD_Init();
     //OLED_init();
     //TFT3?ê??ˉ
     GPIO_INIT(RST_PORT,RST_PIN,1);
     GPIO_INIT(DC_PORT,DC_PIN,1);
     GPIOType_SPI(SPI0,SPI0_PCS0_PTA14,SPI0_SCK_PTA15,SPI0_SOUT_PTA16,SPI0_SIN_PTA17);
     SPI_init(SPI0,MASTER);
     TFT_Init();
     LCD_ShowString(200,10,30,30,16,"PID:");
     LCD_ShowString(200,25,30,30,16,"P=");
     LCD_ShowString(200,40,30,30,16,"I=");
     LCD_ShowString(200,55,30,30,16,"D=");
     LCD_ShowString(200,70,30,30,16,"K=");
     //key_init
     Key_init();
     Switch_init();
     GPIOPULL_SET(PORTC,3,PULL_DOWN);
      IR_INIT();
      QD_init_FTM();
      power_test_init();
     BTN_current_init();
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
					PIT_INIT(PIT1,150000000*6,DEBUG_STOP);
					Enable_IRQ(INT_PIT1);
					PITINT_Enable(PIT1);
					PIT_Enable(PIT0);
					PIT_Enable(PIT1);
				}
				if (IS_After_6s==1)
				{
				    if (IR_Val == 1)
					Ready_Stop = 1;
				    if ((IR_Val==0 )&&( Ready_Stop == 1))
				    {
					driver=0;
					close_motor=1;
				    }
				}
		  }
		  else{
		      if((mulu==0)&&(start_run==0)) 
			  OLED_image();
		      if((key_num=Key_get())!=0)  
			  key_run(key_num);
		      if((start_run==1)&&(Switch_get(3)==0))
		      {
			  driver=0;
			  close_motor=1;
		      }
		  }
		  if(flag_photo)
		  {
		      flag_photo=0;
		  CAM_get();
               //TakePhoto();
               //LED_ON(led0,led_on);
               //send_line_other(UART0,1,k_output);
               if((Switch_get(0)==0) && (RUN_TIME_MODE)) 
                { 
                    tft_flag=3;
                    show_all_TFT(tft_flag);
                }
               if((Switch_get(1)==0 )&& (RUN_TIME_MODE)) 
                {
                    tft_flag=2;
                    show_all_TFT(tft_flag);
                }
	       middle_output=middle_PID_control(middle_p,0,0);
               control_k=PID_control_k(k_p,0,0);k_p=k_ptemp;
               pwm_add[0]=pwm_add[1];
               pwm_add[1]=pwm_add[2];
               pwm_add[2]=500-middle_output;
              if((start_run==1)||(Switch_get(2)==0))
               {
                   servo_set(pwm_add[2]*0.8+pwm_add[1]*0.1+pwm_add[0]*0.1);
               }
              	
                   GPIOINT_Clear(PORTC);
                   Enable_IRQ(INT_PORTC);
                   GPIOINT_Enable(VSYNC_PORT,VSYNC_PIN,LEVEL_RISING);
		  }
      }
 }

void PORTC_IRQHandler(void)
 {
     uint32 port_date=PORTC_ISFR;
     if(port_date&0X8000)
      {
          PORTC_ISFR|=0X8000;
#if 1  //?eDDé¨?è
          if(i>=5)
          DMA_Enable_new(DMAMUX0,DMA_CH0);
#endif
          if(i>=X_MAX+5)
           {
               flag_photo=1;
               Disable_IRQ(INT_PORTC);
               GPIOINT_Disable(HREF_PORT,HREF_PIN);
               DMA_Disable_new(DMAMUX0,DMA_CH0);
               DMA_SetDestAddress(DMA_CH0, date);   
           }
          i++;
      }
     if(port_date&0X20000)
      {
	  i=0;j=0;
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
          desier_get(0.005,sub_a,sub_k);//获得期望速度
          ecode_get(&count_pwm1,&count_pwm2);
          PID_speed(speed_p,speed_i,speed_d,speed_p,speed_i,speed_d);
      }
     if(n>=15000 && (RUN_TIME_MODE == 1))
      {
          n=0;
         driver=0;
         close_motor=1;
      }
     PITINT_Clear(PIT0);
 }
void PIT1_IRQHandler(void)
 {
     PITINT_Clear(PIT1);
	 IS_After_6s = 1;
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
void PORTA_IRQHandler(void)
 {
     
     if((PORTA_ISFR&0x0040)!=0)
      {
         
        IR_times++;
      }
     if(IR_times==1)
      {
          start_IR=PIT_Read(PIT2);
      }
     if(IR_times==2)
      {
          IR_times=0;
          end_IR=PIT_Read(PIT2);
          if(start_IR>end_IR)
          IRtime=(start_IR-end_IR)/750;//100左右就正常
         if((IRtime>80)&&(IRtime<120)) IR_OK_TIMES++;
         else {IR_OK_TIMES=0;}
         if(IR_OK_TIMES>=3) 
             IR_GET_value=1;
          PIT_Reload(PIT2,1500000);
          //else IRtime=(start_IR+0xffffffff-end_IR)/750;//100左右就正常
      }
     PORTA_ISFR&=0x0040;
 }
void PIT2_IRQHandler(void)
 {
     PITINT_Clear(PIT2);
     IR_OK_TIMES=0;IR_GET_value=0;
 }
#endif
