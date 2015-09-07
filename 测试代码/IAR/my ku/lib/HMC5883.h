#ifndef __HMC5883_H__
#define __HMC5883_H__

#define HMC_A 	        0x00   //配置寄存器A
#define HMC_B           0x01   //配置寄存器B
#define HMC_Mode        0x02   //模式寄存器
#define HMC_XH          0x03   //数据输出XH
#define HMC_XL          0x04   //数据输出XL
#define HMC_YH          0x05   //数据输出YH
#define HMC_YL          0x06   //数据输出YL
#define HMC_ZH          0x07   //数据输出ZH
#define HMC_ZL          0x08   //数据输出ZL
#define HMC_Status      0x09   //状态寄存器
#define HMC_SA          0x0A   //识别寄存器A
#define HMC_SB          0x0B   //识别寄存器B
#define HMC_SC          0x0C   //识别寄存器C
#define PI              3.14159265

#define	HMC5883_SlaveAddress   	        0X1E//设备HMC5883的设备地址,7位地址0X1E  写地址0x3c 读地址0x3d


extern int16 HMC5883_GetData( uint8 REG_Address );
extern void MPU6050_I2C_BYPASS();
extern void MPU6050_I2C_MASTER();
//extern double Compass_Angle;    //HMC5883L测的的角度

#if defined(MPU6050_I2C_BYPASS_MODE)
extern void HMC5883_Init();
extern void HMC5883_Read(double* Compass_Angle);
extern void HMC5883_Self_Test(uint8 test[3]);

#elif defined(HMC5883_I2C_MASTER_MODE)
extern void HMC5883_Init();
extern void HMC5883_Read(double* Compass_Angle);
extern void HMC5883_Self_Test(uint8 test[3]);
#endif /* END */

#endif /* _HMC5883_H_ */