#include "all.h"
#include "math.h"
#include "inv_mpu.h"    
#include "inv_mpu_dmp_motion_driver.h"
//#define         MPU6050_I2C_CH         1
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
void MPU6050_Init(void)
{
        I2C_W1( MPU6050_I2C_CH, MPU6050_Addr, PWR_MGMT_1, 	 0X00);		//解除休眠状态
        I2C_W1( MPU6050_I2C_CH, MPU6050_Addr, SMPLRT_DIV, 	 0X07);//这里采样率为(1k/(1+7)) = 125Hz
        I2C_W1( MPU6050_I2C_CH, MPU6050_Addr, CONFIG, 	 	 0X06);//陀螺仪和加速度计的输出率都是1kHz,带宽为5Hz
        I2C_W1( MPU6050_I2C_CH, MPU6050_Addr, GYRO_CONFIG,	 FS_SEL);//选择± 2000 °/s
        I2C_W1( MPU6050_I2C_CH, MPU6050_Addr, ACCEL_CONFIG, 0X01|AFS_SEL);//± 2g
}
//**************************************
//作用：合成数据
//说明: 合成MPU6050对应两个寄存器
//		的单字节数据为双字节数据
//		16位高字节左移8位加上下一寄存器值
//返回: 返回合成的双字节字符型数据
//**************************************
int16 MPU6050_GetData( uint8 REG_Address )
{
            uint8 H, L;
	    I2C_R1(MPU6050_I2C_CH, MPU6050_Addr, REG_Address, 		&H);
	    I2C_R1(MPU6050_I2C_CH, MPU6050_Addr, REG_Address+1, 	&L);
	    return (int16)((((uint16)H)<< 8 ) + L);    //合成数据
}
//**************************************
//作用：得到MPU6050加速度计数据
//说明：无
//**************************************
void MPU6050_Accel(int32* Accel_X,int32* Accel_Y,int32* Accel_Z)
{
	//16-bit 2’s complement value
		*Accel_X=10*MPU6050_GetData( ACCEL_XOUT_H )*g/add_x;
		*Accel_Y=10*MPU6050_GetData( ACCEL_YOUT_H )*g/add_x;
		*Accel_Z=10*MPU6050_GetData( ACCEL_ZOUT_H )*g/add_x;
}
//**************************************
//作用：得到MPU6050陀螺仪数据
//说明：无
//**************************************
void MPU6050_Gyro(int32* Angle_X,int32* Angle_Y,int32* Angle_Z)
{
	*Angle_X= MPU6050_GetData( GYRO_XOUT_H )*10/aggle_scale;
	*Angle_Y= MPU6050_GetData( GYRO_YOUT_H )*10/aggle_scale;
	*Angle_Z= MPU6050_GetData( GYRO_ZOUT_H )*10/aggle_scale;
}
//中断
//MPU6050_Int_Enable( FIFO_OFLOW_EN);
void MPU6050_Int_Enable(int Int_Type)
{
	I2C_W1( MPU6050_I2C_CH, MPU6050_Addr, INT_ENABLE, Int_Type);
}
//Temperature in degrees C = (TEMP_OUT Register Value as a signed quantity)/340 + 36.53
float MPU6050_Get_Temp()
{
	float C;
	int16 temp;
	temp = MPU6050_GetData( TEMP_OUT_H);
	C = ((float)(temp)/340 + 36.53);
    return C;
}


