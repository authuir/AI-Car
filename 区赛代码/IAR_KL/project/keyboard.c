#include "all.h"
#include "keyboard.h"
#define GearNum 4
#define MAX_VAR_SIZE 15
uint8  start_run=0,start_time=0,run_time=140;
int8 mulu = -1;
float for_ward=50;
uint8 RUN_TIME_MODE=0;			//启动模式（0：正常起跑，1：调试模式）

_MenuVar MenuVar[15] = {0};
uint8 MenuVarNum = 0;
uint8 Adjust_Runtime = 3;
uint8 Adjust_RunTimeOut = 0;
uint8 IS_Stop_ByIR = 1;
uint8 Open_TFT =0;
extern float Mid_PWM;

void Key_init()
{
	GPIO_INIT(PORTA,7,0);
	GPIO_INIT(PORTA,13,0);
	GPIO_INIT(PORTA,14,0);
	GPIO_INIT(PORTA,15,0);
	GPIO_INIT(PORTA,16,0);
	GPIO_INIT(PORTA,17,0);
	GPIOPULL_SET(PORTA,7,PULL_UP);
	GPIOPULL_SET(PORTA,13,PULL_UP);
	GPIOPULL_SET(PORTA,14,PULL_UP);
	GPIOPULL_SET(PORTA,15,PULL_UP);
	GPIOPULL_SET(PORTA,16,PULL_UP);
	GPIOPULL_SET(PORTA,17,PULL_UP);
}

uint8 Key_get()
{
	uint8 key_num=0;
	if(!GPIO_GET(PORTA,13))
	{
		SYSDelay_ms(5);
		if(!GPIO_GET(PORTA,13))
		{
			while(!GPIO_GET(PORTA,13));
			key_num=Key0;
		}
	}
	if(!GPIO_GET(PORTA,15))
	{
		SYSDelay_ms(5);
		if(!GPIO_GET(PORTA,15))
		{
			while(!GPIO_GET(PORTA,15));
			key_num=Key1;
		}
	}
	if(!GPIO_GET(PORTA,17))
	{
		SYSDelay_ms(5);
		if(!GPIO_GET(PORTA,17))
		{
			while(!GPIO_GET(PORTA,17));
			key_num=Key2;
		}
	}
	if(!GPIO_GET(PORTA,7))
	{
		SYSDelay_ms(5);
		if(!GPIO_GET(PORTA,7))
		{
			while(!GPIO_GET(PORTA,7));
			key_num=Key3;
		}
	}
	if(!GPIO_GET(PORTA,14))
	{
		SYSDelay_ms(5);
		if(!GPIO_GET(PORTA,7))
		{
			while(!GPIO_GET(PORTA,7));
			key_num=Key4;
		}
	}
	if(!GPIO_GET(PORTA,16))
	{
		SYSDelay_ms(5);
		if(!GPIO_GET(PORTA,7))
		{
			while(!GPIO_GET(PORTA,7));
			key_num=Key5 ;
		}
	}
	return key_num;
}

void ChooseGearDraw()
{
	LCD_6x8Str(2,0,"driver: ");
	LCD_6x8Str(2,1,"middle_p:");
	LCD_6x8Str(2,2,"sub_a:");
	LCD_6x8Str(2,3,"Forward");
	LCD_6x8Str(2,4,"middle_d");
	LCD_6x8Str(2,5,"sub_slow");
	display(13,0,driver);
	display(13,1,middle_p);
	display(13,2,sub_a);
	display(13,3,for_ward);
	display(13,4,middle_d);
	display(13,5,sub_slow);
}

void key_run(uint8 key_num)
{
	if(key_num==Key0)
	{
		mulu++;
		if(mulu>=7)
		{
			mulu=-1;
			LCD_6x8Str(0,8," ");
			LCD_6x8Str(0,0,"*");
		}
		if(mulu!=-1) 
		{
			LCD_clear();
			OLED_init();
		}
		if(mulu>=0)
		{
			LCD_6x8Str(0,mulu-1," ");
			LCD_6x8Str(0,mulu,"*");
		}
	}
	else if(key_num==Key1)
	{
		switch(mulu)
		{
		case 0:Adjust_Runtime++;display(13,0,Adjust_Runtime);break;
		case 1:driver+=2;display(13,1,driver);break;
		case 2:middle_p+=0.2;display(13,2,middle_p);break;
		case 3:sub_a+=0.05;display(13,3,sub_a);break;
		case 4:for_ward+=3;display(13,4,for_ward);break;
		case 5:sub_slow+=0.05;display(13,5,sub_slow);break;
		case 6:middle_d+=0.2;display(13,6,middle_d);break;
		}
	}
	else if(key_num==Key2)
	{
		switch(mulu)
		{
		case 0:Adjust_Runtime--;display(13,0,Adjust_Runtime);break;
		case 1:driver-=2;display(13,1,driver);break;
		case 2:middle_p-=0.2;display(13,2,middle_p);break;
		case 3:sub_a-=0.05;display(13,3,sub_a);break;
		case 4:for_ward-=3;display(13,4,for_ward);break;
		case 5:sub_slow-=0.05;display(13,5,sub_slow);break;
		case 6:middle_d-=0.2;display(13,6,middle_d);break;
		}
	}
	else if(key_num==Key3)
	{
		//PIT_INIT(PIT1,150000000*Adjust_Runtime,DEBUG_STOP);
		//Enable_IRQ(INT_PIT1);
		//PITINT_Enable(PIT1);
		//PIT_Enable(PIT1);
		start_run=1;
		PIT_Enable(PIT0);
	}
}

