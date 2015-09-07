///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:11
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\SCCB.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\SCCB.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\SCCB.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN GPIOPULL_SET
        EXTERN GPIO_GET
        EXTERN GPIO_INIT
        EXTERN GPIO_SET
        EXTERN SYSDelay_us

        PUBLIC CAT_read
        PUBLIC CAT_write
        PUBLIC MT34_Read
        PUBLIC MT34_Write
        PUBLIC MT34_init
        PUBLIC SCCB_CAT_Start
        PUBLIC SCCB_CAT_Stop
        PUBLIC SCCB_Cat_read
        PUBLIC SCCB_Cat_write
        PUBLIC SCCB_Catch
        PUBLIC SCCB_init
        PUBLIC SCCB_read
        PUBLIC SCCB_start
        PUBLIC SCCB_stop
        PUBLIC SCCB_write
        PUBLIC check_ACK
        PUBLIC read_ru
        PUBLIC slave_ACK
        PUBLIC slave_NOACK
        PUBLIC trrigle
        PUBLIC write_Date
        PUBLIC write_catch
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\project\SCCB.c
//    1 //*************************************************
//    2 //designed for SCCB of  OV  CAMARA
//    3 //defsigner : L J
//    4 //the fastest frequence:400K HZ
//    5 //***************************************************
//    6 //ov7620
//    7 #include "common.h"
//    8 #include "SCCB.h"
//    9 #include "GPIO.h"
//   10 #include "systick.h"
//   11 #define uint8_t uint8
//   12 #define uint16_t uint16

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SCCB_init
        THUMB
//   13 void SCCB_init()
//   14  {
SCCB_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   15      GPIO_INIT(SIO_C_PORT,SIO_C_PIN,OUTPUT);
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   16      GPIO_INIT(SIO_D_PORT,SIO_D_PIN,OUTPUT);
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   17      GPIOPULL_SET(SIO_C_PORT,SIO_C_PIN,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   18      GPIOPULL_SET(SIO_D_PORT,SIO_D_PIN,PULL_UP);
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIOPULL_SET
        BL       GPIOPULL_SET
//   19      SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   20      GPIO_SET(SIO_D_PORT,SIO_D_PIN,0);
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   21      
//   22      
//   23      GPIO_INIT(PORTC,19,OUTPUT);
        MOVS     R2,#+1
        MOVS     R1,#+19
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   24      GPIO_INIT(PORTC,16,OUTPUT);
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   25      GPIO_SET(PORTC,19,1);
        MOVS     R2,#+1
        MOVS     R1,#+19
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   26  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function trrigle
        THUMB
//   27 void trrigle()
//   28  {
trrigle:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   29      GPIO_SET(PORTC,16,1);
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   30      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   31       GPIO_SET(PORTC,16,0);
        MOVS     R2,#+0
        MOVS     R1,#+16
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   32  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   33 //************************************************
//   34 //OV7620

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function write_Date
        THUMB
//   35 void write_Date(uint8 write_date)
//   36  {
write_Date:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
//   37      uint8 i,bit;
//   38      for(i=0;i<8;i++)
        MOVS     R0,#+0
        MOVS     R5,R0
??write_Date_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??write_Date_1
//   39       {
//   40           SIO_C_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   41           bit=write_date&0x80;
        ANDS     R0,R4,#0x80
        MOVS     R6,R0
//   42           GPIO_SET(SIO_D_PORT,SIO_D_PIN,bit);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R2,R6
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   43           SYSDelay_us(3);
        MOVS     R0,#+3
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   44           SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   45           SYSDelay_us(3);
        MOVS     R0,#+3
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   46           write_date=write_date<<1;
        LSLS     R4,R4,#+1
//   47       }
        ADDS     R5,R5,#+1
        B.N      ??write_Date_0
//   48      SIO_C_Clear;
??write_Date_1:
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   49      GPIO_SET(SIO_D_PORT,SIO_D_PIN,0);
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   50      SYSDelay_us(3);
        MOVS     R0,#+3
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   51      SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   52      SYSDelay_us(3);
        MOVS     R0,#+3
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   53      SIO_C_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   54  }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SCCB_start
        THUMB
