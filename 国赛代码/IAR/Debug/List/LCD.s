///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:09
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\LCD.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\LCD.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\LCD.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_INIT
        EXTERN GPIO_SET
        EXTERN SYSDelay_ms
        EXTERN SYSDelay_us
        EXTERN `date`
        EXTERN threshold_left_next

        PUBLIC Draw_BMP
        PUBLIC F6x8
        PUBLIC F8X16
        PUBLIC LCD_6x8Str
        PUBLIC LCD_6x8char
        PUBLIC LCD_8x16Str
        PUBLIC LCD_8x16char
        PUBLIC LCD_Fill
        PUBLIC LCD_Init
        PUBLIC LCD_PutPixel
        PUBLIC LCD_Rectangle
        PUBLIC LCD_Set_Pos
        PUBLIC LCD_WrCmd
        PUBLIC LCD_WrDat
        PUBLIC LCD_char16x16
        PUBLIC LCD_clear
        PUBLIC OLED_image
        PUBLIC datata
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\LCD.c
//    1 #include "all.h"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//    2 const unsigned char F6x8[][6] =
F6x8:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 7, 0, 7, 0, 0, 20, 127
        DC8 20, 127, 20, 0, 36, 42, 127, 42, 18, 0, 98, 100, 8, 19, 35, 0, 54
        DC8 73, 85, 34, 80, 0, 0, 5, 3, 0, 0, 0, 0, 28, 34, 65, 0, 0, 0, 65, 34
        DC8 28, 0, 0, 20, 8, 62, 8, 20, 0, 8, 8, 62, 8, 8, 0, 0, 0, 160, 96, 0
        DC8 0, 8, 8, 8, 8, 8, 0, 0, 96, 96, 0, 0, 0, 32, 16, 8, 4, 2, 0, 62, 81
        DC8 73, 69, 62, 0, 0, 66, 127, 64, 0, 0, 66, 97, 81, 73, 70, 0, 33, 65
        DC8 69, 75, 49, 0, 24, 20, 18, 127, 16, 0, 39, 69, 69, 69, 57, 0, 60
        DC8 74, 73, 73, 48, 0, 1, 113, 9, 5, 3, 0, 54, 73, 73, 73, 54, 0, 6, 73
        DC8 73, 41, 30, 0, 0, 54, 54, 0, 0, 0, 0, 86, 54, 0, 0, 0, 8, 20, 34
        DC8 65, 0, 0, 20, 20, 20, 20, 20, 0, 0, 65, 34, 20, 8, 0, 2, 1, 81, 9
        DC8 6, 0, 50, 73, 89, 81, 62, 0, 124, 18, 17, 18, 124, 0, 127, 73, 73
        DC8 73, 54, 0, 62, 65, 65, 65, 34, 0, 127, 65, 65, 34, 28, 0, 127, 73
        DC8 73, 73, 65, 0, 127, 9, 9, 9, 1, 0, 62, 65, 73, 73, 122, 0, 127, 8
        DC8 8, 8, 127, 0, 0, 65, 127, 65, 0, 0, 32, 64, 65, 63, 1, 0, 127, 8
        DC8 20, 34, 65, 0, 127, 64, 64, 64, 64, 0, 127, 2, 12, 2, 127, 0, 127
        DC8 4, 8, 16, 127, 0, 62, 65, 65, 65, 62, 0, 127, 9, 9, 9, 6, 0, 62, 65
        DC8 81, 33, 94, 0, 127, 9, 25, 41, 70, 0, 70, 73, 73, 73, 49, 0, 1, 1
        DC8 127, 1, 1, 0, 63, 64, 64, 64, 63, 0, 31, 32, 64, 32, 31, 0, 63, 64
        DC8 56, 64, 63, 0, 99, 20, 8, 20, 99, 0, 7, 8, 112, 8, 7, 0, 97, 81, 73
        DC8 69, 67, 0, 0, 127, 65, 65, 0, 0, 85, 42, 85, 42, 85, 0, 0, 65, 65
        DC8 127, 0, 0, 4, 2, 1, 2, 4, 0, 64, 64, 64, 64, 64, 0, 0, 1, 2, 4, 0
        DC8 0, 32, 84, 84, 84, 120, 0, 127, 72, 68, 68, 56, 0, 56, 68, 68, 68
        DC8 32, 0, 56, 68, 68, 72, 127, 0, 56, 84, 84, 84, 24, 0, 8, 126, 9, 1
        DC8 2, 0, 24, 164, 164, 164, 124, 0, 127, 8, 4, 4, 120, 0, 0, 68, 125
        DC8 64, 0, 0, 64, 128, 132, 125, 0, 0, 127, 16, 40, 68, 0, 0, 0, 65
        DC8 127, 64, 0, 0, 124, 4, 24, 4, 120, 0, 124, 8, 4, 4, 120, 0, 56, 68
        DC8 68, 68, 56, 0, 252, 36, 36, 36, 24, 0, 24, 36, 36, 24, 252, 0, 124
        DC8 8, 4, 4, 8, 0, 72, 84, 84, 84, 32, 0, 4, 63, 68, 64, 32, 0, 60, 64
        DC8 64, 32, 124, 0, 28, 32, 64, 32, 28, 0, 60, 64, 48, 64, 60, 0, 68
        DC8 40, 16, 40, 68, 0, 28, 160, 160, 160, 124, 0, 68, 100, 84, 76, 68
        DC8 20, 20, 20, 20, 20, 20
