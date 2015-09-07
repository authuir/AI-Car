#ifndef __SD_H__
#define __SD_H__

#define SD_RESET 0x40+0

#define u8 uint8
#define u16 uint16
#define u32 uint32

#define SD_CMD8  8
#define SD_CMD12 12
#define SD_CMD17 17
#define SD_CMD18 18
#define SD_CMD23 23
#define SD_CMD24 24
#define SD_CMD25 25
#define SD_CMD41 41
#define SD_CMD55 55
#define SD_CMD58 58

#define SD_TYPE_V2HC	0xE1
#define SD_TYPE_MMC		0xE2
#define SD_TYPE_V2		0xE3

#define MSD_RESPONSE_FAILURE 0xD0
#define MSD_RESPONSE_NO_ERROR 0xD1

#define sd_ReadWriteByte SPIx_ReadWriteByte

extern volatile u8 sd_type;

u8 SD_Reset(void);
u8 SD_Init(void);
static u8 sd_WaitResponse( u8 response );
static u8  sd_WaitRead( void );
static u8 sd_WriteBufferToDisk( u8 *buff, u8 cmd );
static u8 sd_ReceiveDataToBuffer( u8 *buff, u16 lenght );
u8 SD_send_cmds( u8 cmd, u32 arg, u8 crc );
u8 SD_WriteMultiSectors( u8 *buff, u32 sectors, u32 num );
u8 SD_ReadSingleSectors( u8 *buff, u32 sectors );
u8 SD_ReadMultiSectors( u8 *buff, u32 sectors, u32 num );

#endif