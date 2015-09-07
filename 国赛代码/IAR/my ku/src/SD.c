#include "all.h"
#include "SD.h"

volatile u8 sd_type;

union Pixes{
	uint8 data[X_MAX][Y_MAX];
	uint8 img[50][512];
}DAT;

extern unsigned char asc2_1608[95][16];

static void sd_Disable_Select( void )
{
// SD_CS_SET();    // 取消片选
 sd_ReadWriteByte( 0xff ); // 补八个时钟
}

static u8 sd_WaitResponse( u8 response )
{
	u16 cnt = 0xffff;
	do 
	{
		if ( sd_ReadWriteByte( 0xff ) == response ) // 判断指定的应答是否出现
		{
			return 0;
		}
		cnt--;
	} while ( cnt );
	//printf( "等待 0x%x 信号失败....\n\n", response );
	return 1;
}


static u8  sd_WaitRead( void )
{
	u32 cnt = 0x00ffffff;
	u8  sta;
	do 
	{
		sta = sd_ReadWriteByte( 0xff );
		if ( sta == 0xff ) // 判断等待读取是否就绪
		{
			return 0;
		}
		cnt--;
	} while ( cnt );
	return 1;
}

static u8 sd_WriteBufferToDisk( u8 *buff, u8 cmd )
{
	u16 cnt;
	u8 sta;
	if ( sd_WaitRead() )
	{
		//  printf( "数据写入等待失败....\n\n\n" );
		return 1;
	}
	sd_ReadWriteByte( cmd );
	if ( cmd != 0xFD )
	{
		for ( cnt = 0; cnt < 512; cnt++ )
		{
			sd_ReadWriteByte( *buff );
			buff++;
		}
		for ( cnt = 0; cnt < 2; cnt++ )
		{
			sd_ReadWriteByte( 0xff );
		}
		sta = sd_ReadWriteByte( 0xff );
		if ( ( sta & 0x1F ) != 0x05 )
		{
			//  printf( "数据完成，但发生错误，错误码是 %x  \n\n\n", sta );
			return 2;
		}
	}
	return 0;
}


u8 sd_send_cmds( u8 cmd, u32 arg, u8 crc )
{
       u32 cnt=512;
       u8  sta;
       
  /*     sd_Disable_Select();  // 先取消片选
       if ( sd_Enable_Select() ) // 再使能片选
       {
        return 0xff;   // 如果片选失败，退出返回255
       }*/
       
       SPIx_ReadWriteByte( cmd | 0x40 );  // 发送命令组合
       SPIx_ReadWriteByte( (u8)(arg>>24) ); // 参数1
       SPIx_ReadWriteByte( (u8)(arg>>16) ); // 参数2
       SPIx_ReadWriteByte( (u8)(arg>>8) ); // 参数3
       SPIx_ReadWriteByte( (u8)(arg) );  // 参数4
       SPIx_ReadWriteByte( crc );   // CRC校验码

       do 
       {
        sta = SPIx_ReadWriteByte( 0xff ); // 读取发送状态
        cnt--;
       } while ( (cnt)&&(sta==0xff) );

       return sta; // 返回发送状态    
}

u8 SD_WriteMultiSectors( u8 *buff, u32 sectors, u32 num )
{
	u8 sta,rtn;
	u16 cnt=0xffff;
	if ( sd_type != SD_TYPE_V2HC )
	{
		sectors *= 512;
	}
	if ( num == 1 )
	{
		sta = sd_send_cmds( SD_CMD24, sectors, 0x01 );
		if ( sta == 0 )
		{
			sta = sd_WriteBufferToDisk( buff, 0xFE );
		}
	}else{
		if ( sd_type != SD_TYPE_MMC )
		{
			sd_send_cmds( SD_CMD55, 0, 0x01 );
			sd_send_cmds( SD_CMD23, num, 0x01 );
		}
		sta = sd_send_cmds( SD_CMD25, sectors, 0x01 );
		if ( sta == 0 )
		{
			do 
			{
				rtn = sd_WriteBufferToDisk( buff, 0xFC );
				buff += 512;
				num--;
			} while ( (sta==0)&&(num) );
			rtn = sd_WriteBufferToDisk( buff, 0xfd );
		}
	}
	do 
    {
    	sta = SPIx_ReadWriteByte( 0xff ); // 读取发送状态
        cnt--;
    } while ( (cnt)&&(sta!=0xff) );
//	sd_Disable_Select();
	return rtn;
}

