#ifndef __MPU6050_H__
#define __MPU6050_H__

#define         MPU6050_I2C_CH         1

//****************************************
// ����MPU6050�ڲ���ַ
//****************************************
#define        	SMPLRT_DIV          0x19        //�����ǲ����ʣ�����ֵ��0x07(125Hz)
#define        	CONFIG              0x1A        //��ͨ�˲�Ƶ�ʣ�����ֵ��0x06(5Hz)
#define        	GYRO_CONFIG         0x1B        //�������Լ켰������Χ������ֵ��0x18(���Լ죬2000deg/s)
#define        	ACCEL_CONFIG        0x1C        //���ټ��Լ졢������Χ����ͨ�˲�Ƶ�ʣ�����ֵ��0x01(���Լ죬2G��5Hz)
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
#define        	PWR_MGMT_1          0x6B        //��Դ��������ֵ��0x00(��������)
#define        	WHO_AM_I            0x75        //IIC��ַ�Ĵ���(Ĭ����ֵ0x68��ֻ��)
#define        	MPU6050_Addr        0x68        //IICд��ʱ�ĵ�ַ�ֽ����ݣ�+1Ϊ��ȡ*/
//***************************************************************
/****************************** ���ٶȼ� **********************************************
        AFS_SEL         Full Scale Range        LSB Sensitivity
	0		��2g			16384 LSB/g
	1		��4g			8192 LSB/g
	2		��8g			4096 LSB/g
	3		��16g			2048 LSB/g      */
#define 	        AFS_SEL		        0x08    //2g:0x00  4g:0x08  8g:0x10  16g:0x18//���ü��ٶȷ�Χ
#define                 add_x                   8192    //16384    8192     4096      2048

/****************************** ������ **********************************************
        FS_SEL 	        Full Scale Range 	LSB Sensitivity
	0		��250 ��/s		131 LSB/��/s
	1		��500 ��/s		65.5 LSB/��/s
	2		��1000 ��/s		32.8 LSB/��/s
	3		��2000 ��/s		16.4 LSB/��/s    */

#define 	        FS_SEL       	        0X10    //250:0X00  500:0X08  1000:0X10  2000:0X18//���ý��ٶȷ�Χ
#define                 aggle_scale             328     //1310      655       328        164
#define                 g                       98      //m/s2
//*******************************************************************/
//****************************************************************/
#define 		FIFO_OFLOW_EN		0x10
#define 		I2C_MST_INT_EN		0x08
#define			DATA_RDY_EN		0x01
//*******************************************************************


//*******************************************************************
//���ã���ʼ��MPU6050
//˵��:
//		��Դ��������ֵ��0x00(��������)
//		�����ǲ����ʣ�����ֵ��0x07(125Hz)
//		��ͨ�˲�Ƶ�ʣ�����ֵ��0x06(5Hz)
//		�������Լ켰������Χ������ֵ��FS_SEL(���Լ죬2000deg/s)
//		���ټ��Լ졢������Χ����ͨ�˲�Ƶ�ʣ�����ֵ��0x01|AFS_SEL(���Լ죬2G��5Hz)
//���أ��޷���ֵ
//********************************************************************
void MPU6050_Init(void);
//**************************************
//���ã��ϳ�����
//˵��: �ϳ�MPU6050��Ӧ�����Ĵ���
//		�ĵ��ֽ�����Ϊ˫�ֽ�����
//		16λ���ֽ�����8λ������һ�Ĵ���ֵ
//����: ���غϳɵ�˫�ֽ��ַ�������
//**************************************
int16 MPU6050_GetData( uint8 REG_Address );
//**************************************
//���ã��õ�MPU6050���ٶȼ�����
//˵������
//**************************************
void MPU6050_Accel(int32* Accel_X,int32* Accel_Y,int32* Accel_Z);
//**************************************
//���ã��õ�MPU6050����������
//˵������
//**************************************
void MPU6050_Gyro(int32* Angle_X,int32* Angle_Y,int32* Angle_Z);
//�ж�
//MPU6050_Int_Enable( FIFO_OFLOW_EN);
void MPU6050_Int_Enable(int Int_Type);
float MPU6050_Get_Temp();










//MPU6050�����Ǽ��ٶȼ����ݱ�������
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
