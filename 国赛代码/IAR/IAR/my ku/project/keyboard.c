#include "all.h"
#include "keyboard.h"
#define GearNum 3
#define MAX_VAR_SIZE 15
uint8  start_run=0,start_time=0,mulu=0,run_time=140;
float for_ward=50;
uint8 RUN_TIME_MODE=0;			//启动模式（0：正常起跑，1：调试模式）

_MenuVar MenuVar[15] = {0};
uint8 MenuVarNum = 0;


void Key_init()
 {
     GPIO_INIT(PORTA,24,0);
     GPIO_INIT(PORTA,25,0);
     GPIO_INIT(PORTA,26,0);
     GPIO_INIT(PORTA,27,0);
     GPIOPULL_SET(PORTA,24,PULL_UP);
     GPIOPULL_SET(PORTA,25,PULL_UP);
     GPIOPULL_SET(PORTA,26,PULL_UP);
     GPIOPULL_SET(PORTA,27,PULL_UP);
 }

uint8  Key_get()
 {
     uint8 key_num=0;
     if(!GPIO_GET(PORTA,24))
      {
          SYSDelay_ms(5);
          if(!GPIO_GET(PORTA,24))
           {
               while(!GPIO_GET(PORTA,24));
               key_num=Key0;
           }
      }
     if(!GPIO_GET(PORTA,25))
      {
          SYSDelay_ms(5);
          if(!GPIO_GET(PORTA,25))
           {
               while(!GPIO_GET(PORTA,25));
               key_num=Key1;
           }
      }
     if(!GPIO_GET(PORTA,26))
      {
          SYSDelay_ms(5);
          if(!GPIO_GET(PORTA,26))
           {
               while(!GPIO_GET(PORTA,26));
               key_num=Key2;
           }
      }
     if(!GPIO_GET(PORTA,27))
      {
          SYSDelay_ms(5);
          if(!GPIO_GET(PORTA,27))
           {
               while(!GPIO_GET(PORTA,27));
               key_num=Key3;
           }
      }
     return key_num;
 }

void ChooseGearDraw()
 {
     LCD_6x8Str(2,1,"driver: ");
     LCD_6x8Str(2,2,"middle_p:");
     LCD_6x8Str(2,3,"k_p:");
     LCD_6x8Str(2,4,"sub_a:");
     LCD_6x8Str(2,5,"sub_k:");
     LCD_6x8Str(2,6,"Forward");
     display(13,1,driver);
     display(13,2,middle_p);
     display(13,3,k_p);
     display(13,4,sub_a);
     display(13,5,sub_k);
     display(13,6,for_ward);
 }


void key_run(uint8 key_num)
 {
     if(key_num==Key0)
      {
          mulu++;
          if(mulu>=8)
           {
               mulu=0;
               LCD_6x8Str(0,8," ");
               LCD_6x8Str(0,0,"*");
           }
          if(mulu!=0) 
           {
               LCD_clear();
               OLED_init();
           }
          if(mulu>=1)
           {
               LCD_6x8Str(0,mulu-1," ");
               LCD_6x8Str(0,mulu,"*");
           }
      }
     else if(key_num==Key1)
      {
          switch(mulu)
           {
           case 0:threshold_left_next+=5;threshold_right_next++;display(13,0,threshold);break;
           case 1:driver+=2;display(13,1,driver);break;
           case 2:middle_p+=0.2;display(13,2,middle_p);break;
           case 3:k_p+=10;display(13,3,k_p);break;
           case 4:sub_a+=0.05;display(13,4,sub_a);break;
           case 5:sub_k+=0.05;display(13,5,sub_k);break;
           case 6:run_time+=1;display(13,6,run_time);break;
           case 7:for_ward+=3;display(13,7,for_ward);break;
           }
      }
      else if(key_num==Key2)
           {
               switch(mulu)
           {
           case 0:threshold_left_next-=5;threshold_right_next--;display(13,0,threshold);break;
           case 1:driver-=2;display(13,1,driver);break;
           case 2:middle_p-=0.2;display(13,2,middle_p);break;
           case 3:k_p-=10;display(13,3,k_p);break;
           case 4:sub_a-=0.05;display(13,4,sub_a);break;
           case 5:sub_k-=0.05;display(13,5,sub_k);break;
           case 6:run_time-=1;display(13,6,run_time);break;
           case 7:for_ward-=3;display(13,7,for_ward);break;
           }
           }
          else if(key_num==Key3)
           {
               start_time++;
               if(start_time==1) {
                   while(IR_GET())
                    {
                        LED_ON(led1,led_on);
                    }
                   LED_ON(led1,led_off);
                   start_run=1;
                    PIT_Enable(PIT0);
               }
               if(start_time==2) 
			   {
				   start_time=0;  
				   driver=0; 
			   }
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
	
	while(1){
	    KeyVal = Key_get();
	    if ( KeyVal == Key3) {
		LCD_clear();
		Gear = tempval%GearNum;
		if (Gear == 0)
		{     
     		    driver=18;middle_p=5;k_p=400;sub_a=0.59;sub_p=1;for_ward=50;
		}
		else if (Gear == 1)
		{
		    driver=20;middle_p=5;k_p=400;sub_a=0.88;sub_p=1;for_ward=50;
		}
		else if (Gear == 2)
		{
		    driver=22;middle_p=7;k_p=400;sub_a=0.44;sub_p=1;
		}
		tempval = 0;
		LCD_6x8Str(0,1,"*");
		while (1)
		{
		    ChooseGearDraw();
		    KeyVal = Key_get();
		    switch (KeyVal){
		    case Key0:
			LCD_6x8Str(0,tempval%6+1," ");
			tempval++;
			LCD_6x8Str(0,tempval%6+1,"*");
			break;
		    case Key1: 
			{
			       switch(tempval%6)
			       {
				       case 0:driver+=2;display(13,1,driver);break;
				       case 1:middle_p+=0.2;display(13,2,middle_p);break;
				       case 2:k_p+=10;display(13,3,k_p);break;
				       case 3:sub_a+=0.05;display(13,4,sub_a);break;
				       case 4:sub_k+=0.05;display(13,5,sub_k);break;
				       case 5:for_ward+=3;display(13,6,for_ward);break;
			       }
			}
			break;
		    case Key2:
			{
			       switch(tempval%6)
			       {
				       case 0:driver-=2;display(13,1,driver);break;
				       case 1:middle_p-=0.2;display(13,2,middle_p);break;
				       case 2:k_p-=10;display(13,3,k_p);break;
				       case 3:sub_a-=0.05;display(13,4,sub_a);break;
				       case 4:sub_k-=0.05;display(13,5,sub_k);break;
				       case 5:for_ward-=3;display(13,6,for_ward);break;
			       }
			}
			break;
		    case Key3:
			LCD_clear();
			LCD_6x8Str(0,0,"Ready To Go!");
			return ;
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
	if (flag_photo)
	{
		OLED_image();
		flag_photo = 0;
		GPIOINT_Clear(PORTC);
		Enable_IRQ(INT_PORTC);
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
