#ifndef __CAMERA_7670_H__
#define __CAMERA_7670_H__

#define FIFO_RRST_PORT PORTC
#define FIFO_RRST_PIN  4

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

void Camera_pin_init();

void init_rgb565_qvga_25fps_new(void);
void init_rgb565_qvga_25fps(void);
void init_rgb565_qvga_12fps(void);
void init_yuv_12fps(void);
void init_yuv_25fps(void);
#endif