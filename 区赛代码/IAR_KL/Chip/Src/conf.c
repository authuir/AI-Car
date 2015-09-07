/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       FIRE_MKL_conf.c
 * @brief      Ұ��KL26 ƽ̨���ù���ʵ���ļ�
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-06-26
 */

#include    "common.h"
#include    "stdio.h"
#include    "MKL_uart.h"
//#include    "FIRE_KEY.h"
//#include    "FIRE_LED.h"
//#include    "MK60_flash.h"


/*!
 *  @brief      ����ʧ����ִ�еĺ���
 *  @param      file    �ļ�·����ַ
 *  @param      line    ����
 *  @since      v5.0
 *  Sample usage:       assert_failed(__FILE__, __LINE__);
 */
const char ASSERT_FAILED_STR[] = "Assertion failed in %s at line %d\n";

void assert_failed(char *file, int line)
{
   /* printf(ASSERT_FAILED_STR, file, line);      //ͨ��������ʾ����ʧ��

    while (1)
    {
        //��ѭ���ȴ�����Ա���Ϊ�ζ���ʧ��

    }*/
}

/*!
 *  @brief      �ض���printf ������
 *  @param      ch      ��Ҫ��ӡ���ֽ�
 *  @param      stream  ������
 *  @since      v5.0
 *  @note       �˺����ɱ������Դ������printf������
 */
int fputc(int ch, FILE *stream)
{
    uart_putchar(FIRE_PORT, (char)ch);
    return(ch);
}

/*!
 *  @brief      ����ǰ���м�⣨��ⰴ���Ƿ��£������������ѭ������ֹ���� main ����,�ɿ��������ٰ�������н�����
 *  @since      v5.0
 *  @note       �˺����ɱ��� ���ؿ��� main ǰ �����˵����޷����ص�����
 */
void start_check()
{
#if 0
    uint8 flag = 0;

    key_init(KEY_A);

    if(key_check(KEY_A) == KEY_DOWN )
    {
        //��������

        led_init(LED0);

        while(1)
        {

            if(key_check(KEY_A) == KEY_UP)
            {
                flag = 1;
            }

            led_turn(LED0);
            printf("\n������ѭ���ȴ���");
            DELAY_MS(500);                          //�˴�����ʱ������ ���� �����Ĺ���

            //��� �Ϳ��������ٰ��� �������� ���н��� ����
            if((flag == 1)  && (key_check(KEY_A) == KEY_DOWN ))
            {
                while(key_check(KEY_A) == KEY_DOWN)         //�ȴ����� ����
                {
                    led_turn(LED0);
                    DELAY_MS(100);                          //�˴�����ʱ������ ���� �����Ĺ���
                }

                while(key_check(KEY_A) == KEY_UP)         //�ȴ����� ����� �� ���н���
                {
                    led_turn(LED0);
                    DELAY_MS(50);                          //�˴�����ʱ������ ���� �����Ĺ���
                }

                printf("\n���н���������������ˢ��̼�");

                //������Ƭ��
                flash_init();
                DELAY_MS(100);
                flash_erase_sector(0);        //�������� 0  (����)
                NVIC_SystemReset();           //��λ��Ƭ��

            }
        }
    }
#endif
}

#ifdef  DEBUG
// VECTOR_TABLE end
static char vector_str[][9];
#endif

/*!
 *  @brief      Ĭ���жϷ�����
 *  @since      v5.0
 *  @note       �˺���д���ж������������Ҫ�û�ִ��
 */
void default_isr(void)
{
#define VECTORNUM                     (*(volatile uint32_t*)(0xE000ED04))

//#ifdef  DEBUG

  //  uint8 vtr = VECTORNUM;
   // DEBUG_PRINTF("\n****default_isr entered on vector %d*****\r\n\n%s Interrupt", vtr, vector_str[vtr]);


//#endif
    return;
}

#ifdef DEBUG

char vector_str[][9] =
{
    /******  Cortex-M4 Processor Exceptions Numbers ****************************************************************/
    "RES",                         //0
    "RES",
    "NMI"               , /*!< 2 Non Maskable Interrupt                              */
    "HardFault"                 , /*!< 3 Hard Fault                                          */
    "RES"                          ,
    "RES"                          ,
    "RES"                          ,
    "RES"                          , //7
    "RES"                          ,
    "RES"                          , //9
    "RES"                          ,
    "SVCall"                    , /*!< 11 SV Call Interrupt                        */
    "RES"              ,
    "RES",
    "PendSV"                    , /*!< 14 Pend SV Interrupt                        */
    "SysTick"                   , /*!< 15 System Tick Interrupt                    */
    /******  Kinetis 60 specific Interrupt Numbers **********************************************************************/
    "DMA0"                      , // DMA Channel 0 Transfer Complete
    "DMA1"                      , // DMA Channel 1 Transfer Complete
    "DMA2"                      , // DMA Channel 2 Transfer Complete
    "DMA3"                      , // DMA Channel 3 Transfer Complete
    "DMA4"                      , // DMA Channel 4 Transfer Complete
    "RES"                       ,
    "FTFA"                      , // FTFA Interrupt
    "LVD_LVW"                   , // Low Voltage Detect, Low Voltage Warning
    "LLW"                       , // Low Leakage Wakeup
    "I2C0"                      , // I2C0 interrupt
    "I2C1"                      , // I2C1 interrupt
    "SPI0"                      , // SPI0 Interrupt
    "SPI1"                      , // SPI1 Interrupt
    "UART0"                     , // UART0 status/error interrupt
    "UART1"                     , // UART1 status/error interrupt
    "UART2"                     , // UART2 status/error interrupt
    "ADC0"                      , // ADC0 interrupt

    "CMP0"                      , // CMP0 interrupt

    "TPM0"                      , // TPM0 fault, overflow and channels interrupt
    "TPM1"                      , // TPM1 fault, overflow and channels interrupt
    "TPM2"                      , // TPM2 fault, overflow and channels interrupt

    "RTC"                       , // RTC interrupt
    "RTC_Sec"                   , // RTC seconds interrupt
    "PIT"                      , // PIT timer interrupt

    "I2S0"                      , // I2S0 Interrupt
    "USB0"                      , // USB0 interrupt
    "DAC0"                      , // DAC0 interrupt

    "TSI0"                      , // TSI0 Interrupt
    "MCG"                       , // MCG Interrupt

    "LPTMR"                     , // LPTimer interrupt
    "RES"                       , //
    "PTA"                       , // Port A interrupt
    "PTC_PTD"                   , // Port C & D interrupt
};
#endif