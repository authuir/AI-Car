///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:11
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\project.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\project.c" -lA
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\Debug\List\" -o "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\Debug\Obj\" --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M4F -e --fpu=VFPv4_sp --dlib_config
//        "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\" -I "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\my ku\" -I "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\my ku\src\" -I "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\my ku\project\" -On
//    List file    =  
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\Debug\List\project.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN ADCINIT_A
        EXTERN ADC_Enable
        EXTERN ADC_S_A
        EXTERN ADC_VALUE_A
        EXTERN FTM_PWM_Init
        EXTERN FTM_PWM_Set_Duty
        EXTERN GPIO_GET
        EXTERN GPIO_INIT
        EXTERN GPIO_SET
        EXTERN LCD_6x8Str
        EXTERN LCD_6x8char
        EXTERN UART_S1
        EXTERN UART_SS
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN center
        EXTERN center_2
        EXTERN clear_image
        EXTERN `date`
        EXTERN driver
        EXTERN k_p
        EXTERN left_dot
        EXTERN left_line
        EXTERN middle_p
        EXTERN right_dot
        EXTERN right_line
        EXTERN run_time
        EXTERN show_dot
        EXTERN show_dot_change
        EXTERN show_dot_change2
        EXTERN show_image
        EXTERN show_real_pic
        EXTERN speed_p
        EXTERN sub_p
        EXTERN threshold

        PUBLIC BTN_current_init
        PUBLIC BTN_result
        PUBLIC BTN_value
        PUBLIC IR_GET
        PUBLIC IR_INIT
        PUBLIC LED_ON
        PUBLIC OLED_init
        PUBLIC POWER_ERROR_TIMES
        PUBLIC POWER_reslut
        PUBLIC change_par
        PUBLIC count_pwm1
        PUBLIC count_pwm2
        PUBLIC ddd
        PUBLIC dddd
        PUBLIC display
        PUBLIC ecode_clear
        PUBLIC ecode_get
        PUBLIC led_init
        PUBLIC motor_PWM_init
        PUBLIC motor_dutyset
        PUBLIC power_test_init
        PUBLIC power_value
        PUBLIC read_pose
        PUBLIC send_flot
        PUBLIC send_int32
        PUBLIC send_line
        PUBLIC servo_driver_init
        PUBLIC servo_set
        PUBLIC show_all_TFT
        PUBLIC translate_uart
        PUBLIC xg
        PUBLIC xh
        PUBLIC xi
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\project\project.c
//    1 #include "all.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 float count_pwm1,count_pwm2;
count_pwm1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
count_pwm2:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function ecode_get
        THUMB
