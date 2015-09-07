///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:14
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\UART.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\UART.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\UART.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC GPIOType_UART
        PUBLIC UARTINT_Disable
        PUBLIC UARTINT_Enable
        PUBLIC UART_CountRead
        PUBLIC UART_FIFO_Read_value
        PUBLIC UART_FIFO_read_init
        PUBLIC UART_INIT
        PUBLIC UART_R1
        PUBLIC UART_RN
        PUBLIC UART_S1
        PUBLIC UART_SN
        PUBLIC UART_SS
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\UART.c
//    1 #include "all.h"
//    2 
//    3 //******************************************************************
//    4 //函数名：void GPIOType_UART(uint32 PORT_R_T)
//    5 //简介：定义UART引脚
//    6 //参数：略,.H里面有定义
//    7 //******************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function GPIOType_UART
          CFI NoCalls
        THUMB
//    8 void GPIOType_UART(uint32 PORT_R_T)
//    9  {
//   10      switch(PORT_R_T)
GPIOType_UART:
        CMP      R0,#+0
        BEQ.N    ??GPIOType_UART_0
        CMP      R0,#+2
        BEQ.N    ??GPIOType_UART_1
        BCC.N    ??GPIOType_UART_2
        CMP      R0,#+4
        BEQ.N    ??GPIOType_UART_3
        BCC.N    ??GPIOType_UART_4
        CMP      R0,#+6
        BEQ.W    ??GPIOType_UART_5
        BCC.N    ??GPIOType_UART_6
        CMP      R0,#+8
        BEQ.W    ??GPIOType_UART_7
        BCC.W    ??GPIOType_UART_8
        CMP      R0,#+10
        BEQ.W    ??GPIOType_UART_9
        BCC.W    ??GPIOType_UART_10
        CMP      R0,#+12
        BEQ.W    ??GPIOType_UART_11
        BCC.W    ??GPIOType_UART_12
        CMP      R0,#+13
        BEQ.N    ??GPIOType_UART_13
        B.N      ??GPIOType_UART_14