void Switch_init()
{
	GPIO_INIT(PORTB,0,0);
	GPIO_INIT(PORTB,1,0);
	GPIO_INIT(PORTB,2,0);
	GPIO_INIT(PORTB,3,0);
	GPIO_INIT(PORTB,4,0);
	GPIO_INIT(PORTB,5,0);
	GPIO_INIT(PORTB,6,0);
	GPIO_INIT(PORTB,7,0);
	GPIOPULL_SET(PORTB,0,PULL_UP);
	GPIOPULL_SET(PORTB,1,PULL_UP);
	GPIOPULL_SET(PORTB,2,PULL_UP);
	GPIOPULL_SET(PORTB,3,PULL_UP);
	GPIOPULL_SET(PORTB,4,PULL_UP);
	GPIOPULL_SET(PORTB,5,PULL_UP);
	GPIOPULL_SET(PORTB,6,PULL_UP);
	GPIOPULL_SET(PORTB,7,PULL_UP);
}

uint8 Switch_get(uint8 swtch_num)
{
	return GPIO_GET(PORTB,swtch_num);
}

//起跑模式下调节参数函数
void ChooseGear()
{
	uint8 tempval = 0;
	uint8 KeyVal = 0;
	uint8 Gear = 0;
	//清除信息
	LCD_clear();
	LCD_6x8Str(0,0,"*");
	LCD_6x8Str(2,0,"Mode1(Low Speed)");
	LCD_6x8Str(2,1,"Mode2(Mid Speed)");
	LCD_6x8Str(2,2,"Mode3(High Speed)");
	LCD_6x8Str(2,3,"Mode4(Super Speed)");
	
	while(1){
		KeyVal = Key_get();
		if ( KeyVal == Key3) {
			LCD_clear();
			Gear = tempval%GearNum;
			if (Gear == 0)
			{     
				driver=55;middle_p=5;k_p=400;sub_a=1.02;sub_p=1;for_ward=55;sub_slow=1.2;
			}
			else if (Gear == 1)
			{
				driver=65;middle_p=3.4;k_p=400;sub_a=1.02;sub_p=1;for_ward=55;sub_slow=0.59;middle_d=5;
			}
			else if (Gear == 2)
			{
				driver=80;middle_p=3.7;k_p=400;sub_a=1.11;sub_p=1;for_ward=56;sub_slow=0.8;
			}
			else if (Gear == 3)
			{
				//driver=80;middle_p=5.8;k_p=400;sub_a=1.23;sub_p=1;for_ward=50;
				driver=100;
				middle_p=3.8;
				middle_d=5;
				sub_a=1.02;
				sub_p=1;
				sub_slow=1.4;
				for_ward=60;
			}
			tempval = 0;
			LCD_6x8Str(0,0,"*");
			while (1)
			{
				IR_Get();
				ChooseGearDraw();
				KeyVal = Key_get();
				switch (KeyVal){
				case Key0:
					LCD_6x8Str(0,tempval%6," ");
					tempval++;
					LCD_6x8Str(0,tempval%6,"*");
					break;
				case Key1: 
					{
						switch(tempval%6)
						{
						case 0:driver+=2;display(13,0,driver);break;
						case 1:middle_p+=0.2;display(13,1,middle_p);break;
						case 2:sub_a+=0.05;display(13,2,sub_a);break;
						case 3:for_ward+=3;display(13,3,for_ward);break;
						case 4:middle_d+=0.2;display(13,4,middle_d);break;
						case 5:sub_slow+=0.2;display(13,5,sub_slow);break;
						}
					}
					break;
				case Key2:
					{
						switch(tempval%6)
						{
						case 0:driver-=2;display(13,0,driver);break;
						case 1:middle_p-=0.2;display(13,1,middle_p);break;
						case 2:sub_a-=0.05;display(13,2,sub_a);break;
						case 3:for_ward-=3;display(13,3,for_ward);break;
						case 4:middle_d-=0.2;display(13,4,middle_d);break;
						case 5:sub_slow-=0.2;display(13,5,sub_slow);break;
						}
					}
					break;
				case Key3:
					{
						LCD_clear();
						LCD_8x16Str(0,0,"Stop By IR?");
						tempval = 0;
						while(1)
						{
							KeyVal = Key_get();
							switch (KeyVal){
							case Key0:tempval++;break;
							case Key3:
								if (tempval%2==0)	//停车
									IS_Stop_ByIR=1;
								if (tempval%2==1)	//不停车
									IS_Stop_ByIR=0;
								LCD_clear();
								LCD_8x16Str(0,0,"Running!!!");
								return;
								break;
							}
							if (tempval%2==0)
							{
								LCD_8x16Str_Reverse(0,1,"Yes");
								LCD_8x16Str(6,1,"No");
							}else{
								LCD_8x16Str(0,1,"Yes");
								LCD_8x16Str_Reverse(6,1,"No");								
							}
							
						}
						return ;
					}
					break;
				}
			}
			break;
		} else if ( KeyVal == Key0) {
			LCD_6x8Str(0,tempval%GearNum," ");
			tempval++;
			LCD_6x8Str(0,tempval%GearNum,"*");
		}
	}
}