//    3 {
//    4     { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },   // sp
//    5     { 0x00, 0x00, 0x00, 0x2f, 0x00, 0x00 },   // !
//    6     { 0x00, 0x00, 0x07, 0x00, 0x07, 0x00 },   // "
//    7     { 0x00, 0x14, 0x7f, 0x14, 0x7f, 0x14 },   // #
//    8     { 0x00, 0x24, 0x2a, 0x7f, 0x2a, 0x12 },   // $
//    9     { 0x00, 0x62, 0x64, 0x08, 0x13, 0x23 },   // %
//   10     { 0x00, 0x36, 0x49, 0x55, 0x22, 0x50 },   // &
//   11     { 0x00, 0x00, 0x05, 0x03, 0x00, 0x00 },   // '
//   12     { 0x00, 0x00, 0x1c, 0x22, 0x41, 0x00 },   // (
//   13     { 0x00, 0x00, 0x41, 0x22, 0x1c, 0x00 },   // )
//   14     { 0x00, 0x14, 0x08, 0x3E, 0x08, 0x14 },   // *
//   15     { 0x00, 0x08, 0x08, 0x3E, 0x08, 0x08 },   // +
//   16     { 0x00, 0x00, 0x00, 0xA0, 0x60, 0x00 },   // ,
//   17     { 0x00, 0x08, 0x08, 0x08, 0x08, 0x08 },   // -
//   18     { 0x00, 0x00, 0x60, 0x60, 0x00, 0x00 },   // .
//   19     { 0x00, 0x20, 0x10, 0x08, 0x04, 0x02 },   // /
//   20     { 0x00, 0x3E, 0x51, 0x49, 0x45, 0x3E },   // 0
//   21     { 0x00, 0x00, 0x42, 0x7F, 0x40, 0x00 },   // 1
//   22     { 0x00, 0x42, 0x61, 0x51, 0x49, 0x46 },   // 2
//   23     { 0x00, 0x21, 0x41, 0x45, 0x4B, 0x31 },   // 3
//   24     { 0x00, 0x18, 0x14, 0x12, 0x7F, 0x10 },   // 4
//   25     { 0x00, 0x27, 0x45, 0x45, 0x45, 0x39 },   // 5
//   26     { 0x00, 0x3C, 0x4A, 0x49, 0x49, 0x30 },   // 6
//   27     { 0x00, 0x01, 0x71, 0x09, 0x05, 0x03 },   // 7
//   28     { 0x00, 0x36, 0x49, 0x49, 0x49, 0x36 },   // 8
//   29     { 0x00, 0x06, 0x49, 0x49, 0x29, 0x1E },   // 9
//   30     { 0x00, 0x00, 0x36, 0x36, 0x00, 0x00 },   // :
//   31     { 0x00, 0x00, 0x56, 0x36, 0x00, 0x00 },   // ;
//   32     { 0x00, 0x08, 0x14, 0x22, 0x41, 0x00 },   // <
//   33     { 0x00, 0x14, 0x14, 0x14, 0x14, 0x14 },   // =
//   34     { 0x00, 0x00, 0x41, 0x22, 0x14, 0x08 },   // >
//   35     { 0x00, 0x02, 0x01, 0x51, 0x09, 0x06 },   // ?
//   36     { 0x00, 0x32, 0x49, 0x59, 0x51, 0x3E },   // @
//   37     { 0x00, 0x7C, 0x12, 0x11, 0x12, 0x7C },   // A
//   38     { 0x00, 0x7F, 0x49, 0x49, 0x49, 0x36 },   // B
//   39     { 0x00, 0x3E, 0x41, 0x41, 0x41, 0x22 },   // C
//   40     { 0x00, 0x7F, 0x41, 0x41, 0x22, 0x1C },   // D
//   41     { 0x00, 0x7F, 0x49, 0x49, 0x49, 0x41 },   // E
//   42     { 0x00, 0x7F, 0x09, 0x09, 0x09, 0x01 },   // F
//   43     { 0x00, 0x3E, 0x41, 0x49, 0x49, 0x7A },   // G
//   44     { 0x00, 0x7F, 0x08, 0x08, 0x08, 0x7F },   // H
//   45     { 0x00, 0x00, 0x41, 0x7F, 0x41, 0x00 },   // I
//   46     { 0x00, 0x20, 0x40, 0x41, 0x3F, 0x01 },   // J
//   47     { 0x00, 0x7F, 0x08, 0x14, 0x22, 0x41 },   // K
//   48     { 0x00, 0x7F, 0x40, 0x40, 0x40, 0x40 },   // L
//   49     { 0x00, 0x7F, 0x02, 0x0C, 0x02, 0x7F },   // M
//   50     { 0x00, 0x7F, 0x04, 0x08, 0x10, 0x7F },   // N
//   51     { 0x00, 0x3E, 0x41, 0x41, 0x41, 0x3E },   // O
//   52     { 0x00, 0x7F, 0x09, 0x09, 0x09, 0x06 },   // P
//   53     { 0x00, 0x3E, 0x41, 0x51, 0x21, 0x5E },   // Q
//   54     { 0x00, 0x7F, 0x09, 0x19, 0x29, 0x46 },   // R
//   55     { 0x00, 0x46, 0x49, 0x49, 0x49, 0x31 },   // S
//   56     { 0x00, 0x01, 0x01, 0x7F, 0x01, 0x01 },   // T
//   57     { 0x00, 0x3F, 0x40, 0x40, 0x40, 0x3F },   // U
//   58     { 0x00, 0x1F, 0x20, 0x40, 0x20, 0x1F },   // V
//   59     { 0x00, 0x3F, 0x40, 0x38, 0x40, 0x3F },   // W
//   60     { 0x00, 0x63, 0x14, 0x08, 0x14, 0x63 },   // X
//   61     { 0x00, 0x07, 0x08, 0x70, 0x08, 0x07 },   // Y
//   62     { 0x00, 0x61, 0x51, 0x49, 0x45, 0x43 },   // Z
//   63     { 0x00, 0x00, 0x7F, 0x41, 0x41, 0x00 },   // [
//   64     { 0x00, 0x55, 0x2A, 0x55, 0x2A, 0x55 },   // 55
//   65     { 0x00, 0x00, 0x41, 0x41, 0x7F, 0x00 },   // ]
//   66     { 0x00, 0x04, 0x02, 0x01, 0x02, 0x04 },   // ^
//   67     { 0x00, 0x40, 0x40, 0x40, 0x40, 0x40 },   // _
//   68     { 0x00, 0x00, 0x01, 0x02, 0x04, 0x00 },   // '
//   69     { 0x00, 0x20, 0x54, 0x54, 0x54, 0x78 },   // a
//   70     { 0x00, 0x7F, 0x48, 0x44, 0x44, 0x38 },   // b
//   71     { 0x00, 0x38, 0x44, 0x44, 0x44, 0x20 },   // c
//   72     { 0x00, 0x38, 0x44, 0x44, 0x48, 0x7F },   // d
//   73     { 0x00, 0x38, 0x54, 0x54, 0x54, 0x18 },   // e
//   74     { 0x00, 0x08, 0x7E, 0x09, 0x01, 0x02 },   // f
//   75     { 0x00, 0x18, 0xA4, 0xA4, 0xA4, 0x7C },   // g
//   76     { 0x00, 0x7F, 0x08, 0x04, 0x04, 0x78 },   // h
//   77     { 0x00, 0x00, 0x44, 0x7D, 0x40, 0x00 },   // i
//   78     { 0x00, 0x40, 0x80, 0x84, 0x7D, 0x00 },   // j
//   79     { 0x00, 0x7F, 0x10, 0x28, 0x44, 0x00 },   // k
//   80     { 0x00, 0x00, 0x41, 0x7F, 0x40, 0x00 },   // l
//   81     { 0x00, 0x7C, 0x04, 0x18, 0x04, 0x78 },   // m
//   82     { 0x00, 0x7C, 0x08, 0x04, 0x04, 0x78 },   // n
//   83     { 0x00, 0x38, 0x44, 0x44, 0x44, 0x38 },   // o
//   84     { 0x00, 0xFC, 0x24, 0x24, 0x24, 0x18 },   // p
//   85     { 0x00, 0x18, 0x24, 0x24, 0x18, 0xFC },   // q
//   86     { 0x00, 0x7C, 0x08, 0x04, 0x04, 0x08 },   // r
//   87     { 0x00, 0x48, 0x54, 0x54, 0x54, 0x20 },   // s
//   88     { 0x00, 0x04, 0x3F, 0x44, 0x40, 0x20 },   // t
//   89     { 0x00, 0x3C, 0x40, 0x40, 0x20, 0x7C },   // u
//   90     { 0x00, 0x1C, 0x20, 0x40, 0x20, 0x1C },   // v
//   91     { 0x00, 0x3C, 0x40, 0x30, 0x40, 0x3C },   // w
//   92     { 0x00, 0x44, 0x28, 0x10, 0x28, 0x44 },   // x
//   93     { 0x00, 0x1C, 0xA0, 0xA0, 0xA0, 0x7C },   // y
//   94     { 0x00, 0x44, 0x64, 0x54, 0x4C, 0x44 },   // z
//   95     { 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 }    // horiz lines
//   96 };
//   97 //======================================================
//   98 // 128X64I液晶底层驱动[8X16]字体库
//   99 // 设计者: powerint
//  100 // 描  述: [8X16]西文字符的字模数据 (纵向取模,字节倒序)
//  101 // !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
//  102 //======================================================

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//  103 const unsigned char F8X16[]=
F8X16:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 248, 0, 0
        DC8 0, 0, 0, 0, 0, 51, 48, 0, 0, 0, 0, 16, 12, 6, 16, 12, 6, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 64, 192, 120, 64, 192, 120, 64, 0, 4, 63, 4, 4, 63
        DC8 4, 4, 0, 0, 112, 136, 252, 8, 48, 0, 0, 0, 24, 32, 255, 33, 30, 0
        DC8 0, 240, 8, 240, 0, 224, 24, 0, 0, 0, 33, 28, 3, 30, 33, 30, 0, 0
        DC8 240, 8, 136, 112, 0, 0, 0, 30, 33, 35, 36, 25, 39, 33, 16, 16, 22
        DC8 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 24, 4, 2
        DC8 0, 0, 0, 0, 7, 24, 32, 64, 0, 0, 2, 4, 24, 224, 0, 0, 0, 0, 64, 32
        DC8 24, 7, 0, 0, 0, 64, 64, 128, 240, 128, 64, 64, 0, 2, 2, 1, 15, 1, 2
        DC8 2, 0, 0, 0, 0, 240, 0, 0, 0, 0, 1, 1, 1, 31, 1, 1, 1, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 128, 176, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 48, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 128, 96, 24, 4, 0, 96, 24, 6, 1, 0, 0, 0, 0, 224, 16
        DC8 8, 8, 16, 224, 0, 0, 15, 16, 32, 32, 16, 15, 0, 0, 16, 16, 248, 0
        DC8 0, 0, 0, 0, 32, 32, 63, 32, 32, 0, 0, 0, 112, 8, 8, 8, 136, 112, 0
        DC8 0, 48, 40, 36, 34, 33, 48, 0, 0, 48, 8, 136, 136, 72, 48, 0, 0, 24
        DC8 32, 32, 32, 17, 14, 0, 0, 0, 192, 32, 16, 248, 0, 0, 0, 7, 4, 36
        DC8 36, 63, 36, 0, 0, 248, 8, 136, 136, 8, 8, 0, 0, 25, 33, 32, 32, 17
        DC8 14, 0, 0, 224, 16, 136, 136, 24, 0, 0, 0, 15, 17, 32, 32, 17, 14, 0
        DC8 0, 56, 8, 8, 200, 56, 8, 0, 0, 0, 0, 63, 0, 0, 0, 0, 0, 112, 136, 8
        DC8 8, 136, 112, 0, 0, 28, 34, 33, 33, 34, 28, 0, 0, 224, 16, 8, 8, 16
        DC8 224, 0, 0, 0, 49, 34, 34, 17, 15, 0, 0, 0, 0, 192, 192, 0, 0, 0, 0
        DC8 0, 0, 48, 48, 0, 0, 0, 0, 0, 0, 128, 0, 0, 0, 0, 0, 0, 128, 96, 0
        DC8 0, 0, 0, 0, 0, 128, 64, 32, 16, 8, 0, 0, 1, 2, 4, 8, 16, 32, 0, 64
        DC8 64, 64, 64, 64, 64, 64, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 8, 16, 32, 64
        DC8 128, 0, 0, 0, 32, 16, 8, 4, 2, 1, 0, 0, 112, 72, 8, 8, 8, 240, 0, 0
        DC8 0, 0, 48, 54, 1, 0, 0, 192, 48, 200, 40, 232, 16, 224, 0, 7, 24, 39
        DC8 36, 35, 20, 11, 0, 0, 0, 192, 56, 224, 0, 0, 0, 32, 60, 35, 2, 2
        DC8 39, 56, 32, 8, 248, 136, 136, 136, 112, 0, 0, 32, 63, 32, 32, 32
        DC8 17, 14, 0, 192, 48, 8, 8, 8, 8, 56, 0, 7, 24, 32, 32, 32, 16, 8, 0
        DC8 8, 248, 8, 8, 8, 16, 224, 0, 32, 63, 32, 32, 32, 16, 15, 0, 8, 248
        DC8 136, 136, 232, 8, 16, 0, 32, 63, 32, 32, 35, 32, 24, 0, 8, 248, 136
        DC8 136, 232, 8, 16, 0, 32, 63, 32, 0, 3, 0, 0, 0, 192, 48, 8, 8, 8, 56
        DC8 0, 0, 7, 24, 32, 32, 34, 30, 2, 0, 8, 248, 8, 0, 0, 8, 248, 8, 32
        DC8 63, 33, 1, 1, 33, 63, 32, 0, 8, 8, 248, 8, 8, 0, 0, 0, 32, 32, 63
        DC8 32, 32, 0, 0, 0, 0, 8, 8, 248, 8, 8, 0, 192, 128, 128, 128, 127, 0
        DC8 0, 0, 8, 248, 136, 192, 40, 24, 8, 0, 32, 63, 32, 1, 38, 56, 32, 0
        DC8 8, 248, 8, 0, 0, 0, 0, 0, 32, 63, 32, 32, 32, 32, 48, 0, 8, 248
        DC8 248, 0, 248, 248, 8, 0, 32, 63, 0, 63, 0, 63, 32, 0, 8, 248, 48
        DC8 192, 0, 8, 248, 8, 32, 63, 32, 0, 7, 24, 63, 0, 224, 16, 8, 8, 8
        DC8 16, 224, 0, 15, 16, 32, 32, 32, 16, 15, 0, 8, 248, 8, 8, 8, 8, 240
        DC8 0, 32, 63, 33, 1, 1, 1, 0, 0, 224, 16, 8, 8, 8, 16, 224, 0, 15, 24
        DC8 36, 36, 56, 80, 79, 0, 8, 248, 136, 136, 136, 136, 112, 0, 32, 63
        DC8 32, 0, 3, 12, 48, 32, 0, 112, 136, 8, 8, 8, 56, 0, 0, 56, 32, 33
        DC8 33, 34, 28, 0, 24, 8, 8, 248, 8, 8, 24, 0, 0, 0, 32, 63, 32, 0, 0
        DC8 0, 8, 248, 8, 0, 0, 8, 248, 8, 0, 31, 32, 32, 32, 32, 31, 0, 8, 120
        DC8 136, 0, 0, 200, 56, 8, 0, 0, 7, 56, 14, 1, 0, 0, 248, 8, 0, 248, 0
        DC8 8, 248, 0, 3, 60, 7, 0, 7, 60, 3, 0, 8, 24, 104, 128, 128, 104, 24
        DC8 8, 32, 48, 44, 3, 3, 44, 48, 32, 8, 56, 200, 0, 200, 56, 8, 0, 0, 0
        DC8 32, 63, 32, 0, 0, 0, 16, 8, 8, 8, 200, 56, 8, 0, 32, 56, 38, 33, 32
        DC8 32, 24, 0, 0, 0, 0, 254, 2, 2, 2, 0, 0, 0, 0, 127, 64, 64, 64, 0, 0
        DC8 12, 48, 192, 0, 0, 0, 0, 0, 0, 0, 1, 6, 56, 192, 0, 0, 2, 2, 2, 254
        DC8 0, 0, 0, 0, 64, 64, 64, 127, 0, 0, 0, 0, 0, 4, 2, 2, 2, 4, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128, 128, 128
        DC8 128, 128, 128, 0, 2, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 128, 128, 128, 128, 0, 0, 0, 25, 36, 34, 34, 34, 63, 32, 8, 248, 0
        DC8 128, 128, 0, 0, 0, 0, 63, 17, 32, 32, 17, 14, 0, 0, 0, 0, 128, 128
        DC8 128, 0, 0, 0, 14, 17, 32, 32, 32, 17, 0, 0, 0, 0, 128, 128, 136
        DC8 248, 0, 0, 14, 17, 32, 32, 16, 63, 32, 0, 0, 128, 128, 128, 128, 0
        DC8 0, 0, 31, 34, 34, 34, 34, 19, 0, 0, 128, 128, 240, 136, 136, 136
        DC8 24, 0, 32, 32, 63, 32, 32, 0, 0, 0, 0, 128, 128, 128, 128, 128, 0
        DC8 0, 107, 148, 148, 148, 147, 96, 0, 8, 248, 0, 128, 128, 128, 0, 0
        DC8 32, 63, 33, 0, 0, 32, 63, 32, 0, 128, 152, 152, 0, 0, 0, 0, 0, 32
        DC8 32, 63, 32, 32, 0, 0, 0, 0, 0, 128, 152, 152, 0, 0, 0, 192, 128
        DC8 128, 128, 127, 0, 0, 8, 248, 0, 0, 128, 128, 128, 0, 32, 63, 36, 2
        DC8 45, 48, 32, 0, 0, 8, 8, 248, 0, 0, 0, 0, 0, 32, 32, 63, 32, 32, 0
        DC8 0, 128, 128, 128, 128, 128, 128, 128, 0, 32, 63, 32, 0, 63, 32, 0
        DC8 63, 128, 128, 0, 128, 128, 128, 0, 0, 32, 63, 33, 0, 0, 32, 63, 32
        DC8 0, 0, 128, 128, 128, 128, 0, 0, 0, 31, 32, 32, 32, 32, 31, 0, 128
        DC8 128, 0, 128, 128, 0, 0, 0, 128, 255, 161, 32, 32, 17, 14, 0, 0, 0
        DC8 0, 128, 128, 128, 128, 0, 0, 14, 17, 32, 32, 160, 255, 128, 128
        DC8 128, 128, 0, 128, 128, 128, 0, 32, 32, 63, 33, 32, 0, 1, 0, 0, 0
        DC8 128, 128, 128, 128, 128, 0, 0, 51, 36, 36, 36, 36, 25, 0, 0, 128
        DC8 128, 224, 128, 128, 0, 0, 0, 0, 0, 31, 32, 32, 0, 0, 128, 128, 0, 0
        DC8 0, 128, 128, 0, 0, 31, 32, 32, 32, 16, 63, 32, 128, 128, 128, 0, 0
        DC8 128, 128, 128, 0, 1, 14, 48, 8, 6, 1, 0, 128, 128, 0, 128, 0, 128
        DC8 128, 128, 15, 48, 12, 3, 12, 48, 15, 0, 0, 128, 128, 0, 128, 128
        DC8 128, 0, 0, 32, 49, 46, 14, 49, 32, 0, 128, 128, 128, 0, 0, 128, 128
        DC8 128, 128, 129, 142, 112, 24, 6, 1, 0, 0, 128, 128, 128, 128, 128
        DC8 128, 0, 0, 33, 48, 44, 34, 33, 48, 0, 0, 0, 0, 0, 128, 124, 2, 2, 0
        DC8 0, 0, 0, 0, 63, 64, 64, 0, 0, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 255
        DC8 0, 0, 0, 0, 2, 2, 124, 128, 0, 0, 0, 0, 64, 64, 63, 0, 0, 0, 0, 0
        DC8 6, 1, 1, 2, 2, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0
