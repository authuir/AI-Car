///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:12
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\SPI.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\SPI.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\SPI.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC GPIOType_SPI
        PUBLIC SPI_Read
        PUBLIC SPI_Send
        PUBLIC SPI_init
        PUBLIC SPIx_ReadWriteByte
        PUBLIC SPIx_ReadWriteByte_last
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\SPI.c
//    1 #include "all.H"
//    2 //*********************************************************
//    3 //函数名称：SPI_init
//    4 //参数：SPI_NUM:SPI0~SPI3
//    5 //      master：是主机或者从机  MASTER   SLAVE
//    6 //*********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SPI_init
          CFI NoCalls
        THUMB
//    7 void SPI_init(uint8 SPI_NUM,uint8 master)//30M
//    8  {
SPI_init:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//    9     switch(SPI_NUM)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,R0
        CMP      R2,#+0
        BEQ.N    ??SPI_init_0
        CMP      R2,#+1
        BEQ.N    ??SPI_init_1
        CMP      R2,#+128
        BEQ.N    ??SPI_init_2
        B.N      ??SPI_init_3
//   10      {
//   11      case SPI0:SIM_SCGC6|=SIM_SCGC6_DSPI0_MASK;break;
??SPI_init_0:
        LDR.W    R2,??DataTable5  ;; 0x4004803c
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x1000
        LDR.W    R3,??DataTable5  ;; 0x4004803c
        STR      R2,[R3, #+0]
        B.N      ??SPI_init_3
//   12      case SPI1:SIM_SCGC6|=SIM_SCGC6_DSPI1_MASK;break;
??SPI_init_1:
        LDR.W    R2,??DataTable5  ;; 0x4004803c
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x2000
        LDR.W    R3,??DataTable5  ;; 0x4004803c
        STR      R2,[R3, #+0]
        B.N      ??SPI_init_3
//   13      case SPI2:SIM_SCGC3|=SIM_SCGC3_DSPI2_MASK;break;
??SPI_init_2:
        LDR.W    R2,??DataTable5_1  ;; 0x40048030
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x1000
        LDR.W    R3,??DataTable5_1  ;; 0x40048030
        STR      R2,[R3, #+0]
//   14      }
//   15     HWREG(SPI_MCR_BASE+SPI_NUM*0X1000)=0|SPI_MCR_CLR_TXF_MASK
//   16                                         |SPI_MCR_CLR_RXF_MASK
//   17                                         |SPI_MCR_PCSIS_MASK
//   18                                         |SPI_MCR_FRZ_MASK    //debug使能
//   19                                         |SPI_MCR_HALT_MASK;         //Start trans
??SPI_init_3:
        LDR.W    R2,??DataTable5_2  ;; 0x83f0c01
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R3,#+4096
        LDR.W    R4,??DataTable5_3  ;; 0x4002c000
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//   20     if(master==MASTER) 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??SPI_init_4
//   21      {
//   22          HWREG(SPI_MCR_BASE+SPI_NUM*(0X1000))|=SPI_MCR_MSTR_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R2,#+4096
        LDR.W    R3,??DataTable5_3  ;; 0x4002c000
        MLA      R2,R2,R0,R3
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x80000000
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R3,#+4096
        LDR.W    R4,??DataTable5_3  ;; 0x4002c000
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//   23          HWREG(SPI_CTAR0_BASE+SPI_NUM*(0X1000))=0
//   24                                          //|SPI_CTAR_DBR_MASK
//   25                                          |SPI_CTAR_FMSZ(0X07)
//   26                                          |SPI_CTAR_PDT(0)
//   27                                          |SPI_CTAR_BR(0)
//   28                                          |SPI_CTAR_PCSSCK(2)
//   29                                         // |SPI_CTAR_CPOL_MASK
//   30                                         // |SPI_CTAR_CPHA_MASK
//   31                                          |SPI_CTAR_PBR(1)|SPI_CTAR_DBR_MASK;
        LDR.W    R2,??DataTable5_4  ;; 0xb8810000
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R3,#+4096
        LDR.W    R4,??DataTable5_5  ;; 0x4002c00c
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
        B.N      ??SPI_init_5
//   32                             
//   33      }
//   34     else 
//   35      {
//   36          HWREG(SPI_CTAR0_BASE+SPI_NUM*(0X1000))=0
//   37                                          |SPI_CTAR_FMSZ(0X07);
??SPI_init_4:
        MOVS     R2,#+939524096
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R3,#+4096
        LDR.W    R4,??DataTable5_5  ;; 0x4002c00c
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//   38                                         // |SPI_CTAR_CPOL_MASK
//   39                                          //|SPI_CTAR_CPHA_MASK;
//   40      }
//   41     HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))=0XFFFF0000;//全部清零
??SPI_init_5:
        LDR.W    R2,??DataTable5_6  ;; 0xffff0000
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R3,#+4096
        LDR.W    R4,??DataTable5_7  ;; 0x4002c02c
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//   42     HWREG(SPI_MCR_BASE+SPI_NUM*(0X1000))&=~SPI_MCR_HALT_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R2,#+4096
        LDR.W    R3,??DataTable5_3  ;; 0x4002c000
        MLA      R2,R2,R0,R3
        LDR      R2,[R2, #+0]
        LSRS     R2,R2,#+1
        LSLS     R2,R2,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R3,#+4096
        LDR.W    R4,??DataTable5_3  ;; 0x4002c000
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//   43  }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   44 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function GPIOType_SPI
          CFI NoCalls
        THUMB
//   45 void GPIOType_SPI(uint32 SPI_NUM,uint8 PCSx_NUM,uint8 SCK,uint8 SOUT,uint8 SIN)
//   46  {
GPIOType_SPI:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        LDR      R4,[SP, #+12]
//   47      if(SPI_NUM==SPI0)
        CMP      R0,#+0
        BNE.W    ??GPIOType_SPI_0
//   48       {
//   49           switch(SCK)
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R5,R2
        CMP      R5,#+1
        BEQ.N    ??GPIOType_SPI_1
        CMP      R5,#+10
        BEQ.N    ??GPIOType_SPI_2
        CMP      R5,#+14
        BEQ.N    ??GPIOType_SPI_3
        B.N      ??GPIOType_SPI_4
//   50            {
//   51            case SPI0_SCK_PTA15:PORTA_PCR15=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_1:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_8  ;; 0x4004903c
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_4
//   52            case SPI0_SCK_PTC5:PORTC_PCR5=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_2:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_9  ;; 0x4004b014
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_4
//   53            case SPI0_SCK_PTD1:PORTD_PCR1=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_3:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_10  ;; 0x4004c004
        STR      R5,[R6, #+0]
//   54            }
//   55           switch(PCSx_NUM)
??GPIOType_SPI_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R5,R1
        CMP      R5,#+0
        BEQ.N    ??GPIOType_SPI_5
        CMP      R5,#+4
        BEQ.N    ??GPIOType_SPI_6
        CMP      R5,#+5
        BEQ.N    ??GPIOType_SPI_7
        CMP      R5,#+6
        BEQ.N    ??GPIOType_SPI_8
        CMP      R5,#+7
        BEQ.N    ??GPIOType_SPI_9
        CMP      R5,#+8
        BEQ.N    ??GPIOType_SPI_10
        CMP      R5,#+9
        BEQ.N    ??GPIOType_SPI_11
        CMP      R5,#+13
        BEQ.N    ??GPIOType_SPI_12
        CMP      R5,#+17
        BEQ.N    ??GPIOType_SPI_13
        CMP      R5,#+18
        BEQ.N    ??GPIOType_SPI_14
        CMP      R5,#+19
        BEQ.N    ??GPIOType_SPI_15
        B.N      ??GPIOType_SPI_16
//   56            {
//   57            case SPI0_PCS0_PTA14:PORTA_PCR14=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_5:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_11  ;; 0x40049038
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_16
//   58            case SPI0_PCS5_PTB23:PORTB_PCR23=0|PORT_PCR_MUX(3)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_6:
        MOV      R5,#+832
        LDR.W    R6,??DataTable5_12  ;; 0x4004a05c
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_16
//   59            case SPI0_PCS4_PTC0:PORTC_PCR0=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_7:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_13  ;; 0x4004b000
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_16
//   60            case SPI0_PCS3_PTC1:PORTC_PCR1=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_8:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_14  ;; 0x4004b004
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_16
//   61            case SPI0_PCS2_PTC2:PORTC_PCR2=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_9:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_15  ;; 0x4004b008
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_16
//   62            case SPI0_PCS1_PTC3:PORTC_PCR3=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_10:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_16  ;; 0x4004b00c
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_16
//   63            case SPI0_PCS0_PTC4:PORTC_PCR4=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_11:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_17  ;; 0x4004b010
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_16
//   64            case SPI0_PCS0_PTD0:PORTD_PCR0=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_12:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_18  ;; 0x4004c000
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_16
//   65            case SPI0_PCS1_PTD4:PORTD_PCR4=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_13:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_19  ;; 0x4004c010
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_16
//   66            case SPI0_PCS2_PTD5:PORTD_PCR5=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_14:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_20  ;; 0x4004c014
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_16
//   67            case SPI0_PCS3_PTD6:PORTD_PCR6=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_15:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_21  ;; 0x4004c018
        STR      R5,[R6, #+0]
//   68            }
//   69           switch(SOUT)
??GPIOType_SPI_16:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R5,R3
        CMP      R5,#+2
        BEQ.N    ??GPIOType_SPI_17
        CMP      R5,#+11
        BEQ.N    ??GPIOType_SPI_18
        CMP      R5,#+15
        BEQ.N    ??GPIOType_SPI_19
        B.N      ??GPIOType_SPI_20
//   70            {
//   71            case SPI0_SOUT_PTA16:PORTA_PCR16=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_17:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_22  ;; 0x40049040
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_20
//   72            case SPI0_SOUT_PTC6:PORTC_PCR6=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_18:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_23  ;; 0x4004b018
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_20
//   73            case SPI0_SOUT_PTD2:PORTD_PCR2=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_19:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_24  ;; 0x4004c008
        STR      R5,[R6, #+0]
//   74            }
//   75           switch(SIN)
??GPIOType_SPI_20:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R5,R4
        CMP      R5,#+1
        BEQ.N    ??GPIOType_SPI_21
        CMP      R5,#+3
        BEQ.N    ??GPIOType_SPI_22
        CMP      R5,#+16
        BEQ.N    ??GPIOType_SPI_23
        B.N      ??GPIOType_SPI_0
//   76            {
//   77            case SPI0_SIN_PTA17:PORTA_PCR17=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_22:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_25  ;; 0x40049044
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_0
//   78            case SPI0_SIN_PTC7:PORTC_PCR7=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_21:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_26  ;; 0x4004b01c
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_0
//   79            case SPI0_SIN_PTD3:PORTD_PCR3=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_23:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_27  ;; 0x4004c00c
        STR      R5,[R6, #+0]
//   80            }
//   81       }
//   82      if(SPI_NUM==SPI1)
??GPIOType_SPI_0:
        CMP      R0,#+1
        BNE.N    ??GPIOType_SPI_24
//   83       {
//   84            switch(PCSx_NUM)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R5,R1
        CMP      R5,#+0
        BEQ.N    ??GPIOType_SPI_25
        CMP      R5,#+6
        BEQ.N    ??GPIOType_SPI_26
        CMP      R5,#+7
        BEQ.N    ??GPIOType_SPI_27
        CMP      R5,#+8
        BEQ.N    ??GPIOType_SPI_28
        CMP      R5,#+9
        BEQ.N    ??GPIOType_SPI_29
        CMP      R5,#+10
        BEQ.N    ??GPIOType_SPI_30
        B.N      ??GPIOType_SPI_31
//   85            {
//   86            case SPI1_PCS1_PTE0:PORTE_PCR1=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_25:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_28  ;; 0x4004d004
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_31
//   87            case SPI1_PCS0_PTE4:PORTE_PCR4=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_26:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_29  ;; 0x4004d010
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_31
//   88            case SPI1_PCS2_PTE5:PORTE_PCR5=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_27:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_30  ;; 0x4004d014
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_31
//   89            case SPI1_PCS3_PTE6:PORTE_PCR6=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_28:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_31  ;; 0x4004d018
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_31
//   90            case SPI1_PCS1_PTB9:PORTB_PCR9=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_29:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_32  ;; 0x4004a024
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_31
//   91            case SPI1_PCS0_PTB10:PORTB_PCR10=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_30:
        MOV      R5,#+576
        LDR.W    R6,??DataTable5_33  ;; 0x4004a028
        STR      R5,[R6, #+0]
//   92            }
//   93           switch(SCK)
??GPIOType_SPI_31:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R5,R2
        CMP      R5,#+3
        BEQ.N    ??GPIOType_SPI_32
        CMP      R5,#+11
        BEQ.N    ??GPIOType_SPI_33
        B.N      ??GPIOType_SPI_34
//   94            {
//   95            case SPI1_SCK_PTE2:PORTE_PCR2=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_32:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_34  ;; 0x4004d008
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_34
//   96            case SPI1_SCK_PTB11:PORTB_PCR11=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_33:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_35  ;; 0x4004a02c
        STR      R5,[R6, #+0]
//   97            }
//   98           switch(SOUT)
??GPIOType_SPI_34:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R5,R3
        CMP      R5,#+1
        BEQ.N    ??GPIOType_SPI_35
        CMP      R5,#+5
        BEQ.N    ??GPIOType_SPI_36
        CMP      R5,#+12
        BEQ.N    ??GPIOType_SPI_37
        B.N      ??GPIOType_SPI_38
//   99            {
//  100            case SPI1_SOUT_PTE1:PORTE_PCR1=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_35:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_28  ;; 0x4004d004
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_38
//  101            case SPI1_SOUT_PTE3:PORTE_PCR3=0|PORT_PCR_MUX(7)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_36:
        MOV      R5,#+1856
        LDR.N    R6,??DataTable5_36  ;; 0x4004d00c
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_38
//  102            case SPI1_SOUT_PTB16:PORTB_PCR16=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_37:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_37  ;; 0x4004a040
        STR      R5,[R6, #+0]
//  103            }
//  104           switch(SIN)
??GPIOType_SPI_38:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R5,R4
        CMP      R5,#+2
        BEQ.N    ??GPIOType_SPI_39
        CMP      R5,#+4
        BEQ.N    ??GPIOType_SPI_40
        CMP      R5,#+13
        BEQ.N    ??GPIOType_SPI_41
        B.N      ??GPIOType_SPI_24
//  105            {
//  106            case SPI1_SIN_PTE1:PORTE_PCR1=0|PORT_PCR_MUX(7)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_39:
        MOV      R5,#+1856
        LDR.N    R6,??DataTable5_28  ;; 0x4004d004
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_24
//  107            case SPI1_SIN_PTE3:PORTE_PCR3=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_40:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_36  ;; 0x4004d00c
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_24
//  108            case SPI1_SIN_PTB17:PORTB_PCR17=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_41:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_38  ;; 0x4004a044
        STR      R5,[R6, #+0]
//  109            }
//  110       }
//  111      if(SPI_NUM==SPI2)
??GPIOType_SPI_24:
        CMP      R0,#+128
        BNE.N    ??GPIOType_SPI_42
//  112       {
//  113            switch(PCSx_NUM)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R5,R1
        CMP      R5,#+0
        BEQ.N    ??GPIOType_SPI_43
        CMP      R5,#+4
        BEQ.N    ??GPIOType_SPI_44
        CMP      R5,#+8
        BEQ.N    ??GPIOType_SPI_45
        B.N      ??GPIOType_SPI_46
//  114            {
//  115            case SPI2_PCS0_PTB20:PORTB_PCR20=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_43:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_39  ;; 0x4004a050
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_46
//  116            case SPI2_PCS0_PTD11:PORTD_PCR11=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_44:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_40  ;; 0x4004c02c
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_46
//  117            case SPI2_PCS1_PTD15:PORTD_PCR15=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_45:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_41  ;; 0x4004c03c
        STR      R5,[R6, #+0]
//  118            }
//  119           switch(SCK)
??GPIOType_SPI_46:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R5,R2
        CMP      R5,#+1
        BEQ.N    ??GPIOType_SPI_47
        CMP      R5,#+5
        BEQ.N    ??GPIOType_SPI_48
        B.N      ??GPIOType_SPI_49
//  120            {
//  121            case SPI2_SCK_PTB21:PORTB_PCR21=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_47:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_42  ;; 0x4004a054
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_49
//  122            case SPI2_SCK_PTD12:PORTD_PCR12=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_48:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_43  ;; 0x4004c030
        STR      R5,[R6, #+0]
//  123            }
//  124           switch(SOUT)
??GPIOType_SPI_49:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R5,R3
        CMP      R5,#+2
        BEQ.N    ??GPIOType_SPI_50
        CMP      R5,#+6
        BEQ.N    ??GPIOType_SPI_51
        B.N      ??GPIOType_SPI_52
//  125            {
//  126            case SPI2_SOUT_PTB22:PORTB_PCR22=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_50:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_44  ;; 0x4004a058
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_52
//  127            case SPI2_SOUT_PTD13:PORTD_PCR13=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_51:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_45  ;; 0x4004c034
        STR      R5,[R6, #+0]
//  128            }
//  129           switch(SIN)
??GPIOType_SPI_52:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R5,R4
        CMP      R5,#+3
        BEQ.N    ??GPIOType_SPI_53
        CMP      R5,#+7
        BEQ.N    ??GPIOType_SPI_54
        B.N      ??GPIOType_SPI_42
//  130            {
//  131            case SPI2_SIN_PTB23:PORTB_PCR23=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_53:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_12  ;; 0x4004a05c
        STR      R5,[R6, #+0]
        B.N      ??GPIOType_SPI_42
//  132            case SPI2_SIN_PTD14:PORTD_PCR14=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
??GPIOType_SPI_54:
        MOV      R5,#+576
        LDR.N    R6,??DataTable5_46  ;; 0x4004c038
        STR      R5,[R6, #+0]
//  133            }
//  134       }
//  135  }
??GPIOType_SPI_42:
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  136 //*********************************************************
//  137 //函数名称：SPI_Send
//  138 //参数：SPI_NUM:SPI0~SPI3
//  139 //      len:数据长度
//  140 //      data[]:传输数据数组
//  141 //*********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SPI_Send
          CFI NoCalls
        THUMB
//  142 void SPI_Send(uint8 SPI_NUM,uint8 len,uint8 data[])
//  143  {
SPI_Send:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//  144     uint8 i=0;
        MOVS     R3,#+0
//  145     HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))=0XFFFF0000;//全部清零
        LDR.N    R4,??DataTable5_6  ;; 0xffff0000
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R5,#+4096
        LDR.N    R6,??DataTable5_7  ;; 0x4002c02c
        MLA      R5,R5,R0,R6
        STR      R4,[R5, #+0]
//  146     HWREG(SPI_MCR_BASE+SPI_NUM*(0X1000))|=SPI_MCR_CLR_TXF_MASK
//  147                                         |SPI_MCR_CLR_RXF_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R4,#+4096
        LDR.N    R5,??DataTable5_3  ;; 0x4002c000
        MLA      R4,R4,R0,R5
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0xC00
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R5,#+4096
        LDR.N    R6,??DataTable5_3  ;; 0x4002c000
        MLA      R5,R5,R0,R6
        STR      R4,[R5, #+0]
//  148     for(i=0;i<len;i++)
        MOVS     R4,#+0
        MOVS     R3,R4
??SPI_Send_0:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R3,R1
        BCS.N    ??SPI_Send_1
//  149      {
//  150          if(i==len-1)
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R4,R1,#+1
        CMP      R3,R4
        BNE.N    ??SPI_Send_2
//  151           {
//  152          HWREG(SPI_PUSHR_BASE+SPI_NUM*(0X1000))=SPI_PUSHR_CTAS(0)
//  153                                                 |SPI_PUSHR_EOQ_MASK
//  154                                                 |SPI_PUSHR_PCS(1)
//  155                                                 |SPI_PUSHR_TXDATA(data[i]);
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R2]
        LDR.N    R5,??DataTable5_47  ;; 0x8010000
        ORRS     R4,R5,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R5,#+4096
        LDR.N    R6,??DataTable5_48  ;; 0x4002c034
        MLA      R5,R5,R0,R6
        STR      R4,[R5, #+0]
        B.N      ??SPI_Send_3
//  156           }
//  157          else
//  158           {
//  159           HWREG(SPI_PUSHR_BASE+SPI_NUM*(0X1000))=SPI_PUSHR_CONT_MASK
//  160                                                 |SPI_PUSHR_CTAS(0)
//  161                                                 |SPI_PUSHR_PCS(1)   
//  162                                                 |SPI_PUSHR_TXDATA(data[i]);    
??SPI_Send_2:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R2]
        LDR.N    R5,??DataTable5_49  ;; 0x80010000
        ORRS     R4,R5,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R5,#+4096
        LDR.N    R6,??DataTable5_48  ;; 0x4002c034
        MLA      R5,R5,R0,R6
        STR      R4,[R5, #+0]
//  163           }
//  164          while(!(HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))&(SPI_SR_TCF_MASK)));
??SPI_Send_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R4,#+4096
        LDR.N    R5,??DataTable5_7  ;; 0x4002c02c
        MLA      R4,R4,R0,R5
        LDR      R4,[R4, #+0]
        CMP      R4,#+0
        BPL.N    ??SPI_Send_3
//  165          HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))|=SPI_SR_TCF_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R4,#+4096
        LDR.N    R5,??DataTable5_7  ;; 0x4002c02c
        MLA      R4,R4,R0,R5
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x80000000
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R5,#+4096
        LDR.N    R6,??DataTable5_7  ;; 0x4002c02c
        MLA      R5,R5,R0,R6
        STR      R4,[R5, #+0]
//  166      }
        ADDS     R3,R3,#+1
        B.N      ??SPI_Send_0
//  167  }
??SPI_Send_1:
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  168 
//  169 //*********************************************************
//  170 //函数名称：SPI_Read
//  171 //参数：SPI_NUM:SPI0~SPI3
//  172 //      data[]:传输数据数组
//  173 //*********************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SPI_Read
          CFI NoCalls
        THUMB
//  174 void SPI_Read(uint8 SPI_NUM,uint8* data)
//  175  {
SPI_Read:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  176      while(!((HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))&SPI_SR_RFDF_MASK)>>1));
??SPI_Read_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R2,#+4096
        LDR.N    R3,??DataTable5_7  ;; 0x4002c02c
        MLA      R2,R2,R0,R3
        LDR      R2,[R2, #+0]
        LSRS     R2,R2,#+1
        LSLS     R2,R2,#+15
        BPL.N    ??SPI_Read_0
//  177           *data=(uint8)HWREG(SPI_POPR_BASE+SPI_NUM*(0X1000));
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R2,#+4096
        LDR.N    R3,??DataTable5_50  ;; 0x4002c038
        MLA      R2,R2,R0,R3
        LDR      R2,[R2, #+0]
        STRB     R2,[R1, #+0]
//  178           HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))|=SPI_SR_RFDF_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R2,#+4096
        LDR.N    R3,??DataTable5_7  ;; 0x4002c02c
        MLA      R2,R2,R0,R3
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x20000
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R3,#+4096
        LDR.N    R4,??DataTable5_7  ;; 0x4002c02c
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//  179      HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))=0XFFFF0000;
        LDR.N    R2,??DataTable5_6  ;; 0xffff0000
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R3,#+4096
        LDR.N    R4,??DataTable5_7  ;; 0x4002c02c
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//  180      HWREG(SPI_MCR_BASE+SPI_NUM*0X1000)|=SPI_MCR_CLR_TXF_MASK
//  181                                         |SPI_MCR_CLR_RXF_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R2,#+4096
        LDR.N    R3,??DataTable5_3  ;; 0x4002c000
        MLA      R2,R2,R0,R3
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0xC00
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R3,#+4096
        LDR.N    R4,??DataTable5_3  ;; 0x4002c000
        MLA      R3,R3,R0,R4
        STR      R2,[R3, #+0]
//  182  }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  183 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SPIx_ReadWriteByte
          CFI NoCalls
        THUMB
//  184 uint8 SPIx_ReadWriteByte(uint8 TX_DATA)
//  185  {
SPIx_ReadWriteByte:
        MOVS     R1,R0
//  186      uint8 date;
//  187           HWREG(SPI_PUSHR_BASE+SPI2*(0X1000))=SPI_PUSHR_CONT_MASK
//  188                                                 |SPI_PUSHR_CTAS(0)
//  189                                                 |SPI_PUSHR_PCS(1)   
//  190                                                 |SPI_PUSHR_TXDATA(TX_DATA); 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R2,??DataTable5_49  ;; 0x80010000
        ORRS     R2,R2,R1
        LDR.N    R3,??DataTable5_51  ;; 0x400ac034
        STR      R2,[R3, #+0]
//  191      while(!(HWREG(SPI_SR_BASE+SPI2*(0X1000))&(SPI_SR_TCF_MASK)));
??SPIx_ReadWriteByte_0:
        LDR.N    R2,??DataTable5_52  ;; 0x400ac02c
        LDR      R2,[R2, #+0]
        CMP      R2,#+0
        BPL.N    ??SPIx_ReadWriteByte_0
//  192      while(!((HWREG(SPI_SR_BASE+SPI2*(0X1000))&SPI_SR_RFDF_MASK)>>1));
??SPIx_ReadWriteByte_1:
        LDR.N    R2,??DataTable5_52  ;; 0x400ac02c
        LDR      R2,[R2, #+0]
        LSRS     R2,R2,#+1
        LSLS     R2,R2,#+15
        BPL.N    ??SPIx_ReadWriteByte_1
//  193      date=(uint8)HWREG(SPI_POPR_BASE+SPI2*(0X1000));
        LDR.N    R2,??DataTable5_53  ;; 0x400ac038
        LDR      R2,[R2, #+0]
        MOVS     R0,R2
//  194      HWREG(SPI_SR_BASE+SPI2*(0X1000))=0XFFFF0000;
        LDR.N    R2,??DataTable5_6  ;; 0xffff0000
        LDR.N    R3,??DataTable5_52  ;; 0x400ac02c
        STR      R2,[R3, #+0]
//  195      HWREG(SPI_MCR_BASE+SPI2*(0X1000))|=SPI_MCR_CLR_TXF_MASK
//  196                                        |SPI_MCR_CLR_RXF_MASK;
        LDR.N    R2,??DataTable5_54  ;; 0x400ac000
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0xC00
        LDR.N    R3,??DataTable5_54  ;; 0x400ac000
        STR      R2,[R3, #+0]
//  197       return date;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  198  }
//  199 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SPIx_ReadWriteByte_last
          CFI NoCalls
        THUMB
//  200 uint8 SPIx_ReadWriteByte_last(uint8 TX_DATA)
//  201  {
SPIx_ReadWriteByte_last:
        MOVS     R1,R0
//  202      uint8 date;
//  203      HWREG(SPI_PUSHR_BASE+SPI0*(0X1000))=SPI_PUSHR_CTAS(0)
//  204                                                 |SPI_PUSHR_EOQ_MASK
//  205                                                 |SPI_PUSHR_PCS(1)
//  206                                                 |SPI_PUSHR_TXDATA(TX_DATA); 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R2,??DataTable5_47  ;; 0x8010000
        ORRS     R2,R2,R1
        LDR.N    R3,??DataTable5_48  ;; 0x4002c034
        STR      R2,[R3, #+0]
//  207      while(!(HWREG(SPI_SR_BASE+SPI0*(0X1000))&(SPI_SR_TCF_MASK)));
??SPIx_ReadWriteByte_last_0:
        LDR.N    R2,??DataTable5_7  ;; 0x4002c02c
        LDR      R2,[R2, #+0]
        CMP      R2,#+0
        BPL.N    ??SPIx_ReadWriteByte_last_0
//  208      while(!((HWREG(SPI_SR_BASE+SPI0*(0X1000))&SPI_SR_RFDF_MASK)>>1));
??SPIx_ReadWriteByte_last_1:
        LDR.N    R2,??DataTable5_7  ;; 0x4002c02c
        LDR      R2,[R2, #+0]
        LSRS     R2,R2,#+1
        LSLS     R2,R2,#+15
        BPL.N    ??SPIx_ReadWriteByte_last_1
//  209      date=(uint8)HWREG(SPI_POPR_BASE+SPI0*(0X1000));
        LDR.N    R2,??DataTable5_50  ;; 0x4002c038
        LDR      R2,[R2, #+0]
        MOVS     R0,R2
//  210      HWREG(SPI_SR_BASE+SPI0*(0X1000))=0XFFFF0000;
        LDR.N    R2,??DataTable5_6  ;; 0xffff0000
        LDR.N    R3,??DataTable5_7  ;; 0x4002c02c
        STR      R2,[R3, #+0]
//  211      HWREG(SPI_MCR_BASE+SPI0*(0X1000))|=SPI_MCR_CLR_TXF_MASK
//  212                                         |SPI_MCR_CLR_RXF_MASK;
        LDR.N    R2,??DataTable5_3  ;; 0x4002c000
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0xC00
        LDR.N    R3,??DataTable5_3  ;; 0x4002c000
        STR      R2,[R3, #+0]
//  213       return date;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  214  }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x83f0c01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x4002c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0xb8810000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x4002c00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0xffff0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x4002c02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     0x4004903c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     0x4004b014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     0x4004c004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0x40049038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     0x4004a05c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     0x4004b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     0x4004b004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_15:
        DC32     0x4004b008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_16:
        DC32     0x4004b00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_17:
        DC32     0x4004b010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_18:
        DC32     0x4004c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_19:
        DC32     0x4004c010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_20:
        DC32     0x4004c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_21:
        DC32     0x4004c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_22:
        DC32     0x40049040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_23:
        DC32     0x4004b018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_24:
        DC32     0x4004c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_25:
        DC32     0x40049044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_26:
        DC32     0x4004b01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_27:
        DC32     0x4004c00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_28:
        DC32     0x4004d004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_29:
        DC32     0x4004d010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_30:
        DC32     0x4004d014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_31:
        DC32     0x4004d018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_32:
        DC32     0x4004a024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_33:
        DC32     0x4004a028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_34:
        DC32     0x4004d008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_35:
        DC32     0x4004a02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_36:
        DC32     0x4004d00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_37:
        DC32     0x4004a040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_38:
        DC32     0x4004a044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_39:
        DC32     0x4004a050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_40:
        DC32     0x4004c02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_41:
        DC32     0x4004c03c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_42:
        DC32     0x4004a054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_43:
        DC32     0x4004c030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_44:
        DC32     0x4004a058

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_45:
        DC32     0x4004c034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_46:
        DC32     0x4004c038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_47:
        DC32     0x8010000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_48:
        DC32     0x4002c034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_49:
        DC32     0x80010000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_50:
        DC32     0x4002c038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_51:
        DC32     0x400ac034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_52:
        DC32     0x400ac02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_53:
        DC32     0x400ac038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_54:
        DC32     0x400ac000

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
// 1 596 bytes in section .text
// 
// 1 596 bytes of CODE memory
//
//Errors: none
//Warnings: none
