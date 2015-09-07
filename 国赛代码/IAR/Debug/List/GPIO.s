///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:07
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\GPIO.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\GPIO.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\GPIO.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN PORT_Enable

        PUBLIC GPIOINT_Clear
        PUBLIC GPIOINT_Disable
        PUBLIC GPIOINT_Enable
        PUBLIC GPIOPULL_Disable
        PUBLIC GPIOPULL_Enable
        PUBLIC GPIOPULL_SET
        PUBLIC GPIO_DSE
        PUBLIC GPIO_Disable
        PUBLIC GPIO_Enable
        PUBLIC GPIO_GET
        PUBLIC GPIO_INIT
        PUBLIC GPIO_Init
        PUBLIC GPIO_ODE
        PUBLIC GPIO_OPPSITE
        PUBLIC GPIO_PFE
        PUBLIC GPIO_SER
        PUBLIC GPIO_SET
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\GPIO.c
//    1 #include "all.h"
//    2 //**********************************************
//    3 //函数名称：void GPIO_Enable(port,pin)
//    4 //简介：GPIO使能
//    5 //参数：port端口：PORTA,PORTB,PORTC.~PORTF
//    6 //      pin引脚：0-31
//    7 //**********************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function GPIO_Enable
          CFI NoCalls
        THUMB
//    8 void GPIO_Enable(uint32 port,uint32 pin)
//    9  {
GPIO_Enable:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   10      HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=(uint32)~(7<<8);
        MOV      R2,#+4096
        LSLS     R3,R1,#+2
        MLA      R2,R2,R0,R3
        LDR.W    R3,??DataTable16  ;; 0x40049000
        MOV      R4,#+4096
        LSLS     R5,R1,#+2
        MLA      R4,R4,R0,R5
        LDR.W    R5,??DataTable16  ;; 0x40049000
        LDR      R4,[R5, R4]
        BICS     R4,R4,#0x700
        STR      R4,[R3, R2]
//   11      HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=(uint32)(1<<8);
        MOV      R2,#+4096
        LSLS     R3,R1,#+2
        MLA      R2,R2,R0,R3
        LDR.W    R3,??DataTable16  ;; 0x40049000
        MOV      R4,#+4096
        LSLS     R5,R1,#+2
        MLA      R4,R4,R0,R5
        LDR.W    R5,??DataTable16  ;; 0x40049000
        LDR      R4,[R5, R4]
        ORRS     R4,R4,#0x100
        STR      R4,[R3, R2]
//   12  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   13 //**********************************************
//   14 //函数名称：void GPIO_Disable( port ,pin)
//   15 //简介：GPIO去使能
//   16 //参数：port端口：PORTA---PORTF
//   17 //      pin引脚：0-31
//   18 //*************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function GPIO_Disable
          CFI NoCalls
        THUMB
//   19 void GPIO_Disable(uint32 port,uint32 pin)
//   20  {
GPIO_Disable:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   21     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=~(7<<8);
        MOV      R2,#+4096
        LSLS     R3,R1,#+2
        MLA      R2,R2,R0,R3
        LDR.W    R3,??DataTable16  ;; 0x40049000
        MOV      R4,#+4096
        LSLS     R5,R1,#+2
        MLA      R4,R4,R0,R5
        LDR.W    R5,??DataTable16  ;; 0x40049000
        LDR      R4,[R5, R4]
        BICS     R4,R4,#0x700
        STR      R4,[R3, R2]
//   22  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   23 
//   24 //*******************************************************
//   25 //函数名称：void GPIO_INIT(port,pin,dir)
//   26 //简介：初始化端口，设定方向
//   27 //参数：port端口：PORTA---PORTF
//   28 //      pin引脚：0-31
//   29 //*******************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function GPIO_INIT
        THUMB
//   30 void GPIO_INIT(uint32 port,uint32 pin,uint32 dir)
//   31  {
GPIO_INIT:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//   32      PORT_Enable(port);
        MOVS     R0,R4
          CFI FunCall PORT_Enable
        BL       PORT_Enable
