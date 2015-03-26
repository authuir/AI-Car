#ifndef __CAMERA_H__
#define __CAMERA_H__


#define SCCB_ID   			0X42  			//OV7670µÄID
#define VSYNC_PORT  PORTB     
#define VSYNC_PIN   20
#define OV7670_SCCB_SDA_PORT    PORTC
#define OV7670_SCCB_SDA_PIN     11
#define OV7670_SCCB_SCL_PORT    PORTC
#define OV7670_SCCB_SCL_PIN     10

#define FIFO_RRST_PORT PORTC
#define FIFO_RRST_PIN  3

#define FIFO_RCK_PORT   PORTB
#define FIFO_RCK_PIN    21

#define FIFO_WR_PORT    PORTC
#define FIFO_WR_PIN     1

#define FIFO_OE_PORT    PORTB
#define FIFO_OE_PIN     19

#define FIFO_WRST_PORT  PORTC
#define FIFO_WRST_PIN   2

#define OV_Reset_PORT   PORTC
#define OV_Reset_PIN    0

#define OV_PWDN_PORT    PORTB
#define OV_PWDN_PIN     22


#define FIFO_RRST_Set   GPIO_SET(FIFO_RRST_PORT,FIFO_RRST_PIN,1)
#define FIFO_RRST_Clear GPIO_SET(FIFO_RRST_PORT,FIFO_RRST_PIN,0)

#define FIFO_RCK_Set   GPIO_SET(FIFO_RCK_PORT,FIFO_RCK_PIN,1)
#define FIFO_RCK_Clear GPIO_SET(FIFO_RCK_PORT,FIFO_RCK_PIN,0)

#define FIFO_WR_Set   GPIO_SET(FIFO_WR_PORT,FIFO_WR_PIN,1)
#define FIFO_WR_Clear GPIO_SET(FIFO_WR_PORT,FIFO_WR_PIN,0)

#define FIFO_OE_Set   GPIO_SET(FIFO_OE_PORT,FIFO_OE_PIN,1)
#define FIFO_OE_Clear GPIO_SET(FIFO_OE_PORT,FIFO_OE_PIN,0)

#define FIFO_WRST_Set   GPIO_SET(FIFO_WRST_PORT,FIFO_WRST_PIN,1)
#define FIFO_WRST_Clear GPIO_SET(FIFO_WRST_PORT,FIFO_WRST_PIN,0)

#define OV_Reset_Set     GPIO_SET(OV_Reset_PORT,OV_Reset_PIN,1)
#define OV_Reset_Clear   GPIO_SET(OV_Reset_PORT,OV_Reset_PIN,0)

#define OV_PWDN_Set     GPIO_SET(OV_PWDN_PORT,OV_PWDN_PIN,1)
#define OV_PWDN_Clear   GPIO_SET(OV_PWDN_PORT,OV_PWDN_PIN,0)

#define OV_SDA_Set      GPIO_SET(OV7670_SCCB_SDA_PORT,OV7670_SCCB_SDA_PIN,1)
#define OV_SDA_Clear    GPIO_SET(OV7670_SCCB_SDA_PORT,OV7670_SCCB_SDA_PIN,0)

#define OV_SCL_Set      GPIO_SET(OV7670_SCCB_SCL_PORT,OV7670_SCCB_SCL_PIN,1)
#define OV_SCL_Clear    GPIO_SET(OV7670_SCCB_SCL_PORT,OV7670_SCCB_SCL_PIN,0)


void Camera_pin_init();
void SCCB_7670_Start(void);
void SCCB_7670_Stop(void);
void SCCB_No_Ack(void);
uint8 SCCB_WR_Byte(uint8 dat);
uint8 SCCB_RD_Byte(void);
uint8 SCCB_WR_Reg(uint8 reg,uint8 data);
uint8 SCCB_RD_Reg(uint8 reg);

void init_rgb565_qvga_25fps_new(void);
void init_rgb565_qvga_25fps(void);
void init_rgb565_qvga_12fps(void);
void init_yuv_12fps(void);
void init_yuv_25fps(void);
#endif