//   55 void SCCB_start()
//   56  {
SCCB_start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   57      SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   58      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   59      GPIO_SET(SIO_D_PORT,SIO_D_PIN,1);
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   60      SYSDelay_us(2);
        MOVS     R0,#+2
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   61      GPIO_SET(SIO_D_PORT,SIO_D_PIN,0);
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   62      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   63      SIO_C_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   64      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   65  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//   66 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SCCB_stop
        THUMB
//   67 void SCCB_stop()
//   68  {
SCCB_stop:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   69      GPIO_INIT(SIO_D_PORT,SIO_D_PIN,OUTPUT);
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   70      SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   71      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   72      GPIO_SET(SIO_D_PORT,SIO_D_PIN,1);
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   73      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   74      GPIO_SET(SIO_D_PORT,SIO_D_PIN,0);
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   75  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SCCB_write
        THUMB
//   76 void SCCB_write(uint8 ID_Address,uint8 Sub_address,uint8 write_date)
//   77  {
SCCB_write:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//   78      SCCB_start();
          CFI FunCall SCCB_start
        BL       SCCB_start
//   79      write_Date((ID_Address<<1)&0xfe);
        LSLS     R0,R4,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall write_Date
        BL       write_Date
//   80      write_Date(Sub_address);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall write_Date
        BL       write_Date
//   81      write_Date(write_date);
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall write_Date
        BL       write_Date
//   82      SYSDelay_us(3);
        MOVS     R0,#+3
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   83      SCCB_stop();
          CFI FunCall SCCB_stop
        BL       SCCB_stop
//   84      SYSDelay_us(100);
        MOVS     R0,#+100
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   85  }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SCCB_read
        THUMB
//   86 uint8 SCCB_read(uint8 ID_Address,uint8 Sub_address)
//   87  {
SCCB_read:
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
//   88     uint8 i,bit,read_date; 
//   89     SCCB_start();
          CFI FunCall SCCB_start
        BL       SCCB_start
//   90     write_Date((ID_Address<<1)&0xfe);
        LSLS     R0,R4,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall write_Date
        BL       write_Date
//   91     write_Date(Sub_address);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall write_Date
        BL       write_Date
//   92     SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//   93     SCCB_start();
          CFI FunCall SCCB_start
        BL       SCCB_start
//   94     write_Date((ID_Address<<1)|0x01);
        LSLS     R0,R4,#+1
        ORRS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall write_Date
        BL       write_Date
//   95     GPIO_INIT(SIO_D_PORT,SIO_D_PIN,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   96     for(i=0;i<8;i++)
        MOVS     R0,#+0
        MOVS     R6,R0
??SCCB_read_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+8
        BGE.N    ??SCCB_read_1
//   97      {
//   98          SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//   99          bit=GPIO_GET(SIO_D_PORT,SIO_D_PIN);
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        MOVS     R7,R0
//  100          SYSDelay_us(3);
        MOVS     R0,#+3
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  101          read_date|=bit<<(7-i);
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        RSBS     R0,R6,#+7
        LSLS     R0,R7,R0
        ORRS     R8,R0,R8
//  102          SIO_C_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  103          SYSDelay_us(4);
        MOVS     R0,#+4
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  104      }
        ADDS     R6,R6,#+1
        B.N      ??SCCB_read_0
//  105     SIO_C_Set;
??SCCB_read_1:
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  106     bit=GPIO_GET(SIO_D_PORT,SIO_D_PIN);
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        MOVS     R7,R0
//  107     SYSDelay_us(3);
        MOVS     R0,#+3
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  108     SIO_C_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  109     SYSDelay_us(3);
        MOVS     R0,#+3
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  110     SCCB_stop();
          CFI FunCall SCCB_stop
        BL       SCCB_stop
