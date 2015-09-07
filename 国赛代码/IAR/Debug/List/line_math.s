///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:09
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\line_math.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\line_math.c" -lA
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
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\Debug\List\line_math.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN RST0
        EXTERN RST1

        PUBLIC `b`
        PUBLIC simple_k_solve
        PUBLIC solv_line_k
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\project\line_math.c
//    1 #include"line_math.h"
//    2 
//    3 
//    4 
//    5 extern uint16 RST0[X_MAX * Y_MAX];
//    6 extern  uint16 RST1[X_MAX * Y_MAX];

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 float b;
`b`:
        DS8 4
//    8 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function solv_line_k
          CFI NoCalls
        THUMB
//    9 float solv_line_k(uint16 array[][2], uint32 arr_sta, uint32 arr_end, uint8 ok, float *x, uint32 step_line, uint32 line_swap)
//   10 {
solv_line_k:
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
        MOVS     R3,R0
        MOVS     R4,R1
        MOVS     R5,R2
        LDR      R6,[SP, #+44]
//   11 	int32 mul_sum_arr_xx = 0, mul_sum_arr_yy = 0, mul_sum_arr_xy = 0;
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R0,#+0
//   12 	uint32  length = 0,sum_of_arr_x = 0, sum_of_arr_y = 0;
        VLDR.W   S1,??DataTable0  ;; 0x0
        MOVS     R12,#+0
        MOVS     LR,#+0
//   13 	float mean_of_arr_x = 0, mean_of_arr_y = 0;
        VLDR.W   S2,??DataTable0  ;; 0x0
        VLDR.W   S3,??DataTable0  ;; 0x0
//   14 	float num_up = 0, num_down = 0, b_get;
        VLDR.W   S5,??DataTable0  ;; 0x0
        VLDR.W   S6,??DataTable0  ;; 0x0
//   15 	float result = 0;	uint32 i = 0;
        VLDR.W   S7,??DataTable0  ;; 0x0
        MOVS     R7,#+0
//   16 	length = 1 + (arr_end - arr_sta) / step_line;
        SUBS     R8,R5,R4
        UDIV     R8,R8,R6
        ADDS     R8,R8,#+1
        VMOV     S0,R8
        VMOV.F32 S1,S0
//   17 
//   18 
//   19 	if (!ok)
        LDRB     R8,[SP, #+0]
        CMP      R8,#+0
        BNE.N    ??solv_line_k_0
//   20 	{
//   21 		for (i = arr_sta; i <= arr_end; i = i + step_line)
        MOVS     R7,R4
??solv_line_k_1:
        CMP      R5,R7
        BCC.W    ??solv_line_k_2
//   22 		{
//   23 			sum_of_arr_x += array[i][0];
        LDRH     R8,[R3, R7, LSL #+2]
        UXTAH    R12,R12,R8
//   24 			sum_of_arr_y += array[i][1];
        ADDS     R8,R3,R7, LSL #+2
        LDRH     R8,[R8, #+2]
        UXTAH    LR,LR,R8
//   25 			mul_sum_arr_xy += array[i][0] * array[i][1];
        LDRH     R8,[R3, R7, LSL #+2]
        ADDS     R9,R3,R7, LSL #+2
        LDRH     R9,[R9, #+2]
        MLA      R0,R9,R8,R0
//   26 			mul_sum_arr_xx += array[i][0] * array[i][0];
        LDRH     R8,[R3, R7, LSL #+2]
        LDRH     R9,[R3, R7, LSL #+2]
        MLA      R1,R9,R8,R1
//   27 			mul_sum_arr_yy += array[i][1] * array[i][1];
        ADDS     R8,R3,R7, LSL #+2
        LDRH     R8,[R8, #+2]
        ADDS     R9,R3,R7, LSL #+2
        LDRH     R9,[R9, #+2]
        MLA      R2,R9,R8,R2
//   28 		}
        ADDS     R7,R6,R7
        B.N      ??solv_line_k_1
//   29 	}
//   30 	else
//   31 	{
//   32 		for (i = arr_sta; i <= arr_end; i = i + step_line)
??solv_line_k_0:
        MOVS     R7,R4
??solv_line_k_3:
        CMP      R5,R7
        BCC.N    ??solv_line_k_2
//   33 		{
//   34 			sum_of_arr_x += RST0[array[i][0] * Y_MAX + array[i][1]];
        LDRH     R8,[R3, R7, LSL #+2]
        MOVS     R9,#+210
        ADDS     R10,R3,R7, LSL #+2
        LDRH     R10,[R10, #+2]
        MLA      R8,R9,R8,R10
        LDR.W    R9,??DataTable1_4
        LDRH     R8,[R9, R8, LSL #+1]
        UXTAH    R12,R12,R8
//   35 			sum_of_arr_y += RST1[array[i][0] * Y_MAX + array[i][1]];
        LDRH     R8,[R3, R7, LSL #+2]
        MOVS     R9,#+210
        ADDS     R10,R3,R7, LSL #+2
        LDRH     R10,[R10, #+2]
        MLA      R8,R9,R8,R10
        LDR.W    R9,??DataTable1_5
        LDRH     R8,[R9, R8, LSL #+1]
        UXTAH    LR,LR,R8
//   36 			mul_sum_arr_xy += RST0[array[i][0] * Y_MAX + array[i][1]] * RST1[array[i][0] * Y_MAX + array[i][1]];
        LDRH     R8,[R3, R7, LSL #+2]
        MOVS     R9,#+210
        ADDS     R10,R3,R7, LSL #+2
        LDRH     R10,[R10, #+2]
        MLA      R8,R9,R8,R10
        LDR.W    R9,??DataTable1_4
        LDRH     R10,[R9, R8, LSL #+1]
        LDRH     R8,[R3, R7, LSL #+2]
        MOVS     R9,#+210
        ADDS     R11,R3,R7, LSL #+2
        LDRH     R11,[R11, #+2]
        MLA      R8,R9,R8,R11
        LDR.W    R9,??DataTable1_5
        LDRH     R8,[R9, R8, LSL #+1]
        MLA      R0,R8,R10,R0
//   37 			mul_sum_arr_xx += RST0[array[i][0] * Y_MAX + array[i][1]] * RST0[array[i][0] * Y_MAX + array[i][1]];
        LDRH     R8,[R3, R7, LSL #+2]
        MOVS     R9,#+210
        ADDS     R10,R3,R7, LSL #+2
        LDRH     R10,[R10, #+2]
        MLA      R8,R9,R8,R10
        LDR.W    R9,??DataTable1_4
        LDRH     R10,[R9, R8, LSL #+1]
        LDRH     R8,[R3, R7, LSL #+2]
        MOVS     R9,#+210
        ADDS     R11,R3,R7, LSL #+2
        LDRH     R11,[R11, #+2]
        MLA      R8,R9,R8,R11
        LDR.W    R9,??DataTable1_4
        LDRH     R8,[R9, R8, LSL #+1]
        MLA      R1,R8,R10,R1
//   38 			mul_sum_arr_yy += RST1[array[i][0] * Y_MAX + array[i][1]] * RST1[array[i][0] * Y_MAX + array[i][1]];
        LDRH     R8,[R3, R7, LSL #+2]
        MOVS     R9,#+210
        ADDS     R10,R3,R7, LSL #+2
        LDRH     R10,[R10, #+2]
        MLA      R8,R9,R8,R10
        LDR.W    R9,??DataTable1_5
        LDRH     R10,[R9, R8, LSL #+1]
        LDRH     R8,[R3, R7, LSL #+2]
        MOVS     R9,#+210
        ADDS     R11,R3,R7, LSL #+2
        LDRH     R11,[R11, #+2]
        MLA      R8,R9,R8,R11
        LDR.W    R9,??DataTable1_5
        LDRH     R8,[R9, R8, LSL #+1]
        MLA      R2,R8,R10,R2
//   39 		}
        ADDS     R7,R6,R7
        B.N      ??solv_line_k_3
//   40 	}
//   41 
//   42 	/////////mean();
//   43 	mean_of_arr_x = (float)sum_of_arr_x / (float)length;
??solv_line_k_2:
        VMOV     S0,R12
        VCVT.F32.U32 S0,S0
        VCVT.F32.U32 S8,S1
        VDIV.F32 S0,S0,S8
        VMOV.F32 S2,S0
//   44 	mean_of_arr_y = (float)sum_of_arr_y / (float)length;
        VMOV     S0,LR
        VCVT.F32.U32 S0,S0
        VCVT.F32.U32 S8,S1
        VDIV.F32 S0,S0,S8
        VMOV.F32 S3,S0
//   45 
//   46 	num_up = mul_sum_arr_xy - sum_of_arr_x*mean_of_arr_y;
        VMOV     S0,R0
        VCVT.F32.S32 S0,S0
        VMOV     S8,R12
        VCVT.F32.U32 S8,S8
        VMLS.F32 S0,S8,S3
        VMOV.F32 S5,S0
//   47 	if (line_swap)
        LDR      R8,[SP, #+48]
        CMP      R8,#+0
        BEQ.N    ??solv_line_k_4
//   48 		num_down = mul_sum_arr_yy - sum_of_arr_y*mean_of_arr_y;
        VMOV     S0,R2
        VCVT.F32.S32 S0,S0
        VMOV     S8,LR
        VCVT.F32.U32 S8,S8
        VMLS.F32 S0,S8,S3
        VMOV.F32 S6,S0
        B.N      ??solv_line_k_5
//   49 	else
//   50 		num_down = mul_sum_arr_xx - sum_of_arr_x*mean_of_arr_x;
??solv_line_k_4:
        VMOV     S0,R1
        VCVT.F32.S32 S0,S0
        VMOV     S8,R12
        VCVT.F32.U32 S8,S8
        VMLS.F32 S0,S8,S2
        VMOV.F32 S6,S0
//   51 	if ((num_down == 0))
??solv_line_k_5:
        VCMP.F32 S6,#0.0
        FMSTAT   
        BNE.N    ??solv_line_k_6
//   52 	{
//   53 		if (num_up>0) { return 30.0; }
        VCMP.F32 S5,#0.0
        FMSTAT   
        BLE.N    ??solv_line_k_7
        VMOV.F32 S0,#30.0
        B.N      ??solv_line_k_8
//   54 		else if (num_up<0) { return  -30.0; }
??solv_line_k_7:
        VCMP.F32 S5,#0.0
        FMSTAT   
        BPL.N    ??solv_line_k_9
        VMOV.F32 S0,#-30.0
        B.N      ??solv_line_k_8
//   55 		else { return 0; }
??solv_line_k_9:
        VLDR.W   S0,??DataTable0  ;; 0x0
        B.N      ??solv_line_k_8
//   56 	}
//   57 	result = num_up / num_down;
??solv_line_k_6:
        VDIV.F32 S0,S5,S6
        VMOV.F32 S7,S0
//   58 	b_get = mean_of_arr_y - result*mean_of_arr_x;
        VMOV.F32 S0,S3
        VMLS.F32 S0,S7,S2
        VMOV.F32 S4,S0
//   59 	if ((b_get<250) && (b_get>130))
        VLDR.W   S0,??DataTable1  ;; 0x437a0000
        VCMP.F32 S4,S0
        FMSTAT   
        BPL.N    ??solv_line_k_10
        VLDR.W   S0,??DataTable1_1  ;; 0x43020001
        VCMP.F32 S4,S0
        FMSTAT   
        BLT.N    ??solv_line_k_10
//   60 		*x = b_get;
        LDR      R8,[SP, #+40]
        VSTR     S4,[R8, #0]
//   61 	return result;
??solv_line_k_10:
        VMOV.F32 S0,S7
??solv_line_k_8:
        POP      {R0,R4-R11,PC}   ;; return
          CFI EndBlock cfiBlock0
//   62 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x0
//   63 
//   64 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function simple_k_solve
          CFI NoCalls
        THUMB
//   65 float simple_k_solve(uint16 array[][2],uint32 arr_sta, uint32 arr_end,uint32 line_swap)
//   66 {
simple_k_solve:
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
//   67   uint32 t=0,xy_val=0,xx_val=0,yy_val=0,x_sum=0,y_sum=0,i=0;
        MOVS     R4,#+0
        MOVS     R12,#+0
        MOVS     LR,#+0
        MOVS     R8,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R7,#+0
//   68   float K_val=0,up_val=0,down_val=0;
        VLDR.W   S1,??DataTable1_2  ;; 0x0
        VLDR.W   S2,??DataTable1_2  ;; 0x0
        VLDR.W   S3,??DataTable1_2  ;; 0x0
//   69   for(i=arr_sta;i<=arr_end;i++)
        MOVS     R7,R1
??simple_k_solve_0:
        CMP      R2,R7
        BCC.N    ??simple_k_solve_1
//   70   {
//   71     xy_val+=array[i][0]*array[i][1];
        LDRH     R9,[R0, R7, LSL #+2]
        ADDS     R10,R0,R7, LSL #+2
        LDRH     R10,[R10, #+2]
        MLA      R12,R10,R9,R12
//   72     xx_val+=array[i][0]*array[i][0];
        LDRH     R9,[R0, R7, LSL #+2]
        LDRH     R10,[R0, R7, LSL #+2]
        MLA      LR,R10,R9,LR
//   73     yy_val+=array[i][1]*array[i][1];
        ADDS     R9,R0,R7, LSL #+2
        LDRH     R9,[R9, #+2]
        ADDS     R10,R0,R7, LSL #+2
        LDRH     R10,[R10, #+2]
        MLA      R8,R10,R9,R8
//   74     x_sum+=array[i][0];
        LDRH     R9,[R0, R7, LSL #+2]
        UXTAH    R5,R5,R9
//   75     y_sum+=array[i][1];
        ADDS     R9,R0,R7, LSL #+2
        LDRH     R9,[R9, #+2]
        UXTAH    R6,R6,R9
//   76   }
        ADDS     R7,R7,#+1
        B.N      ??simple_k_solve_0
//   77   up_val=xy_val-((float)(x_sum*y_sum))/((float)(arr_end-arr_sta+1));
??simple_k_solve_1:
        VMOV     S0,R12
        VCVT.F32.U32 S0,S0
        MUL      R9,R6,R5
        VMOV     S4,R9
        VCVT.F32.U32 S4,S4
        SUBS     R9,R2,R1
        ADDS     R9,R9,#+1
        VMOV     S5,R9
        VCVT.F32.U32 S5,S5
        VDIV.F32 S4,S4,S5
        VSUB.F32 S0,S0,S4
        VMOV.F32 S2,S0
//   78   if(line_swap)
        CMP      R3,#+0
        BEQ.N    ??simple_k_solve_2
//   79   {
//   80     down_val=yy_val-((float)(y_sum*y_sum))/((float)(arr_end-arr_sta+1));
        VMOV     S0,R8
        VCVT.F32.U32 S0,S0
        MUL      R9,R6,R6
        VMOV     S4,R9
        VCVT.F32.U32 S4,S4
        SUBS     R9,R2,R1
        ADDS     R9,R9,#+1
        VMOV     S5,R9
        VCVT.F32.U32 S5,S5
        VDIV.F32 S4,S4,S5
        VSUB.F32 S0,S0,S4
        VMOV.F32 S3,S0
        B.N      ??simple_k_solve_3
//   81   }
//   82   else
//   83   {
//   84     down_val=xx_val-((float)(x_sum*x_sum))/((float)(arr_end-arr_sta+1));
??simple_k_solve_2:
        VMOV     S0,LR
        VCVT.F32.U32 S0,S0
        MUL      R9,R5,R5
        VMOV     S4,R9
        VCVT.F32.U32 S4,S4
        SUBS     R9,R2,R1
        ADDS     R9,R9,#+1
        VMOV     S5,R9
        VCVT.F32.U32 S5,S5
        VDIV.F32 S4,S4,S5
        VSUB.F32 S0,S0,S4
        VMOV.F32 S3,S0
//   85   }
//   86   if ((down_val == 0))
??simple_k_solve_3:
        VCMP.F32 S3,#0.0
        FMSTAT   
        BNE.N    ??simple_k_solve_4
//   87 	{
//   88 		if (up_val>0) { return 10.0; }
        VCMP.F32 S2,#0.0
        FMSTAT   
        BLE.N    ??simple_k_solve_5
        VMOV.F32 S0,#10.0
        B.N      ??simple_k_solve_6
//   89 		else if (up_val<0) { return  -10.0; }
??simple_k_solve_5:
        VCMP.F32 S2,#0.0
        FMSTAT   
        BPL.N    ??simple_k_solve_7
        VMOV.F32 S0,#-10.0
        B.N      ??simple_k_solve_6
//   90 		else { return 0; }
??simple_k_solve_7:
        VLDR.W   S0,??DataTable1_2  ;; 0x0
        B.N      ??simple_k_solve_6
//   91 	}
//   92   K_val=up_val/down_val;
??simple_k_solve_4:
        VDIV.F32 S0,S2,S3
        VMOV.F32 S1,S0
//   93   if(K_val>10) K_val=10;
        VLDR.W   S0,??DataTable1_3  ;; 0x41200001
        VCMP.F32 S1,S0
        FMSTAT   
        BLT.N    ??simple_k_solve_8
        VMOV.F32 S0,#10.0
        VMOV.F32 S1,S0
//   94   if(K_val<-10) K_val=-10;
??simple_k_solve_8:
        VMOV.F32 S0,#-10.0
        VCMP.F32 S1,S0
        FMSTAT   
        BPL.N    ??simple_k_solve_9
        VMOV.F32 S0,#-10.0
        VMOV.F32 S1,S0
//   95   return K_val;
??simple_k_solve_9:
        VMOV.F32 S0,S1
??simple_k_solve_6:
        POP      {R4-R10,PC}      ;; return
          CFI EndBlock cfiBlock1
//   96 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x437a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x43020001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x41200001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     RST0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     RST1

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
//     4 bytes in section .bss
// 1 052 bytes in section .text
// 
// 1 052 bytes of CODE memory
//     4 bytes of DATA memory
//
//Errors: none
//Warnings: 1
