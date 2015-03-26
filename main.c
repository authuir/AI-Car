#include "all.h"

#define  X_MAX     200
#define  Y_MAX     200
#define ave_time    10
uint8   date[X_MAX][Y_MAX+10]={0};
uint16   count[256]= {0};
uint8   flag_photo=0,read_date=0,temp_l=0,temp_r=0,time=0,ave_now=0,testsss;
uint32  i=0,j=0,tmp=0;

double p[256] = {0}; //临时变量
double Omega[256] = {0}; //临时变量
double mu[256] = {0}; //临时变量
double sigma_b_squared[256] = {0}; //临时变量
double maxval; //临时变量
uint32  SUM_count = 0;

int32    add_ave=0;
void main()
 {
     SYS_CLOCK_SET(SYS_CLOCK_150M,1,2,3,6);
     DisableInterrupts
     //VSYNC中断
     GPIO_INIT(VSYNC_PORT,VSYNC_PIN,INPUT);
     GPIOPULL_SET(VSYNC_PORT,VSYNC_PIN,PULL_UP);
     Enable_IRQ(INT_PORTB);
     GPIOINT_Enable(VSYNC_PORT,VSYNC_PIN,LEVEL_FALLING);
     
     //HREF中断
     GPIO_INIT(HREF_PORT,HREF_PIN,INPUT);
     GPIOPULL_SET(HREF_PORT,HREF_PIN,PULL_DOWN);
     GPIOINT_Enable(HREF_PORT,HREF_PIN,LEVEL_RISING);
     
     //PCLK中断
     GPIO_INIT(PCLK_PORT,PCKL_PIN,INPUT);
     GPIOPULL_SET(PCLK_PORT,PCKL_PIN,PULL_DOWN);
     GPIOINT_Enable(PCLK_PORT,PCKL_PIN,DMA_RISING);
     
     //DMA初始化
     DMA_Init_new(DMAMUX0, DMA_CH0,Src_PORTE,Y_MAX+10,1,DMA_Normal_Mode);
     DMA_Source_new(DMA_CH0, 0X400FF0D0,0, DMA_8BIT, 0);
     DMA_Destination_new(DMA_CH0, date,1, DMA_8BIT, 0);
     //DMA_Enable_new(DMA_CH0);
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
    UART_INIT(UART0,75000,115200);
    
    SET_IRQ_PRIOR(INT_PORTB,0);
    SET_IRQ_PRIOR(INT_PORTC,1);
    
    SCCB_init();
    SCCB_write(0x21,0x06,0xf0);//亮度调节，，最大
    //SCCB_write(0x21,0x2d,0x91);//配置自动亮度
    //SCCB_write(0x21,0x17,0x55);
    //SCCB_write(0x21,0x18,0xa9);//配置视频图像显示位置
    //基本配置
    //SCCB_write(0x21,0x12,0x2d);
    //SCCB_write(0x21,0x13,0x01);
    //SCCB_write(0x21,0x28,0x20);
    //SCCB_write(0x21,0x20,0x02);
 
    EnableInterrupts
     while(1)
      {
          if(flag_photo)
           {
               flag_photo=0;
               maxval = 0;
               SUM_count = 0;
               for(i=0;i<256;i++)
               {
                   Omega[i] = 0;
                   count[i] = 0;
               }
               for(i=0;i<X_MAX;i++)
                   for(j=0;j<Y_MAX;j++)
                   {
                       tmp = date[i][j];
                       count[  tmp  ]++;
                   }
               for(i=0;i<256;i++)
                   SUM_count = SUM_count+  count[i];
               for(i=0;i<256;i++)
               {
                   p[i] = (double)count[i] / (double)SUM_count;
               }
               for(i=0;i<256;i++)
               {
                   for(j=0;j<i;j++)
                     Omega[i] += p[j];
               }
               for(i=0;i<256;i++)
                   mu[i] = p[i] * i;
               for(i=0;i<256;i++)
                   sigma_b_squared[i] = (mu[255] * Omega[i] - mu[i])*(mu[255] * Omega[i] - mu[i]) / 
                                                ( Omega[i] *  (1 - Omega[i])  );
               for(i=0;i<256;i++)
               {
                   if (maxval < sigma_b_squared[i])
                       maxval = sigma_b_squared[i];
               }
               tmp=0;
               while (maxval != sigma_b_squared[tmp])
               {
                  tmp++;
               }


               for(i=0;i<X_MAX;i++)
                   for(j=0;j<Y_MAX;j++)
                   {
                       if (date[i][j] <= tmp)
                         date[i][j]  =  0;
                       else
                         date[i][j]  =  255;
                   }
             
               UART_SS(UART0,"image");
               for(i=0;i<X_MAX;i++)
                   for(j=0;j<Y_MAX;j++)
                       UART_S1(UART0,date[i][j]);
               i=0;j=0;
               GPIOINT_Clear(PORTB);
               EnableInterrupts
               Enable_IRQ(INT_PORTB);
           }
      }
 }
void PORTB_IRQHandler(void)
 {
     DisableInterrupts
     GPIOINT_Clear(PORTB);
     Disable_IRQ(INT_PORTB);
     Enable_IRQ(INT_PORTC);
     GPIOINT_Clear(PORTC);
     EnableInterrupts
 }
void PORTC_IRQHandler(void)
 {
     DMA_Enable_new(DMAMUX0,DMA_CH0);
       if(i>=X_MAX)
             {                                ///['  
                 flag_photo=1;
                 Disable_IRQ(INT_PORTC);
                 DisableInterrupts;
                 DMA_Disable_new(DMAMUX0,DMA_CH0);
                 DMA_SetDestAddress(DMA_CH0, date);       
             }
       i++;
       GPIOINT_Clear(PORTC);
 }
/*void PORTE_IRQHandler(void)
 {
       GPIOINT_Clear(PORTE);
       date[i][j]=(uint8)(GPIOD_PDIR&(0XFF));
       j++;
       if(j>Y_MAX) 
        {   
            j=Y_MAX;
            Enable_IRQ(INT_PORTC);
            Disable_IRQ(INT_PORTE);
        }
 }*/