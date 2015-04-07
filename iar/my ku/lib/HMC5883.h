#ifndef __HMC5883_H__
#define __HMC5883_H__

#define HMC_A 	        0x00   //���üĴ���A
#define HMC_B           0x01   //���üĴ���B
#define HMC_Mode        0x02   //ģʽ�Ĵ���
#define HMC_XH          0x03   //�������XH
#define HMC_XL          0x04   //�������XL
#define HMC_YH          0x05   //�������YH
#define HMC_YL          0x06   //�������YL
#define HMC_ZH          0x07   //�������ZH
#define HMC_ZL          0x08   //�������ZL
#define HMC_Status      0x09   //״̬�Ĵ���
#define HMC_SA          0x0A   //ʶ��Ĵ���A
#define HMC_SB          0x0B   //ʶ��Ĵ���B
#define HMC_SC          0x0C   //ʶ��Ĵ���C
#define PI              3.14159265

#define	HMC5883_SlaveAddress   	        0X1E//�豸HMC5883���豸��ַ,7λ��ַ0X1E  д��ַ0x3c ����ַ0x3d


extern int16 HMC5883_GetData( uint8 REG_Address );
extern void MPU6050_I2C_BYPASS();
extern void MPU6050_I2C_MASTER();
//extern double Compass_Angle;    //HMC5883L��ĵĽǶ�

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