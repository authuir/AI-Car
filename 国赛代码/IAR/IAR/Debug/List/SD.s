///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:12
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\SD.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\SD.c" -lA
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
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\SD.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN GPIOType_SPI
        EXTERN GPIO_INIT
        EXTERN SPI_init
        EXTERN SPIx_ReadWriteByte
        EXTERN SYSDelay_ms
        EXTERN __aeabi_memcpy4
        EXTERN center
        EXTERN center_dot
        EXTERN `date`
        EXTERN left_dot
        EXTERN left_line
        EXTERN right_dot
        EXTERN right_line
        EXTERN type

        PUBLIC DAT
        PUBLIC Num_1608
        PUBLIC Print_Num_Image
        PUBLIC Print_Num_POS
        PUBLIC SD_Init
        PUBLIC SD_ReadMultiSectors
        PUBLIC SD_ReadSingleSectors
        PUBLIC SD_Reset
        PUBLIC SD_WriteMultiSectors
        PUBLIC TakePhoto
        PUBLIC sd_send_cmds
        PUBLIC sd_type
        
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
        
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\SD.c
//    1 #include "all.h"
//    2 #include "SD.h"
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    4 volatile u8 sd_type;
sd_type:
        DS8 1
//    5 
//    6 union Pixes{
//    7 	uint8 data[X_MAX][Y_MAX];
//    8 	uint8 img[50][512];

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 }DAT;
DAT:
        DS8 32552
//   10 
//   11 extern unsigned char asc2_1608[95][16];
//   12 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function sd_Disable_Select
        THUMB
//   13 static void sd_Disable_Select( void )
//   14 {
sd_Disable_Select:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   15 // SD_CS_SET();    // 取消片选
//   16  sd_ReadWriteByte( 0xff ); // 补八个时钟
        MOVS     R0,#+255
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
//   17 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   18 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function sd_WaitResponse
        THUMB
//   19 static u8 sd_WaitResponse( u8 response )
//   20 {
sd_WaitResponse:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//   21 	u16 cnt = 0xffff;
        MOVW     R5,#+65535
//   22 	do 
//   23 	{
//   24 		if ( sd_ReadWriteByte( 0xff ) == response ) // 判断指定的应答是否出现
??sd_WaitResponse_0:
        MOVS     R0,#+255
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R0,R4
        BNE.N    ??sd_WaitResponse_1
//   25 		{
//   26 			return 0;
        MOVS     R0,#+0
        B.N      ??sd_WaitResponse_2
//   27 		}
//   28 		cnt--;
??sd_WaitResponse_1:
        SUBS     R5,R5,#+1
//   29 	} while ( cnt );
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BNE.N    ??sd_WaitResponse_0
//   30 	//printf( "等待 0x%x 信号失败....\n\n", response );
//   31 	return 1;
        MOVS     R0,#+1
??sd_WaitResponse_2:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock1
//   32 }
//   33 
//   34 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function sd_WaitRead
        THUMB
//   35 static u8  sd_WaitRead( void )
//   36 {
sd_WaitRead:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//   37 	u32 cnt = 0x00ffffff;
        MVNS     R4,#-16777216
//   38 	u8  sta;
//   39 	do 
//   40 	{
//   41 		sta = sd_ReadWriteByte( 0xff );
??sd_WaitRead_0:
        MOVS     R0,#+255
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
        MOVS     R5,R0
//   42 		if ( sta == 0xff ) // 判断等待读取是否就绪
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+255
        BNE.N    ??sd_WaitRead_1
//   43 		{
//   44 			return 0;
        MOVS     R0,#+0
        B.N      ??sd_WaitRead_2
//   45 		}
//   46 		cnt--;
??sd_WaitRead_1:
        SUBS     R4,R4,#+1
//   47 	} while ( cnt );
        CMP      R4,#+0
        BNE.N    ??sd_WaitRead_0
//   48 	return 1;
        MOVS     R0,#+1
??sd_WaitRead_2:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock2
//   49 }
//   50 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function sd_WriteBufferToDisk
        THUMB
//   51 static u8 sd_WriteBufferToDisk( u8 *buff, u8 cmd )
//   52 {
sd_WriteBufferToDisk:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//   53 	u16 cnt;
//   54 	u8 sta;
//   55 	if ( sd_WaitRead() )
          CFI FunCall sd_WaitRead
        BL       sd_WaitRead
        CMP      R0,#+0
        BEQ.N    ??sd_WriteBufferToDisk_0
//   56 	{
//   57 		//  printf( "数据写入等待失败....\n\n\n" );
//   58 		return 1;
        MOVS     R0,#+1
        B.N      ??sd_WriteBufferToDisk_1
//   59 	}
//   60 	sd_ReadWriteByte( cmd );
??sd_WriteBufferToDisk_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
//   61 	if ( cmd != 0xFD )
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+253
        BEQ.N    ??sd_WriteBufferToDisk_2
//   62 	{
//   63 		for ( cnt = 0; cnt < 512; cnt++ )
        MOVS     R0,#+0
        MOVS     R6,R0
??sd_WriteBufferToDisk_3:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+512
        BGE.N    ??sd_WriteBufferToDisk_4
