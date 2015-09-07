/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MK60_mcg.h
 * @brief      MCG PLL����
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-06-29
 */


#ifndef __MK60_MCG_H__
#define __MK60_MCG_H__

#include "common.h"

/********************************************************************/
typedef enum
{
    PLLUSR      ,  //�Զ������÷�Ƶϵ��ģʽ��ֱ�Ӽ��� ȫ�ֱ��� mcg_div ��ֵ
    PLL48,
    PLL64,
    PLL66,
    PLL68,
    PLL72,
    PLL80,
    PLL96,
    PLL128,
    PLL136,
    PLL148,
    PLL200,
    PLL220,

    PLL_MAX,
} PLL_e;

typedef struct
{
    uint16  clk;         //
    uint8   prdiv;       //�ⲿ�����Ƶ����ѡ��
    uint8   vdiv;        //�ⲿ����Ƶ����ѡ��
} mcg_cfg_t;

//ʱ�ӷ�Ƶ����
typedef struct
{
    uint8 core_div;    //�ں�ʱ�ӷ�Ƶ����
    uint8 bus_div;     //����ʱ�ӷ�Ƶ����  �� flashʱ�ӷ�Ƶ����
} mcg_div_t;


uint8 pll_init(PLL_e pll);

__RAMFUNC    void set_sys_dividers(uint32 outdiv1, uint32 outdiv2, uint32 outdiv3, uint32 outdiv4);

/********************************************************************/
#endif /* __MK60_MCG_H__ */
