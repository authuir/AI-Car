///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:08
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\I2C.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\I2C.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\I2C.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN PORT_Enable
        EXTERN SYSDelay_us

        PUBLIC I2CINT_Disable
        PUBLIC I2CINT_Enable
        PUBLIC I2C_INIT
        PUBLIC I2C_R1
        PUBLIC I2C_RN
        PUBLIC I2C_W1
        PUBLIC I2C_WN
        PUBLIC I2C_signal
        PUBLIC I2C_wait
        PUBLIC a
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\I2C.c
//    1 #include "all.h"

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    2 uint8 a;
a:
        DS8 1
//    3 //****************************************************************
//    4 //初始化I2C，参数定义在I2C.h
//    5 //波特率可选，在函数内部 修改。
//    6 //***************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function I2C_INIT
        THUMB
//    7 void I2C_INIT(uint32 I2C_NUM,char PIN_NUM)
//    8  {
I2C_INIT:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//    9      SIM_SCGC4|=(uint32)(1<<(6+I2C_NUM));
        LDR.W    R0,??DataTable8  ;; 0x40048034
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ADDS     R2,R4,#+6
        LSLS     R1,R1,R2
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable8  ;; 0x40048034
        STR      R0,[R1, #+0]
//   10      switch(PIN_NUM)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??I2C_INIT_0
        CMP      R5,#+2
        BEQ.N    ??I2C_INIT_1
        BCC.N    ??I2C_INIT_2
        CMP      R5,#+4
        BEQ.N    ??I2C_INIT_3
        BCC.N    ??I2C_INIT_4
        B.N      ??I2C_INIT_5
//   11       {
//   12       case I2C0_PB0_PB1:
//   13                 PORT_Enable(PORTB);
??I2C_INIT_0:
        MOVS     R0,#+1
          CFI FunCall PORT_Enable
        BL       PORT_Enable
//   14                 PORTB_PCR0=PORT_PCR_MUX(2);
        MOV      R0,#+512
        LDR.W    R1,??DataTable8_1  ;; 0x4004a000
        STR      R0,[R1, #+0]
//   15                 PORTB_PCR1=PORT_PCR_MUX(2);
        MOV      R0,#+512
        LDR.W    R1,??DataTable8_2  ;; 0x4004a004
        STR      R0,[R1, #+0]
//   16                 break;
        B.N      ??I2C_INIT_5
//   17       case I2C0_PB2_PB3:
//   18                 PORT_Enable(PORTB);
??I2C_INIT_2:
        MOVS     R0,#+1
          CFI FunCall PORT_Enable
        BL       PORT_Enable
//   19                 PORTB_PCR2=PORT_PCR_MUX(2);
        MOV      R0,#+512
        LDR.W    R1,??DataTable8_3  ;; 0x4004a008
        STR      R0,[R1, #+0]
//   20                 PORTB_PCR3=PORT_PCR_MUX(2);
        MOV      R0,#+512
        LDR.W    R1,??DataTable8_4  ;; 0x4004a00c
        STR      R0,[R1, #+0]
//   21                 break;
        B.N      ??I2C_INIT_5
//   22       case I2C1_PC10_PC11:
//   23                 PORT_Enable(PORTC);
??I2C_INIT_1:
        MOVS     R0,#+2
          CFI FunCall PORT_Enable
        BL       PORT_Enable
//   24                 PORTC_PCR10=PORT_PCR_MUX(2);
        MOV      R0,#+512
        LDR.W    R1,??DataTable8_5  ;; 0x4004b028
        STR      R0,[R1, #+0]
//   25                 PORTC_PCR11=PORT_PCR_MUX(2);
        MOV      R0,#+512
        LDR.W    R1,??DataTable8_6  ;; 0x4004b02c
        STR      R0,[R1, #+0]
//   26                 break;
        B.N      ??I2C_INIT_5
//   27       case I2C0_PD8_PD9:
//   28                 PORT_Enable(PORTD);
??I2C_INIT_4:
        MOVS     R0,#+3
          CFI FunCall PORT_Enable
        BL       PORT_Enable
//   29                 PORTD_PCR8=PORT_PCR_MUX(2);
        MOV      R0,#+512
        LDR.W    R1,??DataTable8_7  ;; 0x4004c020
        STR      R0,[R1, #+0]
//   30                 PORTD_PCR9=PORT_PCR_MUX(2);
        MOV      R0,#+512
        LDR.W    R1,??DataTable8_8  ;; 0x4004c024
        STR      R0,[R1, #+0]
//   31                 break;
        B.N      ??I2C_INIT_5
//   32       case I2C1_PE0_PE1:
//   33                 PORT_Enable(PORTE);
??I2C_INIT_3:
        MOVS     R0,#+4
          CFI FunCall PORT_Enable
        BL       PORT_Enable
//   34                 PORTE_PCR0=PORT_PCR_MUX(6);
        MOV      R0,#+1536
        LDR.W    R1,??DataTable8_9  ;; 0x4004d000
        STR      R0,[R1, #+0]
//   35                 PORTE_PCR1=PORT_PCR_MUX(6);
        MOV      R0,#+1536
        LDR.W    R1,??DataTable8_10  ;; 0x4004d004
        STR      R0,[R1, #+0]
//   36                 break;
//   37       }
//   38      //设置MULT和ICR,波特率
//   39      HWREG8(I2C_F_BASE+I2C_NUM*(0X1000))=baud_rate;//可修改，波特率为I2C baud rate = bus speed (Hz)/(mul × SCL divider),此处为390.625k
??I2C_INIT_5:
        MOVS     R0,#+141
        MOV      R1,#+4096
        LDR.W    R2,??DataTable8_11  ;; 0x40066001
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//   40      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=I2C_C1_IICIE_MASK;
        MOV      R0,#+4096
        LDR.W    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        MOV      R1,#+4096
        LDR.W    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//   41      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=I2C_C1_IICEN_MASK;//使能I2C//mpu6050要写TXAK=0|I2C_C1_TXAK_MASK
        MOV      R0,#+4096
        LDR.W    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        MOV      R1,#+4096
        LDR.W    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//   42 
//   43  }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock0
//   44 
//   45 //*************************************************************************
//   46 //信号产生函数：signal:Start,Stop
//   47 //*************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function I2C_signal
          CFI NoCalls
        THUMB
//   48 void I2C_signal(uint32 I2C_NUM,uint8 signal)
//   49  {
I2C_signal:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//   50      if(signal)  HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=I2C_C1_MST_MASK;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_signal_0
        MOV      R2,#+4096
        LDR.W    R3,??DataTable8_12  ;; 0x40066002
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        ORRS     R2,R2,#0x20
        MOV      R3,#+4096
        LDR.W    R4,??DataTable8_12  ;; 0x40066002
        MLA      R3,R3,R0,R4
        STRB     R2,[R3, #+0]
        B.N      ??I2C_signal_1
//   51      else HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=~I2C_C1_MST_MASK;
??I2C_signal_0:
        MOV      R2,#+4096
        LDR.W    R3,??DataTable8_12  ;; 0x40066002
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        ANDS     R2,R2,#0xDF
        MOV      R3,#+4096
        LDR.W    R4,??DataTable8_12  ;; 0x40066002
        MLA      R3,R3,R0,R4
        STRB     R2,[R3, #+0]
//   52  }
??I2C_signal_1:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   53 
//   54 //*************************************************************************
//   55 //信号产生函数：x:anwser,translate,等待应答和等待传输完成
//   56 //返回值：1：收到 应答信号或一个字节传输完成
//   57 //        0：接受或传输失败
//   58 //*************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function I2C_wait
          CFI NoCalls
        THUMB
//   59 uint8 I2C_wait(uint32 I2C_NUM,uint8 x)
//   60  {
I2C_wait:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R2,R0
//   61      uint16 i;
//   62      for(i=0;i<0xff*10;i++)
        MOVS     R0,#+0
        MOVS     R3,R0
??I2C_wait_0:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVW     R0,#+2550
        CMP      R3,R0
        BGE.N    ??I2C_wait_1
//   63       {
//   64           if(x) 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_wait_2
//   65            {
//   66                if((HWREG8(I2C_S_BASE+I2C_NUM*(0X1000))&I2C_S_RXAK_MASK)==0)
        MOV      R0,#+4096
        LDR.W    R4,??DataTable8_13  ;; 0x40066003
        MLA      R0,R0,R2,R4
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BMI.N    ??I2C_wait_3
//   67                    return 1;
        MOVS     R0,#+1
        B.N      ??I2C_wait_4
//   68            }
//   69           else 
//   70            {
//   71                if((HWREG8(I2C_S_BASE+I2C_NUM*(0X1000))&I2C_S_IICIF_MASK)!=0)
??I2C_wait_2:
        MOV      R0,#+4096
        LDR.W    R4,??DataTable8_13  ;; 0x40066003
        MLA      R0,R0,R2,R4
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??I2C_wait_3
//   72                 {
//   73                     HWREG8(I2C_S_BASE+I2C_NUM*(0X1000))|=I2C_S_IICIF_MASK;//清除标志
        MOV      R0,#+4096
        LDR.W    R4,??DataTable8_13  ;; 0x40066003
        MLA      R0,R0,R2,R4
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        MOV      R4,#+4096
        LDR.W    R5,??DataTable8_13  ;; 0x40066003
        MLA      R4,R4,R2,R5
        STRB     R0,[R4, #+0]
//   74                    return 1;
        MOVS     R0,#+1
        B.N      ??I2C_wait_4
//   75                 }
//   76            }
//   77       }
??I2C_wait_3:
        ADDS     R3,R3,#+1
        B.N      ??I2C_wait_0
//   78      if(i>=0xff*10) return 0;
??I2C_wait_1:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVW     R0,#+2550
        CMP      R3,R0
        BLT.N    ??I2C_wait_5
        MOVS     R0,#+0
        B.N      ??I2C_wait_4
//   79      else  return 1;
??I2C_wait_5:
        MOVS     R0,#+1
??I2C_wait_4:
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//   80  }
//   81 //*************************************************************************
//   82 //简介：接受一个字节
//   83 //DeviceAddr:设备地址
//   84 //AccessAddr：访问地址
//   85 //返回值：1表示成功，0表示失败
//   86 //*************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function I2C_R1
        THUMB
//   87 uint8 I2C_R1(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 *data)
//   88  {
I2C_R1:
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
        MOVS     R7,R3
//   89       HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;//设置为发送模式
        MOV      R0,#+4096
        LDR.W    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        MOV      R1,#+4096
        LDR.W    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//   90      I2C_signal(I2C_NUM,Start);                 //发送开始信号
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_signal
        BL       I2C_signal
//   91      HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//发送设备地址
        LSLS     R0,R5,#+1
        MOV      R1,#+4096
        LDR.W    R2,??DataTable8_14  ;; 0x40066004
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//   92      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_R1_0
        MOVS     R0,#+0
        B.N      ??I2C_R1_1
//   93      if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
??I2C_R1_0:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_R1_2
        MOVS     R0,#+0
        B.N      ??I2C_R1_1
//   94      HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=AccessAddr;  //发送访问地址
??I2C_R1_2:
        MOV      R0,#+4096
        LDR.W    R1,??DataTable8_14  ;; 0x40066004
        MLA      R0,R0,R4,R1
        STRB     R6,[R0, #+0]
//   95      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_R1_3
        MOVS     R0,#+0
        B.N      ??I2C_R1_1
//   96      if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
??I2C_R1_3:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_R1_4
        MOVS     R0,#+0
        B.N      ??I2C_R1_1
//   97      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0x04;//当MCU为主机模式时，写1产生一个重新开始信号
??I2C_R1_4:
        MOV      R0,#+4096
        LDR.W    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        MOV      R1,#+4096
        LDR.W    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//   98      HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)|0x01;
        LSLS     R0,R5,#+1
        ORRS     R0,R0,#0x1
        MOV      R1,#+4096
        LDR.W    R2,??DataTable8_14  ;; 0x40066004
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//   99      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_R1_5
        MOVS     R0,#+0
        B.N      ??I2C_R1_1
//  100      if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
??I2C_R1_5:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_R1_6
        MOVS     R0,#+0
        B.N      ??I2C_R1_1
//  101      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XEF;        //TX=0,MCU设置为接受模式
??I2C_R1_6:
        MOV      R0,#+4096
        LDR.W    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xEF
        MOV      R1,#+4096
        LDR.W    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  102      *data=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));         //读出I2C D,准备接受数据 
        MOV      R0,#+4096
        LDR.W    R1,??DataTable8_14  ;; 0x40066004
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        STRB     R0,[R7, #+0]
//  103       if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_R1_7
        MOVS     R0,#+0
        B.N      ??I2C_R1_1
//  104      I2C_signal(I2C_NUM,Stop); 
??I2C_R1_7:
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_signal
        BL       I2C_signal
//  105       *data=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));
        MOV      R0,#+4096
        LDR.W    R1,??DataTable8_14  ;; 0x40066004
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        STRB     R0,[R7, #+0]
//  106       //读出接受到的一个数据
//  107       SYSDelay_us(20);
        MOVS     R0,#+20
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  108       return 1;
        MOVS     R0,#+1
??I2C_R1_1:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock3
//  109  }
//  110 //*************************************************************************
//  111 //简介：向从机写一个字节,针对有存储器的从机
//  112 //DeviceAddr:设备地址
//  113 //AccessAddr：访问地址
//  114 //返回值：1表示成功，0表示失败
//  115 //*************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function I2C_W1
        THUMB
//  116 uint8 I2C_W1(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 data)
//  117  {
I2C_W1:
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
        MOVS     R7,R3
//  118      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;        //TX=1,MCU设置成发送模式
        MOV      R0,#+4096
        LDR.W    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        MOV      R1,#+4096
        LDR.W    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  119      I2C_signal(I2C_NUM,Start);                 //发送开始信号
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_signal
        BL       I2C_signal
//  120      HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//发送设备地址
        LSLS     R0,R5,#+1
        MOV      R1,#+4096
        LDR.W    R2,??DataTable8_14  ;; 0x40066004
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  121      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_W1_0
        MOVS     R0,#+0
        B.N      ??I2C_W1_1
//  122      if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
??I2C_W1_0:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_W1_2
        MOVS     R0,#+0
        B.N      ??I2C_W1_1
//  123      HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=AccessAddr;  //发送访问地址
??I2C_W1_2:
        MOV      R0,#+4096
        LDR.W    R1,??DataTable8_14  ;; 0x40066004
        MLA      R0,R0,R4,R1
        STRB     R6,[R0, #+0]
//  124      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_W1_3
        MOVS     R0,#+0
        B.N      ??I2C_W1_1
//  125      if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
??I2C_W1_3:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_W1_4
        MOVS     R0,#+0
        B.N      ??I2C_W1_1
//  126      HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=data;
??I2C_W1_4:
        MOV      R0,#+4096
        LDR.N    R1,??DataTable8_14  ;; 0x40066004
        MLA      R0,R0,R4,R1
        STRB     R7,[R0, #+0]
//  127      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_W1_5
        MOVS     R0,#+0
        B.N      ??I2C_W1_1
//  128      if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
??I2C_W1_5:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_W1_6
        MOVS     R0,#+0
        B.N      ??I2C_W1_1
//  129      I2C_signal(I2C_NUM,Stop);
??I2C_W1_6:
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_signal
        BL       I2C_signal
//  130      SYSDelay_us(5);
        MOVS     R0,#+5
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  131      return 1;
        MOVS     R0,#+1
??I2C_W1_1:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock4
//  132  }
//  133 
//  134 
//  135 //*************************************************************************
//  136 //简介：接受N个字节
//  137 //DeviceAddr:设备地址
//  138 //AccessAddr：访问地址
//  139 //返回值：1表示成功，0表示失败
//  140 //*************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function I2C_RN
        THUMB
//  141 uint8 I2C_RN(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 len,uint8 *data)
//  142  {
I2C_RN:
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
//  143     HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;//设置为发送模式
        MOV      R0,#+4096
        LDR.N    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  144      I2C_signal(I2C_NUM,Start);                 //发送开始信号
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_signal
        BL       I2C_signal
//  145      HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//发送设备地址
        LSLS     R0,R5,#+1
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_14  ;; 0x40066004
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  146      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_RN_0
        MOVS     R0,#+0
        B.N      ??I2C_RN_1
//  147      if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
??I2C_RN_0:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_RN_2
        MOVS     R0,#+0
        B.N      ??I2C_RN_1
//  148      HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=AccessAddr;  //发送访问地址
??I2C_RN_2:
        MOV      R0,#+4096
        LDR.N    R1,??DataTable8_14  ;; 0x40066004
        MLA      R0,R0,R4,R1
        STRB     R6,[R0, #+0]
//  149      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_RN_3
        MOVS     R0,#+0
        B.N      ??I2C_RN_1
//  150      if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
??I2C_RN_3:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_RN_4
        MOVS     R0,#+0
        B.N      ??I2C_RN_1
//  151      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0x04;//当MCU为主机模式时，写1产生一个重新开始信号
??I2C_RN_4:
        MOV      R0,#+4096
        LDR.N    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  152      HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)|0x01;
        LSLS     R0,R5,#+1
        ORRS     R0,R0,#0x1
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_14  ;; 0x40066004
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  153      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_RN_5
        MOVS     R0,#+0
        B.N      ??I2C_RN_1
//  154      if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
??I2C_RN_5:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_RN_6
        MOVS     R0,#+0
        B.N      ??I2C_RN_1
//  155      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XEF;        //TX=0,MCU设置为接受模式
??I2C_RN_6:
        MOV      R0,#+4096
        LDR.N    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xEF
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  156      *data=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));         //读出I2C D,准备接受数据 
        MOV      R0,#+4096
        LDR.N    R1,??DataTable8_14  ;; 0x40066004
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        STRB     R0,[R8, #+0]
//  157      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XF7;
        MOV      R0,#+4096
        LDR.N    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xF7
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  158      if(!(I2C_wait(I2C_NUM,translate))) return 0;       //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_RN_7
        MOVS     R0,#+0
        B.N      ??I2C_RN_1
//  159      while(len)
??I2C_RN_7:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??I2C_RN_8
//  160       {
//  161         *data=HWREG8(I2C_D_BASE+I2C_NUM*(0X1000));         //读出I2C D,准备接受数据 
        MOV      R0,#+4096
        LDR.N    R1,??DataTable8_14  ;; 0x40066004
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        STRB     R0,[R8, #+0]
//  162         if(len==1) HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X08;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??I2C_RN_9
        MOV      R0,#+4096
        LDR.N    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
        B.N      ??I2C_RN_10
//  163         else HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=0XF7;
??I2C_RN_9:
        MOV      R0,#+4096
        LDR.N    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xF7
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  164         if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
??I2C_RN_10:
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_RN_11
        MOVS     R0,#+0
        B.N      ??I2C_RN_1
//  165         len--;
??I2C_RN_11:
        SUBS     R7,R7,#+1
//  166         data++;
        ADDS     R8,R8,#+1
        B.N      ??I2C_RN_7
//  167       } 
//  168       I2C_signal(I2C_NUM,Stop); 
??I2C_RN_8:
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_signal
        BL       I2C_signal
//  169      SYSDelay_us(70);
        MOVS     R0,#+70
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  170       return 1;
        MOVS     R0,#+1
??I2C_RN_1:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock5
//  171  }
//  172 
//  173 //*************************************************************************
//  174 //简介：向从机写N个字节
//  175 //DeviceAddr:设备地址
//  176 //AccessAddr：访问地址
//  177 //返回值：1表示成功，0表示失败
//  178 //*************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function I2C_WN
        THUMB
//  179 uint8 I2C_WN(uint32 I2C_NUM,uint8 DeviceAddr,uint8 AccessAddr,uint8 N,uint8 *data)
//  180  {
I2C_WN:
        PUSH     {R3-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+32]
//  181      uint8 i;
//  182      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=0X10;        //TX=1,MCU设置成发送模式
        MOV      R0,#+4096
        LDR.N    R1,??DataTable8_12  ;; 0x40066002
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  183      I2C_signal(I2C_NUM,Start);                 //发送开始信号
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_signal
        BL       I2C_signal
//  184      HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=(DeviceAddr<<1)&0xfe;//发送设备地址
        LSLS     R0,R5,#+1
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_14  ;; 0x40066004
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  185      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_WN_0
        MOVS     R0,#+0
        B.N      ??I2C_WN_1
//  186      if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
??I2C_WN_0:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_WN_2
        MOVS     R0,#+0
        B.N      ??I2C_WN_1
//  187      HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=AccessAddr;  //发送访问地址
??I2C_WN_2:
        MOV      R0,#+4096
        LDR.N    R1,??DataTable8_14  ;; 0x40066004
        MLA      R0,R0,R4,R1
        STRB     R6,[R0, #+0]
//  188      if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_WN_3
        MOVS     R0,#+0
        B.N      ??I2C_WN_1
//  189      if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
??I2C_WN_3:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_WN_4
        MOVS     R0,#+0
        B.N      ??I2C_WN_1
//  190      for(i=0;i<N;i++)
??I2C_WN_4:
        MOVS     R0,#+0
        MOV      R9,R0
??I2C_WN_5:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R9,R7
        BCS.N    ??I2C_WN_6
//  191       {
//  192         HWREG8(I2C_D_BASE+I2C_NUM*(0X1000))=*data;
        LDRB     R0,[R8, #+0]
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_14  ;; 0x40066004
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  193         if(!(I2C_wait(I2C_NUM,translate))) return 0;  //等待一个字节数据传输完成
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_WN_7
        MOVS     R0,#+0
        B.N      ??I2C_WN_1
//  194         if(!(I2C_wait(I2C_NUM,answer)))   return 0;//等待从机应答
??I2C_WN_7:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall I2C_wait
        BL       I2C_wait
        CMP      R0,#+0
        BNE.N    ??I2C_WN_8
        MOVS     R0,#+0
        B.N      ??I2C_WN_1
//  195         data++; 
??I2C_WN_8:
        ADDS     R8,R8,#+1
//  196       }
        ADDS     R9,R9,#+1
        B.N      ??I2C_WN_5
//  197      I2C_signal(I2C_NUM,Stop);
??I2C_WN_6:
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall I2C_signal
        BL       I2C_signal
//  198      SYSDelay_us(70);
        MOVS     R0,#+70
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  199      return 1;
        MOVS     R0,#+1
??I2C_WN_1:
        POP      {R1,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock6
//  200  }
//  201 
//  202 //***************************************************************************
//  203 //I2C中断的开启和关闭
//  204 //*************************************************************************

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function I2CINT_Enable
          CFI NoCalls
        THUMB
//  205 void I2CINT_Enable(uint32 I2C_NUM)
//  206  {
//  207      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))|=I2C_C1_IICIE_MASK;
I2CINT_Enable:
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        ORRS     R1,R1,#0x40
        MOV      R2,#+4096
        LDR.N    R3,??DataTable8_12  ;; 0x40066002
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+0]
//  208  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  209 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function I2CINT_Disable
          CFI NoCalls
        THUMB
//  210 void I2CINT_Disable(uint32 I2C_NUM)
//  211  {
//  212      HWREG8(I2C_C1_BASE+I2C_NUM*(0X1000))&=~I2C_C1_IICIE_MASK;
I2CINT_Disable:
        MOV      R1,#+4096
        LDR.N    R2,??DataTable8_12  ;; 0x40066002
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        ANDS     R1,R1,#0xBF
        MOV      R2,#+4096
        LDR.N    R3,??DataTable8_12  ;; 0x40066002
        MLA      R2,R2,R0,R3
        STRB     R1,[R2, #+0]
//  213  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x4004a004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0x4004a008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x4004a00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0x4004b028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     0x4004b02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     0x4004c020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     0x4004c024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     0x4004d004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     0x40066001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_12:
        DC32     0x40066002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_13:
        DC32     0x40066003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_14:
        DC32     0x40066004

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
//     1 byte  in section .bss
// 1 792 bytes in section .text
// 
// 1 792 bytes of CODE memory
//     1 byte  of DATA memory
//
//Errors: none
//Warnings: none
