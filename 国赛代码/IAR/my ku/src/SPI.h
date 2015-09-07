#ifndef __SPI_H__
#define __SPI_H__

#include "common.h"
#define SPI0    0
#define SPI1    1
#define SPI2    128

#define SPI_MCR_BASE         0X4002C000
#define SPI_TCR_BASE         0X4002C008
#define SPI_CTAR0_BASE       0X4002C00C
#define SPI_CTAR1_BASE       0X4002C010
#define SPI_CTAR_SLAVE_BASE  0X4002C00C
#define SPI_SR_BASE          0X4002C02C
#define SPI_RSER_BASE        0X4002C030
#define SPI_PUSHR_BASE       0X4002C034
#define SPI_PUSHR_SLAVE_BASE 0X4002C034
#define SPI_POPR_BASE        0X4002C038

//以下只有SPI0有效
#define SPI_TXFRn_BASE       0X4002C03C
#define SPI_RXFRn_BASE       0X4002C07C

//SPIO:
#define SPI0_PCS0_PTA14     0
#define SPI0_SCK_PTA15      1
#define SPI0_SOUT_PTA16     2
#define SPI0_SIN_PTA17      3
#define SPI0_PCS5_PTB23     4
#define SPI0_PCS4_PTC0      5
#define SPI0_PCS3_PTC1      6
#define SPI0_PCS2_PTC2      7
#define SPI0_PCS1_PTC3      8
#define SPI0_PCS0_PTC4      9
#define SPI0_SCK_PTC5       10
#define SPI0_SOUT_PTC6      11
#define SPI0_SIN_PTC7       1
#define SPI0_PCS0_PTD0      13
#define SPI0_SCK_PTD1       14
#define SPI0_SOUT_PTD2      15
#define SPI0_SIN_PTD3       16
#define SPI0_PCS1_PTD4      17
#define SPI0_PCS2_PTD5      18
#define SPI0_PCS3_PTD6      19

//SPI1
#define SPI1_PCS1_PTE0      0
#define SPI1_SOUT_PTE1      1
#define SPI1_SIN_PTE1       2
#define SPI1_SCK_PTE2       3
#define SPI1_SIN_PTE3       4
#define SPI1_SOUT_PTE3      5
#define SPI1_PCS0_PTE4      6
#define SPI1_PCS2_PTE5      7
#define SPI1_PCS3_PTE6      8
#define SPI1_PCS1_PTB9      9
#define SPI1_PCS0_PTB10     10
#define SPI1_SCK_PTB11      11
#define SPI1_SOUT_PTB16     12
#define SPI1_SIN_PTB17      13

//SPI2
#define SPI2_PCS0_PTB20     0
#define SPI2_SCK_PTB21      1
#define SPI2_SOUT_PTB22     2
#define SPI2_SIN_PTB23      3
#define SPI2_PCS0_PTD11     4
#define SPI2_SCK_PTD12      5
#define SPI2_SOUT_PTD13     6
#define SPI2_SIN_PTD14      7
#define SPI2_PCS1_PTD15     8

//working mode
#define MASTER              1
#define SLAVE               0
//*********************************************************
//函数名称：SPI_init
//参数：SPI_NUM:SPI0~SPI3
//      master：是主机或者从机
//*********************************************************
void SPI_init(uint8 SPI_NUM,uint8 master);
void GPIOType_SPI(uint32 SPI_NUM,uint8 PCSx_NUM,uint8 SCK,uint8 SOUT,uint8 SIN);
//*********************************************************
//函数名称：SPI_Send
//参数：SPI_NUM:SPI0~SPI3
//      len:数据长度
//      data[]:传输数据数组
//*********************************************************
void SPI_Send(uint8 SPI_NUM,uint8 len,uint8 data[]);

//*********************************************************
//函数名称：SPI_Read
//参数：SPI_NUM:SPI0~SPI3
//      data[]:传输数据数组
//*********************************************************
void SPI_Read(uint8 SPI_NUM,uint8* data);

uint8 SPIx_ReadWriteByte(uint8 TX_DATA);        //用于接受前len-1个数据
uint8 SPIx_ReadWriteByte_last(uint8 TX_DATA);//用来接受最后一个数据


#endif