//调试模式下选择参数函数
void ChooseAdjust()
{
	uint8 tempval = 0;
	uint8 KeyVal = 0;	
	driver=97;
	middle_p=4.2;
	sub_a=1.02;
	for_ward=74;
	sub_slow=1.44;
	middle_d=8.39;
	LCD_clear();
	LCD_8x16Str(0,0,"Open TFT View?");
	while (1)
	{
		KeyVal = Key_get();
		switch (KeyVal){
		case Key0:
			tempval++;
			break;
		case Key3:
			LCD_clear();
			Open_TFT = tempval%3;
			return ;
			break;
		}
		switch (tempval%3){
		case 0:
			LCD_8x16Str_Reverse(0,1,"No");
			LCD_8x16Str(0,2,"AllView");
			LCD_8x16Str(0,3,"RealView");
			break;
		case 1:
			LCD_8x16Str(0,1,"No");
			LCD_8x16Str_Reverse(0,2,"AllView");
			LCD_8x16Str(0,3,"RealView");
			break;
		case 2:
			LCD_8x16Str(0,1,"No");
			LCD_8x16Str(0,2,"AllView");
			LCD_8x16Str_Reverse(0,3,"RealView");
			break;
		}
	}
}

//选择模式（0：正常起跑，1：调试模式）
void ChooseMode()
{
	uint8 tempval = 0;
	uint8 KeyVal = 0;
	extern const unsigned char  Chinese16X16[];
	
	//睿思二队
	LCD_char16x16(1,0,&Chinese16X16[32*8]);
	LCD_char16x16(2,0,&Chinese16X16[32*9]);
	LCD_char16x16(3,0,&Chinese16X16[32*10]);
	LCD_char16x16(4,0,&Chinese16X16[32*11]);
	//模式
	LCD_char16x16(2,1,&Chinese16X16[32*0]);
	LCD_char16x16(3,1,&Chinese16X16[32*1]);
	LCD_char16x16(4,1,&Chinese16X16[32*4]);
	LCD_char16x16(5,1,&Chinese16X16[32*5]);
	LCD_char16x16(2,2,&Chinese16X16[32*2]);
	LCD_char16x16(3,2,&Chinese16X16[32*3]);
	LCD_char16x16(4,2,&Chinese16X16[32*4]);
	LCD_char16x16(5,2,&Chinese16X16[32*5]);
	while(1){
		KeyVal = Key_get();
		if ( KeyVal == Key3) {
			RUN_TIME_MODE = tempval %2;
			if (RUN_TIME_MODE == 0)
				ChooseGear();
			else if (RUN_TIME_MODE == 1)
			{
				ChooseAdjust();
				driver=100;
				middle_p=3.8;
				middle_d=5;
				sub_a=1.02;
				sub_p=1;
				sub_slow=1.4;
				for_ward=60;
			}
			break;
		} else if ( KeyVal == Key0) {
			LCD_char16x16(0,1+tempval %2,&Chinese16X16[32*7]);
			tempval += 1;
		}
		LCD_char16x16(0,1+tempval %2,&Chinese16X16[32*6]);
	}
}

void ThouSet()
{
	uint8 KeyVal = 0;
	extern uint8 flag_photo;
	while (1)
	{
		if (flag_photo==1)
		{
			OLED_image();
			flag_photo = 0;
			GPIOINT_Clear(PORTC);
			EnableInterrupts
				Enable_IRQ(PORTC_PORTD_VECTORn);
			GPIOINT_Enable(VSYNC_PORT,VSYNC_PIN,LEVEL_RISING);
		}
		KeyVal = Key_get();
		if ( KeyVal == Key3) {
			threshold_right_next = threshold_left_next;
			LCD_clear();
			break;
		} else if (KeyVal == Key1) {
			threshold_left_next += 5;
		}else if (KeyVal == Key2) {
			threshold_left_next -= 5;
		}
	}
}
