///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:10
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\PID.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\PID.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\PID.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN `b`
        EXTERN count_pwm1
        EXTERN count_pwm2
        EXTERN motor_dutyset

        PUBLIC PID_control_k
        PUBLIC PID_speed
        PUBLIC desier_driver1
        PUBLIC desier_driver2
        PUBLIC desier_get
        PUBLIC driver
        PUBLIC input
        PUBLIC input_dif
        PUBLIC input_sum
        PUBLIC k_input_last
        PUBLIC k_output
        PUBLIC k_p
        PUBLIC k_ptemp
        PUBLIC k_sum
        PUBLIC k_sum_max
        PUBLIC k_sum_min
        PUBLIC middle_PID_control
        PUBLIC middle_input_last
        PUBLIC middle_p
        PUBLIC middle_sum
        PUBLIC middle_sum_max
        PUBLIC middle_sum_min
        PUBLIC output
        PUBLIC speed_input1
        PUBLIC speed_input2
        PUBLIC speed_input_last1
        PUBLIC speed_input_last2
        PUBLIC speed_output
        PUBLIC speed_p
        PUBLIC speed_sum1
        PUBLIC speed_sum2
        PUBLIC speed_sum_max
        PUBLIC speed_sum_min
        PUBLIC sub_p
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\project\PID.c
//    1 #include "all.h"

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    2 float input = 0, input_sum = 0, input_dif = 0, output = 0;
input:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
input_sum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
input_dif:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
output:
        DS8 4
//    3 //middle 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    4 float middle_sum_max = 20, middle_sum_min = -20, middle_input_last = 0, middle_sum = 0;
middle_sum_max:
        DATA
        DC32 41A00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
middle_sum_min:
        DATA
        DC32 0C1A00000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
middle_input_last:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
middle_sum:
        DS8 4
//    5 //k

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    6 float k_sum_max = 20, k_sum_min = -20, k_input_last = 0, k_sum = 0, k_output = 0;;
k_sum_max:
        DATA
        DC32 41A00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
k_sum_min:
        DATA
        DC32 0C1A00000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
k_input_last:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
k_sum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
k_output:
        DS8 4
//    7 //speed        

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    8 float speed_sum_max = 500, speed_sum_min = -500, speed_input_last1 = 0,speed_input_last2=0,speed_input2=0,speed_input1 = 0;
speed_sum_max:
        DATA
        DC32 43FA0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
speed_sum_min:
        DATA
        DC32 0C3FA0000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_input_last1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_input_last2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_input2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_input1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 float speed_sum1 = 0,speed_sum2=0;
speed_sum1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_sum2:
        DS8 4
//   10 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   11 float middle_p=5,k_p=400,speed_p=5,sub_p=1,k_ptemp;
middle_p:
        DATA
        DC32 40A00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
k_p:
        DATA
        DC32 43C80000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
speed_p:
        DATA
        DC32 40A00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
sub_p:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
k_ptemp:
        DS8 4

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function middle_PID_control
          CFI NoCalls
        THUMB
//   12 float middle_PID_control(float p, float i, float d)
//   13  {
middle_PID_control:
        VMOV.F32 S3,S0
//   14      float middle_input = 0, middle_output = 0;
        VLDR.W   S4,??DataTable2  ;; 0x0
        VLDR.W   S0,??DataTable2  ;; 0x0
