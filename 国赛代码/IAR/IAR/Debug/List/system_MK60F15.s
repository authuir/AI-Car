///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:13
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\system_MK60F15.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\system_MK60F15.c" -lA
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
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\Debug\List\system_MK60F15.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC SystemCoreClock
        PUBLIC SystemCoreClockUpdate
        PUBLIC SystemInit
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\system_MK60F15.c
//    1 /*
//    2 ** ###################################################################
//    3 **     Compilers:           ARM Compiler
//    4 **                          Freescale C/C++ for Embedded ARM
//    5 **                          GNU C Compiler
//    6 **                          IAR ANSI C/C++ Compiler for ARM
//    7 **
//    8 **     Reference manual:    K60P144M150SF3RM, Rev. 2, Dec 2011
//    9 **     Version:             rev. 1.4, 2012-10-19
//   10 **
//   11 **     Abstract:
//   12 **         Provides a system configuration function and a global variable that
//   13 **         contains the system frequency. It configures the device and initializes
//   14 **         the oscillator (PLL) that is part of the microcontroller device.
//   15 **
//   16 **     Copyright: 2012 Freescale, Inc. All Rights Reserved.
//   17 **
//   18 **     http:                 www.freescale.com
//   19 **     mail:                 support@freescale.com
//   20 **
//   21 **     Revisions:
//   22 **     - rev. 1.0 (2011-08-24)
//   23 **         Initial version
//   24 **     - rev. 1.1 (2011-11-03)
//   25 **         Registers updated according to the new reference manual revision - Rev. 1, Oct 2011
//   26 **         Registers of the following modules have been updated - AXBS, CAN, I2S, MCG, MPU, NFC, RCM, RTC, SDHC, SIM, USBHS, WDOG
//   27 **         The following modules have been removed - DDR, DRY
//   28 **     - rev. 1.2 (2012-01-04)
//   29 **         Registers updated according to the new reference manual revision - Rev. 2, Dec 2011
//   30 **         EWM - INTEN bit in EWM_CTRL register has been added.
//   31 **         PDB - register PDB_PO0EN renamed to PRB_POEN.
//   32 **         PMC - BGEN bit in PMC_REGSC register has been removed.
//   33 **         SIM - several changes in SCGC registers. Bit USBHS in SOPT2 register removed.
//   34 **         UART - new bits RXOFE in regiter CFIFO and RXOF in register SFIFO.
//   35 **     - rev. 1.3 (2012-04-13)
//   36 **         Added new #define symbol MCU_MEM_MAP_VERSION_MINOR.
//   37 **         Added new #define symbols <peripheralType>_BASE_PTRS.
//   38 **     - rev. 1.4 (2012-10-19)
//   39 **         RTC - security related registers removed.
//   40 **         Interrupt Number Definitions updated - HardFault_IRQn has been added.
//   41 **
//   42 ** ###################################################################
//   43 */
//   44 
//   45 /**
//   46  * @file MK60F15
//   47  * @version 1.4
//   48  * @date 2012-10-19
//   49  * @brief Device specific configuration file for MK60F15 (implementation file)
//   50  *
//   51  * Provides a system configuration function and a global variable that contains
//   52  * the system frequency. It configures the device and initializes the oscillator
//   53  * (PLL) that is part of the microcontroller device.
//   54  */
//   55 
//   56 #include <stdint.h>
//   57 #include "MK60F15.h"
//   58 
//   59 #define DISABLE_WDOG    1
//   60 
//   61 
//   62 #define CLOCK_SETUP     0
//   63 /* Predefined clock setups
//   64    0 ... Multipurpose Clock Generator (MCG) in FLL Engaged Internal (FEI) mode
//   65          Reference clock source for MCG module is the slow internal clock source 32.768kHz
//   66          Core clock = 41.94MHz, BusClock = 41.94MHz
//   67    1 ... Multipurpose Clock Generator (MCG) in PLL Engaged External (PEE) mode
//   68          Reference clock source for MCG module is an external reference clock source 50MHz
//   69          Core clock = 120MHz, BusClock = 60MHz
//   70    2 ... Multipurpose Clock Generator (MCG) in Bypassed Low Power External (BLPE) mode
//   71          Core clock/Bus clock derived directly from an external reference clock source 50MHz with no multiplication
//   72          Core clock = 50MHz, BusClock = 50MHz
//   73 */
//   74 
//   75 /*----------------------------------------------------------------------------
//   76   Define clock source values
//   77  *----------------------------------------------------------------------------*/
//   78 #if (CLOCK_SETUP == 0)
//   79     #define CPU_XTAL0_CLK_HZ                50000000u /* Value of the external crystal or oscillator clock frequency in Hz connected to System Oscillator 0 */
//   80     #define CPU_XTAL1_CLK_HZ                8000000u  /* Value of the external crystal or oscillator clock frequency in Hz connected to System Oscillator 1 */
//   81     #define CPU_XTAL32k_CLK_HZ              32768u    /* Value of the external 32k crystal or oscillator clock frequency in Hz */
//   82     #define CPU_INT_SLOW_CLK_HZ             32768u    /* Value of the slow internal oscillator clock frequency in Hz  */
//   83     #define CPU_INT_FAST_CLK_HZ             4000000u  /* Value of the fast internal oscillator clock frequency in Hz  */
//   84     #define DEFAULT_SYSTEM_CLOCK            41943040u /* Default System clock value */
//   85 #elif (CLOCK_SETUP == 1)
//   86     #define CPU_XTAL0_CLK_HZ                50000000u /* Value of the external crystal or oscillator clock frequency in Hz connected to System Oscillator 0 */
//   87     #define CPU_XTAL1_CLK_HZ                8000000u  /* Value of the external crystal or oscillator clock frequency in Hz connected to System Oscillator 1 */
//   88     #define CPU_XTAL32k_CLK_HZ              32768u    /* Value of the external 32k crystal or oscillator clock frequency in Hz */
//   89     #define CPU_INT_SLOW_CLK_HZ             32768u    /* Value of the slow internal oscillator clock frequency in Hz  */
//   90     #define CPU_INT_FAST_CLK_HZ             4000000u  /* Value of the fast internal oscillator clock frequency in Hz  */
//   91     #define DEFAULT_SYSTEM_CLOCK            120000000u /* Default System clock value */
//   92 #elif (CLOCK_SETUP == 2)
//   93     #define CPU_XTAL0_CLK_HZ                50000000u /* Value of the external crystal or oscillator clock frequency in Hz connected to System Oscillator 0 */
//   94     #define CPU_XTAL1_CLK_HZ                8000000u  /* Value of the external crystal or oscillator clock frequency in Hz connected to System Oscillator 1 */
//   95     #define CPU_XTAL32k_CLK_HZ              32768u    /* Value of the external 32k crystal or oscillator clock frequency in Hz */
//   96     #define CPU_INT_SLOW_CLK_HZ             32768u    /* Value of the slow internal oscillator clock frequency in Hz  */
//   97     #define CPU_INT_FAST_CLK_HZ             4000000u  /* Value of the fast internal oscillator clock frequency in Hz  */
//   98     #define DEFAULT_SYSTEM_CLOCK            50000000u  /* Default System clock value */
//   99 #endif /* (CLOCK_SETUP == 2) */
//  100 
//  101 
//  102 /* ----------------------------------------------------------------------------
//  103    -- Core clock
//  104    ---------------------------------------------------------------------------- */
//  105 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  106 uint32_t SystemCoreClock = DEFAULT_SYSTEM_CLOCK;
SystemCoreClock:
        DATA
        DC32 41943040
