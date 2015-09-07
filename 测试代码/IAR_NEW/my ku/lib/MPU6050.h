#ifndef __MPU6050_H__
#define __MPU6050_H__

#define         MPU6050_I2C_CH         1

//****************************************
// 定义MPU6050内部地址
//****************************************
#define        	SMPLRT_DIV          0x19        //陀螺仪采样率，典型值：0x07(125Hz)
#define        	CONFIG              0x1A        //低通滤波频率，典型值：0x06(5Hz)
#define        	GYRO_CONFIG         0x1B        //陀螺仪自检及测量范围，典型值：0x18(不自检，2000deg/s)
#define        	ACCEL_CONFIG        0x1C        //加速计自检、测量范围及高通滤波频率，典型值：0x01(不自检，2G，5Hz)
#define        	I2C_MST_CTRL        0x24
#define        	I2C_SLV0_ADDR       0x25
#define        	I2C_SLV0_REG        0x26
#define        	I2C_SLV0_CTRL       0x27
#define		INT_ENABLE	    0x38
#define        	ACCEL_XOUT_H        0x3B
#define        	ACCEL_XOUT_L        0x3C
#define        	ACCEL_YOUT_H        0x3D
#define        	ACCEL_YOUT_L        0x3E
#define        	ACCEL_ZOUT_H        0x3F
#define        	ACCEL_ZOUT_L        0x40
#define        	TEMP_OUT_H          0x41
#define        	TEMP_OUT_L          0x42
#define        	GYRO_XOUT_H         0x43
#define        	GYRO_XOUT_L         0x44
#define        	GYRO_YOUT_H         0x45
#define        	GYRO_YOUT_L         0x46
#define        	GYRO_ZOUT_H         0x47
#define        	GYRO_ZOUT_L         0x48
#define        	I2C_SLV0_DO         0X63
#define        	USER_CTRL           0x6A
#define        	PWR_MGMT_1          0x6B        //电源管理，典型值：0x00(正常启用)
#define        	WHO_AM_I            0x75        //IIC地址寄存器(默认数值0x68，只读)
#define        	MPU6050_Addr        0x68        //IIC写入时的地址字节数据，+1为读取*/
//***************************************************************
/****************************** 加速度计 **********************************************
        AFS_SEL         Full Scale Range        LSB Sensitivity
	0		±2g			16384 LSB/g
	1		±4g			8192 LSB/g
	2		±8g			4096 LSB/g
	3		±16g			2048 LSB/g      */
#define 	        AFS_SEL		        0x08    //2g:0x00  4g:0x08  8g:0x10  16g:0x18//设置加速度范围
#define                 add_x                   8192    //16384    8192     4096      2048

/****************************** 陀螺仪 **********************************************
        FS_SEL 	        Full Scale Range 	LSB Sensitivity
	0		±250 °/s		131 LSB/°/s
	1		±500 °/s		65.5 LSB/°/s
	2		±1000 °/s		32.8 LSB/°/s
	3		±2000 °/s		16.4 LSB/°/s    */

#define 	        FS_SEL       	        0X10    //250:0X00  500:0X08  1000:0X10  2000:0X18//设置角速度范围
#define                 aggle_scale             328     //1310      655       328        164
#define                 g                       98      //m/s2
//*******************************************************************/
//****************************************************************/
#define 		FIFO_OFLOW_EN		0x10
#define 		I2C_MST_INT_EN		0x08
#define			DATA_RDY_EN		0x01
//*******************************************************************


//*******************************************************************
//作用：初始化MPU6050
//说明:
//		电源管理，典型值：0x00(正常启用)
//		陀螺仪采样率，典型值：0x07(125Hz)
//		低通滤波频率，典型值：0x06(5Hz)
//		陀螺仪自检及测量范围，典型值：FS_SEL(不自检，2000deg/s)
//		加速计自检、测量范围及高通滤波频率，典型值：0x01|AFS_SEL(不自检，2G，5Hz)
//返回：无返回值
//********************************************************************
void MPU6050_Init(void);
//**************************************
//作用：合成数据
//说明: 合成MPU6050对应两个寄存器
//		的单字节数据为双字节数据
//		16位高字节左移8位加上下一寄存器值
//返回: 返回合成的双字节字符型数据
//**************************************
int16 MPU6050_GetData( uint8 REG_Address );
//**************************************
//作用：得到MPU6050加速度计数据
//说明：无
//**************************************
void MPU6050_Accel(int32* Accel_X,int32* Accel_Y,int32* Accel_Z);
//**************************************
//作用：得到MPU6050陀螺仪数据
//说明：无
//**************************************
void MPU6050_Gyro(int32* Angle_X,int32* Angle_Y,int32* Angle_Z);
//中断
//MPU6050_Int_Enable( FIFO_OFLOW_EN);
void MPU6050_Int_Enable(int Int_Type);
float MPU6050_Get_Temp();










//MPU6050陀螺仪加速度计数据变量定义
extern float Pitch , Roll , Yaw;
extern float Pitch_adjust , Roll_adjust , Yaw_adjust;
extern short gyro [ 3 ] , accel [ 3 ];
extern unsigned long nullVal;
extern short gyroVal[3];
extern void Init_MPU6050_DMP( );
extern void Get_Attitude();
float self_adjust(float source,float error);
extern short gyro_flag[3];
extern uint8 complete_flag;

#endif /* _MPU6050_H_ */
