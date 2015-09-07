#include "all.h"
uint16  i=0,j=0,k=0,t=0;
//定义行列数
#define  X_MAX     130
#define  Y_MAX    190
//定义中线起始和终止位置
#define start   0
#define end     10
//确定跟随扫描点个数
#define scale   5
uint8   date[X_MAX+5][Y_MAX+15]={0};
uint8 root1=0,root2=0,sensor[8]={0};
float sensor_driver=0;
uint8 flag_photo=0,read_date=0,temp_l=0,temp_r=0,time=0,ave_now=0;
uint8 center0,line_left=0,line_right=0,left_start,right_start,left_end,right_end;
uint16 left=0,right=0,center[X_MAX],left_flag=0,right_flag=0,left_last,right_last;
uint8 white=120,dark=100,dif=0;
//边线扫描算法
uint8 left_line[500][2],right_line[500][2];uint16 left_dot=0,right_dot=0,left_10[2],left_10_i,left_10_j,ones_ok=0;
int8 dot_sub=0;
uint8 scan_mode=0;//0表示行扫描，1表示列扫描
uint8 hang_dir=0,lie_dir=0;//设定转换时扫描方向  小于0表示按递减  大于0表示按递增
uint8 error_times=0;
uint32 temp;
float test=0;
void main()
 {
     SYS_CLOCK_SET(SYS_CLOCK_150M,1,2,3,6);
     DisableInterrupts
         //VSYNC中断
         GPIO_INIT(VSYNC_PORT,VSYNC_PIN,INPUT);
     GPIOPULL_SET(VSYNC_PORT,VSYNC_PIN,PULL_UP);
     Enable_IRQ(INT_PORTC);
     GPIOINT_Enable(VSYNC_PORT,VSYNC_PIN,LEVEL_FALLING);
     
     //HREF中断
     GPIO_INIT(HREF_PORT,HREF_PIN,INPUT);
     GPIOPULL_SET(HREF_PORT,HREF_PIN,PULL_DOWN);
     
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
     UART_INIT(UART0,75000,115200);
     UART_FIFO_read_init(UART0);
     Enable_IRQ(61);
     UARTINT_Enable(UART0,RIE);
     
     //SCCB_INIT
     SCCB_init();
     while(!SCCB_Catch());
     
     //舵机初始化
     servo_driver_init();
     
     //电机初始化
     motor_PWM_init();
     
     //优先级设置
     SET_IRQ_PRIOR(INT_PORTC,0);
     SET_IRQ_PRIOR(61,2);
     
     EnableInterrupts
         while(1)
          {
              if(flag_photo)
               {
                   flag_photo=0;
#if     0           //边缘显示算子
                   for(i=0;i<X_MAX+5;i++)
                       for(j=0;j<Y_MAX;j++)
                        {
                            if(date[i][j]>date[i][j+1])
                                date[i][j]=10*(date[i][j]-date[i][j+1]);
                            else date[i][j]=10*(date[i][j+1]-date[i][j]);
                        } 
#endif
                   
#if     0        //二值化
                   dif=white-dark;
                   for(i=0;i<X_MAX;i++)
                       for(j=0;j<Y_MAX;j++)
                        {
                            if(date[i][j]>=white-dif*2/3)
                                date[i][j]=254;
                            if(date[i][j]<=dark+dif*2/3)
                                date[i][j]=1;
                        }
#endif
                   
                   
                   
#if     0       //中线提取——二值化之前——全行扫描
                   for(i=0;i<X_MAX;i++)
                    {
                        left=0;right=Y_MAX;
                        for(j=Y_MAX;j>3;j--)
                         {
                             if((date[i][j+1]>date[i][j])&&(date[i][j+2]>date[i][j-1]))
                              {
                                  left=j;
                                  left_flag=1;//表示采集到左边缘
                                  break;
                              }
                             left_flag=0;
                         }
                        for(j=Y_MAX/2;j<Y_MAX-3;j++)
                         {
                             if((date[i][j-1]>date[i][j])&&(date[i][j-2]>date[i][j+1]))
                              {
                                  right=j;
                                  right_flag=1;//采集到右边缘
                                  break;
                              }
                             right_flag=0;
                         }
                        if(left_flag&right_flag)
                         {
                             center[i]=(left+right)/2;left_last=left;right_last=right;
                         }
                        else if((left_flag==1)&&(right_flag==0))
                         {
                             center[i]=center[i-1]-left_last+left;left_last=left;
                         }
                        else if((left_flag==0)&&(right_flag==1))
                         {
                             center[i]=center[i-1]-right_last+right;right_last=right;
                         }
                        else center[i]=center[i-1];
                        date[i][center[i]]=0;
                    }
#endif
                   
#if     0         //中线提取—————跟随扫描__successed
                   for(i=start;i<end;i++)
                    {
                        left=0;right=Y_MAX;
                        for(j=Y_MAX/2;j>2;j--)
                         {
                             if((date[i][j+1]>date[i][j])&&(date[i][j+2]>date[i][j-1]))
                              {
                                  left=j;
                                  left_flag=1;//表示采集到左边缘
                                  break;
                              }
                             left_flag=0;
                         }
                        for(j=Y_MAX/2;j<Y_MAX-2;j++)
                         {
                             if((date[i][j-1]>date[i][j])&&(date[i][j-2]>date[i][j+1]))
                              {
                                  right=j;
                                  right_flag=1;//采集到右边缘
                                  break;
                              }
                             right_flag=0;
                         }
                        if(left_flag&right_flag)
                         {
                             center[i]=(left+right)/2;left_last=left;right_last=right;
                         }
                        else if((left_flag==1)&&(right_flag==0))
                         {
                             center[i]=center[i-1]-left_last+left;left_last=left;
                         }
                        else if((left_flag==0)&&(right_flag==1))
                         {
                             center[i]=center[i-1]-right_last+right;right_last=right;
                         }
                        else center[i]=center[i-1];
                        date[i][center[i]]=0;
                    }
                   for(i=end;i<X_MAX;i++)
                    {
                        root1=left;root2=right;
                        if(root1<scale) left_start=2;
                        else left_start=root1-scale;
                        if(root1+scale>Y_MAX-2)  left_end=Y_MAX-2;
                        else left_end=root1+scale;
                        for(j=left_end;j>left_start;j--)
                         {
                             if((date[i][j+1]>date[i][j])&&(date[i][j+2]>date[i][j-1]))
                              {
                                  left=j;
                                  left_flag=1;//表示采集到左边缘
                                  break;
                              }
                             left_flag=0;
                         }
                        if(root2+scale>Y_MAX-2) right_start=Y_MAX-2;
                        else right_start=root2+scale;
                        if(root2<scale)  right_end=2;
                        else right_end = root2-scale;
                        for(j=right_end;j<right_start;j++)
                         {
                             if((date[i][j-1]>date[i][j])&&(date[i][j-2]>date[i][j+1]))
                              {
                                  right=j;
                                  right_flag=1;//采集到右边缘
                                  break;
                              }
                             right_flag=0;
                         }
                        if(left_flag&right_flag)
                         {
                             center[i]=(left+right)/2;left_last=left;right_last=right;
                         }
                        else if((left_flag==1)&&(right_flag==0))
                         {
                             center[i]=center[i-1]-left_last+left;left_last=left;
                         }
                        else if((left_flag==0)&&(right_flag==1))
                         {
                             center[i]=center[i-1]-right_last+right;right_last=right;
                         }
                        else center[i]=center[i-1];
                        date[i][center[i]]=0;
                    }
#endif                 
#if     0           //边缘扫描算法
                   scan_mode=0;left_dot=0;right_dot=0;
                   scan_mode=0;//0表示行扫描，1表示列扫描
                    hang_dir=0;lie_dir=0;
					left_flag=0,right_flag=0;
                   for(i=start;!((left_flag&&right_flag)&&(i>=end));i++)   //先扫前几行
                    {
                        left=0;right=Y_MAX;
                        for(j=Y_MAX/2;j>3;j--)
                         {
                             if((date[i][j+1]>date[i][j])&&(date[i][j+2]>date[i][j-1]))
                              {
                                  left=j;
								  left_flag=1;
                                  break;
                              }
							 left_flag=0;
                         }
                        left_line[left_dot][0]=i;left_line[left_dot][1]=left;left_dot++;
                        for(j=Y_MAX/2;j<Y_MAX-3;j++)
                         {
                             if((date[i][j-1]>date[i][j])&&(date[i][j-2]>date[i][j+1]))
                              {
                                  right=j;
								  right_flag=1;
                                  break;
                              }
							 right_flag=0;
                         }
                        right_line[right_dot][0]=i;right_line[right_dot][1]=right;right_dot++;
                    }
                   //先扫左边的一条线
                   ones_ok=0;
                   for(i;(i>2)&&(i<X_MAX-2)&&(j>2)&&(j<Y_MAX-2);)
                    {
                        if(scan_mode==0)//如果现在是行扫描
                         {
                             root1=left_line[left_dot-1][1];
                             if(root1<scale) left_start=2;
                             else left_start=root1-scale;
                             if(root1+scale>Y_MAX-2)  left_end=Y_MAX-2;
                             else left_end=root1+scale;
                             for(j=left_end;j>=left_start;j--)
                              {
                                  if((date[i][j+1]>date[i][j])&&(date[i][j+2]>date[i][j-1]))
                                   {
                                       left=j;
                                       left_flag=1;//表示采集到左边缘
                                       left_line[left_dot][0]=i;left_line[left_dot][1]=left;left_dot++;
                                       break;
                                   }
                                  left_flag=0;
                              }
                             if(left_flag==0)//v如果没有搜到，就看下一行是不是全为黑或者全白
                              {
                                  j=(left_end+left_start)/2;
                                  if((left_line[left_dot-1][1]-left_line[left_dot-6][1]>0)&&(left_line[left_dot-2][1]-left_line[left_dot-7][1]>0))
                                      lie_dir=1;//若连续两个都比前面大，说明在往列增大的地方偏
                                  else lie_dir=0;
                                  if(!ones_ok)
                                   {
							for(k=0;k<X_MAX;k+=2)
							 {
								 for(left_10_j=0;left_10_j<Y_MAX;left_10_j+=2)
								 {
									 if(date[k+i][left_10_j]!=254)
									 {
										 t=0;
										 break;
									 }
									 t=1;
								 }
                                 if(t==1) break;
								 
							 }//t=1表示遇到十字
                                   }
							if((t)&&(!ones_ok))//如果遇到十字
							{
								for(k;(k!=5)&&(k<X_MAX);k+=5)
								{
									left_10_j=2;
									for(left_10_j;left_10_j<Y_MAX-2;left_10_j+=2)
									{
										if((date[k+i][left_10_j+2]>date[k+i][left_10_j-2])&&(date[k+i][left_10_j+1]>date[k+i][left_10_j-1]))
										  {
											  left_10[1]=left_10_j;
											  left_10[0]=k+i;
											  k=0;
											  break;
										  }
									}
								}
								dot_sub=(left_10[0]-left_line[left_dot-3][0])/(left_10[1]-left_line[left_dot-3][1]);
								for(i;i<left_10[0];i++)
								{
								    left_line[left_dot][0]=i;
									if((left_10[0]-i)%dot_sub==0)
										left_line[left_dot][1]=left_line[left_dot-1][1]+1;
									else left_line[left_dot][1]=left_line[left_dot-1][1];
									left_dot++;
								}
								t=0;ones_ok=1;
							}
                            else  if((!t)&&((date[i+1][j-1]==date[i+1][j])&&(date[i+1][j]==date[i+1][j+1])&&(date[i+1][j]==1)&&(lie_dir))||((date[i+1][j-1]==date[i+1][j])&&(date[i+1][j]==date[i+1][j+1])&&(date[i+1][j]==254)&&(lie_dir==0)))//表示都是黑点或者白点
                                   {
                                       left_flag=0;
                                       scan_mode=1;
                                       i--;
                                   }
                                 //else  while(1);//否则先死在这,表示后面 不只是黑点，不应该是转换地点，可能是十字//待写
                              }
                             i++;
                         }
                        else 
                         {
                             root1=left_line[left_dot-1][0];
                             if(root1<scale) left_start=2;
                             else left_start=root1-scale;
                             if(root1+scale>X_MAX-2)  left_end=X_MAX-2;
                             else left_end=root1+scale;
                             if(lie_dir)
                              {
                                  for(i=left_start;i<left_end;i++)
                                   {
                                       if((date[i-1][j]>date[i][j])&&(date[i-2][j]>date[i+1][j]))
                                        {
                                            left=i;
                                            left_flag=1;//表示采集到左边缘
											error_times=0;
                                            left_line[left_dot][0]=left;left_line[left_dot][1]=j;left_dot++;
                                            break;
                                        }
                                       left_flag=0;
                                   }
								  if(left_flag=0)
								  {	
										left_line[left_dot][0]=left_line[left_dot-1][0]-left_line[left_dot-2][0]+left_line[left_dot-1][0];
										left_line[left_dot][1]=left_line[left_dot-1][1]-left_line[left_dot-2][1]+left_line[left_dot-1][1];
										left_dot++;
										 error_times++;
										 if( error_times==3) break;
								  }
                                  j++;
                              }
                             else 
                              {
                                  for(i=left_end;i>left_start;i--)
                                   {
                                       if((date[i+1][j]>date[i][j])&&(date[i+2][j]>date[i-1][j]))
                                        {
                                            left=i;
                                            left_flag=1;//表示采集到左边缘
											error_times=0;
                                            left_line[left_dot][0]=left;left_line[left_dot][1]=j;left_dot++;
                                            break;
                                        }
                                       left_flag=0;
                                   }
								  if(left_flag=0)
								  {	
										left_line[left_dot][0]=left_line[left_dot-1][0]-left_line[left_dot-2][0]+left_line[left_dot-1][0];
										left_line[left_dot][1]=left_line[left_dot-1][1]-left_line[left_dot-2][1]+left_line[left_dot-1][1];
										left_dot++;error_times++;
										 if( error_times==3) break;
								  }
                                  j--;
                              }
                         }
                    }
                   
                   //右边的一条线
                   scan_mode=0;error_times=0;
                   for(i=end,j=right_line[right_dot-1][1];(i>2)&&(i<X_MAX-2)&&(j>2)&&(j<Y_MAX-2);)
                    {
                        if(scan_mode==0)//如果现在是行扫描
                         {
                             root2=right_line[right_dot-1][1];
                             if(root2<scale) right_start=2;
                             else right_start=root2-scale;
                             if(root2+scale>Y_MAX-2)  right_end=Y_MAX-2;
                             else right_end=root2+scale;
                             for(j=right_start;j<right_end;j++)
                              {
                                  if((date[i][j-1]>date[i][j])&&(date[i][j-2]>date[i][j+1]))
                                   {
                                       right=j;
                                       right_flag=1;//表示采集到左边缘
                                       right_line[right_dot][0]=i;right_line[right_dot][1]=right;right_dot++;
                                       break;
                                   }
                                  right_flag=0;
                              }
                             if(right_flag==0)//v如果没有搜到，就看下一行是不是全为黑或者全白
                              {
                                  j=(right_end+right_start)/2;
                                  if((right_line[right_dot-1][1]-right_line[right_dot-6][1]>0)&&(right_line[right_dot-2][1]-right_line[right_dot-7][1]>0))
                                      lie_dir=1;//若连续两个都比前面大，说明在往列增大的地方偏
                                  else lie_dir=0;
                             if(((date[i+1][j-1]==date[i+1][j])&&(date[i][j]==date[i+1][j+1])&&(date[i][j]==254)&&lie_dir)||((date[i+1][j-1]==date[i+1][j])&&(date[i][j]==date[i+1][j+1])&&(date[i][j]==1)&&(lie_dir==0)))//表示都是黑点                                   {
                                   {
                                       right_flag=0;
                                       scan_mode=1;
                                       i--;
                                   }
                                 // else while(1);//否则先死在这,表示后面 不只是黑点，不应该是转换地点，可能是十字//待写
                              }
                             i++;
                         }
                        else 
                         {
                             root2=right_line[right_dot-1][0];
                             if(root2<scale) right_start=2;
                             else right_start=root2-scale;
                             if(root2+scale>X_MAX-2)  right_end=X_MAX-2;
                             else right_end=root2+scale;
                             if(lie_dir)
                              {
                                  for(i=right_end;i>right_start;i--)
                                   {
                                       if((date[i+1][j]>date[i][j])&&(date[i+2][j]>date[i-1][j]))
                                        {
                                            right=i;
                                            right_flag=1;//表示采集到左边缘
											error_times=0;
                                            right_line[right_dot][0]=right;right_line[right_dot][1]=j;right_dot++;
                                            break;
                                        }
                                       right_flag=0;
                                   }
                                  j++;
								  if(right_flag==0)
								  {
										right_line[right_dot][0]=right_line[right_dot-1][0]-right_line[right_dot-2][0]+right_line[right_dot-1][0];
										right_line[right_dot][1]=right_line[right_dot-1][1]-right_line[right_dot-2][1]+right_line[right_dot-1][1];
										right_dot++;error_times++;
											 if( error_times==3) break;
								  }
                              }
                             else 
                              {
                                  for(i=right_start;i<right_end;i++)
                                   {
                                       if((date[i-1][j]>date[i][j])&&(date[i-2][j]>date[i+1][j]))
                                        {
                                            right=i;
                                            right_flag=1;//表示采集到左边缘
											error_times=0;
                                            right_line[right_dot][0]=right;right_line[right_dot][1]=j;right_dot++;
                                            break;
                                        }
                                       right_flag=0;
                                   }
								    if(right_flag==0)
								  {
										right_line[right_dot][0]=2*right_line[right_dot-1][0]-right_line[right_dot-2][0];
										right_line[right_dot][1]=2*right_line[right_dot-1][1]-right_line[right_dot-2][1];
										right_dot++;
										error_times++;
											 if( error_times==3) break;
								  }
                                  j--;
                              }
                         }
                    }           
#endif
                   //UART_S1(UART0,0XFF);
                   /*for(i=0;i<dot_num;i++)
                    {
                        date[(left_line[left_dot/dot_num*i][0]+right_line[right_dot/dot_num*i][0])/2][(left_line[left_dot/dot_num*i][1]+right_line[right_dot/dot_num*i][1])/2]=0;
                    }
                   for(i=0;i<left_dot;i++)
                    {
                        date[left_line[i][0]+2][left_line[i][1]+2]=0;
                    }
                   for(i=0;i<right_dot;i++)
                    {
                        date[right_line[i][0]][right_line[i][1]]=0;
                    }*/
                   /*UART_SS(UART0,"image");
                   for(i=X_MAX;i>0;i--)
                       for(j=Y_MAX;j>0;j--)
                           UART_S1(UART0,date[i][j]);*/
                   
                   UART_SS(UART0,"image");
                   for(i=0;i<X_MAX;i++)
                       for(j=0;j<Y_MAX;j++)
                        {if(date[i][j]==0)
                            {
                                date[i][j]=1;
                            }
                           UART_S1(UART0,date[i][j]);
                        }
                   i=0;j=0;
                   EnableInterrupts
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
#if 0//隔行扫描
          if(i%2==0)
           {
               DMA_Enable_new(DMAMUX0,DMA_CH0);
               if(i>=X_MAX*2)
                {
                    flag_photo=1;
                    Disable_IRQ(INT_PORTC);
                    DisableInterrupts;
                    GPIOINT_Disable(HREF_PORT,HREF_PIN);
                    DMA_Disable_new(DMAMUX0,DMA_CH0);
                    DMA_SetDestAddress(DMA_CH0, date);       
                }
           }le_new(DMAMUX0,DMA_CH0);
#endif
#if 1   //逐行扫描
          if(i>5)
          DMA_Enable_new(DMAMUX0,DMA_CH0);
#endif
          if(i>=X_MAX+5)
           {
               flag_photo=1;
               Disable_IRQ(INT_PORTC);
               DisableInterrupts;
               GPIOINT_Disable(HREF_PORT,HREF_PIN);
               DMA_Disable_new(DMAMUX0,DMA_CH0);
               DMA_SetDestAddress(DMA_CH0, date);       
           }
          i++;
      }
     if(port_date&0X20000)
      {
          PORTC_ISFR|=0X20000;
          GPIOINT_Disable(VSYNC_PORT,VSYNC_PIN);
          GPIOINT_Enable(HREF_PORT,HREF_PIN,LEVEL_RISING);
      }
 }

void DMA0_DMA16_IRQHandler(void)
 {
     DMA_Clear_Int(DMA_CH0);
 }
void UART0_RX_TX_IRQHandler(void)
 {
     UART_FIFO_Read_value(UART0,sensor);
     read_pose(UART0,sensor);
 }