//  104 {
//  105   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,// 0
//  106   0x00,0x00,0x00,0xF8,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x33,0x30,0x00,0x00,0x00,//!1
//  107   0x00,0x10,0x0C,0x06,0x10,0x0C,0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//"2
//  108   0x40,0xC0,0x78,0x40,0xC0,0x78,0x40,0x00,0x04,0x3F,0x04,0x04,0x3F,0x04,0x04,0x00,//#3
//  109   0x00,0x70,0x88,0xFC,0x08,0x30,0x00,0x00,0x00,0x18,0x20,0xFF,0x21,0x1E,0x00,0x00,//$4
//  110   0xF0,0x08,0xF0,0x00,0xE0,0x18,0x00,0x00,0x00,0x21,0x1C,0x03,0x1E,0x21,0x1E,0x00,//%5
//  111   0x00,0xF0,0x08,0x88,0x70,0x00,0x00,0x00,0x1E,0x21,0x23,0x24,0x19,0x27,0x21,0x10,//&6
//  112   0x10,0x16,0x0E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//'7
//  113   0x00,0x00,0x00,0xE0,0x18,0x04,0x02,0x00,0x00,0x00,0x00,0x07,0x18,0x20,0x40,0x00,//(8
//  114   0x00,0x02,0x04,0x18,0xE0,0x00,0x00,0x00,0x00,0x40,0x20,0x18,0x07,0x00,0x00,0x00,//)9
//  115   0x40,0x40,0x80,0xF0,0x80,0x40,0x40,0x00,0x02,0x02,0x01,0x0F,0x01,0x02,0x02,0x00,//*10
//  116   0x00,0x00,0x00,0xF0,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x1F,0x01,0x01,0x01,0x00,//+11
//  117   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0xB0,0x70,0x00,0x00,0x00,0x00,0x00,//,12
//  118   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x01,//-13
//  119   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x30,0x00,0x00,0x00,0x00,0x00,//.14
//  120   0x00,0x00,0x00,0x00,0x80,0x60,0x18,0x04,0x00,0x60,0x18,0x06,0x01,0x00,0x00,0x00,///15
//  121   0x00,0xE0,0x10,0x08,0x08,0x10,0xE0,0x00,0x00,0x0F,0x10,0x20,0x20,0x10,0x0F,0x00,//016
//  122   0x00,0x10,0x10,0xF8,0x00,0x00,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//117
//  123   0x00,0x70,0x08,0x08,0x08,0x88,0x70,0x00,0x00,0x30,0x28,0x24,0x22,0x21,0x30,0x00,//218
//  124   0x00,0x30,0x08,0x88,0x88,0x48,0x30,0x00,0x00,0x18,0x20,0x20,0x20,0x11,0x0E,0x00,//319
//  125   0x00,0x00,0xC0,0x20,0x10,0xF8,0x00,0x00,0x00,0x07,0x04,0x24,0x24,0x3F,0x24,0x00,//420
//  126   0x00,0xF8,0x08,0x88,0x88,0x08,0x08,0x00,0x00,0x19,0x21,0x20,0x20,0x11,0x0E,0x00,//521
//  127   0x00,0xE0,0x10,0x88,0x88,0x18,0x00,0x00,0x00,0x0F,0x11,0x20,0x20,0x11,0x0E,0x00,//622
//  128   0x00,0x38,0x08,0x08,0xC8,0x38,0x08,0x00,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x00,//723
//  129   0x00,0x70,0x88,0x08,0x08,0x88,0x70,0x00,0x00,0x1C,0x22,0x21,0x21,0x22,0x1C,0x00,//824
//  130   0x00,0xE0,0x10,0x08,0x08,0x10,0xE0,0x00,0x00,0x00,0x31,0x22,0x22,0x11,0x0F,0x00,//925
//  131   0x00,0x00,0x00,0xC0,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x30,0x00,0x00,0x00,//:26
//  132   0x00,0x00,0x00,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x60,0x00,0x00,0x00,0x00,//;27
//  133   0x00,0x00,0x80,0x40,0x20,0x10,0x08,0x00,0x00,0x01,0x02,0x04,0x08,0x10,0x20,0x00,//<28
//  134   0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x00,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x00,//=29
//  135   0x00,0x08,0x10,0x20,0x40,0x80,0x00,0x00,0x00,0x20,0x10,0x08,0x04,0x02,0x01,0x00,//>30
//  136   0x00,0x70,0x48,0x08,0x08,0x08,0xF0,0x00,0x00,0x00,0x00,0x30,0x36,0x01,0x00,0x00,//?31
//  137   0xC0,0x30,0xC8,0x28,0xE8,0x10,0xE0,0x00,0x07,0x18,0x27,0x24,0x23,0x14,0x0B,0x00,//@32
//  138   0x00,0x00,0xC0,0x38,0xE0,0x00,0x00,0x00,0x20,0x3C,0x23,0x02,0x02,0x27,0x38,0x20,//A33
//  139   0x08,0xF8,0x88,0x88,0x88,0x70,0x00,0x00,0x20,0x3F,0x20,0x20,0x20,0x11,0x0E,0x00,//B34
//  140   0xC0,0x30,0x08,0x08,0x08,0x08,0x38,0x00,0x07,0x18,0x20,0x20,0x20,0x10,0x08,0x00,//C35
//  141   0x08,0xF8,0x08,0x08,0x08,0x10,0xE0,0x00,0x20,0x3F,0x20,0x20,0x20,0x10,0x0F,0x00,//D36
//  142   0x08,0xF8,0x88,0x88,0xE8,0x08,0x10,0x00,0x20,0x3F,0x20,0x20,0x23,0x20,0x18,0x00,//E37
//  143   0x08,0xF8,0x88,0x88,0xE8,0x08,0x10,0x00,0x20,0x3F,0x20,0x00,0x03,0x00,0x00,0x00,//F38
//  144   0xC0,0x30,0x08,0x08,0x08,0x38,0x00,0x00,0x07,0x18,0x20,0x20,0x22,0x1E,0x02,0x00,//G39
//  145   0x08,0xF8,0x08,0x00,0x00,0x08,0xF8,0x08,0x20,0x3F,0x21,0x01,0x01,0x21,0x3F,0x20,//H40
//  146   0x00,0x08,0x08,0xF8,0x08,0x08,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//I41
//  147   0x00,0x00,0x08,0x08,0xF8,0x08,0x08,0x00,0xC0,0x80,0x80,0x80,0x7F,0x00,0x00,0x00,//J42
//  148   0x08,0xF8,0x88,0xC0,0x28,0x18,0x08,0x00,0x20,0x3F,0x20,0x01,0x26,0x38,0x20,0x00,//K43
//  149   0x08,0xF8,0x08,0x00,0x00,0x00,0x00,0x00,0x20,0x3F,0x20,0x20,0x20,0x20,0x30,0x00,//L44
//  150   0x08,0xF8,0xF8,0x00,0xF8,0xF8,0x08,0x00,0x20,0x3F,0x00,0x3F,0x00,0x3F,0x20,0x00,//M45
//  151   0x08,0xF8,0x30,0xC0,0x00,0x08,0xF8,0x08,0x20,0x3F,0x20,0x00,0x07,0x18,0x3F,0x00,//N46
//  152   0xE0,0x10,0x08,0x08,0x08,0x10,0xE0,0x00,0x0F,0x10,0x20,0x20,0x20,0x10,0x0F,0x00,//O47
//  153   0x08,0xF8,0x08,0x08,0x08,0x08,0xF0,0x00,0x20,0x3F,0x21,0x01,0x01,0x01,0x00,0x00,//P48
//  154   0xE0,0x10,0x08,0x08,0x08,0x10,0xE0,0x00,0x0F,0x18,0x24,0x24,0x38,0x50,0x4F,0x00,//Q49
//  155   0x08,0xF8,0x88,0x88,0x88,0x88,0x70,0x00,0x20,0x3F,0x20,0x00,0x03,0x0C,0x30,0x20,//R50
//  156   0x00,0x70,0x88,0x08,0x08,0x08,0x38,0x00,0x00,0x38,0x20,0x21,0x21,0x22,0x1C,0x00,//S51
//  157   0x18,0x08,0x08,0xF8,0x08,0x08,0x18,0x00,0x00,0x00,0x20,0x3F,0x20,0x00,0x00,0x00,//T52
//  158   0x08,0xF8,0x08,0x00,0x00,0x08,0xF8,0x08,0x00,0x1F,0x20,0x20,0x20,0x20,0x1F,0x00,//U53
//  159   0x08,0x78,0x88,0x00,0x00,0xC8,0x38,0x08,0x00,0x00,0x07,0x38,0x0E,0x01,0x00,0x00,//V54
//  160   0xF8,0x08,0x00,0xF8,0x00,0x08,0xF8,0x00,0x03,0x3C,0x07,0x00,0x07,0x3C,0x03,0x00,//W55
//  161   0x08,0x18,0x68,0x80,0x80,0x68,0x18,0x08,0x20,0x30,0x2C,0x03,0x03,0x2C,0x30,0x20,//X56
//  162   0x08,0x38,0xC8,0x00,0xC8,0x38,0x08,0x00,0x00,0x00,0x20,0x3F,0x20,0x00,0x00,0x00,//Y57
//  163   0x10,0x08,0x08,0x08,0xC8,0x38,0x08,0x00,0x20,0x38,0x26,0x21,0x20,0x20,0x18,0x00,//Z58
//  164   0x00,0x00,0x00,0xFE,0x02,0x02,0x02,0x00,0x00,0x00,0x00,0x7F,0x40,0x40,0x40,0x00,//[59
//  165   0x00,0x0C,0x30,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x06,0x38,0xC0,0x00,//\60
//  166   0x00,0x02,0x02,0x02,0xFE,0x00,0x00,0x00,0x00,0x40,0x40,0x40,0x7F,0x00,0x00,0x00,//]61
//  167   0x00,0x00,0x04,0x02,0x02,0x02,0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//^62
//  168   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,//_63
//  169   0x00,0x02,0x02,0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//`64
//  170   0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x19,0x24,0x22,0x22,0x22,0x3F,0x20,//a65
//  171   0x08,0xF8,0x00,0x80,0x80,0x00,0x00,0x00,0x00,0x3F,0x11,0x20,0x20,0x11,0x0E,0x00,//b66
//  172   0x00,0x00,0x00,0x80,0x80,0x80,0x00,0x00,0x00,0x0E,0x11,0x20,0x20,0x20,0x11,0x00,//c67
//  173   0x00,0x00,0x00,0x80,0x80,0x88,0xF8,0x00,0x00,0x0E,0x11,0x20,0x20,0x10,0x3F,0x20,//d68
//  174   0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x1F,0x22,0x22,0x22,0x22,0x13,0x00,//e69
//  175   0x00,0x80,0x80,0xF0,0x88,0x88,0x88,0x18,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//f70
//  176   0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x6B,0x94,0x94,0x94,0x93,0x60,0x00,//g71
//  177   0x08,0xF8,0x00,0x80,0x80,0x80,0x00,0x00,0x20,0x3F,0x21,0x00,0x00,0x20,0x3F,0x20,//h72
//  178   0x00,0x80,0x98,0x98,0x00,0x00,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//i73
//  179   0x00,0x00,0x00,0x80,0x98,0x98,0x00,0x00,0x00,0xC0,0x80,0x80,0x80,0x7F,0x00,0x00,//j74
//  180   0x08,0xF8,0x00,0x00,0x80,0x80,0x80,0x00,0x20,0x3F,0x24,0x02,0x2D,0x30,0x20,0x00,//k75
//  181   0x00,0x08,0x08,0xF8,0x00,0x00,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//l76
//  182   0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x20,0x3F,0x20,0x00,0x3F,0x20,0x00,0x3F,//m77
//  183   0x80,0x80,0x00,0x80,0x80,0x80,0x00,0x00,0x20,0x3F,0x21,0x00,0x00,0x20,0x3F,0x20,//n78
//  184   0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x1F,0x20,0x20,0x20,0x20,0x1F,0x00,//o79
//  185   0x80,0x80,0x00,0x80,0x80,0x00,0x00,0x00,0x80,0xFF,0xA1,0x20,0x20,0x11,0x0E,0x00,//p80
//  186   0x00,0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x0E,0x11,0x20,0x20,0xA0,0xFF,0x80,//q81
//  187   0x80,0x80,0x80,0x00,0x80,0x80,0x80,0x00,0x20,0x20,0x3F,0x21,0x20,0x00,0x01,0x00,//r82
//  188   0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x33,0x24,0x24,0x24,0x24,0x19,0x00,//s83
//  189   0x00,0x80,0x80,0xE0,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x1F,0x20,0x20,0x00,0x00,//t84
//  190   0x80,0x80,0x00,0x00,0x00,0x80,0x80,0x00,0x00,0x1F,0x20,0x20,0x20,0x10,0x3F,0x20,//u85
//  191   0x80,0x80,0x80,0x00,0x00,0x80,0x80,0x80,0x00,0x01,0x0E,0x30,0x08,0x06,0x01,0x00,//v86
//  192   0x80,0x80,0x00,0x80,0x00,0x80,0x80,0x80,0x0F,0x30,0x0C,0x03,0x0C,0x30,0x0F,0x00,//w87
//  193   0x00,0x80,0x80,0x00,0x80,0x80,0x80,0x00,0x00,0x20,0x31,0x2E,0x0E,0x31,0x20,0x00,//x88
//  194   0x80,0x80,0x80,0x00,0x00,0x80,0x80,0x80,0x80,0x81,0x8E,0x70,0x18,0x06,0x01,0x00,//y89
//  195   0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x21,0x30,0x2C,0x22,0x21,0x30,0x00,//z90
//  196   0x00,0x00,0x00,0x00,0x80,0x7C,0x02,0x02,0x00,0x00,0x00,0x00,0x00,0x3F,0x40,0x40,//{91
//  197   0x00,0x00,0x00,0x00,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0x00,0x00,0x00,//|92
//  198   0x00,0x02,0x02,0x7C,0x80,0x00,0x00,0x00,0x00,0x40,0x40,0x3F,0x00,0x00,0x00,0x00,//}93
//  199   0x00,0x06,0x01,0x01,0x02,0x02,0x04,0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//~94
//  200 
//  201 };
//  202 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function LCD_WrDat
        THUMB
