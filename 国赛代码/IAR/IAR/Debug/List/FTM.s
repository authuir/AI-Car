///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:07
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\FTM.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\FTM.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\FTM.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN Disable_IRQ
        EXTERN Enable_IRQ
        EXTERN GPIO_INIT
        EXTERN PORT_Configuer
        EXTERN PORT_Enable
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_f2d
        EXTERN __aeabi_i2d
        EXTERN __aeabi_ui2d

        PUBLIC FTM_CPWM_Init
        PUBLIC FTM_CPWM_Set_Freq
        PUBLIC FTM_Ch_Int_Dis
        PUBLIC FTM_Ch_Int_Enable
        PUBLIC FTM_Clear_Channal_Event
        PUBLIC FTM_Clear_TimeOut
        PUBLIC FTM_EPWM_Init
        PUBLIC FTM_EPWM_Set_Freq
        PUBLIC FTM_IC_Init
        PUBLIC FTM_PWM_Init
        PUBLIC FTM_PWM_Set_Duty
        PUBLIC FTM_PWM_Set_Freq
        PUBLIC FTM_TimeOut_Int_Disable
        PUBLIC FTM_TimeOut_Int_Enable
        PUBLIC FTMn
        PUBLIC QD_init_FTM
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\FTM.c
//    1 #include "all.h"
//    2 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function QD_init_FTM
        THUMB