static u8 sd_ReceiveDataToBuffer( u8 *buff, u16 lenght )
{
	u8 cnt;
	// 等待令牌 0xfe 回应
	if ( sd_WaitResponse( 0xfe ) )
	{
		//printf( "读取数据时等待令牌 0xFE 失败....\n\n" );
		return 1;
	}
	while ( lenght-- )
	{
		*buff = sd_ReadWriteByte( 0xff );
		buff++;
	}
	// 不进行CRC校验，发送假的CRC
	for ( cnt = 0; cnt < 2; cnt++ )
	{
		sd_ReadWriteByte( 0xff );
	}
 
	return 0;
}

u8 SD_ReadSingleSectors( u8 *buff, u32 sectors )
{
	u8 sta;
//	#if SD_DEBUG_EN>0
//	printf( "\n要读取的扇区是%d\n\n", sectors );
//	#endif
	if ( sd_type != SD_TYPE_V2HC )
	{ // 如果不是2.0HC高速卡，则转换为字节地址 
		sectors <<= 9; 
	}

	sta = sd_send_cmds( SD_CMD17, sectors, 0x01 );
	if ( sta == 0 )
	{
		sta = sd_ReceiveDataToBuffer( buff, 512 );
	}
	sd_Disable_Select();
	return sta;
}

u8 SD_ReadMultiSectors( u8 *buff, u32 sectors, u32 num )
{
	u8 sta;

	if ( sd_type != SD_TYPE_V2HC )
	{ // 如果不是2.0HC高速卡，则转换为字节地址 
		sectors <<= 9;
//		#if SD_DEBUG_EN>0
//			printf( "使用的不是高速卡哦！" );
//		#endif
	}

	if ( num == 1 )
	{
		sta = sd_send_cmds( SD_CMD17, sectors, 0x01 );
		if ( sta == 0 )
		{
			sta = sd_ReceiveDataToBuffer( buff, 512 );
		}
	}else{
		sta = sd_send_cmds( SD_CMD18, sectors, 0x01 );
		do 
		{
			sta = sd_ReceiveDataToBuffer( buff, 512 );
			buff += 512;
			num--;
		} while ( (sta==0)&&num );
		sd_send_cmds( SD_CMD12, 0, 0x01 );
	}
	sd_Disable_Select();
	return sta;
}

u8 SD_Reset(void)
{
	u8 cnt,sta,rtn=0;
	u8  i,x;
	u8  buf[4];
	SYSDelay_ms(5);
	for ( cnt = 0; cnt < 24; cnt++ )
	{ 
		x=SPIx_ReadWriteByte(0xff);
	}
	cnt = 200;
   
	do 
	{ // 循环读取发送命令0的返回状态，直到出现0x01或是超出200次
		sta = sd_send_cmds( 0, 0, 0x95 ); 
		cnt--;
	} while ( ( sta != 0x01 ) && ( cnt ) );
     
	sta = sd_send_cmds( SD_CMD8, 0x1AA, 0x87 );  

	// 读取命令8后卡发送来的四字节数据，只有2.0版本有
	for ( i = 0; i < 4; i++ )
	{
		buf[ i ] = sd_ReadWriteByte( 0xff );
	}

    // 根据读取回来的四字节数据，判断该卡是否支持2.7---3.6的电压
	if ( ( buf[ 2 ] == 0x01 )&&( buf[ 3 ] == 0xAA ) ) // 
    {
		// 只有支持2.7---3.6电压了才继续操作
		cnt = 0xffff;
    }
	else
	{
		cnt = 0xffff;
		rtn = 1;
	}
		
    
    do 
	{
		sd_send_cmds( SD_CMD55, 0, 0x01 );
		sta = sd_send_cmds( SD_CMD41, 0x40000000, 0x01 );
		cnt--;
	} while ( sta && cnt );
	
	sta = sd_send_cmds( SD_CMD58, 0, 0 );

	if ( sta != 0x00 ) // 如果没有得到正确的回应
	{
//         sd_Disable_Select();
		sta = 1;
		rtn = 1;
	}

	// 如果有得到正确的回应，则读取卡发回来的OCR信息
	for ( i = 0; i < 4; i++ ) // 读取四字节的信息
	{
		buf[ i ] = sd_ReadWriteByte( 0xff );
	}
	if ( buf[0] & 0x40 )
	{
		//printf( "检测到卡的类型是V2.0HC高速卡,可以正常使用.....\n\n" );
		sd_type = SD_TYPE_V2HC;
	}else{
		//printf( "检测到卡的类型是V2.0普通卡,可以正常使用.....\n\n" );
		sd_type = SD_TYPE_V2;
	}
	return rtn;
}