//   33      HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=(uint32)~(7<<8);
        MOV      R0,#+4096
        LSLS     R1,R5,#+2
        MLA      R0,R0,R4,R1
        LDR.W    R1,??DataTable16  ;; 0x40049000
        MOV      R2,#+4096
        LSLS     R3,R5,#+2
        MLA      R2,R2,R4,R3
        LDR.W    R3,??DataTable16  ;; 0x40049000
        LDR      R2,[R3, R2]
        BICS     R2,R2,#0x700
        STR      R2,[R1, R0]
//   34      HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=(uint32)(1<<8);
        MOV      R0,#+4096
        LSLS     R1,R5,#+2
        MLA      R0,R0,R4,R1
        LDR.W    R1,??DataTable16  ;; 0x40049000
        MOV      R2,#+4096
        LSLS     R3,R5,#+2
        MLA      R2,R2,R4,R3
        LDR.W    R3,??DataTable16  ;; 0x40049000
        LDR      R2,[R3, R2]
        ORRS     R2,R2,#0x100
        STR      R2,[R1, R0]
//   35      if(dir)
        CMP      R6,#+0
        BEQ.N    ??GPIO_INIT_0
//   36         HWREG(GPIO_PDDR_BASE+port*(0x40))|=(1<<pin);
        MOVS     R0,#+64
        LDR.W    R1,??DataTable16_1  ;; 0x400ff014
        MLA      R0,R0,R4,R1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        ORRS     R0,R1,R0
        MOVS     R1,#+64
        LDR.W    R2,??DataTable16_1  ;; 0x400ff014
        MLA      R1,R1,R4,R2
        STR      R0,[R1, #+0]
        B.N      ??GPIO_INIT_1
//   37      else HWREG(GPIO_PDDR_BASE+port*(0x40))&=~(1<<pin);
??GPIO_INIT_0:
        MOVS     R0,#+64
        LDR.W    R1,??DataTable16_1  ;; 0x400ff014
        MLA      R0,R0,R4,R1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        BICS     R0,R0,R1
        MOVS     R1,#+64
        LDR.W    R2,??DataTable16_1  ;; 0x400ff014
        MLA      R1,R1,R4,R2
        STR      R0,[R1, #+0]
//   38  }
??GPIO_INIT_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock2
//   39 
//   40 //*******************************************************
//   41 //函数名称：void GPIO_SET(port,pin,date)
//   42 //简介：设定端口输出电平，首先要初始化设置输出
//   43 //参数：port端口：PORTA---PORTF
//   44 //      pin引脚：用与的形式
//   45 //      date:高低电平 
//   46 //********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function GPIO_SET
          CFI NoCalls
        THUMB
//   47 void GPIO_SET(uint32 port,uint32 pin,uint32 date)
//   48  {
GPIO_SET:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   49        if(date)
        CMP      R2,#+0
        BEQ.N    ??GPIO_SET_0
//   50         HWREG(GPIO_PDOR_BASE+port*(0x40))|=(1<<pin);
        MOVS     R3,#+64
        LDR.W    R4,??DataTable16_2  ;; 0x400ff000
        MLA      R3,R3,R0,R4
        LDR      R3,[R3, #+0]
        MOVS     R4,#+1
        LSLS     R4,R4,R1
        ORRS     R3,R4,R3
        MOVS     R4,#+64
        LDR.W    R5,??DataTable16_2  ;; 0x400ff000
        MLA      R4,R4,R0,R5
        STR      R3,[R4, #+0]
        B.N      ??GPIO_SET_1
//   51      else HWREG(GPIO_PDOR_BASE+port*(0x40))&=~(1<<pin);
??GPIO_SET_0:
        MOVS     R3,#+64
        LDR.W    R4,??DataTable16_2  ;; 0x400ff000
        MLA      R3,R3,R0,R4
        LDR      R3,[R3, #+0]
        MOVS     R4,#+1
        LSLS     R4,R4,R1
        BICS     R3,R3,R4
        MOVS     R4,#+64
        LDR.W    R5,??DataTable16_2  ;; 0x400ff000
        MLA      R4,R4,R0,R5
        STR      R3,[R4, #+0]
//   52  }
??GPIO_SET_1:
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//   53 
//   54 //*******************************************************
//   55 //函数名称：uint32 GPIO_GET(port,pin)
//   56 //简介：设定端口输出电平，首先要初始化设置
//   57 //参数：port端口：PORTA---PORTF
//   58 //      pin引脚：0-31
//   59 //返回值：引脚状态,默认为高电平，返回1
//   60 //********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function GPIO_GET
          CFI NoCalls
        THUMB
//   61 uint32 GPIO_GET(uint32 port,uint32 pin)
//   62  {
//   63     return (uint32)(HWREG(GPIO_PDIR_BASE+port*(0x40))>>pin)&(0x00000001);
GPIO_GET:
        MOVS     R2,#+64
        LDR.W    R3,??DataTable16_3  ;; 0x400ff010
        MLA      R0,R2,R0,R3
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,R1
        ANDS     R0,R0,#0x1
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//   64  }
//   65 
//   66 //*******************************************************
//   67 //函数名称：void GPIO_OPPSITE(port,pin)
//   68 //简介：设定端口输出电平，首先要初始化设置输出
//   69 //参数：port端口：PORTA---PORTF
//   70 //      pin引脚：0-31
//   71 //********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function GPIO_OPPSITE
          CFI NoCalls
        THUMB
//   72 void GPIO_OPPSITE(uint32 port , uint32 pin)
//   73  {
GPIO_OPPSITE:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//   74     HWREG(GPIO_PTOR_BASE +port*(0x40))|=(1<<pin);
        MOVS     R2,#+64
        LDR.W    R3,??DataTable16_4  ;; 0x400ff00c
        MLA      R2,R2,R0,R3
        LDR      R2,[R2, #+0]
        MOVS     R3,#+1
        LSLS     R3,R3,R1
        ORRS     R2,R3,R2
        MOVS     R3,#+64
        LDR.W    R4,??DataTable16_4  ;; 0x400ff00c
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//   75  }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//   76 
//   77 
//   78 //***********************************************************
//   79 //函数名称：void GPIO_DSE(uint32 port,uint32 pin)
//   80 //简介：设定驱动强度，用此函数数，驱动为high drive
//   81 //参数：port端口：PORTA---PORTF
//   82 //      pin引脚：0-31
//   83 //***********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function GPIO_DSE
          CFI NoCalls
        THUMB
//   84 void GPIO_DSE(uint32 port ,uint32 pin)
//   85  {
GPIO_DSE:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   86     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<6;
        MOV      R2,#+4096
        LSLS     R3,R1,#+2
        MLA      R2,R2,R0,R3
        LDR.W    R3,??DataTable16  ;; 0x40049000
        MOV      R4,#+4096
        LSLS     R5,R1,#+2
        MLA      R4,R4,R0,R5
        LDR.W    R5,??DataTable16  ;; 0x40049000
        LDR      R4,[R5, R4]
        ORRS     R4,R4,#0x40
        STR      R4,[R3, R2]
//   87  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//   88 //***********************************************************
//   89 //函数名称：void GPIO_ODE(uint32 port,uint32 pin)
//   90 //简介：设定为OPEN DRAIN，用此函数数，
//   91 //参数：port端口：PORTA---PORTF
//   92 //      pin引脚：0-31
//   93 //***********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function GPIO_ODE
          CFI NoCalls
        THUMB
//   94 void GPIO_ODE(uint32 port ,uint32 pin)
//   95  {
GPIO_ODE:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   96     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<5;
        MOV      R2,#+4096
        LSLS     R3,R1,#+2
        MLA      R2,R2,R0,R3
        LDR.N    R3,??DataTable16  ;; 0x40049000
        MOV      R4,#+4096
        LSLS     R5,R1,#+2
        MLA      R4,R4,R0,R5
        LDR.N    R5,??DataTable16  ;; 0x40049000
        LDR      R4,[R5, R4]
        ORRS     R4,R4,#0x20
        STR      R4,[R3, R2]
//   97  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//   98    //***********************************************************
//   99 //函数名称：void GPIO_PFE(uint32 port,uint32 pin)
//  100 //简介：设定为Passive Filter
//  101 //参数：port端口：PORTA---PORTF
//  102 //      pin引脚：0-31
//  103 //***********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function GPIO_PFE
          CFI NoCalls
        THUMB
//  104 void GPIO_PFE(uint32 port,uint32 pin)
//  105  {
GPIO_PFE:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  106     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<4;
        MOV      R2,#+4096
        LSLS     R3,R1,#+2
        MLA      R2,R2,R0,R3
        LDR.N    R3,??DataTable16  ;; 0x40049000
        MOV      R4,#+4096
        LSLS     R5,R1,#+2
        MLA      R4,R4,R0,R5
        LDR.N    R5,??DataTable16  ;; 0x40049000
        LDR      R4,[R5, R4]
        ORRS     R4,R4,#0x10
        STR      R4,[R3, R2]
//  107  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  108   //***********************************************************
//  109 //函数名称：void GPIO_PFE(uint32 port,uint32 pin)
//  110 //简介：设定为low slew rate
//  111 //参数：port端口：PORTA---PORTF
//  112 //      pin引脚：0-31
//  113 //***********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function GPIO_SER
          CFI NoCalls
        THUMB
//  114 void GPIO_SER(uint32 port,uint32 pin)
//  115  {
GPIO_SER:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  116     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<2;
        MOV      R2,#+4096
        LSLS     R3,R1,#+2
        MLA      R2,R2,R0,R3
        LDR.N    R3,??DataTable16  ;; 0x40049000
        MOV      R4,#+4096
        LSLS     R5,R1,#+2
        MLA      R4,R4,R0,R5
        LDR.N    R5,??DataTable16  ;; 0x40049000
        LDR      R4,[R5, R4]
        ORRS     R4,R4,#0x4
        STR      R4,[R3, R2]
//  117  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  118 
//  119 //*************************************************************
//  120 //函数名称：void GPIOPULL_Enable(uint32 port,uint32 pin)
//  121 //简介：设定为使能上下拉
//  122 //参数：port端口：PORTA---PORTF
//  123 //      pin引脚：0-31
//  124 //***********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function GPIOPULL_Enable
          CFI NoCalls
        THUMB
//  125 void GPIOPULL_Enable(uint32 port,uint32 pin)
//  126  {
GPIOPULL_Enable:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  127     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<1;
        MOV      R2,#+4096
        LSLS     R3,R1,#+2
        MLA      R2,R2,R0,R3
        LDR.N    R3,??DataTable16  ;; 0x40049000
        MOV      R4,#+4096
        LSLS     R5,R1,#+2
        MLA      R4,R4,R0,R5
        LDR.N    R5,??DataTable16  ;; 0x40049000
        LDR      R4,[R5, R4]
        ORRS     R4,R4,#0x2
        STR      R4,[R3, R2]
//  128  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  129 //*************************************************************
//  130 //函数名称：void GPIOPULL_Disable(uint32 port,uint32 pin)
//  131 //简介：设定为去使能上下拉
//  132 //参数：port端口：PORTA---PORTF
//  133 //      pin引脚：0-31
//  134 //***********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function GPIOPULL_Disable
          CFI NoCalls
        THUMB
//  135 void GPIOPULL_Disable(uint32 port,uint32 pin)
//  136  {
GPIOPULL_Disable:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  137     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=~(1<<1);
        MOV      R2,#+4096
        LSLS     R3,R1,#+2
        MLA      R2,R2,R0,R3
        LDR.N    R3,??DataTable16  ;; 0x40049000
        MOV      R4,#+4096
        LSLS     R5,R1,#+2
        MLA      R4,R4,R0,R5
        LDR.N    R5,??DataTable16  ;; 0x40049000
        LDR      R4,[R5, R4]
        BICS     R4,R4,#0x2
        STR      R4,[R3, R2]
//  138  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock11
//  139 
//  140 
//  141 //*************************************************************
//  142 //函数名称：void GPIOPULL_SET(uint32 port,uint32 pin,uint32 state)
//  143 //简介：设定上下拉
//  144 //参数：port端口：PORTA---PORTF
//  145 //      pin引脚：0-31
//  146 //      state:PULL_UP,PULL_DOWN
//  147 //***********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function GPIOPULL_SET
          CFI NoCalls
        THUMB
//  148 void GPIOPULL_SET(uint32 port ,uint32 pin,uint32 state)
//  149  {
GPIOPULL_SET:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//  150      HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1<<1;
        MOV      R3,#+4096
        LSLS     R4,R1,#+2
        MLA      R3,R3,R0,R4
        LDR.N    R4,??DataTable16  ;; 0x40049000
        MOV      R5,#+4096
        LSLS     R6,R1,#+2
        MLA      R5,R5,R0,R6
        LDR.N    R6,??DataTable16  ;; 0x40049000
        LDR      R5,[R6, R5]
        ORRS     R5,R5,#0x2
        STR      R5,[R4, R3]
//  151     if(state) HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=1;
        CMP      R2,#+0
        BEQ.N    ??GPIOPULL_SET_0
        MOV      R3,#+4096
        LSLS     R4,R1,#+2
        MLA      R3,R3,R0,R4
        LDR.N    R4,??DataTable16  ;; 0x40049000
        MOV      R5,#+4096
        LSLS     R6,R1,#+2
        MLA      R5,R5,R0,R6
        LDR.N    R6,??DataTable16  ;; 0x40049000
        LDR      R5,[R6, R5]
        ORRS     R5,R5,#0x1
        STR      R5,[R4, R3]
        B.N      ??GPIOPULL_SET_1
//  152     else HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=~((uint32)1);
??GPIOPULL_SET_0:
        MOV      R3,#+4096
        LSLS     R4,R1,#+2
        MLA      R3,R3,R0,R4
        LDR.N    R4,??DataTable16  ;; 0x40049000
        MOV      R5,#+4096
        LSLS     R6,R1,#+2
        MLA      R5,R5,R0,R6
        LDR.N    R6,??DataTable16  ;; 0x40049000
        LDR      R5,[R6, R5]
        LSRS     R5,R5,#+1
        LSLS     R5,R5,#+1
        STR      R5,[R4, R3]
//  153  }
??GPIOPULL_SET_1:
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock12
//  154 
//  155 
//  156 
//  157 //*************************************************************************
//  158 //函数名称：GPIOINT_Eable(port,pin)
//  159 //简介：使能端口中断
//  160 //参数：port:PORTA-PORTF
//  161 //      pin:0-31
//  162 //      mode:端口模式：
//  163 //*************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function GPIOINT_Enable
          CFI NoCalls
        THUMB
//  164 void GPIOINT_Enable(uint32 port,uint32 pin,uint32 mode)
//  165  {
GPIOINT_Enable:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//  166     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=0xfff0ffff;//先清零
        MOV      R3,#+4096
        LSLS     R4,R1,#+2
        MLA      R3,R3,R0,R4
        LDR.N    R4,??DataTable16  ;; 0x40049000
        MOV      R5,#+4096
        LSLS     R6,R1,#+2
        MLA      R5,R5,R0,R6
        LDR.N    R6,??DataTable16  ;; 0x40049000
        LDR      R5,[R6, R5]
        BICS     R5,R5,#0xF0000
        STR      R5,[R4, R3]
//  167     HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))|=(mode<<16);
        MOV      R3,#+4096
        LSLS     R4,R1,#+2
        MLA      R3,R3,R0,R4
        LDR.N    R4,??DataTable16  ;; 0x40049000
        MOV      R5,#+4096
        LSLS     R6,R1,#+2
        MLA      R5,R5,R0,R6
        LDR.N    R6,??DataTable16  ;; 0x40049000
        LDR      R5,[R6, R5]
        ORRS     R5,R5,R2, LSL #+16
        STR      R5,[R4, R3]
//  168  }
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock13
//  169 
//  170 //*************************************************************************
//  171 //函数名称：GPIOINT_Disable(port,pin)
//  172 //简介：去使能端口中断
//  173 //参数：port:PORTA-PORTF
//  174 //      pin:0-31
//  175 //*************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function GPIOINT_Disable
          CFI NoCalls
        THUMB
//  176 void GPIOINT_Disable(uint32 port,uint32 pin)
//  177  {
GPIOINT_Disable:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  178      HWREG(PORT_BASE+port*(0x1000)+pin*(0x0004))&=0XFFF0FFFF;//先清零
        MOV      R2,#+4096
        LSLS     R3,R1,#+2
        MLA      R2,R2,R0,R3
        LDR.N    R3,??DataTable16  ;; 0x40049000
        MOV      R4,#+4096
        LSLS     R5,R1,#+2
        MLA      R4,R4,R0,R5
        LDR.N    R5,??DataTable16  ;; 0x40049000
        LDR      R4,[R5, R4]
        BICS     R4,R4,#0xF0000
        STR      R4,[R3, R2]
//  179  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock14
//  180 
//  181 //*************************************************************************
//  182 //函数名：void GPIOINT_Clear(uint32 PORT)
//  183 //清楚中断标志
//  184 //*************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function GPIOINT_Clear
          CFI NoCalls
        THUMB
//  185 void GPIOINT_Clear(uint32 PORT)
//  186  {
GPIOINT_Clear:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  187     HWREG(PORT_ISFR+PORT*(0x1000))|=0XFFFFFFFF;
        MOV      R1,#+4096
        LDR.N    R2,??DataTable16_5  ;; 0x400490a0
        MLA      R1,R1,R0,R2
        LDR      R1,[R1, #+0]
        MOVS     R2,#-1
        MOV      R3,#+4096
        LDR.N    R4,??DataTable16_5  ;; 0x400490a0
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//  188  }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock15
//  189 /**********************************************************************/
//  190 /* 简介:初始化GPIO   
//  191  * 例程:GPIO_Init(PTA,GPIO_PIN_10,INTPUT_UP,IRQC_HIGH);
//  192  * 参数: 			PTx:		PTA,PTB,PTC,PTD,PTE
//  193  * 			GPIO_PIN_x:	GPIO_PIN_0,GPIO_PIN_1,......,GPIO_PIN_31
//  194  * 			Dir_Data:	OUTPUT_HIGH,OUTPUT_LOW,INTPUT_UP,INTPUT_DOWN,INTPUT
//  195  * 			Irqc:		IRQC_DIS,IRQC_DMA_RISING,IRQC_DMA_FALLING,IRQC_DMA_BOTH_EDGE,
//  196  * 						IRQC_LOW,IRQC_RISING,IRQC_FALLING,IRQC_BOTH_EDGE,IRQC_HIGH
//  197  */
//  198 /*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function GPIO_Init
          CFI NoCalls
        THUMB
//  199 void GPIO_Init(uint8 Ptx,uint8 Pins,uint8 Dir_Data,uint8 Irqc)
//  200 {
GPIO_Init:
        PUSH     {R4-R7}
          CFI R7 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  201 	PORT_MemMapPtr PORTx_BASE_PTR;
//  202 	GPIO_MemMapPtr PTx_BASE_PTR;
//  203 	
//  204 	switch(Ptx)//使能PORTx的时钟
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??GPIO_Init_0
        BCC.N    ??GPIO_Init_1
        CMP      R0,#+3
        BEQ.N    ??GPIO_Init_2
        BCC.N    ??GPIO_Init_3
        CMP      R0,#+5
        BEQ.N    ??GPIO_Init_4
        BCC.N    ??GPIO_Init_5
        B.N      ??GPIO_Init_1
//  205 	{
//  206 		case 1:PTx_BASE_PTR =PTA_BASE_PTR;PORTx_BASE_PTR = PORTA_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;break;
??GPIO_Init_0:
        LDR.N    R6,??DataTable16_2  ;; 0x400ff000
        MOVS     R5,R6
        LDR.N    R6,??DataTable16  ;; 0x40049000
        MOVS     R4,R6
        LDR.N    R6,??DataTable16_6  ;; 0x40048038
        LDR      R6,[R6, #+0]
        ORRS     R6,R6,#0x200
        LDR.N    R7,??DataTable16_6  ;; 0x40048038
        STR      R6,[R7, #+0]
        B.N      ??GPIO_Init_1
//  207 		case 2:PTx_BASE_PTR =PTB_BASE_PTR;PORTx_BASE_PTR = PORTB_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;break;
??GPIO_Init_3:
        LDR.N    R6,??DataTable16_7  ;; 0x400ff040
        MOVS     R5,R6
        LDR.N    R6,??DataTable16_8  ;; 0x4004a000
        MOVS     R4,R6
        LDR.N    R6,??DataTable16_6  ;; 0x40048038
        LDR      R6,[R6, #+0]
        ORRS     R6,R6,#0x400
        LDR.N    R7,??DataTable16_6  ;; 0x40048038
        STR      R6,[R7, #+0]
        B.N      ??GPIO_Init_1
//  208 		case 3:PTx_BASE_PTR =PTC_BASE_PTR;PORTx_BASE_PTR = PORTC_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;break;
??GPIO_Init_2:
        LDR.N    R6,??DataTable16_9  ;; 0x400ff080
        MOVS     R5,R6
        LDR.N    R6,??DataTable16_10  ;; 0x4004b000
        MOVS     R4,R6
        LDR.N    R6,??DataTable16_6  ;; 0x40048038
        LDR      R6,[R6, #+0]
        ORRS     R6,R6,#0x800
        LDR.N    R7,??DataTable16_6  ;; 0x40048038
        STR      R6,[R7, #+0]
        B.N      ??GPIO_Init_1
//  209 		case 4:PTx_BASE_PTR =PTD_BASE_PTR;PORTx_BASE_PTR = PORTD_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;break;
??GPIO_Init_5:
        LDR.N    R6,??DataTable16_11  ;; 0x400ff0c0
        MOVS     R5,R6
        LDR.N    R6,??DataTable16_12  ;; 0x4004c000
        MOVS     R4,R6
        LDR.N    R6,??DataTable16_6  ;; 0x40048038
        LDR      R6,[R6, #+0]
        ORRS     R6,R6,#0x1000
        LDR.N    R7,??DataTable16_6  ;; 0x40048038
        STR      R6,[R7, #+0]
        B.N      ??GPIO_Init_1
//  210 		case 5:PTx_BASE_PTR =PTE_BASE_PTR;PORTx_BASE_PTR = PORTE_BASE_PTR;SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK;break;
??GPIO_Init_4:
        LDR.N    R6,??DataTable16_13  ;; 0x400ff100
        MOVS     R5,R6
        LDR.N    R6,??DataTable16_14  ;; 0x4004d000
        MOVS     R4,R6
        LDR.N    R6,??DataTable16_6  ;; 0x40048038
        LDR      R6,[R6, #+0]
        ORRS     R6,R6,#0x2000
        LDR.N    R7,??DataTable16_6  ;; 0x40048038
        STR      R6,[R7, #+0]
//  211 	}
//  212 	PORT_PCR_REG(PORTx_BASE_PTR,Pins) &= ~PORT_PCR_LK_MASK;
??GPIO_Init_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R6,[R4, R1, LSL #+2]
        BICS     R6,R6,#0x8000
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R6,[R4, R1, LSL #+2]
//  213 	PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_MUX(0x01) | PORT_PCR_ISF_MASK;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R6,[R4, R1, LSL #+2]
        ORRS     R6,R6,#0x1000100
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R6,[R4, R1, LSL #+2]
//  214 		//复用管脚为GPIO功能, 确定触发模式 ,开启上拉或下拉电阻
//  215 		//不锁住引脚控制寄存器[15:0]
//  216 		//写1清零中断标志位
//  217 	switch(Dir_Data)
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BEQ.N    ??GPIO_Init_6
        BCC.N    ??GPIO_Init_7
        CMP      R2,#+3
        BEQ.N    ??GPIO_Init_8
        BCC.N    ??GPIO_Init_9
        CMP      R2,#+5
        BEQ.N    ??GPIO_Init_10
        BCC.N    ??GPIO_Init_11
        B.N      ??GPIO_Init_7
//  218 	{
//  219 		case 1:
//  220 		{
//  221 			GPIO_PDDR_REG(PTx_BASE_PTR) |= 0x1u<<Pins;		//设置端口方向为输出
??GPIO_Init_6:
        LDR      R6,[R5, #+20]
        MOVS     R7,#+1
        LSLS     R7,R7,R1
        ORRS     R6,R7,R6
        STR      R6,[R5, #+20]
//  222 			GPIO_PSOR_REG(PTx_BASE_PTR) |= 0x1u<<Pins;		//输出高电平
        LDR      R6,[R5, #+4]
        MOVS     R7,#+1
        LSLS     R7,R7,R1
        ORRS     R6,R7,R6
        STR      R6,[R5, #+4]
//  223 			break;
        B.N      ??GPIO_Init_7
//  224 		}
//  225 		case 2:
//  226 		{
//  227 			GPIO_PDDR_REG(PTx_BASE_PTR) |= 0x1u<<Pins;		//设置端口方向为输出
??GPIO_Init_9:
        LDR      R6,[R5, #+20]
        MOVS     R7,#+1
        LSLS     R7,R7,R1
        ORRS     R6,R7,R6
        STR      R6,[R5, #+20]
//  228 			GPIO_PSOR_REG(PTx_BASE_PTR) &= (~0x1u<<Pins);	//输出低电平
        LDR      R6,[R5, #+4]
        MVNS     R7,#+1
        LSLS     R7,R7,R1
        ANDS     R6,R7,R6
        STR      R6,[R5, #+4]
//  229 			break;
        B.N      ??GPIO_Init_7
//  230 		}
//  231 		//输入时配置上下拉是因为要消除悬空态,和区分高低态
//  232 		case 3:
//  233 		{
//  234 			GPIO_PDDR_REG(PTx_BASE_PTR) &= (~0x1u<<Pins);			//设置端口方向为输入
??GPIO_Init_8:
        LDR      R6,[R5, #+20]
        MVNS     R7,#+1
        LSLS     R7,R7,R1
        ANDS     R6,R7,R6
        STR      R6,[R5, #+20]
//  235 			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_IRQC(Irqc);//配置中断类型
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R6,[R4, R1, LSL #+2]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSLS     R7,R3,#+16
        ANDS     R7,R7,#0xF0000
        ORRS     R6,R7,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R6,[R4, R1, LSL #+2]
//  236 			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;//使能上下拉功能,配置上拉
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R6,[R4, R1, LSL #+2]
        ORRS     R6,R6,#0x3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R6,[R4, R1, LSL #+2]
//  237 			break;
        B.N      ??GPIO_Init_7
//  238 		}
//  239 		case 4:
//  240 		{
//  241 			GPIO_PDDR_REG(PTx_BASE_PTR) &= (~0x1u<<Pins);			//设置端口方向为输入
??GPIO_Init_11:
        LDR      R6,[R5, #+20]
        MVNS     R7,#+1
        LSLS     R7,R7,R1
        ANDS     R6,R7,R6
        STR      R6,[R5, #+20]
//  242 			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_IRQC(Irqc);//配置中断类型
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R6,[R4, R1, LSL #+2]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSLS     R7,R3,#+16
        ANDS     R7,R7,#0xF0000
        ORRS     R6,R7,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R6,[R4, R1, LSL #+2]
//  243 			PORT_PCR_REG(PORTx_BASE_PTR,Pins) &= ~PORT_PCR_PS_MASK;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R6,[R4, R1, LSL #+2]
        LSRS     R6,R6,#+1
        LSLS     R6,R6,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R6,[R4, R1, LSL #+2]
//  244 			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_PE_MASK;//使能上下拉功能,配置下拉
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R6,[R4, R1, LSL #+2]
        ORRS     R6,R6,#0x2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R6,[R4, R1, LSL #+2]
//  245 			break;
        B.N      ??GPIO_Init_7
//  246 		}
//  247 		case 5:
//  248 		{
//  249 			GPIO_PDDR_REG(PTx_BASE_PTR) &= (~0x1u<<Pins);			//设置端口方向为输入
??GPIO_Init_10:
        LDR      R6,[R5, #+20]
        MVNS     R7,#+1
        LSLS     R7,R7,R1
        ANDS     R6,R7,R6
        STR      R6,[R5, #+20]
//  250 			PORT_PCR_REG(PORTx_BASE_PTR,Pins) |= PORT_PCR_IRQC(Irqc);//配置中断类型
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R6,[R4, R1, LSL #+2]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSLS     R7,R3,#+16
        ANDS     R7,R7,#0xF0000
        ORRS     R6,R7,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R6,[R4, R1, LSL #+2]
//  251 			PORT_PCR_REG(PORTx_BASE_PTR,Pins) &= ~PORT_PCR_PE_MASK;//禁能上下拉功能
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R6,[R4, R1, LSL #+2]
        BICS     R6,R6,#0x2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R6,[R4, R1, LSL #+2]
//  252 			break;
//  253 		}
//  254 	}
//  255 
//  256 }
??GPIO_Init_7:
        POP      {R4-R7}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     0x40049000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     0x400ff014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_2:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_3:
        DC32     0x400ff010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_4:
        DC32     0x400ff00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_5:
        DC32     0x400490a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_6:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_7:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_8:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_9:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_10:
        DC32     0x4004b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_11:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_12:
        DC32     0x4004c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_13:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_14:
        DC32     0x4004d000

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  257 
//  258 
//  259 
// 
// 1 350 bytes in section .text
// 
// 1 350 bytes of CODE memory
//
//Errors: none
//Warnings: none