//  111     SYSDelay_us(10);
        MOVS     R0,#+10
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  112     return read_date;
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock6
//  113  }
//  114 
//  115 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SCCB_CAT_Start
        THUMB
//  116 void SCCB_CAT_Start(void)
//  117  {
SCCB_CAT_Start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  118      SIO_D_Set;
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  119      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  120      SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  121      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  122      SIO_D_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  123      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  124      SIO_C_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  125      SYSDelay_us(2);
        MOVS     R0,#+2
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  126  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock7
//  127 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function SCCB_CAT_Stop
        THUMB
//  128 void SCCB_CAT_Stop(void)
//  129  {
SCCB_CAT_Stop:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  130      SIO_D_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  131      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  132      SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  133       SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  134       SIO_D_Set;
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  135      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  136      SIO_C_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  137       SYSDelay_us(2);
        MOVS     R0,#+2
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  138  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8
//  139 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function slave_ACK
        THUMB
//  140 void slave_ACK(void)
//  141  {
slave_ACK:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  142      SIO_D_Clear; 
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  143      SYSDelay_us(1);      // 延时1us 
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  144      SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  145      SYSDelay_us(1);	
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  146      SIO_C_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  147      SYSDelay_us(2);
        MOVS     R0,#+2
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  148      SIO_D_Set;
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  149      SYSDelay_us(1);      // 延时1us 
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  150 
//  151  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function slave_NOACK
        THUMB
//  152 void slave_NOACK(void)
//  153  {
slave_NOACK:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  154      SIO_D_Set;  
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  155         SYSDelay_us(1);      // 延时1us 
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  156 	SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  157 	SYSDelay_us(3);
        MOVS     R0,#+3
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  158     	SIO_C_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  159     SYSDelay_us(2);
        MOVS     R0,#+2
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  160 	SIO_D_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  161     SYSDelay_us(1);      // 延时1us 
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  162 
//  163  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock10
//  164 //--------------------------------------------------------------------------------------------------
//  165 // 函数名称： check_ACK
//  166 // 函数功能： 主机应答位检查子程序，迫使数据传输过程结束
//  167 //--------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function check_ACK
        THUMB
//  168 uint8_t check_ACK(void)
//  169 { 
check_ACK:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  170 	uint8_t check ;
//  171         SIO_D_Set; 
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  172         GPIO_INIT(SIO_D_PORT,SIO_D_PIN,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  173         SYSDelay_us(1);      // 延时1us 
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  174 	SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  175 	check = 0;
        MOVS     R0,#+0
        MOVS     R4,R0
//  176 	if(GPIO_GET(SIO_D_PORT,SIO_D_PIN) == 1)    // 若BFSDA=1 表明非应答，置位非应答标志F0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+1
        BNE.N    ??check_ACK_0
//  177 	   check = 1;
        MOVS     R0,#+1
        MOVS     R4,R0
//  178         SYSDelay_us(1);      // 延时1us 
??check_ACK_0:
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  179 	SIO_C_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  180         //gpio_init (PORTE , 12, GPO,HIGH);      
//  181         GPIO_INIT(SIO_D_PORT,SIO_D_PIN,OUTPUT);         //
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  182         SIO_D_Set;
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  183         return  check ;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock11
//  184 }
//  185 
//  186 //--------------------------------------------------------------------------------------------------
//  187 // 函数名称： IICSendByte
//  188 // 入口参数： ch
//  189 // 函数功能： 发送一个字节
//  190 //--------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function CAT_write
        THUMB
//  191 void CAT_write(uint8_t ch)
//  192 { 
CAT_write:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  193 	uint8_t n=8;     // 向BFSDA上发送一位数据字节，共八位
        MOVS     R5,#+8
//  194 	while(n--)
??CAT_write_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??CAT_write_1
//  195 	{ 
//  196 		if((ch&0x80) == 0x80)    // 若要发送的数据最高位为1则发送位1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R0,R4,#+24
        BPL.N    ??CAT_write_2
//  197 		{
//  198                   SIO_D_Set;    // 传送位1
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  199                   SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  200                   SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  201                   SYSDelay_us(2);
        MOVS     R0,#+2
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  202                   SIO_C_Clear;  
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  203                   SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  204                   SIO_D_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  205                   SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
        B.N      ??CAT_write_3
//  206                   
//  207 		}
//  208 		else
//  209 		{  
//  210                   SIO_D_Clear;    // 否则传送位0
??CAT_write_2:
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  211                   SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  212                   SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  213                   SYSDelay_us(2);
        MOVS     R0,#+2
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  214                   SIO_C_Clear;  
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  215                   SYSDelay_us(2);
        MOVS     R0,#+2
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  216 		}
//  217 		ch = ch<<1;    // 数据左移一位
??CAT_write_3:
        LSLS     R4,R4,#+1
        B.N      ??CAT_write_0