const unsigned char Num_1608[10][16]={
    {0x00,0xE0,0x10,0x08,0x08,0x10,0xE0,0x00,0x00,0x0F,0x10,0x20,0x20,0x10,0x0F,0x00},

    {0x00,0x10,0x10,0xF8,0x00,0x00,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00},

    {0x00,0x70,0x08,0x08,0x08,0x88,0x70,0x00,0x00,0x30,0x28,0x24,0x22,0x21,0x30,0x00},

    {0x00,0x30,0x08,0x88,0x88,0x48,0x30,0x00,0x00,0x18,0x20,0x20,0x20,0x11,0x0E,0x00},

    {0x00,0x00,0xC0,0x20,0x10,0xF8,0x00,0x00,0x00,0x07,0x04,0x24,0x24,0x3F,0x24,0x00},

    {0x00,0xF8,0x08,0x88,0x88,0x08,0x08,0x00,0x00,0x19,0x21,0x20,0x20,0x11,0x0E,0x00},

    {0x00,0xE0,0x10,0x88,0x88,0x18,0x00,0x00,0x00,0x0F,0x11,0x20,0x20,0x11,0x0E,0x00},

    {0x00,0x38,0x08,0x08,0xC8,0x38,0x08,0x00,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x00},

    {0x00,0x70,0x88,0x08,0x08,0x88,0x70,0x00,0x00,0x1C,0x22,0x21,0x21,0x22,0x1C,0x00},

    {0x00,0xE0,0x10,0x08,0x08,0x10,0xE0,0x00,0x00,0x00,0x31,0x22,0x22,0x11,0x0F,0x00}
};

void Print_Num_POS(uint8 POS_I,uint8 POS_J,uint8 Num)
{
    	uint8 Position_I = POS_I,Position_J = POS_J;
    	if (Num > 9)
		return;
	uint8 i,j;
	unsigned char MASK_Char = 0x80,Temp_Char;
    	//将参数写入图片
	for (i=0;i<16;i++)
	{
		Temp_Char = Num_1608[Num][16-i];
	    	for (j=0;j<8;j++)
		{
		    if (Temp_Char & MASK_Char)
			DAT.data[ j + Position_J][ i  + Position_I]= 200;
		    else
			DAT.data[ j  + Position_J][ i  + Position_I]= 0;
		    Temp_Char = Temp_Char << 1;
		}
		if (i>7)
		{
		    Position_I = POS_I - 8;
		    Position_J = POS_J + 8;
		}
	}
}

void Print_Num_Image(uint16 Num)
{
	uint8 A,B,C;
    if (Num > 255)
        return;
	A = Num / 100;Num -=A*100;
	B = Num /10; Num -=B*10;
	C = Num;
	Print_Num_POS(150,100,C);
	Print_Num_POS(158,100,B);
	Print_Num_POS(166,100,A);
}

void TakePhoto()
{
	static uint16 n=0;
	uint16 i,j;
    extern uint16 type;
	uint8 buff[512] = {0x5A};
	SD_Reset();
	for (i=0;i<512;i++)
		buff[i]=0x5A;
	SD_WriteMultiSectors(buff,800+n*300,1);
	for (i=0;i<X_MAX;i++)
		for (j=0;j<Y_MAX;j++)
			DAT.data[i][j]=date[i][j];
	SD_WriteMultiSectors(DAT.img[0],801+n*300,80);
	for (i=0;i<X_MAX;i++)
		for (j=0;j<Y_MAX;j++)
			DAT.data[i][j]=0;
	for (i=0;i<left_dot;i++)
		DAT.data[ left_line[i][0] ][ left_line[i][1] ]= 254;
	for (i=0;i<center_dot;i++)
		DAT.data[ center[i][0] /2][ center[i][1] /2]= 254;
	
	Print_Num_Image(type);
	
	SD_WriteMultiSectors(DAT.img[0],881+n*300,80);
	for (i=0;i<X_MAX;i++)
		for (j=0;j<Y_MAX;j++)
			DAT.data[i][j]=0;
	for (i=0;i<center_dot;i++)
		DAT.data[ center[i][0] /2][ center[i][1] /2]= 254;
	for (i=0;i<right_dot;i++)
		DAT.data[ right_line[i][0] ][ right_line[i][1] ]= 254;
	SD_WriteMultiSectors(DAT.img[0],961+n*300,80);
	n++;
	if(n==10000) 
		n=1;
}

u8 SD_Init()
{
	GPIO_INIT(RST_PORT,RST_PIN,1);
	GPIO_INIT(DC_PORT,DC_PIN,1);
	//	SPILCD_CS_SET;
	GPIOType_SPI(SPI2,SPI2_PCS0_PTB20,SPI2_SCK_PTB21,SPI2_SOUT_PTB22,SPI2_SIN_PTB23);
	SPI_init(SPI2,MASTER);
}