/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MKL_uart.c
 * @brief      uart���ں���
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-06-26
 */


#include "common.h"
#include "MKL_uart.h"

UART_MemMapPtr UARTN[UART_MAX] = {(UART_MemMapPtr)UART0_BASE_PTR, UART1_BASE_PTR, UART2_BASE_PTR}; //��������ָ�����鱣�� UARTN �ĵ�ַ
                                                                                                   //ע�⣬uart0 �� �ṹ�� �� �������� ��һ����

/*!
 *  @brief      ��ʼ�����ڣ����ò�����
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @param      baud        �����ʣ���9600��19200��56000��115200��
 *  @since      v5.0
 *  @note       UART���õĹܽ��� fire_drivers_cfg.h ��������ã�
                printf���õĹܽźͲ������� k60_fire.h ���������
 *  Sample usage:       uart_init (UART3, 9600);        //��ʼ������3��������Ϊ9600
 */

void uart_init (UARTn_e uratn, uint32 baud)
{
    register uint16 sbr, osr;
    uint8 temp;
    uint32 sysclk,tmp_baud;     //ʱ��
    uint16 tmp_diff=~0,tmp_sbr,diff_abs_baud;

    /* ���� UART���ܵ� ���ùܽ� */
    switch(uratn)
    {
    case UART0:
        SIM_SCGC4 |= SIM_SCGC4_UART0_MASK;      //ʹ�� UART0 ʱ��

        if(UART0_RX_PIN == PTA1)
        {
            port_init( UART0_RX_PIN, ALT2);
        }
        else if((UART0_RX_PIN == PTA15)  || (UART0_RX_PIN == PTB16) || (UART0_RX_PIN == PTD6) )
        {
            port_init( UART0_RX_PIN, ALT3);
        }
        else
        {
            ASSERT(0);                           //���������������㣬ֱ�Ӷ���ʧ���ˣ����ùܽ�����
        }

        if(UART0_TX_PIN == PTA2)
        {
            port_init( UART0_TX_PIN, ALT2);
        }
        else if((UART0_TX_PIN == PTA14)  || (UART0_TX_PIN == PTB17) || (UART0_TX_PIN == PTD7) )
        {
            port_init( UART0_TX_PIN, ALT3);
        }
        else
        {
            ASSERT(0);                           //���������������㣬ֱ�Ӷ���ʧ���ˣ����ùܽ�����
        }

        break;

    case UART1:
        SIM_SCGC4 |= SIM_SCGC4_UART1_MASK;

        if((UART1_RX_PIN == PTA18) || (UART1_RX_PIN == PTC3) || (UART1_RX_PIN == PTE1) )
        {
            port_init( UART1_RX_PIN, ALT3);
        }
        else
        {
            ASSERT(0);                           //���������������㣬ֱ�Ӷ���ʧ���ˣ����ùܽ�����
        }

        if((UART1_TX_PIN == PTA19)  || (UART1_TX_PIN == PTC4) || (UART1_TX_PIN == PTE0) )
        {
            port_init( UART1_TX_PIN, ALT3);
        }
        else
        {
            ASSERT(0);                           //���������������㣬ֱ�Ӷ���ʧ���ˣ����ùܽ�����
        }

        break;

    case UART2:
        SIM_SCGC4 |= SIM_SCGC4_UART2_MASK;

        if((UART2_RX_PIN == PTD2) || (UART2_RX_PIN == PTD4) || (UART2_RX_PIN == PTE17))
        {
            port_init( UART2_RX_PIN, ALT3);
        }
        else if(UART2_RX_PIN == PTE23)
        {
            port_init( UART2_RX_PIN, ALT4);
        }
        else
        {
            ASSERT(0);                           //���������������㣬ֱ�Ӷ���ʧ���ˣ����ùܽ�����
        }

        if((UART2_TX_PIN == PTD3) || (UART2_TX_PIN == PTD5) || (UART2_TX_PIN == PTE16))
        {
            port_init( UART2_TX_PIN, ALT3);
        }
        else if(UART2_TX_PIN == PTE22)
        {
            port_init( UART2_TX_PIN, ALT4);
        }
        break;


    default:
        break;
    }

    if( uratn == UART0)
    {
        //ѡ�� FLL ���� PLL/2 (Ұ�����ʹ�� PLL�����Ϊ PLL �� 1/2 )
        SIM_SOPT2 &= ~SIM_SOPT2_UART0SRC_MASK;
        SIM_SOPT2 |= (0
                      | SIM_SOPT2_UART0SRC(1)       //
                      | SIM_SOPT2_PLLFLLSEL_MASK
                     );

        // ���õ�ʱ��Ӧ�ý�ֹ���ͽ���
        UART0_C2 &= ~(UART0_C2_TE_MASK | UART0_C2_RE_MASK);
        UART0_C1 = 0;       //Ĭ�Ϲ���ģʽ
        sysclk = pll_clk_mhz * 1000* 1000/2;

        //UART ������ = UART ģ��ʱ��/((OSR+1) �� SBR)
        //4 <= OSR <= 32
        //SBR = (1 ,8191)
        for(temp = 4;temp<=32;temp++)
        {
            tmp_sbr = sysclk/(baud*(temp+1));
            if(tmp_sbr > 0x1FFF)
            {
                continue;
            }
            tmp_baud = sysclk/(tmp_sbr*(temp+1));
            diff_abs_baud =  ABS((int32)(tmp_baud - baud));
            if(diff_abs_baud == 0)
            {
                sbr = tmp_sbr;
                osr = temp;
                break;
            }
            if(tmp_diff > diff_abs_baud )
            {
                tmp_diff = diff_abs_baud;
                sbr = tmp_sbr;
                osr = temp;
            }

            //���ڲ�һ������������˻���Ҫ ��1 ����
            tmp_sbr++;
            if(tmp_sbr > 0x1FFF)
            {
                continue;
            }
            tmp_baud = sysclk/(tmp_sbr*(temp+1));
            diff_abs_baud =  ABS((int32)(tmp_baud - baud));
            if(diff_abs_baud == 0)
            {
                sbr = tmp_sbr;
                osr = temp;
                break;
            }
            if(tmp_diff > diff_abs_baud )
            {

                sbr = tmp_sbr;
                osr = temp;
            }
        }

        //д SBR
        temp = UART0_BDH & (~UART0_BDH_SBR_MASK);           //���� ��� SBR �� UARTx_BDH��ֵ
        UART0_BDH = temp |  UART0_BDH_SBR(sbr >> 8);        //��д��SBR��λ
        UART0_BDL = UART0_BDL_SBR(sbr);                     //��д��SBR��λ

        //д OSR
        temp = UART0_C4 & (~UART0_C4_OSR_MASK) ;           //���� ��� BRFA �� UARTx_C4 ��ֵ
        UART0_C4 = temp |  UART0_C4_OSR(osr);             //д��BRFA

        // ������Ϻ�Ӧ��ʹ�ܷ��ͽ���
        UART0_C2 |= (UART0_C2_TE_MASK | UART0_C2_RE_MASK);
    }
    else
    {
        //���õ�ʱ��Ӧ�ý�ֹ���ͽ���
        UART_C2_REG(UARTN[uratn]) &= ~(0
                                   | UART_C2_TE_MASK
                                   | UART_C2_RE_MASK
                                  );

        //���ó�8λ��У��ģʽ
        //���� UART ���ݸ�ʽ��У�鷽ʽ��ֹͣλλ����ͨ������ UART ģ����ƼĴ��� C1 ʵ�֣�
        UART_C1_REG(UARTN[uratn]) = (0
                                      //| UART_C2_M_MASK                    //9 λ�� 8 λģʽѡ�� : 0 Ϊ 8λ ��1 Ϊ 9λ��ע���˱�ʾ0����8λ�� �������9λ��λ8��UARTx_C3�
                                      //| UART_C2_PE_MASK                   //��żУ��ʹ�ܣ�ע���˱�ʾ���ã�
                                      //| UART_C2_PT_MASK                   //У��λ���� : 0 Ϊ żУ�� ��1 Ϊ ��У��
                                     );

        sysclk = bus_clk_khz * 1000;                                    //busʱ��

        //UART ������ = UART ģ��ʱ�� / (16 �� (SBR[12:0] ))
        //������ BRFA ������£� SBR = UART ģ��ʱ�� / (16 * UART ������)
        sbr = (uint16)(sysclk / (baud * 16));
        if(sbr > 0x1FFF)sbr = 0x1FFF;                                       //SBR �� 13bit�����Ϊ 0x1FFF

        //д SBR
        temp = UART_BDH_REG(UARTN[uratn]) & (~UART_BDH_SBR_MASK);           //���� ��� SBR �� UARTx_BDH��ֵ
        UART_BDH_REG(UARTN[uratn]) = temp |  UART_BDH_SBR(sbr >> 8);        //��д��SBR��λ
        UART_BDL_REG(UARTN[uratn]) = UART_BDL_SBR(sbr);                     //��д��SBR��λ

        /* �����ͺͽ��� */
        UART_C2_REG(UARTN[uratn]) |= (0
                                      | UART_C2_TE_MASK                     //����ʹ��
                                      | UART_C2_RE_MASK                     //����ʹ��
                                      //| UART_C2_TIE_MASK                  //�����жϻ�DMA��������ʹ�ܣ�ע���˱�ʾ���ã�
                                      //| UART_C2_TCIE_MASK                 //��������ж�ʹ�ܣ�ע���˱�ʾ���ã�
                                      //| UART_C2_RIE_MASK                  //�������жϻ�DMA��������ʹ�ܣ�ע���˱�ʾ���ã�
                                     );
    }

    //�����Ƿ�������պͷ����жϡ�ͨ������ UART ģ��� C2 �Ĵ�����
    //RIE �� TIE λʵ�֡����ʹ���жϣ���������ʵ���жϷ������
}