//   11       {
//   12           //UART0
//   13       case PORTD_6_7:PORTD_PCR6|=PORT_PCR_MUX(0X3);
??GPIOType_UART_0:
        LDR.W    R1,??DataTable8  ;; 0x4004c018
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8  ;; 0x4004c018
        STR      R1,[R2, #+0]
//   14                       PORTD_PCR7|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_1  ;; 0x4004c01c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_1  ;; 0x4004c01c
        STR      R1,[R2, #+0]
//   15                       break;
        B.N      ??GPIOType_UART_14
//   16       case PORTB_16_17:PORTB_PCR16|=PORT_PCR_MUX(0x3);
??GPIOType_UART_2:
        LDR.W    R1,??DataTable8_2  ;; 0x4004a040
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_2  ;; 0x4004a040
        STR      R1,[R2, #+0]
//   17                        PORTB_PCR17|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_3  ;; 0x4004a044
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_3  ;; 0x4004a044
        STR      R1,[R2, #+0]
//   18                        break;
        B.N      ??GPIOType_UART_14
//   19       case PORTA_14_15:PORTA_PCR14|=PORT_PCR_MUX(0X3);
??GPIOType_UART_1:
        LDR.W    R1,??DataTable8_4  ;; 0x40049038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_4  ;; 0x40049038
        STR      R1,[R2, #+0]
//   20                         PORTA_PCR15|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_5  ;; 0x4004903c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_5  ;; 0x4004903c
        STR      R1,[R2, #+0]
//   21                         break;
        B.N      ??GPIOType_UART_14
//   22      case PORTA_1_2:  PORTA_PCR1|=PORT_PCR_MUX(0X2);
??GPIOType_UART_13:
        LDR.W    R1,??DataTable8_6  ;; 0x40049004
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x200
        LDR.W    R2,??DataTable8_6  ;; 0x40049004
        STR      R1,[R2, #+0]
//   23                         PORTA_PCR2|=PORT_PCR_MUX(0X2);
        LDR.W    R1,??DataTable8_7  ;; 0x40049008
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x200
        LDR.W    R2,??DataTable8_7  ;; 0x40049008
        STR      R1,[R2, #+0]
//   24                         break;
        B.N      ??GPIOType_UART_14
//   25          //UART1
//   26       case PORTE_0_1:PORTE_PCR0|=PORT_PCR_MUX(0X3);
??GPIOType_UART_4:
        LDR.W    R1,??DataTable8_8  ;; 0x4004d000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_8  ;; 0x4004d000
        STR      R1,[R2, #+0]
//   27                       PORTE_PCR1|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_9  ;; 0x4004d004
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_9  ;; 0x4004d004
        STR      R1,[R2, #+0]
//   28                         break;
        B.N      ??GPIOType_UART_14
//   29       case PORTC_3_4:PORTC_PCR3|=PORT_PCR_MUX(0X3);
??GPIOType_UART_3:
        LDR.W    R1,??DataTable8_10  ;; 0x4004b00c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_10  ;; 0x4004b00c
        STR      R1,[R2, #+0]
//   30                       PORTC_PCR4|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_11  ;; 0x4004b010
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_11  ;; 0x4004b010
        STR      R1,[R2, #+0]
//   31                       break;
        B.N      ??GPIOType_UART_14
//   32       //UART2
//   33       case PORTD_2_3:PORTD_PCR2|=PORT_PCR_MUX(0X3);
??GPIOType_UART_6:
        LDR.W    R1,??DataTable8_12  ;; 0x4004c008
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_12  ;; 0x4004c008
        STR      R1,[R2, #+0]
//   34                      PORTD_PCR3|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_13  ;; 0x4004c00c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_13  ;; 0x4004c00c
        STR      R1,[R2, #+0]
//   35                      break;
        B.N      ??GPIOType_UART_14
//   36       //UART3
//   37       case PORTE_4_5:PORTE_PCR4|=PORT_PCR_MUX(0X3);
??GPIOType_UART_5:
        LDR.W    R1,??DataTable8_14  ;; 0x4004d010
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_14  ;; 0x4004d010
        STR      R1,[R2, #+0]
//   38                       PORTE_PCR5|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_15  ;; 0x4004d014
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_15  ;; 0x4004d014
        STR      R1,[R2, #+0]
//   39                       break;
        B.N      ??GPIOType_UART_14
//   40       case PORTB_10_11:PORTB_PCR10|=PORT_PCR_MUX(0X3);
??GPIOType_UART_8:
        LDR.W    R1,??DataTable8_16  ;; 0x4004a028
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_16  ;; 0x4004a028
        STR      R1,[R2, #+0]
//   41                         PORTB_PCR11|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_17  ;; 0x4004a02c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_17  ;; 0x4004a02c
        STR      R1,[R2, #+0]
//   42                        break;
        B.N      ??GPIOType_UART_14
//   43       case PORTC_16_17:PORTC_PCR16|=PORT_PCR_MUX(0X3);
??GPIOType_UART_7:
        LDR.W    R1,??DataTable8_18  ;; 0x4004b040
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_18  ;; 0x4004b040
        STR      R1,[R2, #+0]
//   44                        PORTC_PCR17|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_19  ;; 0x4004b044
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_19  ;; 0x4004b044
        STR      R1,[R2, #+0]
//   45                        break;
        B.N      ??GPIOType_UART_14
//   46       //UART4
//   47       case  PORTE_24_25:PORTE_PCR24|=PORT_PCR_MUX(0X3);
??GPIOType_UART_10:
        LDR.W    R1,??DataTable8_20  ;; 0x4004d060
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_20  ;; 0x4004d060
        STR      R1,[R2, #+0]
//   48                         PORTE_PCR25|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_21  ;; 0x4004d064
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_21  ;; 0x4004d064
        STR      R1,[R2, #+0]
//   49                         break;
        B.N      ??GPIOType_UART_14
//   50       case PORTC_14_15:PORTC_PCR14|=PORT_PCR_MUX(0X3);
??GPIOType_UART_9:
        LDR.W    R1,??DataTable8_22  ;; 0x4004b038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_22  ;; 0x4004b038
        STR      R1,[R2, #+0]
//   51                         PORTC_PCR15|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_23  ;; 0x4004b03c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_23  ;; 0x4004b03c
        STR      R1,[R2, #+0]
//   52                         break;
        B.N      ??GPIOType_UART_14
//   53       //UART5
//   54       case PORTE_8_9:PORTE_PCR8|=PORT_PCR_MUX(0X3);
??GPIOType_UART_12:
        LDR.W    R1,??DataTable8_24  ;; 0x4004d020
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_24  ;; 0x4004d020
        STR      R1,[R2, #+0]
//   55                       PORTE_PCR9|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_25  ;; 0x4004d024
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_25  ;; 0x4004d024
        STR      R1,[R2, #+0]
//   56                       break;
        B.N      ??GPIOType_UART_14
//   57       case PORTD_8_9:PORTD_PCR8|=PORT_PCR_MUX(0X3);
??GPIOType_UART_11:
        LDR.W    R1,??DataTable8_26  ;; 0x4004c020
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_26  ;; 0x4004c020
        STR      R1,[R2, #+0]
//   58                       PORTD_PCR9|=PORT_PCR_MUX(0X3);
        LDR.W    R1,??DataTable8_27  ;; 0x4004c024
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x300
        LDR.W    R2,??DataTable8_27  ;; 0x4004c024
        STR      R1,[R2, #+0]
//   59                       break;             
//   60                        
//   61       }
//   62  }
??GPIOType_UART_14:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   63 //******************************************************************************
//   64 //函数名称：void  UART_INIT(uint32 UART_NUM,uint32 SYS_CLOCK,uint32 BAUD)
//   65 //简介：UART初始化函数
//   66 //参数：UART_NUM   从UART0-5
//   67 //      SYS_CLOCK:系统时钟
//   68 //      BAUD:设定波特率       //待解决
//   69 //*******************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function UART_INIT
          CFI NoCalls
        THUMB
//   70 void UART_INIT(uint32 UART_NUM,uint32 BUS_CLOCK,uint32 BAUD)
//   71  {
UART_INIT:
        PUSH     {R4-R7}
          CFI R7 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//   72       uint16 sbr,brfa;
//   73       uint8 temp;
//   74       if(UART_NUM<4)
        CMP      R0,#+4
        BCS.N    ??UART_INIT_0
//   75         SIM_SCGC4|=1<<(UART_NUM+10);
        LDR.W    R6,??DataTable8_28  ;; 0x40048034
        LDR      R6,[R6, #+0]
        MOVS     R7,#+1
        ADDS     R12,R0,#+10
        LSLS     R7,R7,R12
        ORRS     R6,R7,R6
        LDR.W    R7,??DataTable8_28  ;; 0x40048034
        STR      R6,[R7, #+0]
        B.N      ??UART_INIT_1
//   76     else SIM_SCGC1|=1<<(UART_NUM+6-124);
??UART_INIT_0:
        LDR.W    R6,??DataTable8_29  ;; 0x40048028
        LDR      R6,[R6, #+0]
        MOVS     R7,#+1
        MOV      R12,R0
        SUBS     R12,R12,#+118
        LSLS     R7,R7,R12
        ORRS     R6,R7,R6
        LDR.W    R7,??DataTable8_29  ;; 0x40048028
        STR      R6,[R7, #+0]
//   77       //关闭串口发送与接受功能
//   78       HWREG8(UART_C2_BASE+UART_NUM*(0X1000))&=~(UART_C2_TE_MASK|UART_C2_RE_MASK);
??UART_INIT_1:
        MOV      R6,#+4096
        LDR.W    R7,??DataTable8_30  ;; 0x4006a003
        MLA      R6,R6,R0,R7
        LDRB     R6,[R6, #+0]
        ANDS     R6,R6,#0xF3
        MOV      R7,#+4096
        LDR.W    R12,??DataTable8_30  ;; 0x4006a003
        MLA      R7,R7,R0,R12
        STRB     R6,[R7, #+0]
//   79       //配置串口工作模式：8位无校验模式
//   80       HWREG8(UART_C1_BASE +UART_NUM*(0X1000))=0;
        MOVS     R6,#+0
        MOV      R7,#+4096
        LDR.W    R12,??DataTable8_31  ;; 0x4006a002
        MLA      R7,R7,R0,R12
        STRB     R6,[R7, #+0]
//   81       //配置baud rate:
//   82       //串口0，1使用的内核时钟，其他串口使用总线时钟，一般设定内核时钟为总线时钟的2倍
//   83       if(UART_NUM<2) BUS_CLOCK+=BUS_CLOCK;
        CMP      R0,#+2
        BCS.N    ??UART_INIT_2
        ADDS     R1,R1,R1
//   84       sbr=(BUS_CLOCK*1000)/(BAUD*16);           
??UART_INIT_2:
        MOV      R6,#+1000
        MUL      R6,R6,R1
        LSLS     R7,R2,#+4
        UDIV     R6,R6,R7
        MOVS     R3,R6
//   85       if(sbr>0x1fff) sbr=0x1fff;
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+8192
        BLT.N    ??UART_INIT_3
        MOVW     R6,#+8191
        MOVS     R3,R6
//   86       temp=HWREG8(UART_BDH_BASE+UART_NUM*(0X1000))&(~(0X1F));
??UART_INIT_3:
        MOV      R6,#+4096
        LDR.W    R7,??DataTable8_32  ;; 0x4006a000
        MLA      R6,R6,R0,R7
        LDRB     R6,[R6, #+0]
        ANDS     R6,R6,#0xE0
        MOVS     R5,R6
//   87       HWREG8(UART_BDH_BASE+UART_NUM*(0X1000))=(uint8)temp|UART_BDH_SBR((sbr&0x1f00)>>8);
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LSRS     R6,R3,#+8
        ANDS     R6,R6,#0x1F
        ORRS     R6,R6,R5
        MOV      R7,#+4096
        LDR.W    R12,??DataTable8_32  ;; 0x4006a000
        MLA      R7,R7,R0,R12
        STRB     R6,[R7, #+0]
//   88       HWREG8(UART_BDL_BASE+UART_NUM*(0X1000))=(uint8)(sbr&UART_BDL_SBR_MASK);
        MOV      R6,#+4096
        LDR.W    R7,??DataTable8_33  ;; 0x4006a001
        MLA      R6,R6,R0,R7
        STRB     R3,[R6, #+0]
//   89       brfa=(BUS_CLOCK*1000)/(BAUD)-(sbr*32);
        MOV      R6,#+1000
        MUL      R6,R6,R1
        UDIV     R6,R6,R2
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        SUBS     R6,R6,R3, LSL #+5
        MOVS     R4,R6
//   90       temp=HWREG8(UART_C4_BASE+UART_NUM*(0X1000))&(~UART_C4_BRFA(0X1F));
        MOV      R6,#+4096
        LDR.W    R7,??DataTable8_34  ;; 0x4006a00a
        MLA      R6,R6,R0,R7
        LDRB     R6,[R6, #+0]
        ANDS     R6,R6,#0xE0
        MOVS     R5,R6
//   91       HWREG8(UART_C4_BASE+UART_NUM*(0X1000))=(uint8)temp|UART_C4_BRFA(brfa);
        ANDS     R6,R4,#0x1F
        ORRS     R6,R6,R5
        MOV      R7,#+4096
        LDR.W    R12,??DataTable8_34  ;; 0x4006a00a
        MLA      R7,R7,R0,R12
        STRB     R6,[R7, #+0]
//   92       //启动发送接受
//   93       HWREG8(UART_C2_BASE+UART_NUM*(0X1000))|=(uint8)(UART_C2_TE_MASK|UART_C2_RE_MASK);
        MOV      R6,#+4096
        LDR.N    R7,??DataTable8_30  ;; 0x4006a003
        MLA      R6,R6,R0,R7
        LDRB     R6,[R6, #+0]
        ORRS     R6,R6,#0xC
        MOV      R7,#+4096
        LDR.W    R12,??DataTable8_30  ;; 0x4006a003
        MLA      R7,R7,R0,R12
        STRB     R6,[R7, #+0]
//   94  }
        POP      {R4-R7}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   95 //******************************************************************************
//   96 //函数名：uint8 UART_RE1(uint32 UART_NUM,uint *fp)
//   97 //简介：接受一个数据
//   98 //参数：UART_NUM:0-5
//   99 //      fp:判断是否收到数据  1表示成功，0表示失败
//  100 //*****************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function UART_R1
          CFI NoCalls
        THUMB
//  101 uint8 UART_R1(uint32 UART_NUM,uint8 *fp)
//  102  {
UART_R1:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R2,R0
//  103     uint32 t;
//  104     uint8 date;
//  105     for(t=0;t<0xfbbb;t++)
        MOVS     R4,#+0
        MOVS     R3,R4
??UART_R1_0:
        MOVW     R4,#+64443
        CMP      R3,R4
        BCS.N    ??UART_R1_1
//  106      { 
//  107          if((HWREG8(UART_S1_BASE+UART_NUM*(0X1000))>>5)&(0X01))
        MOV      R4,#+4096
        LDR.N    R5,??DataTable8_35  ;; 0x4006a004
        MLA      R4,R4,R2,R5
        LDRB     R4,[R4, #+0]
        UBFX     R4,R4,#+5,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??UART_R1_2
//  108           {
//  109               date=HWREG8(UART_D_BASE +UART_NUM*(0X1000));
        MOV      R4,#+4096
        LDR.N    R5,??DataTable8_36  ;; 0x4006a007
        MLA      R4,R4,R2,R5
        LDRB     R4,[R4, #+0]
        MOVS     R0,R4
//  110               *fp=1;
        MOVS     R4,#+1
        STRB     R4,[R1, #+0]
//  111               break;
        B.N      ??UART_R1_1
//  112           }//endif
//  113      }//end for
??UART_R1_2:
        ADDS     R3,R3,#+1
        B.N      ??UART_R1_0
//  114     if(t>=0xfbbb)
??UART_R1_1:
        MOVW     R4,#+64443
        CMP      R3,R4
        BCC.N    ??UART_R1_3
//  115      {
//  116          date=0xff;
        MOVS     R4,#+255
        MOVS     R0,R4
//  117          *fp=0;//未收到数据
        MOVS     R4,#+0
        STRB     R4,[R1, #+0]
//  118      }
//  119     return date;
??UART_R1_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  120  }
//  121 
//  122 //***********************************************************************************\ 
//  123 //函数名称：uint8 UART_S1(uint32 UART_NUM,uint8 ch)
//  124 //简介：发送一个字节
//  125 //参数：UART_NUM:UART0~5
//  126 //      ch:字节
//  127 //返回值：1表示发送成功，0表示失败
//  128 //***********************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function UART_S1
          CFI NoCalls
        THUMB
//  129 uint8 UART_S1(uint32 UART_NUM,uint8 ch)
//  130  {
UART_S1:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
//  131       uint32 t;
//  132       for(t=0;t<0xfbbb;t++)
        MOVS     R0,#+0
        MOVS     R3,R0
??UART_S1_0:
        MOVW     R0,#+64443
        CMP      R3,R0
        BCS.N    ??UART_S1_1
//  133        {
//  134            //判断发送缓冲区是否为空
//  135            if((HWREG8(UART_S1_BASE+UART_NUM*(0X1000))>>7)&(0X01))
        MOV      R0,#+4096
        LDR.N    R4,??DataTable8_35  ;; 0x4006a004
        MLA      R0,R0,R2,R4
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??UART_S1_2
//  136             {
//  137                 HWREG8(UART_D_BASE +UART_NUM*(0X1000))=ch;
        MOV      R0,#+4096
        LDR.N    R4,??DataTable8_36  ;; 0x4006a007
        MLA      R0,R0,R2,R4
        STRB     R1,[R0, #+0]
//  138                 break;
        B.N      ??UART_S1_1
//  139             }
//  140        }
??UART_S1_2:
        ADDS     R3,R3,#+1
        B.N      ??UART_S1_0
//  141        if(t>=0xfbbb) return 0;//超时发送
??UART_S1_1:
        MOVW     R0,#+64443
        CMP      R3,R0
        BCC.N    ??UART_S1_3
        MOVS     R0,#+0
        B.N      ??UART_S1_4
//  142        else return 1;//表明数据发送成功
??UART_S1_3:
        MOVS     R0,#+1
??UART_S1_4:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  143  }
//  144 
//  145 //****************************************************************************
//  146 //函数名：uint8 UART_RN(uint32 UART_NUM,uint32 lenth,uint8* date) 
//  147 //简介：接受N个字节
//  148 //参数：UART_NUM  0~5
//  149 //      lenth:字符串长度
//  150 //      date:接受数据数组      
//  151 //****************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function UART_RN
        THUMB
//  152 uint8 UART_RN(uint32 UART_NUM,uint32 lenth,uint8* date)
//  153  {
UART_RN:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  154         uint32 i;
//  155         uint8 flag=1;
        MOVS     R0,#+1
        STRB     R0,[SP, #+0]
//  156         for(i=0;(i<lenth)&&(flag==1);i++)
        MOVS     R0,#+0
        MOVS     R7,R0
??UART_RN_0:
        CMP      R7,R5
        BCS.N    ??UART_RN_1
        LDRB     R0,[SP, #+0]
        CMP      R0,#+1
        BNE.N    ??UART_RN_1
//  157          {
//  158              date[i]=UART_R1(UART_NUM,&flag);
        ADD      R1,SP,#+0
        MOVS     R0,R4
          CFI FunCall UART_R1
        BL       UART_R1
        STRB     R0,[R7, R6]
//  159          }
        ADDS     R7,R7,#+1
        B.N      ??UART_RN_0
//  160         if(i>=lenth) return 1;//接受成功   （有差异？？？）
??UART_RN_1:
        CMP      R7,R5
        BCC.N    ??UART_RN_2
        MOVS     R0,#+1
        B.N      ??UART_RN_3
//  161         else return 0;
??UART_RN_2:
        MOVS     R0,#+0
??UART_RN_3:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock4
//  162  }
//  163 
//  164 //****************************************************************************
//  165 //函数名：uint8 UART_SN(uint32 UART_NUM,uint32 lenth,uint8* date) 
//  166 //简介：发送N个字节
//  167 //参数：UART_NUM  0~5
//  168 //      lenth:字符串长度
//  169 //      date:接受数据数组    
//  170 //返回值：1成功，0失败
//  171 //****************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function UART_SN
        THUMB
//  172 uint8 UART_SN(uint32 UART_NUM,uint32 lenth,uint8* date)
//  173  {
UART_SN:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  174      uint32 i;
//  175      for(i=0;i<lenth;i++)
        MOVS     R0,#+0
        MOVS     R7,R0
??UART_SN_0:
        CMP      R7,R5
        BCS.N    ??UART_SN_1
//  176       {
//  177           if(!UART_S1(UART_NUM,date[i]))
        LDRB     R1,[R7, R6]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
        CMP      R0,#+0
        BEQ.N    ??UART_SN_1
//  178               break;
//  179       }
??UART_SN_2:
        ADDS     R7,R7,#+1
        B.N      ??UART_SN_0
//  180      if(i>=lenth)
??UART_SN_1:
        CMP      R7,R5
        BCC.N    ??UART_SN_3
//  181          return 1;//表示成功
        MOVS     R0,#+1
        B.N      ??UART_SN_4
//  182      else return 0;//失败
??UART_SN_3:
        MOVS     R0,#+0
??UART_SN_4:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock5
//  183  }
//  184 //*************************************************************************
//  185 //函数名称：uint8 UART_SS(uint32 UART_NUM,void *buff)
//  186 //简介：传输一个字符串
//  187 //参数：NART_NUM0~5,   "STRING"
//  188 //************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function UART_SS
        THUMB
//  189 uint8 UART_SS(uint32 UART_NUM,void *buff)
//  190  {
UART_SS:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  191      uint32 i;
//  192      uint8 *date=(uint8 *)buff;
        MOVS     R7,R5
//  193      for(i=0;date[i]!='\0';i++)
        MOVS     R0,#+0
        MOVS     R6,R0
??UART_SS_0:
        LDRB     R0,[R6, R7]
        CMP      R0,#+0
        BEQ.N    ??UART_SS_1
//  194       {
//  195           if(!UART_S1(UART_NUM,date[i]))
        LDRB     R1,[R6, R7]
        MOVS     R0,R4
          CFI FunCall UART_S1
        BL       UART_S1
        CMP      R0,#+0
        BNE.N    ??UART_SS_2
//  196               return 1;
        MOVS     R0,#+1
        B.N      ??UART_SS_3
//  197       }
??UART_SS_2:
        ADDS     R6,R6,#+1
        B.N      ??UART_SS_0
//  198      return 0;
??UART_SS_1:
        MOVS     R0,#+0
??UART_SS_3:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock6
//  199      
//  200  }
//  201 
//  202 //*************************************************************
//  203 //函数名：void UARTINT_Enable(uint32 UART_NUM,uint32 INT_CLASS)
//  204 //简介：使能中断的类型
//  205 //参数：UART_NUM0~5  
//  206 //      INT_CLASS:ILIE，RIE，TCIE，TIE，PEIE，FEIE，NEIE，ORIE
//  207 //说明：此中断打开后，必须用Enable_IRQ()打开对应向量号才可使用
//  208 //*************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function UARTINT_Enable
          CFI NoCalls
        THUMB
//  209 void UARTINT_Enable(uint32 UART_NUM,uint32 INT_CLASS)
//  210  {
UARTINT_Enable:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  211      if(INT_CLASS<4)
        CMP      R1,#+4
        BCS.N    ??UARTINT_Enable_0
//  212          HWREG8(UART_C3_BASE+UART_NUM*(0X1000))|=1<<INT_CLASS;
        MOV      R2,#+4096
        LDR.N    R3,??DataTable8_37  ;; 0x4006a006
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+1
        LSLS     R3,R3,R1
        ORRS     R2,R3,R2
        MOV      R3,#+4096
        LDR.N    R4,??DataTable8_37  ;; 0x4006a006
        MLA      R3,R3,R0,R4
        STRB     R2,[R3, #+0]
        B.N      ??UARTINT_Enable_1
//  213      else HWREG8(UART_C2_BASE +UART_NUM*(0X1000))|=1<<INT_CLASS;
??UARTINT_Enable_0:
        MOV      R2,#+4096
        LDR.N    R3,??DataTable8_30  ;; 0x4006a003
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+1
        LSLS     R3,R3,R1
        ORRS     R2,R3,R2
        MOV      R3,#+4096
        LDR.N    R4,??DataTable8_30  ;; 0x4006a003
        MLA      R3,R3,R0,R4
        STRB     R2,[R3, #+0]
//  214  }
??UARTINT_Enable_1:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  215 
//  216 //***************************************************************
//  217 //同  UARTINT_Enable,关闭对应中断
//  218 //**************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function UARTINT_Disable
          CFI NoCalls
        THUMB
//  219 void UARTINT_Disable(uint32 UART_NUM,uint32 INT_CLASS)
//  220  {
UARTINT_Disable:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  221      if(INT_CLASS<4)
        CMP      R1,#+4
        BCS.N    ??UARTINT_Disable_0
//  222          HWREG8(UART_C3_BASE +UART_NUM*(0X1000))&=~((uint32)1<<INT_CLASS);
        MOV      R2,#+4096
        LDR.N    R3,??DataTable8_37  ;; 0x4006a006
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+1
        LSLS     R3,R3,R1
        BICS     R2,R2,R3
        MOV      R3,#+4096
        LDR.N    R4,??DataTable8_37  ;; 0x4006a006
        MLA      R3,R3,R0,R4
        STRB     R2,[R3, #+0]
        B.N      ??UARTINT_Disable_1
//  223      else HWREG8(UART_C2_BASE +UART_NUM*(0X1000))&=~((uint32)1<<INT_CLASS);
??UARTINT_Disable_0:
        MOV      R2,#+4096
        LDR.N    R3,??DataTable8_30  ;; 0x4006a003
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+1
        LSLS     R3,R3,R1
        BICS     R2,R2,R3
        MOV      R3,#+4096
        LDR.N    R4,??DataTable8_30  ;; 0x4006a003
        MLA      R3,R3,R0,R4
        STRB     R2,[R3, #+0]
//  224  }
??UARTINT_Disable_1:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  225 
//  226 //***************************************************************
//  227 //函数功能：使能FIFO功能  K60  UART0和UART1深度为8，其余为1
//  228 //初始化读的功能,传输功能暂时不考虑,bit表示一次传输的数据数
//  229 //***************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function UART_FIFO_read_init
          CFI NoCalls
        THUMB
//  230 void UART_FIFO_read_init(uint32 UART_NUM)
//  231  {
//  232      HWREG8(UART_C2_BASE+UART_NUM*(0X1000))&=~(UART_C2_TE_MASK|UART_C2_RE_MASK);//关闭TE,RE才可以开启FIFO
UART_FIFO_read_init:
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_30  ;; 0x4006a003
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        ANDS     R1,R1,#0xF3
        MOV      R2,#+4096
        LDR.N    R3,??DataTable8_30  ;; 0x4006a003
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+0]
//  233      HWREG8(UART_PFIFO_BASE+UART_NUM*(0X1000))|=UART_PFIFO_RXFE_MASK;
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_38  ;; 0x4006a010
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        ORRS     R1,R1,#0x8
        MOV      R2,#+4096
        LDR.N    R3,??DataTable8_38  ;; 0x4006a010
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+0]
//  234      HWREG8(UART_TWFIFO_BASE+UART_NUM*(0X1000))=0;
        MOVS     R1,#+0
        MOV      R2,#+4096
        LDR.N    R3,??DataTable8_39  ;; 0x4006a013
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+0]
//  235      HWREG8(UART_RWFIFO_BASE +UART_NUM*(0X1000))=FIFO_BIT;
        MOVS     R1,#+8
        MOV      R2,#+4096
        LDR.N    R3,??DataTable8_40  ;; 0x4006a015
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+0]
//  236      HWREG8(UART_C2_BASE+UART_NUM*(0X1000))|=(UART_C2_TE_MASK|UART_C2_RE_MASK);//打开TX,RX使用配置完成的FIFO
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_30  ;; 0x4006a003
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        ORRS     R1,R1,#0xC
        MOV      R2,#+4096
        LDR.N    R3,??DataTable8_30  ;; 0x4006a003
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+0]
//  237  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function UART_FIFO_Read_value
          CFI NoCalls
        THUMB
//  238 void UART_FIFO_Read_value(uint32 UART_NUM,uint8* date)
//  239  {
UART_FIFO_Read_value:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//  240      uint8 i,clear;
//  241      clear=HWREG8(UART_S1_BASE+UART_NUM*(0X1000));//读S1清标志位
        MOV      R4,#+4096
        LDR.N    R5,??DataTable8_35  ;; 0x4006a004
        MLA      R4,R4,R0,R5
        LDRB     R4,[R4, #+0]
        MOVS     R2,R4
//  242      for(i=0;i<8;i++)
        MOVS     R4,#+0
        MOVS     R3,R4
??UART_FIFO_Read_value_0:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+8
        BGE.N    ??UART_FIFO_Read_value_1
//  243       {
//  244          *date=HWREG8(UART_D_BASE+UART_NUM*(0X1000));
        MOV      R4,#+4096
        LDR.N    R5,??DataTable8_36  ;; 0x4006a007
        MLA      R4,R4,R0,R5
        LDRB     R4,[R4, #+0]
        STRB     R4,[R1, #+0]
//  245          date++;
        ADDS     R1,R1,#+1
//  246       }
        ADDS     R3,R3,#+1
        B.N      ??UART_FIFO_Read_value_0
//  247      HWREG8(UART_CFIFO_BASE+UART_NUM*(0X1000))|=0X40;//清空接受缓存，可删减
??UART_FIFO_Read_value_1:
        MOV      R4,#+4096
        LDR.N    R5,??DataTable8_41  ;; 0x4006a011
        MLA      R4,R4,R0,R5
        LDRB     R4,[R4, #+0]
        ORRS     R4,R4,#0x40
        MOV      R5,#+4096
        LDR.N    R6,??DataTable8_41  ;; 0x4006a011
        MLA      R5,R5,R0,R6
        STRB     R4,[R5, #+0]
//  248  }
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  249 /*
//  250 void UART_FIFO_Send(uint32 UART_NUM,uint8 date[])
//  251  {
//  252      uint8 i;
//  253      for(i=0;i<8;i++)
//  254       {
//  255           
//  256       }
//  257  }*/
//  258 //***************************************************************
//  259 //读取当前缓冲器中剩余的TX,RX的值
//  260 //***************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function UART_CountRead
          CFI NoCalls
        THUMB
//  261 void UART_CountRead(uint32 UART_NUM,uint8* TX_count,uint8* RX_count)
//  262  {
UART_CountRead:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  263      *TX_count=HWREG(UART_TCFIFO_BASE+UART_NUM*(0X1000));
        MOV      R3,#+4096
        LDR.N    R4,??DataTable8_42  ;; 0x4006a014
        MLA      R3,R3,R0,R4
        LDR      R3,[R3, #+0]
        STRB     R3,[R1, #+0]
//  264      *RX_count=HWREG(UART_RCFIFO_BASE+UART_NUM*(0X1000));
        MOV      R3,#+4096
        LDR.N    R4,??DataTable8_43  ;; 0x4006a016
        MLA      R3,R3,R0,R4
        LDR      R3,[R3, #+0]
        STRB     R3,[R2, #+0]
//  265  }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0x4004c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0x4004c01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x4004a040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0x4004a044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x40049038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0x4004903c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     0x40049004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     0x40049008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     0x4004d004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     0x4004b00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     0x4004b010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_12:
        DC32     0x4004c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_13:
        DC32     0x4004c00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_14:
        DC32     0x4004d010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_15:
        DC32     0x4004d014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_16:
        DC32     0x4004a028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_17:
        DC32     0x4004a02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_18:
        DC32     0x4004b040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_19:
        DC32     0x4004b044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_20:
        DC32     0x4004d060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_21:
        DC32     0x4004d064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_22:
        DC32     0x4004b038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_23:
        DC32     0x4004b03c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_24:
        DC32     0x4004d020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_25:
        DC32     0x4004d024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_26:
        DC32     0x4004c020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_27:
        DC32     0x4004c024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_28:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_29:
        DC32     0x40048028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_30:
        DC32     0x4006a003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_31:
        DC32     0x4006a002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_32:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_33:
        DC32     0x4006a001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_34:
        DC32     0x4006a00a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_35:
        DC32     0x4006a004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_36:
        DC32     0x4006a007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_37:
        DC32     0x4006a006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_38:
        DC32     0x4006a010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_39:
        DC32     0x4006a013

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_40:
        DC32     0x4006a015

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_41:
        DC32     0x4006a011

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_42:
        DC32     0x4006a014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_43:
        DC32     0x4006a016

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
// 1 676 bytes in section .text
// 
// 1 676 bytes of CODE memory
//
//Errors: none
//Warnings: 1