//  218 	}
//  219 }
??CAT_write_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock12
//  220 //--------------------------------------------------------------------------------------------------
//  221 // 函数名称： IICreceiveByte
//  222 // 返回接收的数据
//  223 // 函数功能： 接收一字节子程序
//  224 //--------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function CAT_read
        THUMB
//  225 uint8_t CAT_read(void)
//  226 {
CAT_read:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  227 	uint8_t n=8;    // 从BFSDA线上读取一上数据字节，共八位
        MOVS     R4,#+8
//  228 	uint8_t tdata = 0;
        MOVS     R5,#+0
//  229     GPIO_INIT(SIO_D_PORT,SIO_D_PIN,INPUT);
        MOVS     R2,#+0
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  230 	while(n--)
??CAT_read_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??CAT_read_1
//  231 	{      
//  232                 SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  233                 SIO_C_Clear;
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  234                 SYSDelay_us(2);
        MOVS     R0,#+2
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  235 		SIO_C_Set;
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  236                 SYSDelay_us(2);
        MOVS     R0,#+2
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  237 		tdata = tdata<<1;    // 左移一位，或_crol_(temp,1)
        LSLS     R5,R5,#+1
//  238 		if(GPIO_GET(SIO_D_PORT,SIO_D_PIN) == 1)
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_GET
        BL       GPIO_GET
        CMP      R0,#+1
        BNE.N    ??CAT_read_2
//  239                   tdata = tdata|0x01;    // 若接收到的位为1，则数据的最后一位置1
        ORRS     R5,R5,#0x1
        B.N      ??CAT_read_3
//  240 		else 
//  241                   tdata = tdata&0xfe;    // 否则数据的最后一位置0
??CAT_read_2:
        ANDS     R5,R5,#0xFE
//  242 	       SIO_C_Clear;
??CAT_read_3:
        MOVS     R2,#+0
        MOVS     R1,#+12
        MOVS     R0,#+2
          CFI FunCall GPIO_SET
        BL       GPIO_SET
        B.N      ??CAT_read_0
//  243 	}
//  244      GPIO_INIT(SIO_D_PORT,SIO_D_PIN,OUTPUT);
??CAT_read_1:
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  245 	return(tdata);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock13
//  246 }
//  247 
//  248 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function SCCB_Cat_write
        THUMB
//  249 uint8 SCCB_Cat_write(uint8 slave_add,uint8 register_add,uint8 date)
//  250  {
SCCB_Cat_write:
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
//  251      uint8_t check = 1;
        MOVS     R7,#+1
//  252      SCCB_CAT_Start();
          CFI FunCall SCCB_CAT_Start
        BL       SCCB_CAT_Start
