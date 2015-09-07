///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:21:33
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\main.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\main.c" -lA "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\Debug\List\" -o "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\Debug\Obj\" --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M4F -e --fpu=VFPv4_sp --dlib_config
//        "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\" -I "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\my ku\" -I "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\my ku\src\" -I "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\my ku\project\" -On
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN BTN_current_init
        EXTERN CAM_get
        EXTERN DMA_Clear_Int
        EXTERN DMA_Destination_new
        EXTERN DMA_Disable_new
        EXTERN DMA_Enable_new
        EXTERN DMA_Init_new
        EXTERN DMA_SetDestAddress
        EXTERN DMA_Source_new
        EXTERN Disable_IRQ
        EXTERN Enable_IRQ
        EXTERN GPIOINT_Clear
        EXTERN GPIOINT_Disable
        EXTERN GPIOINT_Enable
        EXTERN GPIOPULL_SET
        EXTERN GPIOType_SPI
        EXTERN GPIOType_UART
        EXTERN GPIO_INIT
        EXTERN IR_INIT
        EXTERN Key_get
        EXTERN Key_init
        EXTERN LCD_Init
        EXTERN LCD_ShowString
        EXTERN LED_ON
        EXTERN MT34_init
        EXTERN OLED_image
        EXTERN OLED_init
        EXTERN PID_control_k
        EXTERN PID_speed
        EXTERN PITINT_Clear
        EXTERN PITINT_Enable
        EXTERN PIT_INIT
        EXTERN QD_init_FTM
        EXTERN SCCB_init
        EXTERN SD_Init
        EXTERN SET_IRQ_PRIOR
        EXTERN SPI_init
        EXTERN SYS_CLOCK_SET
        EXTERN Switch_get
        EXTERN Switch_init
        EXTERN TFT_Init
        EXTERN UARTINT_Enable
        EXTERN UART_FIFO_read_init
        EXTERN UART_INIT
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN count_pwm1
        EXTERN count_pwm2
        EXTERN `date`
        EXTERN desier_get
        EXTERN driver
        EXTERN ecode_get
        EXTERN k_p
        EXTERN k_ptemp
        EXTERN key_run
        EXTERN led_init
        EXTERN middle_PID_control
        EXTERN middle_p
        EXTERN motor_PWM_init
        EXTERN mulu
        EXTERN power_test_init
        EXTERN run_time
        EXTERN servo_driver_init
        EXTERN servo_set
        EXTERN show_all_TFT
        EXTERN speed_p
        EXTERN start_run
        EXTERN sub_p

        PUBLIC DMA0_DMA16_IRQHandler
        PUBLIC PIT0_IRQHandler
        PUBLIC PORTC_IRQHandler
        PUBLIC control_k
        PUBLIC flag_photo
        PUBLIC i
        PUBLIC image_n
        PUBLIC j
        PUBLIC k
        PUBLIC main
        PUBLIC middle_output
        PUBLIC n
        PUBLIC pwm_add
        PUBLIC read_da1
        PUBLIC sensor
        PUBLIC speed_end
        PUBLIC speed_start
        PUBLIC start_encode
        PUBLIC sum_error
        PUBLIC t
        
          CFI Names cfiNames0
          CFI StackFrame CFA R13 DATA
          CFI Resource R0:32, R1:32, R2:32, R3:32, R4:32, R5:32, R6:32, R7:32
          CFI Resource R8:32, R9:32, R10:32, R11:32, R12:32, R13:32, R14:32
          CFI Resource D0:64, D1:64, D2:64, D3:64, D4:64, D5:64, D6:64, D7:64
          CFI Resource D8:64, D9:64, D10:64, D11:64, D12:64, D13:64, D14:64
          CFI Resource D15:64
          CFI EndNames cfiNames0
        
          CFI Common cfiCommon0 Using cfiNames0
          CFI CodeAlign 2
          CFI DataAlign 4
          CFI ReturnAddress R14 CODE
          CFI CFA R13+0
          CFI R0 Undefined
          CFI R1 Undefined
          CFI R2 Undefined
          CFI R3 Undefined
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI R8 SameValue
          CFI R9 SameValue
          CFI R10 SameValue
          CFI R11 SameValue
          CFI R12 Undefined
          CFI R14 SameValue
          CFI D0 Undefined
          CFI D1 Undefined
          CFI D2 Undefined
          CFI D3 Undefined
          CFI D4 Undefined
          CFI D5 Undefined
          CFI D6 Undefined
          CFI D7 Undefined
          CFI D8 SameValue
          CFI D9 SameValue
          CFI D10 SameValue
          CFI D11 SameValue
          CFI D12 SameValue
          CFI D13 SameValue
          CFI D14 SameValue
          CFI D15 SameValue
          CFI EndCommon cfiCommon0
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\main.c
//    1 #include "all.h"
//    2 //定义行列数

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 uint8 sensor[8];
sensor:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 uint32 speed_start=0,speed_end=150000000;
speed_start:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
speed_end:
        DATA
        DC32 150000000

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//    5 int16  i=0,j=0,k=0,image_n=0,t=0,read_da1;
i:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
j:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
k:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
image_n:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
t:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
read_da1:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//    6 uint16 n=0;
n:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    7 uint8 flag_photo=0,start_encode=0;
flag_photo:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
start_encode:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 float sum_error,middle_output=0,control_k;
sum_error:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
middle_output:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
control_k:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 float pwm_add[5]={0};
pwm_add:
        DS8 20