//   64 		{
//   65 			sd_ReadWriteByte( *buff );
        LDRB     R0,[R4, #+0]
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
//   66 			buff++;
        ADDS     R4,R4,#+1
//   67 		}
        ADDS     R6,R6,#+1
        B.N      ??sd_WriteBufferToDisk_3
//   68 		for ( cnt = 0; cnt < 2; cnt++ )
??sd_WriteBufferToDisk_4:
        MOVS     R0,#+0
        MOVS     R6,R0
??sd_WriteBufferToDisk_5:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+2
        BGE.N    ??sd_WriteBufferToDisk_6
//   69 		{
//   70 			sd_ReadWriteByte( 0xff );
        MOVS     R0,#+255
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
//   71 		}
        ADDS     R6,R6,#+1
        B.N      ??sd_WriteBufferToDisk_5
//   72 		sta = sd_ReadWriteByte( 0xff );
??sd_WriteBufferToDisk_6:
        MOVS     R0,#+255
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
        MOVS     R7,R0
//   73 		if ( ( sta & 0x1F ) != 0x05 )
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ANDS     R0,R7,#0x1F
        CMP      R0,#+5
        BEQ.N    ??sd_WriteBufferToDisk_2
//   74 		{
//   75 			//  printf( "数据完成，但发生错误，错误码是 %x  \n\n\n", sta );
//   76 			return 2;
        MOVS     R0,#+2
        B.N      ??sd_WriteBufferToDisk_1
//   77 		}
//   78 	}
//   79 	return 0;
??sd_WriteBufferToDisk_2:
        MOVS     R0,#+0
??sd_WriteBufferToDisk_1:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock3
//   80 }
//   81 
//   82 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function sd_send_cmds
        THUMB
//   83 u8 sd_send_cmds( u8 cmd, u32 arg, u8 crc )
//   84 {
sd_send_cmds:
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
//   85        u32 cnt=512;
        MOV      R7,#+512
//   86        u8  sta;
//   87        
//   88   /*     sd_Disable_Select();  // 先取消片选
//   89        if ( sd_Enable_Select() ) // 再使能片选
//   90        {
//   91         return 0xff;   // 如果片选失败，退出返回255
//   92        }*/
//   93        
//   94        SPIx_ReadWriteByte( cmd | 0x40 );  // 发送命令组合
        ORRS     R0,R4,#0x40
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
//   95        SPIx_ReadWriteByte( (u8)(arg>>24) ); // 参数1
        LSRS     R0,R5,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
//   96        SPIx_ReadWriteByte( (u8)(arg>>16) ); // 参数2
        LSRS     R0,R5,#+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
//   97        SPIx_ReadWriteByte( (u8)(arg>>8) ); // 参数3
        LSRS     R0,R5,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
//   98        SPIx_ReadWriteByte( (u8)(arg) );  // 参数4
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
//   99        SPIx_ReadWriteByte( crc );   // CRC校验码
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
//  100 
//  101        do 
//  102        {
//  103         sta = SPIx_ReadWriteByte( 0xff ); // 读取发送状态
??sd_send_cmds_0:
        MOVS     R0,#+255
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
        MOV      R8,R0
//  104         cnt--;
        SUBS     R7,R7,#+1
//  105        } while ( (cnt)&&(sta==0xff) );
        CMP      R7,#+0
        BEQ.N    ??sd_send_cmds_1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+255
        BEQ.N    ??sd_send_cmds_0
//  106 
//  107        return sta; // 返回发送状态    
??sd_send_cmds_1:
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock4
//  108 }
//  109 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SD_WriteMultiSectors
        THUMB
//  110 u8 SD_WriteMultiSectors( u8 *buff, u32 sectors, u32 num )
//  111 {
SD_WriteMultiSectors:
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
        MOV      R9,R1
        MOVS     R5,R2
//  112 	u8 sta,rtn;
//  113 	u16 cnt=0xffff;
        MOVW     R8,#+65535
//  114 	if ( sd_type != SD_TYPE_V2HC )
        LDR.W    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+225
        BEQ.N    ??SD_WriteMultiSectors_0
//  115 	{
//  116 		sectors *= 512;
        MOV      R0,#+512
        MUL      R9,R0,R9
//  117 	}
//  118 	if ( num == 1 )
??SD_WriteMultiSectors_0:
        CMP      R5,#+1
        BNE.N    ??SD_WriteMultiSectors_1
//  119 	{
//  120 		sta = sd_send_cmds( SD_CMD24, sectors, 0x01 );
        MOVS     R2,#+1
        MOV      R1,R9
        MOVS     R0,#+24
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
        MOVS     R6,R0
//  121 		if ( sta == 0 )
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??SD_WriteMultiSectors_2
//  122 		{
//  123 			sta = sd_WriteBufferToDisk( buff, 0xFE );
        MOVS     R1,#+254
        MOVS     R0,R4
          CFI FunCall sd_WriteBufferToDisk
        BL       sd_WriteBufferToDisk
        MOVS     R6,R0
        B.N      ??SD_WriteMultiSectors_2
//  124 		}
//  125 	}else{
//  126 		if ( sd_type != SD_TYPE_MMC )
??SD_WriteMultiSectors_1:
        LDR.W    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+226
        BEQ.N    ??SD_WriteMultiSectors_3
//  127 		{
//  128 			sd_send_cmds( SD_CMD55, 0, 0x01 );
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+55
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
//  129 			sd_send_cmds( SD_CMD23, num, 0x01 );
        MOVS     R2,#+1
        MOVS     R1,R5
        MOVS     R0,#+23
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
//  130 		}
//  131 		sta = sd_send_cmds( SD_CMD25, sectors, 0x01 );
??SD_WriteMultiSectors_3:
        MOVS     R2,#+1
        MOV      R1,R9
        MOVS     R0,#+25
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
        MOVS     R6,R0
//  132 		if ( sta == 0 )
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??SD_WriteMultiSectors_2
//  133 		{
//  134 			do 
//  135 			{
//  136 				rtn = sd_WriteBufferToDisk( buff, 0xFC );
??SD_WriteMultiSectors_4:
        MOVS     R1,#+252
        MOVS     R0,R4
          CFI FunCall sd_WriteBufferToDisk
        BL       sd_WriteBufferToDisk
        MOVS     R7,R0
//  137 				buff += 512;
        ADDS     R4,R4,#+512
//  138 				num--;
        SUBS     R5,R5,#+1
//  139 			} while ( (sta==0)&&(num) );
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??SD_WriteMultiSectors_5
        CMP      R5,#+0
        BNE.N    ??SD_WriteMultiSectors_4
//  140 			rtn = sd_WriteBufferToDisk( buff, 0xfd );
??SD_WriteMultiSectors_5:
        MOVS     R1,#+253
        MOVS     R0,R4
          CFI FunCall sd_WriteBufferToDisk
        BL       sd_WriteBufferToDisk
        MOVS     R7,R0
//  141 		}
//  142 	}
//  143 	do 
//  144     {
//  145     	sta = SPIx_ReadWriteByte( 0xff ); // 读取发送状态
??SD_WriteMultiSectors_2:
        MOVS     R0,#+255
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
        MOVS     R6,R0
//  146         cnt--;
        SUBS     R8,R8,#+1
//  147     } while ( (cnt)&&(sta!=0xff) );
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BEQ.N    ??SD_WriteMultiSectors_6
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+255
        BNE.N    ??SD_WriteMultiSectors_2
//  148 //	sd_Disable_Select();
//  149 	return rtn;
??SD_WriteMultiSectors_6:
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock5
//  150 }
//  151 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function sd_ReceiveDataToBuffer
        THUMB
//  152 static u8 sd_ReceiveDataToBuffer( u8 *buff, u16 lenght )
//  153 {
sd_ReceiveDataToBuffer:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  154 	u8 cnt;
//  155 	// 等待令牌 0xfe 回应
//  156 	if ( sd_WaitResponse( 0xfe ) )
        MOVS     R0,#+254
          CFI FunCall sd_WaitResponse
        BL       sd_WaitResponse
        CMP      R0,#+0
        BEQ.N    ??sd_ReceiveDataToBuffer_0
//  157 	{
//  158 		//printf( "读取数据时等待令牌 0xFE 失败....\n\n" );
//  159 		return 1;
        MOVS     R0,#+1
        B.N      ??sd_ReceiveDataToBuffer_1
//  160 	}
//  161 	while ( lenght-- )
??sd_ReceiveDataToBuffer_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??sd_ReceiveDataToBuffer_2
//  162 	{
//  163 		*buff = sd_ReadWriteByte( 0xff );
        MOVS     R0,#+255
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
        STRB     R0,[R4, #+0]
//  164 		buff++;
        ADDS     R4,R4,#+1
        B.N      ??sd_ReceiveDataToBuffer_0
//  165 	}
//  166 	// 不进行CRC校验，发送假的CRC
//  167 	for ( cnt = 0; cnt < 2; cnt++ )
??sd_ReceiveDataToBuffer_2:
        MOVS     R0,#+0
        MOVS     R6,R0
??sd_ReceiveDataToBuffer_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+2
        BGE.N    ??sd_ReceiveDataToBuffer_4
//  168 	{
//  169 		sd_ReadWriteByte( 0xff );
        MOVS     R0,#+255
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
//  170 	}
        ADDS     R6,R6,#+1
        B.N      ??sd_ReceiveDataToBuffer_3
//  171  
//  172 	return 0;
??sd_ReceiveDataToBuffer_4:
        MOVS     R0,#+0
??sd_ReceiveDataToBuffer_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock6
//  173 }
//  174 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SD_ReadSingleSectors
        THUMB
//  175 u8 SD_ReadSingleSectors( u8 *buff, u32 sectors )
//  176 {
SD_ReadSingleSectors:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  177 	u8 sta;
//  178 //	#if SD_DEBUG_EN>0
//  179 //	printf( "\n要读取的扇区是%d\n\n", sectors );
//  180 //	#endif
//  181 	if ( sd_type != SD_TYPE_V2HC )
        LDR.W    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+225
        BEQ.N    ??SD_ReadSingleSectors_0
//  182 	{ // 如果不是2.0HC高速卡，则转换为字节地址 
//  183 		sectors <<= 9; 
        LSLS     R5,R5,#+9
//  184 	}
//  185 
//  186 	sta = sd_send_cmds( SD_CMD17, sectors, 0x01 );
??SD_ReadSingleSectors_0:
        MOVS     R2,#+1
        MOVS     R1,R5
        MOVS     R0,#+17
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
        MOVS     R6,R0
//  187 	if ( sta == 0 )
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??SD_ReadSingleSectors_1
//  188 	{
//  189 		sta = sd_ReceiveDataToBuffer( buff, 512 );
        MOV      R1,#+512
        MOVS     R0,R4
          CFI FunCall sd_ReceiveDataToBuffer
        BL       sd_ReceiveDataToBuffer
        MOVS     R6,R0
//  190 	}
//  191 	sd_Disable_Select();
??SD_ReadSingleSectors_1:
          CFI FunCall sd_Disable_Select
        BL       sd_Disable_Select
//  192 	return sta;
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock7
//  193 }
//  194 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function SD_ReadMultiSectors
        THUMB
//  195 u8 SD_ReadMultiSectors( u8 *buff, u32 sectors, u32 num )
//  196 {
SD_ReadMultiSectors:
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
//  197 	u8 sta;
//  198 
//  199 	if ( sd_type != SD_TYPE_V2HC )
        LDR.W    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+225
        BEQ.N    ??SD_ReadMultiSectors_0
//  200 	{ // 如果不是2.0HC高速卡，则转换为字节地址 
//  201 		sectors <<= 9;
        LSLS     R5,R5,#+9
//  202 //		#if SD_DEBUG_EN>0
//  203 //			printf( "使用的不是高速卡哦！" );
//  204 //		#endif
//  205 	}
//  206 
//  207 	if ( num == 1 )
??SD_ReadMultiSectors_0:
        CMP      R6,#+1
        BNE.N    ??SD_ReadMultiSectors_1
//  208 	{
//  209 		sta = sd_send_cmds( SD_CMD17, sectors, 0x01 );
        MOVS     R2,#+1
        MOVS     R1,R5
        MOVS     R0,#+17
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
        MOVS     R7,R0
//  210 		if ( sta == 0 )
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??SD_ReadMultiSectors_2
//  211 		{
//  212 			sta = sd_ReceiveDataToBuffer( buff, 512 );
        MOV      R1,#+512
        MOVS     R0,R4
          CFI FunCall sd_ReceiveDataToBuffer
        BL       sd_ReceiveDataToBuffer
        MOVS     R7,R0
        B.N      ??SD_ReadMultiSectors_2
//  213 		}
//  214 	}else{
//  215 		sta = sd_send_cmds( SD_CMD18, sectors, 0x01 );
??SD_ReadMultiSectors_1:
        MOVS     R2,#+1
        MOVS     R1,R5
        MOVS     R0,#+18
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
        MOVS     R7,R0
//  216 		do 
//  217 		{
//  218 			sta = sd_ReceiveDataToBuffer( buff, 512 );
??SD_ReadMultiSectors_3:
        MOV      R1,#+512
        MOVS     R0,R4
          CFI FunCall sd_ReceiveDataToBuffer
        BL       sd_ReceiveDataToBuffer
        MOVS     R7,R0
//  219 			buff += 512;
        ADDS     R4,R4,#+512
//  220 			num--;
        SUBS     R6,R6,#+1
//  221 		} while ( (sta==0)&&num );
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??SD_ReadMultiSectors_4
        CMP      R6,#+0
        BNE.N    ??SD_ReadMultiSectors_3
//  222 		sd_send_cmds( SD_CMD12, 0, 0x01 );
??SD_ReadMultiSectors_4:
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+12
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
//  223 	}
//  224 	sd_Disable_Select();
??SD_ReadMultiSectors_2:
          CFI FunCall sd_Disable_Select
        BL       sd_Disable_Select
//  225 	return sta;
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock8
//  226 }
//  227 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function SD_Reset
        THUMB
//  228 u8 SD_Reset(void)
//  229 {
SD_Reset:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        SUB      SP,SP,#+8
          CFI CFA R13+32
//  230 	u8 cnt,sta,rtn=0;
        MOVS     R5,#+0
//  231 	u8  i,x;
//  232 	u8  buf[4];
//  233 	SYSDelay_ms(5);
        MOVS     R0,#+5
          CFI FunCall SYSDelay_ms
        BL       SYSDelay_ms
//  234 	for ( cnt = 0; cnt < 24; cnt++ )
        MOVS     R0,#+0
        MOV      R8,R0
??SD_Reset_0:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+24
        BGE.N    ??SD_Reset_1
//  235 	{ 
//  236 		x=SPIx_ReadWriteByte(0xff);
        MOVS     R0,#+255
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
        MOVS     R7,R0
//  237 	}
        ADDS     R8,R8,#+1
        B.N      ??SD_Reset_0
//  238 	cnt = 200;
??SD_Reset_1:
        MOVS     R0,#+200
        MOV      R8,R0
//  239    
//  240 	do 
//  241 	{ // 循环读取发送命令0的返回状态，直到出现0x01或是超出200次
//  242 		sta = sd_send_cmds( 0, 0, 0x95 ); 
??SD_Reset_2:
        MOVS     R2,#+149
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
        MOVS     R4,R0
//  243 		cnt--;
        SUBS     R8,R8,#+1
//  244 	} while ( ( sta != 0x01 ) && ( cnt ) );
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??SD_Reset_3
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??SD_Reset_2
//  245      
//  246 	sta = sd_send_cmds( SD_CMD8, 0x1AA, 0x87 );  
??SD_Reset_3:
        MOVS     R2,#+135
        MOV      R1,#+426
        MOVS     R0,#+8
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
        MOVS     R4,R0
//  247 
//  248 	// 读取命令8后卡发送来的四字节数据，只有2.0版本有
//  249 	for ( i = 0; i < 4; i++ )
        MOVS     R0,#+0
        MOVS     R6,R0
??SD_Reset_4:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BGE.N    ??SD_Reset_5
//  250 	{
//  251 		buf[ i ] = sd_ReadWriteByte( 0xff );
        MOVS     R0,#+255
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R1,SP,#+0
        STRB     R0,[R6, R1]
//  252 	}
        ADDS     R6,R6,#+1
        B.N      ??SD_Reset_4
//  253 
//  254     // 根据读取回来的四字节数据，判断该卡是否支持2.7---3.6的电压
//  255 	if ( ( buf[ 2 ] == 0x01 )&&( buf[ 3 ] == 0xAA ) ) // 
??SD_Reset_5:
        LDRB     R0,[SP, #+2]
        CMP      R0,#+1
        BNE.N    ??SD_Reset_6
        LDRB     R0,[SP, #+3]
        CMP      R0,#+170
        BNE.N    ??SD_Reset_6
//  256     {
//  257 		// 只有支持2.7---3.6电压了才继续操作
//  258 		cnt = 0xffff;
        MOVS     R0,#+255
        MOV      R8,R0
        B.N      ??SD_Reset_7
//  259     }
//  260 	else
//  261 	{
//  262 		cnt = 0xffff;
??SD_Reset_6:
        MOVS     R0,#+255
        MOV      R8,R0
//  263 		rtn = 1;
        MOVS     R0,#+1
        MOVS     R5,R0
//  264 	}
//  265 		
//  266     
//  267     do 
//  268 	{
//  269 		sd_send_cmds( SD_CMD55, 0, 0x01 );
??SD_Reset_7:
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+55
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
//  270 		sta = sd_send_cmds( SD_CMD41, 0x40000000, 0x01 );
        MOVS     R2,#+1
        MOVS     R1,#+1073741824
        MOVS     R0,#+41
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
        MOVS     R4,R0
//  271 		cnt--;
        SUBS     R8,R8,#+1
//  272 	} while ( sta && cnt );
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_Reset_8
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??SD_Reset_7
//  273 	
//  274 	sta = sd_send_cmds( SD_CMD58, 0, 0 );
??SD_Reset_8:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+58
          CFI FunCall sd_send_cmds
        BL       sd_send_cmds
        MOVS     R4,R0
//  275 
//  276 	if ( sta != 0x00 ) // 如果没有得到正确的回应
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_Reset_9
//  277 	{
//  278 //         sd_Disable_Select();
//  279 		sta = 1;
        MOVS     R0,#+1
        MOVS     R4,R0
//  280 		rtn = 1;
        MOVS     R0,#+1
        MOVS     R5,R0
//  281 	}
//  282 
//  283 	// 如果有得到正确的回应，则读取卡发回来的OCR信息
//  284 	for ( i = 0; i < 4; i++ ) // 读取四字节的信息
??SD_Reset_9:
        MOVS     R0,#+0
        MOVS     R6,R0
??SD_Reset_10:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BGE.N    ??SD_Reset_11
//  285 	{
//  286 		buf[ i ] = sd_ReadWriteByte( 0xff );
        MOVS     R0,#+255
          CFI FunCall SPIx_ReadWriteByte
        BL       SPIx_ReadWriteByte
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R1,SP,#+0
        STRB     R0,[R6, R1]
//  287 	}
        ADDS     R6,R6,#+1
        B.N      ??SD_Reset_10
//  288 	if ( buf[0] & 0x40 )
??SD_Reset_11:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??SD_Reset_12
//  289 	{
//  290 		//printf( "检测到卡的类型是V2.0HC高速卡,可以正常使用.....\n\n" );
//  291 		sd_type = SD_TYPE_V2HC;
        MOVS     R0,#+225
        LDR.N    R1,??DataTable5
        STRB     R0,[R1, #+0]
        B.N      ??SD_Reset_13
//  292 	}else{
//  293 		//printf( "检测到卡的类型是V2.0普通卡,可以正常使用.....\n\n" );
//  294 		sd_type = SD_TYPE_V2;
??SD_Reset_12:
        MOVS     R0,#+227
        LDR.N    R1,??DataTable5
        STRB     R0,[R1, #+0]
//  295 	}
//  296 	return rtn;
??SD_Reset_13:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4-R8,PC}  ;; return
          CFI EndBlock cfiBlock9
//  297 }

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {90}>`:
        DATA
        DC8 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
//  298 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//  299 const unsigned char Num_1608[10][16]={
Num_1608:
        DATA
        DC8 0, 224, 16, 8, 8, 16, 224, 0, 0, 15, 16, 32, 32, 16, 15, 0, 0, 16
        DC8 16, 248, 0, 0, 0, 0, 0, 32, 32, 63, 32, 32, 0, 0, 0, 112, 8, 8, 8
        DC8 136, 112, 0, 0, 48, 40, 36, 34, 33, 48, 0, 0, 48, 8, 136, 136, 72
        DC8 48, 0, 0, 24, 32, 32, 32, 17, 14, 0, 0, 0, 192, 32, 16, 248, 0, 0
        DC8 0, 7, 4, 36, 36, 63, 36, 0, 0, 248, 8, 136, 136, 8, 8, 0, 0, 25, 33
        DC8 32, 32, 17, 14, 0, 0, 224, 16, 136, 136, 24, 0, 0, 0, 15, 17, 32
        DC8 32, 17, 14, 0, 0, 56, 8, 8, 200, 56, 8, 0, 0, 0, 0, 63, 0, 0, 0, 0
        DC8 0, 112, 136, 8, 8, 136, 112, 0, 0, 28, 34, 33, 33, 34, 28, 0, 0
        DC8 224, 16, 8, 8, 16, 224, 0, 0, 0, 49, 34, 34, 17, 15, 0
//  300     {0x00,0xE0,0x10,0x08,0x08,0x10,0xE0,0x00,0x00,0x0F,0x10,0x20,0x20,0x10,0x0F,0x00},
//  301 
//  302     {0x00,0x10,0x10,0xF8,0x00,0x00,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00},
//  303 
//  304     {0x00,0x70,0x08,0x08,0x08,0x88,0x70,0x00,0x00,0x30,0x28,0x24,0x22,0x21,0x30,0x00},
//  305 
//  306     {0x00,0x30,0x08,0x88,0x88,0x48,0x30,0x00,0x00,0x18,0x20,0x20,0x20,0x11,0x0E,0x00},
//  307 
//  308     {0x00,0x00,0xC0,0x20,0x10,0xF8,0x00,0x00,0x00,0x07,0x04,0x24,0x24,0x3F,0x24,0x00},
//  309 
//  310     {0x00,0xF8,0x08,0x88,0x88,0x08,0x08,0x00,0x00,0x19,0x21,0x20,0x20,0x11,0x0E,0x00},
//  311 
//  312     {0x00,0xE0,0x10,0x88,0x88,0x18,0x00,0x00,0x00,0x0F,0x11,0x20,0x20,0x11,0x0E,0x00},
//  313 
//  314     {0x00,0x38,0x08,0x08,0xC8,0x38,0x08,0x00,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x00},
//  315 
//  316     {0x00,0x70,0x88,0x08,0x08,0x88,0x70,0x00,0x00,0x1C,0x22,0x21,0x21,0x22,0x1C,0x00},
//  317 
//  318     {0x00,0xE0,0x10,0x08,0x08,0x10,0xE0,0x00,0x00,0x00,0x31,0x22,0x22,0x11,0x0F,0x00}
//  319 };
//  320 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function Print_Num_POS
          CFI NoCalls
        THUMB
//  321 void Print_Num_POS(uint8 POS_I,uint8 POS_J,uint8 Num)
//  322 {
Print_Num_POS:
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
//  323     	uint8 Position_I = POS_I,Position_J = POS_J;
        MOVS     R4,R0
        MOVS     R5,R1
//  324     	if (Num > 9)
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+10
        BGE.N    ??Print_Num_POS_0
//  325 		return;
//  326 	uint8 i,j;
//  327 	unsigned char MASK_Char = 0x80,Temp_Char;
??Print_Num_POS_1:
        MOVS     LR,#+128
//  328     	//将参数写入图片
//  329 	for (i=0;i<16;i++)
        MOVS     R3,#+0
        MOVS     R6,R3
??Print_Num_POS_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+16
        BGE.N    ??Print_Num_POS_3
//  330 	{
//  331 		Temp_Char = Num_1608[Num][16-i];
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        RSBS     R3,R6,#+0
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.W    R8,??DataTable5_1
        ADDS     R8,R8,R2, LSL #+4
        ADDS     R3,R3,R8
        LDRB     R3,[R3, #+16]
        MOV      R12,R3
//  332 	    	for (j=0;j<8;j++)
        MOVS     R3,#+0
        MOVS     R7,R3
??Print_Num_POS_4:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+8
        BGE.N    ??Print_Num_POS_5
//  333 		{
//  334 		    if (Temp_Char & MASK_Char)
        MOV      R3,R12
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        TST      R3,LR
        BEQ.N    ??Print_Num_POS_6
//  335 			DAT.data[ j + Position_J][ i  + Position_I]= 200;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTAB    R3,R4,R6
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTAB    R8,R5,R7
        MOVS     R9,#+210
        LDR.W    R10,??DataTable5_2
        MLA      R8,R9,R8,R10
        MOVS     R9,#+200
        STRB     R9,[R3, R8]
        B.N      ??Print_Num_POS_7
//  336 		    else
//  337 			DAT.data[ j  + Position_J][ i  + Position_I]= 0;
??Print_Num_POS_6:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTAB    R3,R4,R6
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTAB    R8,R5,R7
        MOVS     R9,#+210
        LDR.W    R10,??DataTable5_2
        MLA      R8,R9,R8,R10
        MOVS     R9,#+0
        STRB     R9,[R3, R8]
//  338 		    Temp_Char = Temp_Char << 1;
??Print_Num_POS_7:
        LSLS     R12,R12,#+1
//  339 		}
        ADDS     R7,R7,#+1
        B.N      ??Print_Num_POS_4
//  340 		if (i>7)
??Print_Num_POS_5:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+8
        BLT.N    ??Print_Num_POS_8
//  341 		{
//  342 		    Position_I = POS_I - 8;
        SUBS     R3,R0,#+8
        MOVS     R4,R3
//  343 		    Position_J = POS_J + 8;
        ADDS     R3,R1,#+8
        MOVS     R5,R3
//  344 		}
//  345 	}
??Print_Num_POS_8:
        ADDS     R6,R6,#+1
        B.N      ??Print_Num_POS_2
//  346 }
??Print_Num_POS_3:
??Print_Num_POS_0:
        POP      {R4-R10,PC}      ;; return
          CFI EndBlock cfiBlock10
//  347 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function Print_Num_Image
        THUMB
//  348 void Print_Num_Image(uint16 Num)
//  349 {
Print_Num_Image:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R7,R0
//  350 	uint8 A,B,C;
//  351     if (Num > 255)
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+255
        BGT.N    ??Print_Num_Image_0
//  352         return;
//  353 	A = Num / 100;Num -=A*100;
??Print_Num_Image_1:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,#+100
        SDIV     R0,R7,R0
        MOVS     R4,R0
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+100
        MLS      R7,R0,R4,R7
//  354 	B = Num /10; Num -=B*10;
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,#+10
        SDIV     R0,R7,R0
        MOVS     R5,R0
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+10
        MLS      R7,R0,R5,R7
//  355 	C = Num;
        MOVS     R0,R7
        MOVS     R6,R0
//  356 	Print_Num_POS(150,100,C);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+100
        MOVS     R0,#+150
          CFI FunCall Print_Num_POS
        BL       Print_Num_POS
//  357 	Print_Num_POS(158,100,B);
        MOVS     R2,R5
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+100
        MOVS     R0,#+158
          CFI FunCall Print_Num_POS
        BL       Print_Num_POS
//  358 	Print_Num_POS(166,100,A);
        MOVS     R2,R4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+100
        MOVS     R0,#+166
          CFI FunCall Print_Num_POS
        BL       Print_Num_POS
//  359 }
??Print_Num_Image_0:
        POP      {R0,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock11
//  360 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function TakePhoto
        THUMB
//  361 void TakePhoto()
//  362 {
TakePhoto:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+516
          CFI CFA R13+528
//  363 	static uint16 n=0;
//  364 	uint16 i,j;
//  365     extern uint16 type;
//  366 	uint8 buff[512] = {0x5A};
        ADD      R0,SP,#+0
        LDR.N    R1,??DataTable5_3
        MOV      R2,#+512
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//  367 	SD_Reset();
          CFI FunCall SD_Reset
        BL       SD_Reset
//  368 	for (i=0;i<512;i++)
        MOVS     R0,#+0
        MOVS     R5,R0
??TakePhoto_0:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+512
        BGE.N    ??TakePhoto_1
//  369 		buff[i]=0x5A;
        MOVS     R0,#+90
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADD      R1,SP,#+0
        STRB     R0,[R5, R1]
        ADDS     R5,R5,#+1
        B.N      ??TakePhoto_0
//  370 	SD_WriteMultiSectors(buff,800+n*300,1);
??TakePhoto_1:
        MOVS     R2,#+1
        LDR.N    R0,??DataTable5_4
        LDRH     R0,[R0, #+0]
        MOV      R1,#+300
        MULS     R0,R1,R0
        ADDS     R1,R0,#+800
        ADD      R0,SP,#+0
          CFI FunCall SD_WriteMultiSectors
        BL       SD_WriteMultiSectors
//  371 	for (i=0;i<X_MAX;i++)
        MOVS     R0,#+0
        MOVS     R5,R0
??TakePhoto_2:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+155
        BGE.N    ??TakePhoto_3
//  372 		for (j=0;j<Y_MAX;j++)
        MOVS     R0,#+0
        MOVS     R4,R0
??TakePhoto_4:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+210
        BGE.N    ??TakePhoto_5
//  373 			DAT.data[i][j]=date[i][j];
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,#+210
        LDR.N    R1,??DataTable5_2
        MLA      R0,R0,R5,R1
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R1,#+225
        LDR.N    R2,??DataTable5_5
        MLA      R1,R1,R5,R2
        LDRB     R1,[R4, R1]
        STRB     R1,[R4, R0]
        ADDS     R4,R4,#+1
        B.N      ??TakePhoto_4
??TakePhoto_5:
        ADDS     R5,R5,#+1
        B.N      ??TakePhoto_2
//  374 	SD_WriteMultiSectors(DAT.img[0],801+n*300,80);
??TakePhoto_3:
        MOVS     R2,#+80
        LDR.N    R0,??DataTable5_4
        LDRH     R0,[R0, #+0]
        MOV      R1,#+300
        MULS     R0,R1,R0
        ADDW     R1,R0,#+801
        LDR.N    R0,??DataTable5_2
          CFI FunCall SD_WriteMultiSectors
        BL       SD_WriteMultiSectors
//  375 	for (i=0;i<X_MAX;i++)
        MOVS     R0,#+0
        MOVS     R5,R0
??TakePhoto_6:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+155
        BGE.N    ??TakePhoto_7
//  376 		for (j=0;j<Y_MAX;j++)
        MOVS     R0,#+0
        MOVS     R4,R0
??TakePhoto_8:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+210
        BGE.N    ??TakePhoto_9
//  377 			DAT.data[i][j]=0;
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,#+210
        LDR.N    R1,??DataTable5_2
        MLA      R0,R0,R5,R1
        MOVS     R1,#+0
        STRB     R1,[R4, R0]
        ADDS     R4,R4,#+1
        B.N      ??TakePhoto_8
??TakePhoto_9:
        ADDS     R5,R5,#+1
        B.N      ??TakePhoto_6
//  378 	for (i=0;i<left_dot;i++)
??TakePhoto_7:
        MOVS     R0,#+0
        MOVS     R5,R0
??TakePhoto_10:
        LDR.N    R0,??DataTable5_6
        LDRH     R0,[R0, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCS.N    ??TakePhoto_11
//  379 		DAT.data[ left_line[i][0] ][ left_line[i][1] ]= 254;
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable5_7
        ADDS     R0,R0,R5, LSL #+2
        LDRH     R0,[R0, #+2]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable5_7
        LDRH     R1,[R1, R5, LSL #+2]
        MOVS     R2,#+210
        LDR.N    R3,??DataTable5_2
        MLA      R1,R2,R1,R3
        MOVS     R2,#+254
        STRB     R2,[R0, R1]
        ADDS     R5,R5,#+1
        B.N      ??TakePhoto_10
//  380 	for (i=0;i<center_dot;i++)
??TakePhoto_11:
        MOVS     R0,#+0
        MOVS     R5,R0
??TakePhoto_12:
        LDR.N    R0,??DataTable5_8
        LDRH     R0,[R0, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCS.N    ??TakePhoto_13
//  381 		DAT.data[ center[i][0] /2][ center[i][1] /2]= 254;
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable5_9
        ADDS     R0,R0,R5, LSL #+2
        LDRH     R0,[R0, #+2]
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable5_9
        LDRH     R1,[R1, R5, LSL #+2]
        MOVS     R2,#+2
        SDIV     R1,R1,R2
        MOVS     R2,#+210
        LDR.N    R3,??DataTable5_2
        MLA      R1,R2,R1,R3
        MOVS     R2,#+254
        STRB     R2,[R0, R1]
        ADDS     R5,R5,#+1
        B.N      ??TakePhoto_12
//  382 	
//  383 	Print_Num_Image(type);
??TakePhoto_13:
        LDR.N    R0,??DataTable5_10
        LDRH     R0,[R0, #+0]
          CFI FunCall Print_Num_Image
        BL       Print_Num_Image
//  384 	
//  385 	SD_WriteMultiSectors(DAT.img[0],881+n*300,80);
        MOVS     R2,#+80
        LDR.N    R0,??DataTable5_4
        LDRH     R0,[R0, #+0]
        MOV      R1,#+300
        MULS     R0,R1,R0
        ADDW     R1,R0,#+881
        LDR.N    R0,??DataTable5_2
          CFI FunCall SD_WriteMultiSectors
        BL       SD_WriteMultiSectors
//  386 	for (i=0;i<X_MAX;i++)
        MOVS     R0,#+0
        MOVS     R5,R0
??TakePhoto_14:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+155
        BGE.N    ??TakePhoto_15
//  387 		for (j=0;j<Y_MAX;j++)
        MOVS     R0,#+0
        MOVS     R4,R0
??TakePhoto_16:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+210
        BGE.N    ??TakePhoto_17
//  388 			DAT.data[i][j]=0;
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,#+210
        LDR.N    R1,??DataTable5_2
        MLA      R0,R0,R5,R1
        MOVS     R1,#+0
        STRB     R1,[R4, R0]
        ADDS     R4,R4,#+1
        B.N      ??TakePhoto_16
??TakePhoto_17:
        ADDS     R5,R5,#+1
        B.N      ??TakePhoto_14
//  389 	for (i=0;i<center_dot;i++)
??TakePhoto_15:
        MOVS     R0,#+0
        MOVS     R5,R0
??TakePhoto_18:
        LDR.N    R0,??DataTable5_8
        LDRH     R0,[R0, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCS.N    ??TakePhoto_19
//  390 		DAT.data[ center[i][0] /2][ center[i][1] /2]= 254;
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable5_9
        ADDS     R0,R0,R5, LSL #+2
        LDRH     R0,[R0, #+2]
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable5_9
        LDRH     R1,[R1, R5, LSL #+2]
        MOVS     R2,#+2
        SDIV     R1,R1,R2
        MOVS     R2,#+210
        LDR.N    R3,??DataTable5_2
        MLA      R1,R2,R1,R3
        MOVS     R2,#+254
        STRB     R2,[R0, R1]
        ADDS     R5,R5,#+1
        B.N      ??TakePhoto_18
//  391 	for (i=0;i<right_dot;i++)
??TakePhoto_19:
        MOVS     R0,#+0
        MOVS     R5,R0
??TakePhoto_20:
        LDR.N    R0,??DataTable5_11
        LDRH     R0,[R0, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCS.N    ??TakePhoto_21
//  392 		DAT.data[ right_line[i][0] ][ right_line[i][1] ]= 254;
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable5_12
        ADDS     R0,R0,R5, LSL #+2
        LDRH     R0,[R0, #+2]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable5_12
        LDRH     R1,[R1, R5, LSL #+2]
        MOVS     R2,#+210
        LDR.N    R3,??DataTable5_2
        MLA      R1,R2,R1,R3
        MOVS     R2,#+254
        STRB     R2,[R0, R1]
        ADDS     R5,R5,#+1
        B.N      ??TakePhoto_20
//  393 	SD_WriteMultiSectors(DAT.img[0],961+n*300,80);
??TakePhoto_21:
        MOVS     R2,#+80
        LDR.N    R0,??DataTable5_4
        LDRH     R0,[R0, #+0]
        MOV      R1,#+300
        MULS     R0,R1,R0
        ADDW     R1,R0,#+961
        LDR.N    R0,??DataTable5_2
          CFI FunCall SD_WriteMultiSectors
        BL       SD_WriteMultiSectors
//  394 	n++;
        LDR.N    R0,??DataTable5_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_4
        STRH     R0,[R1, #+0]
//  395 	if(n==10000) 
        LDR.N    R0,??DataTable5_4
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+10000
        CMP      R0,R1
        BNE.N    ??TakePhoto_22
//  396 		n=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_4
        STRH     R0,[R1, #+0]
//  397 }
??TakePhoto_22:
        ADD      SP,SP,#+516
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     sd_type

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     Num_1608

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     DAT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     `?<Constant {90}>`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     ??n

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     `date`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     left_dot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     left_line

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     center_dot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     center

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     type

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     right_dot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     right_line

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
??n:
        DS8 2
//  398 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function SD_Init
        THUMB
//  399 u8 SD_Init()
//  400 {
SD_Init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  401 	GPIO_INIT(RST_PORT,RST_PIN,1);
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOVS     R0,#+0
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  402 	GPIO_INIT(DC_PORT,DC_PIN,1);
        MOVS     R2,#+1
        MOVS     R1,#+13
        MOVS     R0,#+0
          CFI FunCall GPIO_INIT
        BL       GPIO_INIT
//  403 	//	SPILCD_CS_SET;
//  404 	GPIOType_SPI(SPI2,SPI2_PCS0_PTB20,SPI2_SCK_PTB21,SPI2_SOUT_PTB22,SPI2_SIN_PTB23);
        MOVS     R0,#+3
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+128
          CFI FunCall GPIOType_SPI
        BL       GPIOType_SPI
//  405 	SPI_init(SPI2,MASTER);
        MOVS     R1,#+1
        MOVS     R0,#+128
          CFI FunCall SPI_init
        BL       SPI_init
//  406 }
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock13

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
// 32 555 bytes in section .bss
//    672 bytes in section .rodata
//  1 876 bytes in section .text
// 
//  1 876 bytes of CODE  memory
//    672 bytes of CONST memory
// 32 555 bytes of DATA  memory
//
//Errors: none
//Warnings: 4
