///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:06
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\common.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\common.c" -lA
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
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\Debug\List\common.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC PORT_Configuer
        PUBLIC PORT_Disable
        PUBLIC PORT_Enable
        PUBLIC PORT_Enable_ALL
        PUBLIC SYS_CLOCK
        PUBLIC SYS_CLOCK_SET
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\common.c
//    1 #include "all.h"

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    2 extern uint32 SYS_CLOCK=0;
SYS_CLOCK:
        DS8 4
//    3 
//    4 //*****************************************************************************************
//    5 //时钟配置函数
//    6 //函数名：SYS_CLOCK_SET(uint32 X,uint32 div_core,uint32 div_bus,uint32 div_flexbus,uint32 flash)
//    7 //参数：X:SYS_CLOCK_150M,SYS_CLOCK_100M,
//    8 //      div_core :内核时钟分频系数
//    9 //      div_bus:系统时钟分频系数
//   10 //      div_flexbus，flash时钟分频系数
//   11 //MAX:core:150M   BUS:75M  FLEXBUS:50M   FLASH  25M
//   12 //****************************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SYS_CLOCK_SET
        THUMB
//   13 void SYS_CLOCK_SET(uint32 X,uint32 div_core,uint32 div_bus,uint32 div_flexbus,uint32 flash)
//   14   {
SYS_CLOCK_SET:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+24]
//   15     //FEI---->FBE
//   16       OSC0_CR=0x80;
        MOVS     R0,#+128
        LDR.N    R1,??DataTable4  ;; 0x40065000
        STRB     R0,[R1, #+0]
//   17       MCG_C2=0x1c;
        MOVS     R0,#+28
        LDR.N    R1,??DataTable4_1  ;; 0x40064001
        STRB     R0,[R1, #+0]
//   18       MCG_C1=MCG_C1_CLKS(2)|MCG_C1_FRDIV(3);
        MOVS     R0,#+152
        LDR.N    R1,??DataTable4_2  ;; 0x40064000
        STRB     R0,[R1, #+0]
//   19       while(!(MCG_S&MCG_S_OSCINIT0_MASK)){};
??SYS_CLOCK_SET_0:
        LDR.N    R0,??DataTable4_3  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??SYS_CLOCK_SET_0
//   20       while((MCG_S&MCG_S_IREFST_MASK)){};
??SYS_CLOCK_SET_1:
        LDR.N    R0,??DataTable4_3  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??SYS_CLOCK_SET_1
//   21       while((((MCG_S&MCG_S_CLKST_MASK)>>MCG_S_CLKST_SHIFT)!=0x2)){};
??SYS_CLOCK_SET_2:
        LDR.N    R0,??DataTable4_3  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??SYS_CLOCK_SET_2
//   22       //已经进入FBE模式
//   23       MCG_C5=MCG_C5_PRDIV0(X/16);
        UBFX     R0,R4,#+4,#+3
        LDR.N    R1,??DataTable4_4  ;; 0x40064004
        STRB     R0,[R1, #+0]
//   24       //FBE--->PBE
//   25       MCG_C6=0x40;
        MOVS     R0,#+64
        LDR.N    R1,??DataTable4_5  ;; 0x40064005
        STRB     R0,[R1, #+0]
//   26       MCG_C6|=MCG_C6_VDIV0(X%16);
        LDR.N    R0,??DataTable4_5  ;; 0x40064005
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+16
        UDIV     R2,R4,R1
        MLS      R2,R2,R1,R4
        ANDS     R1,R2,#0x1F
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_5  ;; 0x40064005
        STRB     R0,[R1, #+0]
//   27       SIM_CLKDIV1=SIM_CLKDIV1_OUTDIV1(div_core-1)|SIM_CLKDIV1_OUTDIV2(div_bus-1)|SIM_CLKDIV1_OUTDIV3(div_flexbus-1)|SIM_CLKDIV1_OUTDIV4(flash-1);
        SUBS     R0,R5,#+1
        SUBS     R1,R6,#+1
        LSLS     R1,R1,#+24
        ANDS     R1,R1,#0xF000000
        ORRS     R0,R1,R0, LSL #+28
        SUBS     R1,R7,#+1
        LSLS     R1,R1,#+20
        ANDS     R1,R1,#0xF00000
        ORRS     R0,R1,R0
        SUBS     R1,R8,#+1
        LSLS     R1,R1,#+16
        ANDS     R1,R1,#0xF0000
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_6  ;; 0x40048044
        STR      R0,[R1, #+0]
//   28       while(!(MCG_S&MCG_S_PLLST_MASK)){};
??SYS_CLOCK_SET_3:
        LDR.N    R0,??DataTable4_3  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??SYS_CLOCK_SET_3
//   29       while(!(MCG_S&MCG_S_LOCK0_MASK)){};
??SYS_CLOCK_SET_4:
        LDR.N    R0,??DataTable4_3  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??SYS_CLOCK_SET_4
//   30       //现在已经进入PBE模式
//   31       //PBE--->PEE
//   32       MCG_C1&=~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable4_2  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable4_2  ;; 0x40064000
        STRB     R0,[R1, #+0]
//   33       while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??SYS_CLOCK_SET_5:
        LDR.N    R0,??DataTable4_3  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??SYS_CLOCK_SET_5
//   34       //现在已经进入PEE模式！
//   35       switch(X)
        MOVS     R0,R4
        CMP      R0,#+16
        BEQ.N    ??SYS_CLOCK_SET_6
        CMP      R0,#+24
        BNE.N    ??SYS_CLOCK_SET_7
//   36        {
//   37        case SYS_CLOCK_150M:SYS_CLOCK=150000000;break;
??SYS_CLOCK_SET_8:
        LDR.N    R0,??DataTable4_7  ;; 0x8f0d180
        LDR.N    R1,??DataTable4_8
        STR      R0,[R1, #+0]
        B.N      ??SYS_CLOCK_SET_7
//   38        case SYS_CLOCK_100M:SYS_CLOCK=100000000;break;
??SYS_CLOCK_SET_6:
        LDR.N    R0,??DataTable4_9  ;; 0x5f5e100
        LDR.N    R1,??DataTable4_8
        STR      R0,[R1, #+0]
//   39        }
//   40       PORT_Enable_ALL();
??SYS_CLOCK_SET_7:
          CFI FunCall PORT_Enable_ALL
        BL       PORT_Enable_ALL
//   41   }
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock0
//   42 
//   43 //*********************************************
//   44 //函数名称：void PORT_Enable(uint32 x)
//   45 //简介：使能端口时钟
//   46 //参数：PORTA,PORTB,PORTC,PORTD,PORTE,PORTF
//   47 //**********************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PORT_Enable
          CFI NoCalls
        THUMB
//   48 void PORT_Enable(uint32 X)
//   49  {
//   50      HWREG(0X40048038)|=(1<<(9+X));
PORT_Enable:
        LDR.N    R1,??DataTable4_10  ;; 0x40048038
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        ADDS     R3,R0,#+9
        LSLS     R2,R2,R3
        ORRS     R1,R2,R1
        LDR.N    R2,??DataTable4_10  ;; 0x40048038
        STR      R1,[R2, #+0]
//   51  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   52 
//   53 
//   54 //*********************************************
//   55 //函数名称：void PORT_Disable(uint32 x)
//   56 //简介：关闭端口时钟
//   57 //参数：PORTA,PORTB,PORTC,PORTD,PORTE,PORTF
//   58 //**********************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PORT_Disable
          CFI NoCalls
        THUMB
//   59 void PORT_Disable(uint32 X)
//   60  {
//   61      SIM_SCGC5&=~(1<<(9+X));
PORT_Disable:
        LDR.N    R1,??DataTable4_10  ;; 0x40048038
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        ADDS     R3,R0,#+9
        LSLS     R2,R2,R3
        BICS     R1,R1,R2
        LDR.N    R2,??DataTable4_10  ;; 0x40048038
        STR      R1,[R2, #+0]
//   62  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//   63 
//   64 
//   65 //**********************************************
//   66 //函数名称：void PORT_Enable_ALL(void);
//   67 //简介：打开所有端口时钟
//   68 //***********************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PORT_Enable_ALL
          CFI NoCalls
        THUMB
//   69 void PORT_Enable_ALL(void)
//   70  {
//   71      SIM_SCGC5|=(SIM_SCGC5_PORTA_MASK|SIM_SCGC5_PORTB_MASK|SIM_SCGC5_PORTC_MASK|SIM_SCGC5_PORTD_MASK|SIM_SCGC5_PORTE_MASK
//   72          |SIM_SCGC5_PORTF_MASK);
PORT_Enable_ALL:
        LDR.N    R0,??DataTable4_10  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x7E00
        LDR.N    R1,??DataTable4_10  ;; 0x40048038
        STR      R0,[R1, #+0]
//   73  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//   74 //设置端口的复用功能

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PORT_Configuer
          CFI NoCalls
        THUMB
//   75 void PORT_Configuer(uint32 port,uint32 pin,uint8 select)
//   76  {
PORT_Configuer:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//   77      HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=PORT_PCR_MUX(select);
        MOV      R3,#+4096
        LSLS     R4,R1,#+2
        MLA      R3,R3,R0,R4
        LDR.N    R4,??DataTable4_11  ;; 0x40049000
        MOV      R5,#+4096
        LSLS     R6,R1,#+2
        MLA      R5,R5,R0,R6
        LDR.N    R6,??DataTable4_11  ;; 0x40049000
        LDR      R5,[R6, R5]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R6,R2,#+8
        ANDS     R6,R6,#0x700
        ORRS     R5,R6,R5
        STR      R5,[R4, R3]
//   78  }
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x40065000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40064001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x40064000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40064006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x40064004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x40064005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x8f0d180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     SYS_CLOCK

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     0x5f5e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     0x40049000

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
//   4 bytes in section .bss
// 362 bytes in section .text
// 
// 362 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
