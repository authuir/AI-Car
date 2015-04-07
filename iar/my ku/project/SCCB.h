#ifndef __SCCB_H__
#define __SCCB_H__

#define SIO_C_PORT  PORTC
#define SIO_C_PIN   12

#define SIO_D_PORT  PORTC
#define SIO_D_PIN   13

#define SIO_C_Set   GPIO_SET(SIO_C_PORT,SIO_C_PIN,1)
#define SIO_C_Clear GPIO_SET(SIO_C_PORT,SIO_C_PIN,0)
void SCCB_init();
void SCCB_write(uint8 ID_Address,uint8 Sub_address,uint8 write_date);
uint8 SCCB_read(uint8 ID_Address,uint8 Sub_address);
void write_Date(uint8 write_date);
void SCCB_start();
void SCCB_stop();

//***************************************
//definationg of 0V7620
//***************************************

#define VSYNC_PORT  PORTB     
#define VSYNC_PIN   20

#define HREF_PORT   PORTC
#define HREF_PIN    3

#define PCLK_PORT   PORTE
#define PCKL_PIN    0

#endif