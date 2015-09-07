/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MKL_mcg.c
 * @brief      MCG PLL����
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-06-29
 */


#include "common.h"
#include "MKL_mcg.h"


mcg_cfg_t mcg_cfg[PLL_MAX] =
{
    {EXTAL_IN_MHz / (PRDIV + 1)*(VDIV + 24), PRDIV, VDIV}, //PLLUSR
    {48,    3,     0       },                          //PLL48
    {64,    2,     0       },                          //PLL64
    {66,    3,     9       },                          //PLL66
    {68,    3,     10      },                          //PLL68
    {72,    2,     3       },                          //PLL72
    {80,    2,     6       },                          //PLL80
    {96,    1,     0       },                          //PLL96
    {128,   2,     24       },                         //PLL128
    {136,   1,     10       },                         //PLL136
    {148,   1,     13       },                         //PLL148
    {200,   1,     26       },                         //PLL148
    {220,   1,     31       },                         //PLL200
};

mcg_div_t mcg_div = {CORE_DIV, BUS_DIV};


/*!
 *  @brief      MCG ��Ƶ����
 *  @param      PLL_e       Ƶ�����ò���
 *  @since      v5.0
 */
void mcg_div_count(PLL_e pll)
{
    uint16 clk = mcg_cfg[pll].clk;
    if( (pll > PLLUSR) && (pll < PLL_MAX) )
    {
        //���÷�Ƶ
        if      (clk <= 1 * MAX_CORE_CLK)   mcg_div.core_div = 0;          // core  = MCG
        else if(clk <= 2 * MAX_CORE_CLK)   mcg_div.core_div = 1;          // core  = MCG/2
        else if(clk <= 3 * MAX_CORE_CLK)   mcg_div.core_div = 2;          // core  = MCG/3
        else if(clk <= 4 * MAX_CORE_CLK)   mcg_div.core_div = 3;          // core  = MCG/4
        else if(clk <= 5 * MAX_CORE_CLK)   mcg_div.core_div = 4;          // core  = MCG/5
        else if(clk <= 6 * MAX_CORE_CLK)   mcg_div.core_div = 5;          // core  = MCG/6
        else if(clk <= 7 * MAX_CORE_CLK)   mcg_div.core_div = 6;          // core  = MCG/7
        else if(clk <= 8 * MAX_CORE_CLK)   mcg_div.core_div = 7;          // core  = MCG/8
        else if(clk <= 9 * MAX_CORE_CLK)   mcg_div.core_div = 8;          // core  = MCG/9
        else if(clk <= 10 * MAX_CORE_CLK)   mcg_div.core_div = 9;         // core  = MCG/10
        else if(clk <= 11 * MAX_CORE_CLK)   mcg_div.core_div = 10;        // core  = MCG/11
        else if(clk <= 12 * MAX_CORE_CLK)   mcg_div.core_div = 11;        // core  = MCG/12
        else if(clk <= 13 * MAX_CORE_CLK)   mcg_div.core_div = 12;        // core  = MCG/13
        else if(clk <= 14 * MAX_CORE_CLK)   mcg_div.core_div = 13;        // core  = MCG/14
        else if(clk <= 15 * MAX_CORE_CLK)   mcg_div.core_div = 14;        // core  = MCG/15
        else                              mcg_div.core_div = 15;         // core  = MCG/16


        //bus Ƶ�� �� sys ��Ƶ����
        clk = mcg_cfg[pll].clk /(mcg_div.core_div+1);


        if     (clk <= 1 * MAX_BUS_CLK)   mcg_div.bus_div = 0;          // bus  = MCG
        else if(clk <= 2 * MAX_BUS_CLK)   mcg_div.bus_div = 1;          // bus  = MCG/2
        else if(clk <= 3 * MAX_BUS_CLK)   mcg_div.bus_div = 2;          // bus  = MCG/3
        else if(clk <= 4 * MAX_BUS_CLK)   mcg_div.bus_div = 3;          // bus  = MCG/4
        else if(clk <= 5 * MAX_BUS_CLK)   mcg_div.bus_div = 4;          // bus  = MCG/5
        else if(clk <= 6 * MAX_BUS_CLK)   mcg_div.bus_div = 5;          // bus  = MCG/6
        else if(clk <= 7 * MAX_BUS_CLK)   mcg_div.bus_div = 6;          // bus  = MCG/7
        else if(clk <= 8 * MAX_BUS_CLK)   mcg_div.bus_div = 7;          // bus  = MCG/8
        else if(clk <= 9 * MAX_BUS_CLK)   mcg_div.bus_div = 8;          // bus  = MCG/9
        else if(clk <= 10 * MAX_BUS_CLK)   mcg_div.bus_div = 9;         // bus  = MCG/10
        else if(clk <= 11 * MAX_BUS_CLK)   mcg_div.bus_div = 10;        // bus  = MCG/11
        else if(clk <= 12 * MAX_BUS_CLK)   mcg_div.bus_div = 11;        // bus  = MCG/12
        else if(clk <= 13 * MAX_BUS_CLK)   mcg_div.bus_div = 12;        // bus  = MCG/13
        else if(clk <= 14 * MAX_BUS_CLK)   mcg_div.bus_div = 13;        // bus  = MCG/14
        else if(clk <= 15 * MAX_BUS_CLK)   mcg_div.bus_div = 14;        // bus  = MCG/15
        else                              mcg_div.bus_div = 15;         // bus  = MCG/16

    }
}