//  203 void LCD_WrDat(uint8 data)
//  204  {
LCD_WrDat:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  205      uint8 i=8;
        MOVS     R5,#+8
//  206      DC_set;
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  207      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  208      D0_clear;
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  209      SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  210      while(i--)
??LCD_WrDat_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??LCD_WrDat_1
//  211       {
//  212           if(data&0x80) D1_set;
        LSLS     R0,R4,#+24
        BPL.N    ??LCD_WrDat_2
        MOVS     R2,#+1
        MOVS     R1,#+2
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
        B.N      ??LCD_WrDat_3
//  213           else D1_clear;
??LCD_WrDat_2:
        MOVS     R2,#+0
        MOVS     R1,#+2
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  214           D0_set;
??LCD_WrDat_3:
        MOVS     R2,#+1
        MOVS     R1,#+3
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  215           SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  216           D0_clear;
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  217           data<<=1;
        LSLS     R4,R4,#+1
        B.N      ??LCD_WrDat_0
//  218       }
//  219  }
??LCD_WrDat_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock0
//  220 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function LCD_WrCmd
        THUMB
//  221 void LCD_WrCmd(uint8 cmd)
//  222  {
LCD_WrCmd:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  223      uint8 i=8;
        MOVS     R5,#+8
//  224      DC_clear;
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  225       SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  226      D0_clear;
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  227       SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  228      while(i--)
??LCD_WrCmd_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??LCD_WrCmd_1
//  229       {
//  230           if(cmd&0x80) D1_set;
        LSLS     R0,R4,#+24
        BPL.N    ??LCD_WrCmd_2
        MOVS     R2,#+1
        MOVS     R1,#+2
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
        B.N      ??LCD_WrCmd_3
