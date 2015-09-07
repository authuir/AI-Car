///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:08
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\INT.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\INT.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\INT.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC Disable_IRQ
        PUBLIC Enable_IRQ
        PUBLIC SET_IRQ_PRIOR
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\INT.c
//    1 #include "all.h"
//    2 //********************************************************
//    3 //函数名：void Enable_IRQ(int IRQ_NUM)
//    4 //参数：IRQ_NUM,中断向量号
//    5 //简介：使能某一中断
//    6 //********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function Enable_IRQ
          CFI NoCalls
        THUMB
//    7 void Enable_IRQ(int IRQ_NUM)
//    8  {
Enable_IRQ:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//    9     int DIV;
//   10     if(IRQ_NUM>121) IRQ_NUM=121;//确定IRQ号是否有效
        CMP      R0,#+122
        BLT.N    ??Enable_IRQ_0
        MOVS     R2,#+121
        MOVS     R0,R2
//   11     DIV=(IRQ_NUM-16)/32;//确定NVIC中断控制寄存器组号（0，1，2，3）
??Enable_IRQ_0:
        SUBS     R2,R0,#+16
        MOVS     R3,#+32
        SDIV     R2,R2,R3
        MOVS     R1,R2
//   12     switch(DIV)
        CMP      R1,#+0
        BEQ.N    ??Enable_IRQ_1
        CMP      R1,#+2
        BEQ.N    ??Enable_IRQ_2
        BCC.N    ??Enable_IRQ_3
        CMP      R1,#+3
        BEQ.N    ??Enable_IRQ_4
        B.N      ??Enable_IRQ_5
