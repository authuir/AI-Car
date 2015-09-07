///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:09
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\lptmr.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\lptmr.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\lptmr.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC LPTMR_init
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\lptmr.c
//    1 #include "all.h"

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function LPTMR_init
          CFI NoCalls
        THUMB
//    2 void LPTMR_init(u16 CountNUM)
//    3 {
//    4     SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;  //打开 PORTA 时钟
LPTMR_init:
        LDR.N    R1,??LPTMR_init_0  ;; 0x40048038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x800
        LDR.N    R2,??LPTMR_init_0  ;; 0x40048038
        STR      R1,[R2, #+0]
//    5     PORTC_PCR5 = PORT_PCR_MUX(0x03);    //在PTA19上使用 ALT6
        MOV      R1,#+768
        LDR.N    R2,??LPTMR_init_0+0x4  ;; 0x4004b014
        STR      R1,[R2, #+0]
//    6     SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;    //使能LPT模块时钟
        LDR.N    R1,??LPTMR_init_0  ;; 0x40048038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1
        LDR.N    R2,??LPTMR_init_0  ;; 0x40048038
        STR      R1,[R2, #+0]
//    7 
//    8     LPTMR0_CSR = 0x00;                      //关LPT 设置时钟分频
        MOVS     R1,#+0
        LDR.N    R2,??LPTMR_init_0+0x8  ;; 0x40040000
        STR      R1,[R2, #+0]
//    9 
//   10     LPTMR0_CMR = CountNUM;                       //设置比较值
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??LPTMR_init_0+0xC  ;; 0x40040008
        STR      R0,[R1, #+0]
//   11 
//   12     LPTMR_PSR_REG(LPTMR0_BASE_PTR) = LPTMR_PSR_PCS(1) | LPTMR_PSR_PBYP_MASK | LPTMR_PSR_PRESCALE(2);
        MOVS     R1,#+21
        LDR.N    R2,??LPTMR_init_0+0x10  ;; 0x40040004
        STR      R1,[R2, #+0]
//   13   
//   14     LPTMR0_CSR = LPTMR_CSR_TPS(2) | LPTMR_CSR_TMS_MASK   | LPTMR_CSR_TEN_MASK   ;
        MOVS     R1,#+35
        LDR.N    R2,??LPTMR_init_0+0x8  ;; 0x40040000
        STR      R1,[R2, #+0]
//   15     //         TPS 01 管脚：LPTMR_ALT2  TMS 1 脉冲计数模式   TPP 1 下降沿    TEN 1 使能定时器     TIE 1 开启中断               
//   16 }
        BX       LR               ;; return
        Nop      
        DATA
??LPTMR_init_0:
        DC32     0x40048038
        DC32     0x4004b014
        DC32     0x40040000
        DC32     0x40040008
        DC32     0x40040004
          CFI EndBlock cfiBlock0

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
// 80 bytes in section .text
// 
// 80 bytes of CODE memory
//
//Errors: none
//Warnings: none