//    4 void ecode_get(float * get1,float* get2)
//    5  {
ecode_get:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//    6      if(GPIO_GET(PORTC,1)) { *get1=(int16)((uint16)(0-FTM1_CNT));}
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BEQ.N    ??ecode_get_0
        LDR.W    R0,??DataTable15_2  ;; 0x40039004
        LDR      R0,[R0, #+0]
        RSBS     R0,R0,#+0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        VMOV     S0,R0
        VCVT.F32.S32 S0,S0
        VSTR     S0,[R4, #0]
        B.N      ??ecode_get_1
//    7      else  {*get1=(float)((uint16)(0-FTM1_CNT))/-1;}
??ecode_get_0:
        LDR.W    R0,??DataTable15_2  ;; 0x40039004
        LDR      R0,[R0, #+0]
        RSBS     R0,R0,#+0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        VMOV     S0,R0
        VCVT.F32.U32 S0,S0
        VMOV.F32 S1,#-1.0
        VDIV.F32 S0,S0,S1
        VSTR     S0,[R4, #0]
//    8      if(!GPIO_GET(PORTC,4)) {*get2=(int16)((uint16)(0-FTM2_CNT));}
??ecode_get_1:
        MOVS     R1,#+4
        MOVS     R0,#+2
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BNE.N    ??ecode_get_2
        LDR.W    R0,??DataTable15_3  ;; 0x400b8004
        LDR      R0,[R0, #+0]
        RSBS     R0,R0,#+0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        VMOV     S0,R0
        VCVT.F32.S32 S0,S0
        VSTR     S0,[R5, #0]
        B.N      ??ecode_get_3
//    9      else {*get2=(float)((uint16)(0-FTM2_CNT))/-1;}
??ecode_get_2:
        LDR.W    R0,??DataTable15_3  ;; 0x400b8004
        LDR      R0,[R0, #+0]
        RSBS     R0,R0,#+0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        VMOV     S0,R0
        VCVT.F32.U32 S0,S0
        VMOV.F32 S1,#-1.0
        VDIV.F32 S0,S0,S1
        VSTR     S0,[R5, #0]
//   10       ecode_clear();
??ecode_get_3:
          CFI FunCall ecode_clear
        BL       ecode_clear
//   11  }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function ecode_clear
          CFI NoCalls
        THUMB
//   12 void ecode_clear()
//   13  {
//   14      FTM1_CNT=1; FTM2_CNT=1;
ecode_clear:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable15_2  ;; 0x40039004
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable15_3  ;; 0x400b8004
        STR      R0,[R1, #+0]
//   15  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   16 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function OLED_init
        THUMB
//   17 void OLED_init()
//   18  {
OLED_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   19      //LCD_6x8Str(0,0,"*");
//   20      LCD_6x8Str(2,0,"TH_: ");
        LDR.W    R2,??DataTable15_4
        MOVS     R1,#+0
        MOVS     R0,#+2
          CFI FunCall LCD_6x8Str
        BL       LCD_6x8Str
//   21      LCD_6x8Str(2,1,"driver: ");
        LDR.W    R2,??DataTable15_5
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall LCD_6x8Str
        BL       LCD_6x8Str
//   22      LCD_6x8Str(2,2,"middle_p:");
        LDR.W    R2,??DataTable15_6
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall LCD_6x8Str
        BL       LCD_6x8Str
//   23      LCD_6x8Str(2,3,"k_p:");
        LDR.W    R2,??DataTable15_7
        MOVS     R1,#+3
        MOVS     R0,#+2
          CFI FunCall LCD_6x8Str
        BL       LCD_6x8Str
//   24      LCD_6x8Str(2,4,"speed_p:");
        LDR.W    R2,??DataTable15_8
        MOVS     R1,#+4
        MOVS     R0,#+2
          CFI FunCall LCD_6x8Str
        BL       LCD_6x8Str
//   25      LCD_6x8Str(2,5,"sub_p:");
        LDR.W    R2,??DataTable15_9
        MOVS     R1,#+5
        MOVS     R0,#+2
          CFI FunCall LCD_6x8Str
        BL       LCD_6x8Str
//   26       LCD_6x8Str(2,6,"run_time:");
        LDR.W    R2,??DataTable15_10
        MOVS     R1,#+6
        MOVS     R0,#+2
          CFI FunCall LCD_6x8Str
        BL       LCD_6x8Str
//   27      display(13,0,threshold);
        LDR.W    R0,??DataTable15_11
        LDRH     R0,[R0, #+0]
        VMOV     S0,R0
        VCVT.F32.U32 S0,S0
        MOVS     R1,#+0
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
//   28      display(13,1,driver);
        LDR.W    R0,??DataTable15_12
        VLDR     S0,[R0, #0]
        MOVS     R1,#+1
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
//   29      display(13,2,middle_p);
        LDR.W    R0,??DataTable15_13
        VLDR     S0,[R0, #0]
        MOVS     R1,#+2
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
//   30      display(13,3,k_p);
        LDR.W    R0,??DataTable15_14
        VLDR     S0,[R0, #0]
        MOVS     R1,#+3
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
//   31      display(13,4,speed_p);
        LDR.W    R0,??DataTable15_15
        VLDR     S0,[R0, #0]
        MOVS     R1,#+4
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
//   32      display(13,5,sub_p);
        LDR.W    R0,??DataTable15_16
        VLDR     S0,[R0, #0]
        MOVS     R1,#+5
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
//   33      display(13,6,run_time);
        LDR.W    R0,??DataTable15_17
        LDRB     R0,[R0, #+0]
        VMOV     S0,R0
        VCVT.F32.U32 S0,S0
        MOVS     R1,#+6
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
//   34  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//   35 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function IR_INIT
        THUMB
//   36 void IR_INIT()
//   37  {
IR_INIT:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   38      //GPIO_INIT(PORTE,27,INPUT);
//   39      GPIO_INIT(PORTE,28,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+28
        MOVS     R0,#+4
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   40  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function IR_GET
        THUMB
//   41 uint8 IR_GET()
//   42  {
IR_GET:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   43      if((GPIO_GET(PORTE,28)==1))
        MOVS     R1,#+28
        MOVS     R0,#+4
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+1
        BNE.N    ??IR_GET_0
//   44          return 1;
        MOVS     R0,#+1
        B.N      ??IR_GET_1
//   45      else return 0;
??IR_GET_0:
        MOVS     R0,#+0
??IR_GET_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//   46  }
//   47 extern Line center_2;

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function show_all_TFT
        THUMB
//   48 void show_all_TFT(uint8 flag)
//   49  {
show_all_TFT:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//   50      if(flag==1)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??show_all_TFT_0
//   51       {
//   52           show_image(0,0,X_MAX,Y_MAX,date);
        LDR.W    R0,??DataTable15_18
        STR      R0,[SP, #+0]
        MOVS     R3,#+210
        MOVS     R2,#+155
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall show_image
        BL       show_image
//   53           show_dot(left_line,left_dot,RED);
        MOV      R2,#+63488
        LDR.W    R0,??DataTable15_19
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable15_20
          CFI FunCall show_dot
        BL       show_dot
//   54           show_dot(right_line,right_dot,BLUE);
        MOVS     R2,#+31
        LDR.W    R0,??DataTable15_21
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable15_22
          CFI FunCall show_dot
        BL       show_dot
//   55           show_dot(center,dot_num,0);
        MOVS     R2,#+0
        MOVS     R1,#+20
        LDR.W    R0,??DataTable15_23
          CFI FunCall show_dot
        BL       show_dot
//   56       }
//   57      if(flag==2)
??show_all_TFT_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BNE.N    ??show_all_TFT_1
//   58       {
//   59           clear_image();
          CFI FunCall clear_image
        BL       clear_image
//   60           show_dot_change(left_line,left_dot,RED);
        MOV      R2,#+63488
        LDR.W    R0,??DataTable15_19
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable15_20
          CFI FunCall show_dot_change
        BL       show_dot_change
//   61          show_dot_change(right_line,right_dot,BLUE);
        MOVS     R2,#+31
        LDR.W    R0,??DataTable15_21
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable15_22
          CFI FunCall show_dot_change
        BL       show_dot_change
//   62          // show_dot_change2(center,center_dot,0);
//   63          show_dot_change2(center_2.dot,center_2.num,MAGENTA);
        MOVW     R2,#+63519
        LDR.W    R0,??DataTable15_24
        LDRH     R1,[R0, #+2000]
        LDR.W    R0,??DataTable15_24
          CFI FunCall show_dot_change2
        BL       show_dot_change2
//   64       }
//   65      if(flag==3)
??show_all_TFT_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BNE.N    ??show_all_TFT_2
//   66       {
//   67 	show_real_pic(0,0,X_MAX,Y_MAX,date);
        LDR.W    R0,??DataTable15_18
        STR      R0,[SP, #+0]
        MOVS     R3,#+210
        MOVS     R2,#+155
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall show_real_pic
        BL       show_real_pic
//   68 	show_dot(left_line,left_dot,RED);
        MOV      R2,#+63488
        LDR.W    R0,??DataTable15_19
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable15_20
          CFI FunCall show_dot
        BL       show_dot
//   69         show_dot(right_line,right_dot,BLUE);
        MOVS     R2,#+31
        LDR.W    R0,??DataTable15_21
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable15_22
          CFI FunCall show_dot
        BL       show_dot
//   70         //show_dot_change(center,dot_num,0);
//   71       }
//   72      //LCD_ShowNum(220,25,p3,3,16);
//   73      //LCD_ShowNum(220,70,input_error,1,16);
//   74  }
??show_all_TFT_2:
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function display
        THUMB
//   75 void display(uint8 x,uint8 y,float xxx)
//   76  {
display:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        VPUSH    {D8}
          CFI D8 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        VMOV.F32 S16,S0
//   77      int32 num=xxx*100;
        VLDR.W   S0,??DataTable9  ;; 0x42c80000
        VMUL.F32 S0,S16,S0
        VCVT.S32.F32 S0,S0
        VMOV     R6,S0
//   78      if(num<0)
        CMP      R6,#+0
        BPL.N    ??display_0
//   79       {
//   80           LCD_6x8char(x-1,y,'-');
        MOVS     R2,#+45
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R0,R4,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_6x8char
        BL       LCD_6x8char
//   81           num=num*(-1);
        MOVS     R0,#-1
        MULS     R6,R0,R6
        B.N      ??display_1
//   82       }
//   83      else LCD_6x8char(x-1,y,' ');
??display_0:
        MOVS     R2,#+32
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R0,R4,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_6x8char
        BL       LCD_6x8char
//   84      LCD_6x8char(x,y,num/10000+48);
??display_1:
        MOVW     R0,#+10000
        SDIV     R0,R6,R0
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_6x8char
        BL       LCD_6x8char
//   85      LCD_6x8char(x+1,y,num%10000/1000+48);
        MOVW     R0,#+10000
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        MOV      R1,#+1000
        SDIV     R0,R0,R1
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_6x8char
        BL       LCD_6x8char
//   86      LCD_6x8char(x+2,y,num%1000/100+48);
        MOV      R0,#+1000
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_6x8char
        BL       LCD_6x8char
//   87      LCD_6x8char(x+3,y,'.');
        MOVS     R2,#+46
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_6x8char
        BL       LCD_6x8char
//   88      LCD_6x8char(x+4,y,num%100/10+48);
        MOVS     R0,#+100
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        MOVS     R1,#+10
        SDIV     R0,R0,R1
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_6x8char
        BL       LCD_6x8char
//   89      LCD_6x8char(x+5,y,num%10+48);
        MOVS     R0,#+10
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_6x8char
        BL       LCD_6x8char
//   90  }
        VPOP     {D8}
          CFI D8 SameValue
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function led_init
        THUMB
//   91 void led_init()
//   92  {
led_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   93      GPIO_INIT(PORTD,11,OUTPUT);
        MOVS     R2,#+1
        MOVS     R1,#+11
        MOVS     R0,#+3
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   94      GPIO_INIT(PORTD,12,OUTPUT);
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+3
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   95      GPIO_SET(PORTD,11,1);
        MOVS     R2,#+1
        MOVS     R1,#+11
        MOVS     R0,#+3
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   96      GPIO_SET(PORTD,12,1);
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+3
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   97  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function LED_ON
        THUMB
//   98 void LED_ON(uint8 led_num,uint8 date)
//   99  {
LED_ON:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  100      GPIO_SET(PORTD,led_num,date);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,R5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        MOVS     R0,#+3
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  101  }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function motor_PWM_init
        THUMB
//  102 void motor_PWM_init()
//  103  {
motor_PWM_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  104      FTM_PWM_Init(EPWM_MODE, FTM3_CH4_PTC8, 100, 0);
        VLDR.W   S0,??DataTable11  ;; 0x0
        MOVS     R2,#+100
        MOVW     R1,#+13342
        MOVS     R0,#+1
          CFI FunCall FTM_PWM_Init
        BL       FTM_PWM_Init
//  105      FTM_PWM_Init(EPWM_MODE, FTM3_CH5_PTC9, 100, 0);
        VLDR.W   S0,??DataTable11  ;; 0x0
        MOVS     R2,#+100
        MOVW     R1,#+13599
        MOVS     R0,#+1
          CFI FunCall FTM_PWM_Init
        BL       FTM_PWM_Init
//  106      FTM_PWM_Init(EPWM_MODE, FTM3_CH6_PTC10, 100, 0);
        VLDR.W   S0,??DataTable11  ;; 0x0
        MOVS     R2,#+100
        MOVW     R1,#+13856
        MOVS     R0,#+1
          CFI FunCall FTM_PWM_Init
        BL       FTM_PWM_Init
//  107      FTM_PWM_Init(EPWM_MODE, FTM3_CH7_PTC11, 100, 0);
        VLDR.W   S0,??DataTable11  ;; 0x0
        MOVS     R2,#+100
        MOVW     R1,#+14113
        MOVS     R0,#+1
          CFI FunCall FTM_PWM_Init
        BL       FTM_PWM_Init
//  108  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function motor_dutyset
        THUMB
//  109 void motor_dutyset(float pwm1_duty,float pwm2_duty,float pwm3_duty,float pwm4_duty)
//  110  {
motor_dutyset:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        VPUSH    {D8-D9}
          CFI D9 Frame(CFA, -16)
          CFI D8 Frame(CFA, -24)
          CFI CFA R13+24
        VMOV.F32 S19,S0
        VMOV.F32 S16,S1
        VMOV.F32 S17,S2
        VMOV.F32 S18,S3
//  111       FTM_PWM_Set_Duty(FTM3,FTM_CH4,pwm1_duty/100);
        VLDR.W   S0,??DataTable9  ;; 0x42c80000
        VDIV.F32 S0,S19,S0
        MOVS     R1,#+4
        MOVS     R0,#+3
          CFI FunCall FTM_PWM_Set_Duty
        BL       FTM_PWM_Set_Duty
//  112       FTM_PWM_Set_Duty(FTM3,FTM_CH5,pwm2_duty/100);
        VLDR.W   S0,??DataTable9  ;; 0x42c80000
        VDIV.F32 S0,S16,S0
        MOVS     R1,#+5
        MOVS     R0,#+3
          CFI FunCall FTM_PWM_Set_Duty
        BL       FTM_PWM_Set_Duty
//  113       FTM_PWM_Set_Duty(FTM3,FTM_CH6,pwm4_duty/100);
        VLDR.W   S0,??DataTable9  ;; 0x42c80000
        VDIV.F32 S0,S18,S0
        MOVS     R1,#+6
        MOVS     R0,#+3
          CFI FunCall FTM_PWM_Set_Duty
        BL       FTM_PWM_Set_Duty
//  114       FTM_PWM_Set_Duty(FTM3,FTM_CH7,pwm3_duty/100);
        VLDR.W   S0,??DataTable9  ;; 0x42c80000
        VDIV.F32 S0,S17,S0
        MOVS     R1,#+7
        MOVS     R0,#+3
          CFI FunCall FTM_PWM_Set_Duty
        BL       FTM_PWM_Set_Duty
//  115  }
        VPOP     {D8-D9}
          CFI D8 SameValue
          CFI D9 SameValue
          CFI CFA R13+8
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock10
//  116 //×îµÍ6%£¬×î¸ß8.5%

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function servo_driver_init
        THUMB
//  117 void servo_driver_init()
//  118  {
servo_driver_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  119      FTM_PWM_Init(EPWM_MODE, FTM0_CH2_PTA5, 50, 0.073);
        VLDR.W   S0,??DataTable12  ;; 0x3d958106
        MOVS     R2,#+50
        MOV      R1,#+516
        MOVS     R0,#+1
          CFI FunCall FTM_PWM_Init
        BL       FTM_PWM_Init
//  120  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function servo_set
        THUMB
//  121 void servo_set(float duty)
//  122  {
servo_set:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        VPUSH    {D8}
          CFI D8 Frame(CFA, -16)
          CFI CFA R13+16
        VMOV.F32 S16,S0
//  123      duty=(duty-500)*(8.5-6)/1000+7.3;
        VLDR.W   S0,??DataTable12_1  ;; 0xc3fa0000
        VADD.F32 S0,S16,S0
        VMOV     R0,S0
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable15_25  ;; 0x40040000
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable15_26  ;; 0x408f4000
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
        MOVS     R2,#+858993459
        LDR.W    R3,??DataTable15_27  ;; 0x401d3333
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2f
        BL       __aeabi_d2f
        VMOV     S16,R0
//  124      if(duty<6) duty=6;
        VMOV.F32 S0,#6.0
        VCMP.F32 S16,S0
        FMSTAT   
        BPL.N    ??servo_set_0
        VMOV.F32 S0,#6.0
        VMOV.F32 S16,S0
//  125      if(duty>8.5) duty=8.5;
??servo_set_0:
        VLDR.W   S0,??DataTable13  ;; 0x41080001
        VCMP.F32 S16,S0
        FMSTAT   
        BLT.N    ??servo_set_1
        VMOV.F32 S0,#8.5
        VMOV.F32 S16,S0
//  126      FTM_PWM_Set_Duty(FTM0, FTM_CH2,(duty)/100);
??servo_set_1:
        VLDR.W   S0,??DataTable9  ;; 0x42c80000
        VDIV.F32 S0,S16,S0
        MOVS     R1,#+2
        MOVS     R0,#+0
          CFI FunCall FTM_PWM_Set_Duty
        BL       FTM_PWM_Set_Duty
//  127  }
        VPOP     {D8}
          CFI D8 SameValue
          CFI CFA R13+8
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function translate_uart
        THUMB
//  128 void translate_uart(short acc)
//  129  {
translate_uart:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  130      if(acc<0)
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BPL.N    ??translate_uart_0
//  131       {
//  132           UART_S1(UART0,'-');
        MOVS     R1,#+45
        MOVS     R0,#+0
          CFI FunCall UART_S1
        BL       UART_S1
//  133           acc=acc*(-1);
        MOVS     R0,#-1
        SMULBB   R4,R4,R0
//  134       }
//  135      UART_S1(UART0,(uint8)(acc/10000)+48);
??translate_uart_0:
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVW     R0,#+10000
        SDIV     R0,R4,R0
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall UART_S1
        BL       UART_S1
//  136      UART_S1(UART0,(uint8)(acc%10000/1000)+48);
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVW     R0,#+10000
        SDIV     R1,R4,R0
        MLS      R0,R0,R1,R4
        MOV      R1,#+1000
        SDIV     R0,R0,R1
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall UART_S1
        BL       UART_S1
//  137      UART_S1(UART0,(uint8)(acc%1000/100)+48);
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOV      R0,#+1000
        SDIV     R1,R4,R0
        MLS      R0,R0,R1,R4
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall UART_S1
        BL       UART_S1
//  138      UART_S1(UART0,'.');
        MOVS     R1,#+46
        MOVS     R0,#+0
          CFI FunCall UART_S1
        BL       UART_S1
//  139      UART_S1(UART0,(uint8)(acc%100/10)+48);
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R0,#+100
        SDIV     R1,R4,R0
        MLS      R0,R0,R1,R4
        MOVS     R1,#+10
        SDIV     R0,R0,R1
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall UART_S1
        BL       UART_S1
//  140      UART_S1(UART0,(uint8)(acc%10)+48);
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R0,#+10
        SDIV     R1,R4,R0
        MLS      R0,R0,R1,R4
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall UART_S1
        BL       UART_S1
//  141      UART_S1(UART0,' ');
        MOVS     R1,#+32
        MOVS     R0,#+0
          CFI FunCall UART_S1
        BL       UART_S1
//  142  }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock13
//  143 union 
//  144  {
//  145      uint8 a[4];
//  146      float val;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  147  }xg;
xg:
        DS8 4
//  148 union
//  149  {
//  150      uint8 a[4];
//  151      uint32 val;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  152  }xi;
xi:
        DS8 4
//  153 union 
//  154  {
//  155      uint8 a[4];
//  156      int32 val;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  157  }xh;
xh:
        DS8 4
//  158 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function send_flot
        THUMB
//  159 void send_flot(uint32 UART_NUM,float val)
//  160  {
send_flot:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        VPUSH    {D8}
          CFI D8 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        VMOV.F32 S16,S0
//  161      xg.val=val;
        LDR.W    R0,??DataTable15_28
        VSTR     S16,[R0, #0]
//  162      UART_SS(UART_NUM,"flot");
        LDR.W    R1,??DataTable15_29
        MOVS     R0,R4
          CFI FunCall UART_SS
        BL       UART_SS
//  163      UART_S1(UART_NUM,xg.a[3]);
        LDR.W    R0,??DataTable15_28
        LDRB     R1,[R0, #+3]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  164      UART_S1(UART_NUM,xg.a[2]);
        LDR.W    R0,??DataTable15_28
        LDRB     R1,[R0, #+2]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  165      UART_S1(UART_NUM,xg.a[1]);
        LDR.W    R0,??DataTable15_28
        LDRB     R1,[R0, #+1]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  166      UART_S1(UART_NUM,xg.a[0]);
        LDR.W    R0,??DataTable15_28
        LDRB     R1,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  167  }
        VPOP     {D8}
          CFI D8 SameValue
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function send_int32
        THUMB
//  168 void send_int32(uint32 UART_NUM,int val)
//  169  {
send_int32:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  170      xh.val=val;
        LDR.N    R0,??DataTable15_30
        STR      R5,[R0, #+0]
//  171      UART_SS(UART_NUM,"in32");
        LDR.N    R1,??DataTable15_31
        MOVS     R0,R4
          CFI FunCall UART_SS
        BL       UART_SS
//  172      UART_S1(UART_NUM,xh.a[3]);
        LDR.N    R0,??DataTable15_30
        LDRB     R1,[R0, #+3]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  173      UART_S1(UART_NUM,xh.a[2]);
        LDR.N    R0,??DataTable15_30
        LDRB     R1,[R0, #+2]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  174      UART_S1(UART_NUM,xh.a[1]);
        LDR.N    R0,??DataTable15_30
        LDRB     R1,[R0, #+1]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  175      UART_S1(UART_NUM,xh.a[0]);
        LDR.N    R0,??DataTable15_30
        LDRB     R1,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  176  }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock15

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function send_line
        THUMB
//  177 void send_line(uint32 UART_NUM,char line_num,float val)
//  178  {
send_line:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        VPUSH    {D8}
          CFI D8 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        VMOV.F32 S16,S0
//  179      xg.val=val;
        LDR.N    R0,??DataTable15_28
        VSTR     S16,[R0, #0]
//  180      UART_SS(UART_NUM,"lin");
        ADR.N    R1,??DataTable15  ;; "lin"
        MOVS     R0,R4
          CFI FunCall UART_SS
        BL       UART_SS
//  181      UART_S1(UART_NUM,line_num+48);
        ADDS     R1,R5,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  182      UART_S1(UART_NUM,xg.a[3]);
        LDR.N    R0,??DataTable15_28
        LDRB     R1,[R0, #+3]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  183      UART_S1(UART_NUM,xg.a[2]);
        LDR.N    R0,??DataTable15_28
        LDRB     R1,[R0, #+2]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  184      UART_S1(UART_NUM,xg.a[1]);
        LDR.N    R0,??DataTable15_28
        LDRB     R1,[R0, #+1]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  185      UART_S1(UART_NUM,xg.a[0]);
        LDR.N    R0,??DataTable15_28
        LDRB     R1,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
//  186  }
        VPOP     {D8}
          CFI D8 SameValue
          CFI CFA R13+16
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x0

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function read_pose
        THUMB
//  187 void read_pose(uint32 UART_NUM,char* data)
//  188  {
read_pose:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        VPUSH    {D8}
          CFI D8 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  189      float driver_get;
//  190      if((data[0]==8)&&(data[1]==0)&&(data[2]==2)&&(data[3]==3))
        LDRB     R0,[R5, #+0]
        CMP      R0,#+8
        BNE.N    ??read_pose_0
        LDRB     R0,[R5, #+1]
        CMP      R0,#+0
        BNE.N    ??read_pose_0
        LDRB     R0,[R5, #+2]
        CMP      R0,#+2
        BNE.N    ??read_pose_0
        LDRB     R0,[R5, #+3]
        CMP      R0,#+3
        BNE.N    ??read_pose_0
//  191      {
//  192           xg.a[0]=data[7];
        LDRB     R0,[R5, #+7]
        LDR.N    R1,??DataTable15_28
        STRB     R0,[R1, #+0]
//  193           xg.a[1]=data[6];
        LDRB     R0,[R5, #+6]
        LDR.N    R1,??DataTable15_28
        STRB     R0,[R1, #+1]
//  194           xg.a[2]=data[5];
        LDRB     R0,[R5, #+5]
        LDR.N    R1,??DataTable15_28
        STRB     R0,[R1, #+2]
//  195           xg.a[3]=data[4];
        LDRB     R0,[R5, #+4]
        LDR.N    R1,??DataTable15_28
        STRB     R0,[R1, #+3]
//  196           driver_get=(float)xg.val;
        LDR.N    R0,??DataTable15_28
        VLDR     S0,[R0, #0]
        VMOV.F32 S16,S0
//  197           servo_set(driver_get);
        VMOV.F32 S0,S16
          CFI FunCall servo_set
        BL       servo_set
//  198       }
//  199      if((data[0]==8)&&(data[1]==1)&&(data[2]==2)&&(data[3]==3))
??read_pose_0:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+8
        BNE.N    ??read_pose_1
        LDRB     R0,[R5, #+1]
        CMP      R0,#+1
        BNE.N    ??read_pose_1
        LDRB     R0,[R5, #+2]
        CMP      R0,#+2
        BNE.N    ??read_pose_1
        LDRB     R0,[R5, #+3]
        CMP      R0,#+3
        BNE.N    ??read_pose_1
//  200       {
//  201           xg.a[0]=data[7];
        LDRB     R0,[R5, #+7]
        LDR.N    R1,??DataTable15_28
        STRB     R0,[R1, #+0]
//  202           xg.a[1]=data[6];
        LDRB     R0,[R5, #+6]
        LDR.N    R1,??DataTable15_28
        STRB     R0,[R1, #+1]
//  203           xg.a[2]=data[5];
        LDRB     R0,[R5, #+5]
        LDR.N    R1,??DataTable15_28
        STRB     R0,[R1, #+2]
//  204           xg.a[3]=data[4];
        LDRB     R0,[R5, #+4]
        LDR.N    R1,??DataTable15_28
        STRB     R0,[R1, #+3]
//  205           driver_get=(float)xg.val;
        LDR.N    R0,??DataTable15_28
        VLDR     S0,[R0, #0]
        VMOV.F32 S16,S0
//  206           motor_dutyset(0,driver_get,0,driver_get);
        VMOV.F32 S3,S16
        VLDR.W   S2,??DataTable15_1  ;; 0x0
        VMOV.F32 S1,S16
        VLDR.W   S0,??DataTable15_1  ;; 0x0
          CFI FunCall motor_dutyset
        BL       motor_dutyset
//  207       }
//  208  }
??read_pose_1:
        VPOP     {D8}
          CFI D8 SameValue
          CFI CFA R13+16
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x3d958106

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0xc3fa0000

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function change_par
          CFI NoCalls
        THUMB
//  209 void change_par(char* data,float *date)
//  210  {
//  211       if((data[0]==8)&&(data[1]==2)&&(data[2]==2)&&(data[3]==3))
change_par:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+8
        BNE.N    ??change_par_0
        LDRB     R2,[R0, #+1]
        CMP      R2,#+2
        BNE.N    ??change_par_0
        LDRB     R2,[R0, #+2]
        CMP      R2,#+2
        BNE.N    ??change_par_0
        LDRB     R2,[R0, #+3]
        CMP      R2,#+3
        BNE.N    ??change_par_0
//  212       {
//  213           xg.a[0]=data[7];
        LDRB     R2,[R0, #+7]
        LDR.N    R3,??DataTable15_28
        STRB     R2,[R3, #+0]
//  214           xg.a[1]=data[6];
        LDRB     R2,[R0, #+6]
        LDR.N    R3,??DataTable15_28
        STRB     R2,[R3, #+1]
//  215           xg.a[2]=data[5];
        LDRB     R2,[R0, #+5]
        LDR.N    R3,??DataTable15_28
        STRB     R2,[R3, #+2]
//  216           xg.a[3]=data[4];
        LDRB     R2,[R0, #+4]
        LDR.N    R3,??DataTable15_28
        STRB     R2,[R3, #+3]
//  217           *date=(float)xg.val;
        LDR.N    R2,??DataTable15_28
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
//  218       }
//  219      if((data[0]==8)&&(data[1]==3)&&(data[2]==2)&&(data[3]==3))
??change_par_0:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+8
        BNE.N    ??change_par_1
        LDRB     R2,[R0, #+1]
        CMP      R2,#+3
        BNE.N    ??change_par_1
        LDRB     R2,[R0, #+2]
        CMP      R2,#+2
        BNE.N    ??change_par_1
        LDRB     R2,[R0, #+3]
        CMP      R2,#+3
        BNE.N    ??change_par_1
//  220       {
//  221           xg.a[0]=data[7];
        LDRB     R2,[R0, #+7]
        LDR.N    R3,??DataTable15_28
        STRB     R2,[R3, #+0]
//  222           xg.a[1]=data[6];
        LDRB     R2,[R0, #+6]
        LDR.N    R3,??DataTable15_28
        STRB     R2,[R3, #+1]
//  223           xg.a[2]=data[5];
        LDRB     R2,[R0, #+5]
        LDR.N    R3,??DataTable15_28
        STRB     R2,[R3, #+2]
//  224           xg.a[3]=data[4];
        LDRB     R2,[R0, #+4]
        LDR.N    R3,??DataTable15_28
        STRB     R2,[R3, #+3]
//  225           *date=(float)xg.val;
        LDR.N    R2,??DataTable15_28
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
//  226       }
//  227      if((data[0]==8)&&(data[1]==4)&&(data[2]==2)&&(data[3]==3))
??change_par_1:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+8
        BNE.N    ??change_par_2
        LDRB     R2,[R0, #+1]
        CMP      R2,#+4
        BNE.N    ??change_par_2
        LDRB     R2,[R0, #+2]
        CMP      R2,#+2
        BNE.N    ??change_par_2
        LDRB     R2,[R0, #+3]
        CMP      R2,#+3
        BNE.N    ??change_par_2
//  228       {
//  229           xg.a[0]=data[7];
        LDRB     R2,[R0, #+7]
        LDR.N    R3,??DataTable15_28
        STRB     R2,[R3, #+0]
//  230           xg.a[1]=data[6];
        LDRB     R2,[R0, #+6]
        LDR.N    R3,??DataTable15_28
        STRB     R2,[R3, #+1]
//  231           xg.a[2]=data[5];
        LDRB     R2,[R0, #+5]
        LDR.N    R3,??DataTable15_28
        STRB     R2,[R3, #+2]
//  232           xg.a[3]=data[4];
        LDRB     R2,[R0, #+4]
        LDR.N    R3,??DataTable15_28
        STRB     R2,[R3, #+3]
//  233           *date=(float)xg.val;
        LDR.N    R2,??DataTable15_28
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
//  234       }
//  235  }
??change_par_2:
        BX       LR               ;; return
          CFI EndBlock cfiBlock18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x41080001

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function power_test_init
        THUMB
//  236 void power_test_init()
//  237  {
power_test_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  238     ADC_Enable(ADC0);
        MOVS     R0,#+0
          CFI FunCall ADC_Enable
        BL       ADC_Enable
//  239     ADCINIT_A(ADC0,channal_b,DADP1,bite_12);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall ADCINIT_A
        BL       ADCINIT_A
//  240  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock19

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  241 uint32 POWER_reslut,POWER_ERROR_TIMES=0; 
POWER_reslut:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
POWER_ERROR_TIMES:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function power_value
        THUMB
//  242 uint8 power_value()
//  243  {
power_value:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  244     uint16 value=0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
//  245      while(!ADC_S_A(ADC0));
??power_value_0:
        MOVS     R0,#+0
          CFI FunCall ADC_S_A
        BL       ADC_S_A
        CMP      R0,#+0
        BEQ.N    ??power_value_0
//  246       ADC_VALUE_A(ADC0,&value);
        ADD      R1,SP,#+0
        MOVS     R0,#+0
          CFI FunCall ADC_VALUE_A
        BL       ADC_VALUE_A
//  247       POWER_reslut=((uint32)(value)*3300*133/33/4096);
        LDRH     R0,[SP, #+0]
        LDR.N    R1,??DataTable15_32  ;; 0x6b274
        MULS     R0,R1,R0
        MOVS     R1,#+33
        UDIV     R0,R0,R1
        LSRS     R0,R0,#+12
        LDR.N    R1,??DataTable15_33
        STR      R0,[R1, #+0]
//  248       if(POWER_reslut<7500) 
        LDR.N    R0,??DataTable15_33
        LDR      R0,[R0, #+0]
        MOVW     R1,#+7500
        CMP      R0,R1
        BCS.N    ??power_value_1
//  249        {
//  250            POWER_ERROR_TIMES++;
        LDR.N    R0,??DataTable15_34
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable15_34
        STR      R0,[R1, #+0]
//  251            if(POWER_ERROR_TIMES>10)
        LDR.N    R0,??DataTable15_34
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BCC.N    ??power_value_2
//  252                return 0;
        MOVS     R0,#+0
        B.N      ??power_value_3
//  253        }
//  254       else 
//  255        {
//  256            POWER_ERROR_TIMES=0;
//  257            return 1;
//  258        }
//  259  }
??power_value_2:
        B.N      ??power_value_3
??power_value_1:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_34
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
??power_value_3:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock20
//  260 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function BTN_current_init
        THUMB
//  261 void BTN_current_init()
//  262  {
BTN_current_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  263     ADC_Enable(ADC1);
        MOVS     R0,#+128
          CFI FunCall ADC_Enable
        BL       ADC_Enable
//  264     ADCINIT_A(ADC1,channal_b,DADP1,bite_12);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+128
          CFI FunCall ADCINIT_A
        BL       ADCINIT_A
//  265  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock21

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  266 uint32 BTN_result=0;
BTN_result:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  267 uint32 dddd[100]={0};uint16 ddd=0;
dddd:
        DS8 400

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
ddd:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function BTN_value
        THUMB
//  268 void BTN_value()
//  269  {
BTN_value:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  270      uint16 value=0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
//  271      while(!ADC_S_A(ADC1));
??BTN_value_0:
        MOVS     R0,#+128
          CFI FunCall ADC_S_A
        BL       ADC_S_A
        CMP      R0,#+0
        BEQ.N    ??BTN_value_0
//  272       ADC_VALUE_A(ADC1,&value);
        ADD      R1,SP,#+0
        MOVS     R0,#+128
          CFI FunCall ADC_VALUE_A
        BL       ADC_VALUE_A
//  273       BTN_result=((uint32)(value)*3300/4096);
        LDRH     R0,[SP, #+0]
        MOVW     R1,#+3300
        MULS     R0,R1,R0
        LSRS     R0,R0,#+12
        LDR.N    R1,??DataTable15_35
        STR      R0,[R1, #+0]
//  274       if(BTN_result>100)
        LDR.N    R0,??DataTable15_35
        LDR      R0,[R0, #+0]
        CMP      R0,#+101
        BCC.N    ??BTN_value_1
//  275        {
//  276       dddd[ddd++]=BTN_result;
        LDR.N    R0,??DataTable15_35
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable15_36
        LDRH     R1,[R1, #+0]
        LDR.N    R2,??DataTable15_37
        STR      R0,[R2, R1, LSL #+2]
        LDR.N    R0,??DataTable15_36
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable15_36
        STRH     R0,[R1, #+0]
//  277       if(ddd==100 ) ddd=0;
        LDR.N    R0,??DataTable15_36
        LDRH     R0,[R0, #+0]
        CMP      R0,#+100
        BNE.N    ??BTN_value_1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_36
        STRH     R0,[R1, #+0]
//  278        }
//  279  }
??BTN_value_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock22

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC8      "lin"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_2:
        DC32     0x40039004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_3:
        DC32     0x400b8004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_4:
        DC32     `?<Constant "TH_: ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_5:
        DC32     `?<Constant "driver: ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_6:
        DC32     `?<Constant "middle_p:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_7:
        DC32     `?<Constant "k_p:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_8:
        DC32     `?<Constant "speed_p:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_9:
        DC32     `?<Constant "sub_p:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_10:
        DC32     `?<Constant "run_time:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_11:
        DC32     threshold

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_12:
        DC32     driver

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_13:
        DC32     middle_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_14:
        DC32     k_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_15:
        DC32     speed_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_16:
        DC32     sub_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_17:
        DC32     run_time

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_18:
        DC32     `date`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_19:
        DC32     left_dot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_20:
        DC32     left_line

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_21:
        DC32     right_dot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_22:
        DC32     right_line

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_23:
        DC32     center

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_24:
        DC32     center_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_25:
        DC32     0x40040000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_26:
        DC32     0x408f4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_27:
        DC32     0x401d3333

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_28:
        DC32     xg

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_29:
        DC32     `?<Constant "flot">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_30:
        DC32     xh

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_31:
        DC32     `?<Constant "in32">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_32:
        DC32     0x6b274

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_33:
        DC32     POWER_reslut

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_34:
        DC32     POWER_ERROR_TIMES

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_35:
        DC32     BTN_result

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_36:
        DC32     ddd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_37:
        DC32     dddd

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TH_: ">`:
        DATA
        DC8 "TH_: "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "driver: ">`:
        DATA
        DC8 "driver: "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "middle_p:">`:
        DATA
        DC8 "middle_p:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "k_p:">`:
        DATA
        DC8 "k_p:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "speed_p:">`:
        DATA
        DC8 "speed_p:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "sub_p:">`:
        DATA
        DC8 "sub_p:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "run_time:">`:
        DATA
        DC8 "run_time:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "flot">`:
        DATA
        DC8 "flot"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "in32">`:
        DATA
        DC8 "in32"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "lin"

        END
//  280 //********************************************************************************************
// 
//   434 bytes in section .bss
//    92 bytes in section .rodata
// 2 378 bytes in section .text
// 
// 2 378 bytes of CODE  memory
//    92 bytes of CONST memory
//   434 bytes of DATA  memory
//
//Errors: none
//Warnings: 8