//   15      middle_input=b-Y_MAX_OUT/2;
        LDR.W    R0,??DataTable3_3
        VLDR     S5,[R0, #0]
        VLDR.W   S6,??DataTable2_1  ;; 0xc3160000
        VADD.F32 S5,S5,S6
        VMOV.F32 S4,S5
//   16      middle_sum += middle_input;
        LDR.W    R0,??DataTable3_4
        VLDR     S5,[R0, #0]
        VADD.F32 S5,S5,S4
        LDR.W    R0,??DataTable3_4
        VSTR     S5,[R0, #0]
//   17      if (middle_sum>middle_sum_max) middle_sum = middle_sum_max;
        LDR.W    R0,??DataTable3_5
        VLDR     S5,[R0, #0]
        LDR.W    R0,??DataTable3_4
        VLDR     S6,[R0, #0]
        VCMP.F32 S5,S6
        FMSTAT   
        BPL.N    ??middle_PID_control_0
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_5
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
        B.N      ??middle_PID_control_1
//   18      else if (middle_sum<middle_sum_min) middle_sum = middle_sum_min;
??middle_PID_control_0:
        LDR.W    R0,??DataTable3_4
        VLDR     S5,[R0, #0]
        LDR.W    R0,??DataTable3_6
        VLDR     S6,[R0, #0]
        VCMP.F32 S5,S6
        FMSTAT   
        BPL.N    ??middle_PID_control_1
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_6
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   19      middle_output = p*middle_input + i*middle_sum + d*(middle_input - middle_input_last);
??middle_PID_control_1:
        VMUL.F32 S5,S3,S4
        LDR.W    R0,??DataTable3_4
        VLDR     S6,[R0, #0]
        VMLA.F32 S5,S1,S6
        LDR.W    R0,??DataTable3_7
        VLDR     S6,[R0, #0]
        VSUB.F32 S6,S4,S6
        VMLA.F32 S5,S6,S2
        VMOV.F32 S0,S5
//   20      middle_input_last = middle_input;
        LDR.W    R0,??DataTable3_7
        VSTR     S4,[R0, #0]
//   21      return middle_output;
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   22  }
//   23 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PID_control_k
          CFI NoCalls
        THUMB
//   24 float PID_control_k(float p, float i, float d)
//   25  {
PID_control_k:
        VMOV.F32 S3,S0
//   26      float ka_output, k_sum = 0, input_error = 0;
        VLDR.W   S4,??DataTable2  ;; 0x0
        VLDR.W   S5,??DataTable2  ;; 0x0
//   27      input_error = k_output;
        LDR.W    R0,??DataTable3_8
        VLDR     S6,[R0, #0]
        VMOV.F32 S5,S6
//   28      k_sum += input_error;
        VADD.F32 S4,S4,S5
//   29      if (k_sum >= k_sum_max) k_sum = k_sum_max;
        LDR.W    R0,??DataTable3_9
        VLDR     S6,[R0, #0]
        VCMP.F32 S4,S6
        FMSTAT   
        BLT.N    ??PID_control_k_0
        LDR.W    R0,??DataTable3_9
        VLDR     S6,[R0, #0]
        VMOV.F32 S4,S6
        B.N      ??PID_control_k_1
//   30      else if (k_sum <= k_sum_min) k_sum = k_sum_min;
??PID_control_k_0:
        LDR.W    R0,??DataTable3_10
        VLDR     S6,[R0, #0]
        VCMP.F32 S6,S4
        FMSTAT   
        BLT.N    ??PID_control_k_1
        LDR.W    R0,??DataTable3_10
        VLDR     S6,[R0, #0]
        VMOV.F32 S4,S6
//   31      ka_output = p*input_error + i*k_sum + d*(input_error - k_input_last);
??PID_control_k_1:
        VMUL.F32 S6,S3,S5
        VMLA.F32 S6,S1,S4
        LDR.N    R0,??DataTable3_11
        VLDR     S7,[R0, #0]
        VSUB.F32 S7,S5,S7
        VMLA.F32 S6,S7,S2
        VMOV.F32 S0,S6
//   32      k_input_last = input_error;
        LDR.N    R0,??DataTable3_11
        VSTR     S5,[R0, #0]
//   33      return ka_output;
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   34  }
//   35 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   36 float  driver = 0;float speed_output = 0,desier_driver1=0,desier_driver2=0;
driver:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_output:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
desier_driver1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
desier_driver2:
        DS8 4
//   37 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function desier_get
          CFI NoCalls
        THUMB
//   38 void desier_get(float p_k,float p3)
//   39  {
//   40      float k_in;
//   41      if(k_output>0) k_in=k_output;
desier_get:
        LDR.N    R0,??DataTable3_8
        VLDR     S3,[R0, #0]
        VCMP.F32 S3,#0.0
        FMSTAT   
        BLE.N    ??desier_get_0
        LDR.N    R0,??DataTable3_8
        VLDR     S3,[R0, #0]
        VMOV.F32 S2,S3
        B.N      ??desier_get_1
//   42      else k_in=k_output/-1;
??desier_get_0:
        LDR.N    R0,??DataTable3_8
        VLDR     S3,[R0, #0]
        VMOV.F32 S4,#-1.0
        VDIV.F32 S3,S3,S4
        VMOV.F32 S2,S3
//   43 #if 0   //一边恒速一边加速
//   44      /*desier_driver1=driver;
//   45      if(k_output>0)
//   46      desier_driver2=p3*driver*(20+7*k_output)/(20-7*k_output);
//   47        else desier_driver2=p3*driver/(20+7*k_output)*(20-7*k_output);*/
//   48 #endif
//   49      
//   50      
//   51 #if 1
//   52      desier_driver1=driver*(1-k_in*p_k)-p3*k_output*driver*7/20;
??desier_get_1:
        VMOV.F32 S3,#1.0
        VMLS.F32 S3,S2,S0
        LDR.N    R0,??DataTable3_12
        VLDR     S4,[R0, #0]
        VMUL.F32 S3,S3,S4
        LDR.N    R0,??DataTable3_8
        VLDR     S4,[R0, #0]
        VMUL.F32 S4,S1,S4
        LDR.N    R0,??DataTable3_12
        VLDR     S5,[R0, #0]
        VMUL.F32 S4,S4,S5
        VMOV.F32 S5,#7.0
        VMUL.F32 S4,S4,S5
        VMOV.F32 S5,#20.0
        VDIV.F32 S4,S4,S5
        VSUB.F32 S3,S3,S4
        LDR.N    R0,??DataTable3_13
        VSTR     S3,[R0, #0]
//   53      desier_driver2=driver*(1-k_in*p_k)+p3*k_output*driver*7/20;
        VMOV.F32 S3,#1.0
        VMLS.F32 S3,S2,S0
        LDR.N    R0,??DataTable3_12
        VLDR     S4,[R0, #0]
        LDR.N    R0,??DataTable3_8
        VLDR     S5,[R0, #0]
        VMUL.F32 S5,S1,S5
        LDR.N    R0,??DataTable3_12
        VLDR     S6,[R0, #0]
        VMUL.F32 S5,S5,S6
        VMOV.F32 S6,#7.0
        VMUL.F32 S5,S5,S6
        VMOV.F32 S6,#20.0
        VDIV.F32 S5,S5,S6
        VMLA.F32 S5,S3,S4
        LDR.N    R0,??DataTable3_14
        VSTR     S5,[R0, #0]
//   54 #endif
//   55  }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0xc3160000

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PID_speed
        THUMB
//   56 void PID_speed(float p1, float i1, float d1, float p2, float i2, float d2)
//   57  {
PID_speed:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        VPUSH    {D8-D14}
          CFI D14 Frame(CFA, -16)
          CFI D13 Frame(CFA, -24)
          CFI D12 Frame(CFA, -32)
          CFI D11 Frame(CFA, -40)
          CFI D10 Frame(CFA, -48)
          CFI D9 Frame(CFA, -56)
          CFI D8 Frame(CFA, -64)
          CFI CFA R13+64
        VMOV.F32 S16,S0
        VMOV.F32 S17,S1
        VMOV.F32 S18,S2
        VMOV.F32 S19,S3
        VMOV.F32 S29,S4
        VMOV.F32 S28,S5
//   58 #if 1
//   59      //motor1
//   60      float motor_pwm1, motor_pwm2, motor_pwm3, motor_pwm4;
//   61      float motor_1,motor_2,speed_output1,speed_output2;
//   62      
//   63      speed_input1 = desier_driver1-count_pwm2 ;
        LDR.N    R0,??DataTable3_13
        VLDR     S0,[R0, #0]
        LDR.N    R0,??DataTable3_15
        VLDR     S1,[R0, #0]
        VSUB.F32 S0,S0,S1
        LDR.N    R0,??DataTable3_16
        VSTR     S0,[R0, #0]
//   64      speed_sum1 = speed_sum1+speed_input1;
        LDR.N    R0,??DataTable3_17
        VLDR     S0,[R0, #0]
        LDR.N    R0,??DataTable3_16
        VLDR     S1,[R0, #0]
        VADD.F32 S0,S0,S1
        LDR.N    R0,??DataTable3_17
        VSTR     S0,[R0, #0]
//   65      if (speed_sum1 >= speed_sum_max) speed_sum1 = speed_sum_max;
        LDR.N    R0,??DataTable3_17
        VLDR     S0,[R0, #0]
        LDR.N    R0,??DataTable3_18
        VLDR     S1,[R0, #0]
        VCMP.F32 S0,S1
        FMSTAT   
        BLT.N    ??PID_speed_0
        LDR.N    R0,??DataTable3_17
        LDR.N    R1,??DataTable3_18
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
        B.N      ??PID_speed_1
//   66      else if (speed_sum1 <= speed_sum_min) speed_sum1 = speed_sum_min;
??PID_speed_0:
        LDR.N    R0,??DataTable3_19
        VLDR     S0,[R0, #0]
        LDR.N    R0,??DataTable3_17
        VLDR     S1,[R0, #0]
        VCMP.F32 S0,S1
        FMSTAT   
        BLT.N    ??PID_speed_1
        LDR.N    R0,??DataTable3_17
        LDR.N    R1,??DataTable3_19
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   67      speed_output1 = p1*speed_input1 + i1*speed_sum1 + d1*(count_pwm1 - speed_input_last1);
??PID_speed_1:
        LDR.N    R0,??DataTable3_16
        VLDR     S0,[R0, #0]
        VMUL.F32 S0,S16,S0
        LDR.N    R0,??DataTable3_17
        VLDR     S1,[R0, #0]
        VMLA.F32 S0,S17,S1
        LDR.N    R0,??DataTable3_20
        VLDR     S1,[R0, #0]
        LDR.N    R0,??DataTable3_21
        VLDR     S2,[R0, #0]
        VSUB.F32 S1,S1,S2
        VMLA.F32 S0,S1,S18
        VMOV.F32 S26,S0
//   68      speed_input_last1 = count_pwm1;
        LDR.N    R0,??DataTable3_21
        LDR.N    R1,??DataTable3_20
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   69      
//   70      motor_1=desier_driver1+speed_output1;
        LDR.N    R0,??DataTable3_13
        VLDR     S0,[R0, #0]
        VADD.F32 S0,S0,S26
        VMOV.F32 S24,S0
//   71      if(motor_1>0) {motor_pwm1=motor_1;motor_pwm2=0;}
        VCMP.F32 S24,#0.0
        FMSTAT   
        BLE.N    ??PID_speed_2
        VMOV.F32 S20,S24
        VLDR.W   S0,??DataTable3  ;; 0x0
        VMOV.F32 S21,S0
        B.N      ??PID_speed_3
//   72      else {motor_pwm1=0;motor_pwm2=motor_1/-1;}
??PID_speed_2:
        VLDR.W   S0,??DataTable3  ;; 0x0
        VMOV.F32 S20,S0
        VMOV.F32 S0,#-1.0
        VDIV.F32 S0,S24,S0
        VMOV.F32 S21,S0
//   73      
//   74      
//   75        //motor2 
//   76      speed_input2 = desier_driver2-count_pwm1;
??PID_speed_3:
        LDR.N    R0,??DataTable3_14
        VLDR     S0,[R0, #0]
        LDR.N    R0,??DataTable3_20
        VLDR     S1,[R0, #0]
        VSUB.F32 S0,S0,S1
        LDR.N    R0,??DataTable3_22
        VSTR     S0,[R0, #0]
//   77      speed_sum2 = speed_sum2+speed_input2;
        LDR.N    R0,??DataTable3_23
        VLDR     S0,[R0, #0]
        LDR.N    R0,??DataTable3_22
        VLDR     S1,[R0, #0]
        VADD.F32 S0,S0,S1
        LDR.N    R0,??DataTable3_23
        VSTR     S0,[R0, #0]
//   78      if (speed_sum2 >= speed_sum_max) speed_sum2 = speed_sum_max;
        LDR.N    R0,??DataTable3_23
        VLDR     S0,[R0, #0]
        LDR.N    R0,??DataTable3_18
        VLDR     S1,[R0, #0]
        VCMP.F32 S0,S1
        FMSTAT   
        BLT.N    ??PID_speed_4
        LDR.N    R0,??DataTable3_23
        LDR.N    R1,??DataTable3_18
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
        B.N      ??PID_speed_5
//   79      else if (speed_sum2 <= speed_sum_min) speed_sum2 = speed_sum_min;
??PID_speed_4:
        LDR.N    R0,??DataTable3_19
        VLDR     S0,[R0, #0]
        LDR.N    R0,??DataTable3_23
        VLDR     S1,[R0, #0]
        VCMP.F32 S0,S1
        FMSTAT   
        BLT.N    ??PID_speed_5
        LDR.N    R0,??DataTable3_23
        LDR.N    R1,??DataTable3_19
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   80      speed_output2 = p2*speed_input2 + i2*speed_sum2 + d2*(count_pwm2 - speed_input_last2);
??PID_speed_5:
        LDR.N    R0,??DataTable3_22
        VLDR     S0,[R0, #0]
        VMUL.F32 S0,S19,S0
        LDR.N    R0,??DataTable3_23
        VLDR     S1,[R0, #0]
        VMLA.F32 S0,S29,S1
        LDR.N    R0,??DataTable3_15
        VLDR     S1,[R0, #0]
        LDR.N    R0,??DataTable3_24
        VLDR     S2,[R0, #0]
        VSUB.F32 S1,S1,S2
        VMLA.F32 S0,S1,S28
        VMOV.F32 S27,S0
//   81      speed_input_last2 = count_pwm2;
        LDR.N    R0,??DataTable3_24
        LDR.N    R1,??DataTable3_15
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   82      
//   83      motor_2=desier_driver2+speed_output2;
        LDR.N    R0,??DataTable3_14
        VLDR     S0,[R0, #0]
        VADD.F32 S0,S0,S27
        VMOV.F32 S25,S0
//   84      if(motor_2>0) {motor_pwm3=motor_2;motor_pwm4=0;}
        VCMP.F32 S25,#0.0
        FMSTAT   
        BLE.N    ??PID_speed_6
        VMOV.F32 S22,S25
        VLDR.W   S0,??DataTable3  ;; 0x0
        VMOV.F32 S23,S0
        B.N      ??PID_speed_7
//   85      else {motor_pwm3=0;motor_pwm4=motor_2/-1;}
??PID_speed_6:
        VLDR.W   S0,??DataTable3  ;; 0x0
        VMOV.F32 S22,S0
        VMOV.F32 S0,#-1.0
        VDIV.F32 S0,S25,S0
        VMOV.F32 S23,S0
//   86      
//   87      motor_pwm1/=10;motor_pwm2/=10;motor_pwm3/=10;motor_pwm4/=10;
??PID_speed_7:
        VMOV.F32 S0,#10.0
        VDIV.F32 S20,S20,S0
        VMOV.F32 S0,#10.0
        VDIV.F32 S21,S21,S0
        VMOV.F32 S0,#10.0
        VDIV.F32 S22,S22,S0
        VMOV.F32 S0,#10.0
        VDIV.F32 S23,S23,S0
//   88      if(motor_pwm1>70)  motor_pwm1=70;
        VLDR.W   S0,??DataTable3_1  ;; 0x428c0001
        VCMP.F32 S20,S0
        FMSTAT   
        BLT.N    ??PID_speed_8
        VLDR.W   S0,??DataTable3_2  ;; 0x428c0000
        VMOV.F32 S20,S0
//   89      if(motor_pwm2>70)  motor_pwm2=70;
??PID_speed_8:
        VLDR.W   S0,??DataTable3_1  ;; 0x428c0001
        VCMP.F32 S21,S0
        FMSTAT   
        BLT.N    ??PID_speed_9
        VLDR.W   S0,??DataTable3_2  ;; 0x428c0000
        VMOV.F32 S21,S0
//   90      if(motor_pwm3>70)  motor_pwm3=70;
??PID_speed_9:
        VLDR.W   S0,??DataTable3_1  ;; 0x428c0001
        VCMP.F32 S22,S0
        FMSTAT   
        BLT.N    ??PID_speed_10
        VLDR.W   S0,??DataTable3_2  ;; 0x428c0000
        VMOV.F32 S22,S0
//   91      if(motor_pwm4>70)  motor_pwm4=70;
??PID_speed_10:
        VLDR.W   S0,??DataTable3_1  ;; 0x428c0001
        VCMP.F32 S23,S0
        FMSTAT   
        BLT.N    ??PID_speed_11
        VLDR.W   S0,??DataTable3_2  ;; 0x428c0000
        VMOV.F32 S23,S0
//   92      motor_dutyset(motor_pwm1, motor_pwm2, motor_pwm3, motor_pwm4);
??PID_speed_11:
        VMOV.F32 S3,S23
        VMOV.F32 S2,S22
        VMOV.F32 S1,S21
        VMOV.F32 S0,S20
          CFI FunCall motor_dutyset
        BL       motor_dutyset
//   93 #endif  
//   94  }
        VPOP     {D8-D14}
          CFI D8 SameValue
          CFI D9 SameValue
          CFI D10 SameValue
          CFI D11 SameValue
          CFI D12 SameValue
          CFI D13 SameValue
          CFI D14 SameValue
          CFI CFA R13+8
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x428c0001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x428c0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     `b`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     middle_sum

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     middle_sum_max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     middle_sum_min

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     middle_input_last

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     k_output

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     k_sum_max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     k_sum_min

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     k_input_last

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     driver

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     desier_driver1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     desier_driver2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     count_pwm2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     speed_input1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     speed_sum1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     speed_sum_max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     speed_sum_min

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     count_pwm1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_21:
        DC32     speed_input_last1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_22:
        DC32     speed_input2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_23:
        DC32     speed_sum2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_24:
        DC32     speed_input_last2

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
//    80 bytes in section .bss
//    40 bytes in section .data
// 1 188 bytes in section .text
// 
// 1 188 bytes of CODE memory
//   120 bytes of DATA memory
//
//Errors: none
//Warnings: none
