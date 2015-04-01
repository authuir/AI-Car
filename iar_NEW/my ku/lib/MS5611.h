#ifndef __MS5611_H__
#define __MS5611_H__

 #define	MS5611_SlaveAddress     0x77	 //定义器件在IIC总线中的从地址 
 #define	MS5611_D1               0x40 
 #define	MS5611_D2               0x50 
 #define	MS5611_RST              0x1E 
 #define	MS5611_D1_OSR_256       0x40 
 #define	MS5611_D1_OSR_512       0x42 
 #define    MS5611_D1_OSR_1024      0x44 
 #define	MS5611_D1_OSR_2048      0x46 
 #define	MS5611_D1_OSR_4096      0x48 
 #define	MS5611_D2_OSR_256       0x50 
 #define	MS5611_D2_OSR_512       0x52 
 #define    MS5611_D2_OSR_1024      0x54 
 #define	MS5611_D2_OSR_2048      0x56 
 #define	MS5611_D2_OSR_4096      0x58 
 #define    MS5611_ADC_RD           0x00 
 #define	MS5611_PROM_RD          0xA0 
 #define    MS5611_PROM_CRC         0xAE
//***********************
/*D1:
    (OSR=256)       0X40
    OSR=512         0X42
    OSR=1024        0X44
    OSR=2048        0X46
    OSR=4096        0X48
D2:
    OSR=256         0X50
    OSR=512         0X52
    OSR=1024        0X54
    OSR=2048        0X56
    OSR=4096        0X58
                            */
#define     D1_OSR                0X40   //D1分辨率
#define     D2_OSR                0X50       //D2分辨率
//*************************************************************************
//简介：向从机写一个字节,针对无存储器的从机
//DeviceAddr:设备地址
//AccessAddr：访问地址
//返回值：1表示成功，0表示失败
//*************************************************************************
uint8 I2C_W1_new(uint32 I2C_NUM,uint8 DeviceAddr,uint8 command);
uint8 I2C_R1_new(uint32 I2C_NUM,uint8 DeviceAddr,uint8 command,uint16* data);
void MS5611_Init(uint16 Cal_C[]) ;
uint32 MS5611_DO_CONVERSION(uint8 command);
int64 MS5611_get(uint16 CX[]);
#endif