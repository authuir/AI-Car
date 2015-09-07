///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:14
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\WDOG.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\WDOG.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\WDOG.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC wdog_disable
        PUBLIC wdog_enable
        PUBLIC wdog_feed
        PUBLIC wdog_init_ms
        PUBLIC wdog_unlock
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\WDOG.c
//    1 #include "all.h"
//    2 //**********************************************************************
//    3 //简介：解锁看门狗
//    4 //**********************************************************************

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function wdog_unlock
          CFI NoCalls
        THUMB
//    5 void wdog_unlock(void)
//    6  {
//    7      DisableInterrupts
wdog_unlock:
        CPSID i
//    8      WDOG_UNLOCK=0XC520;
        MOVW     R0,#+50464
        LDR.N    R1,??DataTable4  ;; 0x4005200e
        STRH     R0,[R1, #+0]
//    9      WDOG_UNLOCK=0XD928;//解锁看门狗寄存器，两次写入不能超过20个时钟周期
        MOVW     R0,#+55592
        LDR.N    R1,??DataTable4  ;; 0x4005200e
        STRH     R0,[R1, #+0]
//   10      EnableInterrupts
        CPSIE i
//   11  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   12 //**********************************************************************
//   13 //简介：使能看门狗
//   14 //**********************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function wdog_enable
        THUMB
//   15 void wdog_enable(void)
//   16  {
wdog_enable:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   17      wdog_unlock();//解锁之后才能配置看门狗
          CFI FunCall wdog_unlock
        BL       wdog_unlock
//   18      WDOG_STCTRLH|=WDOG_STCTRLH_WDOGEN_MASK;
        LDR.N    R0,??DataTable4_1  ;; 0x40052000
        LDRH     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable4_1  ;; 0x40052000
        STRH     R0,[R1, #+0]
//   19  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   20 //**********************************************************************
//   21 //简介：去使能看门狗
//   22 //**********************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function wdog_disable
        THUMB
//   23 void wdog_disable(void)
//   24  {
wdog_disable:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   25      wdog_unlock();//解锁之后才能配置看门狗
          CFI FunCall wdog_unlock
        BL       wdog_unlock
//   26      WDOG_STCTRLH&=~WDOG_STCTRLH_WDOGEN_MASK;
        LDR.N    R0,??DataTable4_1  ;; 0x40052000
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+65534
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable4_1  ;; 0x40052000
        STRH     R0,[R1, #+0]
//   27  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//   28 //**********************************************************************
//   29 //简介：初始化看门狗，毫秒复位，必须满足ms>4
//   30 //**********************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function wdog_init_ms
        THUMB
//   31 void wdog_init_ms(uint32 ms)
//   32  {
wdog_init_ms:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   33      wdog_unlock();
          CFI FunCall wdog_unlock
        BL       wdog_unlock
//   34      WDOG_PRESC=WDOG_PRESC_PRESCVAL(0);
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_2  ;; 0x40052016
        STRH     R0,[R1, #+0]
//   35      WDOG_TOVALH=ms>>16;
        LSRS     R0,R4,#+16
        LDR.N    R1,??DataTable4_3  ;; 0x40052004
        STRH     R0,[R1, #+0]
//   36      WDOG_TOVALL=(uint16)(ms&0XFFFF);
        LDR.N    R0,??DataTable4_4  ;; 0x40052006
        STRH     R4,[R0, #+0]
//   37  }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//   38 //**********************************************************************
//   39 //简介：喂狗
//   40 //**********************************************************************

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function wdog_feed
          CFI NoCalls
        THUMB
//   41 void wdog_feed(void)
//   42  {
//   43     DisableInterrupts
wdog_feed:
        CPSID i
//   44     WDOG_REFRESH = 0xA602;
        MOVW     R0,#+42498
        LDR.N    R1,??DataTable4_5  ;; 0x4005200c
        STRH     R0,[R1, #+0]
//   45     WDOG_REFRESH = 0xB480;
        MOVW     R0,#+46208
        LDR.N    R1,??DataTable4_5  ;; 0x4005200c
        STRH     R0,[R1, #+0]
//   46     EnableInterrupts
        CPSIE i
//   47  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x4005200e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40052000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x40052016

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40052004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x40052006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x4005200c

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 136 bytes in section .text
// 
// 136 bytes of CODE memory
//
//Errors: none
//Warnings: none
