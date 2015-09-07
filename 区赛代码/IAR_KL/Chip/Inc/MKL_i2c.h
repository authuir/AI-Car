/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,ɽ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�ɽ����̳ http://www.vcan123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����ɽ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��ɽ��Ƽ��İ�Ȩ������
 *
 * @file       MK60_i2c.h
 * @brief      i2c����ͷ�ļ�
 * @author     ɽ��Ƽ�
 * @version    v5.0
 * @date       2013-07-12
 * @note       Ŀǰ��ʵ��������д�Ĵ������ܣ��������ܴ�ʵ��
 */

#define	L3G4200_Addr   0x69	 //����������IIC�����еĴӵ�ַ,����ALT  ADDRESS��ַ���Ų�ͬ�޸�
//#define	L3G4200_Addr    0xD3  

#ifndef     __MK60_I2C_H__
#define     __MK60_I2C_H__
/**
 *  @brief I2Cģ����
 */
typedef enum
{
    I2C0  = 0,
    I2C1  = 1
} I2Cn_e;

/**
 *  @brief ������дģʽѡ��
 */
typedef enum MSmode
{
    MWSR =   0x00,  /* ����дģʽ  */
    MRSW =   0x01   /* ������ģʽ  */
} MSmode;

//**********L3G4200D�ڲ��Ĵ�����ַ*********
#define WHO_AM_I 0x0F
#define CTRL_REG1 0x20
#define CTRL_REG2 0x21
#define CTRL_REG3 0x22
#define CTRL_REG4 0x23
#define CTRL_REG5 0x24
#define REFERENCE 0x25
#define OUT_TEMP 0x26
#define STATUS_REG 0x27
#define OUT_X_L 0x28
#define OUT_X_H 0x29
#define OUT_Y_L 0x2A
#define OUT_Y_H 0x2B
#define OUT_Z_L 0x2C
#define OUT_Z_H 0x2D
#define FIFO_CTRL_REG 0x2E
#define FIFO_SRC_REG 0x2F
#define INT1_CFG 0x30
#define INT1_SRC 0x31
#define INT1_TSH_XH 0x32
#define INT1_TSH_XL 0x33
#define INT1_TSH_YH 0x34
#define INT1_TSH_YL 0x35
#define INT1_TSH_ZH 0x36
#define INT1_TSH_ZL 0x37
#define INT1_DURATION 0x38

extern unsigned char device_id;   //WHO_AM_I

extern unsigned char angel_TX_DATA[4];  
extern unsigned char angel_BUF[8];                         //�������ݻ�����
extern char  angel_test; 
extern short angel_T_X,angel_T_Y,angel_T_Z;



//Ŀǰ�����֧�� I2C����ģʽ
uint32  i2c_init(I2Cn_e i2cn, uint32 baud);                               //��ʼ��I2C
void    i2c_write_reg(I2Cn_e, uint8 SlaveID, uint8 reg, uint8 Data);      //д�����ݵ��Ĵ���
uint8   i2c_read_reg (I2Cn_e, uint8 SlaveID, uint8 reg);                  //��ȡ�Ĵ���������
void Init_L3G4200D(void);
uint8 IS_Meet_Mount();

#endif  //__MK60_I2C_H__
