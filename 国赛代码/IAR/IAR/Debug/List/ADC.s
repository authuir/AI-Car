///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:03
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\ADC.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\ADC.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\ADC.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC ADCHardWare_INIT
        PUBLIC ADCHardWare_configure
        PUBLIC ADCINIT_A
        PUBLIC ADC_DIFF_A
        PUBLIC ADC_Disable_A
        PUBLIC ADC_Enable
        PUBLIC ADC_S_A
        PUBLIC ADC_Speed
        PUBLIC ADC_VALUE_A
        PUBLIC ADC_channal
        PUBLIC HardWare_ave
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\ADC.c
//    1 #include "all.h"
//    2 //*************************************
//    3 //简介：使能ADC时钟
//    4 //参数：ADC_NUM：ADC0~3
//    5 //*************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function ADC_Enable
          CFI NoCalls
        THUMB
//    6 void ADC_Enable(uint32 ADC_NUM)
//    7  {
//    8      switch(ADC_NUM)
ADC_Enable:
        MOVS     R1,R0
        CMP      R1,#+0
        BEQ.N    ??ADC_Enable_0
        CMP      R1,#+1
        BEQ.N    ??ADC_Enable_1
        CMP      R1,#+128
        BEQ.N    ??ADC_Enable_2
        CMP      R1,#+129
        BEQ.N    ??ADC_Enable_3
        B.N      ??ADC_Enable_4