//  253      CAT_write(slave_add);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  254      check = check_ACK();   
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R7,R0
//  255      /*if(check == 1)
//  256       { 
//  257 	      return 0;    // 若非应答表明器件错误或已坏，置错误标志位SystemError
//  258       }*/
//  259      CAT_write(register_add);     
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  260      check= check_ACK();    // 检查应答位
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R7,R0
//  261      //uart_putchar(UART0,send_da);
//  262      /*if (check == 1)
//  263       {
//  264           return 0;    // 若非应答表明器件错误或已坏，置错误标志位SystemError
//  265       }*/
//  266      CAT_write(date);     
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  267      check= check_ACK();    // 检查应答位
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R7,R0
//  268      //uart_putchar(UART0,send_da);
//  269      /*if (check == 1)
//  270       {
//  271           return 0;    // 若非应答表明器件错误或已坏，置错误标志位SystemError
//  272       }*/
//  273      SCCB_CAT_Stop();
          CFI FunCall SCCB_CAT_Stop
        BL       SCCB_CAT_Stop
//  274      return 1;
        MOVS     R0,#+1
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock14
//  275  }
//  276 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function SCCB_Cat_read
        THUMB
//  277 uint8 SCCB_Cat_read(uint8 slave_add,uint8 register_add)
//  278 { 
SCCB_Cat_read:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  279 	uint8_t receive_da,check;
//  280     SCCB_CAT_Start();
          CFI FunCall SCCB_CAT_Start
        BL       SCCB_CAT_Start
//  281 	CAT_write(slave_add);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  282         SYSDelay_us(1);      // 延时1us 
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  283         check =check_ACK();
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R7,R0
//  284 	/*if(check == 1)
//  285 	{
//  286 		return 0 ;
//  287 	}*/
//  288         CAT_write(register_add);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  289         SYSDelay_us(1);      // 延时1us 
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  290         check =check_ACK();
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R7,R0
//  291 	/*if(check == 1)
//  292 	{
//  293 		return 0 ;
//  294 	}*/
//  295        // uart_putchar(UART0,rece_data_buff[0]);
//  296 	SCCB_CAT_Start();
          CFI FunCall SCCB_CAT_Start
        BL       SCCB_CAT_Start
//  297 	CAT_write(slave_add+1);
        ADDS     R0,R4,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  298         SYSDelay_us(1);      // 延时1us 
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  299 	check =check_ACK();
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R7,R0
//  300 	/*if(check == 1)
//  301 	{
//  302 		return 0 ;
//  303 	}    */
//  304        receive_da=CAT_read();
          CFI FunCall CAT_read
        BL       CAT_read
        MOVS     R6,R0
//  305        slave_NOACK();    // 收到最后一个字节后发送一个非应答位
          CFI FunCall slave_NOACK
        BL       slave_NOACK
//  306        SCCB_CAT_Stop();
          CFI FunCall SCCB_CAT_Stop
        BL       SCCB_CAT_Stop
//  307        return receive_da;
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock15
//  308 }
//  309 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  310 uint8_t  write_catch[ ] ={
write_catch:
        DATA
        DC8 3, 0, 12, 0, 17, 0, 18, 17, 19, 23, 21, 2, 22, 3, 3, 0, 23, 32, 24
        DC8 240, 25, 48, 26, 240, 27, 42, 31, 32, 32, 2, 9, 3, 33, 0, 34, 32
        DC8 35, 51, 36, 138, 37, 122, 42, 0, 43, 0, 44, 0, 45, 79, 46, 150, 47
        DC8 0, 58, 0, 59, 96, 62, 52, 63, 176, 64, 76, 65, 59, 66, 48, 67, 37
        DC8 68, 29, 69, 21, 70, 16, 71, 15, 72, 13, 73, 11, 75, 9, 76, 9, 78, 8
        DC8 79, 6, 80, 5, 81, 47, 82, 144, 83, 1, 84, 135, 86, 240, 87, 50, 88
        DC8 139, 89, 6, 90, 155, 91, 53, 100, 2, 103, 128, 104, 128, 105, 160
        DC8 106, 137, 112, 174, 113, 166, 114, 79, 115, 95, 116, 39, 128, 65
        DC8 129, 8, 130, 22, 131, 36, 132, 36, 133, 42, 134, 79, 137, 178, 138
        DC8 170, 139, 2, 142, 2, 143, 112, 149, 20, 157, 54, 158, 4, 161, 39
        DC8 162, 18, 163, 45, 164, 8, 165, 46, 166, 4, 167, 128, 168, 128, 169
        DC8 33, 170, 33, 171, 33, 172, 10, 173, 240, 174, 255, 177, 176, 178
        DC8 176, 182, 128, 183, 128, 184, 128, 185, 0, 231, 124, 240, 0, 241, 1
        DC8 241, 1, 241, 1
