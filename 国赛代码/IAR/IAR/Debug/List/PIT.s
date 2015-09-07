///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:10
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\PIT.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\PIT.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\PIT.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC PITINT_Clear
        PUBLIC PITINT_Disable
        PUBLIC PITINT_Enable
        PUBLIC PIT_Disable
        PUBLIC PIT_Enable
        PUBLIC PIT_INIT
        PUBLIC PIT_Read
        PUBLIC PIT_Reload
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\PIT.c
//    1 #include "all.h"
//    2 //*********************************************************************
//    3 //函数名：void PIT_INIT(uint32 PIT_NUM,uint32 TIMEOUT,uint32 WAY_DEBUG)
//    4 //参数：PIT_NUM：PIT0~3
//    5 //      TIMEOUT:装载值
//    6 //      WAY_DEBUG：时钟是否在DEBUG下运行，DEBUG_CONTINUE,DEBUG_STOP
//    7 //*********************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function PIT_INIT
          CFI NoCalls
        THUMB
//    8 void PIT_INIT(uint32 PIT_NUM,uint32 TIMEOUT,uint32 WAY_DEBUG)
//    9  {
PIT_INIT:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   10      PIT_MCR&=~PIT_MCR_MDIS_MASK;
        LDR.N    R3,??DataTable7  ;; 0x40037000
        LDR      R3,[R3, #+0]
        BICS     R3,R3,#0x2
        LDR.N    R4,??DataTable7  ;; 0x40037000
        STR      R3,[R4, #+0]
//   11      PIT_MCR|=WAY_DEBUG;
        LDR.N    R3,??DataTable7  ;; 0x40037000
        LDR      R3,[R3, #+0]
        ORRS     R3,R2,R3
        LDR.N    R4,??DataTable7  ;; 0x40037000
        STR      R3,[R4, #+0]
//   12      HWREG(PIT_LDVAL_BASE+PIT_NUM*(0X10))=TIMEOUT/2;
        LSRS     R3,R1,#+1
        LSLS     R4,R0,#+4
        LDR.N    R5,??DataTable7_1  ;; 0x40037100
        STR      R3,[R5, R4]
//   13  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   14 //*********************************************************************
//   15 //函数名：void PIT_Enable(uint32 PIT_NUM)
//   16 //参数：PIT_NUM：PIT0~3
//   17 //简介：打开定时器开始工作
//   18 //*********************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PIT_Enable
          CFI NoCalls
        THUMB
//   19 void PIT_Enable(uint32 PIT_NUM)
//   20  {
//   21      HWREG(PIT_TCTRL_BASE +PIT_NUM*(0X10))|=PIT_TCTRL_TEN_MASK;
PIT_Enable:
        LSLS     R1,R0,#+4
        LDR.N    R2,??DataTable7_2  ;; 0x40037108
        LDR      R1,[R2, R1]
        ORRS     R1,R1,#0x1
        LSLS     R2,R0,#+4
        LDR.N    R3,??DataTable7_2  ;; 0x40037108
        STR      R1,[R3, R2]
//   22  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   23 //*********************************************************************
//   24 //函数名：void PIT_Disable(uint32 PIT_NUM)
//   25 //参数：PIT_NUM：PIT0~3
//   26 //简介：关闭定时器开始工作
//   27 //*********************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PIT_Disable
          CFI NoCalls
        THUMB
//   28 void PIT_Disable(uint32 PIT_NUM)
//   29  {
//   30      HWREG(PIT_TCTRL_BASE+PIT_NUM*(0X10))&=~PIT_TCTRL_TEN_MASK;
PIT_Disable:
        LSLS     R1,R0,#+4
        LDR.N    R2,??DataTable7_2  ;; 0x40037108
        LDR      R1,[R2, R1]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        LSLS     R2,R0,#+4
        LDR.N    R3,??DataTable7_2  ;; 0x40037108
        STR      R1,[R3, R2]
//   31  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//   32 
//   33 //******************************************************************
//   34 //函数名：uint32 PIT_Read(uint32 PIT_NUM)
//   35 //简介：读取当前计时器的值
//   36 //************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PIT_Read
          CFI NoCalls
        THUMB
//   37 uint32 PIT_Read(uint32 PIT_NUM)
//   38  {
//   39      return (uint32)HWREG(PIT_CVAL_BASE+PIT_NUM*(0X10));
PIT_Read:
        LSLS     R0,R0,#+4
        LDR.N    R1,??DataTable7_3  ;; 0x40037104
        LDR      R0,[R1, R0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//   40  }
//   41 //*********************************************************************
//   42 //函数名：void PIT_Reload(uint32 PIT_NUM,uint32 TIMEOUT)
//   43 //简介：重新装载PIT的值
//   44 //*******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PIT_Reload
        THUMB
//   45 void PIT_Reload(uint32 PIT_NUM,uint32 TIMEOUT)
//   46  {
PIT_Reload:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//   47      PIT_Disable(PIT_NUM);
        MOVS     R0,R4
          CFI FunCall PIT_Disable
        BL       PIT_Disable
//   48      HWREG(PIT_LDVAL_BASE+PIT_NUM*(0X10))=TIMEOUT/2;
        LSRS     R0,R5,#+1
        LSLS     R1,R4,#+4
        LDR.N    R2,??DataTable7_1  ;; 0x40037100
        STR      R0,[R2, R1]
//   49      PIT_Enable(PIT_NUM);
        MOVS     R0,R4
          CFI FunCall PIT_Enable
        BL       PIT_Enable
//   50  }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock4
//   51 
//   52 
//   53 //PIT中断使能函数

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PITINT_Enable
          CFI NoCalls
        THUMB
//   54 void PITINT_Enable(uint32 PIT_NUM)
//   55  {
//   56      HWREG(PIT_TCTRL_BASE+PIT_NUM*(0X10))|=PIT_TCTRL_TIE_MASK;
PITINT_Enable:
        LSLS     R1,R0,#+4
        LDR.N    R2,??DataTable7_2  ;; 0x40037108
        LDR      R1,[R2, R1]
        ORRS     R1,R1,#0x2
        LSLS     R2,R0,#+4
        LDR.N    R3,??DataTable7_2  ;; 0x40037108
        STR      R1,[R3, R2]
//   57  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//   58 //PITPIT中断去使能函数

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PITINT_Disable
          CFI NoCalls
        THUMB
//   59 void PITINT_Disable(uint32 PIT_NUM)
//   60  {
//   61      HWREG(PIT_TCTRL_BASE+PIT_NUM*(0X10))&=~PIT_TCTRL_TIE_MASK;
PITINT_Disable:
        LSLS     R1,R0,#+4
        LDR.N    R2,??DataTable7_2  ;; 0x40037108
        LDR      R1,[R2, R1]
        BICS     R1,R1,#0x2
        LSLS     R2,R0,#+4
        LDR.N    R3,??DataTable7_2  ;; 0x40037108
        STR      R1,[R3, R2]
//   62  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//   63 //PIT中断标志清除

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PITINT_Clear
          CFI NoCalls
        THUMB
//   64 void PITINT_Clear(uint32 PIT_NUM)
//   65  {
//   66      HWREG(PIT_TFLG_BASE+PIT_NUM*(0X10))|=PIT_TFLG_TIF_MASK;
PITINT_Clear:
        LSLS     R1,R0,#+4
        LDR.N    R2,??DataTable7_4  ;; 0x4003710c
        LDR      R1,[R2, R1]
        ORRS     R1,R1,#0x1
        LSLS     R2,R0,#+4
        LDR.N    R3,??DataTable7_4  ;; 0x4003710c
        STR      R1,[R3, R2]
//   67  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x40037000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0x40037100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0x40037108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0x40037104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x4003710c

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   68 
//   69 
//   70 
//   71 
//   72 
//   73 
//   74 
//   75 
//   76 
// 
// 182 bytes in section .text
// 
// 182 bytes of CODE memory
//
//Errors: none
//Warnings: none
