///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:14
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\transform.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\project\transform.c" -lA
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
//        C:\Users\love ben\Desktop\IAR_1_2\IAR\Debug\List\transform.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1


        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\project\transform.c
//    1 #include "transform.h"
//    2 /*
//    3 void Send_Transformed(void)
//    4  {
//    5   int M;
//    6 	UART_SS(UART0,"image");
//    7 	for (M = 223*300-1;M>=0;M--)
//    8 	{
//    9 		if ( RST0[M] >0 && RST1[M] >0 && RST0[M] <= BmpHeightX && RST1[M] <= BmpWidthX)
//   10 		{
//   11 			UART_S1(UART0,(date   [(RST0[M] )]    
//   12 								  [(RST1[M])]
//   13 						  )
//   14 			);
//   15 		}
//   16 		else
//   17 			UART_S1(UART0,1);
//   18 	} 
//   19 }
//   20 uint8 Get_Transform_Value(uint16 i,uint16 j)
//   21 {
//   22         return date[RST0[i*180+j]][RST1[i*180+j]];
//   23 }
//   24 
//   25 void source_dot(uint16 i,uint16 j,uint8 *source_i,uint8 *source_j)
//   26  {
//   27      *source_i=RST0[i*300+j];
//   28      *source_j=RST1[i*300+j];
//   29  }*/
// 
//
// 
//
//
//Errors: none
//Warnings: none