/*!
 *  @brief      �ȴ�����1���ֽ�
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @param      ch          ���յ�ַ
 *  @since      v5.0
 *  @note       �����Ҫ��ѯ����״̬������ uart_query ��
                �����Ҫ��ѯ�������ݣ����� uart_querychar
 *  Sample usage:       char ch = uart_getchar (UART3);   //�ȴ�����1���ֽڣ����浽 ch��
 */
void uart_getchar (UARTn_e uratn, char *ch)
{
    if(uratn == UART0)
    {
        /* Wait until character has been received */
        while (!(UART0_S1 & UART0_S1_RDRF_MASK));

        /* Return the 8-bit data from the receiver */
        *ch = UART0_D;
    }
    else
    {
        /* Wait until character has been received */
        while (!(UART_S1_REG(UARTN[uratn]) & UART_S1_RDRF_MASK));

        /* Return the 8-bit data from the receiver */
        *ch = UART_D_REG(UARTN[uratn]);
    }
}


/*!
 *  @brief      ��ѯ����1���ַ�
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @param      ch          ���յ�ַ
 *  @return     1Ϊ���ճɹ���0Ϊ����ʧ��
 *  @since      v5.0
 *  @note       �����Ҫ�ȴ����գ����� uart_getchar
 *  Sample usage:       char ch ;
                        if( uart_querychar (UART3,&ch) == 1)     //��ѯ����1���ַ������浽 ch��
                        {
                            printf("�ɹ����յ�һ���ֽ�");
                        }
 */
