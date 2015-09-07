///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:06
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\DMA.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\DMA.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\DMA.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN Enable_IRQ

        PUBLIC DMAMUXx_BASE_PTR
        PUBLIC DMA_AutoClose_Disable
        PUBLIC DMA_AutoClose_Enable
        PUBLIC DMA_Channal_Disable
        PUBLIC DMA_Channal_Enable
        PUBLIC DMA_Clear_Int
        PUBLIC DMA_Debug_Disable
        PUBLIC DMA_Debug_Enable
        PUBLIC DMA_Destination
        PUBLIC DMA_Destination_new
        PUBLIC DMA_Disable
        PUBLIC DMA_Disable_new
        PUBLIC DMA_Enable
        PUBLIC DMA_Enable_new
        PUBLIC DMA_Get_Channel_Priority
        PUBLIC DMA_Get_Group_Priority
        PUBLIC DMA_Init
        PUBLIC DMA_Init_new
        PUBLIC DMA_Int_Disable
        PUBLIC DMA_Int_Enable
        PUBLIC DMA_Major_Loop_Num
        PUBLIC DMA_Minor_Bytes
        PUBLIC DMA_SetDestAddress
        PUBLIC DMA_SetSourceAddress
        PUBLIC DMA_Set_Channel_Priority
        PUBLIC DMA_Set_Group_Priority
        PUBLIC DMA_Software_Initiate
        PUBLIC DMA_Source
        PUBLIC DMA_Source_new
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\DMA.c
//    1 #include "all.h"
//    2 
//    3 //默认为固定优先级模式,Fixed Priority Mode
//    4 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    5 DMAMUX_MemMapPtr DMAMUXx_BASE_PTR[2] = {DMAMUX0_BASE_PTR, DMAMUX1_BASE_PTR}; 
DMAMUXx_BASE_PTR:
        DATA
        DC32 40021000H, 40022000H
//    6 
//    7 //CDNE位.NOTE: This bit must be cleared to write the MAJORELINK or ESG bits.
//    8 //DMA_CDNE |= DMA_CDNE_CDNE(DMA_CH1);
//    9 
//   10 //清除中断标志位
//   11 //用于中断服务函数的第一句

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function DMA_Clear_Int
          CFI NoCalls
        THUMB
