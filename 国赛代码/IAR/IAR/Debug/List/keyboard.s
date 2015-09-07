///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:08
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\keyboard.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\keyboard.c" -lA
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
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\Debug\List\keyboard.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN GPIOPULL_SET
        EXTERN GPIO_GET
        EXTERN GPIO_INIT
        EXTERN LCD_6x8Str
        EXTERN LCD_clear
        EXTERN OLED_init
        EXTERN PIT_Enable
        EXTERN SYSDelay_ms
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_f2d
        EXTERN display
        EXTERN driver
        EXTERN k_p
        EXTERN middle_p
        EXTERN speed_p
        EXTERN sub_p
        EXTERN threshold
        EXTERN threshold_left_next
        EXTERN threshold_right_next

        PUBLIC Key_get
        PUBLIC Key_init
        PUBLIC Switch_get
        PUBLIC Switch_init
        PUBLIC key_run
        PUBLIC mulu
        PUBLIC run_time
        PUBLIC start_run
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\project\keyboard.c
//    1 #include "all.h"
//    2 #include "keyboard.h"

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function Key_init
        THUMB
//    3 void Key_init()
//    4  {
Key_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//    5      GPIO_INIT(PORTA,24,0);
        MOVS     R2,#+0
        MOVS     R1,#+24
        MOVS     R0,#+0
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//    6      GPIO_INIT(PORTA,25,0);
        MOVS     R2,#+0
        MOVS     R1,#+25
        MOVS     R0,#+0
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//    7      GPIO_INIT(PORTA,26,0);
        MOVS     R2,#+0
        MOVS     R1,#+26
        MOVS     R0,#+0
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//    8      GPIO_INIT(PORTA,27,0);
        MOVS     R2,#+0
        MOVS     R1,#+27
        MOVS     R0,#+0
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//    9      GPIOPULL_SET(PORTA,24,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+24
        MOVS     R0,#+0
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   10      GPIOPULL_SET(PORTA,25,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+25
        MOVS     R0,#+0
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   11      GPIOPULL_SET(PORTA,26,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+26
        MOVS     R0,#+0
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   12      GPIOPULL_SET(PORTA,27,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+27
        MOVS     R0,#+0
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   13  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   14 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function Key_get
        THUMB
//   15 uint8  Key_get()
//   16  {
Key_get:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   17      uint8 key_num=0;
        MOVS     R4,#+0
//   18      if(!GPIO_GET(PORTA,24))
        MOVS     R1,#+24
        MOVS     R0,#+0
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BNE.N    ??Key_get_0
//   19       {
//   20           SYSDelay_ms(5);
        MOVS     R0,#+5
          CFI FunCall SYSDelay_ms
        BL       SYSDelay_ms
//   21           if(!GPIO_GET(PORTA,24))
        MOVS     R1,#+24
        MOVS     R0,#+0
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BNE.N    ??Key_get_0
//   22            {
//   23                while(!GPIO_GET(PORTA,24));
??Key_get_1:
        MOVS     R1,#+24
        MOVS     R0,#+0
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BEQ.N    ??Key_get_1
//   24                key_num=Key0;
        MOVS     R0,#+100
        MOVS     R4,R0
//   25            }
//   26       }
//   27      if(!GPIO_GET(PORTA,25))
??Key_get_0:
        MOVS     R1,#+25
        MOVS     R0,#+0
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BNE.N    ??Key_get_2
//   28       {
//   29           SYSDelay_ms(5);
        MOVS     R0,#+5
          CFI FunCall SYSDelay_ms
        BL       SYSDelay_ms
//   30           if(!GPIO_GET(PORTA,25))
        MOVS     R1,#+25
        MOVS     R0,#+0
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BNE.N    ??Key_get_2
//   31            {
//   32                while(!GPIO_GET(PORTA,25));
??Key_get_3:
        MOVS     R1,#+25
        MOVS     R0,#+0
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BEQ.N    ??Key_get_3
//   33                key_num=Key1;
        MOVS     R0,#+101
        MOVS     R4,R0
//   34            }
//   35       }
//   36      if(!GPIO_GET(PORTA,26))
??Key_get_2:
        MOVS     R1,#+26
        MOVS     R0,#+0
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BNE.N    ??Key_get_4
//   37       {
//   38           SYSDelay_ms(5);
        MOVS     R0,#+5
          CFI FunCall SYSDelay_ms
        BL       SYSDelay_ms
//   39           if(!GPIO_GET(PORTA,26))
        MOVS     R1,#+26
        MOVS     R0,#+0
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BNE.N    ??Key_get_4
//   40            {
//   41                while(!GPIO_GET(PORTA,26));
??Key_get_5:
        MOVS     R1,#+26
        MOVS     R0,#+0
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BEQ.N    ??Key_get_5
//   42                key_num=Key2;
        MOVS     R0,#+102
        MOVS     R4,R0
//   43            }
//   44       }
//   45      if(!GPIO_GET(PORTA,27))
??Key_get_4:
        MOVS     R1,#+27
        MOVS     R0,#+0
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BNE.N    ??Key_get_6
//   46       {
//   47           SYSDelay_ms(5);
        MOVS     R0,#+5
          CFI FunCall SYSDelay_ms
        BL       SYSDelay_ms
//   48           if(!GPIO_GET(PORTA,27))
        MOVS     R1,#+27
        MOVS     R0,#+0
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BNE.N    ??Key_get_6
//   49            {
//   50                while(!GPIO_GET(PORTA,27));
??Key_get_7:
        MOVS     R1,#+27
        MOVS     R0,#+0
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+0
        BEQ.N    ??Key_get_7
//   51                key_num=Key3;
        MOVS     R0,#+103
        MOVS     R4,R0
//   52            }
//   53       }
//   54      return key_num;
??Key_get_6:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//   55  }
//   56 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   57 uint8  start_run=0,mulu=0,run_time=10; 
start_run:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
mulu:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
run_time:
        DATA
        DC8 10
//   58 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function key_run
        THUMB
//   59 void key_run(uint8 key_num)
//   60  {
key_run:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   61      if(key_num==Key0)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+100
        BNE.N    ??key_run_0
//   62       {
//   63           mulu++;
        LDR.N    R0,??DataTable0_2
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable0_2
        STRB     R0,[R1, #+0]
//   64           
//   65           if(mulu>=8)
        LDR.N    R0,??DataTable0_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+8
        BLT.N    ??key_run_1
//   66            {
//   67                mulu=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable0_2
        STRB     R0,[R1, #+0]
//   68                LCD_6x8Str(0,8," ");
        ADR.N    R2,??key_run_2   ;; " "
        MOVS     R1,#+8
        MOVS     R0,#+0
          CFI FunCall LCD_6x8Str
        BL       LCD_6x8Str
//   69                LCD_6x8Str(0,0,"*");
        ADR.N    R2,??key_run_2+0x4  ;; "*"
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall LCD_6x8Str
        BL       LCD_6x8Str
//   70            }
//   71           if(mulu!=0) 
??key_run_1:
        LDR.N    R0,??DataTable0_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??key_run_3
//   72            {
//   73                LCD_clear();
          CFI FunCall LCD_clear
        BL       LCD_clear
//   74                OLED_init();
          CFI FunCall OLED_init
        BL       OLED_init
//   75            }
//   76           if(mulu>=1)
??key_run_3:
        LDR.N    R0,??DataTable0_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??key_run_4
//   77            {
//   78                LCD_6x8Str(0,mulu-1," ");
        ADR.N    R2,??key_run_2   ;; " "
        LDR.N    R0,??DataTable0_2
        LDRB     R0,[R0, #+0]
        SUBS     R1,R0,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall LCD_6x8Str
        BL       LCD_6x8Str
//   79                LCD_6x8Str(0,mulu,"*");
        ADR.N    R2,??key_run_2+0x4  ;; "*"
        LDR.N    R0,??DataTable0_2
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall LCD_6x8Str
        BL       LCD_6x8Str
        B.N      ??key_run_4
//   80            }
//   81           
//   82       }
//   83      else if(key_num==Key1)
??key_run_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+101
        BNE.W    ??key_run_5
//   84       {
//   85           switch(mulu)
        LDR.N    R0,??DataTable0_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??key_run_6
        CMP      R0,#+2
        BEQ.N    ??key_run_7
        BCC.N    ??key_run_8
        CMP      R0,#+4
        BEQ.N    ??key_run_9
        BCC.N    ??key_run_10
        CMP      R0,#+6
        BEQ.N    ??key_run_11
        BCC.N    ??key_run_12
        B.N      ??key_run_4
//   86            {
//   87            case 0:threshold_left_next++;threshold_right_next++;display(13,0,threshold);break;
??key_run_6:
        LDR.N    R0,??DataTable0_3
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable0_3
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable0_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable0_4
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable0_5
        LDRH     R0,[R0, #+0]
        VMOV     S0,R0
        VCVT.F32.U32 S0,S0
        MOVS     R1,#+0
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//   88            case 1:driver+=50;display(13,1,driver);break;
??key_run_8:
        LDR.N    R0,??DataTable0_6
        VLDR     S0,[R0, #0]
        VLDR.W   S1,??DataTable0  ;; 0x42480000
        VADD.F32 S0,S0,S1
        LDR.N    R0,??DataTable0_6
        VSTR     S0,[R0, #0]
        LDR.N    R0,??DataTable0_6
        VLDR     S0,[R0, #0]
        MOVS     R1,#+1
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//   89            case 2:middle_p++;display(13,2,middle_p);break;
??key_run_7:
        LDR.N    R0,??DataTable0_7
        VLDR     S0,[R0, #0]
        VMOV.F32 S1,#1.0
        VADD.F32 S0,S0,S1
        LDR.N    R0,??DataTable0_7
        VSTR     S0,[R0, #0]
        LDR.N    R0,??DataTable0_7
        VLDR     S0,[R0, #0]
        MOVS     R1,#+2
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//   90            case 3:k_p+=10;display(13,3,k_p);break;
??key_run_10:
        LDR.N    R0,??DataTable0_8
        VLDR     S0,[R0, #0]
        VMOV.F32 S1,#10.0
        VADD.F32 S0,S0,S1
        LDR.N    R0,??DataTable0_8
        VSTR     S0,[R0, #0]
        LDR.N    R0,??DataTable0_8
        VLDR     S0,[R0, #0]
        MOVS     R1,#+3
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//   91            case 4:speed_p+=0.2;display(13,4,speed_p);break;
??key_run_9:
        LDR.N    R0,??DataTable0_9
        LDR      R0,[R0, #+0]
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_10  ;; 0x9999999a
        LDR.N    R3,??DataTable0_11  ;; 0x3fc99999
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2f
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable0_9
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable0_9
        VLDR     S0,[R0, #0]
        MOVS     R1,#+4
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//   92            case 5:sub_p+=0.1;display(13,5,sub_p);break;
??key_run_12:
        LDR.N    R0,??DataTable0_12
        LDR      R0,[R0, #+0]
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_10  ;; 0x9999999a
        LDR.N    R3,??DataTable0_13  ;; 0x3fb99999
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2f
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable0_12
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable0_12
        VLDR     S0,[R0, #0]
        MOVS     R1,#+5
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//   93            case 6:run_time+=3;display(13,6,run_time);break;
??key_run_11:
        LDR.N    R0,??DataTable0_14
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+3
        LDR.N    R1,??DataTable0_14
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable0_14
        LDRB     R0,[R0, #+0]
        VMOV     S0,R0
        VCVT.F32.U32 S0,S0
        MOVS     R1,#+6
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//   94            case 7:
//   95            }
//   96       }
//   97           else if(key_num==Key2)
??key_run_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+102
        BNE.W    ??key_run_13
//   98            {
//   99                switch(mulu)
        LDR.N    R0,??DataTable0_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??key_run_14
        CMP      R0,#+2
        BEQ.N    ??key_run_15
        BCC.N    ??key_run_16
        CMP      R0,#+4
        BEQ.N    ??key_run_17
        BCC.N    ??key_run_18
        CMP      R0,#+6
        BEQ.N    ??key_run_19
        BCC.N    ??key_run_20
        B.N      ??key_run_4
//  100            {
//  101            case 0:threshold_left_next--;threshold_right_next--;display(13,0,threshold);break;
??key_run_14:
        LDR.N    R0,??DataTable0_3
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable0_3
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable0_4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable0_4
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable0_5
        LDRH     R0,[R0, #+0]
        VMOV     S0,R0
        VCVT.F32.U32 S0,S0
        MOVS     R1,#+0
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//  102            case 1:driver-=50;display(13,1,driver);break;
??key_run_16:
        LDR.N    R0,??DataTable0_6
        VLDR     S0,[R0, #0]
        VLDR.W   S1,??DataTable0_1  ;; 0xc2480000
        VADD.F32 S0,S0,S1
        LDR.N    R0,??DataTable0_6
        VSTR     S0,[R0, #0]
        LDR.N    R0,??DataTable0_6
        VLDR     S0,[R0, #0]
        MOVS     R1,#+1
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//  103            case 2:middle_p--;display(13,2,middle_p);break;
??key_run_15:
        LDR.N    R0,??DataTable0_7
        VLDR     S0,[R0, #0]
        VMOV.F32 S1,#-1.0
        VADD.F32 S0,S0,S1
        LDR.N    R0,??DataTable0_7
        VSTR     S0,[R0, #0]
        LDR.N    R0,??DataTable0_7
        VLDR     S0,[R0, #0]
        MOVS     R1,#+2
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//  104            case 3:k_p-=10;display(13,3,k_p);break;
??key_run_18:
        LDR.N    R0,??DataTable0_8
        VLDR     S0,[R0, #0]
        VMOV.F32 S1,#-10.0
        VADD.F32 S0,S0,S1
        LDR.N    R0,??DataTable0_8
        VSTR     S0,[R0, #0]
        LDR.N    R0,??DataTable0_8
        VLDR     S0,[R0, #0]
        MOVS     R1,#+3
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//  105            case 4:speed_p-=0.2;display(13,4,speed_p);break;
??key_run_17:
        LDR.N    R0,??DataTable0_9
        LDR      R0,[R0, #+0]
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_10  ;; 0x9999999a
        LDR.N    R3,??DataTable0_15  ;; 0xbfc99999
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2f
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable0_9
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable0_9
        VLDR     S0,[R0, #0]
        MOVS     R1,#+4
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//  106            case 5:sub_p-=0.1;display(13,5,sub_p);break;
??key_run_20:
        LDR.N    R0,??DataTable0_12
        LDR      R0,[R0, #+0]
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_10  ;; 0x9999999a
        LDR.N    R3,??DataTable0_16  ;; 0xbfb99999
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2f
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable0_12
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable0_12
        VLDR     S0,[R0, #0]
        MOVS     R1,#+5
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//  107            case 6:run_time-=3;display(13,6,run_time);break;
??key_run_19:
        LDR.N    R0,??DataTable0_14
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+3
        LDR.N    R1,??DataTable0_14
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable0_14
        LDRB     R0,[R0, #+0]
        VMOV     S0,R0
        VCVT.F32.U32 S0,S0
        MOVS     R1,#+6
        MOVS     R0,#+13
          CFI FunCall display
        BL       display
        B.N      ??key_run_4
//  108            case 7:
//  109            }
//  110            }
//  111           else if(key_num==Key3)
??key_run_13:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+103
        BNE.N    ??key_run_4
//  112            {
//  113                start_run++;
        LDR.N    R0,??DataTable0_17
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable0_17
        STRB     R0,[R1, #+0]
//  114                if(start_run) {
        LDR.N    R0,??DataTable0_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??key_run_21
//  115                    SYSDelay_ms(3000); 
        MOVW     R0,#+3000
          CFI FunCall SYSDelay_ms
        BL       SYSDelay_ms
//  116                     PIT_Enable(PIT0);
        MOVS     R0,#+0
          CFI FunCall PIT_Enable
        BL       PIT_Enable
//  117                }
//  118                if(start_run==2) {start_run=0;driver=0; }
??key_run_21:
        LDR.N    R0,??DataTable0_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??key_run_4
        MOVS     R0,#+0
        LDR.N    R1,??DataTable0_17
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable0_6
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  119            }
//  120  }
??key_run_4:
        POP      {R4,PC}          ;; return
        Nop      
        DATA
??key_run_2:
        DC8      " ",0x0,0x0
        DC8      "*",0x0,0x0
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x42480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0xc2480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     mulu

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     threshold_left_next

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     threshold_right_next

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     threshold

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     driver

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     middle_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     k_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     speed_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_11:
        DC32     0x3fc99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_12:
        DC32     sub_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_13:
        DC32     0x3fb99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_14:
        DC32     run_time

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_15:
        DC32     0xbfc99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_16:
        DC32     0xbfb99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_17:
        DC32     start_run
//  121 
//  122 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function Switch_init
        THUMB
//  123 void Switch_init()
//  124  {
Switch_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  125      GPIO_INIT(PORTB,0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  126      GPIO_INIT(PORTB,1,0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  127      GPIO_INIT(PORTB,2,0);
        MOVS     R2,#+0
        MOVS     R1,#+2
        MOVS     R0,#+1
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  128      GPIO_INIT(PORTB,3,0);
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,#+1
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  129      GPIO_INIT(PORTB,4,0);
        MOVS     R2,#+0
        MOVS     R1,#+4
        MOVS     R0,#+1
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  130      GPIO_INIT(PORTB,5,0);
        MOVS     R2,#+0
        MOVS     R1,#+5
        MOVS     R0,#+1
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  131      GPIO_INIT(PORTB,6,0);
        MOVS     R2,#+0
        MOVS     R1,#+6
        MOVS     R0,#+1
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  132      GPIO_INIT(PORTB,7,0);
        MOVS     R2,#+0
        MOVS     R1,#+7
        MOVS     R0,#+1
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  133      GPIOPULL_SET(PORTB,0,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//  134      GPIOPULL_SET(PORTB,1,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//  135      GPIOPULL_SET(PORTB,2,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+2
        MOVS     R0,#+1
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//  136      GPIOPULL_SET(PORTB,3,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+3
        MOVS     R0,#+1
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//  137      GPIOPULL_SET(PORTB,4,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+4
        MOVS     R0,#+1
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//  138      GPIOPULL_SET(PORTB,5,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+5
        MOVS     R0,#+1
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//  139      GPIOPULL_SET(PORTB,6,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+6
        MOVS     R0,#+1
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//  140      GPIOPULL_SET(PORTB,7,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+7
        MOVS     R0,#+1
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//  141  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function Switch_get
        THUMB
//  142 uint8 Switch_get(uint8 swtch_num)
//  143  {
Switch_get:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  144      return GPIO_GET(PORTB,swtch_num);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        MOVS     R0,#+1
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  145  }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 " "

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "*"

        END
// 
//     2 bytes in section .bss
//     1 byte  in section .data
//     4 bytes in section .rodata
// 1 308 bytes in section .text
// 
// 1 308 bytes of CODE  memory
//     4 bytes of CONST memory
//     3 bytes of DATA  memory
//
//Errors: none
//Warnings: 3
