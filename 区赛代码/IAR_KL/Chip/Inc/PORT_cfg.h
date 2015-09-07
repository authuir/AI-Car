/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       fire_port_cfg.h
 * @brief      Ұ��K60 ���ùܽ�����
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-06-26
 */
#ifndef _FIRE_DRIVERS_CFG_H_
#define _FIRE_DRIVERS_CFG_H_

#include "MKL_port.h"

/**********************************  UART   ***************************************/

//      ģ��ͨ��    �˿�          ��ѡ��Χ                                    ����
#define UART0_RX_PIN    PTA1       //PTA1��PTA15��PTB16��PTD6��PTE21
#define UART0_TX_PIN    PTA2       //PTA2��PTA14��PTB17��PTD7��PTE20

#define UART1_RX_PIN    PTC3        //PTA18��PTE1��PTC3                       PTA18��Ҫ�� ���뾧���ͻ��
#define UART1_TX_PIN    PTC4        //PTA19��PTE0��PTC4                       PTA19��Ҫ�� ���뾧���ͻ��

#define UART2_RX_PIN    PTD2        //PTD2��PTD4��PTE17��PTE23
#define UART2_TX_PIN    PTD3        //PTD3��PTD5��PTE16��PTE22



/**********************************  TPM    ***************************************/

#define TPM_CLKIN0_PIN  PTC12       //PTA18��PTB16��PTC12��PTE16��PTE29     PTA18��Ҫ�� ���뾧���ͻ��
#define TPM_CLKIN1_PIN  PTC13       //PTA19��PTB17��PTC13��PTE17��PTE30              PTA19��Ҫ�� ���뾧���ͻ��


//      ģ��ͨ��    �˿�          ��ѡ��Χ                                    ����
#define TPM0_CH0_PIN    PTE24        //PTE24��PTA3��PTC1��PTD0                PTA3��Ҫ�ã���SWD��ͻ��
#define TPM0_CH1_PIN    PTE25        //PTE25��PTA4��PTC2��PTD1
#define TPM0_CH2_PIN    PTE29        //PTE29��PTA5��PTC3��PTD2
#define TPM0_CH3_PIN    PTE30        //PTE30��PTA6��PTC4��PTD3
#define TPM0_CH4_PIN    PTE31        //PTE31��PTA7��PTC8��PTD4
#define TPM0_CH5_PIN    PTE26        //PTE26��PTA0��PTC9��PTD5                 PTA0��Ҫ�ã���SWD��ͻ��


//      ģ��ͨ��    �˿�          ��ѡ��Χ                                    ����
#define TPM1_CH0_PIN    PTA12       //PTA12��PTB0��PTE20
#define TPM1_CH1_PIN    PTA13       //PTA13��PTB1��PTE21

//      ģ��ͨ��    �˿�          ��ѡ��Χ                                    ����
#define TPM2_CH0_PIN    PTA1       //PTA1��PTB2��PTB18��PTE22
#define TPM2_CH1_PIN    PTA2       //PTA2��PTB3��PTB19��PTE23



/**********************************  I2C   ***************************************/

//      ģ��ͨ��    �˿�          ��ѡ��Χ                                    ����
#define I2C0_SCL_PIN    PTE24        // PTB0��PTB2��PTC8��PTE19��PTE24
#define I2C0_SDA_PIN    PTE25        // PTB1��PTB3��PTC9��PTE18��PTE25

#define I2C1_SCL_PIN    PTC10       // PTE1��PTA3��PTC1��PTC10                     PTA3��Ҫ�ã���SWD��ͻ��
#define I2C1_SDA_PIN    PTC11       // PTE0��PTA4��PTC2��PTC11


/**********************************  SPI   ***************************************/
//PCS�ӿڣ����õ�ʱ����Ҫע�ͣ��Ͳ�����г�ʼ����Ӧ�Ĺܽ�
//      ģ��ͨ��    �˿�          ��ѡ��Χ                  ����

#define SPI0_SCK_PIN    PTD1        // PTE17��PTA15��PTC5��PTD1
#define SPI0_SOUT_PIN   PTD2        // PTE18��PTE19��PTA16��PTA17��PTC6��PTC7��PTD2��PTD3
#define SPI0_SIN_PIN    PTD3        // PTE18��PTE19��PTA16��PTA17��PTC6��PTC7��PTD2��PTD3

#define SPI0_PCS0_PIN   PTD0        // PTE16��PTA14��PTC4��PTD0


#define SPI1_SCK_PIN    PTE2        // PTB9��PTB11��PTD5��PTE2
#define SPI1_SOUT_PIN   PTE1        // PTB16��PTB17��PTD6��PTD7��PTE1��PTE3
#define SPI1_SIN_PIN    PTE3        // PTB16��PTB17��PTD6��PTD7��PTE1��PTE3��PTE0

#define SPI1_PCS0_PIN   PTE4        // PTB8��PTB10��PTE4

/**********************************  DAC   ***************************************/
#define DAC0_OUT_PIN    PTE30       // PTE30


#endif  //_FIRE_DRIVERS_CFG_H_


