///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:11
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\rollway.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\rollway.c" -lA
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
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\Debug\List\rollway.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN RST0
        EXTERN RST1
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dmul
        EXTERN __aeabi_i2d
        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memcpy4
        EXTERN __aeabi_ui2d
        EXTERN abs
        EXTERN cos
        EXTERN dPin
        EXTERN malloc
        EXTERN sin
        EXTERN type

        PUBLIC Delete_In_Corner
        PUBLIC GetCyclesPoints
        PUBLIC GetMidPoints
        PUBLIC angle_type
        PUBLIC change_get2
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\project\rollway.c
//    1 #define Cont_Num 50
//    2 #define Err_Range 3
//    3 
//    4 
//    5 #include "all.h"
//    6 #include "math.h"
//    7 #include <stdio.h>
//    8 #include <stdlib.h>
//    9 #include "rollway.h"
//   10 
//   11 extern uint16 RST1[X_MAX*Y_MAX];
//   12 extern uint16 RST0[X_MAX*Y_MAX];
//   13 
//   14 extern int16 * dPin;
//   15 
//   16 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function GetCyclesPoints
        THUMB
//   17 int16 * GetCyclesPoints(uint16 R)
//   18 {
GetCyclesPoints:
        PUSH     {R3-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        MOVS     R6,R0
//   19 	uint16 i;
//   20 	int16 * dPin;
//   21 	dPin = (int16 *) malloc(2*Cont_Num*sizeof(int16));
        MOVS     R0,#+200
          CFI FunCall malloc
        BL       malloc
        MOV      R8,R0
//   22 	for (i=0;i<Cont_Num;i++)
        MOVS     R0,#+0
        MOVS     R7,R0
??GetCyclesPoints_0:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+50
        BGE.N    ??GetCyclesPoints_1
//   23 	{
//   24 		dPin[2*i] = R * cos(2*pi/Cont_Num*(i+1)); 
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,R6
          CFI FunCall __aeabi_ui2d
        BL       __aeabi_ui2d
        MOVS     R4,R0
        MOVS     R5,R1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R0,R7,#+1
          CFI FunCall __aeabi_i2d
        BL       __aeabi_i2d
        LDR.W    R2,??DataTable2  ;; 0x8d7cb363
        LDR.W    R3,??DataTable2_1  ;; 0x3fc015bf
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
        VMOV     D0,R0,R1
          CFI FunCall cos
        BL       cos
        VMOV     R0,R1,D0
        MOVS     R2,R4
        MOVS     R3,R5
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
          CFI FunCall __aeabi_d2iz
        BL       __aeabi_d2iz
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        STRH     R0,[R8, R7, LSL #+2]
//   25 		dPin[2*i+1] = R * sin(2*pi/Cont_Num*(i+1)); 		
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LSLS     R0,R7,#+1
        ADDS     R9,R8,R0, LSL #+1
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,R6
          CFI FunCall __aeabi_ui2d
        BL       __aeabi_ui2d
        MOVS     R4,R0
        MOVS     R5,R1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R0,R7,#+1
          CFI FunCall __aeabi_i2d
        BL       __aeabi_i2d
        LDR.W    R2,??DataTable2  ;; 0x8d7cb363
        LDR.W    R3,??DataTable2_1  ;; 0x3fc015bf
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
        VMOV     D0,R0,R1
          CFI FunCall sin
        BL       sin
        VMOV     R0,R1,D0
        MOVS     R2,R4
        MOVS     R3,R5
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
          CFI FunCall __aeabi_d2iz
        BL       __aeabi_d2iz
        STRH     R0,[R9, #+2]
//   26 	}
        ADDS     R7,R7,#+1
        B.N      ??GetCyclesPoints_0
//   27 	return dPin;
??GetCyclesPoints_1:
        MOV      R0,R8
        POP      {R1,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock0
//   28 }
//   29 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function GetMidPoints
        THUMB
//   30 Mid_Rtn_ GetMidPoints(uint16 * SidePoint,uint16 SideNum,uint8 IS_Right)
//   31 {
GetMidPoints:
        PUSH     {R4-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+28
        SUBW     SP,SP,#+2804
          CFI CFA R13+2832
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//   32 	uint16 i,j,dotCR[2][Cont_Num];
//   33         
//   34 	Mid_Rtn_ Mid_Rtn;
//   35         Mid_Rtn.dot_Num = 0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+2600]
//   36 	uint16 dot_Mid[300] = {301};
        ADD      R0,SP,#+0
        LDR.W    R1,??DataTable2_2
        MOV      R2,#+600
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//   37 	if (!IS_Right)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??GetMidPoints_0
//   38 		for(i=0;i<300;i++)
        MOVS     R0,#+0
        MOV      R9,R0
??GetMidPoints_1:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+300
        BGE.N    ??GetMidPoints_2
//   39 		{ 
//   40 			dot_Mid[i] = 0;
        MOVS     R0,#+0
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADD      R1,SP,#+0
        STRH     R0,[R1, R9, LSL #+1]
//   41 		}
        ADDS     R9,R9,#+1
        B.N      ??GetMidPoints_1
//   42         else
//   43 		for(i=0;i<300;i++)
??GetMidPoints_0:
        MOVS     R0,#+0
        MOV      R9,R0
??GetMidPoints_3:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+300
        BGE.N    ??GetMidPoints_2
//   44 		{ 
//   45 			dot_Mid[i] = 301;
        MOVW     R0,#+301
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADD      R1,SP,#+0
        STRH     R0,[R1, R9, LSL #+1]
//   46 		}
        ADDS     R9,R9,#+1
        B.N      ??GetMidPoints_3
//   47 	for (i=0;i<SideNum;i++)
??GetMidPoints_2:
        MOVS     R0,#+0
        MOV      R9,R0
??GetMidPoints_4:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R9,R6
        BCS.W    ??GetMidPoints_5
//   48 	{
//   49 		for (j=0;j<Cont_Num;j++)
        MOVS     R0,#+0
        MOV      R8,R0
??GetMidPoints_6:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+50
        BGE.W    ??GetMidPoints_7
//   50 		{
//   51 			/*dotCR[0][j] = SidePoint[2*i+ 1]+ dPin[2*j];
//   52 			dotCR[1][j] = SidePoint[2*i ]+ dPin[2*j+1];*/
//   53 			dotCR[0][j] = RST1[SidePoint[2*i ]*180+SidePoint[2*i+ 1]] + dPin[2*j];
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LDRH     R0,[R5, R9, LSL #+2]
        MOVS     R1,#+180
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LSLS     R2,R9,#+1
        ADDS     R2,R5,R2, LSL #+1
        LDRH     R2,[R2, #+2]
        MLA      R0,R1,R0,R2
        LDR.W    R1,??DataTable2_3
        LDRH     R0,[R1, R0, LSL #+1]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LDR.W    R1,??DataTable2_4
        LDR      R1,[R1, #+0]
        LDRSH    R1,[R1, R8, LSL #+2]
        ADDS     R0,R1,R0
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R1,#+2604
        ADD      R1,R1,SP
        STRH     R0,[R1, R8, LSL #+1]
//   54 			dotCR[1][j] = RST0[SidePoint[2*i ]*180+SidePoint[2*i+ 1]]+ dPin[2*j+1];   
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LDRH     R0,[R5, R9, LSL #+2]
        MOVS     R1,#+180
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LSLS     R2,R9,#+1
        ADDS     R2,R5,R2, LSL #+1
        LDRH     R2,[R2, #+2]
        MLA      R0,R1,R0,R2
        LDR.W    R1,??DataTable2_5
        LDRH     R0,[R1, R0, LSL #+1]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LSLS     R1,R8,#+1
        LDR.N    R2,??DataTable2_4
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1, LSL #+1
        LDRSH    R1,[R1, #+2]
        ADDS     R0,R1,R0
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R1,#+2604
        ADD      R1,R1,SP
        ADDS     R1,R1,R8, LSL #+1
        STRH     R0,[R1, #+100]
//   55                         if ( IS_Right )
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??GetMidPoints_8
//   56                         {
//   57                         if ( ((dotCR[1][j]) > 0) && ((dotCR[1][j]) <301) )
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R0,#+2604
        ADD      R0,R0,SP
        ADDS     R0,R0,R8, LSL #+1
        LDRH     R0,[R0, #+100]
        CMP      R0,#+0
        BEQ.N    ??GetMidPoints_9
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R0,#+2604
        ADD      R0,R0,SP
        ADDS     R0,R0,R8, LSL #+1
        LDRH     R0,[R0, #+100]
        CMP      R0,#+300
        BGT.N    ??GetMidPoints_9
//   58                             if (dot_Mid[(dotCR[1][j])] > dotCR[0][j])
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R0,#+2604
        ADD      R0,R0,SP
        LDRH     R0,[R0, R8, LSL #+1]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R1,#+2604
        ADD      R1,R1,SP
        ADDS     R1,R1,R8, LSL #+1
        LDRH     R1,[R1, #+100]
        ADD      R2,SP,#+0
        LDRH     R1,[R2, R1, LSL #+1]
        CMP      R0,R1
        BCS.N    ??GetMidPoints_9
//   59                                 dot_Mid[(dotCR[1][j])] = dotCR[0][j];	 
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R0,#+2604
        ADD      R0,R0,SP
        ADDS     R0,R0,R8, LSL #+1
        LDRH     R0,[R0, #+100]
        ADD      R1,SP,#+0
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R2,#+2604
        ADD      R2,R2,SP
        LDRH     R2,[R2, R8, LSL #+1]
        STRH     R2,[R1, R0, LSL #+1]
        B.N      ??GetMidPoints_9
//   60                         }else{ 
//   61                         if ( ((dotCR[1][j]) > 0) && ((dotCR[1][j]) <301) )
??GetMidPoints_8:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R0,#+2604
        ADD      R0,R0,SP
        ADDS     R0,R0,R8, LSL #+1
        LDRH     R0,[R0, #+100]
        CMP      R0,#+0
        BEQ.N    ??GetMidPoints_9
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R0,#+2604
        ADD      R0,R0,SP
        ADDS     R0,R0,R8, LSL #+1
        LDRH     R0,[R0, #+100]
        CMP      R0,#+300
        BGT.N    ??GetMidPoints_9
//   62                             if (dot_Mid[(dotCR[1][j])] < dotCR[0][j])
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R0,#+2604
        ADD      R0,R0,SP
        ADDS     R0,R0,R8, LSL #+1
        LDRH     R0,[R0, #+100]
        ADD      R1,SP,#+0
        LDRH     R0,[R1, R0, LSL #+1]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R1,#+2604
        ADD      R1,R1,SP
        LDRH     R1,[R1, R8, LSL #+1]
        CMP      R0,R1
        BCS.N    ??GetMidPoints_9
//   63                                 dot_Mid[(dotCR[1][j])] = dotCR[0][j];	 
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R0,#+2604
        ADD      R0,R0,SP
        ADDS     R0,R0,R8, LSL #+1
        LDRH     R0,[R0, #+100]
        ADD      R1,SP,#+0
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVW     R2,#+2604
        ADD      R2,R2,SP
        LDRH     R2,[R2, R8, LSL #+1]
        STRH     R2,[R1, R0, LSL #+1]
//   64                         }
//   65 		}
??GetMidPoints_9:
        ADDS     R8,R8,#+1
        B.N      ??GetMidPoints_6
//   66 	}
??GetMidPoints_7:
        ADDS     R9,R9,#+1
        B.N      ??GetMidPoints_4
//   67         dot_Mid[0]=dot_Mid[1];
??GetMidPoints_5:
        LDRH     R0,[SP, #+2]
        STRH     R0,[SP, #+0]
//   68 /*	
//   69         Mid_Rtn.dot_Rtn[0][0] = dot_Mid[0];
//   70 	Mid_Rtn.dot_Rtn[1][0] = 0;
//   71 	Mid_Rtn.dot_Num = 1;
//   72 */
//   73 	for(i=1;i<300;i++)
        MOVS     R0,#+1
        MOV      R9,R0
??GetMidPoints_10:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+300
        BGE.N    ??GetMidPoints_11
//   74 	{
//   75 		if ( (abs(dot_Mid[i+1] - dot_Mid[i]) < Err_Range) && (dot_Mid[i]>=0)&&(dot_Mid[i]<301))
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADD      R0,SP,#+0
        ADDS     R0,R0,R9, LSL #+1
        LDRH     R0,[R0, #+2]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADD      R1,SP,#+0
        LDRH     R1,[R1, R9, LSL #+1]
        SUBS     R0,R0,R1
          CFI FunCall abs
        BL       abs
        CMP      R0,#+3
        BGE.N    ??GetMidPoints_12
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADD      R0,SP,#+0
        LDRH     R0,[R0, R9, LSL #+1]
        CMP      R0,#+300
        BGT.N    ??GetMidPoints_12
//   76 		{
//   77 			Mid_Rtn.dot_Num++;
        LDRH     R0,[SP, #+2600]
        ADDS     R0,R0,#+1
        STRH     R0,[SP, #+2600]
//   78 			Mid_Rtn.dot_Rtn[i][0]= i;
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADD      R0,SP,#+600
        STRH     R9,[R0, R9, LSL #+2]
//   79 			Mid_Rtn.dot_Rtn[i][1] = dot_Mid[i];
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADD      R0,SP,#+0
        LDRH     R0,[R0, R9, LSL #+1]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADD      R1,SP,#+600
        ADDS     R1,R1,R9, LSL #+2
        STRH     R0,[R1, #+2]
//   80 		}
//   81 	}
??GetMidPoints_12:
        ADDS     R9,R9,#+1
        B.N      ??GetMidPoints_10
//   82  	Mid_Rtn.dot_Rtn[0][0]= Mid_Rtn.dot_Rtn[1][0];
??GetMidPoints_11:
        LDRH     R0,[SP, #+604]
        STRH     R0,[SP, #+600]
//   83 	Mid_Rtn.dot_Rtn[0][1] = Mid_Rtn.dot_Rtn[1][1];
        LDRH     R0,[SP, #+606]
        STRH     R0,[SP, #+602]
//   84 
//   85 	return Mid_Rtn;
        MOVS     R0,R4
        ADD      R1,SP,#+600
        MOVW     R2,#+2002
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        ADDW     SP,SP,#+2804
          CFI CFA R13+28
        POP      {R4-R9,PC}       ;; return
          CFI EndBlock cfiBlock1
//   86 }
//   87 
//   88 
//   89 
//   90 
//   91 
//   92 /*
//   93 	输入参数：中线的点,点的数量,分界点
//   94 */
//   95 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function change_get2
          CFI NoCalls
        THUMB
//   96 uint16  change_get2(uint16 line[200][2],uint16 dot_n)
//   97  {
change_get2:
        PUSH     {R4-R7}
          CFI R7 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R2,R0
//   98      int16 i,j;
//   99      int16 sub_value=0,times=0;
        MOVS     R5,#+0
        MOVS     R6,#+0
//  100      for(i=2;i<dot_n-2;i+=1)
        MOVS     R0,#+2
        MOVS     R3,R0
??change_get2_0:
        SXTH     R3,R3            ;; SignExt  R3,R3,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        SUBS     R0,R1,#+2
        CMP      R3,R0
        BGE.N    ??change_get2_1
//  101       {
//  102         times=0;
        MOVS     R0,#+0
        MOVS     R6,R0
//  103           sub_value=(line[i+2][0]-line[i][0])-(line[i][0]-line[i-2][0]);
        SXTH     R3,R3            ;; SignExt  R3,R3,#+16,#+16
        ADDS     R0,R2,R3, LSL #+2
        LDRSH    R0,[R0, #+8]
        SXTH     R3,R3            ;; SignExt  R3,R3,#+16,#+16
        LDRSH    R7,[R2, R3, LSL #+2]
        SUBS     R0,R0,R7
        SXTH     R3,R3            ;; SignExt  R3,R3,#+16,#+16
        LDRSH    R7,[R2, R3, LSL #+2]
        SUBS     R0,R0,R7
        SXTH     R3,R3            ;; SignExt  R3,R3,#+16,#+16
        ADDS     R7,R2,R3, LSL #+2
        LDRSH    R7,[R7, #-8]
        ADDS     R0,R7,R0
        MOVS     R5,R0
//  104           sub_value=sub_value*-1;
        MOVS     R0,#-1
        SMULBB   R5,R5,R0
//  105           if((sub_value>Error_Corner_Num)&&(i<dot_n/2))
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,#+11
        BLT.N    ??change_get2_2
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,#+2
        SDIV     R0,R1,R0
        SXTH     R3,R3            ;; SignExt  R3,R3,#+16,#+16
        CMP      R3,R0
        BGE.N    ??change_get2_2
//  106           {
//  107             for(j=0;j<10;j++)
        MOVS     R0,#+0
        MOVS     R4,R0
??change_get2_3:
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        CMP      R4,#+10
        BGE.N    ??change_get2_4
//  108             {
//  109               if(line[i+j+2][0]<line[i-1][0])
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        SXTAH    R0,R4,R3
        ADDS     R0,R2,R0, LSL #+2
        LDRH     R0,[R0, #+8]
        SXTH     R3,R3            ;; SignExt  R3,R3,#+16,#+16
        ADDS     R7,R2,R3, LSL #+2
        LDRH     R7,[R7, #-4]
        CMP      R0,R7
        BCS.N    ??change_get2_5
//  110                 times++;
        ADDS     R6,R6,#+1
//  111             }
??change_get2_5:
        ADDS     R4,R4,#+1
        B.N      ??change_get2_3
//  112             if(times>5) 
??change_get2_4:
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        CMP      R6,#+6
        BLT.N    ??change_get2_2
//  113               return i+1;
        ADDS     R0,R3,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        B.N      ??change_get2_6
//  114           }
//  115       }
??change_get2_2:
        ADDS     R3,R3,#+1
        B.N      ??change_get2_0
//  116       return 0;
??change_get2_1:
        MOVS     R0,#+0
??change_get2_6:
        POP      {R4-R7}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  117  }
//  118 extern uint16 type;

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  119 uint8 angle_type=0;
angle_type:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function Delete_In_Corner
        THUMB
//  120 Line Delete_In_Corner(uint16 Dot[MAX_DOT_NUM][2], uint16 Dot_Num ,uint16 Split_Dot)
//  121 {
Delete_In_Corner:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        SUB      SP,SP,#+2008
          CFI CFA R13+2032
        MOVS     R4,R1
        MOVS     R5,R2
        MOVS     R6,R3
//  122 	uint16 i,TFS=2;//TFS为错误的点数
        MOVS     R8,#+2
//  123     uint8 LFlag;
//  124 	Line Rtn;
//  125 	Rtn.num = 0;
        MOVS     R1,#+0
        STRH     R1,[SP, #+2000]
//  126     angle_type=0;
        MOVS     R1,#+0
        LDR.N    R2,??DataTable2_6
        STRB     R1,[R2, #+0]
//  127          if (type==2)
        LDR.N    R1,??DataTable2_7
        LDRH     R1,[R1, #+0]
        CMP      R1,#+2
        BNE.N    ??Delete_In_Corner_0
//  128           {
//  129               for (i = Split_Dot + 2; ( Dot[i][1] > Dot[Split_Dot-3][1])  &&(i<Dot_Num-1); i++)
        ADDS     R1,R6,#+2
        MOVS     R7,R1
??Delete_In_Corner_1:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R1,R4,R6, LSL #+2
        LDRH     R1,[R1, #-10]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R2,R4,R7, LSL #+2
        LDRH     R2,[R2, #+2]
        CMP      R1,R2
        BCS.N    ??Delete_In_Corner_2
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        SUBS     R1,R5,#+1
        CMP      R7,R1
        BGE.N    ??Delete_In_Corner_2
//  130                {
//  131                    TFS++;
        ADDS     R8,R8,#+1
//  132                    if (TFS == Split_Dot)
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R8,R6
        BEQ.N    ??Delete_In_Corner_2
//  133                        break;
//  134                }
??Delete_In_Corner_3:
        ADDS     R7,R7,#+1
        B.N      ??Delete_In_Corner_1
//  135               angle_type=2;
??Delete_In_Corner_2:
        MOVS     R1,#+2
        LDR.N    R2,??DataTable2_6
        STRB     R1,[R2, #+0]
        B.N      ??Delete_In_Corner_4
//  136           }
//  137         else if(type==1)
??Delete_In_Corner_0:
        LDR.N    R1,??DataTable2_7
        LDRH     R1,[R1, #+0]
        CMP      R1,#+1
        BNE.N    ??Delete_In_Corner_4
//  138          {
//  139              	for (i = Split_Dot + 2; ( Dot[Split_Dot-3][1]>Dot[i][1]) &&(i<Dot_Num-1); i++)
        ADDS     R1,R6,#+2
        MOVS     R7,R1
??Delete_In_Corner_5:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R1,R4,R7, LSL #+2
        LDRH     R1,[R1, #+2]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R2,R4,R6, LSL #+2
        LDRH     R2,[R2, #-10]
        CMP      R1,R2
        BCS.N    ??Delete_In_Corner_6
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        SUBS     R1,R5,#+1
        CMP      R7,R1
        BGE.N    ??Delete_In_Corner_6
//  140                 {
//  141                     TFS++;
        ADDS     R8,R8,#+1
//  142                     if (TFS == Split_Dot)
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R8,R6
        BEQ.N    ??Delete_In_Corner_6
//  143                         break;
//  144                 }
??Delete_In_Corner_7:
        ADDS     R7,R7,#+1
        B.N      ??Delete_In_Corner_5
//  145                 angle_type=1;
??Delete_In_Corner_6:
        MOVS     R1,#+1
        LDR.N    R2,??DataTable2_6
        STRB     R1,[R2, #+0]
//  146          }
//  147 	for (i = 0; i < Dot_Num; i++)
??Delete_In_Corner_4:
        MOVS     R1,#+0
        MOVS     R7,R1
??Delete_In_Corner_8:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R7,R5
        BCS.N    ??Delete_In_Corner_9
//  148 	{
//  149 		if (i <= (Split_Dot - TFS) || i >(Split_Dot + TFS))
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R1,R6,R8
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R1,R7
        BGE.N    ??Delete_In_Corner_10
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTAH    R1,R8,R6
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R1,R7
        BGE.N    ??Delete_In_Corner_11
//  150 		{
//  151 			Rtn.dot[Rtn.num][0] = Dot[i][0];
??Delete_In_Corner_10:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRH     R1,[R4, R7, LSL #+2]
        LDRH     R2,[SP, #+2000]
        ADD      R3,SP,#+0
        STRH     R1,[R3, R2, LSL #+2]
//  152 			Rtn.dot[Rtn.num][1] = Dot[i][1];
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R1,R4,R7, LSL #+2
        LDRH     R1,[R1, #+2]
        LDRH     R2,[SP, #+2000]
        ADD      R3,SP,#+0
        ADDS     R2,R3,R2, LSL #+2
        STRH     R1,[R2, #+2]
//  153 			Rtn.num++;
        LDRH     R1,[SP, #+2000]
        ADDS     R1,R1,#+1
        STRH     R1,[SP, #+2000]
//  154 		}
//  155 	}
??Delete_In_Corner_11:
        ADDS     R7,R7,#+1
        B.N      ??Delete_In_Corner_8
//  156 	return Rtn;
??Delete_In_Corner_9:
        ADD      R1,SP,#+0
        MOVW     R2,#+2002
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        ADD      SP,SP,#+2008
          CFI CFA R13+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock3
//  157 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x8d7cb363

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x3fc015bf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     `?<Constant {301}>`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     RST1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     dPin

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     RST0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     angle_type

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     type

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {301}>`:
        DATA
        DC16 301
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        END
// 
//     1 byte  in section .bss
//   600 bytes in section .rodata
// 1 340 bytes in section .text
// 
// 1 340 bytes of CODE  memory
//   600 bytes of CONST memory
//     1 byte  of DATA  memory
//
//Errors: none
//Warnings: 4
