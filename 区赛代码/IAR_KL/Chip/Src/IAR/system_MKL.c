/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       system_MKL.c
 * @brief      ϵͳ������غ���
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-07-02
 */

#include "common.h"
#include "system_MKL.h"
#include "MKL_uart.h"
#include "MKL_wdog.h"
#include "MKL_port.h"
#include "MKL_gpio.h"

int pll_clk_mhz;
int core_clk_khz;
int core_clk_mhz;
int bus_clk_khz;

extern void main(void);
void clk_out_init(void);

/*!
 *  @brief      kinetis L ��������
 *  @since      v1.0
 *  @author     ��˼������˾
 *  @note       �˺�����ϵͳ���������ɻ�ຯ�����ã�Ȼ��ִ��main����
 */
void start(void)
{
    wdog_disable();     // �رտ��Ź�

    common_startup();   // �����ж������� �� ��Ҫ�����ݵ� RAM��

    sysinit();          // ϵͳ��ʼ��������ϵͳƵ�ʣ���ʼ��printf�˿�
    PORT_Enable_ALL();
    main();             // ִ���û�������

    while(1);           // ��ѭ��
}

/*!
 *  @brief      ϵͳ��ʼ��������ϵͳƵ�ʣ���ʼ��printf�˿�
 *  @since      v5.0
 *  @note       �˺�����ϵͳ���������ɻ�ຯ�����ã�Ȼ��ִ��main����
 */
void sysinit (void)
{
    if (PMC_REGSC &  PMC_REGSC_ACKISO_MASK)
        PMC_REGSC |= PMC_REGSC_ACKISO_MASK;

    pll_clk_mhz = pll_init(PLL_CLK);     //����ϵͳʱ��

    core_clk_mhz = pll_clk_mhz / (((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV1_MASK) >> SIM_CLKDIV1_OUTDIV1_SHIFT) + 1);
    core_clk_khz = core_clk_mhz * 1000;     //�����úõ�ʱ�Ӷ�������ȫ�ֱ�����Ա����ʹ��
    bus_clk_khz = core_clk_khz / (((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV4_MASK) >> SIM_CLKDIV1_OUTDIV4_SHIFT) + 1);

    clk_out_init();                   //������֤Ƶ���Ƿ���ȷ

    uart_init (FIRE_PORT, FIRE_BAUD);   //��ʼ��printf�õ��Ĺܽ�
}

/*!
 *  @brief      CLK ʱ����� ��ʼ��
 *  @since      v5.0
 *  @note       ������У��ʱ������Ƿ���ȷ
 *  @author     ��˼������˾
 */
void clk_out_init(void)
{
    SIM_SCGC5 |= ( SIM_SCGC5_PORTC_MASK );
    // If you are using UART1 for serial communications do not
    // initialize the clock out function or you may break the UART!

    /* Enable the CLKOUT function on PTC3 (alt5 function) */
    PORTC_PCR3 = ( PORT_PCR_MUX(0x5));

    /* Select the CLKOUT in the SMI_SOPT2 mux to be bus clk*/
    SIM_SOPT2 |= SIM_SOPT2_CLKOUTSEL(2);

}


/*!
 *  @brief      �����ж������� �� ��Ҫ�����ݵ� RAM��
 *  @since      v5.0
 *  @author     ��˼������˾
 */
#pragma section = ".data"
#pragma section = ".data_init"
#pragma section = ".bss"
#pragma section = "CodeRelocate"
#pragma section = "CodeRelocateRam"

void common_startup(void)
{
    /* Declare a counter we'll use in all of the copy loops */
    uint32 n;

    /* Declare pointers for various data sections. These pointers
     * are initialized using values pulled in from the linker file
     */
    uint8 *data_ram, * data_rom, * data_rom_end;
    uint8 *bss_start, * bss_end;


    /*  VECTOR_TABLE �� VECTOR_RAM �ĵ�ַ��  linker �ļ����� ��*.icf�� */
    extern uint32 __VECTOR_TABLE[];
    extern uint32 __VECTOR_RAM[];

    /* ����ROM����ж�������RAM�� */
    if (__VECTOR_RAM != __VECTOR_TABLE)             //�������RAM����������Ҫ�����ж�������
    {
        for (n = 0; n < 0x104; n++)                 //�������
            __VECTOR_RAM[n] = __VECTOR_TABLE[n];
    }
    /* ָ���µ��ж��������ַΪ __VECTOR_RAM */
    write_vtor((uint32)__VECTOR_RAM);

    /* ���Ѹ���ֵ�ı�����ROM�︴�����ݵ�RAM�� */
    data_ram = __section_begin(".data");            //�Ѹ���ֵ�ı����ĵ�ַ��RAM��
    data_rom = __section_begin(".data_init");       //�Ѹ���ֵ�ı��������ݴ����ROM���Ҫ��ֵ��RAM��
    data_rom_end = __section_end(".data_init");
    n = data_rom_end - data_rom;

    /* ���Ƴ�ʼ�����ݵ�RAM�� */
    while (n--)
        *data_ram++ = *data_rom++;

    /* û����ֵ���߳�ֵΪ0�ı�������Ҫ�����RAM������ݣ�ȷ��ֵΪ0 */
    bss_start = __section_begin(".bss");
    bss_end = __section_end(".bss");

    /* ���û����ֵ���߳�ֵΪ0�ı�������ֵ */
    n = bss_end - bss_start;
    while(n--)
        *bss_start++ = 0;

    /* ��ֵ�� __ramfunc �����ĺ����ĵĴ���ε� RAM�����Լӿ���������        */
    uint8 *code_relocate_ram = __section_begin("CodeRelocateRam");
    uint8 *code_relocate = __section_begin("CodeRelocate");
    uint8 *code_relocate_end = __section_end("CodeRelocate");

    /* ��ROM�︴�ƺ������뵽RAM�� */
    n = code_relocate_end - code_relocate;
    while (n--)
        *code_relocate_ram++ = *code_relocate++;

}