//    3 void QD_init_FTM()
//    4  {
QD_init_FTM:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//    5 #if  1
//    6      SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;//使能FTM0
        LDR.W    R0,??DataTable3  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable3  ;; 0x4004803c
        STR      R0,[R1, #+0]
//    7      SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;//使能FTM0
        LDR.W    R0,??DataTable3_1  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable3_1  ;; 0x40048030
        STR      R0,[R1, #+0]
//    8      
//    9      SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;//使能PORTA时钟
        LDR.W    R0,??DataTable3_2  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.W    R1,??DataTable3_2  ;; 0x40048038
        STR      R0,[R1, #+0]
//   10      PORT_Configuer(PORTA,8,6);
        MOVS     R2,#+6
        MOVS     R1,#+8
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
//   11      PORT_Configuer(PORTA,9,6);
        MOVS     R2,#+6
        MOVS     R1,#+9
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
//   12      
//   13      
//   14      FTM1_MOD = 0xFFFF;//设置上限，其实没啥用
        MOVW     R0,#+65535
        LDR.W    R1,??DataTable3_3  ;; 0x40039008
        STR      R0,[R1, #+0]
//   15      
//   16      FTM1_MODE |= FTM_MODE_FTMEN_MASK
//   17          | FTM_MODE_WPDIS_MASK;//使能FTM，禁止写
        LDR.W    R0,??DataTable3_4  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x5
        LDR.W    R1,??DataTable3_4  ;; 0x40039054
        STR      R0,[R1, #+0]
//   18      FTM1_QDCTRL |= FTM_QDCTRL_QUADMODE_MASK 
//   19          | FTM_QDCTRL_QUADEN_MASK
//   20              | FTM_QDCTRL_QUADIR_MASK;//使能正交解码
        LDR.W    R0,??DataTable3_5  ;; 0x40039080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xD
        LDR.W    R1,??DataTable3_5  ;; 0x40039080
        STR      R0,[R1, #+0]
//   21      
//   22      FTM1_CNTIN = 0;//设置最低位
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_6  ;; 0x4003904c
        STR      R0,[R1, #+0]
//   23      FTM1_CNT = 0;//初始清零
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_7  ;; 0x40039004
        STR      R0,[R1, #+0]
//   24      
//   25       PORT_Configuer(PORTA,10,6);
        MOVS     R2,#+6
        MOVS     R1,#+10
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
//   26      PORT_Configuer(PORTA,11,6);
        MOVS     R2,#+6
        MOVS     R1,#+11
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
//   27      
//   28      
//   29      FTM2_MOD = 0xFFFF;//设置上限，其实没啥用
        MOVW     R0,#+65535
        LDR.W    R1,??DataTable3_8  ;; 0x400b8008
        STR      R0,[R1, #+0]
//   30      
//   31      FTM2_MODE |= FTM_MODE_FTMEN_MASK
//   32          | FTM_MODE_WPDIS_MASK;//使能FTM，禁止写
        LDR.W    R0,??DataTable3_9  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x5
        LDR.W    R1,??DataTable3_9  ;; 0x400b8054
        STR      R0,[R1, #+0]
//   33      FTM2_QDCTRL |= FTM_QDCTRL_QUADMODE_MASK 
//   34          | FTM_QDCTRL_QUADEN_MASK
//   35              | FTM_QDCTRL_QUADIR_MASK;//使能正交解码
        LDR.W    R0,??DataTable3_10  ;; 0x400b8080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xD
        LDR.W    R1,??DataTable3_10  ;; 0x400b8080
        STR      R0,[R1, #+0]
//   36      
//   37      FTM2_CNTIN = 0;//设置最低位
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_11  ;; 0x400b804c
        STR      R0,[R1, #+0]
//   38      FTM2_CNT = 0;//初始清零
        MOVS     R0,#+0
        LDR.W    R1,??DataTable4  ;; 0x400b8004
        STR      R0,[R1, #+0]
//   39      GPIO_INIT(PORTC,1,0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   40      GPIO_INIT(PORTC,4,0);
        MOVS     R2,#+0
        MOVS     R1,#+4
        MOVS     R0,#+2
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//   41      
//   42 #endif
//   43  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   44 
//   45 #define BUS_CLK		75000000
//   46 #define MCGFFCLK 	48828
//   47 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   48 FTM_MemMapPtr FTMn[4] = {FTM0_BASE_PTR, FTM1_BASE_PTR, FTM2_BASE_PTR,FTM3_BASE_PTR}; //定义三个指针数组保存 Ftmn_e 的地址
FTMn:
        DATA
        DC32 40038000H, 40039000H, 400B8000H, 400B9000H
//   49 
//   50 /*************************PWM占空比 = (CnV-CNTIN)/(MOD-CNTIN+1)**************/
//   51 /*************************PWM频率 = Bus_CLK / 2^CPWM / 2^PS / Mod************/
//   52 
//   53 /********************************** 高频 *****************************************	
//   54  * 	EPWM(PS=0,CPWM=0)							CPWM(PS=0,CPWM=1)
//   55  * 	Frequency	Mod		Duty			Frequency	Mod		Duty	
//   56  * 	3.75M Hz	20(勉强,波形失真比较严重)		
//   57  * 	...			...
//   58  * 	2.5M Hz  	30(波形失真,勉强接受)                   2M Hz           (理论是18.75,但必须为整数)(波形失真,勉强接受)
//   59  * 	....		...					...		...
//   60  * 	1M Hz		75
//   61  * 	...			...
//   62  * 	757.5K Hz	99					378.78K Hz	99
//   63  * 	
//   64  ********************************** 中高频 **************************************
//   65  *************************** 最理想的PWM频率范围 ********************************
//   66  * 	Mod >= 100
//   67  * 	EPWM(PS=*,CPWM=0)					CPWM(PS=*,CPWM=1)
//   68  * 	Frequency	Duty					Frequency	Duty
//   69  * 	1200~750k	N*1%(100<=Mod<1000)			600~375K	N*1%
//   70  * 	10~1200		N*0.1%					5~600		N*0.1%
//   71  ********************************** 低频 ***************************************** 	
//   72  * 	以上都是以总线时钟为FTM的时钟
//   73  * 	理论上用MCGFFCLK时钟可以做到0.0008Hz,但配置的时候出了点问题,没配出来			
//   74  */
//   75 //参数:Mode	EPWM_MODE,CPWM_MODE

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function FTM_PWM_Init
        THUMB
//   76 void FTM_PWM_Init(uint8 Mode, uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty)
//   77 {
FTM_PWM_Init:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        VPUSH    {D8}
          CFI D8 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        VMOV.F32 S16,S0
//   78 	if(Mode == EPWM_MODE)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??FTM_PWM_Init_0
//   79 		FTM_EPWM_Init(Ftmn_CHx_PTnx, Freq, Duty);
        VMOV.F32 S0,S16
        MOVS     R1,R6
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall FTM_EPWM_Init
        BL       FTM_EPWM_Init
        B.N      ??FTM_PWM_Init_1
//   80 	else
//   81 		FTM_CPWM_Init(Ftmn_CHx_PTnx, Freq, Duty);
??FTM_PWM_Init_0:
        VMOV.F32 S0,S16
        MOVS     R1,R6
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall FTM_CPWM_Init
        BL       FTM_CPWM_Init
//   82 }
??FTM_PWM_Init_1:
        VPOP     {D8}
          CFI D8 SameValue
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function FTM_PWM_Set_Freq
        THUMB
//   83 void FTM_PWM_Set_Freq(FTMn_e Ftmn, FTM_CHn_e CHx, uint32 Freq)
//   84 {
FTM_PWM_Set_Freq:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//   85 	if((FTM_SC_REG(FTMn[Ftmn]) & FTM_SC_CPWMS_MASK) == FTM_SC_CPWMS_MASK)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??FTM_PWM_Set_Freq_0
//   86 		FTM_CPWM_Set_Freq(Ftmn, CHx, Freq);
        MOVS     R2,R6
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall FTM_CPWM_Set_Freq
        BL       FTM_CPWM_Set_Freq
        B.N      ??FTM_PWM_Set_Freq_1
//   87 	else
//   88 		FTM_EPWM_Set_Freq(Ftmn, CHx, Freq);
??FTM_PWM_Set_Freq_0:
        MOVS     R2,R6
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall FTM_EPWM_Set_Freq
        BL       FTM_EPWM_Set_Freq
//   89 }
??FTM_PWM_Set_Freq_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock2
//   90 /**********************************************************************/
//   91 /* 简介:设置EPWM,CPWM的占空比,频率不变
//   92  * 例程:FTM_PWM_Set_Duty(FTM0, FTM_CH0, 0.8);
//   93  * 参数: 	Ftmn:	FTM0~2	
//   94  * 		CHx:	FTM_CH0
//   95  * 		Freq:	范围:
//   96  * 					当PWM为EPWM:	BUS_CLK/0xFFFF/128*105/100~~BUS_CLK/100	
//   97  * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,精度达到1%,剩余的精度达到0.1%
//   98  * 								如果BUS_CLK=75MHz,则9~750 000.  1.2K~750K,精度达到1%,9~1.2K,精度达到0.1%
//   99  * 					当PWM为CPWM:	BUS_CLK/2/0xFFFF/128*105/100~~BUS_CLK/2/100	
//  100  * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,精度达到1%,剩余的精度达到0.1%
//  101  * 								如果BUS_CLK=75MHz,则5~375 000.  0.6K~375K,精度达到1%,9~0.6K,精度达到0.1%
//  102  */
//  103 /*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function FTM_PWM_Set_Duty
        THUMB
//  104 void FTM_PWM_Set_Duty(uint8 Ftmn, uint8 CHx, float Duty)
//  105 {
FTM_PWM_Set_Duty:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        VPUSH    {D8}
          CFI D8 Frame(CFA, -32)
          CFI CFA R13+32
        MOVS     R5,R0
        MOVS     R4,R1
        VMOV.F32 S16,S0
//  106 	uint16 mod = 0;
        MOVS     R6,#+0
//  107 	do
//  108 	{
//  109 		mod = FTM_MOD_REG(FTMn[Ftmn]);
??FTM_PWM_Set_Duty_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, R5, LSL #+2]
        LDR      R0,[R0, #+8]
        MOVS     R6,R0
//  110 	}while(mod == 0);
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??FTM_PWM_Set_Duty_0
//  111 	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)((float)(mod)*Duty-0.5);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, R5, LSL #+2]
        ADDS     R7,R0,R4, LSL #+3
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        VMOV     S0,R6
        VCVT.F32.U32 S0,S0
        VMUL.F32 S0,S0,S16
        VMOV     R0,S0
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable4_2  ;; 0xbfe00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2iz
        BL       __aeabi_d2iz
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[R7, #+16]
//  112 	//FTM_CNT_REG(FTMn[Ftmn])   = 0;                         //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
//  113 }	
        VPOP     {D8}
          CFI D8 SameValue
          CFI CFA R13+24
        POP      {R0,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock3
//  114 
//  115 /***************************** EPWM  ***********************************/
//  116 /* 注意:我默认用总线时钟75MHz,如果总线时钟不等于75MHz,则重新算.如果用MCGFLL时钟(48.828kHz),PWM频率可以做更低
//  117  * 简介:初始化EPWM为(边沿对齐)edge-aligned,频率,占空比
//  118  * 例程:FTM_EPWM_Init(FTM0_CH0_PTC1, 10000, 0.5);//频率为10k,占空比为50%的边沿EPWM
//  119  * 参数: 	Ftmn_CHx_PTnx:	放在FTM.h文件
//  120  * 		Freq:			范围:BUS_CLK/0xFFFF/128*105/100~~BUS_CLK/100	
//  121  * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,精度达到1%,剩余的精度达到0.1%
//  122  * 								如果BUS_CLK=75MHz,则9~750 000.  1.2K~750K,精度达到1%,9~1.2K,精度达到0.1%
//  123  * 		Duty:			0~1
//  124  */
//  125 /*********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function FTM_EPWM_Init
        THUMB
//  126 void FTM_EPWM_Init(uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty)
//  127 {
FTM_EPWM_Init:
        PUSH     {R4-R10,LR}
          CFI R14 Frame(CFA, -4)
          CFI R10 Frame(CFA, -8)
          CFI R9 Frame(CFA, -12)
          CFI R8 Frame(CFA, -16)
          CFI R7 Frame(CFA, -20)
          CFI R6 Frame(CFA, -24)
          CFI R5 Frame(CFA, -28)
          CFI R4 Frame(CFA, -32)
          CFI CFA R13+32
        VPUSH    {D8-D9}
          CFI D9 Frame(CFA, -40)
          CFI D8 Frame(CFA, -48)
          CFI CFA R13+48
        MOV      R9,R0
        MOVS     R4,R1
        VMOV.F32 S16,S0
//  128 	uint16 Ftmn = 4,CHx = 8, PS = 0, mod = 0;
        MOVS     R5,#+4
        MOVS     R6,#+8
        MOVS     R7,#+0
        MOVS     R8,#+0
//  129     double temp = 0;
        VLDR.W   D9,??FTM_EPWM_Init_0
//  130     switch(Ftmn_CHx_PTnx & 0xF000) //写保护禁止 
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ANDS     R0,R9,#0xF000
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??FTM_EPWM_Init_1
        CMP      R0,#+4096
        BEQ.N    ??FTM_EPWM_Init_2
        CMP      R0,#+8192
        BEQ.N    ??FTM_EPWM_Init_3
        CMP      R0,#+12288
        BEQ.N    ??FTM_EPWM_Init_4
        B.N      ??FTM_EPWM_Init_5
//  131     	{
//  132     		case 0x0000:Ftmn = 0;SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;FTM0_MODE |= FTM_MODE_WPDIS_MASK;break;
??FTM_EPWM_Init_1:
        MOVS     R0,#+0
        MOVS     R5,R0
        LDR.W    R0,??DataTable3  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable3  ;; 0x4004803c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable4_3  ;; 0x40038054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable4_3  ;; 0x40038054
        STR      R0,[R1, #+0]
        B.N      ??FTM_EPWM_Init_5
//  133     		case 0x1000:Ftmn = 1;SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;FTM1_MODE |= FTM_MODE_WPDIS_MASK;break;
??FTM_EPWM_Init_2:
        MOVS     R0,#+1
        MOVS     R5,R0
        LDR.W    R0,??DataTable3  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable3  ;; 0x4004803c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable3_4  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable3_4  ;; 0x40039054
        STR      R0,[R1, #+0]
        B.N      ??FTM_EPWM_Init_5
//  134     		case 0x2000:Ftmn = 2;SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;FTM2_MODE |= FTM_MODE_WPDIS_MASK;break;
??FTM_EPWM_Init_3:
        MOVS     R0,#+2
        MOVS     R5,R0
        LDR.W    R0,??DataTable3_1  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable3_1  ;; 0x40048030
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable3_9  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable3_9  ;; 0x400b8054
        STR      R0,[R1, #+0]
        B.N      ??FTM_EPWM_Init_5
//  135     		case 0x3000:Ftmn = 3;SIM_SCGC3 |= SIM_SCGC3_FTM3_MASK;FTM3_MODE |= FTM_MODE_WPDIS_MASK;break;
??FTM_EPWM_Init_4:
        MOVS     R0,#+3
        MOVS     R5,R0
        LDR.W    R0,??DataTable3_1  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable3_1  ;; 0x40048030
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable4_4  ;; 0x400b9054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable4_4  ;; 0x400b9054
        STR      R0,[R1, #+0]
//  136     	}
//  137     	switch(Ftmn_CHx_PTnx & 0x0F00)
??FTM_EPWM_Init_5:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ANDS     R0,R9,#0xF00
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??FTM_EPWM_Init_6
        CMP      R0,#+256
        BEQ.N    ??FTM_EPWM_Init_7
        CMP      R0,#+512
        BEQ.N    ??FTM_EPWM_Init_8
        CMP      R0,#+768
        BEQ.N    ??FTM_EPWM_Init_9
        CMP      R0,#+1024
        BEQ.N    ??FTM_EPWM_Init_10
        CMP      R0,#+1280
        BEQ.N    ??FTM_EPWM_Init_11
        CMP      R0,#+1536
        BEQ.N    ??FTM_EPWM_Init_12
        CMP      R0,#+1792
        BEQ.N    ??FTM_EPWM_Init_13
        B.N      ??FTM_EPWM_Init_14
        DATA
??FTM_EPWM_Init_0:
        DC32     0x0,0x0
        THUMB
//  138     	{
//  139     		case 0x0000:CHx = 0;break;
??FTM_EPWM_Init_6:
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??FTM_EPWM_Init_14
//  140     		case 0x0100:CHx = 1;break;
??FTM_EPWM_Init_7:
        MOVS     R0,#+1
        MOVS     R6,R0
        B.N      ??FTM_EPWM_Init_14
//  141     		case 0x0200:CHx = 2;break;
??FTM_EPWM_Init_8:
        MOVS     R0,#+2
        MOVS     R6,R0
        B.N      ??FTM_EPWM_Init_14
//  142     		case 0x0300:CHx = 3;break;
??FTM_EPWM_Init_9:
        MOVS     R0,#+3
        MOVS     R6,R0
        B.N      ??FTM_EPWM_Init_14
//  143     		case 0x0400:CHx = 4;break;
??FTM_EPWM_Init_10:
        MOVS     R0,#+4
        MOVS     R6,R0
        B.N      ??FTM_EPWM_Init_14
//  144     		case 0x0500:CHx = 5;break;
??FTM_EPWM_Init_11:
        MOVS     R0,#+5
        MOVS     R6,R0
        B.N      ??FTM_EPWM_Init_14
//  145     		case 0x0600:CHx = 6;break;
??FTM_EPWM_Init_12:
        MOVS     R0,#+6
        MOVS     R6,R0
        B.N      ??FTM_EPWM_Init_14
//  146     		case 0x0700:CHx = 7;break;
??FTM_EPWM_Init_13:
        MOVS     R0,#+7
        MOVS     R6,R0
//  147     	}	
//  148     	switch(Ftmn_CHx_PTnx & 0x00FF)
??FTM_EPWM_Init_14:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTB     R0,R9            ;; ZeroExt  R0,R9,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??FTM_EPWM_Init_15
        CMP      R0,#+2
        BEQ.N    ??FTM_EPWM_Init_16
        BCC.N    ??FTM_EPWM_Init_17
        CMP      R0,#+4
        BEQ.W    ??FTM_EPWM_Init_18
        BCC.N    ??FTM_EPWM_Init_19
        CMP      R0,#+6
        BEQ.W    ??FTM_EPWM_Init_20
        BCC.W    ??FTM_EPWM_Init_21
        CMP      R0,#+8
        BEQ.W    ??FTM_EPWM_Init_22
        BCC.W    ??FTM_EPWM_Init_23
        CMP      R0,#+10
        BEQ.W    ??FTM_EPWM_Init_24
        BCC.W    ??FTM_EPWM_Init_25
        CMP      R0,#+12
        BEQ.W    ??FTM_EPWM_Init_26
        BCC.W    ??FTM_EPWM_Init_27
        CMP      R0,#+14
        BEQ.W    ??FTM_EPWM_Init_28
        BCC.W    ??FTM_EPWM_Init_29
        CMP      R0,#+16
        BEQ.W    ??FTM_EPWM_Init_30
        BCC.W    ??FTM_EPWM_Init_31
        CMP      R0,#+18
        BEQ.W    ??FTM_EPWM_Init_32
        BCC.W    ??FTM_EPWM_Init_33
        CMP      R0,#+20
        BEQ.W    ??FTM_EPWM_Init_34
        BCC.W    ??FTM_EPWM_Init_35
        CMP      R0,#+22
        BEQ.W    ??FTM_EPWM_Init_36
        BCC.W    ??FTM_EPWM_Init_37
        CMP      R0,#+24
        BEQ.W    ??FTM_EPWM_Init_38
        BCC.W    ??FTM_EPWM_Init_39
        CMP      R0,#+26
        BEQ.W    ??FTM_EPWM_Init_40
        BCC.W    ??FTM_EPWM_Init_41
        CMP      R0,#+28
        BEQ.W    ??FTM_EPWM_Init_42
        BCC.W    ??FTM_EPWM_Init_43
        CMP      R0,#+30
        BEQ.W    ??FTM_EPWM_Init_44
        BCC.W    ??FTM_EPWM_Init_45
        CMP      R0,#+32
        BEQ.W    ??FTM_EPWM_Init_46
        BCC.W    ??FTM_EPWM_Init_47
        CMP      R0,#+34
        BEQ.W    ??FTM_EPWM_Init_48
        BCC.W    ??FTM_EPWM_Init_49
        CMP      R0,#+36
        BEQ.W    ??FTM_EPWM_Init_50
        BCC.W    ??FTM_EPWM_Init_51
        CMP      R0,#+38
        BEQ.W    ??FTM_EPWM_Init_52
        BCC.W    ??FTM_EPWM_Init_53
        CMP      R0,#+40
        BEQ.W    ??FTM_EPWM_Init_54
        BCC.W    ??FTM_EPWM_Init_55
        CMP      R0,#+41
        BEQ.W    ??FTM_EPWM_Init_56
        B.N      ??FTM_EPWM_Init_57
//  149     	{
//  150     	case 0 :PORT_Enable(PORTC);PORT_Configuer(PORTC, 1,  4);break;
??FTM_EPWM_Init_15:
        MOVS     R0,#+2
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+4
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  151     	case 1 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 3,  3);break;
??FTM_EPWM_Init_17:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+3
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  152     	case 2 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 4,  3);break;
??FTM_EPWM_Init_16:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+4
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  153     	case 3 :PORT_Enable(PORTC);PORT_Configuer(PORTC, 2,  4);break;
??FTM_EPWM_Init_19:
        MOVS     R0,#+2
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+4
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  154     	case 4 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 5,  3);break;
??FTM_EPWM_Init_18:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+5
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  155     	case 5 :PORT_Enable(PORTC);PORT_Configuer(PORTC, 3,  4);break;
??FTM_EPWM_Init_21:
        MOVS     R0,#+2
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+4
        MOVS     R1,#+3
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  156     	case 6 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 6,  3);break;
??FTM_EPWM_Init_20:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+6
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  157     	case 7 :PORT_Enable(PORTC);PORT_Configuer(PORTC, 4,  4);break;
??FTM_EPWM_Init_23:
        MOVS     R0,#+2
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+4
        MOVS     R1,#+4
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  158     	case 8 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 7,  3);break;
??FTM_EPWM_Init_22:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+7
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  159     	case 9 :PORT_Enable(PORTD);PORT_Configuer(PORTD, 4,  4);break;
??FTM_EPWM_Init_25:
        MOVS     R0,#+3
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+4
        MOVS     R1,#+4
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  160     	case 10:PORT_Enable(PORTD);PORT_Configuer(PORTD, 5,  4);break;
??FTM_EPWM_Init_24:
        MOVS     R0,#+3
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+4
        MOVS     R1,#+5
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  161     	case 11:PORT_Enable(PORTA);PORT_Configuer(PORTA, 0,  3);break;
??FTM_EPWM_Init_27:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  162     	case 12:PORT_Enable(PORTD);PORT_Configuer(PORTD, 6,  4);break;
??FTM_EPWM_Init_26:
        MOVS     R0,#+3
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+4
        MOVS     R1,#+6
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  163     	case 13:PORT_Enable(PORTA);PORT_Configuer(PORTA, 1,  3);break;
??FTM_EPWM_Init_29:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  164     	case 14:PORT_Enable(PORTD);PORT_Configuer(PORTD, 7,  4);break;
??FTM_EPWM_Init_28:
        MOVS     R0,#+3
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+4
        MOVS     R1,#+7
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  165     	case 15:PORT_Enable(PORTA);PORT_Configuer(PORTA, 2,  3);break;		
??FTM_EPWM_Init_31:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+2
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  166     	case 16:PORT_Enable(PORTA);PORT_Configuer(PORTA, 12, 3);break;
??FTM_EPWM_Init_30:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+12
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  167     	case 17:PORT_Enable(PORTA);PORT_Configuer(PORTA, 8,  3);break;
??FTM_EPWM_Init_33:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+8
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  168     	case 18:PORT_Enable(PORTB);PORT_Configuer(PORTB, 0,  3);break;
??FTM_EPWM_Init_32:
        MOVS     R0,#+1
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  169     	case 19:PORT_Enable(PORTA);PORT_Configuer(PORTA, 13, 3);break;
??FTM_EPWM_Init_35:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+13
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  170     	case 20:PORT_Enable(PORTA);PORT_Configuer(PORTA, 9,  3);break;
??FTM_EPWM_Init_34:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+9
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  171     	case 21:PORT_Enable(PORTB);PORT_Configuer(PORTB, 1,  3);break;
??FTM_EPWM_Init_37:
        MOVS     R0,#+1
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  172     	case 22:PORT_Enable(PORTA);PORT_Configuer(PORTA, 10, 3);break;
??FTM_EPWM_Init_36:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+10
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  173     	case 23:PORT_Enable(PORTB);PORT_Configuer(PORTB, 18, 3);break;
??FTM_EPWM_Init_39:
        MOVS     R0,#+1
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+18
        MOVS     R0,#+1
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  174     	case 24:PORT_Enable(PORTA);PORT_Configuer(PORTA, 11, 3);break;
??FTM_EPWM_Init_38:
        MOVS     R0,#+0
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+11
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  175     	case 25:PORT_Enable(PORTB);PORT_Configuer(PORTB, 19, 3);break;
??FTM_EPWM_Init_41:
        MOVS     R0,#+1
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+19
        MOVS     R0,#+1
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  176     	case 26:PORT_Enable(PORTD);PORT_Configuer(PORTD, 0,  4);break;
??FTM_EPWM_Init_40:
        MOVS     R0,#+3
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+4
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  177     	case 27:PORT_Enable(PORTD);PORT_Configuer(PORTD, 1,  4);break;
??FTM_EPWM_Init_43:
        MOVS     R0,#+3
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+4
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  178     	case 28:PORT_Enable(PORTD);PORT_Configuer(PORTD, 2,  4);break;
??FTM_EPWM_Init_42:
        MOVS     R0,#+3
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+4
        MOVS     R1,#+2
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  179     	case 29:PORT_Enable(PORTD);PORT_Configuer(PORTD, 3,  4);break;
??FTM_EPWM_Init_45:
        MOVS     R0,#+3
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+4
        MOVS     R1,#+3
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  180     	case 30:PORT_Enable(PORTC);PORT_Configuer(PORTC, 8,  3);break;
??FTM_EPWM_Init_44:
        MOVS     R0,#+2
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+8
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  181     	case 31:PORT_Enable(PORTC);PORT_Configuer(PORTC, 9,  3);break;
??FTM_EPWM_Init_47:
        MOVS     R0,#+2
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+9
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  182     	case 32:PORT_Enable(PORTC);PORT_Configuer(PORTC, 10, 3);break;
??FTM_EPWM_Init_46:
        MOVS     R0,#+2
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+10
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  183     	case 33:PORT_Enable(PORTC);PORT_Configuer(PORTC, 11, 3);break;
??FTM_EPWM_Init_49:
        MOVS     R0,#+2
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+3
        MOVS     R1,#+11
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  184     	case 34:PORT_Enable(PORTE);PORT_Configuer(PORTE, 5,  6);break;
??FTM_EPWM_Init_48:
        MOVS     R0,#+4
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+6
        MOVS     R1,#+5
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  185     	case 35:PORT_Enable(PORTE);PORT_Configuer(PORTE, 6,  6);break;
??FTM_EPWM_Init_51:
        MOVS     R0,#+4
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+6
        MOVS     R1,#+6
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  186     	case 36:PORT_Enable(PORTE);PORT_Configuer(PORTE, 7,  6);break;
??FTM_EPWM_Init_50:
        MOVS     R0,#+4
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+6
        MOVS     R1,#+7
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  187     	case 37:PORT_Enable(PORTE);PORT_Configuer(PORTE, 8,  6);break;
??FTM_EPWM_Init_53:
        MOVS     R0,#+4
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+6
        MOVS     R1,#+8
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  188     	case 38:PORT_Enable(PORTE);PORT_Configuer(PORTE, 9,  6);break;
??FTM_EPWM_Init_52:
        MOVS     R0,#+4
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+6
        MOVS     R1,#+9
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  189     	case 39:PORT_Enable(PORTE);PORT_Configuer(PORTE, 10, 6);break;
??FTM_EPWM_Init_55:
        MOVS     R0,#+4
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+6
        MOVS     R1,#+10
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  190     	case 40:PORT_Enable(PORTE);PORT_Configuer(PORTE, 11, 6);break;
??FTM_EPWM_Init_54:
        MOVS     R0,#+4
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+6
        MOVS     R1,#+11
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_EPWM_Init_57
//  191     	case 41:PORT_Enable(PORTE);PORT_Configuer(PORTE, 12, 6);break;
??FTM_EPWM_Init_56:
        MOVS     R0,#+4
          CFI FunCall PORT_Enable
        BL       PORT_Enable
        MOVS     R2,#+6
        MOVS     R1,#+12
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
//  192     	}
//  193 	if(Freq >= BUS_CLK/0xFFFF*105/100)
??FTM_EPWM_Init_57:
        CMP      R4,#+1200
        BLS.N    ??FTM_EPWM_Init_58
//  194 		PS = 0;
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Init_59
//  195 	else if(Freq >= BUS_CLK/0xFFFF*105/100/2)
??FTM_EPWM_Init_58:
        CMP      R4,#+600
        BCC.N    ??FTM_EPWM_Init_60
//  196 		PS = 1;
        MOVS     R0,#+1
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Init_59
//  197 	else if(Freq >= BUS_CLK/0xFFFF*105/100/4)
??FTM_EPWM_Init_60:
        CMP      R4,#+300
        BCC.N    ??FTM_EPWM_Init_61
//  198 		PS = 2;
        MOVS     R0,#+2
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Init_59
//  199 	else if(Freq >= BUS_CLK/0xFFFF*105/100/8)
??FTM_EPWM_Init_61:
        CMP      R4,#+150
        BCC.N    ??FTM_EPWM_Init_62
//  200 		PS = 3;
        MOVS     R0,#+3
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Init_59
//  201 	else if(Freq >= BUS_CLK/0xFFFF*105/100/16)
??FTM_EPWM_Init_62:
        CMP      R4,#+75
        BCC.N    ??FTM_EPWM_Init_63
//  202 		PS = 4;
        MOVS     R0,#+4
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Init_59
//  203 	else if(Freq >= BUS_CLK/0xFFFF*105/100/32)
??FTM_EPWM_Init_63:
        CMP      R4,#+37
        BCC.N    ??FTM_EPWM_Init_64
//  204 		PS = 5;
        MOVS     R0,#+5
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Init_59
//  205 	else if(Freq >= BUS_CLK/0xFFFF*105/100/64)
??FTM_EPWM_Init_64:
        CMP      R4,#+18
        BCC.N    ??FTM_EPWM_Init_65
//  206 		PS = 6;
        MOVS     R0,#+6
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Init_59
//  207 	else if(Freq >= BUS_CLK/0xFFFF*105/100/128)
??FTM_EPWM_Init_65:
        CMP      R4,#+9
        BCC.N    ??FTM_EPWM_Init_59
//  208 		PS = 7;
        MOVS     R0,#+7
        MOVS     R7,R0
//  209 	/******************** 选择输出模式为 边沿对齐EPWM,先高后低 *******************/
//  210 	FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~FTM_CnSC_ELSA_MASK;
??FTM_EPWM_Init_59:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, R5, LSL #+2]
        ADDS     R0,R0,R6, LSL #+3
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.W    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        ADDS     R1,R1,R6, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x4
        STR      R1,[R0, #+12]
//  211 	FTM_CnSC_REG(FTMn[Ftmn], CHx) |= FTM_CnSC_MSB_MASK | FTM_CnSC_ELSB_MASK;
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, R5, LSL #+2]
        ADDS     R0,R0,R6, LSL #+3
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.W    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        ADDS     R1,R1,R6, LSL #+3
        LDR      R1,[R1, #+12]
        ORRS     R1,R1,#0x28
        STR      R1,[R0, #+12]
//  212 	// MSnB:MSnA = 1x;CPWMS = 0	边沿对齐PWM
//  213 	// ELSnB:ELSnA = 10     	先高后低
//  214 	// ELSnB:ELSnA = 11    	 	先低后高
//  215 	/******************** 配置时钟和分频 ********************/
//  216 	FTM_SC_REG(FTMn[Ftmn]) &= ~FTM_SC_CPWMS_MASK;//选择边沿对齐,
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, R5, LSL #+2]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x20
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.W    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        STR      R0,[R1, #+0]
//  217 	FTM_SC_REG(FTMn[Ftmn]) |= (FTM_SC_PS(PS)|FTM_SC_CLKS(1) );          
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, R5, LSL #+2]
        LDR      R0,[R0, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ANDS     R1,R7,#0x7
        ORRS     R1,R1,#0x8
        ORRS     R0,R1,R0
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.W    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        STR      R0,[R1, #+0]
//  218 	//分频因子，分频系数 = 2^PS.   时钟选择， 0：没选择时钟，禁用； 1：bus 时钟； 2：MCGFFCLK； 3：EXTCLK（ 由SIM_SOPT4 选择输入管脚 FTM_CLKINx）
//  219 	// FTM_SC_TOIE_MASK        //溢出中断使能（注释了表示 禁止溢出中断） 
//  220     temp = (double)(BUS_CLK)/Freq;
        MOVS     R0,R4
          CFI FunCall __aeabi_ui2d
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.W    R1,??DataTable6_1  ;; 0x4191e1a3
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
        VMOV     D9,R0,R1
//  221     mod = (uint16)(temp / (1<<PS) +0.5);
        MOVS     R0,#+1
        LSLS     R0,R0,R7
          CFI FunCall __aeabi_i2d
        BL       __aeabi_i2d
        MOVS     R2,R0
        MOVS     R3,R1
        VMOV     R0,R1,D9
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.W    R3,??DataTable6_2  ;; 0x3fe00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2iz
        BL       __aeabi_d2iz
        MOV      R8,R0
//  222 	//	mod = (uint16)( (((double)(BUS_CLK)/Freq) /(1<<(FTM_SC_REG(FTMn[Ftmn])&FTM_SC_CPWMS_MASK)) / (1<<PS) +0.5) );
//  223 	FTM_MOD_REG(FTMn[Ftmn]) = (mod - 1);                        //模数, EPWM的周期为 ：MOD - CNTIN + 0x0001
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R8,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.W    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        STR      R0,[R1, #+8]
//  224 	FTM_CNTIN_REG(FTMn[Ftmn]) = 0;                          //计数器初始化值。设置脉冲宽度：(CnV - CNTIN).
        MOVS     R0,#+0
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.W    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        STR      R0,[R1, #+76]
//  225 	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)((float)(mod)*Duty + 0.1+0.5-1);
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, R5, LSL #+2]
        ADDS     R10,R0,R6, LSL #+3
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        VMOV     S0,R8
        VCVT.F32.U32 S0,S0
        VMUL.F32 S0,S0,S16
        VMOV     R0,S0
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable6_3  ;; 0x9999999a
        LDR.W    R3,??DataTable6_4  ;; 0x3fb99999
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR.W    R3,??DataTable6_2  ;; 0x3fe00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR.W    R3,??DataTable6_5  ;; 0xbff00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2iz
        BL       __aeabi_d2iz
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[R10, #+16]
//  226 	FTM_CNT_REG(FTMn[Ftmn])   = 1;                          //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
        MOVS     R0,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.W    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        STR      R0,[R1, #+4]
//  227 }
        VPOP     {D8-D9}
          CFI D8 SameValue
          CFI D9 SameValue
          CFI CFA R13+32
        POP      {R4-R10,PC}      ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x40039008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x40039054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x40039080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x4003904c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x40039004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x400b8008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x400b8054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     0x400b8080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     0x400b804c
//  228 /***************************** CPWM  ***********************************/
//  229 /* 注意:我默认用总线时钟75MHz,如果总线时钟不等于75MHz,则重新算.如果用MCGFLL时钟(48.828kHz),PWM频率可以做更低
//  230  * 简介:初始化CPWM为(中间对齐)Center-aligned,频率,占空比
//  231  * 例程:FTM_CPWM_Init(FTM0_CH0_PTC1, 10000, 0.5);//频率为10k,占空比为50%的边沿EPWM
//  232  * 参数: 	Ftmn_CHx_PTnx:	放在FTM.h文件
//  233  * 		Freq:			范围:BUS_CLK/2/0xFFFF/128*105/100~~BUS_CLK/2/100	
//  234  * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,精度达到1%,剩余的精度达到0.1%
//  235  * 								如果BUS_CLK=75MHz,则5~375 000.  0.6K~375K,精度达到1%,9~0.6K,精度达到0.1%
//  236  * 		Duty:			0~1
//  237  */
//  238 /*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function FTM_CPWM_Init
        THUMB
//  239 void FTM_CPWM_Init(uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty)
//  240 {
FTM_CPWM_Init:
        PUSH     {R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        VPUSH    {D8}
          CFI D8 Frame(CFA, -48)
          CFI CFA R13+48
        MOV      R9,R0
        MOVS     R4,R1
        VMOV.F32 S16,S0
//  241 	uint16 Ftmn = 4,CHx = 8, PS = 0, mod = 0;
        MOVS     R5,#+4
        MOVS     R6,#+8
        MOVS     R7,#+0
        MOVS     R8,#+0
//  242 	switch(Ftmn_CHx_PTnx & 0xF000) //写保护禁止 
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ANDS     R0,R9,#0xF000
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??FTM_CPWM_Init_0
        CMP      R0,#+4096
        BEQ.N    ??FTM_CPWM_Init_1
        CMP      R0,#+8192
        BEQ.N    ??FTM_CPWM_Init_2
        CMP      R0,#+12288
        BEQ.N    ??FTM_CPWM_Init_3
        B.N      ??FTM_CPWM_Init_4
//  243 	    	{
//  244 	    		case 0x0000:Ftmn = 0;SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;FTM0_MODE |= FTM_MODE_WPDIS_MASK;break;
??FTM_CPWM_Init_0:
        MOVS     R0,#+0
        MOVS     R5,R0
        LDR.W    R0,??DataTable6_6  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable6_6  ;; 0x4004803c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable4_3  ;; 0x40038054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable4_3  ;; 0x40038054
        STR      R0,[R1, #+0]
        B.N      ??FTM_CPWM_Init_4
//  245 	    		case 0x1000:Ftmn = 1;SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;FTM1_MODE |= FTM_MODE_WPDIS_MASK;break;
??FTM_CPWM_Init_1:
        MOVS     R0,#+1
        MOVS     R5,R0
        LDR.W    R0,??DataTable6_6  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable6_6  ;; 0x4004803c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable6_7  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable6_7  ;; 0x40039054
        STR      R0,[R1, #+0]
        B.N      ??FTM_CPWM_Init_4
//  246 	    		case 0x2000:Ftmn = 2;SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;FTM2_MODE |= FTM_MODE_WPDIS_MASK;break;
??FTM_CPWM_Init_2:
        MOVS     R0,#+2
        MOVS     R5,R0
        LDR.W    R0,??DataTable6_8  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable6_8  ;; 0x40048030
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable6_9  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable6_9  ;; 0x400b8054
        STR      R0,[R1, #+0]
        B.N      ??FTM_CPWM_Init_4
//  247 	    		case 0x3000:Ftmn = 3;SIM_SCGC3 |= SIM_SCGC3_FTM3_MASK;FTM3_MODE |= FTM_MODE_WPDIS_MASK;break;
??FTM_CPWM_Init_3:
        MOVS     R0,#+3
        MOVS     R5,R0
        LDR.W    R0,??DataTable6_8  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable6_8  ;; 0x40048030
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable4_4  ;; 0x400b9054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable4_4  ;; 0x400b9054
        STR      R0,[R1, #+0]
//  248 	    	}
//  249 	    	switch(Ftmn_CHx_PTnx & 0x0F00)
??FTM_CPWM_Init_4:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ANDS     R0,R9,#0xF00
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??FTM_CPWM_Init_5
        CMP      R0,#+256
        BEQ.N    ??FTM_CPWM_Init_6
        CMP      R0,#+512
        BEQ.N    ??FTM_CPWM_Init_7
        CMP      R0,#+768
        BEQ.N    ??FTM_CPWM_Init_8
        CMP      R0,#+1024
        BEQ.N    ??FTM_CPWM_Init_9
        CMP      R0,#+1280
        BEQ.N    ??FTM_CPWM_Init_10
        CMP      R0,#+1536
        BEQ.N    ??FTM_CPWM_Init_11
        CMP      R0,#+1792
        BEQ.N    ??FTM_CPWM_Init_12
        B.N      ??FTM_CPWM_Init_13
//  250 	    	{
//  251 	    		case 0x0000:CHx = 0;break;
??FTM_CPWM_Init_5:
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??FTM_CPWM_Init_13
//  252 	    		case 0x0100:CHx = 1;break;
??FTM_CPWM_Init_6:
        MOVS     R0,#+1
        MOVS     R6,R0
        B.N      ??FTM_CPWM_Init_13
//  253 	    		case 0x0200:CHx = 2;break;
??FTM_CPWM_Init_7:
        MOVS     R0,#+2
        MOVS     R6,R0
        B.N      ??FTM_CPWM_Init_13
//  254 	    		case 0x0300:CHx = 3;break;
??FTM_CPWM_Init_8:
        MOVS     R0,#+3
        MOVS     R6,R0
        B.N      ??FTM_CPWM_Init_13
//  255 	    		case 0x0400:CHx = 4;break;
??FTM_CPWM_Init_9:
        MOVS     R0,#+4
        MOVS     R6,R0
        B.N      ??FTM_CPWM_Init_13
//  256 	    		case 0x0500:CHx = 5;break;
??FTM_CPWM_Init_10:
        MOVS     R0,#+5
        MOVS     R6,R0
        B.N      ??FTM_CPWM_Init_13
//  257 	    		case 0x0600:CHx = 6;break;
??FTM_CPWM_Init_11:
        MOVS     R0,#+6
        MOVS     R6,R0
        B.N      ??FTM_CPWM_Init_13
//  258 	    		case 0x0700:CHx = 7;break;
??FTM_CPWM_Init_12:
        MOVS     R0,#+7
        MOVS     R6,R0
//  259 	    	}	
//  260 	    	switch(Ftmn_CHx_PTnx & 0x00FF)
??FTM_CPWM_Init_13:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTB     R0,R9            ;; ZeroExt  R0,R9,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??FTM_CPWM_Init_14
        CMP      R0,#+2
        BEQ.N    ??FTM_CPWM_Init_15
        BCC.N    ??FTM_CPWM_Init_16
        CMP      R0,#+4
        BEQ.N    ??FTM_CPWM_Init_17
        BCC.N    ??FTM_CPWM_Init_18
        CMP      R0,#+6
        BEQ.N    ??FTM_CPWM_Init_19
        BCC.N    ??FTM_CPWM_Init_20
        CMP      R0,#+8
        BEQ.W    ??FTM_CPWM_Init_21
        BCC.N    ??FTM_CPWM_Init_22
        CMP      R0,#+10
        BEQ.W    ??FTM_CPWM_Init_23
        BCC.W    ??FTM_CPWM_Init_24
        CMP      R0,#+12
        BEQ.W    ??FTM_CPWM_Init_25
        BCC.W    ??FTM_CPWM_Init_26
        CMP      R0,#+14
        BEQ.W    ??FTM_CPWM_Init_27
        BCC.W    ??FTM_CPWM_Init_28
        CMP      R0,#+16
        BEQ.W    ??FTM_CPWM_Init_29
        BCC.W    ??FTM_CPWM_Init_30
        CMP      R0,#+18
        BEQ.W    ??FTM_CPWM_Init_31
        BCC.W    ??FTM_CPWM_Init_32
        CMP      R0,#+20
        BEQ.W    ??FTM_CPWM_Init_33
        BCC.W    ??FTM_CPWM_Init_34
        CMP      R0,#+22
        BEQ.W    ??FTM_CPWM_Init_35
        BCC.W    ??FTM_CPWM_Init_36
        CMP      R0,#+24
        BEQ.W    ??FTM_CPWM_Init_37
        BCC.W    ??FTM_CPWM_Init_38
        CMP      R0,#+26
        BEQ.W    ??FTM_CPWM_Init_39
        BCC.W    ??FTM_CPWM_Init_40
        CMP      R0,#+28
        BEQ.W    ??FTM_CPWM_Init_41
        BCC.W    ??FTM_CPWM_Init_42
        CMP      R0,#+30
        BEQ.W    ??FTM_CPWM_Init_43
        BCC.W    ??FTM_CPWM_Init_44
        CMP      R0,#+32
        BEQ.W    ??FTM_CPWM_Init_45
        BCC.W    ??FTM_CPWM_Init_46
        CMP      R0,#+34
        BEQ.W    ??FTM_CPWM_Init_47
        BCC.W    ??FTM_CPWM_Init_48
        CMP      R0,#+36
        BEQ.W    ??FTM_CPWM_Init_49
        BCC.W    ??FTM_CPWM_Init_50
        CMP      R0,#+38
        BEQ.W    ??FTM_CPWM_Init_51
        BCC.W    ??FTM_CPWM_Init_52
        CMP      R0,#+40
        BEQ.W    ??FTM_CPWM_Init_53
        BCC.W    ??FTM_CPWM_Init_54
        CMP      R0,#+41
        BEQ.W    ??FTM_CPWM_Init_55
        B.N      ??FTM_CPWM_Init_56
//  261 	    	{
//  262 	    	case 0 :PORT_Configuer(PORTC, 1,  4);break;
??FTM_CPWM_Init_14:
        MOVS     R2,#+4
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  263 	    	case 1 :PORT_Configuer(PORTA, 3,  3);break;
??FTM_CPWM_Init_16:
        MOVS     R2,#+3
        MOVS     R1,#+3
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  264 	    	case 2 :PORT_Configuer(PORTA, 4,  3);break;
??FTM_CPWM_Init_15:
        MOVS     R2,#+3
        MOVS     R1,#+4
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  265 	    	case 3 :PORT_Configuer(PORTC, 2,  4);break;
??FTM_CPWM_Init_18:
        MOVS     R2,#+4
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  266 	    	case 4 :PORT_Configuer(PORTA, 5,  3);break;
??FTM_CPWM_Init_17:
        MOVS     R2,#+3
        MOVS     R1,#+5
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  267 	    	case 5 :PORT_Configuer(PORTC, 3,  4);break;
??FTM_CPWM_Init_20:
        MOVS     R2,#+4
        MOVS     R1,#+3
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  268 	    	case 6 :PORT_Configuer(PORTA, 6,  3);break;
??FTM_CPWM_Init_19:
        MOVS     R2,#+3
        MOVS     R1,#+6
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  269 	    	case 7 :PORT_Configuer(PORTC, 4,  4);break;
??FTM_CPWM_Init_22:
        MOVS     R2,#+4
        MOVS     R1,#+4
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  270 	    	case 8 :PORT_Configuer(PORTA, 7,  3);break;
??FTM_CPWM_Init_21:
        MOVS     R2,#+3
        MOVS     R1,#+7
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  271 	    	case 9 :PORT_Configuer(PORTD, 4,  4);break;
??FTM_CPWM_Init_24:
        MOVS     R2,#+4
        MOVS     R1,#+4
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  272 	    	case 10:PORT_Configuer(PORTD, 5,  4);break;
??FTM_CPWM_Init_23:
        MOVS     R2,#+4
        MOVS     R1,#+5
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  273 	    	case 11:PORT_Configuer(PORTA, 0,  3);break;
??FTM_CPWM_Init_26:
        MOVS     R2,#+3
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  274 	    	case 12:PORT_Configuer(PORTD, 6,  4);break;
??FTM_CPWM_Init_25:
        MOVS     R2,#+4
        MOVS     R1,#+6
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  275 	    	case 13:PORT_Configuer(PORTA, 1,  3);break;
??FTM_CPWM_Init_28:
        MOVS     R2,#+3
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  276 	    	case 14:PORT_Configuer(PORTD, 7,  4);break;
??FTM_CPWM_Init_27:
        MOVS     R2,#+4
        MOVS     R1,#+7
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  277 	    	case 15:PORT_Configuer(PORTA, 2,  3);break;		
??FTM_CPWM_Init_30:
        MOVS     R2,#+3
        MOVS     R1,#+2
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  278 	    	case 16:PORT_Configuer(PORTA, 12, 3);break;
??FTM_CPWM_Init_29:
        MOVS     R2,#+3
        MOVS     R1,#+12
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  279 	    	case 17:PORT_Configuer(PORTA, 8,  3);break;
??FTM_CPWM_Init_32:
        MOVS     R2,#+3
        MOVS     R1,#+8
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  280 	    	case 18:PORT_Configuer(PORTB, 0,  3);break;
??FTM_CPWM_Init_31:
        MOVS     R2,#+3
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  281 	    	case 19:PORT_Configuer(PORTA, 13, 3);break;
??FTM_CPWM_Init_34:
        MOVS     R2,#+3
        MOVS     R1,#+13
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  282 	    	case 20:PORT_Configuer(PORTA, 9,  3);break;
??FTM_CPWM_Init_33:
        MOVS     R2,#+3
        MOVS     R1,#+9
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  283 	    	case 21:PORT_Configuer(PORTB, 1,  3);break;
??FTM_CPWM_Init_36:
        MOVS     R2,#+3
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  284 	    	case 22:PORT_Configuer(PORTA, 10, 3);break;
??FTM_CPWM_Init_35:
        MOVS     R2,#+3
        MOVS     R1,#+10
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  285 	    	case 23:PORT_Configuer(PORTB, 18, 3);break;
??FTM_CPWM_Init_38:
        MOVS     R2,#+3
        MOVS     R1,#+18
        MOVS     R0,#+1
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  286 	    	case 24:PORT_Configuer(PORTA, 11, 3);break;
??FTM_CPWM_Init_37:
        MOVS     R2,#+3
        MOVS     R1,#+11
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  287 	    	case 25:PORT_Configuer(PORTB, 19, 3);break;
??FTM_CPWM_Init_40:
        MOVS     R2,#+3
        MOVS     R1,#+19
        MOVS     R0,#+1
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  288 	    	case 26:PORT_Configuer(PORTD, 0,  4);break;
??FTM_CPWM_Init_39:
        MOVS     R2,#+4
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  289 	    	case 27:PORT_Configuer(PORTD, 1,  4);break;
??FTM_CPWM_Init_42:
        MOVS     R2,#+4
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  290 	    	case 28:PORT_Configuer(PORTD, 2,  4);break;
??FTM_CPWM_Init_41:
        MOVS     R2,#+4
        MOVS     R1,#+2
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  291 	    	case 29:PORT_Configuer(PORTD, 3,  4);break;
??FTM_CPWM_Init_44:
        MOVS     R2,#+4
        MOVS     R1,#+3
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  292 	    	case 30:PORT_Configuer(PORTC, 8,  3);break;
??FTM_CPWM_Init_43:
        MOVS     R2,#+3
        MOVS     R1,#+8
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  293 	    	case 31:PORT_Configuer(PORTC, 9,  3);break;
??FTM_CPWM_Init_46:
        MOVS     R2,#+3
        MOVS     R1,#+9
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  294 	    	case 32:PORT_Configuer(PORTC, 10, 3);break;
??FTM_CPWM_Init_45:
        MOVS     R2,#+3
        MOVS     R1,#+10
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  295 	    	case 33:PORT_Configuer(PORTC, 11, 3);break;
??FTM_CPWM_Init_48:
        MOVS     R2,#+3
        MOVS     R1,#+11
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  296 	    	case 34:PORT_Configuer(PORTE, 5,  6);break;
??FTM_CPWM_Init_47:
        MOVS     R2,#+6
        MOVS     R1,#+5
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  297 	    	case 35:PORT_Configuer(PORTE, 6,  6);break;
??FTM_CPWM_Init_50:
        MOVS     R2,#+6
        MOVS     R1,#+6
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  298 	    	case 36:PORT_Configuer(PORTE, 7,  6);break;
??FTM_CPWM_Init_49:
        MOVS     R2,#+6
        MOVS     R1,#+7
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  299 	    	case 37:PORT_Configuer(PORTE, 8,  6);break;
??FTM_CPWM_Init_52:
        MOVS     R2,#+6
        MOVS     R1,#+8
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  300 	    	case 38:PORT_Configuer(PORTE, 9,  6);break;
??FTM_CPWM_Init_51:
        MOVS     R2,#+6
        MOVS     R1,#+9
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  301 	    	case 39:PORT_Configuer(PORTE, 10, 6);break;
??FTM_CPWM_Init_54:
        MOVS     R2,#+6
        MOVS     R1,#+10
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  302 	    	case 40:PORT_Configuer(PORTE, 11, 6);break;
??FTM_CPWM_Init_53:
        MOVS     R2,#+6
        MOVS     R1,#+11
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_CPWM_Init_56
//  303 	    	case 41:PORT_Configuer(PORTE, 12, 6);break;
??FTM_CPWM_Init_55:
        MOVS     R2,#+6
        MOVS     R1,#+12
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
//  304 	    	}
//  305 	if(Freq >= BUS_CLK/2/0xFFFF*105/100)
??FTM_CPWM_Init_56:
        CMP      R4,#+600
        BCC.N    ??FTM_CPWM_Init_57
//  306 		PS = 0;
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Init_58
//  307 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/2)
??FTM_CPWM_Init_57:
        CMP      R4,#+300
        BCC.N    ??FTM_CPWM_Init_59
//  308 		PS = 1;
        MOVS     R0,#+1
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Init_58
//  309 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/4)
??FTM_CPWM_Init_59:
        CMP      R4,#+150
        BCC.N    ??FTM_CPWM_Init_60
//  310 		PS = 2;
        MOVS     R0,#+2
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Init_58
//  311 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/8)
??FTM_CPWM_Init_60:
        CMP      R4,#+75
        BCC.N    ??FTM_CPWM_Init_61
//  312 		PS = 3;
        MOVS     R0,#+3
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Init_58
//  313 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/16)
??FTM_CPWM_Init_61:
        CMP      R4,#+37
        BCC.N    ??FTM_CPWM_Init_62
//  314 		PS = 4;
        MOVS     R0,#+4
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Init_58
//  315 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/32)
??FTM_CPWM_Init_62:
        CMP      R4,#+18
        BCC.N    ??FTM_CPWM_Init_63
//  316 		PS = 5;
        MOVS     R0,#+5
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Init_58
//  317 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/64)
??FTM_CPWM_Init_63:
        CMP      R4,#+9
        BCC.N    ??FTM_CPWM_Init_64
//  318 		PS = 6;
        MOVS     R0,#+6
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Init_58
//  319 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/128)
??FTM_CPWM_Init_64:
        CMP      R4,#+4
        BCC.N    ??FTM_CPWM_Init_58
//  320 		PS = 7;
        MOVS     R0,#+7
        MOVS     R7,R0
//  321 	/******************** 选择输出模式为中间对齐CPWM,先高后低 *******************/
//  322 	FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~FTM_CnSC_ELSA_MASK;
??FTM_CPWM_Init_58:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, R5, LSL #+2]
        ADDS     R0,R0,R6, LSL #+3
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        ADDS     R1,R1,R6, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x4
        STR      R1,[R0, #+12]
//  323 	FTM_CnSC_REG(FTMn[Ftmn], CHx) |= FTM_CnSC_ELSB_MASK;
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, R5, LSL #+2]
        ADDS     R0,R0,R6, LSL #+3
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        ADDS     R1,R1,R6, LSL #+3
        LDR      R1,[R1, #+12]
        ORRS     R1,R1,#0x8
        STR      R1,[R0, #+12]
//  324 	// MSnB:MSnA = xx;CPWMS = 1;	中间对齐PWM
//  325 	// ELSnB:ELSnA = 10     		先高后低
//  326 	// ELSnB:ELSnA = 11    	 		先低后高
//  327 	/******************** 配置时钟和分频 ********************/
//  328 	FTM_SC_REG(FTMn[Ftmn]) |= FTM_SC_CPWMS_MASK;//选择中间对齐,
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, R5, LSL #+2]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        STR      R0,[R1, #+0]
//  329 	FTM_SC_REG(FTMn[Ftmn]) |= (FTM_SC_PS(PS)|FTM_SC_CLKS(1) );          
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, R5, LSL #+2]
        LDR      R0,[R0, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ANDS     R1,R7,#0x7
        ORRS     R1,R1,#0x8
        ORRS     R0,R1,R0
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        STR      R0,[R1, #+0]
//  330 	//分频因子，分频系数 = 2^PS.   时钟选择， 0：没选择时钟，禁用； 1：bus 时钟； 2：MCGFFCLK； 3：EXTCLK（ 由SIM_SOPT4 选择输入管脚 FTM_CLKINx）
//  331 	// FTM_SC_TOIE_MASK        //溢出中断使能（注释了表示 禁止溢出中断） 
//  332 	mod = (uint16)( (((double)(BUS_CLK)/Freq) /2 / (1<<PS) +0.5) );
        MOVS     R0,R4
          CFI FunCall __aeabi_ui2d
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.W    R1,??DataTable6_1  ;; 0x4191e1a3
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        MOVS     R3,#+1073741824
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
        MOV      R10,R0
        MOV      R11,R1
        MOVS     R0,#+1
        LSLS     R0,R0,R7
          CFI FunCall __aeabi_i2d
        BL       __aeabi_i2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R10
        MOV      R1,R11
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.W    R3,??DataTable6_2  ;; 0x3fe00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2iz
        BL       __aeabi_d2iz
        MOV      R8,R0
//  333 	FTM_MOD_REG(FTMn[Ftmn]) = (mod - 1);                        //模数, EPWM的周期为 ：MOD - CNTIN + 0x0001
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R8,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        STR      R0,[R1, #+8]
//  334 	FTM_CNTIN_REG(FTMn[Ftmn]) = 0;                          //计数器初始化值。设置脉冲宽度：(CnV - CNTIN).
        MOVS     R0,#+0
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        STR      R0,[R1, #+76]
//  335 	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)((float)(mod)*Duty+0.5-1);
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, R5, LSL #+2]
        ADDS     R10,R0,R6, LSL #+3
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        VMOV     S0,R8
        VCVT.F32.U32 S0,S0
        VMUL.F32 S0,S0,S16
        VMOV     R0,S0
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable6_2  ;; 0x3fe00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR.W    R3,??DataTable6_5  ;; 0xbff00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2iz
        BL       __aeabi_d2iz
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[R10, #+16]
//  336 	FTM_CNT_REG(FTMn[Ftmn])   = 0;                          //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
        MOVS     R0,#+0
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        STR      R0,[R1, #+4]
//  337 }
        VPOP     {D8}
          CFI D8 SameValue
          CFI CFA R13+40
        POP      {R0,R4-R11,PC}   ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x400b8004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     FTMn

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0xbfe00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40038054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x400b9054
//  338 /**********************************************************************/
//  339 //频率只能改小,不能改大,可能是没配置好,因为我用了或等于|=,已解决
//  340 /* 简介:设置EPWM的频率,占空比不变
//  341  * 例程:FTM_EPWM_Set_Freq(FTM0, FTM_CH0, 5000);//5K频率,占空比不变的PWM
//  342  * 参数: 	Ftmn:	FTM0~3	
//  343  * 		CHx:	FTM_CH0
//  344  * 		Freq:	范围:(当PWM为EPWM)	BUS_CLK/0xFFFF/128*105/100~~BUS_CLK/100	
//  345  * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,精度达到1%,剩余的精度达到0.1%
//  346  * 								如果BUS_CLK=75MHz,则9~750 000.  1.2K~750K,精度达到1%,9~1.2K,精度达到0.1%
//  347  */
//  348 /*********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function FTM_EPWM_Set_Freq
        THUMB
//  349 void FTM_EPWM_Set_Freq(FTMn_e Ftmn, FTM_CHn_e CHx, uint32 Freq)
//  350 {
FTM_EPWM_Set_Freq:
        PUSH     {R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        VPUSH    {D8}
          CFI D8 Frame(CFA, -48)
          CFI CFA R13+48
        SUB      SP,SP,#+8
          CFI CFA R13+56
        MOVS     R4,R0
        MOV      R8,R1
        MOVS     R5,R2
//  351 	uint16 mod = 0,val,PS = 8;
        MOVS     R6,#+0
        MOVS     R7,#+8
//  352 	float bili = 0;
        VLDR.W   S16,??DataTable5  ;; 0x0
//  353 	do
//  354 	{
//  355 		mod = FTM_MOD_REG(FTMn[Ftmn]);
??FTM_EPWM_Set_Freq_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+8]
        MOVS     R6,R0
//  356 	}while(mod == 0);
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??FTM_EPWM_Set_Freq_0
//  357 	val = (FTM_CnV_REG(FTMn[Ftmn], CHx) + 1);
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        ADDS     R0,R0,R8, LSL #+3
        LDR      R0,[R0, #+16]
        ADDS     R0,R0,#+1
        STRH     R0,[SP, #+0]
//  358 	bili = (float)(val)/(mod + 1);
        LDRH     R0,[SP, #+0]
        VMOV     S0,R0
        VCVT.F32.U32 S0,S0
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R6,#+1
        VMOV     S1,R0
        VCVT.F32.S32 S1,S1
        VDIV.F32 S0,S0,S1
        VMOV.F32 S16,S0
//  359 	if(Freq >= BUS_CLK/0xFFFF*105/100)
        CMP      R5,#+1200
        BLS.N    ??FTM_EPWM_Set_Freq_1
//  360 		PS = 0;
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Set_Freq_2
//  361 	else if(Freq >= BUS_CLK/0xFFFF*105/100/2)
??FTM_EPWM_Set_Freq_1:
        CMP      R5,#+600
        BCC.N    ??FTM_EPWM_Set_Freq_3
//  362 		PS = 1;
        MOVS     R0,#+1
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Set_Freq_2
//  363 	else if(Freq >= BUS_CLK/0xFFFF*105/100/4)
??FTM_EPWM_Set_Freq_3:
        CMP      R5,#+300
        BCC.N    ??FTM_EPWM_Set_Freq_4
//  364 		PS = 2;
        MOVS     R0,#+2
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Set_Freq_2
//  365 	else if(Freq >= BUS_CLK/0xFFFF*105/100/8)
??FTM_EPWM_Set_Freq_4:
        CMP      R5,#+150
        BCC.N    ??FTM_EPWM_Set_Freq_5
//  366 		PS = 3;
        MOVS     R0,#+3
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Set_Freq_2
//  367 	else if(Freq >= BUS_CLK/0xFFFF*105/100/16)
??FTM_EPWM_Set_Freq_5:
        CMP      R5,#+75
        BCC.N    ??FTM_EPWM_Set_Freq_6
//  368 		PS = 4;
        MOVS     R0,#+4
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Set_Freq_2
//  369 	else if(Freq >= BUS_CLK/0xFFFF*105/100/32)
??FTM_EPWM_Set_Freq_6:
        CMP      R5,#+37
        BCC.N    ??FTM_EPWM_Set_Freq_7
//  370 		PS = 5;
        MOVS     R0,#+5
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Set_Freq_2
//  371 	else if(Freq >= BUS_CLK/0xFFFF*105/100/64)
??FTM_EPWM_Set_Freq_7:
        CMP      R5,#+18
        BCC.N    ??FTM_EPWM_Set_Freq_8
//  372 		PS = 6;
        MOVS     R0,#+6
        MOVS     R7,R0
        B.N      ??FTM_EPWM_Set_Freq_2
//  373 	else if(Freq >= BUS_CLK/0xFFFF*105/100/128)
??FTM_EPWM_Set_Freq_8:
        CMP      R5,#+9
        BCC.N    ??FTM_EPWM_Set_Freq_2
//  374 		PS = 7;
        MOVS     R0,#+7
        MOVS     R7,R0
//  375     	FTM_SC_REG(FTMn[Ftmn]) &= ~FTM_SC_PS_MASK;
??FTM_EPWM_Set_Freq_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+3
        LSLS     R0,R0,#+3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//  376 	FTM_SC_REG(FTMn[Ftmn]) |= FTM_SC_PS(PS);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ANDS     R1,R7,#0x7
        ORRS     R0,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//  377 	mod = (uint16)( (((double)(BUS_CLK)/Freq) / (1<<PS) +0.5) );
        MOVS     R0,R5
          CFI FunCall __aeabi_ui2d
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x4191e1a3
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
        MOV      R10,R0
        MOV      R11,R1
        MOVS     R0,#+1
        LSLS     R0,R0,R7
          CFI FunCall __aeabi_i2d
        BL       __aeabi_i2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R10
        MOV      R1,R11
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.N    R3,??DataTable6_2  ;; 0x3fe00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2iz
        BL       __aeabi_d2iz
        MOVS     R6,R0
//  378 	FTM_MOD_REG(FTMn[Ftmn]) = (mod - 1);                        //模数, EPWM的周期为 ：MOD - CNTIN + 0x0001
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        SUBS     R0,R6,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+8]
//  379 	FTM_CNTIN_REG(FTMn[Ftmn]) = 0;                          //计数器初始化值。设置脉冲宽度：(CnV - CNTIN).
        MOVS     R0,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+76]
//  380 	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)(mod*bili+0.5-1);
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        ADDS     R9,R0,R8, LSL #+3
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        VMOV     S0,R6
        VCVT.F32.U32 S0,S0
        VMUL.F32 S0,S0,S16
        VMOV     R0,S0
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable6_2  ;; 0x3fe00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR.N    R3,??DataTable6_5  ;; 0xbff00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2iz
        BL       __aeabi_d2iz
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[R9, #+16]
//  381 	FTM_CNT_REG(FTMn[Ftmn])   = 0;                          //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
        MOVS     R0,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+4]
//  382 }	
        ADD      SP,SP,#+8
          CFI CFA R13+48
        VPOP     {D8}
          CFI D8 SameValue
          CFI CFA R13+40
        POP      {R0,R4-R11,PC}   ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x0
//  383 /**********************************************************************/
//  384 //频率只能改小,不能改大,可能是没配置好,因为我用了或等于|=,已解决
//  385 /* 简介:设置CPWM的频率,占空比不变
//  386  * 例程:FTM_CPWM_Set_Freq(FTM0, FTM_CH0, 5000);//5K频率,占空比不变的PWM
//  387  * 参数: 	Ftmn:	FTM0~2	
//  388  * 		CHx:	FTM_CH0
//  389  * 		Freq:	范围:(当PWM为CPWM)	BUS_CLK/2/0xFFFF/128*105/100~~BUS_CLK/2/100	
//  390  * 								BUS_CLK/0xFFFF*105/100~BUS_CLK/100,,精度达到1%,剩余的精度达到0.1%
//  391  * 								如果BUS_CLK=75MHz,则5~375 000.  0.6K~375K,精度达到1%,9~0.6K,精度达到0.1%
//  392  */
//  393 /*********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function FTM_CPWM_Set_Freq
        THUMB
//  394 void FTM_CPWM_Set_Freq(FTMn_e Ftmn, FTM_CHn_e CHx, uint32 Freq)
//  395 {
FTM_CPWM_Set_Freq:
        PUSH     {R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        VPUSH    {D8}
          CFI D8 Frame(CFA, -48)
          CFI CFA R13+48
        SUB      SP,SP,#+8
          CFI CFA R13+56
        MOVS     R4,R0
        MOV      R8,R1
        MOVS     R5,R2
//  396 	uint16 mod = 0,val,PS = 8;
        MOVS     R6,#+0
        MOVS     R7,#+8
//  397 	float bili = 0;
        VLDR.W   S16,??DataTable6  ;; 0x0
//  398 	do
//  399 	{
//  400 		mod = FTM_MOD_REG(FTMn[Ftmn]);
??FTM_CPWM_Set_Freq_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+8]
        MOVS     R6,R0
//  401 	}while(mod == 0);
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??FTM_CPWM_Set_Freq_0
//  402 	val = (FTM_CnV_REG(FTMn[Ftmn], CHx) + 1);
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        ADDS     R0,R0,R8, LSL #+3
        LDR      R0,[R0, #+16]
        ADDS     R0,R0,#+1
        STRH     R0,[SP, #+0]
//  403 	bili = (float)(val)/(mod + 1);
        LDRH     R0,[SP, #+0]
        VMOV     S0,R0
        VCVT.F32.U32 S0,S0
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R6,#+1
        VMOV     S1,R0
        VCVT.F32.S32 S1,S1
        VDIV.F32 S0,S0,S1
        VMOV.F32 S16,S0
//  404 	if(Freq >= BUS_CLK/2/0xFFFF*105/100)
        CMP      R5,#+600
        BCC.N    ??FTM_CPWM_Set_Freq_1
//  405 		PS = 0;
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Set_Freq_2
//  406 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/2)
??FTM_CPWM_Set_Freq_1:
        CMP      R5,#+300
        BCC.N    ??FTM_CPWM_Set_Freq_3
//  407 		PS = 1;
        MOVS     R0,#+1
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Set_Freq_2
//  408 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/4)
??FTM_CPWM_Set_Freq_3:
        CMP      R5,#+150
        BCC.N    ??FTM_CPWM_Set_Freq_4
//  409 		PS = 2;
        MOVS     R0,#+2
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Set_Freq_2
//  410 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/8)
??FTM_CPWM_Set_Freq_4:
        CMP      R5,#+75
        BCC.N    ??FTM_CPWM_Set_Freq_5
//  411 		PS = 3;
        MOVS     R0,#+3
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Set_Freq_2
//  412 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/16)
??FTM_CPWM_Set_Freq_5:
        CMP      R5,#+37
        BCC.N    ??FTM_CPWM_Set_Freq_6
//  413 		PS = 4;
        MOVS     R0,#+4
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Set_Freq_2
//  414 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/32)
??FTM_CPWM_Set_Freq_6:
        CMP      R5,#+18
        BCC.N    ??FTM_CPWM_Set_Freq_7
//  415 		PS = 5;
        MOVS     R0,#+5
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Set_Freq_2
//  416 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/64)
??FTM_CPWM_Set_Freq_7:
        CMP      R5,#+9
        BCC.N    ??FTM_CPWM_Set_Freq_8
//  417 		PS = 6;
        MOVS     R0,#+6
        MOVS     R7,R0
        B.N      ??FTM_CPWM_Set_Freq_2
//  418 	else if(Freq >= BUS_CLK/2/0xFFFF*105/100/128)
??FTM_CPWM_Set_Freq_8:
        CMP      R5,#+4
        BCC.N    ??FTM_CPWM_Set_Freq_2
//  419 		PS = 7;
        MOVS     R0,#+7
        MOVS     R7,R0
//  420     	FTM_SC_REG(FTMn[Ftmn]) &= ~FTM_SC_PS_MASK;
??FTM_CPWM_Set_Freq_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+3
        LSLS     R0,R0,#+3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//  421 	FTM_SC_REG(FTMn[Ftmn]) |= FTM_SC_PS(PS);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ANDS     R1,R7,#0x7
        ORRS     R0,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//  422 	mod = (uint16)( (((double)(BUS_CLK)/Freq) / 2/ (1<<PS) +0.5) );
        MOVS     R0,R5
          CFI FunCall __aeabi_ui2d
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x4191e1a3
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        MOVS     R3,#+1073741824
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
        MOV      R10,R0
        MOV      R11,R1
        MOVS     R0,#+1
        LSLS     R0,R0,R7
          CFI FunCall __aeabi_i2d
        BL       __aeabi_i2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R10
        MOV      R1,R11
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.N    R3,??DataTable6_2  ;; 0x3fe00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2iz
        BL       __aeabi_d2iz
        MOVS     R6,R0
//  423 	FTM_MOD_REG(FTMn[Ftmn]) = (mod - 1);                        //模数, EPWM的周期为 ：MOD - CNTIN + 0x0001
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        SUBS     R0,R6,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+8]
//  424 	FTM_CNTIN_REG(FTMn[Ftmn]) = 0;                          //计数器初始化值。设置脉冲宽度：(CnV - CNTIN).
        MOVS     R0,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+76]
//  425 	FTM_CnV_REG(FTMn[Ftmn], CHx) = (uint16)(mod*bili+0.5-1);
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        ADDS     R9,R0,R8, LSL #+3
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        VMOV     S0,R6
        VCVT.F32.U32 S0,S0
        VMUL.F32 S0,S0,S16
        VMOV     R0,S0
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable6_2  ;; 0x3fe00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR.N    R3,??DataTable6_5  ;; 0xbff00000
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2iz
        BL       __aeabi_d2iz
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[R9, #+16]
//  426 	FTM_CNT_REG(FTMn[Ftmn])   = 0;                          //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
        MOVS     R0,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+4]
//  427 }	
        ADD      SP,SP,#+8
          CFI CFA R13+48
        VPOP     {D8}
          CFI D8 SameValue
          CFI CFA R13+40
        POP      {R0,R4-R11,PC}   ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x4191e1a3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x3fe00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x3fb99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0xbff00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     0x40039054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     0x400b8054
//  428 
//  429 /***************************** Input Capture ***********************************/
//  430 /* 注意:能测到的最大输入频率少于BUS_CLK/4,当捕捉到时,计数器的值写入CnV.不能用来测低频,测低频定时1s
//  431  * 简介:初始化输入捕捉
//  432  * 例程:	FTM_IC_Init(FTM0_CH0_PTC1, FTM_Rising);
//  433  * 参数: 	Ftmn_CHx_PTnx:	放在FTM.h文件
//  434  * 		cfg:			FTM_Rising,FTM_Falling,FTM_Rising_or_Falling
//  435  */
//  436 /*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function FTM_IC_Init
        THUMB
//  437 void FTM_IC_Init(uint16 Ftmn_CHx_PTnx, FTM_Input_cfg cfg)
//  438 {
FTM_IC_Init:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  439 
//  440         uint32 Ftmn,CHx;
//  441         switch(Ftmn_CHx_PTnx & 0xF000) //写保护禁止 
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ANDS     R0,R4,#0xF000
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??FTM_IC_Init_0
        CMP      R0,#+4096
        BEQ.N    ??FTM_IC_Init_1
        CMP      R0,#+8192
        BEQ.N    ??FTM_IC_Init_2
        CMP      R0,#+12288
        BEQ.N    ??FTM_IC_Init_3
        B.N      ??FTM_IC_Init_4
//  442             	{
//  443             		case 0x0000:Ftmn = 0;SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;FTM0_MODE |= FTM_MODE_WPDIS_MASK;break;
??FTM_IC_Init_0:
        MOVS     R0,#+0
        MOVS     R6,R0
        LDR.W    R0,??DataTable13_1  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable13_1  ;; 0x4004803c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable13_2  ;; 0x40038054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable13_2  ;; 0x40038054
        STR      R0,[R1, #+0]
        B.N      ??FTM_IC_Init_4
//  444             		case 0x1000:Ftmn = 1;SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;FTM1_MODE |= FTM_MODE_WPDIS_MASK;break;
??FTM_IC_Init_1:
        MOVS     R0,#+1
        MOVS     R6,R0
        LDR.W    R0,??DataTable13_1  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable13_1  ;; 0x4004803c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable13_3  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable13_3  ;; 0x40039054
        STR      R0,[R1, #+0]
        B.N      ??FTM_IC_Init_4
//  445             		case 0x2000:Ftmn = 2;SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;FTM2_MODE |= FTM_MODE_WPDIS_MASK;break;
??FTM_IC_Init_2:
        MOVS     R0,#+2
        MOVS     R6,R0
        LDR.W    R0,??DataTable13_4  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable13_4  ;; 0x40048030
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable13_5  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable13_5  ;; 0x400b8054
        STR      R0,[R1, #+0]
        B.N      ??FTM_IC_Init_4
//  446             		case 0x3000:Ftmn = 3;SIM_SCGC3 |= SIM_SCGC3_FTM3_MASK;FTM3_MODE |= FTM_MODE_WPDIS_MASK;break;
??FTM_IC_Init_3:
        MOVS     R0,#+3
        MOVS     R6,R0
        LDR.W    R0,??DataTable13_4  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable13_4  ;; 0x40048030
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable13_6  ;; 0x400b9054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable13_6  ;; 0x400b9054
        STR      R0,[R1, #+0]
//  447             	}
//  448             	switch(Ftmn_CHx_PTnx & 0x0F00)
??FTM_IC_Init_4:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ANDS     R0,R4,#0xF00
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??FTM_IC_Init_5
        CMP      R0,#+256
        BEQ.N    ??FTM_IC_Init_6
        CMP      R0,#+512
        BEQ.N    ??FTM_IC_Init_7
        CMP      R0,#+768
        BEQ.N    ??FTM_IC_Init_8
        CMP      R0,#+1024
        BEQ.N    ??FTM_IC_Init_9
        CMP      R0,#+1280
        BEQ.N    ??FTM_IC_Init_10
        CMP      R0,#+1536
        BEQ.N    ??FTM_IC_Init_11
        CMP      R0,#+1792
        BEQ.N    ??FTM_IC_Init_12
        B.N      ??FTM_IC_Init_13
//  449             	{
//  450             		case 0x0000:CHx = 0;break;
??FTM_IC_Init_5:
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??FTM_IC_Init_13
//  451             		case 0x0100:CHx = 1;break;
??FTM_IC_Init_6:
        MOVS     R0,#+1
        MOVS     R7,R0
        B.N      ??FTM_IC_Init_13
//  452             		case 0x0200:CHx = 2;break;
??FTM_IC_Init_7:
        MOVS     R0,#+2
        MOVS     R7,R0
        B.N      ??FTM_IC_Init_13
//  453             		case 0x0300:CHx = 3;break;
??FTM_IC_Init_8:
        MOVS     R0,#+3
        MOVS     R7,R0
        B.N      ??FTM_IC_Init_13
//  454             		case 0x0400:CHx = 4;break;
??FTM_IC_Init_9:
        MOVS     R0,#+4
        MOVS     R7,R0
        B.N      ??FTM_IC_Init_13
//  455             		case 0x0500:CHx = 5;break;
??FTM_IC_Init_10:
        MOVS     R0,#+5
        MOVS     R7,R0
        B.N      ??FTM_IC_Init_13
//  456             		case 0x0600:CHx = 6;break;
??FTM_IC_Init_11:
        MOVS     R0,#+6
        MOVS     R7,R0
        B.N      ??FTM_IC_Init_13
//  457             		case 0x0700:CHx = 7;break;
??FTM_IC_Init_12:
        MOVS     R0,#+7
        MOVS     R7,R0
//  458             	}	
//  459             	switch(Ftmn_CHx_PTnx & 0x00FF)
??FTM_IC_Init_13:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTB     R0,R4            ;; ZeroExt  R0,R4,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??FTM_IC_Init_14
        CMP      R0,#+2
        BEQ.N    ??FTM_IC_Init_15
        BCC.N    ??FTM_IC_Init_16
        CMP      R0,#+4
        BEQ.N    ??FTM_IC_Init_17
        BCC.N    ??FTM_IC_Init_18
        CMP      R0,#+6
        BEQ.N    ??FTM_IC_Init_19
        BCC.N    ??FTM_IC_Init_20
        CMP      R0,#+8
        BEQ.W    ??FTM_IC_Init_21
        BCC.N    ??FTM_IC_Init_22
        CMP      R0,#+10
        BEQ.W    ??FTM_IC_Init_23
        BCC.W    ??FTM_IC_Init_24
        CMP      R0,#+12
        BEQ.W    ??FTM_IC_Init_25
        BCC.W    ??FTM_IC_Init_26
        CMP      R0,#+14
        BEQ.W    ??FTM_IC_Init_27
        BCC.W    ??FTM_IC_Init_28
        CMP      R0,#+16
        BEQ.W    ??FTM_IC_Init_29
        BCC.W    ??FTM_IC_Init_30
        CMP      R0,#+18
        BEQ.W    ??FTM_IC_Init_31
        BCC.W    ??FTM_IC_Init_32
        CMP      R0,#+20
        BEQ.W    ??FTM_IC_Init_33
        BCC.W    ??FTM_IC_Init_34
        CMP      R0,#+22
        BEQ.W    ??FTM_IC_Init_35
        BCC.W    ??FTM_IC_Init_36
        CMP      R0,#+24
        BEQ.W    ??FTM_IC_Init_37
        BCC.W    ??FTM_IC_Init_38
        CMP      R0,#+26
        BEQ.W    ??FTM_IC_Init_39
        BCC.W    ??FTM_IC_Init_40
        CMP      R0,#+28
        BEQ.W    ??FTM_IC_Init_41
        BCC.W    ??FTM_IC_Init_42
        CMP      R0,#+30
        BEQ.W    ??FTM_IC_Init_43
        BCC.W    ??FTM_IC_Init_44
        CMP      R0,#+32
        BEQ.W    ??FTM_IC_Init_45
        BCC.W    ??FTM_IC_Init_46
        CMP      R0,#+34
        BEQ.W    ??FTM_IC_Init_47
        BCC.W    ??FTM_IC_Init_48
        CMP      R0,#+36
        BEQ.W    ??FTM_IC_Init_49
        BCC.W    ??FTM_IC_Init_50
        CMP      R0,#+38
        BEQ.W    ??FTM_IC_Init_51
        BCC.W    ??FTM_IC_Init_52
        CMP      R0,#+40
        BEQ.W    ??FTM_IC_Init_53
        BCC.W    ??FTM_IC_Init_54
        CMP      R0,#+41
        BEQ.W    ??FTM_IC_Init_55
        B.N      ??FTM_IC_Init_56
//  460             	{
//  461             	case 0 :PORT_Configuer(PORTC, 1,  4);break;
??FTM_IC_Init_14:
        MOVS     R2,#+4
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  462             	case 1 :PORT_Configuer(PORTA, 3,  3);break;
??FTM_IC_Init_16:
        MOVS     R2,#+3
        MOVS     R1,#+3
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  463             	case 2 :PORT_Configuer(PORTA, 4,  3);break;
??FTM_IC_Init_15:
        MOVS     R2,#+3
        MOVS     R1,#+4
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  464             	case 3 :PORT_Configuer(PORTC, 2,  4);break;
??FTM_IC_Init_18:
        MOVS     R2,#+4
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  465             	case 4 :PORT_Configuer(PORTA, 5,  3);break;
??FTM_IC_Init_17:
        MOVS     R2,#+3
        MOVS     R1,#+5
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  466             	case 5 :PORT_Configuer(PORTC, 3,  4);break;
??FTM_IC_Init_20:
        MOVS     R2,#+4
        MOVS     R1,#+3
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  467             	case 6 :PORT_Configuer(PORTA, 6,  3);break;
??FTM_IC_Init_19:
        MOVS     R2,#+3
        MOVS     R1,#+6
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  468             	case 7 :PORT_Configuer(PORTC, 4,  4);break;
??FTM_IC_Init_22:
        MOVS     R2,#+4
        MOVS     R1,#+4
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  469             	case 8 :PORT_Configuer(PORTA, 7,  3);break;
??FTM_IC_Init_21:
        MOVS     R2,#+3
        MOVS     R1,#+7
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  470             	case 9 :PORT_Configuer(PORTD, 4,  4);break;
??FTM_IC_Init_24:
        MOVS     R2,#+4
        MOVS     R1,#+4
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  471             	case 10:PORT_Configuer(PORTD, 5,  4);break;
??FTM_IC_Init_23:
        MOVS     R2,#+4
        MOVS     R1,#+5
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  472             	case 11:PORT_Configuer(PORTA, 0,  3);break;
??FTM_IC_Init_26:
        MOVS     R2,#+3
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  473             	case 12:PORT_Configuer(PORTD, 6,  4);break;
??FTM_IC_Init_25:
        MOVS     R2,#+4
        MOVS     R1,#+6
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  474             	case 13:PORT_Configuer(PORTA, 1,  3);break;
??FTM_IC_Init_28:
        MOVS     R2,#+3
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  475             	case 14:PORT_Configuer(PORTD, 7,  4);break;
??FTM_IC_Init_27:
        MOVS     R2,#+4
        MOVS     R1,#+7
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  476             	case 15:PORT_Configuer(PORTA, 2,  3);break;		
??FTM_IC_Init_30:
        MOVS     R2,#+3
        MOVS     R1,#+2
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  477             	case 16:PORT_Configuer(PORTA, 12, 3);break;
??FTM_IC_Init_29:
        MOVS     R2,#+3
        MOVS     R1,#+12
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  478             	case 17:PORT_Configuer(PORTA, 8,  3);break;
??FTM_IC_Init_32:
        MOVS     R2,#+3
        MOVS     R1,#+8
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  479             	case 18:PORT_Configuer(PORTB, 0,  3);break;
??FTM_IC_Init_31:
        MOVS     R2,#+3
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  480             	case 19:PORT_Configuer(PORTA, 13, 3);break;
??FTM_IC_Init_34:
        MOVS     R2,#+3
        MOVS     R1,#+13
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  481             	case 20:PORT_Configuer(PORTA, 9,  3);break;
??FTM_IC_Init_33:
        MOVS     R2,#+3
        MOVS     R1,#+9
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  482             	case 21:PORT_Configuer(PORTB, 1,  3);break;
??FTM_IC_Init_36:
        MOVS     R2,#+3
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  483             	case 22:PORT_Configuer(PORTA, 10, 3);break;
??FTM_IC_Init_35:
        MOVS     R2,#+3
        MOVS     R1,#+10
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  484             	case 23:PORT_Configuer(PORTB, 18, 3);break;
??FTM_IC_Init_38:
        MOVS     R2,#+3
        MOVS     R1,#+18
        MOVS     R0,#+1
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  485             	case 24:PORT_Configuer(PORTA, 11, 3);break;
??FTM_IC_Init_37:
        MOVS     R2,#+3
        MOVS     R1,#+11
        MOVS     R0,#+0
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  486             	case 25:PORT_Configuer(PORTB, 19, 3);break;
??FTM_IC_Init_40:
        MOVS     R2,#+3
        MOVS     R1,#+19
        MOVS     R0,#+1
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  487             	case 26:PORT_Configuer(PORTD, 0,  4);break;
??FTM_IC_Init_39:
        MOVS     R2,#+4
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  488             	case 27:PORT_Configuer(PORTD, 1,  4);break;
??FTM_IC_Init_42:
        MOVS     R2,#+4
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  489             	case 28:PORT_Configuer(PORTD, 2,  4);break;
??FTM_IC_Init_41:
        MOVS     R2,#+4
        MOVS     R1,#+2
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  490             	case 29:PORT_Configuer(PORTD, 3,  4);break;
??FTM_IC_Init_44:
        MOVS     R2,#+4
        MOVS     R1,#+3
        MOVS     R0,#+3
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  491             	case 30:PORT_Configuer(PORTC, 8,  3);break;
??FTM_IC_Init_43:
        MOVS     R2,#+3
        MOVS     R1,#+8
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  492             	case 31:PORT_Configuer(PORTC, 9,  3);break;
??FTM_IC_Init_46:
        MOVS     R2,#+3
        MOVS     R1,#+9
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  493             	case 32:PORT_Configuer(PORTC, 10, 3);break;
??FTM_IC_Init_45:
        MOVS     R2,#+3
        MOVS     R1,#+10
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  494             	case 33:PORT_Configuer(PORTC, 11, 3);break;
??FTM_IC_Init_48:
        MOVS     R2,#+3
        MOVS     R1,#+11
        MOVS     R0,#+2
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  495             	case 34:PORT_Configuer(PORTE, 5,  6);break;
??FTM_IC_Init_47:
        MOVS     R2,#+6
        MOVS     R1,#+5
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  496             	case 35:PORT_Configuer(PORTE, 6,  6);break;
??FTM_IC_Init_50:
        MOVS     R2,#+6
        MOVS     R1,#+6
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  497             	case 36:PORT_Configuer(PORTE, 7,  6);break;
??FTM_IC_Init_49:
        MOVS     R2,#+6
        MOVS     R1,#+7
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  498             	case 37:PORT_Configuer(PORTE, 8,  6);break;
??FTM_IC_Init_52:
        MOVS     R2,#+6
        MOVS     R1,#+8
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  499             	case 38:PORT_Configuer(PORTE, 9,  6);break;
??FTM_IC_Init_51:
        MOVS     R2,#+6
        MOVS     R1,#+9
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  500             	case 39:PORT_Configuer(PORTE, 10, 6);break;
??FTM_IC_Init_54:
        MOVS     R2,#+6
        MOVS     R1,#+10
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  501             	case 40:PORT_Configuer(PORTE, 11, 6);break;
??FTM_IC_Init_53:
        MOVS     R2,#+6
        MOVS     R1,#+11
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
        B.N      ??FTM_IC_Init_56
//  502             	case 41:PORT_Configuer(PORTE, 12, 6);break;
??FTM_IC_Init_55:
        MOVS     R2,#+6
        MOVS     R1,#+12
        MOVS     R0,#+4
          CFI FunCall PORT_Configuer
        BL       PORT_Configuer
//  503             	}
//  504 	/******************* 设置为输入捕捉功能 *******************/
//  505     switch(cfg)
??FTM_IC_Init_56:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??FTM_IC_Init_57
        CMP      R5,#+2
        BEQ.N    ??FTM_IC_Init_58
        BCC.N    ??FTM_IC_Init_59
        B.N      ??FTM_IC_Init_60
//  506     {
//  507         //输入捕捉模式下：DECAPEN = 0 ， DECAPEN = 0 ，CPWMS = 0， MSnB:MSnA = 0
//  508 
//  509         // ELSnB:ELSnA         1          10          11
//  510         // 配置             上升沿      下降沿      跳变沿
//  511 
//  512     case FTM_Rising:    //上升沿触发
//  513         FTM_CnSC_REG(FTMn[Ftmn], CHx) |=  ( FTM_CnSC_ELSA_MASK  );                   //置1
??FTM_IC_Init_57:
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, R6, LSL #+2]
        ADDS     R0,R0,R7, LSL #+3
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        ADDS     R1,R1,R7, LSL #+3
        LDR      R1,[R1, #+12]
        ORRS     R1,R1,#0x4
        STR      R1,[R0, #+12]
//  514         FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~( FTM_CnSC_ELSB_MASK  | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, R6, LSL #+2]
        ADDS     R0,R0,R7, LSL #+3
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        ADDS     R1,R1,R7, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x38
        STR      R1,[R0, #+12]
//  515         break;
        B.N      ??FTM_IC_Init_60
//  516 
//  517     case FTM_Falling:   //下降沿触发
//  518         FTM_CnSC_REG(FTMn[Ftmn], CHx) |= (FTM_CnSC_ELSB_MASK   );                    //置1
??FTM_IC_Init_59:
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, R6, LSL #+2]
        ADDS     R0,R0,R7, LSL #+3
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        ADDS     R1,R1,R7, LSL #+3
        LDR      R1,[R1, #+12]
        ORRS     R1,R1,#0x8
        STR      R1,[R0, #+12]
//  519         FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~( FTM_CnSC_ELSA_MASK | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, R6, LSL #+2]
        ADDS     R0,R0,R7, LSL #+3
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        ADDS     R1,R1,R7, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x34
        STR      R1,[R0, #+12]
//  520         break;
        B.N      ??FTM_IC_Init_60
//  521 
//  522     case FTM_Rising_or_Falling: //上升沿、下降沿都触发
//  523         FTM_CnSC_REG(FTMn[Ftmn], CHx) |=  ( FTM_CnSC_ELSB_MASK | FTM_CnSC_ELSA_MASK   ); //置1
??FTM_IC_Init_58:
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, R6, LSL #+2]
        ADDS     R0,R0,R7, LSL #+3
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        ADDS     R1,R1,R7, LSL #+3
        LDR      R1,[R1, #+12]
        ORRS     R1,R1,#0xC
        STR      R1,[R0, #+12]
//  524         FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~( FTM_CnSC_MSB_MASK  | FTM_CnSC_MSA_MASK); //清0
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, R6, LSL #+2]
        ADDS     R0,R0,R7, LSL #+3
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        ADDS     R1,R1,R7, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x30
        STR      R1,[R0, #+12]
//  525         break;
//  526     }
//  527     FTM_MOD_REG(FTMn[Ftmn]) = 0XFFFF; 
??FTM_IC_Init_60:
        MOVW     R0,#+65535
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        STR      R0,[R1, #+8]
//  528     FTM_SC_REG(FTMn[Ftmn]) = FTM_SC_CLKS(0x1);       //选择 bus 时钟
        MOVS     R0,#+8
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        STR      R0,[R1, #+0]
//  529     FTM_COMBINE_REG(FTMn[Ftmn]) = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        STR      R0,[R1, #+100]
//  530     FTM_MODE_REG(FTMn[Ftmn])    |= FTM_MODE_FTMEN_MASK;    //使能FTM
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, R6, LSL #+2]
        LDR      R0,[R0, #+84]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        STR      R0,[R1, #+84]
//  531     FTM_CNTIN_REG(FTMn[Ftmn])   = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        STR      R0,[R1, #+76]
//  532     FTM_MOD_REG(FTMn[Ftmn]) = 0X0; 
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        STR      R0,[R1, #+8]
//  533     FTM_CNT_REG(FTMn[Ftmn])   = 0;//计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        STR      R0,[R1, #+4]
//  534     FTM_STATUS_REG(FTMn[Ftmn])  = 0x00;               //清中断标志位
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R6, LSL #+2]
        STR      R0,[R1, #+80]
//  535 }
        POP      {R0,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock8
//  536 /***************************** 计数器溢出中断使能  ***********************************/
//  537 /* 简介:	PWM模式时,当计数器的值=mod,产生溢出中断.
//  538  * 例程:	FTM_TimeOut_Int_Enable(FTM0, FTM_CH0);
//  539  * 参数: 	Ftmn:	FTM0~3
//  540  * 		CHx:	FTM_CH0~7		
//  541  */
//  542 /*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function FTM_TimeOut_Int_Enable
        THUMB
//  543 void FTM_TimeOut_Int_Enable(FTMn_e Ftmn, FTM_CHn_e CHx)
//  544 {
FTM_TimeOut_Int_Enable:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  545     FTM_SC_REG(FTMn[Ftmn]) |= FTM_SC_TOIE_MASK;  	
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//  546     Enable_IRQ(78 + Ftmn);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+78
          CFI FunCall Enable_IRQ
        BL       Enable_IRQ
//  547 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function FTM_TimeOut_Int_Disable
        THUMB
//  548 void FTM_TimeOut_Int_Disable(FTMn_e Ftmn, FTM_CHn_e CHx)
//  549 {
FTM_TimeOut_Int_Disable:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  550     FTM_SC_REG(FTMn[Ftmn]) |= FTM_SC_TOIE_MASK;  	
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//  551     Enable_IRQ(78 + Ftmn);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+78
          CFI FunCall Enable_IRQ
        BL       Enable_IRQ
//  552 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock10
//  553 /***************************** 通道事件中断使能  ***********************************/
//  554 /* 简介:	PWM模式时,当计数器的值=CnL,产生通道中断.当IC模式,触发则产生通道中断
//  555  * 例程:	FTM_CH_INT_Enable(FTM0, FTM_CH0);
//  556  * 参数: 	Ftmn:	FTM0~3
//  557  * 		CHx:	FTM_CH0~7		
//  558  */
//  559 /*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function FTM_Ch_Int_Enable
        THUMB
//  560 void FTM_Ch_Int_Enable(FTMn_e Ftmn, FTM_CHn_e CHx)
//  561 {
FTM_Ch_Int_Enable:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  562 	FTM_CnSC_REG(FTMn[Ftmn], CHx) |= FTM_CnSC_CHIE_MASK;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        ADDS     R0,R0,R5, LSL #+3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        ADDS     R1,R1,R5, LSL #+3
        LDR      R1,[R1, #+12]
        ORRS     R1,R1,#0x40
        STR      R1,[R0, #+12]
//  563 	Enable_IRQ(78 + Ftmn);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+78
          CFI FunCall Enable_IRQ
        BL       Enable_IRQ
//  564 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function FTM_Ch_Int_Dis
        THUMB
//  565 void FTM_Ch_Int_Dis(FTMn_e Ftmn, FTM_CHn_e CHx)
//  566 {
FTM_Ch_Int_Dis:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  567 	FTM_CnSC_REG(FTMn[Ftmn], CHx) &= ~FTM_CnSC_CHIE_MASK;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable13
        LDR      R0,[R0, R4, LSL #+2]
        ADDS     R0,R0,R5, LSL #+3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable13
        LDR      R1,[R1, R4, LSL #+2]
        ADDS     R1,R1,R5, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x40
        STR      R1,[R0, #+12]
//  568 	Disable_IRQ(78 + Ftmn);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+78
          CFI FunCall Disable_IRQ
        BL       Disable_IRQ
//  569 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock12
//  570 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function FTM_Clear_TimeOut
          CFI NoCalls
        THUMB
//  571 void FTM_Clear_TimeOut(uint8 Ftmn)
//  572 {
//  573 	switch(Ftmn)
FTM_Clear_TimeOut:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??FTM_Clear_TimeOut_0
        CMP      R0,#+2
        BEQ.N    ??FTM_Clear_TimeOut_1
        BCC.N    ??FTM_Clear_TimeOut_2
        CMP      R0,#+3
        BEQ.N    ??FTM_Clear_TimeOut_3
        B.N      ??FTM_Clear_TimeOut_4
//  574 	{
//  575 		case FTM0:FTM0_SC &= ~FTM_SC_TOF_MASK;break;//清除第0个模块FTM0溢出中断标志位
??FTM_Clear_TimeOut_0:
        LDR.N    R1,??DataTable13_7  ;; 0x40038000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x80
        LDR.N    R2,??DataTable13_7  ;; 0x40038000
        STR      R1,[R2, #+0]
        B.N      ??FTM_Clear_TimeOut_4
//  576 		case FTM1:FTM1_SC &= ~FTM_SC_TOF_MASK;break;
??FTM_Clear_TimeOut_2:
        LDR.N    R1,??DataTable13_8  ;; 0x40039000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x80
        LDR.N    R2,??DataTable13_8  ;; 0x40039000
        STR      R1,[R2, #+0]
        B.N      ??FTM_Clear_TimeOut_4
//  577 		case FTM2:FTM2_SC &= ~FTM_SC_TOF_MASK;break;
??FTM_Clear_TimeOut_1:
        LDR.N    R1,??DataTable13_9  ;; 0x400b8000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x80
        LDR.N    R2,??DataTable13_9  ;; 0x400b8000
        STR      R1,[R2, #+0]
        B.N      ??FTM_Clear_TimeOut_4
//  578 		case FTM3:FTM3_SC &= ~FTM_SC_TOF_MASK;break;
??FTM_Clear_TimeOut_3:
        LDR.N    R1,??DataTable13_10  ;; 0x400b9000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x80
        LDR.N    R2,??DataTable13_10  ;; 0x400b9000
        STR      R1,[R2, #+0]
//  579 	}
//  580 }
??FTM_Clear_TimeOut_4:
        BX       LR               ;; return
          CFI EndBlock cfiBlock13

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function FTM_Clear_Channal_Event
          CFI NoCalls
        THUMB
//  581 void FTM_Clear_Channal_Event(uint8 Ftmn, uint8 CHx)
//  582 {
//  583 	switch(Ftmn)
FTM_Clear_Channal_Event:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??FTM_Clear_Channal_Event_0
        CMP      R0,#+2
        BEQ.N    ??FTM_Clear_Channal_Event_1
        BCC.N    ??FTM_Clear_Channal_Event_2
        CMP      R0,#+3
        BEQ.N    ??FTM_Clear_Channal_Event_3
        B.N      ??FTM_Clear_Channal_Event_4
//  584 	{
//  585 		case FTM0:FTM0_CnSC(CHx) &= ~FTM_CnSC_CHF_MASK;break; //清第0个模块FTM0的第0个通道中断标志位
??FTM_Clear_Channal_Event_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R2,??DataTable13_11  ;; 0x4003800c
        LDR      R2,[R2, R1, LSL #+3]
        BICS     R2,R2,#0x80
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R3,??DataTable13_11  ;; 0x4003800c
        STR      R2,[R3, R1, LSL #+3]
        B.N      ??FTM_Clear_Channal_Event_4
//  586 		case FTM1:FTM1_CnSC(CHx) &= ~FTM_CnSC_CHF_MASK;break;
??FTM_Clear_Channal_Event_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R2,??DataTable13_12  ;; 0x4003900c
        LDR      R2,[R2, R1, LSL #+3]
        BICS     R2,R2,#0x80
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R3,??DataTable13_12  ;; 0x4003900c
        STR      R2,[R3, R1, LSL #+3]
        B.N      ??FTM_Clear_Channal_Event_4
//  587 		case FTM2:FTM2_CnSC(CHx) &= ~FTM_CnSC_CHF_MASK;break;
??FTM_Clear_Channal_Event_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R2,??DataTable13_13  ;; 0x400b800c
        LDR      R2,[R2, R1, LSL #+3]
        BICS     R2,R2,#0x80
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R3,??DataTable13_13  ;; 0x400b800c
        STR      R2,[R3, R1, LSL #+3]
        B.N      ??FTM_Clear_Channal_Event_4
//  588 		case FTM3:FTM3_CnSC(CHx) &= ~FTM_CnSC_CHF_MASK;break;
??FTM_Clear_Channal_Event_3:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R2,??DataTable13_14  ;; 0x400b900c
        LDR      R2,[R2, R1, LSL #+3]
        BICS     R2,R2,#0x80
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R3,??DataTable13_14  ;; 0x400b900c
        STR      R2,[R3, R1, LSL #+3]
//  589 	}
//  590 }
??FTM_Clear_Channal_Event_4:
        BX       LR               ;; return
          CFI EndBlock cfiBlock14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     FTMn

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     0x40038054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     0x40039054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     0x400b8054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     0x400b9054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_7:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_8:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_9:
        DC32     0x400b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_10:
        DC32     0x400b9000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_11:
        DC32     0x4003800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_12:
        DC32     0x4003900c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_13:
        DC32     0x400b800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_14:
        DC32     0x400b900c

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  591 
//  592 
//  593 
//  594 //////////////////////////////// 以下为正交解码 //////////////////////////////////////////
//  595 
//  596 /*!
//  597  *  @brief      初始化FTM 的正交解码 功能
//  598  *  @param      Ftmn_e    模块号（ FTM1、  FTM2）
//  599  *  @since      v5.0
//  600  *  Sample usage:       FTM_QUAD_Init(FTM1);    //初始化 FTM1 为正交解码模式
//  601  */
//  602 /*void FTM_QUAD_Init(Ftmn_e Ftmn)
//  603 {
//  604     ASSERT( (Ftmn == FTM1) || (Ftmn == FTM2 ) ); //检查传递进来的通道是否正确
//  605 */
//  606     /******************* 开启时钟 和 复用IO口*******************/
//  607  /*   switch(Ftmn)
//  608     {
//  609 
//  610     case FTM1:
//  611         SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;       //使能FTM1时钟
//  612         if(FTM1_QDPHA == PTA8)                  //管脚复用
//  613         {
//  614             Port_Init(FTM1_QDPHA, ALT6);
//  615         }
//  616         else if(FTM1_QDPHA == PTA12)
//  617         {
//  618             Port_Init(FTM1_QDPHA, ALT7);
//  619         }
//  620         else if(FTM1_QDPHA == PTB0)
//  621         {
//  622             Port_Init(FTM1_QDPHA, ALT6);
//  623         }
//  624         else
//  625         {
//  626             ASSERT(0);                          //断言，配置的管脚不符合要求
//  627         }
//  628 
//  629         if(FTM1_QDPHB == PTA9)
//  630         {
//  631             Port_Init(FTM1_QDPHB, ALT6);
//  632         }
//  633         else if(FTM1_QDPHB == PTA13)
//  634         {
//  635             Port_Init(FTM1_QDPHB, ALT7);
//  636         }
//  637         else if(FTM1_QDPHB == PTB1)
//  638         {
//  639             Port_Init(FTM1_QDPHB, ALT6);
//  640         }
//  641         else
//  642         {
//  643             ASSERT(0);                          //断言，配置的管脚不符合要求
//  644         }
//  645         break;
//  646 
//  647     case FTM2:
//  648         SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                           //使能FTM2时钟
//  649         if(FTM2_QDPHA == PTA10)                  //管脚复用
//  650         {
//  651             Port_Init(FTM2_QDPHA, ALT6);
//  652         }
//  653         else if(FTM2_QDPHA == PTB18)
//  654         {
//  655             Port_Init(FTM2_QDPHA, ALT6);
//  656         }
//  657         else
//  658         {
//  659             ASSERT(0);                          //断言，配置的管脚不符合要求
//  660         }
//  661 
//  662         if(FTM2_QDPHB == PTA11)                  //管脚复用
//  663         {
//  664             Port_Init(FTM2_QDPHA, ALT6);
//  665         }
//  666         else if(FTM2_QDPHB == PTB19)
//  667         {
//  668             Port_Init(FTM2_QDPHA, ALT6);
//  669         }
//  670         else
//  671         {
//  672             ASSERT(0);                          //断言，配置的管脚不符合要求
//  673         }
//  674         break;
//  675     default:
//  676         ASSERT(0);                              //断言，配置的模块有误
//  677         break;
//  678     }
//  679 
//  680     FTM_MODE_REG(Ftmn[Ftmn])  |=    (0
//  681                                      | FTM_MODE_WPDIS_MASK  //写保护禁止
//  682                                      //| FTM_MODE_FTMEN_MASK   //使能 FTM
//  683                                     );
//  684     FTM_QDCTRL_REG(Ftmn[Ftmn]) |=   (0
//  685                                     | FTM_QDCTRL_QUADMODE_MASK
//  686                                      );
//  687     FTM_CNTIN_REG(Ftmn[Ftmn])   = 0;
//  688     FTM_MOD_REG(Ftmn[Ftmn])     = FTM_MOD_MOD_MASK;
//  689     FTM_QDCTRL_REG(Ftmn[Ftmn]) |=   (0
//  690                                     | FTM_QDCTRL_QUADEN_MASK
//  691                                      );
//  692     FTM_MODE_REG(Ftmn[Ftmn])  |= FTM_QDCTRL_QUADEN_MASK;
//  693     FTM_CNT_REG(Ftmn[Ftmn])     = 0;                    //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
//  694 }*/
//  695 
//  696 /*!
//  697  *  @brief      获取FTM 正交解码 的脉冲数
//  698  *  @param      Ftmn_e    模块号（ FTM1、  FTM2）
//  699  *  @since      v5.0
//  700  *  Sample usage:       int16 count = FTM_QUAD_get(FTM1);    //获取  FTM1 交解码 的脉冲数
//  701  */
//  702 /*int16 FTM_QUAD_Get(Ftmn_e Ftmn)
//  703 {
//  704     int16 val;
//  705     ASSERT( (Ftmn == FTM1) || (Ftmn == FTM2 ) );        //检查传递进来的通道是否正确
//  706     val = FTM_CNT_REG(Ftmn[Ftmn]);
//  707 
//  708     return val;
//  709 }*/
//  710 
//  711 /*!
//  712  *  @brief      清 FTM 正交解码 的脉冲数
//  713  *  @param      Ftmn_e    模块号（ FTM1、  FTM2）
//  714  *  @since      v5.0
//  715  *  Sample usage:       FTM_QUAD_clean(FTM1);    //复位 FTM1 正交解码 的脉冲数
//  716  */
//  717 /*void FTM_QUAD_Clean(Ftmn_e Ftmn)
//  718 {
//  719     ASSERT( (Ftmn == FTM1) || (Ftmn == FTM2 ) ); //检查传递进来的通道是否正确
//  720 
//  721     FTM_CNT_REG(Ftmn[Ftmn])     = 0;             //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
//  722 }*/
//  723 
//  724 
// 
//    16 bytes in section .data
// 6 256 bytes in section .text
// 
// 6 256 bytes of CODE memory
//    16 bytes of DATA memory
//
//Errors: none
//Warnings: none