//   12 void DMA_Clear_Int(uint8 CHx)
//   13 {
//   14 	DMA_INT |= (1<<CHx);
DMA_Clear_Int:
        LDR.W    R1,??DataTable21  ;; 0x40008024
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        ORRS     R1,R2,R1
        LDR.W    R2,??DataTable21  ;; 0x40008024
        STR      R1,[R2, #+0]
//   15 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   16 
//   17 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function DMA_Init_new
          CFI NoCalls
        THUMB
//   18 void DMA_Init_new(uint8 DMAMUXx, uint8 CHx, uint8 TriggerSource,uint16 majorLoop,uint16 minorLoop,uint8 TrggerSourceMode)
//   19  {
DMA_Init_new:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        LDR      R4,[SP, #+20]
        LDR      R5,[SP, #+24]
//   20      SIM_SCGC6 |= (SIM_SCGC6_DMAMUX0_MASK + DMAMUXx);	//使能DMA通道多路复用器时钟
        LDR.W    R6,??DataTable21_1  ;; 0x4004803c
        LDR      R6,[R6, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R7,R0,#+2
        ORRS     R6,R7,R6
        LDR.W    R7,??DataTable21_1  ;; 0x4004803c
        STR      R6,[R7, #+0]
//   21      SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;	
        LDR.W    R6,??DataTable21_2  ;; 0x40048040
        LDR      R6,[R6, #+0]
        ORRS     R6,R6,#0x2
        LDR.W    R7,??DataTable21_2  ;; 0x40048040
        STR      R6,[R7, #+0]
//   22      DMA_ERQ&=~(1<<CHx);
        LDR.W    R6,??DataTable21_3  ;; 0x4000800c
        LDR      R6,[R6, #+0]
        MOVS     R7,#+1
        LSLS     R7,R7,R1
        BICS     R6,R6,R7
        LDR.W    R7,??DataTable21_3  ;; 0x4000800c
        STR      R6,[R7, #+0]
//   23      DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) &= ~DMAMUX_CHCFG_SOURCE_MASK;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R6,??DataTable21_4
        LDR      R6,[R6, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R7,??DataTable21_4
        LDR      R7,[R7, R0, LSL #+2]
        LDRB     R7,[R1, R7]
        ANDS     R7,R7,#0xC0
        STRB     R7,[R1, R6]
//   24      DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx)|=0x80;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R6,??DataTable21_4
        LDR      R6,[R6, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R7,??DataTable21_4
        LDR      R7,[R7, R0, LSL #+2]
        LDRB     R7,[R1, R7]
        ORRS     R7,R7,#0x80
        STRB     R7,[R1, R6]
//   25      DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) |= ( TrggerSourceMode | TriggerSource);	
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R6,??DataTable21_4
        LDR      R6,[R6, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R7,??DataTable21_4
        LDR      R7,[R7, R0, LSL #+2]
        LDRB     R7,[R1, R7]
        ORRS     R12,R2,R5
        ORRS     R7,R12,R7
        STRB     R7,[R1, R6]
//   26      HWREG(0X40008000+(0x1006)+CHx*32)=0;
        MOVS     R6,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R7,R1,#+5
        LDR.W    R12,??DataTable21_5  ;; 0x40009006
        STR      R6,[R12, R7]
//   27      HWREG(0X40008000+(DMA_TCD_CSR_OFF)+CHx*32)=0;
        MOVS     R6,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R7,R1,#+5
        LDR.W    R12,??DataTable21_6  ;; 0x4000901c
        STR      R6,[R12, R7]
//   28      DMA_CITER_ELINKNO(CHx) &= ~DMA_CITER_ELINKNO_CITER_MASK;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R6,R1,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        LDRH     R6,[R6, #+22]
        ANDS     R6,R6,#0x8000
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R7,R1,#+5
        ADD      R7,R7,#+1073741824
        ADDS     R7,R7,#+36864
        STRH     R6,[R7, #+22]
//   29      DMA_BITER_ELINKNO(CHx) &= ~DMA_BITER_ELINKNO_BITER_MASK;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R6,R1,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        LDRH     R6,[R6, #+30]
        ANDS     R6,R6,#0x8000
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R7,R1,#+5
        ADD      R7,R7,#+1073741824
        ADDS     R7,R7,#+36864
        STRH     R6,[R7, #+30]
//   30      DMA_CITER_ELINKNO(CHx) |= DMA_CITER_ELINKNO_CITER(majorLoop);
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R6,R1,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        LDRH     R6,[R6, #+22]
        LSLS     R7,R3,#+17       ;; ZeroExtS R7,R3,#+17,#+17
        LSRS     R7,R7,#+17
        ORRS     R6,R7,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R7,R1,#+5
        ADD      R7,R7,#+1073741824
        ADDS     R7,R7,#+36864
        STRH     R6,[R7, #+22]
//   31      DMA_BITER_ELINKNO(CHx) |= DMA_BITER_ELINKNO_BITER(majorLoop); 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R6,R1,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        LDRH     R6,[R6, #+30]
        LSLS     R7,R3,#+17       ;; ZeroExtS R7,R3,#+17,#+17
        LSRS     R7,R7,#+17
        ORRS     R6,R7,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R7,R1,#+5
        ADD      R7,R7,#+1073741824
        ADDS     R7,R7,#+36864
        STRH     R6,[R7, #+30]
//   32      	DMA_NBYTES_MLNO(CHx) &= ~DMA_NBYTES_MLNO_NBYTES_MASK;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R6,R1,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        LDR      R6,[R6, #+8]
        MOVS     R7,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R12,R1,#+5
        ADD      R12,R12,#+1073741824
        ADDS     R12,R12,#+36864
        STR      R7,[R12, #+8]
//   33     HWREG(0X40008000+(DMA_TCD_CSR_OFF)+CHx*32)|=0X08;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R7,R1,#+5
        LDR.W    R12,??DataTable21_6  ;; 0x4000901c
        LDR      R7,[R12, R7]
        ORRS     R7,R7,#0x8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R12,R1,#+5
        LDR.W    LR,??DataTable21_6  ;; 0x4000901c
        STR      R7,[LR, R12]
//   34 	DMA_NBYTES_MLNO(CHx) = DMA_NBYTES_MLNO_NBYTES(minorLoop);	
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R7,R1,#+5
        ADD      R7,R7,#+1073741824
        ADDS     R7,R7,#+36864
        STR      R4,[R7, #+8]
//   35  }
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock1
//   36 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function DMA_Source_new
          CFI NoCalls
        THUMB
//   37 void DMA_Source_new(uint8 CHx, uint32 Src_Addr,int32 Src_AddrOffset, uint32 Src_DataSize, int32 Adjust_Src_Addr)
//   38  {
DMA_Source_new:
        PUSH     {R4-R7}
          CFI R7 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        LDR      R4,[SP, #+16]
//   39      DMA_SADDR(CHx) = Src_Addr ;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        LDR.W    R6,??DataTable21_7  ;; 0x40009000
        STR      R1,[R5, R6]
//   40      DMA_SOFF(CHx) = Src_AddrOffset;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        STRH     R2,[R5, #+4]
//   41      HWREG(0X40008000+(0x1006)+CHx*32)&= ~DMA_ATTR_SSIZE_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        LDR.W    R6,??DataTable21_5  ;; 0x40009006
        LDR      R5,[R6, R5]
        BICS     R5,R5,#0x700
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        LDR.W    R7,??DataTable21_5  ;; 0x40009006
        STR      R5,[R7, R6]
//   42      HWREG(0X40008000+(0x1006)+CHx*32)|= DMA_ATTR_SSIZE(Src_DataSize);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        LDR.W    R6,??DataTable21_5  ;; 0x40009006
        LDR      R5,[R6, R5]
        LSLS     R6,R3,#+8
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ANDS     R6,R6,#0x700
        ORRS     R5,R6,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        LDR.W    R7,??DataTable21_5  ;; 0x40009006
        STR      R5,[R7, R6]
//   43      DMA_SLAST(CHx) = Adjust_Src_Addr;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        STR      R4,[R5, #+12]
//   44  }
        POP      {R4-R7}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//   45 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function DMA_Destination_new
          CFI NoCalls
        THUMB
//   46 void DMA_Destination_new(uint8 CHx, uint32 Dest_Addr,int32 Dest_Addr_Offset, uint32 Dest_DataSize, int32 Adjust_Dest_Addr)
//   47  {
DMA_Destination_new:
        PUSH     {R4-R7}
          CFI R7 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        LDR      R4,[SP, #+16]
//   48      DMA_DADDR(CHx) = Dest_Addr ;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        STR      R1,[R5, #+16]
//   49      DMA_DOFF(CHx) = Dest_Addr_Offset;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        STRH     R2,[R5, #+20]
//   50      HWREG(0X40008000+(0x1006)+CHx*32)&= ~DMA_ATTR_DSIZE_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        LDR.W    R6,??DataTable21_5  ;; 0x40009006
        LDR      R5,[R6, R5]
        LSRS     R5,R5,#+3
        LSLS     R5,R5,#+3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        LDR.W    R7,??DataTable21_5  ;; 0x40009006
        STR      R5,[R7, R6]
//   51      HWREG(0X40008000+(0x1006)+CHx*32)|= DMA_ATTR_DSIZE(Dest_DataSize);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        LDR.W    R6,??DataTable21_5  ;; 0x40009006
        LDR      R5,[R6, R5]
        ANDS     R6,R3,#0x7
        ORRS     R5,R6,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        LDR.W    R7,??DataTable21_5  ;; 0x40009006
        STR      R5,[R7, R6]
//   52      DMA_DLAST_SGA(CHx) = Adjust_Dest_Addr;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        STR      R4,[R5, #+24]
//   53 }
        POP      {R4-R7}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//   54 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function DMA_Enable_new
          CFI NoCalls
        THUMB
//   55 void DMA_Enable_new(uint8 DMAMUXx,uint8 CHx)
//   56  {
//   57      //DMA_ERQ|=1<<CHx;
//   58      DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx)|=0x80;
DMA_Enable_new:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable21_4
        LDR      R2,[R2, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R3,??DataTable21_4
        LDR      R3,[R3, R0, LSL #+2]
        LDRB     R3,[R1, R3]
        ORRS     R3,R3,#0x80
        STRB     R3,[R1, R2]
//   59      DMA_SERQ|=CHx;
        LDR.W    R2,??DataTable21_8  ;; 0x4000801b
        LDRB     R2,[R2, #+0]
        ORRS     R2,R1,R2
        LDR.W    R3,??DataTable21_8  ;; 0x4000801b
        STRB     R2,[R3, #+0]
//   60  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function DMA_Disable_new
          CFI NoCalls
        THUMB
//   61 void DMA_Disable_new(uint8 DMAMUXx,uint8 CHx)
//   62  {
//   63      DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx)&=~(0x80);
DMA_Disable_new:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable21_4
        LDR      R2,[R2, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R3,??DataTable21_4
        LDR      R3,[R3, R0, LSL #+2]
        LDRB     R3,[R1, R3]
        ANDS     R3,R3,#0x7F
        STRB     R3,[R1, R2]
//   64      DMA_ERQ&=~(1<<CHx);
        LDR.W    R2,??DataTable21_3  ;; 0x4000800c
        LDR      R2,[R2, #+0]
        MOVS     R3,#+1
        LSLS     R3,R3,R1
        BICS     R2,R2,R3
        LDR.W    R3,??DataTable21_3  ;; 0x4000800c
        STR      R2,[R3, #+0]
//   65  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function DMA_SetDestAddress
          CFI NoCalls
        THUMB
//   66 void DMA_SetDestAddress(uint8 CHx,uint32 address)
//   67  {
//   68      DMA_DADDR(CHx) = address ;
DMA_SetDestAddress:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STR      R1,[R2, #+16]
//   69  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function DMA_SetSourceAddress
          CFI NoCalls
        THUMB
//   70 void DMA_SetSourceAddress(uint8 CHx,uint32 address)
//   71 {
//   72     DMA_SADDR(CHx) = address ;
DMA_SetSourceAddress:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        LDR.W    R3,??DataTable21_7  ;; 0x40009000
        STR      R1,[R2, R3]
//   73 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//   74 
//   75 
//   76 
//   77 
//   78 
//   79 
//   80 
//   81 
//   82 
//   83 /****************** DMA初始化 ******************************/
//   84 /* 简介:	选择触发源,选择通道(根据触发源),选择模式
//   85  * 例程:	DMA_Init(DMAMUX0, DMA_CH0, Src_PORTA, DMA_Normal_Mode)
//   86  * 参数:	DMAMUXx:DMAMUX0,DMAMUX1
//   87  * 		CHx:	选择通道0~31,DMA_CH0~DMA_CH31
//   88  * 		Source:	放在.h文件
//   89  * 		Mode:	Normal_Mode,Periodic_Mode
//   90  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function DMA_Init
          CFI NoCalls
        THUMB
//   91 void DMA_Init(uint8 DMAMUXx, uint8 CHx, uint32 Source,uint8 Mode)
//   92 {
DMA_Init:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//   93 	SIM_SCGC6 |= (SIM_SCGC6_DMAMUX0_MASK + DMAMUXx);	//使能DMA通道多路复用器时钟
        LDR.W    R4,??DataTable21_1  ;; 0x4004803c
        LDR      R4,[R4, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R5,R0,#+2
        ORRS     R4,R5,R4
        LDR.W    R5,??DataTable21_1  ;; 0x4004803c
        STR      R4,[R5, #+0]
//   94 	SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;		
        LDR.W    R4,??DataTable21_2  ;; 0x40048040
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x2
        LDR.W    R5,??DataTable21_2  ;; 0x40048040
        STR      R4,[R5, #+0]
//   95 	DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) &= ~DMAMUX_CHCFG_SOURCE_MASK;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R4,??DataTable21_4
        LDR      R4,[R4, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R5,??DataTable21_4
        LDR      R5,[R5, R0, LSL #+2]
        LDRB     R5,[R1, R5]
        ANDS     R5,R5,#0xC0
        STRB     R5,[R1, R4]
//   96 	DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) |= (DMAMUX_CHCFG_ENBL_MASK | Mode | Source);
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R4,??DataTable21_4
        LDR      R4,[R4, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R5,??DataTable21_4
        LDR      R5,[R5, R0, LSL #+2]
        LDRB     R5,[R1, R5]
        ORRS     R6,R2,R3
        ORRS     R6,R6,#0x80
        ORRS     R5,R6,R5
        STRB     R5,[R1, R4]
//   97 }
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//   98 
//   99 
//  100 /* 简介:	源地址的相关配置
//  101  * 例程:	DMA_Source(DMA_CH1, (uint32)b, 2, DMA_16BIT, -4);
//  102  * 参数:	CHx:				选择通道0~31,DMA_CH0~DMA_CH31
//  103  * 		Src_Addr:			源数据的地址
//  104  * 		Src_Addr_Offset:	*有符号*的源地址偏移
//  105  * 							配置源数据地址偏移，即每执行完一次Src_DataSize的传输就对源数据地址进行偏移Src_Addr_Offset个字节
//  106  * 		Src_DataSize:		源数据类型的字节长度,8BIT,16BIT,32BIT,16BYTE
//  107  * 		Src_Reset_Addr:		*有符号*源地址最终偏移
//  108  * 							主的计数次数（major iteration count）达到后，重新调整源地址,原来的源数据地址的偏移
//  109  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function DMA_Source
          CFI NoCalls
        THUMB
//  110 void DMA_Source(uint8 CHx, uint32 Src_Addr,int32 Src_AddrOffset, uint32 Src_DataSize, int32 Reset_Src_Addr)
//  111 {
DMA_Source:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        LDR      R4,[SP, #+12]
//  112 	DMA_SADDR(CHx) = Src_Addr ;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        LDR.W    R6,??DataTable21_7  ;; 0x40009000
        STR      R1,[R5, R6]
//  113 	DMA_SOFF(CHx) = Src_AddrOffset;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        STRH     R2,[R5, #+4]
//  114 	//DMA_ATTR = 0;				//先清零数据长度寄存器
//  115 	DMA_ATTR(CHx) &= ~DMA_ATTR_SSIZE_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        LDRH     R5,[R5, #+6]
        MOVW     R6,#+63743
        ANDS     R5,R6,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        STRH     R5,[R6, #+6]
//  116 	DMA_ATTR(CHx) |= DMA_ATTR_SSIZE(Src_DataSize);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        LDRH     R5,[R5, #+6]
        LSLS     R6,R3,#+8
        ANDS     R6,R6,#0x700
        ORRS     R5,R6,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        STRH     R5,[R6, #+6]
//  117 	DMA_SLAST(CHx) = Reset_Src_Addr;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        STR      R4,[R5, #+12]
//  118 }
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  119 
//  120 /* 简介:	目的地址的相关配置
//  121  * 例程:	DMA_Destination(DMA_CH1, (uint32)&f, 4, DMA_16BIT, -4);
//  122  * 参数:	CHx:				选择通道0~15
//  123  * 		Dest_Addr:			目的数据的地址
//  124  * 		Dest_Addr_Offset:	*有符号*的目的地址偏移
//  125  * 							配置目的数据地址偏移，即执行完目的地址的操作后设置目的地址的偏移量
//  126  * 		Dest_DataSize:		目的数据的长度,8BIT,16BIT,32BIT,16BYTE
//  127  * 		Reset_Dest_Addr:	*有符号*目的地址最终偏移
//  128  * 							主的计数次数（major iteration count）达到后，重新调整目的地址,原来的目的地址的偏置
//  129  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function DMA_Destination
          CFI NoCalls
        THUMB
//  130 void DMA_Destination(uint8 CHx, uint32 Dest_Addr,int32 Dest_Addr_Offset, uint32 Dest_DataSize, int32 Reset_Dest_Addr)
//  131 {
DMA_Destination:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        LDR      R4,[SP, #+12]
//  132 	DMA_DADDR(CHx) = Dest_Addr ;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        STR      R1,[R5, #+16]
//  133 	DMA_DOFF(CHx) = Dest_Addr_Offset;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        STRH     R2,[R5, #+20]
//  134 	DMA_ATTR(CHx) &= ~DMA_ATTR_DSIZE_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        LDRH     R5,[R5, #+6]
        MOVW     R6,#+65528
        ANDS     R5,R6,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        STRH     R5,[R6, #+6]
//  135 	DMA_ATTR(CHx) |= DMA_ATTR_DSIZE(Dest_DataSize);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        LDRH     R5,[R5, #+6]
        ANDS     R6,R3,#0x7
        ORRS     R5,R6,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        STRH     R5,[R6, #+6]
//  136 	DMA_DLAST_SGA(CHx) = Reset_Dest_Addr;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R5,R0,#+5
        ADD      R5,R5,#+1073741824
        ADDS     R5,R5,#+36864
        STR      R4,[R5, #+24]
//  137 }
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  138 
//  139 //简介:使能相应通道的中断,并设置中断类型
//  140 //设置中断类型,主循环计数器减到零时进入中断,还是主循环计数器减到一半时进入中断
//  141 //参数:Type:	DMA_MAJOR,DMA_HALF

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function DMA_Int_Enable
        THUMB
//  142 void DMA_Int_Enable(uint8 CHx, uint32 Int_Type)
//  143 {
DMA_Int_Enable:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  144 	DMA_INT |= (1<<CHx);	//使能相应通道的中断
        LDR.W    R0,??DataTable21  ;; 0x40008024
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable21  ;; 0x40008024
        STR      R0,[R1, #+0]
//  145 	DMA_CSR(CHx) |= Int_Type;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R0,R4,#+5
        ADD      R0,R0,#+1073741824
        ADDS     R0,R0,#+36864
        LDRH     R0,[R0, #+28]
        ORRS     R0,R5,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R1,R4,#+5
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+36864
        STRH     R0,[R1, #+28]
//  146 	Enable_IRQ((CHx+16)%16+16);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+16
        MOVS     R1,#+16
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,#+16
          CFI FunCall Enable_IRQ
        BL       Enable_IRQ
//  147 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function DMA_Int_Disable
          CFI NoCalls
        THUMB
//  148 void DMA_Int_Disable(uint8 CHx)
//  149 {
//  150 	DMA_INT &= ~(1<<CHx);
DMA_Int_Disable:
        LDR.W    R1,??DataTable21  ;; 0x40008024
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        BICS     R1,R1,R2
        LDR.W    R2,??DataTable21  ;; 0x40008024
        STR      R1,[R2, #+0]
//  151 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock12
//  152 
//  153 //当主循环计数器减到零时自动关闭DMA的硬件请求,如果调用这条语句会使DMA一直执行

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function DMA_AutoClose_Enable
          CFI NoCalls
        THUMB
//  154 void DMA_AutoClose_Enable(uint8 CHx)
//  155 {
//  156 	DMA_CSR(CHx) |= DMA_CSR_DREQ_MASK;
DMA_AutoClose_Enable:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R1,R0,#+5
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+36864
        LDRH     R1,[R1, #+28]
        ORRS     R1,R1,#0x8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STRH     R1,[R2, #+28]
//  157 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock13
//  158 
//  159 //一直执行DMA传输

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function DMA_AutoClose_Disable
          CFI NoCalls
        THUMB
//  160 void DMA_AutoClose_Disable(uint8 CHx)
//  161 {
//  162 	DMA_CSR(CHx) &= ~DMA_CSR_DREQ_MASK;
DMA_AutoClose_Disable:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R1,R0,#+5
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+36864
        LDRH     R1,[R1, #+28]
        MOVW     R2,#+65527
        ANDS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STRH     R1,[R2, #+28]
//  163 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock14
//  164 
//  165 //设置主循环的循环次数,即传输Cycles个次计数器的字节数

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function DMA_Major_Loop_Num
          CFI NoCalls
        THUMB
//  166 void DMA_Major_Loop_Num(uint8 CHx, uint16 Cycles)
//  167 {
//  168 	DMA_CITER_ELINKNO(CHx) &= ~DMA_CITER_ELINKNO_CITER_MASK;
DMA_Major_Loop_Num:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        LDRH     R2,[R2, #+22]
        ANDS     R2,R2,#0x8000
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R3,R0,#+5
        ADD      R3,R3,#+1073741824
        ADDS     R3,R3,#+36864
        STRH     R2,[R3, #+22]
//  169 	DMA_CITER_ELINKNO(CHx) |= DMA_CITER_ELINKNO_CITER(Cycles);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        LDRH     R2,[R2, #+22]
        LSLS     R3,R1,#+17       ;; ZeroExtS R3,R1,#+17,#+17
        LSRS     R3,R3,#+17
        ORRS     R2,R3,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R3,R0,#+5
        ADD      R3,R3,#+1073741824
        ADDS     R3,R3,#+36864
        STRH     R2,[R3, #+22]
//  170 	DMA_BITER_ELINKNO(CHx) &= ~DMA_BITER_ELINKNO_BITER_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        LDRH     R2,[R2, #+30]
        ANDS     R2,R2,#0x8000
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R3,R0,#+5
        ADD      R3,R3,#+1073741824
        ADDS     R3,R3,#+36864
        STRH     R2,[R3, #+30]
//  171 	DMA_BITER_ELINKNO(CHx) |= DMA_BITER_ELINKNO_BITER(Cycles);    
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        LDRH     R2,[R2, #+30]
        LSLS     R3,R1,#+17       ;; ZeroExtS R3,R1,#+17,#+17
        LSRS     R3,R3,#+17
        ORRS     R2,R3,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R3,R0,#+5
        ADD      R3,R3,#+1073741824
        ADDS     R3,R3,#+36864
        STRH     R2,[R3, #+30]
//  172 	//DMA_BITER_ELINKYES(CHx) |= DMA_BITER_ELINKYES_BITER(Cycles); 
//  173 	//DMA_CITER_ELINKYES(CHx) |= DMA_CITER_ELINKYES_CITER(Cycles);
//  174 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock15
//  175 
//  176 //设置次计数,即每一次传输数据字节的个数
//  177 //当个数达到源地址配置的8BIT/16BIT/32BIT/16BYTE时,DMA便将数据存在缓冲区
//  178 //当个数达到目的地址配置的8BIT/16BIT/32BIT/16BYTE时,DMA便开始把缓冲区的数据传输到目的地址
//  179 //直到传输完Bytes个字节

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function DMA_Minor_Bytes
          CFI NoCalls
        THUMB
//  180 void DMA_Minor_Bytes(uint8 CHx, uint16 Bytes)
//  181 {
DMA_Minor_Bytes:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  182 	DMA_NBYTES_MLNO(CHx) &= ~DMA_NBYTES_MLNO_NBYTES_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        LDR      R2,[R2, #+8]
        MOVS     R3,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R4,R0,#+5
        ADD      R4,R4,#+1073741824
        ADDS     R4,R4,#+36864
        STR      R3,[R4, #+8]
//  183 	DMA_NBYTES_MLNO(CHx) = DMA_NBYTES_MLNO_NBYTES(Bytes);	
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R3,R0,#+5
        ADD      R3,R3,#+1073741824
        ADDS     R3,R3,#+36864
        STR      R1,[R3, #+8]
//  184 	//DMA_NBYTES_MLOFFNO(CHx)  |= DMA_NBYTES_MLOFFNO_NBYTES(Bytes);    
//  185 	//DMA_NBYTES_MLOFFYES(CHx) |= DMA_NBYTES_MLOFFYES_NBYTES(Bytes); 
//  186 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock16
//  187 
//  188 //软件启动(触发)传输
//  189 //其实如果是Src_ALWAYS_*(DMA常使能请求源)不调用这句也会触发的

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function DMA_Software_Initiate
          CFI NoCalls
        THUMB
//  190 void DMA_Software_Initiate (uint8 CHx)
//  191 {
//  192 	DMA_SSRT &= ~DMA_SSRT_SSRT_MASK;
DMA_Software_Initiate:
        LDR.N    R1,??DataTable21_9  ;; 0x4000801d
        LDRB     R1,[R1, #+0]
        ANDS     R1,R1,#0xE0
        LDR.N    R2,??DataTable21_9  ;; 0x4000801d
        STRB     R1,[R2, #+0]
//  193 	DMA_SSRT |= DMA_SSRT_SSRT(CHx);
        LDR.N    R1,??DataTable21_9  ;; 0x4000801d
        LDRB     R1,[R1, #+0]
        ANDS     R2,R0,#0x1F
        ORRS     R1,R2,R1
        LDR.N    R2,??DataTable21_9  ;; 0x4000801d
        STRB     R1,[R2, #+0]
//  194 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock17
//  195 
//  196 //使能通道,若不使能,则只执行一次副循环,有例程,例程很直观
//  197 //默认情况下是禁能的,所以一般要调用

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function DMA_Channal_Enable
          CFI NoCalls
        THUMB
//  198 void DMA_Channal_Enable(uint8 CHx)
//  199 {
//  200 	DMA_ERQ|=1<<CHx;
DMA_Channal_Enable:
        LDR.N    R1,??DataTable21_3  ;; 0x4000800c
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        ORRS     R1,R2,R1
        LDR.N    R2,??DataTable21_3  ;; 0x4000800c
        STR      R1,[R2, #+0]
//  201 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock18

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function DMA_Channal_Disable
          CFI NoCalls
        THUMB
//  202 void DMA_Channal_Disable(uint8 CHx)
//  203 {
//  204 	DMA_ERQ&=~(1<<CHx);
DMA_Channal_Disable:
        LDR.N    R1,??DataTable21_3  ;; 0x4000800c
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        BICS     R1,R1,R2
        LDR.N    R2,??DataTable21_3  ;; 0x4000800c
        STR      R1,[R2, #+0]
//  205 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock19
//  206 
//  207 //重新开始DMA模块,默认情况下,是使能的
//  208 //前面用了DMA_Disable(),才需要用到这条语句,重新打开DMA模块
//  209 //当DMA_Disable()被用在配置的第一句时时可以用在配置的最后一句(除了软件触发,就是DMA_Software_Initiate(DMA_CH1)这句)

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function DMA_Enable
          CFI NoCalls
        THUMB
//  210 void DMA_Enable()
//  211 {
//  212 	//这种模式下，DMA复用器的配置过程中，主要是用来。
//  213 	//在DMA具有独立的通道使能/禁止，而应该用来禁用或重新配置DMA通道。
//  214 	//DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) |= DMAMUX_CHCFG_ENBL_MASK;
//  215 	DMA_CR &= ~DMA_CR_HALT_MASK;
DMA_Enable:
        LDR.N    R0,??DataTable21_10  ;; 0x40008000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x20
        LDR.N    R1,??DataTable21_10  ;; 0x40008000
        STR      R0,[R1, #+0]
//  216 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock20
//  217 
//  218 //关闭DMA模块
//  219 //可以用在配置的第一句

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function DMA_Disable
          CFI NoCalls
        THUMB
//  220 void DMA_Disable()
//  221 {
//  222 	//DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) &= ~DMAMUX_CHCFG_ENBL_MASK;
//  223 	DMA_CR |= DMA_CR_HALT_MASK;
DMA_Disable:
        LDR.N    R0,??DataTable21_10  ;; 0x40008000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable21_10  ;; 0x40008000
        STR      R0,[R1, #+0]
//  224 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock21
//  225 
//  226 //在调试模式下,DMA禁止新通道的开始,正在执行的通道可以完成.
//  227 //当调用DMA_Debug_Disable(DMA_CH0)时, Channel execution resumes

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function DMA_Debug_Enable
          CFI NoCalls
        THUMB
//  228 void DMA_Debug_Enable(uint8 CHx)
//  229 {
//  230 	DMA_CSR(CHx) &= ~DMA_CSR_ACTIVE_MASK;//用CR寄存器一定要调用这条语句
DMA_Debug_Enable:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R1,R0,#+5
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+36864
        LDRH     R1,[R1, #+28]
        MOVW     R2,#+65471
        ANDS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STRH     R1,[R2, #+28]
//  231 	DMA_CR |= DMA_CR_EDBG_MASK;
        LDR.N    R1,??DataTable21_10  ;; 0x40008000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2
        LDR.N    R2,??DataTable21_10  ;; 0x40008000
        STR      R1,[R2, #+0]
//  232 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock22
//  233 
//  234 //在调试模式下,DMA不停止,在执行

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function DMA_Debug_Disable
          CFI NoCalls
        THUMB
//  235 void DMA_Debug_Disable(uint8 CHx)
//  236 {
//  237 	DMA_CSR(CHx) &= ~DMA_CSR_ACTIVE_MASK;//用CR寄存器一定要调用这条语句
DMA_Debug_Disable:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R1,R0,#+5
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+36864
        LDRH     R1,[R1, #+28]
        MOVW     R2,#+65471
        ANDS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STRH     R1,[R2, #+28]
//  238 	DMA_CR &= ~DMA_CR_EDBG_MASK;
        LDR.N    R1,??DataTable21_10  ;; 0x40008000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x2
        LDR.N    R2,??DataTable21_10  ;; 0x40008000
        STR      R1,[R2, #+0]
//  239 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock23
//  240 
//  241 /* In group fixed priority arbitration mode
//  242  * 只有两组(DMAMUX0,DMAMUX1),却可以设置4个优先级,怪怪的.
//  243  * 0 is the lowest priority, 1is the next higher priority, then 2, 3
//  244  * 参数:	Group0_Priority:	0~3	//这两个参数不能相同
//  245  * 		Group1_Priority:	0~3
//  246  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function DMA_Set_Group_Priority
          CFI NoCalls
        THUMB
//  247 void DMA_Set_Group_Priority(uint8 CHx, uint8 Group0_Priority, uint8 Group1_Priority)
//  248 {
DMA_Set_Group_Priority:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  249 	DMA_CSR(CHx) &= ~DMA_CSR_ACTIVE_MASK;//用CR寄存器一定要调用这条语句
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R3,R0,#+5
        ADD      R3,R3,#+1073741824
        ADDS     R3,R3,#+36864
        LDRH     R3,[R3, #+28]
        MOVW     R4,#+65471
        ANDS     R3,R4,R3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R4,R0,#+5
        ADD      R4,R4,#+1073741824
        ADDS     R4,R4,#+36864
        STRH     R3,[R4, #+28]
//  250 	DMA_CR |= DMA_CR_GRP0PRI(Group0_Priority);
        LDR.N    R3,??DataTable21_10  ;; 0x40008000
        LDR      R3,[R3, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R4,R1,#+8
        ANDS     R4,R4,#0x300
        ORRS     R3,R4,R3
        LDR.N    R4,??DataTable21_10  ;; 0x40008000
        STR      R3,[R4, #+0]
//  251 	DMA_CR |= DMA_CR_GRP1PRI(Group1_Priority);
        LDR.N    R3,??DataTable21_10  ;; 0x40008000
        LDR      R3,[R3, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R4,R2,#+10
        ANDS     R4,R4,#0xC00
        ORRS     R3,R4,R3
        LDR.N    R4,??DataTable21_10  ;; 0x40008000
        STR      R3,[R4, #+0]
//  252 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock24
//  253 
//  254 //Priority:	0~15 CHx:0~31,,前提:为fixed-priority固定优先级模式,CR[ERCA] = 0
//  255 //数值越大,优先级越高
//  256 //注意:通道之间的优先级不能一样,否则出错

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function DMA_Set_Channel_Priority
          CFI NoCalls
        THUMB
//  257 void DMA_Set_Channel_Priority(uint8 CHx, uint8 Priority)
//  258 {
DMA_Set_Channel_Priority:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  259 	switch(CHx % 4)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+4
        SDIV     R3,R0,R2
        MLS      R3,R3,R2,R0
        CMP      R3,#+0
        BEQ.N    ??DMA_Set_Channel_Priority_0
        CMP      R3,#+2
        BEQ.N    ??DMA_Set_Channel_Priority_1
        BCC.N    ??DMA_Set_Channel_Priority_2
        CMP      R3,#+3
        BEQ.N    ??DMA_Set_Channel_Priority_3
        B.N      ??DMA_Set_Channel_Priority_4
//  260 	{
//  261 		case 0:HWREG(DMA_DCHPRIn_BASE + CHx/4 + 3) |= (Priority & 0xFu);break;
??DMA_Set_Channel_Priority_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+4
        SDIV     R2,R0,R2
        LDR.N    R3,??DataTable21_11  ;; 0x26279a7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R4,#+4
        SDIV     R4,R0,R4
        LDR.N    R5,??DataTable21_11  ;; 0x26279a7
        LDR      R4,[R5, R4]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R5,R1,#0xF
        ORRS     R4,R5,R4
        STR      R4,[R3, R2]
        B.N      ??DMA_Set_Channel_Priority_4
//  262 		case 1:HWREG(DMA_DCHPRIn_BASE + CHx/4 + 2) |= (Priority & 0xFu);break;
??DMA_Set_Channel_Priority_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+4
        SDIV     R2,R0,R2
        LDR.N    R3,??DataTable21_12  ;; 0x26279a6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R4,#+4
        SDIV     R4,R0,R4
        LDR.N    R5,??DataTable21_12  ;; 0x26279a6
        LDR      R4,[R5, R4]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R5,R1,#0xF
        ORRS     R4,R5,R4
        STR      R4,[R3, R2]
        B.N      ??DMA_Set_Channel_Priority_4
//  263 		case 2:HWREG(DMA_DCHPRIn_BASE + CHx/4 + 1) |= (Priority & 0xFu);break;
??DMA_Set_Channel_Priority_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+4
        SDIV     R2,R0,R2
        LDR.N    R3,??DataTable21_13  ;; 0x26279a5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R4,#+4
        SDIV     R4,R0,R4
        LDR.N    R5,??DataTable21_13  ;; 0x26279a5
        LDR      R4,[R5, R4]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R5,R1,#0xF
        ORRS     R4,R5,R4
        STR      R4,[R3, R2]
        B.N      ??DMA_Set_Channel_Priority_4
//  264 		case 3:HWREG(DMA_DCHPRIn_BASE + CHx/4 + 0) |= (Priority & 0xFu);break;
??DMA_Set_Channel_Priority_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+4
        SDIV     R2,R0,R2
        LDR.N    R3,??DataTable21_14  ;; 0x26279a4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R4,#+4
        SDIV     R4,R0,R4
        LDR.N    R5,??DataTable21_14  ;; 0x26279a4
        LDR      R4,[R5, R4]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R5,R1,#0xF
        ORRS     R4,R5,R4
        STR      R4,[R3, R2]
//  265 	}
//  266 }
??DMA_Set_Channel_Priority_4:
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock25
//  267 
//  268 //0~31,注意返回值类型为uint8,前提:为fixed-priority固定优先级模式,CR[ERCA] = 0
//  269 //数值越大,优先级越高

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function DMA_Get_Channel_Priority
          CFI NoCalls
        THUMB
//  270 uint8 DMA_Get_Channel_Priority(uint8 CHx)
//  271 {
DMA_Get_Channel_Priority:
        MOVS     R1,R0
//  272 	uint32 temp;
//  273 	switch(CHx % 4)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+4
        SDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        CMP      R3,#+0
        BEQ.N    ??DMA_Get_Channel_Priority_0
        CMP      R3,#+2
        BEQ.N    ??DMA_Get_Channel_Priority_1
        BCC.N    ??DMA_Get_Channel_Priority_2
        CMP      R3,#+3
        BEQ.N    ??DMA_Get_Channel_Priority_3
        B.N      ??DMA_Get_Channel_Priority_4
//  274 	{
//  275 	case 0:temp = (DMA_DCHPRIn_BASE + CHx/4 + 3);break;
??DMA_Get_Channel_Priority_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+4
        SDIV     R2,R1,R2
        LDR.N    R3,??DataTable21_11  ;; 0x26279a7
        ADDS     R2,R3,R2
        MOVS     R0,R2
        B.N      ??DMA_Get_Channel_Priority_4
//  276 	case 1:temp = (DMA_DCHPRIn_BASE + CHx/4 + 2);break;
??DMA_Get_Channel_Priority_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+4
        SDIV     R2,R1,R2
        LDR.N    R3,??DataTable21_12  ;; 0x26279a6
        ADDS     R2,R3,R2
        MOVS     R0,R2
        B.N      ??DMA_Get_Channel_Priority_4
//  277 	case 2:temp = (DMA_DCHPRIn_BASE + CHx/4 + 1);break;
??DMA_Get_Channel_Priority_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+4
        SDIV     R2,R1,R2
        LDR.N    R3,??DataTable21_13  ;; 0x26279a5
        ADDS     R2,R3,R2
        MOVS     R0,R2
        B.N      ??DMA_Get_Channel_Priority_4
//  278 	case 3:temp = (DMA_DCHPRIn_BASE + CHx/4 + 0);break;
??DMA_Get_Channel_Priority_3:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+4
        SDIV     R2,R1,R2
        LDR.N    R3,??DataTable21_14  ;; 0x26279a4
        ADDS     R2,R3,R2
        MOVS     R0,R2
//  279 	}
//  280 	return (HWREG(temp) & 0xFu);
??DMA_Get_Channel_Priority_4:
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0xF
        BX       LR               ;; return
          CFI EndBlock cfiBlock26
//  281 }
//  282 //0~31,注意返回值类型为uint8,前提:为fixed-priority固定优先级模式,CR[ERCA] = 0
//  283 //数值越大,优先级越高

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function DMA_Get_Group_Priority
          CFI NoCalls
        THUMB
//  284 uint8 DMA_Get_Group_Priority(uint8 CHx)
//  285 {
DMA_Get_Group_Priority:
        MOVS     R1,R0
//  286 	uint32 temp;
//  287 	switch(CHx % 4)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+4
        SDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        CMP      R3,#+0
        BEQ.N    ??DMA_Get_Group_Priority_0
        CMP      R3,#+2
        BEQ.N    ??DMA_Get_Group_Priority_1
        BCC.N    ??DMA_Get_Group_Priority_2
        CMP      R3,#+3
        BEQ.N    ??DMA_Get_Group_Priority_3
        B.N      ??DMA_Get_Group_Priority_4
//  288 	{
//  289 	case 0:temp = (DMA_DCHPRIn_BASE + CHx/4 + 3);break;
??DMA_Get_Group_Priority_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+4
        SDIV     R2,R1,R2
        LDR.N    R3,??DataTable21_11  ;; 0x26279a7
        ADDS     R2,R3,R2
        MOVS     R0,R2
        B.N      ??DMA_Get_Group_Priority_4
//  290 	case 1:temp = (DMA_DCHPRIn_BASE + CHx/4 + 2);break;
??DMA_Get_Group_Priority_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+4
        SDIV     R2,R1,R2
        LDR.N    R3,??DataTable21_12  ;; 0x26279a6
        ADDS     R2,R3,R2
        MOVS     R0,R2
        B.N      ??DMA_Get_Group_Priority_4
//  291 	case 2:temp = (DMA_DCHPRIn_BASE + CHx/4 + 1);break;
??DMA_Get_Group_Priority_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+4
        SDIV     R2,R1,R2
        LDR.N    R3,??DataTable21_13  ;; 0x26279a5
        ADDS     R2,R3,R2
        MOVS     R0,R2
        B.N      ??DMA_Get_Group_Priority_4
//  292 	case 3:temp = (DMA_DCHPRIn_BASE + CHx/4 + 0);break;
??DMA_Get_Group_Priority_3:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+4
        SDIV     R2,R1,R2
        LDR.N    R3,??DataTable21_14  ;; 0x26279a4
        ADDS     R2,R3,R2
        MOVS     R0,R2
//  293 	}
//  294 	return (HWREG(temp) & 0x30u);
??DMA_Get_Group_Priority_4:
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x30
        BX       LR               ;; return
          CFI EndBlock cfiBlock27
//  295 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     0x40008024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_1:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_2:
        DC32     0x40048040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_3:
        DC32     0x4000800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_4:
        DC32     DMAMUXx_BASE_PTR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_5:
        DC32     0x40009006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_6:
        DC32     0x4000901c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_7:
        DC32     0x40009000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_8:
        DC32     0x4000801b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_9:
        DC32     0x4000801d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_10:
        DC32     0x40008000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_11:
        DC32     0x26279a7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_12:
        DC32     0x26279a6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_13:
        DC32     0x26279a5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_14:
        DC32     0x26279a4

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
//     8 bytes in section .data
// 2 136 bytes in section .text
// 
// 2 136 bytes of CODE memory
//     8 bytes of DATA memory
//
//Errors: none
//Warnings: none