//   13      {
//   14          case 0:{
//   15          NVICICPR0=1<<((IRQ_NUM-16)%32);//设置中断挂起清除寄存器
??Enable_IRQ_1:
        MOVS     R2,#+1
        SUBS     R3,R0,#+16
        MOVS     R4,#+32
        SDIV     R5,R3,R4
        MLS      R5,R5,R4,R3
        LSLS     R2,R2,R5
        LDR.N    R3,??DataTable1  ;; 0xe000e280
        STR      R2,[R3, #+0]
//   16          NVICISER0=1<<((IRQ_NUM-16)%32);//置位中断使能设置寄存器
        MOVS     R2,#+1
        SUBS     R3,R0,#+16
        MOVS     R4,#+32
        SDIV     R5,R3,R4
        MLS      R5,R5,R4,R3
        LSLS     R2,R2,R5
        LDR.N    R3,??DataTable1_1  ;; 0xe000e100
        STR      R2,[R3, #+0]
//   17          break;
        B.N      ??Enable_IRQ_5
//   18      }
//   19      case 1:{
//   20          NVICICPR1=1<<((IRQ_NUM-16)%32);//设置中断挂起清除寄存器
??Enable_IRQ_3:
        MOVS     R2,#+1
        SUBS     R3,R0,#+16
        MOVS     R4,#+32
        SDIV     R5,R3,R4
        MLS      R5,R5,R4,R3
        LSLS     R2,R2,R5
        LDR.N    R3,??DataTable1_2  ;; 0xe000e284
        STR      R2,[R3, #+0]
//   21          NVICISER1=1<<((IRQ_NUM-16)%32);//置位中断使能设置寄存器
        MOVS     R2,#+1
        SUBS     R3,R0,#+16
        MOVS     R4,#+32
        SDIV     R5,R3,R4
        MLS      R5,R5,R4,R3
        LSLS     R2,R2,R5
        LDR.N    R3,??DataTable1_3  ;; 0xe000e104
        STR      R2,[R3, #+0]
//   22          break;
        B.N      ??Enable_IRQ_5
//   23      }
//   24      case 2:{
//   25          NVICICPR2=1<<((IRQ_NUM-16)%32);//设置中断挂起清除寄存器
??Enable_IRQ_2:
        MOVS     R2,#+1
        SUBS     R3,R0,#+16
        MOVS     R4,#+32
        SDIV     R5,R3,R4
        MLS      R5,R5,R4,R3
        LSLS     R2,R2,R5
        LDR.N    R3,??DataTable1_4  ;; 0xe000e288
        STR      R2,[R3, #+0]
//   26          NVICISER2=1<<((IRQ_NUM-16)%32);//置位中断使能设置寄存器
        MOVS     R2,#+1
        SUBS     R3,R0,#+16
        MOVS     R4,#+32
        SDIV     R5,R3,R4
        MLS      R5,R5,R4,R3
        LSLS     R2,R2,R5
        LDR.N    R3,??DataTable1_5  ;; 0xe000e108
        STR      R2,[R3, #+0]
//   27          break;
        B.N      ??Enable_IRQ_5
//   28      }
//   29      case 0x3:{
//   30          NVICICPR3=1<<((IRQ_NUM-16)%32);//设置中断挂起清除寄存器
??Enable_IRQ_4:
        MOVS     R2,#+1
        SUBS     R3,R0,#+16
        MOVS     R4,#+32
        SDIV     R5,R3,R4
        MLS      R5,R5,R4,R3
        LSLS     R2,R2,R5
        LDR.N    R3,??DataTable1_6  ;; 0xe000e28c
        STR      R2,[R3, #+0]
//   31          NVICISER3=1<<((IRQ_NUM-16)%32);//置位中断使能设置寄存器
        MOVS     R2,#+1
        SUBS     R3,R0,#+16
        MOVS     R4,#+32
        SDIV     R5,R3,R4
        MLS      R5,R5,R4,R3
        LSLS     R2,R2,R5
        LDR.N    R3,??DataTable1_7  ;; 0xe000e10c
        STR      R2,[R3, #+0]
//   32          break;
//   33      }
//   34      }
//   35  }
??Enable_IRQ_5:
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   36 
//   37 //********************************************************
//   38 //函数名：void Disable_IRQ(int IRQ_NUM)
//   39 //参数：IRQ_NUM,中断向量号
//   40 //简介：去掉使能某一中断
//   41 //********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function Disable_IRQ
          CFI NoCalls
        THUMB
//   42 void Disable_IRQ(int IRQ_NUM)
//   43  {
Disable_IRQ:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   44     int DIV;
//   45     if(IRQ_NUM>121) IRQ_NUM=121;//确定IRQ号是否有效
        CMP      R0,#+122
        BLT.N    ??Disable_IRQ_0
        MOVS     R2,#+121
        MOVS     R0,R2
//   46     DIV=(IRQ_NUM-16)/32;
??Disable_IRQ_0:
        SUBS     R2,R0,#+16
        MOVS     R3,#+32
        SDIV     R2,R2,R3
        MOVS     R1,R2
//   47     switch(DIV)
        CMP      R1,#+0
        BEQ.N    ??Disable_IRQ_1
        CMP      R1,#+2
        BEQ.N    ??Disable_IRQ_2
        BCC.N    ??Disable_IRQ_3
        CMP      R1,#+3
        BEQ.N    ??Disable_IRQ_4
        B.N      ??Disable_IRQ_5
//   48      {
//   49      case 0x0:
//   50             NVICICER0=1<<((IRQ_NUM-16)%32);//置位中断使能清除寄存器
??Disable_IRQ_1:
        MOVS     R2,#+1
        SUBS     R3,R0,#+16
        MOVS     R4,#+32
        SDIV     R5,R3,R4
        MLS      R5,R5,R4,R3
        LSLS     R2,R2,R5
        LDR.N    R3,??DataTable1_8  ;; 0xe000e180
        STR      R2,[R3, #+0]
//   51             break;
        B.N      ??Disable_IRQ_5
//   52      case 0x1:
//   53             NVICICER1=1<<((IRQ_NUM-16)%32);//置位中断使能清除寄存器
??Disable_IRQ_3:
        MOVS     R2,#+1
        SUBS     R3,R0,#+16
        MOVS     R4,#+32
        SDIV     R5,R3,R4
        MLS      R5,R5,R4,R3
        LSLS     R2,R2,R5
        LDR.N    R3,??DataTable1_9  ;; 0xe000e184
        STR      R2,[R3, #+0]
//   54             break;
        B.N      ??Disable_IRQ_5
//   55      case 0x2:
//   56             NVICICER2=1<<((IRQ_NUM-16)%32);//置位中断使能清除寄存器
??Disable_IRQ_2:
        MOVS     R2,#+1
        SUBS     R3,R0,#+16
        MOVS     R4,#+32
        SDIV     R5,R3,R4
        MLS      R5,R5,R4,R3
        LSLS     R2,R2,R5
        LDR.N    R3,??DataTable1_10  ;; 0xe000e188
        STR      R2,[R3, #+0]
//   57             break;
        B.N      ??Disable_IRQ_5
//   58      case 0x3:
//   59             NVICICER3=1<<((IRQ_NUM-16)%32);//置位中断使能清除寄存器
??Disable_IRQ_4:
        MOVS     R2,#+1
        SUBS     R3,R0,#+16
        MOVS     R4,#+32
        SDIV     R5,R3,R4
        MLS      R5,R5,R4,R3
        LSLS     R2,R2,R5
        LDR.N    R3,??DataTable1_11  ;; 0xe000e18c
        STR      R2,[R3, #+0]
//   60             break;
//   61      }
//   62  }
??Disable_IRQ_5:
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
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0xe000e284

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0xe000e104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0xe000e288

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0xe000e108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0xe000e28c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     0xe000e10c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     0xe000e184

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     0xe000e188

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     0xe000e18c
//   63 
//   64 //******************************************************************
//   65 //函数名称：void SET_IRQ_PRIOR(INT IRQ_NUM,INT IRQ_PRIOR);
//   66 //参数：IRQ_NUM中断向量号    IRQ_PRIOR:优先级设定  0-16
//   67 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SET_IRQ_PRIOR
          CFI NoCalls
        THUMB
//   68 void SET_IRQ_PRIOR(int IRQ_NUM,int IRQ_PRIOR)
//   69  {
SET_IRQ_PRIOR:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//   70     uint32 *prio_reg;//设定IRQ优先级指针
//   71      if(IRQ_NUM>121) IRQ_NUM=121;//确定IRQ号是否有效
        CMP      R0,#+122
        BLT.N    ??SET_IRQ_PRIOR_0
        MOVS     R3,#+121
        MOVS     R0,R3
//   72      if(IRQ_PRIOR>15) IRQ_PRIOR=15;//确定优先级是否在范围内，共16个优先级
??SET_IRQ_PRIOR_0:
        CMP      R1,#+16
        BLT.N    ??SET_IRQ_PRIOR_1
        MOVS     R3,#+15
        MOVS     R1,R3
//   73      prio_reg=(uint32 *)(((uint32)&NVICIP0)+4*((IRQ_NUM-16)/4));//设置IRQ对应的NVICX
??SET_IRQ_PRIOR_1:
        SUBS     R3,R0,#+16
        MOVS     R4,#+4
        SDIV     R3,R3,R4
        LSLS     R3,R3,#+2
        ADD      R3,R3,#-536870912
        ADDS     R3,R3,#+58368
        MOVS     R2,R3
//   74      *prio_reg=((IRQ_PRIOR&0X0F)<<(8*((IRQ_NUM-16)%4)+4));
        ANDS     R3,R1,#0xF
        SUBS     R4,R0,#+16
        MOVS     R5,#+4
        SDIV     R6,R4,R5
        MLS      R6,R6,R5,R4
        LSLS     R4,R6,#+3
        ADDS     R4,R4,#+4
        LSLS     R3,R3,R4
        STR      R3,[R2, #+0]
//   75  }
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   76 
//   77 
//   78 
//   79 
//   80 
//   81 
//   82 
//   83 
//   84 
// 
// 478 bytes in section .text
// 
// 478 bytes of CODE memory
//
//Errors: none
//Warnings: none