/********************************** MPU6050_DMP *******************************************/
#define q30  1073741824.0f
static signed char gyro_orientation [ 9 ] = { -1 , 0 , 0 , 0 , -1 , 0 , 0 , 0 , 1 };
float Pitch = 0.0 , Roll = 0.0 , Yaw = 0.0;
float Pitch_adjust=0 , Roll_adjust=0 , Yaw_adjust=0;
float q0 = 1.0f , q1 = 0.0f , q2 = 0.0f , q3 = 0.0f;
long quat [ 4 ];
unsigned long sensor_timestamp;
short gyro [ 3 ] ,accel [ 3 ] , sensors;
unsigned char more;
//*******************************************************************
//作用：初始化MPU6050 DMP
//说明:
//返回：无返回值
//********************************************************************
void Init_MPU6050_DMP( )
{
        SYSDelay_ms(1000);
        mpu_init( );
        mpu_set_gyro_fsr(2000);//设置角速度满量程范围为±250,±500,±1000,±2000°/s
        mpu_set_accel_fsr(4);//设置加速度满量程范围为±2,±4,±8,±16g
        mpu_set_sensors( INV_XYZ_GYRO | INV_XYZ_ACCEL );
        mpu_configure_fifo( INV_XYZ_GYRO | INV_XYZ_ACCEL );
        mpu_set_sample_rate( DEFAULT_MPU_HZ ); //DEFAULT_MPU_HZ=200,设置采样率4~1kHz  
        dmp_load_motion_driver_firmware( );
        dmp_set_orientation( inv_orientation_matrix_to_scalar( gyro_orientation ) );
        dmp_enable_feature( DMP_FEATURE_6X_LP_QUAT | DMP_FEATURE_TAP | DMP_FEATURE_ANDROID_ORIENT | DMP_FEATURE_SEND_RAW_ACCEL | DMP_FEATURE_SEND_CAL_GYRO | DMP_FEATURE_GYRO_CAL );
        dmp_set_fifo_rate( DEFAULT_MPU_HZ );
        run_self_test( );
        mpu_set_dmp_state( 1 );
}
//*******************************************************************
//作用：DMP解算得到姿态
//说明：Pitch  -->俯仰角
//      Roll  -->横滚角
//      Yaw   -->偏航角
//返回：无返回值
//********************************************************************
unsigned long nullVal = 0;
short gyroVal[3];
short gyro_flag[3]={0,0,0};
float Pitch_last = 0.0 , Roll_last = 0.0 , Yaw_last = 0.0;
uint8 angle = 20,complete_flag=1;
void Get_Attitude()
{
    DisableInterrupts
        complete_flag=1;
        while(complete_flag)
         {
        if( ! ( dmp_read_fifo( gyro , accel , quat , &sensor_timestamp , &sensors , &more ) ) )
        {
#if 0
                mpu_get_gyro_reg(gyroVal, &nullVal);
                send_line(UART0, 1, (float)gyroVal[1]/-1);
                send_line(UART0, 2, (float)gyro[1]);
#endif
                q0 = quat [ 0 ] / q30;
                q1 = quat [ 1 ] / q30;
                q2 = quat [ 2 ] / q30;
                q3 = quat [ 3 ] / q30;
                //欧拉角
                Pitch = asin( 2 * q1 * q3 - 2 * q0 * q2 ) * 57.3;
                Roll = atan2( 2 * q2 * q3 + 2 * q0 * q1 , -2 * q1 * q1 - 2 * q2 * q2 + 1 ) * 57.3;
                Yaw = atan2( 2 * ( q1 * q2 + q0 * q3 ) , q0 * q0 + q1 * q1 - q2 * q2 - q3 * q3 ) * 57.3;
                if(Roll<0) Roll+=180;
                else Roll-=180;
                Pitch=self_adjust(Pitch,Pitch_adjust);
                Roll=self_adjust(Roll,Roll_adjust);
                Yaw=self_adjust(Yaw,Yaw_adjust);
                //角速度
                gyro[0] = (gyro[0])*10/aggle_scale;
                gyro[1] = (gyro[1])*10/aggle_scale;
                gyro[2] = (gyro[2])*10/aggle_scale;
                //加速度
                /*accel[0] = 10*accel[0]*g/add_x;
                accel[1] = 10*accel[1]*g/add_x;
                accel[2] = 10*accel[2]*g/add_x;*/
                
                //检测陀螺仪和加速度计的量程
               // uint8 accel_Range, gyro_Range;
                //I2C_RN(MPU6050_I2C_CH, MPU6050_Addr, ACCEL_CONFIG, 1, &accel_Range);
                //I2C_RN(MPU6050_I2C_CH, MPU6050_Addr, GYRO_CONFIG,  1, &gyro_Range);
                //I2C_RN(MPU6050_I2C_CH, MPU6050_Addr, ACCEL_CONFIG, 1, &accel_Range);
                complete_flag=0;
        }}
    EnableInterrupts
}
float self_adjust(float source,float error)
 {
     if(error>0)
      {
          if((source>(error-180)))
              source=source-error;
          else source=source+360-error;
      }
     else
      {
          if(source<(error+180)) source=source-error;
          else source=source-error-360;
      }
     return source;
 }