//  311    0x03,0x00,0x0c,0x00,0X11,0X00,0X12,0X11,0X13,0X17,0X15,0X02,0X16,0X03,0X03,0X00,
//  312    0X17,0X20,0X18,0Xf0,0X19,0X30,0X1a,0Xf0,0X1b,0X2a,0X1f,0X20,0X20,0X02,0X09,0X03,
//  313    0X21,0X00,0X22,0X20,0X23,0X33,0X24,0X8a,0X25,0X7a,0X2A,0X00,0X2B,0X00,0X2c,0X00,
//  314    0X2d,0X4f,0X2e,0X96,0X2f,0X00,0X3a,0X00,0X3b,0X60,0X3e,0X34,0X3f,0Xb0,0X40,0X4c,
//  315    0X41,0X3b,0X42,0X30,0X43,0X25,0X44,0X1d,0X45,0X15,0X46,0X10,0X47,0X0f,0X48,0X0d,
//  316    0X49,0X0b,0X4b,0X09,0X4c,0X09,0X4e,0X08,0X4f,0X06,0X50,0X05,0X51,0X2f,0X52,0X90,
//  317    0X53,0X01,0X54,0X87,0X56,0xf0,0X57,0X32,0X58,0X8b,0X59,0X06,0X5a,0X9b,0X5b,0X35,
//  318    0X64,0X02,0X67,0X80,0X68,0X80,0X69,0XA0,0X6a,0X89,0X70,0Xae,0X71,0Xa6,0X72,0X4f,
//  319    0X73,0X5f,0X74,0X27,0X80,0X41,0X81,0X08,0X82,0X16,0X83,0X24,0X84,0X24,0X85,0X2a,
//  320    0X86,0X4f,0X89,0Xb2,0X8a,0Xaa,0X8b,0X02,0X8e,0X02,0X8f,0X70,0X95,0X14,0X9d,0X36,
//  321    0X9e,0X04,0Xa1,0X27,0Xa2,0X12,0Xa3,0X2d,0Xa4,0X08,0Xa5,0X2e,0Xa6,0X04,0Xa7,0X80,
//  322    0Xa8,0X80,0Xa9,0X21,0Xaa,0X21,0Xab,0X21,0Xac,0X0a,0Xad,0Xf0,0Xae,0Xff,0Xb1,0Xb0,
//  323    0Xb2,0Xb0,0Xb6,0X80,0Xb7,0X80,0Xb8,0X80,0Xb9,0X00,0Xe7,0X7c,0Xf0,0X00,0Xf1,0X01,
//  324    0Xf1,0X01,0Xf1,0X01,
//  325 };
//  326 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function SCCB_Catch
        THUMB
//  327 uint8 SCCB_Catch(void)
//  328  {
SCCB_Catch:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  329      uint8 read_da=0,i;
        MOVS     R5,#+0
//  330      for(i=0;i<212;i+=2)
        MOVS     R0,#+0
        MOVS     R4,R0
??SCCB_Catch_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+212
        BGE.N    ??SCCB_Catch_1