//  231           else D1_clear;
??LCD_WrCmd_2:
        MOVS     R2,#+0
        MOVS     R1,#+2
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  232       D0_set;
??LCD_WrCmd_3:
        MOVS     R2,#+1
        MOVS     R1,#+3
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  233       SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  234       D0_clear;
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  235       cmd<<=1;
        LSLS     R4,R4,#+1
//  236       SYSDelay_us(1);
        MOVS     R0,#+1
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
        B.N      ??LCD_WrCmd_0
//  237       }
//  238  }
??LCD_WrCmd_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock1
//  239 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function LCD_Set_Pos
        THUMB
//  240 void LCD_Set_Pos(uint8 x, uint8 y)
//  241 { 
LCD_Set_Pos:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  242   LCD_WrCmd(0xb0+y);
        SUBS     R0,R5,#+80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  243   LCD_WrCmd(((x&0xf0)>>4)|0x10);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSRS     R0,R4,#+4
        ORRS     R0,R0,#0x10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  244   LCD_WrCmd(x&0x0f);//|0x01);
        ANDS     R0,R4,#0xF
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  245 } 
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock2
//  246 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function LCD_Fill
        THUMB
//  247 void LCD_Fill(uint8 bmp_data)
//  248 {
LCD_Fill:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
//  249 	uint8 y,x;
//  250 	
//  251 	for(y=0;y<8;y++)
        MOVS     R0,#+0
        MOVS     R5,R0
??LCD_Fill_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??LCD_Fill_1
//  252 	{
//  253 		LCD_WrCmd(0xb0+y);
        SUBS     R0,R5,#+80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  254 		LCD_WrCmd(0x01);
        MOVS     R0,#+1
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  255 		LCD_WrCmd(0x10);
        MOVS     R0,#+16
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  256 		for(x=0;x<X_WIDTH;x++)
        MOVS     R0,#+0
        MOVS     R6,R0
