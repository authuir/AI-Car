///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:13
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\systick.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\systick.c" -lA
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
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\Debug\List\systick.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN SYS_CLOCK

        PUBLIC SYSDelay_100ns
        PUBLIC SYSDelay_ms
        PUBLIC SYSDelay_us
        PUBLIC SYSTICK_INIT
        PUBLIC SYSTINT_CLEAR
        PUBLIC SYSTINT_Enable
        PUBLIC SYST_Enable
        PUBLIC fac_ms
        PUBLIC fac_ns
        PUBLIC fac_us
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\systick.c
//    1 #include "all.h"

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    2 uint32 fac_us;
fac_us:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 uint32 fac_ms;
fac_ms:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 uint32 fac_ns;
fac_ns:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SYSTICK_INIT
          CFI NoCalls
        THUMB
//    5 void SYSTICK_INIT(uint32 time_us)
//    6  {
//    7     SYST_CSR|=SysTick_CSR_CLKSOURCE_MASK;
SYSTICK_INIT:
        LDR.N    R1,??DataTable5  ;; 0xe000e010
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x4
        LDR.N    R2,??DataTable5  ;; 0xe000e010
        STR      R1,[R2, #+0]
//    8     fac_us=SYS_CLOCK/1000000;
        LDR.N    R1,??DataTable5_1
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable5_2  ;; 0xf4240
        UDIV     R1,R1,R2
        LDR.N    R2,??DataTable5_3
        STR      R1,[R2, #+0]
//    9     SYST_RVR=time_us*fac_us;
        LDR.N    R1,??DataTable5_3
        LDR      R1,[R1, #+0]
        MUL      R1,R1,R0
        LDR.N    R2,??DataTable5_4  ;; 0xe000e014
        STR      R1,[R2, #+0]
//   10  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SYSDelay_us
          CFI NoCalls
        THUMB
//   11 void SYSDelay_us(uint32 us)
//   12  {
//   13     fac_us=SYS_CLOCK/1000000;
SYSDelay_us:
        LDR.N    R1,??DataTable5_1
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable5_2  ;; 0xf4240
        UDIV     R1,R1,R2
        LDR.N    R2,??DataTable5_3
        STR      R1,[R2, #+0]
//   14      SYST_RVR=fac_us*us;
        LDR.N    R1,??DataTable5_3
        LDR      R1,[R1, #+0]
        MULS     R1,R0,R1
        LDR.N    R2,??DataTable5_4  ;; 0xe000e014
        STR      R1,[R2, #+0]
//   15      SYST_CVR=10;
        MOVS     R1,#+10
        LDR.N    R2,??DataTable5_5  ;; 0xe000e018
        STR      R1,[R2, #+0]
//   16      SYST_CSR|=SysTick_CSR_CLKSOURCE_MASK;
        LDR.N    R1,??DataTable5  ;; 0xe000e010
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x4
        LDR.N    R2,??DataTable5  ;; 0xe000e010
        STR      R1,[R2, #+0]
//   17      SYST_CSR|=SysTick_CSR_ENABLE_MASK;
        LDR.N    R1,??DataTable5  ;; 0xe000e010
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1
        LDR.N    R2,??DataTable5  ;; 0xe000e010
        STR      R1,[R2, #+0]
//   18      while(!((SYST_CSR>>16)&(0x01)))
??SYSDelay_us_0:
        LDR.N    R1,??DataTable5  ;; 0xe000e010
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+16,#+1
        CMP      R1,#+0
        BEQ.N    ??SYSDelay_us_0
//   19       {
//   20       }
//   21  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SYSDelay_100ns
          CFI NoCalls
        THUMB
//   22 void SYSDelay_100ns(uint32 ns)
//   23  {
//   24      fac_ns=SYS_CLOCK/10000000;
SYSDelay_100ns:
        LDR.N    R1,??DataTable5_1
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable5_6  ;; 0x989680
        UDIV     R1,R1,R2
        LDR.N    R2,??DataTable5_7
        STR      R1,[R2, #+0]
//   25      SYST_RVR=fac_ns*ns;
        LDR.N    R1,??DataTable5_7
        LDR      R1,[R1, #+0]
        MULS     R1,R0,R1
        LDR.N    R2,??DataTable5_4  ;; 0xe000e014
        STR      R1,[R2, #+0]
//   26      SYST_CVR=10;
        MOVS     R1,#+10
        LDR.N    R2,??DataTable5_5  ;; 0xe000e018
        STR      R1,[R2, #+0]
//   27      SYST_CSR|=SysTick_CSR_CLKSOURCE_MASK;
        LDR.N    R1,??DataTable5  ;; 0xe000e010
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x4
        LDR.N    R2,??DataTable5  ;; 0xe000e010
        STR      R1,[R2, #+0]
//   28      SYST_CSR|=SysTick_CSR_ENABLE_MASK;
        LDR.N    R1,??DataTable5  ;; 0xe000e010
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1
        LDR.N    R2,??DataTable5  ;; 0xe000e010
        STR      R1,[R2, #+0]
//   29      while(!((SYST_CSR>>16)&(0x01)))
??SYSDelay_100ns_0:
        LDR.N    R1,??DataTable5  ;; 0xe000e010
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+16,#+1
        CMP      R1,#+0
        BEQ.N    ??SYSDelay_100ns_0
//   30       {
//   31       }
//   32  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SYSDelay_ms
        THUMB
//   33 void SYSDelay_ms(uint32 ms)
//   34  {
SYSDelay_ms:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//   35      int i;
//   36      for(i=0;i<ms;i++)
        MOVS     R0,#+0
        MOVS     R5,R0
??SYSDelay_ms_0:
        CMP      R5,R4
        BCS.N    ??SYSDelay_ms_1
//   37       {
//   38           SYSDelay_us(1000);
        MOV      R0,#+1000
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   39       }
        ADDS     R5,R5,#+1
        B.N      ??SYSDelay_ms_0
//   40  }
??SYSDelay_ms_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SYST_Enable
          CFI NoCalls
        THUMB
//   41 void SYST_Enable(void)
//   42  {
//   43      SYST_CSR|=SysTick_CSR_ENABLE_MASK;
SYST_Enable:
        LDR.N    R0,??DataTable5  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable5  ;; 0xe000e010
        STR      R0,[R1, #+0]
//   44  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SYSTINT_CLEAR
          CFI NoCalls
        THUMB
//   45 void SYSTINT_CLEAR(void)
//   46  {
//   47         SYST_CSR&=~(1<<16);
SYSTINT_CLEAR:
        LDR.N    R0,??DataTable5  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x10000
        LDR.N    R1,??DataTable5  ;; 0xe000e010
        STR      R0,[R1, #+0]
//   48  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SYSTINT_Enable
          CFI NoCalls
        THUMB
//   49 void SYSTINT_Enable(void)
//   50  {
//   51      SYST_CSR|=(0x1)<<1;
SYSTINT_Enable:
        LDR.N    R0,??DataTable5  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable5  ;; 0xe000e010
        STR      R0,[R1, #+0]
//   52  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0xe000e010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     SYS_CLOCK

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0xf4240

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     fac_us

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0xe000e014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0xe000e018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x989680

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     fac_ns

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
//  12 bytes in section .bss
// 276 bytes in section .text
// 
// 276 bytes of CODE memory
//  12 bytes of DATA memory
//
//Errors: none
//Warnings: none