//  331       {
//  332         SCCB_Cat_write(cat_address,write_catch[i],write_catch[i+1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable1
        ADDS     R0,R4,R0
        LDRB     R2,[R0, #+1]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable1
        LDRB     R1,[R4, R0]
        MOVS     R0,#+220
          CFI FunCall SCCB_Cat_write
        BL       SCCB_Cat_write
//  333         read_da=SCCB_Cat_read(cat_address,write_catch[i]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable1
        LDRB     R1,[R4, R0]
        MOVS     R0,#+220
          CFI FunCall SCCB_Cat_read
        BL       SCCB_Cat_read
        MOVS     R5,R0
//  334         if(read_da!=write_catch[i+1]) return 0;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable1
        ADDS     R0,R4,R0
        LDRB     R0,[R0, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,R0
        BEQ.N    ??SCCB_Catch_2
        MOVS     R0,#+0
        B.N      ??SCCB_Catch_3
//  335         SYSDelay_us(100);
??SCCB_Catch_2:
        MOVS     R0,#+100
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  336       }
        ADDS     R4,R4,#+2
        B.N      ??SCCB_Catch_0
//  337      return 1;
??SCCB_Catch_1:
        MOVS     R0,#+1
??SCCB_Catch_3:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock16
//  338  }

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function MT34_Write
        THUMB
//  339 uint8 MT34_Write(uint8 slave_add,uint8 register_add,uint16 date)
//  340  {
MT34_Write:
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
//  341      uint8_t check = 1;
        MOVS     R7,#+1
//  342      uint8 date1=(uint8)(date>>8),date2=(uint8)(date&0xff);
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R8,R6,#+8
        MOV      R9,R6
//  343      SCCB_CAT_Start();
          CFI FunCall SCCB_CAT_Start
        BL       SCCB_CAT_Start
//  344      CAT_write(slave_add);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  345      check = check_ACK();   
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R7,R0
//  346      if(check == 1)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??MT34_Write_0
//  347       { 
//  348 	      return 0;    // 若非应答表明器件错误或已坏，置错误标志位SystemError
        MOVS     R0,#+0
        B.N      ??MT34_Write_1
//  349       }
//  350      CAT_write(register_add);     
??MT34_Write_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  351      check= check_ACK();    // 检查应答位
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R7,R0
//  352      //uart_putchar(UART0,send_da);
//  353      if (check == 1)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??MT34_Write_2
//  354       {
//  355           return 0;    // 若非应答表明器件错误或已坏，置错误标志位SystemError
        MOVS     R0,#+0
        B.N      ??MT34_Write_1
//  356       }
//  357      CAT_write(date1);     
??MT34_Write_2:
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  358      check= check_ACK();    // 检查应答位
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R7,R0
//  359      //uart_putchar(UART0,send_da);
//  360      if (check == 1)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??MT34_Write_3
//  361       {
//  362           return 0;    // 若非应答表明器件错误或已坏，置错误标志位SystemError
        MOVS     R0,#+0
        B.N      ??MT34_Write_1
//  363       }
//  364      CAT_write(date2);     
??MT34_Write_3:
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  365      check= check_ACK();
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R7,R0
//  366      if (check == 1)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??MT34_Write_4
//  367       {
//  368           return 0;    // 若非应答表明器件错误或已坏，置错误标志位SystemError
        MOVS     R0,#+0
        B.N      ??MT34_Write_1
//  369       }
//  370      SCCB_CAT_Stop();
??MT34_Write_4:
          CFI FunCall SCCB_CAT_Stop
        BL       SCCB_CAT_Stop
//  371      return 1;
        MOVS     R0,#+1
??MT34_Write_1:
        POP      {R1,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock17
//  372  }
//  373 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function MT34_Read
        THUMB
//  374 uint16 MT34_Read(uint8 slave_add,uint8 register_add)
//  375 { 
MT34_Read:
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
//  376 	uint8_t check;
//  377     uint16 date_out;
//  378     uint16 date1=0,date2;
        MOVS     R8,#+0
//  379     SCCB_CAT_Start();
          CFI FunCall SCCB_CAT_Start
        BL       SCCB_CAT_Start
//  380 	CAT_write(slave_add);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  381     check =check_ACK();
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R6,R0
//  382     SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  383     if(check == 1)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??MT34_Read_0
//  384 	{
//  385 		return 0 ;
        MOVS     R0,#+0
        B.N      ??MT34_Read_1
//  386 	}   
//  387     CAT_write(register_add);      // 延时1us 
??MT34_Read_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  388     check =check_ACK();
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R6,R0
//  389     SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  390     if(check == 1)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??MT34_Read_2
//  391 	{
//  392 		return 0 ;
        MOVS     R0,#+0
        B.N      ??MT34_Read_1
//  393 	}   
//  394 	SCCB_CAT_Start();
??MT34_Read_2:
          CFI FunCall SCCB_CAT_Start
        BL       SCCB_CAT_Start
//  395 	CAT_write(slave_add+1);
        ADDS     R0,R4,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall CAT_write
        BL       CAT_write
//  396     check =check_ACK();
          CFI FunCall check_ACK
        BL       check_ACK
        MOVS     R6,R0
//  397       if(check == 1)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??MT34_Read_3
//  398 	{
//  399 		return 0 ;
        MOVS     R0,#+0
        B.N      ??MT34_Read_1
//  400 	}  
//  401     date1=CAT_read();
??MT34_Read_3:
          CFI FunCall CAT_read
        BL       CAT_read
        MOV      R8,R0
//  402     slave_ACK();
          CFI FunCall slave_ACK
        BL       slave_ACK
//  403     date2=CAT_read();
          CFI FunCall CAT_read
        BL       CAT_read
        MOV      R9,R0
//  404     slave_NOACK();
          CFI FunCall slave_NOACK
        BL       slave_NOACK
//  405     SCCB_CAT_Stop();
          CFI FunCall SCCB_CAT_Stop
        BL       SCCB_CAT_Stop
//  406     date_out=((uint16)date1<<8)|(uint16)(date2);
        ORRS     R0,R9,R8, LSL #+8
        MOVS     R7,R0
//  407        return date_out;
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
??MT34_Read_1:
        POP      {R1,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock18
//  408 }
//  409 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//  410 uint16 read_ru;
read_ru:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function MT34_init
        THUMB
//  411 uint8 MT34_init()
//  412  {  
MT34_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  413       //MT34_Write(0xb8,0x0F,1);//HDR
//  414    // MT34_Write(0xb8,0xaf,0);//AEC=0 AGC=0*/
//  415    //  MT34_Write(0xb8,0x0a,0);//Auto _exposure
//  416      
//  417      /*MT34_Write(0xb8,0x08,250);
//  418      MT34_Write(0xb8,0x09,300);
//  419      MT34_Write(0xb8,0x0b,500);
//  420     //MT34_Write(0xb8,0x07,0X01CE);*/
//  421       //MT34_Write(0xb8,0X35,50);
//  422      while(read_ru!=0x0301)
??MT34_init_0:
        LDR.N    R0,??DataTable1_1
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+769
        CMP      R0,R1
        BEQ.N    ??MT34_init_1
//  423       {
//  424             MT34_Write(0xb8,0x0d,0x0301);
        MOVW     R2,#+769
        MOVS     R1,#+13
        MOVS     R0,#+184
          CFI FunCall MT34_Write
        BL       MT34_Write
//  425             read_ru=MT34_Read(0xb8,0x0d);
        MOVS     R1,#+13
        MOVS     R0,#+184
          CFI FunCall MT34_Read
        BL       MT34_Read
        LDR.N    R1,??DataTable1_1
        STRH     R0,[R1, #+0]
        B.N      ??MT34_init_0
//  426       }
//  427  
//  428  }
??MT34_init_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     write_catch

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     read_ru

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//     2 bytes in section .bss
//   212 bytes in section .data
// 1 806 bytes in section .text
// 
// 1 806 bytes of CODE memory
//   214 bytes of DATA memory
//
//Errors: none
//Warnings: 3