char uart_querychar (UARTn_e uratn, char *ch)
{
    if(uratn == UART0)
    {
        if(UART0_S1 & UART0_S1_RDRF_MASK)
        {
            *ch = UART0_D;
            return 1;
        }
    }
    else
    {
        if(UART_S1_REG(UARTN[uratn]) & UART_S1_RDRF_MASK)
        {
            *ch = UART_D_REG(UARTN[uratn]);
            return 1;
        }
    }

    return 0;                                   //����0��ʾ����ʧ��
}


/*!
 *  @brief      ��ѯ�����ַ���
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @param      str         ���յ�ַ
 *  @param      max_len     �����ճ���
 *  @return     ���յ����ֽ���Ŀ
 *  @since      v5.0
 *  Sample usage:       char str[100];
                        uint32 num;
                        num = uart_pendstr (UART3,&str,100);
                        if( num != 0 )
                        {
                            printf("�ɹ����յ�%d���ֽ�:%s",num,str);
                        }
 */
char uart_querystr (UARTn_e uratn, char *str, uint32 max_len)
{
    uint32 i = 0;
    while(uart_querychar(uratn, str + i)  )
    {
        if( *(str + i) == NULL )    //���յ��ַ���������
        {
            return i;
        }

        i++;
        if(i >= max_len)            //�����趨�����ֵ���˳�
        {
            return i;
        }
    };

    return i;
}


