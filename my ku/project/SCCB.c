//*************************************************
//designed for SCCB of  OV  CAMARA
//defsigner : L J
//the fastest frequence:400K HZ
//***************************************************
//ov7620
#include "common.h"
#include "SCCB.h"
#include "GPIO.h"
#include "systick.h"
void SCCB_init()
 {
     GPIO_INIT(SIO_C_PORT,SIO_C_PIN,OUTPUT);
     GPIO_INIT(SIO_D_PORT,SIO_D_PIN,OUTPUT);
     GPIOPULL_SET(SIO_C_PORT,SIO_C_PIN,PULL_UP);
     GPIOPULL_SET(SIO_D_PORT,SIO_D_PIN,PULL_UP);
     SIO_C_Set;
     GPIO_SET(SIO_D_PORT,SIO_D_PIN,0);
 }
//************************************************
//OV7620
void write_Date(uint8 write_date)
 {
     uint8 i,bit;
     for(i=0;i<8;i++)
      {
          SIO_C_Clear;
          bit=write_date&0x80;
          GPIO_SET(SIO_D_PORT,SIO_D_PIN,bit);
          SYSDelay_us(6);
          SIO_C_Set;
          SYSDelay_us(6);
          write_date=write_date<<1;
      }
     SIO_C_Clear;
     GPIO_SET(SIO_D_PORT,SIO_D_PIN,0);
     SYSDelay_us(6);
     SIO_C_Set;
     SYSDelay_us(6);
     SIO_C_Clear;
 }
void SCCB_start()
 {
     SIO_C_Set;
     SYSDelay_us(1);
     GPIO_SET(SIO_D_PORT,SIO_D_PIN,1);
     SYSDelay_us(2);
     GPIO_SET(SIO_D_PORT,SIO_D_PIN,0);
     SIO_C_Clear;
     SYSDelay_us(1);
 }

void SCCB_stop()
 {
     GPIO_INIT(SIO_D_PORT,SIO_D_PIN,OUTPUT);
     SIO_C_Set;
     SYSDelay_us(1);
     GPIO_SET(SIO_D_PORT,SIO_D_PIN,1);
     SYSDelay_us(1);
     GPIO_SET(SIO_D_PORT,SIO_D_PIN,0);
 }
void SCCB_write(uint8 ID_Address,uint8 Sub_address,uint8 write_date)
 {
     SCCB_start();
     write_Date((ID_Address<<1)&0xfe);
     write_Date(Sub_address);
     write_Date(write_date);
     SYSDelay_us(3);
     SCCB_stop();
     SYSDelay_us(10);
 }
uint8 SCCB_read(uint8 ID_Address,uint8 Sub_address)
 {
    uint8 i,bit,read_date; 
    SCCB_start();
    write_Date((ID_Address<<1)&0xfe);
    write_Date(Sub_address);
    SYSDelay_us(1);
    SCCB_start();
    write_Date((ID_Address<<1)|0x01);
    GPIO_INIT(SIO_D_PORT,SIO_D_PIN,INPUT);
    for(i=0;i<8;i++)
     {
         SIO_C_Set;
         bit=GPIO_GET(SIO_D_PORT,SIO_D_PIN);
         SYSDelay_us(3);
         read_date|=bit<<(7-i);
         SIO_C_Clear;
         SYSDelay_us(4);
     }
    SIO_C_Set;
    bit=GPIO_GET(SIO_D_PORT,SIO_D_PIN);
    SYSDelay_us(3);
    SIO_C_Clear;
    SYSDelay_us(3);
    SCCB_stop();
    SYSDelay_us(10);
    return read_date;
 }
