#include "all.h"
#define   SDA_HIGH              GPIO_SET(PORTD,9,1);
#define   SDA_LOW               GPIO_SET(PORTD,9,0);
#define   SCL_HIGH              GPIO_SET(PORTD,8,1);
#define   SCL_LOW               GPIO_SET(PORTD,8,0);
#define   SDA_IN                HWREG(GPIO_PDDR_BASE+PORTD*(0x40))&=~(1<<9);GPIOPULL_Enable(PORTD,9);GPIOPULL_SET(PORTD,9,PULL_UP);
#define   SDA_OUT               HWREG(GPIO_PDDR_BASE+PORTD*(0x40))|=(1<<9);


void I2C_moni_Start()
{
      SDA_HIGH
      SCL_HIGH
      SYSDelay_us(3);
      SDA_LOW
      SYSDelay_us(3);
      SCL_LOW
}
void I2C_moni_Stop( )
{
        SCL_LOW
        SYSDelay_us(3);
        SDA_LOW
        SYSDelay_us(3);
        SCL_HIGH
        SYSDelay_us(3);
        SDA_HIGH
        SYSDelay_us(5);
}
uint8 SDA_In_Data( )
{
        int32_t SDA;
        SDA = GPIO_GET(PORTD,9);             
        if ( SDA == 1 ) return 1;
        else return 0;
}
void I2C_moni_SendACK( )
{
        SCL_LOW
        SYSDelay_us(3);
        SDA_LOW
        SCL_HIGH
        SYSDelay_us(3);
        SCL_LOW
        SYSDelay_us(3);
}
void I2C_moni_RecvACK( )
{
        SYSDelay_us(1);
        SCL_HIGH
        SDA_IN
        while ( SDA_In_Data() )//µÍµçÆ½Ó¦´ð
        {
          
        }
        SCL_LOW
        SDA_OUT
}
void I2C_moni_SendByte( uint8 dat )
{
        uint8 i = 8;
        while ( i-- )
        {
                SCL_LOW
                SYSDelay_us(1);
                if ( dat & 0x80 )
                    SDA_HIGH
                else
                    SDA_LOW
                dat <<= 1;
                SYSDelay_us(2);
                SCL_HIGH
                SYSDelay_us(2);
        }
        SCL_LOW
}
int8 I2C_moni_RecvByte( )
{
        uint8 i = 8, timeout = 0;
        uint8 dat = 0;
        SYSDelay_us(1);
        SDA_IN
        while ( i-- )
        {
                dat <<= 1;
                SCL_LOW
                SYSDelay_us(1);
                SCL_HIGH
                while ( (timeout<250) ) 
                {
                  timeout++;
                  if(timeout >= 245)
                      dat |= 0x01;
                  if(SDA_In_Data()!=1)
                      break;
                }
        }
        SCL_LOW
        SDA_OUT
        return dat;
}
int8 I2C_moni_WN( uint8 addr , uint8 REG_Address , uint8 len , uint8 *REG_data )
{
        uint8_t i;
        I2C_moni_Start();
        I2C_moni_SendByte( (addr << 1)&0xfe );
        I2C_moni_RecvACK();
        I2C_moni_SendByte( REG_Address );
        I2C_moni_RecvACK( );
        for ( i = 0; i < len ; i++ )
        {
                I2C_moni_SendByte( REG_data [ i ] );
                I2C_moni_RecvACK();
        }
        I2C_moni_Stop( );
        return 1;
}
int8 I2C_moni_RN( uint8 addr , uint8 REG_Address , uint8 len , uint8 *REG_data )
{
        I2C_moni_Start( );
        I2C_moni_SendByte( (addr<<1)&0xfe );
        I2C_moni_RecvACK();
        I2C_moni_SendByte( REG_Address );     
        I2C_moni_RecvACK( );
        I2C_moni_Start( );                 
        I2C_moni_SendByte( (addr<<1)&0X01 );   
        I2C_moni_RecvACK( );
        while ( len )
        {
                *REG_data = I2C_moni_RecvByte( ); 
                I2C_moni_SendACK();
                REG_data++;
                len--;
        }
        I2C_moni_Stop( );
        return 1;
}
int8 I2C_moni_RN_NEW( uint8 addr , uint8 cmd, uint8 len , uint16 *data )
{
        I2C_moni_Start( );
        I2C_moni_SendByte( (addr<<1)&0xfe );
        I2C_moni_RecvACK();
        I2C_moni_SendByte( cmd );     
        //I2C_moni_RecvACK( );
        I2C_moni_Stop( );
        I2C_moni_Start( );                 
        I2C_moni_SendByte( (addr<<1)&0X01 );   
        I2C_moni_RecvACK( );
        while ( len )
        {
                *data |= I2C_moni_RecvByte( ); 
                I2C_moni_SendACK();
                *data = *data<<8;
                len--;
        }
        I2C_moni_Stop( );
        return 1;
}
int8 I2C_moni_W1_NEW( uint8 addr , uint8 len , uint8 cmd[] )
{
        uint8_t i;
        I2C_moni_Start();
        I2C_moni_SendByte( (addr << 1)&0xfe );
        I2C_moni_RecvACK();
        for ( i = 0; i < len ; i++ )
        {
                I2C_moni_SendByte( cmd [ i ] );
                I2C_moni_RecvACK();
        }
        I2C_moni_Stop( );
        return 1;
}