/*!
 *  @brief      ��ѯ����buff
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @param      str         ���յ�ַ
 *  @param      max_len     �����ճ���
 *  @return     ���յ����ֽ���Ŀ
 *  @since      v5.0
 *  Sample usage:       char buff[100];
                        uint32 num;
                        num = uart_pendbuff (UART3,&buff,100);
                        if( num != 0 )
                        {
                            printf("�ɹ����յ�%d���ֽ�:%s",num,buff);
                        }
 */
char uart_querybuff (UARTn_e uratn, char *buff, uint32 max_len)
{
    uint32 i = 0;
    while(uart_querychar(uratn, buff + i)  )
    {
        i++;
        if(i >= max_len)            //�����趨�����ֵ���˳�
        {
            return i;
        }
    };

    return i;
}


/*!
 *  @brief      ���ڷ���һ���ֽ�
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @param      ch          ��Ҫ���͵��ֽ�
 *  @since      v5.0
 *  @note       printf��Ҫ�õ��˺���
 *  @see        fputc
 *  Sample usage:       uart_putchar (UART3, 'A');  //�����ֽ�'A'
 */
void uart_putchar (UARTn_e uratn, char ch)
{
    if(uratn == UART0)
    {
        //�ȴ����ͻ�������
        while(!(UART0_S1 & UART0_S1_TDRE_MASK));

        //��������
        UART0_D = (uint8)ch;
    }
    else
    {
        //�ȴ����ͻ�������
        while(!(UART_S1_REG(UARTN[uratn]) & UART_S1_TDRE_MASK));

        //��������
        UART_D_REG(UARTN[uratn]) = (uint8)ch;
    }
}

/*!
 *  @brief      ��ѯ�Ƿ���ܵ�һ���ֽ�
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @return     ���յ����ݷ���1��û���յ����ݷ���0
 *  @since      v5.0
 *  Sample usage:       char ch;
                        if(uart_query (UART3) == 1)     //��ѯ�Ƿ���յ�����
                        {
                            ch = uart_getchar (UART3);  //�ȴ�����һ�����ݣ����浽 ch��
                        }
 */
char uart_query (UARTn_e uratn)
{

    if(uratn == UART0)
    {
        if(UART0_S1 & UART0_S1_RDRF_MASK)
        {
            return 1;
        }
    }
    else
    {
        if(UART_S1_REG(UARTN[uratn]) & UART_S1_RDRF_MASK)
        {
            return 1;
        }
    }

    return 0;                                   //����0��ʾ����ʧ��
}

/*!
 *  @brief      ����ָ��len���ֽڳ������� ������ NULL Ҳ�ᷢ�ͣ�
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @param      buff        �����ַ
 *  @param      len         ��������ĳ���
 *  @since      v5.0
 *  Sample usage:       uart_putbuff (UART3,"1234567", 3); //ʵ�ʷ�����3���ֽ�'1','2','3'
 */
void uart_putbuff (UARTn_e uratn, uint8 *buff, uint32 len)
{
    while(len--)
    {
        uart_putchar(uratn, *buff);
        buff++;
    }
}


/*!
 *  @brief      �����ַ���(�� NULL ֹͣ����)
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @param      str         �ַ�����ַ
 *  @since      v5.0
 *  Sample usage:       uart_putstr (UART3,"1234567"); //ʵ�ʷ�����7���ֽ�
 */
void uart_putstr (UARTn_e uratn, const uint8 *str)
{
    while(*str)
    {
        uart_putchar(uratn, *str++);
    }
}

/*!
 *  @brief      �����ڽ����ж�
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @since      v5.0
 *  Sample usage:       uart_rx_irq_en(UART3);         //������3�����ж�
 */
void uart_rx_irq_en(UARTn_e uratn)
{
    UART_C2_REG(UARTN[uratn]) |= UART_C2_RIE_MASK;                          //ʹ��UART�����ж�
    enable_irq((IRQn_t)((IRQn_t)(uratn) + UART0_IRQn));                  //ʹ��IRQ�ж�
}

