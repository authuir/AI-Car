#ifndef __I2C_MONI_H__
#define __I2C_MONI_H__





void I2C_moni_Start();
void I2C_moni_Stop( );
uint8 SDA_In_Data( );
void I2C_moni_SendACK(  );
void I2C_moni_RecvACK( );
void I2C_moni_SendByte( uint8 dat );
int8 I2C_moni_RecvByte( );
int8 I2C_moni_W1_NEW( uint8 addr , uint8 len , uint8 cmd[] );
int8 I2C_moni_WN( uint8 addr , uint8 REG_Address , uint8 len , uint8 *REG_data );
int8 I2C_moni_RN( uint8 addr , uint8 REG_Address , uint8 len , uint8 *REG_data );
int8 I2C_moni_RN_NEW( uint8 addr , uint8 cmd, uint8 len , uint16 *data );
#endif