/*!
 *  @brief      PLL��Ƶ
 *  @param      PLL_e       Ƶ�����ò���
 *  @return     ��ƵƵ�ʣ�MHz��
 *  @since      v5.0
 *  @warning    �˺���ֻ���� ��λ��û�����κ�Ƶ����������µ��ã���MCG��FEIģʽ�²ſɵ���
 *  Sample usage:       uint8 clk = pll_init(PLL100);        //��Ƶ
 */
uint8 pll_init(PLL_e pll)
{

    mcg_div_count( pll);

    SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;      //PTA18 �� PTA19 ���� ����

    // set clock dividers to desired value
    SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(mcg_div.core_div) |  SIM_CLKDIV1_OUTDIV4(mcg_div.bus_div);


    //�ϵ縴λ�󣬵�Ƭ�����Զ����� FEI ģʽ��ʹ�� �ڲ��ο�ʱ��

    //FEI -> FBE
    OSC0_CR  =  ( 0
                  | OSC_CR_ERCLKEN_MASK     //ʹ�� �ⲿ�ο�ʱ��
                  //| OSC_CR_SC2P_MASK      //���õ���
                  //| OSC_CR_SC4P_MASK      //���õ���
                  //| OSC_CR_SC8P_MASK      //���õ���
                  | OSC_CR_SC16P_MASK       //���õ���
                 );

    MCG_C2 =    ( 0
                | MCG_C2_RANGE0(2)
                | MCG_C2_EREFS0_MASK
                );

    MCG_C1 = (0
              | MCG_C1_CLKS(2)
              | MCG_C1_FRDIV(7)
              | MCG_C1_IRCLKEN_MASK
              );

    while (MCG_S & MCG_S_IREFST_MASK) {};                       //�ȴ�FLL�ο�ʱ�� Ϊ �ⲿ�ο�ʱ�ӣ�S[IREFST]=0����ʾʹ���ⲿ�ο�ʱ�ӣ���

    while ((MCG_S & MCG_S_CLKST_MASK)  != MCG_S_CLKST(0x2)) {}; //�ȴ�ѡ���ⲿ�ο�ʱ��

    //�����Ѿ������� FBEģʽ

    //FBE -> PBE


    MCG_C5 = MCG_C5_PRDIV0(mcg_cfg[pll].prdiv);                      //��Ƶ�� EXTAL_IN_MHz/( PRDIV+1)
    MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV0(mcg_cfg[pll].vdiv) ;    //��Ƶ�� EXTAL_IN_MHz/( PRDIV+1)  * (VDIV+24)

    while (!(MCG_S & MCG_S_PLLST_MASK)) {};                         //�ȴ�ʱ��Դѡ��PLL

    while (!(MCG_S & MCG_S_LOCK0_MASK)) {};                          //�ȴ� PLL���ˣ����໷��

    // �����Ѿ������� PBE ģʽ

    // PBE -> PEE
    //MCG_C1 &= ~MCG_C1_CLKS_MASK;
    MCG_C1 = MCG_C1_IRCLKEN_MASK;

    while (((MCG_S & MCG_S_CLKST_MASK) ) != MCG_S_CLKST(0x3)) {};//�ȴ�ѡ�����PLL

    // �����Ѿ������� PEE ģʽ

    return mcg_cfg[pll].clk;
} //pll_init