??LCD_Fill_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+128
        BGE.N    ??LCD_Fill_3
//  257 			LCD_WrDat(bmp_data);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
        ADDS     R6,R6,#+1
        B.N      ??LCD_Fill_2
//  258 	}
??LCD_Fill_3:
        ADDS     R5,R5,#+1
        B.N      ??LCD_Fill_0
//  259 }
??LCD_Fill_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function LCD_clear
        THUMB
//  260 void LCD_clear(void)
//  261 {
LCD_clear:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  262 	uint8 y,x;	
//  263 	for(y=0;y<8;y++)
        MOVS     R0,#+0
        MOVS     R4,R0
??LCD_clear_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??LCD_clear_1
//  264 	{
//  265 		LCD_WrCmd(0xb0+y);
        SUBS     R0,R4,#+80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  266 		LCD_WrCmd(0x01);
        MOVS     R0,#+1
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  267 		LCD_WrCmd(0x10); 
        MOVS     R0,#+16
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  268 		for(x=0;x<X_WIDTH;x++)
        MOVS     R0,#+0
        MOVS     R5,R0
??LCD_clear_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+128
        BGE.N    ??LCD_clear_3
//  269 			LCD_WrDat(0);
        MOVS     R0,#+0
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
        ADDS     R5,R5,#+1
        B.N      ??LCD_clear_2
//  270 	}
??LCD_clear_3:
        ADDS     R4,R4,#+1
        B.N      ??LCD_clear_0
//  271 }
??LCD_clear_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock4
//  272 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function LCD_Init
        THUMB
//  273 void LCD_Init(void)
//  274  {
LCD_Init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  275      GPIO_INIT(LCD_DC_PORT,LCD_DC_PORT_PIN,1);
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+4
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  276      GPIO_INIT(LCD_D0_PORT,LCD_D0_PORT_PIN,1);
        MOVS     R2,#+1
        MOVS     R1,#+3
        MOVS     R0,#+4
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  277      GPIO_INIT(LCD_D1_PORT,LCD_D1_PORT_PIN,1);
        MOVS     R2,#+1
        MOVS     R1,#+2
        MOVS     R0,#+4
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  278      GPIO_INIT(LCD_RESET_PORT,LCD_RESET_PORT_PIN,1);
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+4
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  279      reset_clear;
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  280      SYSDelay_ms(50);
        MOVS     R0,#+50
          CFI FunCall SYSDelay_ms
        BL       SYSDelay_ms
//  281      reset_set;
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+4
          CFI FunCall GPIO_SET
        BL       GPIO_SET
//  282   LCD_WrCmd(0xae);//--turn off oled panel
        MOVS     R0,#+174
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  283   LCD_WrCmd(0x00);//---set low column address
        MOVS     R0,#+0
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  284   LCD_WrCmd(0x10);//---set high column address
        MOVS     R0,#+16
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  285   LCD_WrCmd(0x40);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
        MOVS     R0,#+64
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  286   LCD_WrCmd(0x81);//--set contrast control register
        MOVS     R0,#+129
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  287   LCD_WrCmd(0xcf); // Set SEG Output Current Brightness
        MOVS     R0,#+207
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  288   LCD_WrCmd(0xa1);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
        MOVS     R0,#+161
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  289   LCD_WrCmd(0xc8);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
        MOVS     R0,#+200
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  290   LCD_WrCmd(0xa6);//--set normal display
        MOVS     R0,#+166
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  291   LCD_WrCmd(0xa8);//--set multiplex ratio(1 to 64)
        MOVS     R0,#+168
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  292   LCD_WrCmd(0x3f);//--1/64 duty
        MOVS     R0,#+63
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  293   LCD_WrCmd(0xd3);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
        MOVS     R0,#+211
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  294   LCD_WrCmd(0x00);//-not offset
        MOVS     R0,#+0
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  295   LCD_WrCmd(0xd5);//--set display clock divide ratio/oscillator frequency
        MOVS     R0,#+213
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  296   LCD_WrCmd(0x80);//--set divide ratio, Set Clock as 100 Frames/Sec
        MOVS     R0,#+128
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  297   LCD_WrCmd(0xd9);//--set pre-charge period
        MOVS     R0,#+217
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  298   LCD_WrCmd(0xf1);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
        MOVS     R0,#+241
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  299   LCD_WrCmd(0xda);//--set com pins hardware configuration
        MOVS     R0,#+218
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  300   LCD_WrCmd(0x12);
        MOVS     R0,#+18
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  301   LCD_WrCmd(0xdb);//--set vcomh
        MOVS     R0,#+219
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  302   LCD_WrCmd(0x40);//Set VCOM Deselect Level
        MOVS     R0,#+64
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  303   LCD_WrCmd(0x20);//-Set Page Addressing Mode (0x00/0x01/0x02)
        MOVS     R0,#+32
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  304   LCD_WrCmd(0x02);//
        MOVS     R0,#+2
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  305   LCD_WrCmd(0x8d);//--set Charge Pump enable/disable
        MOVS     R0,#+141
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  306   LCD_WrCmd(0x14);//--set(0x10) disable
        MOVS     R0,#+20
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  307   LCD_WrCmd(0xa4);// Disable Entire Display On (0xa4/0xa5)
        MOVS     R0,#+164
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  308   LCD_WrCmd(0xa6);// Disable Inverse Display On (0xa6/a7) 
        MOVS     R0,#+166
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  309   LCD_WrCmd(0xaf);//--turn on oled panel
        MOVS     R0,#+175
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  310   LCD_Fill(0x00);  //初始清屏
        MOVS     R0,#+0
          CFI FunCall LCD_Fill
        BL       LCD_Fill
//  311   LCD_Set_Pos(0,0); 
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  312  }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  313 
//  314 //==============================================================
//  315 //函数名： void LCD_PutPixel(uint8 x,uint8 y)
//  316 //功能描述：绘制一个点（x,y）
//  317 //参数：真实坐标值(x,y),x的范围0～127，y的范围0～64
//  318 //返回：无
//  319 //==============================================================

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function LCD_PutPixel
        THUMB
//  320 void LCD_PutPixel(uint8 x,uint8 y)
//  321 {
LCD_PutPixel:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  322 	uint8 data1;  //data1当前点的数据 
//  323 	 
//  324         LCD_Set_Pos(x,y); 
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  325 	data1 = 0x01<<(y%8); 	
        MOVS     R0,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+8
        SDIV     R2,R5,R1
        MLS      R2,R2,R1,R5
        LSLS     R0,R0,R2
        MOVS     R6,R0
//  326 	LCD_WrCmd(0xb0+(y>>3));
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSRS     R0,R5,#+3
        SUBS     R0,R0,#+80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  327 	LCD_WrCmd(((x&0xf0)>>4)|0x10);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSRS     R0,R4,#+4
        ORRS     R0,R0,#0x10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  328 	LCD_WrCmd((x&0x0f)|0x00);
        ANDS     R0,R4,#0xF
          CFI FunCall LCD_WrCmd
        BL       LCD_WrCmd
//  329 	LCD_WrDat(data1); 	 	
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
//  330 }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock6
//  331 //==============================================================
//  332 //函数名： void LCD_Rectangle(uint8 x1,uint8 y1,uint8 x2,uint8 y2,uint8 gif)
//  333 //功能描述：绘制一个实心矩形
//  334 //参数：左上角坐标（x1,y1）,右下角坐标（x2，y2）
//  335 //      其中x1、x2的范围0～127，y1，y2的范围0～63，即真实坐标值
//  336 //返回：无
//  337 //==============================================================

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function LCD_Rectangle
        THUMB
