/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       FIRE_MK60_conf.h
 * @brief      Ұ��K60 ƽ̨�����ļ�
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-06-26
 */

#ifndef __FIRE_MK60_CONF_H__
#define __FIRE_MK60_CONF_H__

#include    "MKL_mcg.h"

/*
 * ѡ���Ƿ����������Ϣ���������ע������ĺ궨��
 */
#define DEBUG_PRINT

/*
 * ���徧��ʱ�ӣ���λΪMHz
 */
#define EXTAL_IN_MHz            (8)

/*
 * ���� PLL ��Ƶ Ƶ��
 */
#define PLL_CLK                PLL220      // �� PLL_e ��ѡ�� ���ṩ�� ���÷���
                                          // core/bus Ƶ�� ���� pll ��������Ƶ����

#define MAX_CORE_CLK            110        // core     (bus        >= pll/16  )
#define MAX_BUS_CLK             40         // bus      (bus        >= core/16  )



/*********************   �Զ��� ʱ��Ƶ�� ��Ƶ����   ********************/
//��� CORE_CLK Ϊ PLLUSR ����Ϊ�Զ���ģʽ ������������Ч
#define PRDIV             10        // MCG_CLK_MHZ = EXTAL_IN_MHz/(PRDIV+1)*(VDIV+24)
#define VDIV              29
#define CORE_DIV          0         //  core = mcg/ ( CORE_DIV  + 1 )
#define BUS_DIV           1         //  bus  = mcg/ ( BUS_DIV   + 1 )



/*
 * ���� printf���� �� ��������˿� �� ������Ϣ
 */
#define FIRE_PORT           UART0
#define FIRE_BAUD           115200

/*
 * ������ʱ����
 */
#if  0
#include "MKL_lptmr.h"
#define     DELAY()         lptmr_delay_ms(500)
#define     DELAY_MS(ms)    lptmr_delay_ms(ms)
#define     DELAY_US(us)    lptmr_delay_us(us)
#elif   0
#include "MKL_pit.h"
#define DELAY()         pit_delay_ms(PIT1,500)
#define DELAY_MS(ms)    pit_delay_ms(PIT1,ms)
#define DELAY_US(us)    pit_delay_us(PIT1,us)
#else
#include "MKL_SysTick.h"
#define DELAY()         systick_delay_ms(500)
#define DELAY_MS(ms)    systick_delay_ms(ms)
#define DELAY_US(us)    systick_delay_us(us)
#endif


/*
 * ���ö��Ժ���ʵ�ֺ���
 */
void assert_failed(char *, int);

#if ( defined( DEBUG ) && defined( DEBUG_PRINT ))
#define ASSERT(expr) \
    if (!(expr)) \
        assert_failed(__FILE__, __LINE__)
#else
#define ASSERT(expr)
#endif

/*
 * ���õ����������
 */
#if( defined(DEBUG) && defined(DEBUG_PRINT))
#define DEBUG_PRINTF(FORMAT,...)        do{printf(FORMAT,##__VA_ARGS__);}while(0)	/*�����ӡ������Ϣʱ���뽫������ע�͵�*/
#else
#define DEBUG_PRINTF(FORMAT,...)
#endif

/*
 * ����ǰ��⣬��ֹ �������ؿ�
 */
void start_check();
#ifdef DEBUG
#define SRART_CHECK()       start_check()
#else
#define SRART_CHECK()
#endif


#endif /* __FIRE_MK60_CONF_H__  */