//   10 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function main
        THUMB
//   11 void main()
//   12  {
main:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        VPUSH    {D8}
          CFI D8 Frame(CFA, -24)
          CFI CFA R13+24
        SUB      SP,SP,#+8
          CFI CFA R13+32
//   13      SYS_CLOCK_SET(SYS_CLOCK_150M,1,2,3,6);
        MOVS     R0,#+6
        STR      R0,[SP, #+0]
        MOVS     R3,#+3
        MOVS     R2,#+2
        MOVS     R1,#+1
        MOVS     R0,#+24
          CFI FunCall SYS_CLOCK_SET
        BL       SYS_CLOCK_SET
//   14      DisableInterrupts
        CPSID i
//   15          //VSYNC中断
//   16      GPIO_INIT(VSYNC_PORT,VSYNC_PIN,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+17
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   17      GPIOPULL_SET(VSYNC_PORT,VSYNC_PIN,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+17
        MOVS     R0,#+2
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   18      Enable_IRQ(INT_PORTC);
        MOVS     R0,#+105
          CFI FunCall Enable_IRQ
        BL       Enable_IRQ
//   19      GPIOINT_Enable(VSYNC_PORT,VSYNC_PIN,LEVEL_RISING);
        MOVS     R2,#+9
        MOVS     R1,#+17
        MOVS     R0,#+2
          CFI FunCall GPIOINT_Enable
        BL       GPIOINT_Enable
//   20      //HREF中断
//   21      GPIO_INIT(HREF_PORT,HREF_PIN,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+15
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   22      GPIOPULL_SET(HREF_PORT,HREF_PIN,LEVEL_RISING);
        MOVS     R2,#+9
        MOVS     R1,#+15
        MOVS     R0,#+2
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   23      //PCLK中断
//   24      GPIO_INIT(PCLK_PORT,PCKL_PIN,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+14
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   25      GPIOPULL_SET(PCLK_PORT,PCKL_PIN,PULL_DOWN);
        MOVS     R2,#+0
        MOVS     R1,#+14
        MOVS     R0,#+2
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   26      GPIOINT_Enable(PCLK_PORT,PCKL_PIN,DMA_RISING);
        MOVS     R2,#+1
        MOVS     R1,#+14
        MOVS     R0,#+2
          CFI FunCall GPIOINT_Enable
        BL       GPIOINT_Enable
//   27      
//   28      //DMA初始化
//   29      DMA_Init_new(DMAMUX0, DMA_CH0,Src_PORTC,Y_MAX+15,1,DMA_Normal_Mode);
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+225
        MOVS     R2,#+51
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall DMA_Init_new
        BL       DMA_Init_new
//   30      DMA_Source_new(DMA_CH0, 0X400FF0D0,0, DMA_8BIT, 0);
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDR.W    R1,??DataTable2_1  ;; 0x400ff0d0
        MOVS     R0,#+0
          CFI FunCall DMA_Source_new
        BL       DMA_Source_new
//   31      DMA_Destination_new(DMA_CH0, date,1, DMA_8BIT, 0);
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+1
        LDR.W    R1,??DataTable2_2
        MOVS     R0,#+0
          CFI FunCall DMA_Destination_new
        BL       DMA_Destination_new
//   32      //DMA_Int_Enable(DMA_CH0,DMA_MAJOR);
//   33      //设置输入端口
//   34      GPIO_INIT(PORTD,0,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   35      GPIO_INIT(PORTD,1,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   36      GPIO_INIT(PORTD,2,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+2
        MOVS     R0,#+3
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   37      GPIO_INIT(PORTD,3,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,#+3
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   38      GPIO_INIT(PORTD,4,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+4
        MOVS     R0,#+3
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   39      GPIO_INIT(PORTD,5,INPUT);  
        MOVS     R2,#+0
        MOVS     R1,#+5
        MOVS     R0,#+3
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   40      GPIO_INIT(PORTD,6,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+6
        MOVS     R0,#+3
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   41      GPIO_INIT(PORTD,7,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+7
        MOVS     R0,#+3
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   42      GPIOPULL_SET(PORTD,0,PULL_DOWN);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   43      GPIOPULL_SET(PORTD,1,PULL_DOWN);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   44      GPIOPULL_SET(PORTD,2,PULL_DOWN);
        MOVS     R2,#+0
        MOVS     R1,#+2
        MOVS     R0,#+3
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   45      GPIOPULL_SET(PORTD,3,PULL_DOWN);
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,#+3
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   46      GPIOPULL_SET(PORTD,4,PULL_DOWN);
        MOVS     R2,#+0
        MOVS     R1,#+4
        MOVS     R0,#+3
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   47      GPIOPULL_SET(PORTD,5,PULL_DOWN);
        MOVS     R2,#+0
        MOVS     R1,#+5
        MOVS     R0,#+3
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   48      GPIOPULL_SET(PORTD,6,PULL_DOWN);
        MOVS     R2,#+0
        MOVS     R1,#+6
        MOVS     R0,#+3
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   49      GPIOPULL_SET(PORTD,7,PULL_DOWN);
        MOVS     R2,#+0
        MOVS     R1,#+7
        MOVS     R0,#+3
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   50      
//   51      //UART
//   52      GPIOType_UART(PORTB_16_17);
        MOVS     R0,#+1
          CFI FunCall GPIOType_UART
        BL       GPIOType_UART
//   53      UART_INIT(UART0,75000,115200);
        MOVS     R2,#+115200
        LDR.W    R1,??DataTable2_3  ;; 0x124f8
        MOVS     R0,#+0
          CFI FunCall UART_INIT
        BL       UART_INIT
//   54      UART_FIFO_read_init(UART0);
        MOVS     R0,#+0
          CFI FunCall UART_FIFO_read_init
        BL       UART_FIFO_read_init
//   55      //Enable_IRQ(61);
//   56      UARTINT_Enable(UART0,RIE);
        MOVS     R1,#+5
        MOVS     R0,#+0
          CFI FunCall UARTINT_Enable
        BL       UARTINT_Enable
//   57      //SCCB_INIT
//   58      SCCB_init();
          CFI FunCall SCCB_init
        BL       SCCB_init
//   59      MT34_init();   
          CFI FunCall MT34_init
        BL       MT34_init
//   60      servo_driver_init();
          CFI FunCall servo_driver_init
        BL       servo_driver_init
//   61      
//   62      //电机初始化
//   63      motor_PWM_init();
          CFI FunCall motor_PWM_init
        BL       motor_PWM_init
//   64      //SD初始化
//   65     SD_Init();
          CFI FunCall SD_Init
        BL       SD_Init
//   66     //PIT0
//   67     PIT_CLOCK_Enable
        LDR.W    R0,??DataTable2_4  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.W    R1,??DataTable2_4  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   68     PIT_INIT(PIT0,150000000,DEBUG_STOP);
        MOVS     R2,#+1
        LDR.W    R1,??DataTable2_5  ;; 0x8f0d180
        MOVS     R0,#+0
          CFI FunCall PIT_INIT
        BL       PIT_INIT
//   69   
//   70     Enable_IRQ(INT_PIT0);
        MOVS     R0,#+84
          CFI FunCall Enable_IRQ
        BL       Enable_IRQ
//   71     PITINT_Enable(PIT0);
        MOVS     R0,#+0
          CFI FunCall PITINT_Enable
        BL       PITINT_Enable
//   72     
//   73    //PIT1  电机速度控制
//   74     PIT_INIT(PIT1,750000,DEBUG_STOP);  //5ms控制电机
        MOVS     R2,#+1
        LDR.W    R1,??DataTable2_6  ;; 0xb71b0
        MOVS     R0,#+1
          CFI FunCall PIT_INIT
        BL       PIT_INIT
//   75     // PIT_Enable(PIT1);
//   76     Enable_IRQ(INT_PIT1);
        MOVS     R0,#+85
          CFI FunCall Enable_IRQ
        BL       Enable_IRQ
//   77     PITINT_Enable(PIT1);
        MOVS     R0,#+1
          CFI FunCall PITINT_Enable
        BL       PITINT_Enable
//   78     
//   79     
//   80      //优先级设置
//   81      SET_IRQ_PRIOR(INT_PORTC,0);
        MOVS     R1,#+0
        MOVS     R0,#+105
          CFI FunCall SET_IRQ_PRIOR
        BL       SET_IRQ_PRIOR
//   82      SET_IRQ_PRIOR(INT_PIT0,2);
        MOVS     R1,#+2
        MOVS     R0,#+84
          CFI FunCall SET_IRQ_PRIOR
        BL       SET_IRQ_PRIOR
//   83      SET_IRQ_PRIOR(INT_PIT1,1);
        MOVS     R1,#+1
        MOVS     R0,#+85
          CFI FunCall SET_IRQ_PRIOR
        BL       SET_IRQ_PRIOR
//   84      //LED初始化
//   85      led_init();
          CFI FunCall led_init
        BL       led_init
//   86      //OLED
//   87      LCD_Init();
          CFI FunCall LCD_Init
        BL       LCD_Init
//   88      OLED_init();
          CFI FunCall OLED_init
        BL       OLED_init
//   89      //TFT初始化
//   90      GPIO_INIT(RST_PORT,RST_PIN,1);
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+0
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   91      GPIO_INIT(DC_PORT,DC_PIN,1);
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+0
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   92      GPIOType_SPI(SPI0,SPI0_PCS0_PTA14,SPI0_SCK_PTA15,SPI0_SOUT_PTA16,SPI0_SIN_PTA17);
        MOVS     R0,#+3
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall GPIOType_SPI
        BL       GPIOType_SPI
//   93      SPI_init(SPI0,MASTER);
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall SPI_init
        BL       SPI_init
//   94      TFT_Init();
          CFI FunCall TFT_Init
        BL       TFT_Init
//   95      LCD_ShowString(200,10,30,30,16,"PID:");
        LDR.N    R0,??DataTable2_7
        STR      R0,[SP, #+4]
        MOVS     R0,#+16
        STR      R0,[SP, #+0]
        MOVS     R3,#+30
        MOVS     R2,#+30
        MOVS     R1,#+10
        MOVS     R0,#+200
          CFI FunCall LCD_ShowString
        BL       LCD_ShowString
//   96      LCD_ShowString(200,25,30,30,16,"P=");
        ADR.N    R0,??DataTable0  ;; 0x50, 0x3D, 0x00, 0x00
        STR      R0,[SP, #+4]
        MOVS     R0,#+16
        STR      R0,[SP, #+0]
        MOVS     R3,#+30
        MOVS     R2,#+30
        MOVS     R1,#+25
        MOVS     R0,#+200
          CFI FunCall LCD_ShowString
        BL       LCD_ShowString
//   97      LCD_ShowString(200,40,30,30,16,"I=");
        ADR.N    R0,??DataTable0_1  ;; 0x49, 0x3D, 0x00, 0x00
        STR      R0,[SP, #+4]
        MOVS     R0,#+16
        STR      R0,[SP, #+0]
        MOVS     R3,#+30
        MOVS     R2,#+30
        MOVS     R1,#+40
        MOVS     R0,#+200
          CFI FunCall LCD_ShowString
        BL       LCD_ShowString
//   98      LCD_ShowString(200,55,30,30,16,"D=");
        ADR.N    R0,??DataTable0_2  ;; 0x44, 0x3D, 0x00, 0x00
        STR      R0,[SP, #+4]
        MOVS     R0,#+16
        STR      R0,[SP, #+0]
        MOVS     R3,#+30
        MOVS     R2,#+30
        MOVS     R1,#+55
        MOVS     R0,#+200
          CFI FunCall LCD_ShowString
        BL       LCD_ShowString
//   99      LCD_ShowString(200,70,30,30,16,"K=");
        ADR.N    R0,??DataTable0_3  ;; 0x4B, 0x3D, 0x00, 0x00
        STR      R0,[SP, #+4]
        MOVS     R0,#+16
        STR      R0,[SP, #+0]
        MOVS     R3,#+30
        MOVS     R2,#+30
        MOVS     R1,#+70
        MOVS     R0,#+200
          CFI FunCall LCD_ShowString
        BL       LCD_ShowString
//  100      //key_init
//  101      Key_init();
          CFI FunCall Key_init
        BL       Key_init
//  102      Switch_init();
          CFI FunCall Switch_init
        BL       Switch_init
//  103      GPIOPULL_SET(PORTC,3,PULL_DOWN);
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,#+2
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//  104      float frequence=0;
        VLDR.W   S16,??DataTable1  ;; 0x0
//  105       IR_INIT();
          CFI FunCall IR_INIT
        BL       IR_INIT
//  106       
//  107       //正交解码
//  108       QD_init_FTM();
          CFI FunCall QD_init_FTM
        BL       QD_init_FTM
//  109       power_test_init();
          CFI FunCall power_test_init
        BL       power_test_init
//  110      BTN_current_init();
          CFI FunCall BTN_current_init
        BL       BTN_current_init
//  111      EnableInterrupts
        CPSIE i
//  112      uint8 tft_flag=3;   
        MOVS     R4,#+3
//  113      uint8 sour_i,sour_j,key_num=0;
        MOVS     R5,#+0
//  114      while(1)
//  115       {
//  116           if((key_num=Key_get())!=0)  key_run(key_num);
??main_0:
          CFI FunCall Key_get
        BL       Key_get
        MOVS     R5,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??main_1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
          CFI FunCall key_run
        BL       key_run
//  117           //BTN_value();
//  118           if(flag_photo)
??main_1:
        LDR.N    R0,??DataTable2_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??main_0
//  119            {
//  120               //send_line_other(UART0,1,count_pwm1);
//  121               // send_line_other(UART0,2,count_pwm2);
//  122                flag_photo=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_8
        STRB     R0,[R1, #+0]
//  123                if((mulu==0)&&(start_run==0)) OLED_image();
        LDR.N    R0,??DataTable2_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??main_2
        LDR.N    R0,??DataTable2_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??main_2
          CFI FunCall OLED_image
        BL       OLED_image
//  124                //TakePhoto();
//  125                LED_ON(led0,led_on);
??main_2:
        MOVS     R1,#+0
        MOVS     R0,#+11
          CFI FunCall LED_ON
        BL       LED_ON
//  126                if(Switch_get(0)==0) 
        MOVS     R0,#+0
          CFI FunCall Switch_get
        BL       Switch_get
        CMP      R0,#+0
        BNE.N    ??main_3
//  127                 { 
//  128                     tft_flag=3;
        MOVS     R0,#+3
        MOVS     R4,R0
//  129                     show_all_TFT(tft_flag);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall show_all_TFT
        BL       show_all_TFT
//  130                     
//  131                 }
//  132                if(Switch_get(1)==0) 
??main_3:
        MOVS     R0,#+1
          CFI FunCall Switch_get
        BL       Switch_get
        CMP      R0,#+0
        BNE.N    ??main_0
//  133                 {
//  134                     tft_flag=2;
        MOVS     R0,#+2
        MOVS     R4,R0
//  135                     show_all_TFT(tft_flag);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall show_all_TFT
        BL       show_all_TFT
        B.N      ??main_0
          CFI EndBlock cfiBlock0
//  136                 }
//  137                   
//  138                 
//  139            }
//  140       }
//  141  }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC8      0x50, 0x3D, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC8      0x49, 0x3D, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC8      0x44, 0x3D, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC8      0x4B, 0x3D, 0x00, 0x00
//  142 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PORTC_IRQHandler
        THUMB
//  143 void PORTC_IRQHandler(void)
//  144  {
PORTC_IRQHandler:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  145      uint32 port_date=PORTC_ISFR;
        LDR.N    R0,??DataTable2_11  ;; 0x4004b0a0
        LDR      R6,[R0, #+0]
//  146      if(port_date&0X8000)
        LSLS     R0,R6,#+16
        BPL.W    ??PORTC_IRQHandler_0
//  147       {
//  148           PORTC_ISFR|=0X8000;
        LDR.N    R0,??DataTable2_11  ;; 0x4004b0a0
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000
        LDR.N    R1,??DataTable2_11  ;; 0x4004b0a0
        STR      R0,[R1, #+0]
//  149 #if 0//隔行扫描
//  150           if((i%2==0)&&(i>=4))
//  151            {
//  152                DMA_Enable_new(DMAMUX0,DMA_CH0);
//  153                if(i>=X_MAX*2+1)
//  154                 {
//  155                     flag_photo=1;
//  156                     start_encode=0;
//  157                     Disable_IRQ(INT_PORTC);
//  158                     DisableInterrupts;
//  159                     GPIOINT_Disable(HREF_PORT,HREF_PIN);
//  160                     DMA_Disable_new(DMAMUX0,DMA_CH0);
//  161                     DMA_SetDestAddress(DMA_CH0, date);       
//  162                 }
//  163            }
//  164 #endif
//  165 #if 1  //逐行扫描
//  166           if(i>=1)
        LDR.N    R0,??DataTable2_12
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PORTC_IRQHandler_1
//  167           DMA_Enable_new(DMAMUX0,DMA_CH0);
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall DMA_Enable_new
        BL       DMA_Enable_new
//  168 #endif
//  169           if(i>=X_MAX+4)
??PORTC_IRQHandler_1:
        LDR.N    R0,??DataTable2_12
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+159
        BLT.W    ??PORTC_IRQHandler_2
//  170            {
//  171                flag_photo=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_8
        STRB     R0,[R1, #+0]
//  172                Disable_IRQ(INT_PORTC);
        MOVS     R0,#+105
          CFI FunCall Disable_IRQ
        BL       Disable_IRQ
//  173                DisableInterrupts;
        CPSID i
//  174                GPIOINT_Disable(HREF_PORT,HREF_PIN);
        MOVS     R1,#+15
        MOVS     R0,#+2
          CFI FunCall GPIOINT_Disable
        BL       GPIOINT_Disable
//  175                DMA_Disable_new(DMAMUX0,DMA_CH0);
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall DMA_Disable_new
        BL       DMA_Disable_new
//  176                DMA_SetDestAddress(DMA_CH0, date);   
        LDR.N    R1,??DataTable2_2
        MOVS     R0,#+0
          CFI FunCall DMA_SetDestAddress
        BL       DMA_SetDestAddress
//  177                
//  178 #if  1      //控制代码
//  179                CAM_get();//图像处理以及中线提取，外部变量
          CFI FunCall CAM_get
        BL       CAM_get
//  180                middle_output=middle_PID_control(middle_p,0,0);
        VLDR.W   S2,??DataTable1  ;; 0x0
        VLDR.W   S1,??DataTable1  ;; 0x0
        LDR.N    R0,??DataTable2_13
        VLDR     S0,[R0, #0]
          CFI FunCall middle_PID_control
        BL       middle_PID_control
        LDR.N    R0,??DataTable2_14
        VSTR     S0,[R0, #0]
//  181                control_k=PID_control_k(k_p,0,0);k_p=k_ptemp;
        VLDR.W   S2,??DataTable1  ;; 0x0
        VLDR.W   S1,??DataTable1  ;; 0x0
        LDR.N    R0,??DataTable2_15
        VLDR     S0,[R0, #0]
          CFI FunCall PID_control_k
        BL       PID_control_k
        LDR.N    R0,??DataTable2_16
        VSTR     S0,[R0, #0]
        LDR.N    R0,??DataTable2_15
        LDR.N    R1,??DataTable2_17
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  182                pwm_add[0]=pwm_add[1];
        LDR.N    R0,??DataTable2_18
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
//  183                pwm_add[1]=pwm_add[2];
        LDR.N    R0,??DataTable2_18
        LDR.N    R1,??DataTable2_18
        LDR      R1,[R1, #+8]
        STR      R1,[R0, #+4]
//  184                pwm_add[2]=500-control_k-middle_output;
        VLDR.W   S0,??DataTable2  ;; 0x43fa0000
        LDR.N    R0,??DataTable2_16
        VLDR     S1,[R0, #0]
        VSUB.F32 S0,S0,S1
        LDR.N    R0,??DataTable2_14
        VLDR     S1,[R0, #0]
        VSUB.F32 S0,S0,S1
        LDR.N    R0,??DataTable2_18
        VSTR     S0,[R0, #+8]
//  185                servo_set(pwm_add[2]*0.8+pwm_add[1]*0.1+pwm_add[0]*0.1);
        LDR.N    R0,??DataTable2_18
        LDR      R0,[R0, #+8]
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_19  ;; 0x9999999a
        LDR.N    R3,??DataTable2_20  ;; 0x3fe99999
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable2_18
        LDR      R0,[R0, #+4]
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_19  ;; 0x9999999a
        LDR.N    R3,??DataTable2_21  ;; 0x3fb99999
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable2_18
        LDR      R0,[R0, #+0]
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_19  ;; 0x9999999a
        LDR.N    R3,??DataTable2_21  ;; 0x3fb99999
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2f
        BL       __aeabi_d2f
        VMOV     S0,R0
          CFI FunCall servo_set
        BL       servo_set
//  186                if(start_run==1)
        LDR.N    R0,??DataTable2_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??PORTC_IRQHandler_3
//  187                 {
//  188                     ecode_get(&count_pwm1,&count_pwm2);
        LDR.N    R1,??DataTable2_22
        LDR.N    R0,??DataTable2_23
          CFI FunCall ecode_get
        BL       ecode_get
//  189                     desier_get(0,sub_p);//获得理想差速之后 的速度
        LDR.N    R0,??DataTable2_24
        VLDR     S1,[R0, #0]
        VLDR.W   S0,??DataTable1  ;; 0x0
          CFI FunCall desier_get
        BL       desier_get
//  190                     PID_speed(speed_p,0.5,0,speed_p,0.5,0);//根据期望速度PID控制
        VLDR.W   S5,??DataTable1  ;; 0x0
        VMOV.F32 S4,#0.5
        LDR.N    R0,??DataTable2_25
        VLDR     S3,[R0, #0]
        VLDR.W   S2,??DataTable1  ;; 0x0
        VMOV.F32 S1,#0.5
        LDR.N    R0,??DataTable2_25
        VLDR     S0,[R0, #0]
          CFI FunCall PID_speed
        BL       PID_speed
//  191                 }
//  192                GPIOINT_Clear(PORTC);
??PORTC_IRQHandler_3:
        MOVS     R0,#+2
          CFI FunCall GPIOINT_Clear
        BL       GPIOINT_Clear
//  193                Enable_IRQ(INT_PORTC);
        MOVS     R0,#+105
          CFI FunCall Enable_IRQ
        BL       Enable_IRQ
//  194                GPIOINT_Enable(VSYNC_PORT,VSYNC_PIN,LEVEL_RISING);
        MOVS     R2,#+9
        MOVS     R1,#+17
        MOVS     R0,#+2
          CFI FunCall GPIOINT_Enable
        BL       GPIOINT_Enable
//  195                EnableInterrupts
        CPSIE i
//  196                     i=0;j=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_12
        STRH     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_26
        STRH     R0,[R1, #+0]
//  197                
//  198 #endif
//  199            }
//  200           i++;
??PORTC_IRQHandler_2:
        LDR.N    R0,??DataTable2_12
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable2_12
        STRH     R0,[R1, #+0]
//  201       }
//  202      if(port_date&0X20000)
??PORTC_IRQHandler_0:
        LSLS     R0,R6,#+14
        BPL.N    ??PORTC_IRQHandler_4
//  203       {
//  204           PORTC_ISFR|=0X20000;
        LDR.N    R0,??DataTable2_11  ;; 0x4004b0a0
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable2_11  ;; 0x4004b0a0
        STR      R0,[R1, #+0]
//  205           start_encode=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_27
        STRB     R0,[R1, #+0]
//  206           image_n++;
        LDR.N    R0,??DataTable2_28
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable2_28
        STRH     R0,[R1, #+0]
//  207           GPIOINT_Disable(VSYNC_PORT,VSYNC_PIN);
        MOVS     R1,#+17
        MOVS     R0,#+2
          CFI FunCall GPIOINT_Disable
        BL       GPIOINT_Disable
//  208           GPIOINT_Enable(HREF_PORT,HREF_PIN,LEVEL_RISING);
        MOVS     R2,#+9
        MOVS     R1,#+15
        MOVS     R0,#+2
          CFI FunCall GPIOINT_Enable
        BL       GPIOINT_Enable
//  209       }
//  210  }
??PORTC_IRQHandler_4:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x0

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function DMA0_DMA16_IRQHandler
        THUMB
//  211 void DMA0_DMA16_IRQHandler(void)
//  212  {
DMA0_DMA16_IRQHandler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  213      DMA_Clear_Int(DMA_CH0);
        MOVS     R0,#+0
          CFI FunCall DMA_Clear_Int
        BL       DMA_Clear_Int
//  214  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PIT0_IRQHandler
        THUMB
//  215 void PIT0_IRQHandler(void)
//  216  {
PIT0_IRQHandler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  217      PITINT_Clear(PIT0);
        MOVS     R0,#+0
          CFI FunCall PITINT_Clear
        BL       PITINT_Clear
//  218      image_n=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_28
        STRH     R0,[R1, #+0]
//  219      n++;
        LDR.N    R0,??DataTable2_29
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable2_29
        STRH     R0,[R1, #+0]
//  220      if(n>=run_time)
        LDR.N    R0,??DataTable2_29
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable2_30
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BCC.N    ??PIT0_IRQHandler_0
//  221       {
//  222           n=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_29
        STRH     R0,[R1, #+0]
//  223          driver=0;
        LDR.N    R0,??DataTable2_31
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  224       }
//  225  }
??PIT0_IRQHandler_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x43fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x400ff0d0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     `date`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x124f8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x8f0d180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0xb71b0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     `?<Constant "PID:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     flag_photo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     mulu

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     start_run

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x4004b0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     i

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     middle_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     middle_output

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     k_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     control_k

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     k_ptemp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     pwm_add

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     0x3fe99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     0x3fb99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_22:
        DC32     count_pwm2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_23:
        DC32     count_pwm1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_24:
        DC32     sub_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_25:
        DC32     speed_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_26:
        DC32     j

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_27:
        DC32     start_encode

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_28:
        DC32     image_n

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_29:
        DC32     n

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_30:
        DC32     run_time

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_31:
        DC32     driver

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PID:">`:
        DATA
        DC8 "PID:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "P="
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "I="
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "D="
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "K="
        DC8 0

        END
//  226 
// 
//    60 bytes in section .bss
//     4 bytes in section .data
//    24 bytes in section .rodata
// 1 434 bytes in section .text
// 
// 1 434 bytes of CODE  memory
//    24 bytes of CONST memory
//    64 bytes of DATA  memory
//
//Errors: none
//Warnings: 12