//  338 void LCD_Rectangle(uint8 x1,uint8 y1,uint8 x2,uint8 y2,uint8 gif)
//  339 {
LCD_Rectangle:
        PUSH     {R3-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
        LDR      R4,[SP, #+32]
//  340 	uint8 n; 
//  341 		
//  342 	LCD_Set_Pos(x1,y1>>3);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSRS     R1,R6,#+3
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  343 	for(n=x1;n<=x2;n++)
        MOV      R9,R5
??LCD_Rectangle_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R7,R9
        BCC.N    ??LCD_Rectangle_1
//  344 	{
//  345 		LCD_WrDat(0x01<<(y1%8)); 			
        MOVS     R0,#+1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R1,#+8
        SDIV     R2,R6,R1
        MLS      R2,R2,R1,R6
        LSLS     R0,R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
//  346 		if(gif == 1) 	SYSDelay_us(5);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??LCD_Rectangle_2
        MOVS     R0,#+5
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  347 	}  
??LCD_Rectangle_2:
        ADDS     R9,R9,#+1
        B.N      ??LCD_Rectangle_0
//  348 	LCD_Set_Pos(x1,y2>>3);
??LCD_Rectangle_1:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LSRS     R1,R8,#+3
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  349   for(n=x1;n<=x2;n++)
        MOV      R9,R5
??LCD_Rectangle_3:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R7,R9
        BCC.N    ??LCD_Rectangle_4
//  350 	{
//  351 		LCD_WrDat(0x01<<(y2%8)); 			
        MOVS     R0,#+1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MOVS     R1,#+8
        SDIV     R2,R8,R1
        MLS      R2,R2,R1,R8
        LSLS     R0,R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
//  352 		if(gif == 1) 	SYSDelay_us(5);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??LCD_Rectangle_5
        MOVS     R0,#+5
          CFI FunCall SYSDelay_us
        BL       SYSDelay_us
//  353 	}
??LCD_Rectangle_5:
        ADDS     R9,R9,#+1
        B.N      ??LCD_Rectangle_3
//  354 }  
??LCD_Rectangle_4:
        POP      {R0,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock7
//  355 
//  356 //==============================================================
//  357 //函数名：LCD_6x8Str(uint8 x,uint8 y,uint8 *p)
//  358 //功能描述：写入一组标准ASCII字符串
//  359 //参数：显示的位置（x,y），y为页范围0～7，要显示的字符串
//  360 //返回：无
//  361 //==============================================================  

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function LCD_6x8Str
        THUMB
//  362 void LCD_6x8Str(uint8 x,uint8 y,uint8 ch[])
//  363  {
LCD_6x8Str:
        PUSH     {R3-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        MOV      R9,R0
        MOVS     R4,R1
        MOVS     R5,R2
//  364      uint8 c=0,i=0,j=0; 
        MOVS     R6,#+0
        MOVS     R7,#+0
        MOVS     R8,#+0
//  365      x*=6;
        MOVS     R0,#+6
        SMULBB   R9,R9,R0
//  366      while (ch[j]!='\0')
??LCD_6x8Str_0:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LDRB     R0,[R8, R5]
        CMP      R0,#+0
        BEQ.N    ??LCD_6x8Str_1
//  367       {    
//  368           c =ch[j]-32;
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LDRB     R0,[R8, R5]
        SUBS     R0,R0,#+32
        MOVS     R6,R0
//  369           if(x>126){x=0;y++;}
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+127
        BLT.N    ??LCD_6x8Str_2
        MOVS     R0,#+0
        MOV      R9,R0
        ADDS     R4,R4,#+1
//  370           LCD_Set_Pos(x,y);    
??LCD_6x8Str_2:
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  371           for(i=0;i<6;i++)     
        MOVS     R0,#+0
        MOVS     R7,R0
??LCD_6x8Str_3:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+6
        BGE.N    ??LCD_6x8Str_4
//  372               LCD_WrDat(F6x8[c][i]);  
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,#+6
        LDR.N    R1,??DataTable4
        MLA      R0,R0,R6,R1
        LDRB     R0,[R7, R0]
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
        ADDS     R7,R7,#+1
        B.N      ??LCD_6x8Str_3
//  373           x+=6;
??LCD_6x8Str_4:
        ADDS     R9,R9,#+6
//  374           j++;
        ADDS     R8,R8,#+1
        B.N      ??LCD_6x8Str_0
//  375       }
//  376  }
??LCD_6x8Str_1:
        POP      {R0,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock8
//  377 //==============================================================
//  378 //LCD_6x8char(uint8 x,uint8 y,uint8 num)
//  379 //功能描述：写入一个标准ASCII字符
//  380 //参数：显示的位置（x,y），y为页范围0～7，x为20要显示的字符串
//  381 //返回：无
//  382 //==============================================================  

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function LCD_6x8char
        THUMB
//  383 void LCD_6x8char(uint8 x,uint8 y,uint8 num)
//  384  {
LCD_6x8char:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R7,R0
        MOV      R8,R1
        MOVS     R4,R2
//  385      uint8 c=0,i=0; 
        MOVS     R5,#+0
        MOVS     R6,#+0
//  386      x*=6;
        MOVS     R0,#+6
        SMULBB   R7,R7,R0
//  387      c =num-32;
        SUBS     R0,R4,#+32
        MOVS     R5,R0
//  388     if(x>126){x=0;y++;}
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+127
        BLT.N    ??LCD_6x8char_0
        MOVS     R0,#+0
        MOVS     R7,R0
        ADDS     R8,R8,#+1
//  389           LCD_Set_Pos(x,y);    
??LCD_6x8char_0:
        MOV      R1,R8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  390     for(i=0;i<6;i++)     
        MOVS     R0,#+0
        MOVS     R6,R0
??LCD_6x8char_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+6
        BGE.N    ??LCD_6x8char_2
//  391           LCD_WrDat(F6x8[c][i]);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+6
        LDR.N    R1,??DataTable4
        MLA      R0,R0,R5,R1
        LDRB     R0,[R6, R0]
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
        ADDS     R6,R6,#+1
        B.N      ??LCD_6x8char_1
//  392  }
??LCD_6x8char_2:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock9
//  393 //==============================================================
//  394 //函数名：LCD_8x16Str(uint8 x,uint8 y,uint8 *p)
//  395 //功能描述：写入一组标准ASCII字符串
//  396 //参数：显示的位置（x,y），y为页范围0～7，x为0~16要显示的字符串
//  397 //返回：无
//  398 //==============================================================  

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function LCD_8x16Str
        THUMB
//  399 void LCD_8x16Str(uint8 x,uint8 y,uint8 ch[])
//  400  {
LCD_8x16Str:
        PUSH     {R3-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        MOV      R8,R0
        MOV      R9,R1
        MOVS     R4,R2
//  401      uint8 c=0,i=0,j=0;
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R7,#+0
//  402      x*=8;
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LSLS     R8,R8,#+3
//  403      y=2*y;
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LSLS     R9,R9,#+1
//  404      while (ch[j]!='\0')
??LCD_8x16Str_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R0,[R7, R4]
        CMP      R0,#+0
        BEQ.N    ??LCD_8x16Str_1
//  405       {    
//  406           c =ch[j]-32;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R0,[R7, R4]
        SUBS     R0,R0,#+32
        MOVS     R5,R0
//  407           if(x>120){x=0;y++;}
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+121
        BLT.N    ??LCD_8x16Str_2
        MOVS     R0,#+0
        MOV      R8,R0
        ADDS     R9,R9,#+1
//  408           LCD_Set_Pos(x,y);    
??LCD_8x16Str_2:
        MOV      R1,R9
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  409           for(i=0;i<8;i++)     
        MOVS     R0,#+0
        MOVS     R6,R0
??LCD_8x16Str_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+8
        BGE.N    ??LCD_8x16Str_4
//  410               LCD_WrDat(F8X16[c*16+i]);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R0,R5,#+4
        UXTAB    R0,R0,R6
        LDR.N    R1,??DataTable4_1
        LDRB     R0,[R0, R1]
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
        ADDS     R6,R6,#+1
        B.N      ??LCD_8x16Str_3
//  411           LCD_Set_Pos(x,y+1);    
??LCD_8x16Str_4:
        ADDS     R1,R9,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  412           for(i=0;i<8;i++)     
        MOVS     R0,#+0
        MOVS     R6,R0
??LCD_8x16Str_5:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+8
        BGE.N    ??LCD_8x16Str_6
//  413               LCD_WrDat(F8X16[c*16+i+8]);  
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R0,R5,#+4
        UXTAB    R0,R0,R6
        LDR.N    R1,??DataTable4_1
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #+8]
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
        ADDS     R6,R6,#+1
        B.N      ??LCD_8x16Str_5
//  414           x+=8;
??LCD_8x16Str_6:
        ADDS     R8,R8,#+8
//  415           j++;
        ADDS     R7,R7,#+1
        B.N      ??LCD_8x16Str_0
//  416       }
//  417  }
??LCD_8x16Str_1:
        POP      {R0,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock10
//  418 //==============================================================
//  419 //void LCD_8x16char(uint8 x,uint8 y,uint8 num)
//  420 //功能描述：写入一个标准ASCII字符
//  421 //参数：显示的位置（x,y），y为页范围0～3，x为16要显示的字符串
//  422 //返回：无
//  423 //==============================================================

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function LCD_8x16char
        THUMB
//  424 void LCD_8x16char(uint8 x,uint8 y,uint8 num)
//  425  {
LCD_8x16char:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R7,R0
        MOV      R8,R1
        MOVS     R4,R2
//  426      uint8 c=0,i=0;
        MOVS     R5,#+0
        MOVS     R6,#+0
//  427      x*=8;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LSLS     R7,R7,#+3
//  428      y=2*y;   
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LSLS     R8,R8,#+1
//  429       c =num-32;
        SUBS     R0,R4,#+32
        MOVS     R5,R0
//  430           if(x>120){x=0;y++;}
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+121
        BLT.N    ??LCD_8x16char_0
        MOVS     R0,#+0
        MOVS     R7,R0
        ADDS     R8,R8,#+1
//  431           LCD_Set_Pos(x,y);    
??LCD_8x16char_0:
        MOV      R1,R8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  432           for(i=0;i<8;i++)     
        MOVS     R0,#+0
        MOVS     R6,R0
??LCD_8x16char_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+8
        BGE.N    ??LCD_8x16char_2
//  433               LCD_WrDat(F8X16[c*16+i]);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R0,R5,#+4
        UXTAB    R0,R0,R6
        LDR.N    R1,??DataTable4_1
        LDRB     R0,[R0, R1]
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
        ADDS     R6,R6,#+1
        B.N      ??LCD_8x16char_1
//  434           LCD_Set_Pos(x,y+1);    
??LCD_8x16char_2:
        ADDS     R1,R8,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  435           for(i=0;i<8;i++)     
        MOVS     R0,#+0
        MOVS     R6,R0
??LCD_8x16char_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+8
        BGE.N    ??LCD_8x16char_4
//  436               LCD_WrDat(F8X16[c*16+i+8]);  
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R0,R5,#+4
        UXTAB    R0,R0,R6
        LDR.N    R1,??DataTable4_1
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #+8]
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
        ADDS     R6,R6,#+1
        B.N      ??LCD_8x16char_3
//  437  }
??LCD_8x16char_4:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock11
//  438 //============================================================== 
//  439 //显示一个16*16的汉字
//  440 ////功能描述：写入一个汉字
//  441 //参数：显示的位置（x,y），y为页范围0～3，x为0~7要显示的汉字
//  442 //返回：无
//  443 //取模方式：纵向取模，字节倒序
//  444 //============================================================== 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function LCD_char16x16
        THUMB
//  445 void LCD_char16x16(uint8 x,uint8 y,const uint8 a[])
//  446  {
LCD_char16x16:
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
//  447      uint8 i=0;
        MOVS     R7,#+0
//  448      uint16 adder=0;
        MOVS     R8,#+0
//  449      x=16*x;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R4,R4,#+4
//  450      y=2*y;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R5,R5,#+1
//  451      LCD_Set_Pos(x , y);
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  452      for(i= 0;i < 16;i++)               
        MOVS     R0,#+0
        MOVS     R7,R0
??LCD_char16x16_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+16
        BGE.N    ??LCD_char16x16_1
//  453   		{
//  454   			LCD_WrDat(a[adder]);	
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LDRB     R0,[R8, R6]
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
//  455   			adder += 1;
        ADDS     R8,R8,#+1
//  456   		}      
        ADDS     R7,R7,#+1
        B.N      ??LCD_char16x16_0
//  457   		LCD_Set_Pos(x,y+1); 
??LCD_char16x16_1:
        ADDS     R1,R5,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  458   		for(i= 0;i < 16;i++)          
        MOVS     R0,#+0
        MOVS     R7,R0
??LCD_char16x16_2:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+16
        BGE.N    ??LCD_char16x16_3
//  459   		{
//  460   			LCD_WrDat(a[adder]);
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LDRB     R0,[R8, R6]
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
//  461   			adder += 1;
        ADDS     R8,R8,#+1
//  462   		}  
        ADDS     R7,R7,#+1
        B.N      ??LCD_char16x16_2
//  463  }
??LCD_char16x16_3:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock12
//  464 //==============================================================
//  465 //函数名： void Draw_BMP(uint8 x,uint8 y)
//  466 //功能描述：显示BMP图片128×64
//  467 //参数：起始点坐标(x,y),x的范围0～127，y为页的范围0～7
//  468 //返回：无
//  469 //==============================================================

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function Draw_BMP
        THUMB
//  470 void Draw_BMP(uint8 x0,uint8 y0,uint8 x1,uint8 y1,uint8 bmp[])
//  471 { 	
Draw_BMP:
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
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+40]
//  472   uint16 ii=0;
        MOVS     R9,#+0
//  473   uint8 x,y;
//  474   
//  475   if(y1%8==0) 
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,#+8
        SDIV     R1,R7,R0
        MLS      R1,R1,R0,R7
        CMP      R1,#+0
        BNE.N    ??Draw_BMP_0
//  476     y=y1/8;      
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,#+8
        SDIV     R0,R7,R0
        MOV      R11,R0
        B.N      ??Draw_BMP_1
//  477   else 
//  478     y=y1/8+1;
??Draw_BMP_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,#+8
        SDIV     R0,R7,R0
        ADDS     R0,R0,#+1
        MOV      R11,R0
//  479   for(y=y0;y<=y1;y++)
??Draw_BMP_1:
        MOV      R11,R5
??Draw_BMP_2:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R7,R11
        BCC.N    ??Draw_BMP_3
//  480   {
//  481     LCD_Set_Pos(x0,y);				
        MOV      R1,R11
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  482     for(x=x0;x<=x1;x++)
        MOV      R10,R4
??Draw_BMP_4:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R6,R10
        BCC.N    ??Draw_BMP_5
//  483     {      
//  484       LCD_WrDat(bmp[ii++]);	    	
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LDRB     R0,[R9, R8]
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
        ADDS     R9,R9,#+1
//  485     }
        ADDS     R10,R10,#+1
        B.N      ??Draw_BMP_4
//  486   }
??Draw_BMP_5:
        ADDS     R11,R11,#+1
        B.N      ??Draw_BMP_2
//  487 }
??Draw_BMP_3:
        POP      {R0,R4-R11,PC}   ;; return
          CFI EndBlock cfiBlock13

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  488      uint8 datata=0;
datata:
        DS8 1
//  489 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function OLED_image
        THUMB
//  490 void OLED_image()
//  491  {
OLED_image:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  492      int16 i,j,k;
//  493 
//  494      for(k=8;k>0;k--)
        MOVS     R0,#+8
        MOVS     R6,R0
??OLED_image_0:
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        CMP      R6,#+1
        BLT.N    ??OLED_image_1
//  495       {
//  496           LCD_Set_Pos(0,8-k);
        RSBS     R1,R6,#+8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall LCD_Set_Pos
        BL       LCD_Set_Pos
//  497           for(j=230;j>0;j-=2)
        MOVS     R0,#+230
        MOVS     R5,R0
??OLED_image_2:
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,#+1
        BLT.N    ??OLED_image_3
//  498            {
//  499                datata=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_2
        STRB     R0,[R1, #+0]
//  500                for(i=8*k-1;i>=8*(k-1);i-=1)
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        LSLS     R0,R6,#+3
        SUBS     R0,R0,#+1
        MOVS     R4,R0
??OLED_image_4:
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        SUBS     R0,R6,#+1
        CMP      R4,R0, LSL #+3
        BLT.N    ??OLED_image_5
//  501                 {
//  502                     if(date[2*i+20][j] >threshold_left_next) 
        LDR.N    R0,??DataTable4_3
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+4500
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOV      R2,#+450
        LDR.N    R3,??DataTable4_4
        SMLABB   R2,R4,R2,R3
        ADDS     R2,R5,R2
        LDRB     R1,[R1, R2]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BCS.N    ??OLED_image_6
//  503                         datata=(datata|0x80)>>1;
        LDR.N    R0,??DataTable4_2
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+1
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable4_2
        STRB     R0,[R1, #+0]
        B.N      ??OLED_image_7
//  504                     else datata=(datata>>1);
??OLED_image_6:
        LDR.N    R0,??DataTable4_2
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+1
        LDR.N    R1,??DataTable4_2
        STRB     R0,[R1, #+0]
//  505                 }
??OLED_image_7:
        SUBS     R4,R4,#+1
        B.N      ??OLED_image_4
//  506                LCD_WrDat(datata);	
??OLED_image_5:
        LDR.N    R0,??DataTable4_2
        LDRB     R0,[R0, #+0]
          CFI FunCall LCD_WrDat
        BL       LCD_WrDat
//  507            }
        SUBS     R5,R5,#+2
        B.N      ??OLED_image_2
//  508       }
??OLED_image_3:
        SUBS     R6,R6,#+1
        B.N      ??OLED_image_0
//  509  }
??OLED_image_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     F6x8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     F8X16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     datata

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     threshold_left_next

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     `date`

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
// 2 072 bytes in section .rodata
// 1 782 bytes in section .text
// 
// 1 782 bytes of CODE  memory
// 2 072 bytes of CONST memory
//     1 byte  of DATA  memory
//
//Errors: none
//Warnings: none
