/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MK60_uart.h
 * @brief      uart����ͷ�ļ�
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-06-26
 */

#ifndef __MK60_UART_H__
#define __MK60_UART_H__
     
     
#define UART_INIT  uart_init
typedef enum
{
    UART0,
    UART1,
    UART2,

    UART_MAX,
} UARTn_e;

extern UART_MemMapPtr UARTN[UART_MAX];


/********************************************************************/
 
//��ʼ��
extern void uart_init      (UARTn_e, uint32 baud);             //��ʼ��uartxģ��

//������ش���
extern void uart_getchar   (UARTn_e, char *ch);                //�ȴ�����1���ֽ�

extern char uart_querychar (UARTn_e, char *ch);                //��ѯ����1���ַ�
extern char uart_querystr  (UARTn_e, char *str, uint32 max_len); //��ѯ�����ַ���
extern char uart_querybuff (UARTn_e, char *str, uint32 max_len); //��ѯ����buff

extern char uart_query    (UARTn_e);                          //��ѯ�Ƿ���յ�һ���ֽ�


#define UART_S1 uart_putchar
#define UART_SN(a,b,c)    uart_putbuff(a,c,b)
#define UART_SS uart_putstr
//������ش���
extern void uart_putchar   (UARTn_e, char ch);                 //����1���ֽ�
extern void uart_putbuff   (UARTn_e , uint8 *buff, uint32 len);//����len���ֽ�buff
extern void uart_putstr    (UARTn_e , const uint8 *str);       //�����ַ���



//�ж���ش���
extern void uart_rx_irq_en (UARTn_e);                          //�����ڽ����ж�
extern void uart_tx_irq_en (UARTn_e);                          //�����ڷ����ж�
extern void uart_txc_irq_en (UARTn_e);                         //�����ڷ�������ж�

extern void uart_rx_irq_dis(UARTn_e);                          //�ش��ڽ����ж�
extern void uart_tx_irq_dis(UARTn_e);                          //�ش��ڷ����ж�
extern void uart_txc_irq_dis(UARTn_e);                         //�ش��ڷ�������ж�

extern void uart3_test_handler(void);                        //�жϸ�λ�����������ο������û�����ʵ�֣�

/********************************************************************/

#endif /* __MK60_UART_H__ */