//  107 
//  108 /* ----------------------------------------------------------------------------
//  109    -- SystemInit()
//  110    ---------------------------------------------------------------------------- */
//  111 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SystemInit
          CFI NoCalls
        THUMB
//  112 void SystemInit (void) {
//  113 #if ((__FPU_PRESENT == 1) && (__FPU_USED == 1))
//  114   SCB_CPACR |= ((3UL << 10*2) | (3UL << 11*2));    /* set CP10, CP11 Full Access */
//  115 #endif /* ((__FPU_PRESENT == 1) && (__FPU_USED == 1)) */
//  116 #if (DISABLE_WDOG)
//  117   /* Disable the WDOG module */
//  118   /* WDOG_UNLOCK: WDOGUNLOCK=0xC520 */
//  119   WDOG_UNLOCK = (uint16_t)0xC520u;     /* Key 1 */
SystemInit:
        MOVW     R0,#+50464
        LDR.N    R1,??DataTable1  ;; 0x4005200e
        STRH     R0,[R1, #+0]
//  120   /* WDOG_UNLOCK : WDOGUNLOCK=0xD928 */
//  121   WDOG_UNLOCK  = (uint16_t)0xD928u;    /* Key 2 */
        MOVW     R0,#+55592
        LDR.N    R1,??DataTable1  ;; 0x4005200e
        STRH     R0,[R1, #+0]
//  122   /* WDOG_STCTRLH: ??=0,DISTESTWDOG=0,BYTESEL=0,TESTSEL=0,TESTWDOG=0,??=0,STNDBYEN=1,WAITEN=1,STOPEN=1,DBGEN=0,ALLOWUPDATE=1,WINEN=0,IRQRSTEN=0,CLKSRC=1,WDOGEN=0 */
//  123   WDOG_STCTRLH = (uint16_t)0x01D2u;
        MOV      R0,#+466
        LDR.N    R1,??DataTable1_1  ;; 0x40052000
        STRH     R0,[R1, #+0]
//  124 #endif /* (DISABLE_WDOG) */
//  125 
//  126   /* System clock initialization */
//  127 #if (CLOCK_SETUP == 0)
//  128   /* SIM_SCGC5: PORTA=1 */
//  129   SIM_SCGC5 |= (uint32_t)0x0200UL;     /* Enable clock gate for ports to enable pin routing */
        LDR.N    R0,??DataTable1_2  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable1_2  ;; 0x40048038
        STR      R0,[R1, #+0]
//  130   /* SIM_CLKDIV1: OUTDIV1=0,OUTDIV2=0,OUTDIV3=1,OUTDIV4=1,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0 */
//  131   SIM_CLKDIV1 = (uint32_t)0x00110000UL; /* Update system prescalers */
        MOVS     R0,#+1114112
        LDR.N    R1,??DataTable1_3  ;; 0x40048044
        STR      R0,[R1, #+0]
//  132   /* SIM_SOPT2: PLLFLLSEL=0 */
//  133   SIM_SOPT2 &= (uint32_t)~0x00030000UL; /* Select FLL as a clock source for various peripherals */
        LDR.N    R0,??DataTable1_4  ;; 0x40048004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x30000
        LDR.N    R1,??DataTable1_4  ;; 0x40048004
        STR      R0,[R1, #+0]
//  134   /* SIM_SOPT1: OSC32KSEL=0 */
//  135   SIM_SOPT1 &= (uint32_t)~0x00080000UL; /* System oscillator drives 32 kHz clock for various peripherals */
        LDR.N    R0,??DataTable1_5  ;; 0x40047000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x80000
        LDR.N    R1,??DataTable1_5  ;; 0x40047000
        STR      R0,[R1, #+0]
//  136   /* SIM_SCGC1: OSC1=1 */
//  137   SIM_SCGC1 |= (uint32_t)0x20UL;
        LDR.N    R0,??DataTable1_6  ;; 0x40048028
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable1_6  ;; 0x40048028
        STR      R0,[R1, #+0]
//  138   /* PORTA_PCR18: ISF=0,MUX=0 */
//  139   PORTA_PCR18 &= (uint32_t)~0x01000700UL;
        LDR.N    R0,??DataTable1_7  ;; 0x40049048
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_8  ;; 0xfefff8ff
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable1_7  ;; 0x40049048
        STR      R0,[R1, #+0]
//  140   /* Switch to FEI Mode */
//  141   /* MCG_C1: CLKS=0,FRDIV=0,IREFS=1,IRCLKEN=1,IREFSTEN=0 */
//  142   MCG_C1 = (uint8_t)0x06U;
        MOVS     R0,#+6
        LDR.N    R1,??DataTable1_9  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  143   /* MCG_C2: LOCRE0=0,??=0,RANGE0=2,HGO0=0,EREFS0=0,LP=0,IRCS=0 */
//  144   MCG_C2 = (uint8_t)0x20U;
        MOVS     R0,#+32
        LDR.N    R1,??DataTable1_10  ;; 0x40064001
        STRB     R0,[R1, #+0]
//  145   /* MCG_C4: DMX32=0,DRST_DRS=1 */
//  146   MCG_C4 = (uint8_t)((MCG_C4 & (uint8_t)~(uint8_t)0xC0U) | (uint8_t)0x20U);
        LDR.N    R0,??DataTable1_11  ;; 0x40064003
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable1_11  ;; 0x40064003
        STRB     R0,[R1, #+0]
//  147   /* OSC0_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
//  148   OSC0_CR = (uint8_t)0x80U;
        MOVS     R0,#+128
        LDR.N    R1,??DataTable1_12  ;; 0x40065000
        STRB     R0,[R1, #+0]
//  149   /* OSC1_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
//  150   OSC1_CR = (uint8_t)0x80U;
        MOVS     R0,#+128
        LDR.N    R1,??DataTable1_13  ;; 0x400e5000
        STRB     R0,[R1, #+0]
//  151   /* MCG_C7: OSCSEL=0 */
//  152   MCG_C7 &= (uint8_t)~(uint8_t)0x01U;
        LDR.N    R0,??DataTable1_14  ;; 0x4006400c
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFE
        LDR.N    R1,??DataTable1_14  ;; 0x4006400c
        STRB     R0,[R1, #+0]
//  153   /* MCG_C5: PLLREFSEL0=0,PLLCLKEN0=0,PLLSTEN0=0,??=0,??=0,PRDIV0=0 */
//  154   MCG_C5 = (uint8_t)0x00U;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_15  ;; 0x40064004
        STRB     R0,[R1, #+0]
//  155   /* MCG_C6: LOLIE0=0,PLLS=0,CME0=0,VDIV0=0 */
//  156   MCG_C6 = (uint8_t)0x00U;             /* 3 */
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_16  ;; 0x40064005
        STRB     R0,[R1, #+0]
//  157   /* MCG_C11: PLLREFSEL1=0,PLLCLKEN1=0,PLLSTEN1=0,PLLCS=0,??=0,PRDIV1=0 */
//  158   MCG_C11 = (uint8_t)0x00U;            /* 3 */
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_17  ;; 0x40064010
        STRB     R0,[R1, #+0]
//  159   /* MCG_C12: LOLIE1=0,??=0,CME2=0,VDIV1=0 */
//  160   MCG_C12 = (uint8_t)0x00U;            /* 3 */
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_18  ;; 0x40064011
        STRB     R0,[R1, #+0]
//  161   while((MCG_S & MCG_S_IREFST_MASK) == 0x00U) { /* Check that the source of the FLL reference clock is the internal reference clock. */
??SystemInit_0:
        LDR.N    R0,??DataTable1_19  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??SystemInit_0
//  162   }
//  163   while((MCG_S & 0x0CU) != 0x00U) {    /* Wait until output of the FLL is selected */
??SystemInit_1:
        LDR.N    R0,??DataTable1_19  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+12
        TST      R0,R1
        BNE.N    ??SystemInit_1
//  164   }
//  165 #elif (CLOCK_SETUP == 1)
//  166   /* SIM_SCGC5: PORTA=1 */
//  167   SIM_SCGC5 |= (uint32_t)0x0200UL;     /* Enable clock gate for ports to enable pin routing */
//  168   /* SIM_CLKDIV1: OUTDIV1=0,OUTDIV2=1,OUTDIV3=3,OUTDIV4=5,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0 */
//  169   SIM_CLKDIV1 = (uint32_t)0x00250000UL; /* Update system prescalers */
//  170   /* SIM_SOPT2: PLLFLLSEL=1 */
//  171   SIM_SOPT2 = (uint32_t)((SIM_SOPT2 & (uint32_t)~0x00020000UL) | (uint32_t)0x00010000UL); /* Select PLL 0 as a clock source for various peripherals */
//  172   /* SIM_SOPT1: OSC32KSEL=0 */
//  173   SIM_SOPT1 &= (uint32_t)~0x00080000UL; /* System oscillator drives 32 kHz clock for various peripherals */
//  174   /* SIM_SCGC1: OSC1=1 */
//  175   SIM_SCGC1 |= (uint32_t)0x20UL;
//  176   /* PORTA_PCR18: ISF=0,MUX=0 */
//  177   PORTA_PCR18 &= (uint32_t)~0x01000700UL;
//  178   /* Switch to FBE Mode */
//  179   /* OSC0_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
//  180   OSC0_CR = (uint8_t)0x80U;
//  181   /* OSC1_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
//  182   OSC1_CR = (uint8_t)0x80U;
//  183   /* MCG_C7: OSCSEL=0 */
//  184   MCG_C7 &= (uint8_t)~(uint8_t)0x01U;
//  185   /* MCG_C2: LOCRE0=0,??=0,RANGE0=2,HGO0=0,EREFS0=0,LP=0,IRCS=0 */
//  186   MCG_C2 = (uint8_t)0x20U;
//  187   /* MCG_C1: CLKS=2,FRDIV=5,IREFS=0,IRCLKEN=1,IREFSTEN=0 */
//  188   MCG_C1 = (uint8_t)0xAAU;
//  189   /* MCG_C4: DMX32=0,DRST_DRS=0 */
//  190   MCG_C4 &= (uint8_t)~(uint8_t)0xE0U;
//  191   /* MCG_C5: PLLREFSEL0=0,PLLCLKEN0=0,PLLSTEN0=0,??=0,??=0,PRDIV0=4 */
//  192   MCG_C5 = (uint8_t)0x04U;
//  193   /* MCG_C6: LOLIE0=0,PLLS=0,CME0=0,VDIV0=30 */
//  194   MCG_C6 = (uint8_t)0x0EU;
//  195   /* MCG_C11: PLLREFSEL1=0,PLLCLKEN1=0,PLLSTEN1=0,PLLCS=0,??=0,PRDIV1=0 */
//  196   MCG_C11 = (uint8_t)0x00U;
//  197   /* MCG_C12: LOLIE1=0,??=0,CME2=0,VDIV1=0 */
//  198   MCG_C12 = (uint8_t)0x00U;
//  199   while((MCG_S & MCG_S_IREFST_MASK) != 0x00U) { /* Check that the source of the FLL reference clock is the external reference clock. */
//  200   }
//  201   while((MCG_S & 0x0CU) != 0x08U) {    /* Wait until external reference clock is selected as MCG output */
//  202   }
//  203   /* Switch to PBE Mode */
//  204   /* MCG_C6: LOLIE0=0,PLLS=1,CME0=0,VDIV0=8 */
//  205   MCG_C6 = (uint8_t)0x48U;
//  206   while((MCG_S & 0x0CU) != 0x08U) {    /* Wait until external reference clock is selected as MCG output */
//  207   }
//  208   while((MCG_S & MCG_S_LOCK0_MASK) == 0x00U) { /* Wait until PLL locked */
//  209   }
//  210   /* Switch to PEE Mode */
//  211   /* MCG_C1: CLKS=0,FRDIV=5,IREFS=0,IRCLKEN=1,IREFSTEN=0 */
//  212   MCG_C1 = (uint8_t)0x2AU;
//  213   while((MCG_S & 0x0CU) != 0x0CU) {    /* Wait until output of the PLL is selected */
//  214   }
//  215 #elif (CLOCK_SETUP == 2)
//  216   /* SIM_SCGC5: PORTA=1 */
//  217   SIM_SCGC5 |= (uint32_t)0x0200UL;     /* Enable clock gate for ports to enable pin routing */
//  218   /* SIM_CLKDIV1: OUTDIV1=0,OUTDIV2=0,OUTDIV3=1,OUTDIV4=1,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0 */
//  219   SIM_CLKDIV1 = (uint32_t)0x00110000UL; /* Update system prescalers */
//  220   /* SIM_SOPT2: PLLFLLSEL=0 */
//  221   SIM_SOPT2 &= (uint32_t)~0x00030000UL; /* Select FLL as a clock source for various peripherals */
//  222   /* SIM_SOPT1: OSC32KSEL=0 */
//  223   SIM_SOPT1 &= (uint32_t)~0x00080000UL; /* System oscillator drives 32 kHz clock for various peripherals */
//  224   /* SIM_SCGC1: OSC1=1 */
//  225   SIM_SCGC1 |= (uint32_t)0x20UL;
//  226   /* PORTA_PCR18: ISF=0,MUX=0 */
//  227   PORTA_PCR18 &= (uint32_t)~0x01000700UL;
//  228   /* Switch to FBE Mode */
//  229   /* OSC0_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
//  230   OSC0_CR = (uint8_t)0x80U;
//  231   /* OSC1_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
//  232   OSC1_CR = (uint8_t)0x80U;
//  233   /* MCG_C7: OSCSEL=0 */
//  234   MCG_C7 &= (uint8_t)~(uint8_t)0x01U;
//  235   /* MCG_C2: LOCRE0=0,??=0,RANGE0=2,HGO0=0,EREFS0=0,LP=0,IRCS=0 */
//  236   MCG_C2 = (uint8_t)0x20U;
//  237   /* MCG_C1: CLKS=2,FRDIV=5,IREFS=0,IRCLKEN=1,IREFSTEN=0 */
//  238   MCG_C1 = (uint8_t)0xAAU;
//  239   /* MCG_C4: DMX32=0,DRST_DRS=0 */
//  240   MCG_C4 &= (uint8_t)~(uint8_t)0xE0U;
//  241   /* MCG_C5: PLLREFSEL0=0,PLLCLKEN0=0,PLLSTEN0=0,??=0,??=0,PRDIV0=0 */
//  242   MCG_C5 = (uint8_t)0x00U;
//  243   /* MCG_C6: LOLIE0=0,PLLS=0,CME0=0,VDIV0=0 */
//  244   MCG_C6 = (uint8_t)0x00U;
//  245   /* MCG_C11: PLLREFSEL1=0,PLLCLKEN1=0,PLLSTEN1=0,PLLCS=0,??=0,PRDIV1=0 */
//  246   MCG_C11 = (uint8_t)0x00U;
//  247   /* MCG_C12: LOLIE1=0,??=0,CME2=0,VDIV1=0 */
//  248   MCG_C12 = (uint8_t)0x00U;
//  249   while((MCG_S & MCG_S_IREFST_MASK) != 0x00U) { /* Check that the source of the FLL reference clock is the external reference clock. */
//  250   }
//  251   while((MCG_S & 0x0CU) != 0x08U) {    /* Wait until external reference clock is selected as MCG output */
//  252   }
//  253   /* Switch to BLPE Mode */
//  254   /* MCG_C2: LOCRE0=0,??=0,RANGE0=2,HGO0=0,EREFS0=0,LP=1,IRCS=0 */
//  255   MCG_C2 = (uint8_t)0x22U;
//  256   while((MCG_S & 0x0CU) != 0x08U) {    /* Wait until external reference clock is selected as MCG output */
//  257   }
//  258 #endif /* (CLOCK_SETUP == 2) */
//  259 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  260 
//  261 /* ----------------------------------------------------------------------------
//  262    -- SystemCoreClockUpdate()
//  263    ---------------------------------------------------------------------------- */
//  264 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SystemCoreClockUpdate
          CFI NoCalls
        THUMB
//  265 void SystemCoreClockUpdate (void) {
SystemCoreClockUpdate:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  266   uint32_t MCGOUTClock;                                                        /* Variable to store output clock frequency of the MCG module */
//  267   uint8_t Divider;
//  268 
//  269   if ((MCG_C1 & MCG_C1_CLKS_MASK) == 0x0u) {
        LDR.N    R2,??DataTable1_9  ;; 0x40064000
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+192
        TST      R2,R3
        BNE.W    ??SystemCoreClockUpdate_0
//  270     /* Output of FLL or PLL is selected */
//  271     if ((MCG_C6 & MCG_C6_PLLS_MASK) == 0x0u) {
        LDR.N    R2,??DataTable1_16  ;; 0x40064005
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+25
        BMI.N    ??SystemCoreClockUpdate_1
//  272       /* FLL is selected */
//  273       if ((MCG_C1 & MCG_C1_IREFS_MASK) == 0x0u) {
        LDR.N    R2,??DataTable1_9  ;; 0x40064000
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+29
        BMI.N    ??SystemCoreClockUpdate_2
//  274         /* External reference clock is selected */
//  275         if ((MCG_C7 & MCG_C7_OSCSEL_MASK) == 0x0u) {
        LDR.N    R2,??DataTable1_14  ;; 0x4006400c
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+31
        BMI.N    ??SystemCoreClockUpdate_3
//  276           MCGOUTClock = CPU_XTAL0_CLK_HZ;                                       /* System oscillator 0 drives MCG clock */
        LDR.N    R2,??DataTable1_20  ;; 0x2faf080
        MOVS     R0,R2
        B.N      ??SystemCoreClockUpdate_4
//  277         } else { /* (!((MCG_C7 & MCG_C7_OSCSEL_MASK) == 0x0u)) */
//  278           MCGOUTClock = CPU_XTAL32k_CLK_HZ;                                    /* RTC 32 kHz oscillator drives MCG clock */
??SystemCoreClockUpdate_3:
        MOV      R2,#+32768
        MOVS     R0,R2
//  279         } /* (!((MCG_C7 & MCG_C7_OSCSEL_MASK) == 0x0u)) */
//  280         Divider = (uint8_t)(1u << ((MCG_C1 & MCG_C1_FRDIV_MASK) >> MCG_C1_FRDIV_SHIFT));
??SystemCoreClockUpdate_4:
        MOVS     R2,#+1
        LDR.N    R3,??DataTable1_9  ;; 0x40064000
        LDRB     R3,[R3, #+0]
        UBFX     R3,R3,#+3,#+3
        LSLS     R2,R2,R3
        MOVS     R1,R2
//  281         MCGOUTClock = (MCGOUTClock / Divider);  /* Calculate the divided FLL reference clock */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UDIV     R0,R0,R1
//  282         if ((MCG_C2 & MCG_C2_RANGE0_MASK) != 0x0u) {
        LDR.N    R2,??DataTable1_10  ;; 0x40064001
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+48
        TST      R2,R3
        BEQ.N    ??SystemCoreClockUpdate_5
//  283           MCGOUTClock /= 32u;                                                  /* If high range is enabled, additional 32 divider is active */
        LSRS     R0,R0,#+5
        B.N      ??SystemCoreClockUpdate_5
//  284         } /* ((MCG_C2 & MCG_C2_RANGE0_MASK) != 0x0u) */
//  285       } else { /* (!((MCG_C1 & MCG_C1_IREFS_MASK) == 0x0u)) */
//  286         MCGOUTClock = CPU_INT_SLOW_CLK_HZ;                                     /* The slow internal reference clock is selected */
??SystemCoreClockUpdate_2:
        MOV      R2,#+32768
        MOVS     R0,R2
//  287       } /* (!((MCG_C1 & MCG_C1_IREFS_MASK) == 0x0u)) */
//  288       /* Select correct multiplier to calculate the MCG output clock  */
//  289       switch (MCG_C4 & (MCG_C4_DMX32_MASK | MCG_C4_DRST_DRS_MASK)) {
??SystemCoreClockUpdate_5:
        LDR.N    R2,??DataTable1_11  ;; 0x40064003
        LDRB     R2,[R2, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ANDS     R2,R2,#0xE0
        CMP      R2,#+0
        BEQ.N    ??SystemCoreClockUpdate_6
        CMP      R2,#+32
        BEQ.N    ??SystemCoreClockUpdate_7
        CMP      R2,#+64
        BEQ.N    ??SystemCoreClockUpdate_8
        CMP      R2,#+96
        BEQ.N    ??SystemCoreClockUpdate_9
        CMP      R2,#+128
        BEQ.N    ??SystemCoreClockUpdate_10
        CMP      R2,#+160
        BEQ.N    ??SystemCoreClockUpdate_11
        CMP      R2,#+192
        BEQ.N    ??SystemCoreClockUpdate_12
        CMP      R2,#+224
        BEQ.N    ??SystemCoreClockUpdate_13
        B.N      ??SystemCoreClockUpdate_14
//  290         case 0x0u:
//  291           MCGOUTClock *= 640u;
??SystemCoreClockUpdate_6:
        MOV      R2,#+640
        MULS     R0,R2,R0
//  292           break;
        B.N      ??SystemCoreClockUpdate_15
//  293         case 0x20u:
//  294           MCGOUTClock *= 1280u;
??SystemCoreClockUpdate_7:
        MOV      R2,#+1280
        MULS     R0,R2,R0
//  295           break;
        B.N      ??SystemCoreClockUpdate_15
//  296         case 0x40u:
//  297           MCGOUTClock *= 1920u;
??SystemCoreClockUpdate_8:
        MOV      R2,#+1920
        MULS     R0,R2,R0
//  298           break;
        B.N      ??SystemCoreClockUpdate_15
//  299         case 0x60u:
//  300           MCGOUTClock *= 2560u;
??SystemCoreClockUpdate_9:
        MOV      R2,#+2560
        MULS     R0,R2,R0
//  301           break;
        B.N      ??SystemCoreClockUpdate_15
//  302         case 0x80u:
//  303           MCGOUTClock *= 732u;
??SystemCoreClockUpdate_10:
        MOV      R2,#+732
        MULS     R0,R2,R0
//  304           break;
        B.N      ??SystemCoreClockUpdate_15
//  305         case 0xA0u:
//  306           MCGOUTClock *= 1464u;
??SystemCoreClockUpdate_11:
        MOV      R2,#+1464
        MULS     R0,R2,R0
//  307           break;
        B.N      ??SystemCoreClockUpdate_15
//  308         case 0xC0u:
//  309           MCGOUTClock *= 2197u;
??SystemCoreClockUpdate_12:
        MOVW     R2,#+2197
        MULS     R0,R2,R0
//  310           break;
        B.N      ??SystemCoreClockUpdate_15
//  311         case 0xE0u:
//  312           MCGOUTClock *= 2929u;
??SystemCoreClockUpdate_13:
        MOVW     R2,#+2929
        MULS     R0,R2,R0
//  313           break;
        B.N      ??SystemCoreClockUpdate_15
//  314         default:
//  315           break;
??SystemCoreClockUpdate_14:
        B.N      ??SystemCoreClockUpdate_15
//  316       }
//  317     } else { /* (!((MCG_C6 & MCG_C6_PLLS_MASK) == 0x0u)) */
//  318       /* PLL is selected */
//  319       if ((MCG_C11 & MCG_C11_PLLCS_MASK) != 0x0u) {
??SystemCoreClockUpdate_1:
        LDR.N    R2,??DataTable1_17  ;; 0x40064010
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+27
        BPL.N    ??SystemCoreClockUpdate_16
//  320         /* PLL1 output is selected */
//  321         if ((MCG_C11 & MCG_C11_PLLREFSEL1_MASK) != 0x0u) {
        LDR.N    R2,??DataTable1_17  ;; 0x40064010
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+24
        BPL.N    ??SystemCoreClockUpdate_17
//  322           /* OSC1 clock source used as an external reference clock */
//  323           MCGOUTClock = CPU_XTAL1_CLK_HZ;
        LDR.N    R2,??DataTable1_21  ;; 0x7a1200
        MOVS     R0,R2
        B.N      ??SystemCoreClockUpdate_18
//  324         } else { /* (!((MCG_C11 & MCG_C11_PLLREFSEL1_MASK) != 0x0u)) */
//  325           /* OSC0 clock source used as an external reference clock */
//  326           MCGOUTClock = CPU_XTAL0_CLK_HZ;
??SystemCoreClockUpdate_17:
        LDR.N    R2,??DataTable1_20  ;; 0x2faf080
        MOVS     R0,R2
//  327         } /* (!((MCG_C11 & MCG_C11_PLLREFSEL1_MASK) != 0x0u)) */
//  328         Divider = (1u + (MCG_C11 & MCG_C11_PRDIV1_MASK));
??SystemCoreClockUpdate_18:
        LDR.N    R2,??DataTable1_17  ;; 0x40064010
        LDRB     R2,[R2, #+0]
        ANDS     R2,R2,#0x7
        ADDS     R2,R2,#+1
        MOVS     R1,R2
//  329         MCGOUTClock /= Divider;                                                  /* Calculate the PLL reference clock */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UDIV     R0,R0,R1
//  330         Divider = ((MCG_C12 & MCG_C12_VDIV1_MASK) + 16u);
        LDR.N    R2,??DataTable1_18  ;; 0x40064011
        LDRB     R2,[R2, #+0]
        ANDS     R2,R2,#0x1F
        ADDS     R2,R2,#+16
        MOVS     R1,R2
//  331         MCGOUTClock = (MCGOUTClock * Divider) / 2u;                              /* Calculate the MCG output clock */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MULS     R0,R1,R0
        LSRS     R0,R0,#+1
        B.N      ??SystemCoreClockUpdate_15
//  332       } else { /* (!((MCG_C11 & MCG_C11_PLLCS_MASK) != 0x0u)) */
//  333         /* PLL0 output is selected */
//  334         if ((MCG_C5 & MCG_C5_PLLREFSEL0_MASK) != 0x0u) {
??SystemCoreClockUpdate_16:
        LDR.N    R2,??DataTable1_15  ;; 0x40064004
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+24
        BPL.N    ??SystemCoreClockUpdate_19
//  335           /* OSC1 clock source used as an external reference clock */
//  336           MCGOUTClock = CPU_XTAL1_CLK_HZ;
        LDR.N    R2,??DataTable1_21  ;; 0x7a1200
        MOVS     R0,R2
        B.N      ??SystemCoreClockUpdate_20
//  337         } else { /* (!((MCG_C5 & MCG_C5_PLLREFSEL0_MASK) != 0x0u)) */
//  338           /* OSC0 clock source used as an external reference clock */
//  339           MCGOUTClock = CPU_XTAL0_CLK_HZ;
??SystemCoreClockUpdate_19:
        LDR.N    R2,??DataTable1_20  ;; 0x2faf080
        MOVS     R0,R2
//  340         } /* (!((MCG_C5 & MCG_C5_PLLREFSEL0_MASK) != 0x0u)) */
//  341         Divider = (1u + (MCG_C5 & MCG_C5_PRDIV0_MASK));
??SystemCoreClockUpdate_20:
        LDR.N    R2,??DataTable1_15  ;; 0x40064004
        LDRB     R2,[R2, #+0]
        ANDS     R2,R2,#0x7
        ADDS     R2,R2,#+1
        MOVS     R1,R2
//  342         MCGOUTClock /= Divider;                                                  /* Calculate the PLL reference clock */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UDIV     R0,R0,R1
//  343         Divider = ((MCG_C6 & MCG_C6_VDIV0_MASK) + 16u);
        LDR.N    R2,??DataTable1_16  ;; 0x40064005
        LDRB     R2,[R2, #+0]
        ANDS     R2,R2,#0x1F
        ADDS     R2,R2,#+16
        MOVS     R1,R2
//  344         MCGOUTClock = (MCGOUTClock * Divider) / 2u;                              /* Calculate the MCG output clock */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MULS     R0,R1,R0
        LSRS     R0,R0,#+1
        B.N      ??SystemCoreClockUpdate_15
//  345       } /* (!((MCG_C11 & MCG_C11_PLLCS_MASK) != 0x0u)) */
//  346     } /* (!((MCG_C6 & MCG_C6_PLLS_MASK) == 0x0u)) */
//  347   } else if ((MCG_C1 & MCG_C1_CLKS_MASK) == 0x40u) {
??SystemCoreClockUpdate_0:
        LDR.N    R2,??DataTable1_9  ;; 0x40064000
        LDRB     R2,[R2, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ANDS     R2,R2,#0xC0
        CMP      R2,#+64
        BNE.N    ??SystemCoreClockUpdate_21
//  348     /* Internal reference clock is selected */
//  349     if ((MCG_C2 & MCG_C2_IRCS_MASK) == 0x0u) {
        LDR.N    R2,??DataTable1_10  ;; 0x40064001
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+31
        BMI.N    ??SystemCoreClockUpdate_22
//  350       MCGOUTClock = CPU_INT_SLOW_CLK_HZ;                                       /* Slow internal reference clock selected */
        MOV      R2,#+32768
        MOVS     R0,R2
        B.N      ??SystemCoreClockUpdate_15
//  351     } else { /* (!((MCG_C2 & MCG_C2_IRCS_MASK) == 0x0u)) */
//  352       MCGOUTClock = CPU_INT_FAST_CLK_HZ / (1 << ((MCG_SC & MCG_SC_FCRDIV_MASK) >> MCG_SC_FCRDIV_SHIFT));  /* Fast internal reference clock selected */
??SystemCoreClockUpdate_22:
        LDR.N    R2,??DataTable1_22  ;; 0x3d0900
        MOVS     R3,#+1
        LDR.N    R4,??DataTable1_23  ;; 0x40064008
        LDRB     R4,[R4, #+0]
        UBFX     R4,R4,#+1,#+3
        LSLS     R3,R3,R4
        UDIV     R2,R2,R3
        MOVS     R0,R2
        B.N      ??SystemCoreClockUpdate_15
//  353     } /* (!((MCG_C2 & MCG_C2_IRCS_MASK) == 0x0u)) */
//  354   } else if ((MCG_C1 & MCG_C1_CLKS_MASK) == 0x80u) {
??SystemCoreClockUpdate_21:
        LDR.N    R2,??DataTable1_9  ;; 0x40064000
        LDRB     R2,[R2, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ANDS     R2,R2,#0xC0
        CMP      R2,#+128
        BNE.N    ??SystemCoreClockUpdate_23
//  355     /* External reference clock is selected */
//  356     if ((MCG_C7 & MCG_C7_OSCSEL_MASK) == 0x0u) {
        LDR.N    R2,??DataTable1_14  ;; 0x4006400c
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+31
        BMI.N    ??SystemCoreClockUpdate_24
//  357       MCGOUTClock = CPU_XTAL0_CLK_HZ;                                           /* System oscillator drives MCG clock */
        LDR.N    R2,??DataTable1_20  ;; 0x2faf080
        MOVS     R0,R2
        B.N      ??SystemCoreClockUpdate_15
//  358     } else { /* (!((MCG_C7 & MCG_C7_OSCSEL_MASK) == 0x0u)) */
//  359       MCGOUTClock = CPU_XTAL32k_CLK_HZ;                                        /* RTC 32 kHz oscillator drives MCG clock */
??SystemCoreClockUpdate_24:
        MOV      R2,#+32768
        MOVS     R0,R2
        B.N      ??SystemCoreClockUpdate_15
//  360     } /* (!((MCG_C7 & MCG_C7_OSCSEL_MASK) == 0x0u)) */
//  361   } else { /* (!((MCG_C1 & MCG_C1_CLKS_MASK) == 0x80u)) */
//  362     /* Reserved value */
//  363     return;
??SystemCoreClockUpdate_23:
        B.N      ??SystemCoreClockUpdate_25
//  364   } /* (!((MCG_C1 & MCG_C1_CLKS_MASK) == 0x80u)) */
//  365   SystemCoreClock = (MCGOUTClock / (1u + ((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV1_MASK) >> SIM_CLKDIV1_OUTDIV1_SHIFT)));
??SystemCoreClockUpdate_15:
        LDR.N    R2,??DataTable1_3  ;; 0x40048044
        LDR      R2,[R2, #+0]
        LSRS     R2,R2,#+28
        ADDS     R2,R2,#+1
        UDIV     R2,R0,R2
        LDR.N    R3,??DataTable1_24
        STR      R2,[R3, #+0]
//  366 }
??SystemCoreClockUpdate_25:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x4005200e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x40052000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x40048004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x40047000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x40048028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     0x40049048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     0xfefff8ff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     0x40064000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     0x40064001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     0x40064003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     0x40065000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     0x400e5000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     0x4006400c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     0x40064004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     0x40064005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     0x40064010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     0x40064011

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     0x40064006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_20:
        DC32     0x2faf080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_21:
        DC32     0x7a1200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_22:
        DC32     0x3d0900

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_23:
        DC32     0x40064008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_24:
        DC32     SystemCoreClock

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
//   4 bytes in section .data
// 718 bytes in section .text
// 
// 718 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
