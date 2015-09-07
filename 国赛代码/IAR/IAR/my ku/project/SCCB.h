#ifndef __SCCB_H__
#define __SCCB_H__

//自己焊的
#if 0
#define SIO_C_PORT  PORTB
#define SIO_C_PIN   23

#define SIO_D_PORT  PORTB
#define SIO_D_PIN   19
#endif

//智能车
#if 1
#define SIO_C_PORT  PORTC
#define SIO_C_PIN   12

#define SIO_D_PORT  PORTC
#define SIO_D_PIN   13
#endif


#define SIO_C_Set   GPIO_SET(SIO_C_PORT,SIO_C_PIN,1)
#define SIO_C_Clear GPIO_SET(SIO_C_PORT,SIO_C_PIN,0)

#define SIO_D_Set   GPIO_SET(SIO_D_PORT,SIO_D_PIN,1)
#define SIO_D_Clear GPIO_SET(SIO_D_PORT,SIO_D_PIN,0)
void SCCB_init();
void SCCB_write(uint8 ID_Address,uint8 Sub_address,uint8 write_date);
uint8 SCCB_read(uint8 ID_Address,uint8 Sub_address);
void write_Date(uint8 write_date);
void SCCB_start();
void SCCB_stop();


uint8 MT34_init();
uint16 MT34_Read(uint8 slave_add,uint8 register_add);
uint8 MT34_Write(uint8 slave_add,uint8 register_add,uint16 date);
//***************************************
//definationg of 0V7620
//***************************************
//自己焊的
#if 0
#define VSYNC_PORT  PORTB     
#define VSYNC_PIN   20

#define HREF_PORT   PORTC
#define HREF_PIN    3

#define PCLK_PORT   PORTE
#define PCKL_PIN    0
#endif


#if 1
#define VSYNC_PORT  PORTC   
#define VSYNC_PIN   17

#define HREF_PORT   PORTC
#define HREF_PIN    15

#define PCLK_PORT   PORTC
#define PCKL_PIN    14
#endif

//*******************************************
//defination of CATCH CAM
//*******************************************
#define cat_address 0xdc

uint8 SCCB_Catch(void);



#define TIMEOUT_MAX      				10000

#define BINNING_ROW_A					4
#define BINNING_COLUMN_A				4
#define BINNING_ROW_B					2
#define BINNING_COLUMN_B				2
#define MINIMUM_HORIZONTAL_BLANKING		91 // see datasheet
#define MAX_IMAGE_HEIGHT				480
#define MAX_IMAGE_WIDTH					752
#define MINIMUM_COLUMN_START			1
#define MINIMUM_ROW_START				4

/* Camera I2C registers */
#define mt9v034_DEVICE_WRITE_ADDRESS    0xB8
#define mt9v034_DEVICE_READ_ADDRESS     0xB9

/* Context A */
#define MTV_COLUMN_START_REG_A  		0x01
#define MTV_ROW_START_REG_A     		0x02
#define MTV_WINDOW_HEIGHT_REG_A 		0x03
#define MTV_WINDOW_WIDTH_REG_A  		0x04
#define MTV_HOR_BLANKING_REG_A  		0x05
#define MTV_VER_BLANKING_REG_A  		0x06
#define MTV_COARSE_SW_1_REG_A			0x08
#define MTV_COARSE_SW_2_REG_A			0x09
#define MTV_COARSE_SW_CTRL_REG_A		0x0A
#define MTV_COARSE_SW_TOTAL_REG_A 		0x0B
#define MTV_FINE_SW_1_REG_A				0xD3
#define MTV_FINE_SW_2_REG_A				0xD4
#define MTV_FINE_SW_TOTAL_REG_A			0xD5
#define MTV_READ_MODE_REG_A        		0x0D
#define MTV_V1_CTRL_REG_A				0x31
#define MTV_V2_CTRL_REG_A				0x32
#define MTV_V3_CTRL_REG_A				0x33
#define MTV_V4_CTRL_REG_A				0x34
#define MTV_ANALOG_GAIN_CTRL_REG_A		0x35

/* Context B */
#define MTV_COLUMN_START_REG_B  		0xC9
#define MTV_ROW_START_REG_B     		0xCA
#define MTV_WINDOW_HEIGHT_REG_B 		0xCB
#define MTV_WINDOW_WIDTH_REG_B  		0xCC
#define MTV_HOR_BLANKING_REG_B  		0xCD
#define MTV_VER_BLANKING_REG_B  		0xCE
#define MTV_COARSE_SW_1_REG_B			0xCF
#define MTV_COARSE_SW_2_REG_B			0xD0
#define MTV_COARSE_SW_CTRL_REG_B		0xD1
#define MTV_COARSE_SW_TOTAL_REG_B 		0xD2
#define MTV_FINE_SW_1_REG_B				0xD6
#define MTV_FINE_SW_2_REG_B				0xD7
#define MTV_FINE_SW_TOTAL_REG_B			0xD8
#define MTV_READ_MODE_REG_B        		0x0E
#define MTV_V1_CTRL_REG_B				0x39
#define MTV_V2_CTRL_REG_B				0x3A
#define MTV_V3_CTRL_REG_B				0x3B
#define MTV_V4_CTRL_REG_B				0x3C
#define MTV_ANALOG_GAIN_CTRL_REG_B		0x36

/* General Registers */
#define MTV_CHIP_VERSION_REG    		0x00
#define MTV_CHIP_CONTROL_REG    		0x07
#define MTV_SOFT_RESET_REG      		0x0C

#define MTV_HDR_ENABLE_REG				0x0F
#define MTV_ADC_RES_CTRL_REG			0x1C
#define MTV_ROW_NOISE_CORR_CTRL_REG		0x70
#define MTV_TEST_PATTERN_REG       		0x7F
#define MTV_TILED_DIGITAL_GAIN_REG		0x80
#define MTV_AGC_AEC_DESIRED_BIN_REG		0xA5
#define MTV_MAX_GAIN_REG        		0xAB
#define MTV_MIN_EXPOSURE_REG       		0xAC  // datasheet min coarse shutter width
#define MTV_MAX_EXPOSURE_REG       		0xAD  // datasheet max coarse shutter width
#define MTV_AEC_AGC_ENABLE_REG			0xAF
#define MTV_AGC_AEC_PIXEL_COUNT_REG		0xB0
#define MTV_AEC_UPDATE_REG				0xA6
#define MTV_AEC_LOWPASS_REG				0xA8
#define MTV_AGC_UPDATE_REG				0xA9
#define MTV_AGC_LOWPASS_REG				0xAA
#define MTV_DIGITAL_TEST_REG			0x7F

/*
 * Resolution:
 * ROW_SIZE * BINNING_ROW <= MAX_IMAGE_WIDTH
 * COLUMN_SIZE * BINNING_COLUMN <= MAX_IMAGE_HEIGHT
 */

#define FULL_IMAGE_SIZE (188*120)
#define FULL_IMAGE_ROW_SIZE (188)
#define FULL_IMAGE_COLUMN_SIZE (120)

#endif