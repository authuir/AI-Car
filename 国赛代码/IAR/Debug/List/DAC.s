///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:06
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\DAC.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\DAC.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\DAC.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC DAC_INIT
        PUBLIC DAC_OUT
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\DAC.c
//    1 #include "all.h"
//    2 
//    3 //*****************************************************
//    4 //DAC初始化函数
//    5 //参数：DAC0.DAC1
//    6 //*****************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function DAC_INIT
          CFI NoCalls
        THUMB
//    7 void DAC_INIT(uint32 DAC_NUM)
//    8  {
//    9      SIM_SCGC2|=(uint32)1<<(DAC_NUM+12);
DAC_INIT:
        LDR.N    R1,??DataTable1  ;; 0x4004802c
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        ADDS     R3,R0,#+12
        LSLS     R2,R2,R3
        ORRS     R1,R2,R1
        LDR.N    R2,??DataTable1  ;; 0x4004802c
        STR      R1,[R2, #+0]
//   10      HWREG8(DAC_C0_BASE+DAC_NUM*(0X1000))|=
//   11          DAC_C0_DACEN_MASK
//   12           |DAC_C0_DACRFS_MASK|DAC_C0_DACTRGSEL_MASK;
        MOV      R1,#+4096
        LDR.N    R2,??DataTable1_1  ;; 0x400cc021
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        ORRS     R1,R1,#0xE0
        MOV      R2,#+4096
        LDR.N    R3,??DataTable1_1  ;; 0x400cc021
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+0]
//   13      HWREG8(DAC_C2_BASE +DAC_NUM*(0X1000))=(uint32)(0|DAC_C2_DACBFRP(0));
        MOVS     R1,#+0
        MOV      R2,#+4096
        LDR.N    R3,??DataTable1_2  ;; 0x400cc023
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+0]
//   14      HWREG8(DAC_DATL_BASE+DAC_NUM*(0X1000))=0;
        MOVS     R1,#+0
        MOV      R2,#+4096
        LDR.N    R3,??DataTable1_3  ;; 0x400cc000
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+0]
//   15      HWREG8(DAC_DATH_BASE+DAC_NUM*(0X1000))=0;
        MOVS     R1,#+0
        MOV      R2,#+4096
        LDR.N    R3,??DataTable1_4  ;; 0x400cc001
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+0]
//   16  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   17 
//   18 //*********************************************************
//   19 //输出电压函数   毫伏为单位
//   20 //*********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function DAC_OUT
          CFI NoCalls
        THUMB
//   21 void DAC_OUT(uint32 DAC_NUM,uint16 mv)
//   22  {
DAC_OUT:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   23      uint16 value=0;
        MOVS     R2,#+0
//   24      value=mv*4096/3300;
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOV      R3,#+4096
        MUL      R3,R3,R1
        MOVW     R4,#+3300
        SDIV     R3,R3,R4
        MOVS     R2,R3
//   25      HWREG8(DAC_DATH_BASE+DAC_NUM*(0X1000))=value>>8;
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSRS     R3,R2,#+8
        MOV      R4,#+4096
        LDR.N    R5,??DataTable1_4  ;; 0x400cc001
        MLA      R4,R4,R0,R5
        STRB     R3,[R4, #+0]
//   26      HWREG8(DAC_DATL_BASE+DAC_NUM*(0X1000))=value&0xff;
        MOV      R3,#+4096
        LDR.N    R4,??DataTable1_3  ;; 0x400cc000
        MLA      R3,R3,R0,R4
        STRB     R2,[R3, #+0]
//   27  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x4004802c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x400cc021

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x400cc023

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x400cc000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x400cc001

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
// 166 bytes in section .text
// 
// 166 bytes of CODE memory
//
//Errors: none
//Warnings: none