//    9       {
//   10       case ADC0:SIM_SCGC6|=SIM_SCGC6_ADC0_MASK;break;
??ADC_Enable_0:
        LDR.W    R1,??DataTable10  ;; 0x4004803c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x8000000
        LDR.W    R2,??DataTable10  ;; 0x4004803c
        STR      R1,[R2, #+0]
        B.N      ??ADC_Enable_4
//   11       case ADC1:SIM_SCGC3|=SIM_SCGC3_ADC1_MASK;break;
??ADC_Enable_2:
        LDR.W    R1,??DataTable10_1  ;; 0x40048030
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x8000000
        LDR.W    R2,??DataTable10_1  ;; 0x40048030
        STR      R1,[R2, #+0]
        B.N      ??ADC_Enable_4
//   12       case ADC2:SIM_SCGC6|=SIM_SCGC6_ADC2_MASK;break;
??ADC_Enable_1:
        LDR.W    R1,??DataTable10  ;; 0x4004803c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10000000
        LDR.W    R2,??DataTable10  ;; 0x4004803c
        STR      R1,[R2, #+0]
        B.N      ??ADC_Enable_4
//   13       case ADC3:SIM_SCGC3|=SIM_SCGC3_ADC3_MASK;break;
??ADC_Enable_3:
        LDR.W    R1,??DataTable10_1  ;; 0x40048030
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10000000
        LDR.W    R2,??DataTable10_1  ;; 0x40048030
        STR      R1,[R2, #+0]
//   14       }
//   15  }
??ADC_Enable_4:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   16 //******************************************************************
//   17 //在ADC使能后配置引脚，自己写，比如 PORTB  17配置成复用功能3
//   18 //则：PORTB_PCR15|=PORT_PCR_MUX(3);
//   19 //或者使用已有函数，PORT_Configure,不过一般端口引脚默认为AD采样模式，可以不用设置
//   20 //特殊的需要设置
//   21 //******************************************************************
//   22 
//   23 //******************************************************************
//   24 //函数简介：ADC软件触发,默认为软件触发，直接用ADCINIT_A函数
//   25 //          软件触发方式
//   26 //参数：ADC_NUM:ADC0~3
//   27 //      channel:0-24
//   28 //      accuracy:bite_8~16
//   29 //********************************************************************
//   30 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function ADCINIT_A
          CFI NoCalls
        THUMB
//   31 void ADCINIT_A(uint32 ADC_NUM,uint32 mux_channel,uint8 channal,uint8 accuracy)
//   32  {
ADCINIT_A:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//   33      HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))&=~ADC_SC1_ADCH_MASK;
        MOV      R4,#+4096
        LDR.W    R5,??DataTable10_2  ;; 0x4003b000
        MLA      R4,R4,R0,R5
        LDR      R4,[R4, #+0]
        LSRS     R4,R4,#+5
        LSLS     R4,R4,#+5
        MOV      R5,#+4096
        LDR.W    R6,??DataTable10_2  ;; 0x4003b000
        MLA      R5,R5,R0,R6
        STR      R4,[R5, #+0]
//   34      //HWREG(ADC_CFG1_BASE +ADC_NUM*(0X1000))|=ADC_CFG1_ADIV(0)|ADC_CFG1_ADICLK(0);
//   35      //默认采用BUS_CLOCK和00分频
//   36      HWREG(ADC_CFG1_BASE +ADC_NUM*(0X1000))|=ADC_CFG1_MODE(accuracy)|ADC_CFG1_ADLSMP_MASK;//精度选择以及长时间采样保证精度
        MOV      R4,#+4096
        LDR.W    R5,??DataTable10_3  ;; 0x4003b008
        MLA      R4,R4,R0,R5
        LDR      R4,[R4, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSLS     R5,R3,#+2
        ANDS     R5,R5,#0xC
        ORRS     R5,R5,#0x10
        ORRS     R4,R5,R4
        MOV      R5,#+4096
        LDR.W    R6,??DataTable10_3  ;; 0x4003b008
        MLA      R5,R5,R0,R6
        STR      R4,[R5, #+0]
//   37      HWREG(ADC_CFG1_BASE+ADC_NUM*(0X1000))|=ADC_CFG1_ADICLK(2);
        MOV      R4,#+4096
        LDR.W    R5,??DataTable10_3  ;; 0x4003b008
        MLA      R4,R4,R0,R5
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x2
        MOV      R5,#+4096
        LDR.N    R6,??DataTable10_3  ;; 0x4003b008
        MLA      R5,R5,R0,R6
        STR      R4,[R5, #+0]
//   38      HWREG(ADC_CFG2_BASE+ADC_NUM*(0X1000))|=mux_channel<<4;
        MOV      R4,#+4096
        LDR.N    R5,??DataTable10_4  ;; 0x4003b00c
        MLA      R4,R4,R0,R5
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,R1, LSL #+4
        MOV      R5,#+4096
        LDR.N    R6,??DataTable10_4  ;; 0x4003b00c
        MLA      R5,R5,R0,R6
        STR      R4,[R5, #+0]
//   39      HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))|=ADC_SC1_ADCH(channal);
        MOV      R4,#+4096
        LDR.N    R5,??DataTable10_2  ;; 0x4003b000
        MLA      R4,R4,R0,R5
        LDR      R4,[R4, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ANDS     R5,R2,#0x1F
        ORRS     R4,R5,R4
        MOV      R5,#+4096
        LDR.N    R6,??DataTable10_2  ;; 0x4003b000
        MLA      R5,R5,R0,R6
        STR      R4,[R5, #+0]
//   40  }
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function ADC_channal
          CFI NoCalls
        THUMB
//   41 void ADC_channal(uint32 ADC_NUM,uint8 channal)
//   42  {
ADC_channal:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//   43      HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))|=ADC_SC1_ADCH(channal);
        MOV      R2,#+4096
        LDR.N    R3,??DataTable10_2  ;; 0x4003b000
        MLA      R2,R2,R0,R3
        LDR      R2,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R3,R1,#0x1F
        ORRS     R2,R3,R2
        MOV      R3,#+4096
        LDR.N    R4,??DataTable10_2  ;; 0x4003b000
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//   44  }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//   45 //返回ADC状态值

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function ADC_S_A
          CFI NoCalls
        THUMB
//   46 uint8 ADC_S_A(uint32 ADC_NUM)
//   47  {
//   48      return (uint8)((HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))>>7)&(0X01));
ADC_S_A:
        MOV      R1,#+4096
        LDR.N    R2,??DataTable10_2  ;; 0x4003b000
        MLA      R0,R1,R0,R2
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+7,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//   49  }
//   50 //取ADC_A转换后的值

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function ADC_VALUE_A
          CFI NoCalls
        THUMB
//   51 void ADC_VALUE_A(uint32 ADC_NUM,uint16 *value)
//   52  {
ADC_VALUE_A:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//   53      *value=HWREG(ADC_RA_BASE+ADC_NUM*(0X1000));
        MOV      R2,#+4096
        LDR.N    R3,??DataTable10_5  ;; 0x4003b010
        MLA      R2,R2,R0,R3
        LDR      R2,[R2, #+0]
        STRH     R2,[R1, #+0]
//   54       HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))&=~(ADC_SC1_COCO_MASK);
        MOV      R2,#+4096
        LDR.N    R3,??DataTable10_2  ;; 0x4003b000
        MLA      R2,R2,R0,R3
        LDR      R2,[R2, #+0]
        BICS     R2,R2,#0x80
        MOV      R3,#+4096
        LDR.N    R4,??DataTable10_2  ;; 0x4003b000
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//   55      //清除标志 
//   56  }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//   57 
//   58 //***************************************************************
//   59 //关闭ADC，选择通道11111关闭

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function ADC_Disable_A
          CFI NoCalls
        THUMB
//   60 void ADC_Disable_A(uint32 ADC_NUM)
//   61  {
//   62      HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))|=ADC_SC1_ADCH_MASK;
ADC_Disable_A:
        MOV      R1,#+4096
        LDR.N    R2,??DataTable10_2  ;; 0x4003b000
        MLA      R1,R1,R0,R2
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1F
        MOV      R2,#+4096
        LDR.N    R3,??DataTable10_2  ;; 0x4003b000
        MLA      R2,R2,R0,R3
        STR      R1,[R2, #+0]
//   63  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//   64 
//   65 //***************************************************************
//   66 
//   67 //****************************************************************
//   68 //简介：硬件平均功能,测试：若采用软件触发，使用此功能或者连续转换，效果会变差，数据不稳定
//   69 //      软件触发建议采用单次触发模式
//   70 //参数：ADC_NUM:ADC0~3
//   71 //      samples_num:sample_4，sample_8,sample_16,sample_32
//   72 //****************************************************************
//   73 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function HardWare_ave
          CFI NoCalls
        THUMB
//   74 void HardWare_ave(uint32 ADC_NUM,char samples_num)
//   75  {
HardWare_ave:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//   76      HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=ADC_SC3_AVGE_MASK;
        MOV      R2,#+4096
        LDR.N    R3,??DataTable10_6  ;; 0x4003b024
        MLA      R2,R2,R0,R3
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x4
        MOV      R3,#+4096
        LDR.N    R4,??DataTable10_6  ;; 0x4003b024
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//   77      HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=(uint32)samples_num;
        MOV      R2,#+4096
        LDR.N    R3,??DataTable10_6  ;; 0x4003b024
        MLA      R2,R2,R0,R3
        LDR      R2,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R1,R2
        MOV      R3,#+4096
        LDR.N    R4,??DataTable10_6  ;; 0x4003b024
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//   78  }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//   79 
//   80 //****************************************************************
//   81 //简介：配置硬件触发AD时钟
//   82 //参数：ADC_NUM:ADC0~3
//   83 //      triggle_mode：PDB_Trigger，Alternate_Trigger
//   84 //      Pre_trigger：Pre_A，Pre_B
//   85 //      trigger_select:可以配置成PIT ,FTM等，
//   86 //      具体看ADC.h定义,只有Alternate_Trigger模式才有用
//   87 //***************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function ADCHardWare_INIT
          CFI NoCalls
        THUMB
//   88 void ADCHardWare_INIT(uint32 ADC_NUM,char trigger_mode,char Pre_trigger,uint32 trigger_select)
//   89  {
ADCHardWare_INIT:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//   90      HWREG(ADC_CFG1_BASE+ADC_NUM*(0X1000))|=ADC_CFG1_ADICLK(2);
        MOV      R4,#+4096
        LDR.N    R5,??DataTable10_3  ;; 0x4003b008
        MLA      R4,R4,R0,R5
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x2
        MOV      R5,#+4096
        LDR.N    R6,??DataTable10_3  ;; 0x4003b008
        MLA      R5,R5,R0,R6
        STR      R4,[R5, #+0]
//   91      switch(ADC_NUM)
        MOVS     R4,R0
        CMP      R4,#+0
        BEQ.N    ??ADCHardWare_INIT_0
        CMP      R4,#+1
        BEQ.N    ??ADCHardWare_INIT_1
        CMP      R4,#+128
        BEQ.N    ??ADCHardWare_INIT_2
        CMP      R4,#+129
        BEQ.N    ??ADCHardWare_INIT_3
        B.N      ??ADCHardWare_INIT_4
//   92       {
//   93       case ADC0:    if(trigger_mode) SIM_SOPT7|=SIM_SOPT7_ADC0ALTTRGEN_MASK;
??ADCHardWare_INIT_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADCHardWare_INIT_5
        LDR.N    R4,??DataTable10_7  ;; 0x40048018
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x80
        LDR.N    R5,??DataTable10_7  ;; 0x40048018
        STR      R4,[R5, #+0]
//   94                     if(Pre_trigger) SIM_SOPT7|=SIM_SOPT7_ADC0PRETRGSEL_MASK;
??ADCHardWare_INIT_5:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??ADCHardWare_INIT_6
        LDR.N    R4,??DataTable10_7  ;; 0x40048018
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x10
        LDR.N    R5,??DataTable10_7  ;; 0x40048018
        STR      R4,[R5, #+0]
//   95                     SIM_SOPT7|=trigger_select;break;
??ADCHardWare_INIT_6:
        LDR.N    R4,??DataTable10_7  ;; 0x40048018
        LDR      R4,[R4, #+0]
        ORRS     R4,R3,R4
        LDR.N    R5,??DataTable10_7  ;; 0x40048018
        STR      R4,[R5, #+0]
        B.N      ??ADCHardWare_INIT_4
//   96       case ADC1:    if(trigger_mode) SIM_SOPT7|=SIM_SOPT7_ADC1ALTTRGEN_MASK;
??ADCHardWare_INIT_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADCHardWare_INIT_7
        LDR.N    R4,??DataTable10_7  ;; 0x40048018
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x8000
        LDR.N    R5,??DataTable10_7  ;; 0x40048018
        STR      R4,[R5, #+0]
//   97                     if(Pre_trigger) SIM_SOPT7|=SIM_SOPT7_ADC1PRETRGSEL_MASK;
??ADCHardWare_INIT_7:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??ADCHardWare_INIT_8
        LDR.N    R4,??DataTable10_7  ;; 0x40048018
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x1000
        LDR.N    R5,??DataTable10_7  ;; 0x40048018
        STR      R4,[R5, #+0]
//   98                     SIM_SOPT7|=trigger_select<<8;break;
??ADCHardWare_INIT_8:
        LDR.N    R4,??DataTable10_7  ;; 0x40048018
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,R3, LSL #+8
        LDR.N    R5,??DataTable10_7  ;; 0x40048018
        STR      R4,[R5, #+0]
        B.N      ??ADCHardWare_INIT_4
//   99       case ADC2:    if(trigger_mode) SIM_SOPT7|=SIM_SOPT7_ADC2ALTTRGEN_MASK;
??ADCHardWare_INIT_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADCHardWare_INIT_9
        LDR.N    R4,??DataTable10_7  ;; 0x40048018
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x800000
        LDR.N    R5,??DataTable10_7  ;; 0x40048018
        STR      R4,[R5, #+0]
//  100                     if(Pre_trigger) SIM_SOPT7|=SIM_SOPT7_ADC2PRETRGSEL_MASK;
??ADCHardWare_INIT_9:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??ADCHardWare_INIT_10
        LDR.N    R4,??DataTable10_7  ;; 0x40048018
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x100000
        LDR.N    R5,??DataTable10_7  ;; 0x40048018
        STR      R4,[R5, #+0]
//  101                     SIM_SOPT7|=trigger_select<<16;break;
??ADCHardWare_INIT_10:
        LDR.N    R4,??DataTable10_7  ;; 0x40048018
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,R3, LSL #+16
        LDR.N    R5,??DataTable10_7  ;; 0x40048018
        STR      R4,[R5, #+0]
        B.N      ??ADCHardWare_INIT_4
//  102       case ADC3:    if(trigger_mode) SIM_SOPT7|=SIM_SOPT7_ADC3ALTTRGEN_MASK;
??ADCHardWare_INIT_3:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADCHardWare_INIT_11
        LDR.N    R4,??DataTable10_7  ;; 0x40048018
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x80000000
        LDR.N    R5,??DataTable10_7  ;; 0x40048018
        STR      R4,[R5, #+0]
//  103                     if(Pre_trigger) SIM_SOPT7|=SIM_SOPT7_ADC3PRETRGSEL_MASK;
??ADCHardWare_INIT_11:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??ADCHardWare_INIT_12
        LDR.N    R4,??DataTable10_7  ;; 0x40048018
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x10000000
        LDR.N    R5,??DataTable10_7  ;; 0x40048018
        STR      R4,[R5, #+0]
//  104                     SIM_SOPT7|=trigger_select<<24;break;
??ADCHardWare_INIT_12:
        LDR.N    R4,??DataTable10_7  ;; 0x40048018
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,R3, LSL #+24
        LDR.N    R5,??DataTable10_7  ;; 0x40048018
        STR      R4,[R5, #+0]
//  105       }
//  106      HWREG(ADC_SC2_BASE+ADC_NUM*(0X1000))|=ADC_SC2_ADTRG_MASK;//设置成硬件触发
??ADCHardWare_INIT_4:
        MOV      R4,#+4096
        LDR.N    R5,??DataTable10_8  ;; 0x4003b020
        MLA      R4,R4,R0,R5
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x40
        MOV      R5,#+4096
        LDR.N    R6,??DataTable10_8  ;; 0x4003b020
        MLA      R5,R5,R0,R6
        STR      R4,[R5, #+0]
//  107  }
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  108 //***************************************************************
//  109 //硬件触发设置：
//  110 //trigger_mode:选择Trigger_once，Trigger_always
//  111 //sample_ave：Sample_4，Sample_8，Sample_16，Sample_32
//  112 //***************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function ADCHardWare_configure
          CFI NoCalls
        THUMB
//  113 void ADCHardWare_configure(uint32 ADC_NUM,uint32 trigger_mode,char sample_ave)
//  114  {
ADCHardWare_configure:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  115      HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=ADC_SC3_AVGE_MASK;
        MOV      R3,#+4096
        LDR.N    R4,??DataTable10_6  ;; 0x4003b024
        MLA      R3,R3,R0,R4
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x4
        MOV      R4,#+4096
        LDR.N    R5,??DataTable10_6  ;; 0x4003b024
        MLA      R4,R4,R0,R5
        STR      R3,[R4, #+0]
//  116      if(trigger_mode) 
        CMP      R1,#+0
        BEQ.N    ??ADCHardWare_configure_0
//  117           HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=ADC_SC3_ADCO_MASK;
        MOV      R3,#+4096
        LDR.N    R4,??DataTable10_6  ;; 0x4003b024
        MLA      R3,R3,R0,R4
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x8
        MOV      R4,#+4096
        LDR.N    R5,??DataTable10_6  ;; 0x4003b024
        MLA      R4,R4,R0,R5
        STR      R3,[R4, #+0]
//  118      HWREG(ADC_SC3_BASE+ADC_NUM*(0X1000))|=sample_ave;
??ADCHardWare_configure_0:
        MOV      R3,#+4096
        LDR.N    R4,??DataTable10_6  ;; 0x4003b024
        MLA      R3,R3,R0,R4
        LDR      R3,[R3, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ORRS     R3,R2,R3
        MOV      R4,#+4096
        LDR.N    R5,??DataTable10_6  ;; 0x4003b024
        MLA      R4,R4,R0,R5
        STR      R3,[R4, #+0]
//  119  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  120 //****************************************************************************
//  121 //设置ADC转换速度和长采样时间
//  122 //参数：
//  123 //      speed:HIGH_SPEED,NORMAL_SPEED
//  124 //      sample_time:ADCK_24,ADCK_16,ADCK_10,ADCK_6
//  125 //****************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function ADC_Speed
          CFI NoCalls
        THUMB
//  126 void ADC_Speed(uint32 ADC_NUM,char speed,char sample_time)
//  127  {
ADC_Speed:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  128      HWREG(ADC_CFG2_BASE +ADC_NUM*(0X1000))&=~(ADC_CFG2_ADHSC_MASK|ADC_CFG2_ADLSTS_MASK);
        MOV      R3,#+4096
        LDR.N    R4,??DataTable10_4  ;; 0x4003b00c
        MLA      R3,R3,R0,R4
        LDR      R3,[R3, #+0]
        LSRS     R3,R3,#+3
        LSLS     R3,R3,#+3
        MOV      R4,#+4096
        LDR.N    R5,??DataTable10_4  ;; 0x4003b00c
        MLA      R4,R4,R0,R5
        STR      R3,[R4, #+0]
//  129      HWREG(ADC_CFG2_BASE +ADC_NUM*(0X1000))|=(uint32)((speed<<2)|(sample_time));
        MOV      R3,#+4096
        LDR.N    R4,??DataTable10_4  ;; 0x4003b00c
        MLA      R3,R3,R0,R4
        LDR      R3,[R3, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ORRS     R4,R2,R1, LSL #+2
        ORRS     R3,R4,R3
        MOV      R4,#+4096
        LDR.N    R5,??DataTable10_4  ;; 0x4003b00c
        MLA      R4,R4,R0,R5
        STR      R3,[R4, #+0]
//  130  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  131 
//  132 //*****************************************************************************
//  133 //简介：差分模式AD采样,只采用A,长采样时间
//  134 //参数：channel:DAD0~4
//  135 //      accuracy:bite9  11  13  16
//  136 //*************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function ADC_DIFF_A
          CFI NoCalls
        THUMB
//  137 void ADC_DIFF_A(uint32 ADC_NUM,uint32 channel,char accuracy)
//  138  {
ADC_DIFF_A:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  139      HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))&=~ADC_SC1_ADCH_MASK;
        MOV      R3,#+4096
        LDR.N    R4,??DataTable10_2  ;; 0x4003b000
        MLA      R3,R3,R0,R4
        LDR      R3,[R3, #+0]
        LSRS     R3,R3,#+5
        LSLS     R3,R3,#+5
        MOV      R4,#+4096
        LDR.N    R5,??DataTable10_2  ;; 0x4003b000
        MLA      R4,R4,R0,R5
        STR      R3,[R4, #+0]
//  140      HWREG(ADC_CFG1_BASE+ADC_NUM*(0X1000))|=ADC_CFG1_ADLSMP_MASK|ADC_CFG1_MODE(accuracy);
        MOV      R3,#+4096
        LDR.N    R4,??DataTable10_3  ;; 0x4003b008
        MLA      R3,R3,R0,R4
        LDR      R3,[R3, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R4,R2,#+2
        ANDS     R4,R4,#0xC
        ORRS     R4,R4,#0x10
        ORRS     R3,R4,R3
        MOV      R4,#+4096
        LDR.N    R5,??DataTable10_3  ;; 0x4003b008
        MLA      R4,R4,R0,R5
        STR      R3,[R4, #+0]
//  141      HWREG(ADC_SC1A_BASE+ADC_NUM*(0X1000))|=ADC_SC1_DIFF_MASK|ADC_SC1_ADCH(channel);
        MOV      R3,#+4096
        LDR.N    R4,??DataTable10_2  ;; 0x4003b000
        MLA      R3,R3,R0,R4
        LDR      R3,[R3, #+0]
        ANDS     R4,R1,#0x1F
        ORRS     R4,R4,#0x20
        ORRS     R3,R4,R3
        MOV      R4,#+4096
        LDR.N    R5,??DataTable10_2  ;; 0x4003b000
        MLA      R4,R4,R0,R5
        STR      R3,[R4, #+0]
//  142  }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x4003b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     0x4003b008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     0x4003b00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     0x4003b010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     0x4003b024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     0x40048018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     0x4003b020

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
// 1 042 bytes in section .text
// 
// 1 042 bytes of CODE memory
//
//Errors: none
//Warnings: none