/*!
 *  @brief      �����ڷ����ж�
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @since      v5.0
 *  Sample usage:       uart_tx_irq_en(UART3);         //������3�����ж�
 */
void uart_tx_irq_en(UARTn_e uratn)
{
    UART_C2_REG(UARTN[uratn]) |= UART_C2_TIE_MASK;                          //ʹ��UART�����ж�
    enable_irq((IRQn_t)((IRQn_t)(uratn) + UART0_IRQn));                  //ʹ��IRQ�ж�
}

/*!
 *  @brief      �����ڷ�������ж�
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @since      v5.0
 *  Sample usage:       uart_tx_irq_en(UART3);         //������3�����ж�
 */
void uart_txc_irq_en(UARTn_e uratn)
{
    UART_C2_REG(UARTN[uratn]) |= UART_C2_TCIE_MASK;                         //ʹ��UART�����ж�
    enable_irq((IRQn_t)((IRQn_t)(uratn) + UART0_IRQn));                  //ʹ��IRQ�ж�
}

/*!
 *  @brief      �ش��ڽ����ж�
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @since      v5.0
 *  Sample usage:       uart_rx_irq_dis(UART3);         //�ش���3�����ж�
 */
void uart_rx_irq_dis(UARTn_e uratn)
{
    UART_C2_REG(UARTN[uratn]) &= ~UART_C2_RIE_MASK;                         //��ֹUART�����ж�

    //��������жϻ�û�йأ��򲻹ر�IRQ
    if(!(UART_C2_REG(UARTN[uratn]) & (UART_C2_TIE_MASK | UART_C2_TCIE_MASK)) )
    {
        disable_irq((IRQn_t)((IRQn_t)(uratn) + UART0_IRQn));             //��IRQ�ж�
    }
}

/*!
 *  @brief      �ش��ڷ����ж�
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @since      v5.0
 *  Sample usage:       uart_tx_irq_dis(UART3);         //�ش���3�����ж�
 */
void uart_txc_irq_dis(UARTn_e uratn)
{
    UART_C2_REG(UARTN[uratn]) &= ~UART_C2_TCIE_MASK;                        //��ֹUART��������ж�

    //��������жϻ�û�йأ��򲻹ر�IRQ
    if(!(UART_C2_REG(UARTN[uratn]) & UART_C2_RIE_MASK) )
    {
        disable_irq((IRQn_t)((IRQn_t)(uratn) + UART0_IRQn));             //��IRQ�ж�
    }
}

/*!
 *  @brief      �ش��ڷ����ж�
 *  @param      UARTn_e       ģ��ţ�UART0~UART5��
 *  @since      v5.0
 *  Sample usage:       uart_tx_irq_dis(UART3);         //�ش���3�����ж�
 */
void uart_tx_irq_dis(UARTn_e uratn)
{
    UART_C2_REG(UARTN[uratn]) &= ~UART_C2_TIE_MASK;                         //��ֹUART�����ж�

    //��������жϻ�û�йأ��򲻹ر�IRQ
    if(!(UART_C2_REG(UARTN[uratn]) & UART_C2_RIE_MASK) )
    {
        disable_irq((IRQn_t)((IRQn_t)(uratn) + UART0_IRQn));             //��IRQ�ж�
    }
}

/*!
 *  @brief      UART1�����жϷ�����
 *  @since      v5.0
 *  @warning    �˺�����Ҫ�û������Լ�������ɣ�����������ṩһ��ģ��
 *  Sample usage:       set_vector_handler(UART3_RX_TX_VECTORn , uart3_test_handler);    //�� uart3_handler ������ӵ��ж�����������Ҫ�����ֶ�����
 */
void uart1_test_handler(void)
{
    UARTn_e uratn = UART1;

    if(UART_S1_REG(UARTN[uratn]) & UART_S1_RDRF_MASK)   //�������ݼĴ�����
    {
        //�û���Ҫ�����������

    }

    if(UART_S1_REG(UARTN[uratn]) & UART_S1_TDRE_MASK )  //�������ݼĴ�����
    {
        //�û���Ҫ����������

    }
}