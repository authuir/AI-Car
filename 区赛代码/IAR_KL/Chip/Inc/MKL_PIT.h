/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MK60_pit.h
 * @brief      pit��ʱ��������
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-08-23
 */


#ifndef _MK60_PIT_H_
#define _MK60_PIT_H_

//����PITģ���
typedef enum
{
    PIT0,
    PIT1,

    PIT_MAX,
} PITn;

#define     PIT_Flag_Clear(PITn)          PIT_TFLG(PITn)|=PIT_TFLG_TIF_MASK        //���жϱ�־��д1 ��ձ�־λ��

//ms�Ǻ���=0.001�� us��΢��=0.000001�� ns������=0.000000001��

/*****************************���´�������PIT�ж�*************************************/

void        pit_init(PITn, uint32 cnt);                                            //��ʼ��PITn�������ö�ʱʱ��(��λΪbusʱ������)
#define     pit_init_ms(PITn,ms)          pit_init(PITn,ms * bus_clk_khz);         //��ʼ��PITn�������ö�ʱʱ��(��λΪ ms)
#define     pit_init_us(PITn,us)          pit_init(PITn,us * bus_clk_khz/1000);    //��ʼ��PITn�������ö�ʱʱ��(��λΪ us)
#define     pit_init_ns(PITn,ns)          pit_init(PITn,ns * bus_clk_khz/1000000); //��ʼ��PITn�������ö�ʱʱ��(��λΪ ns)

/*****************************���ϴ�������PIT�ж�*************************************/
/*****************************���´�������PIT��ʱ*************************************/

//ע���ˣ���ʱ��������Ҫ��ʼ���ģ�ֱ�ӵ���

void        pit_delay(PITn pitn, uint32 cnt);                                       //PIT��ʱ������Ҫ��ʼ���ģ�
#define     pit_delay_ms(PITn,ms)          pit_delay(PITn,ms * bus_clk_khz);        //PIT��ʱ ms
#define     pit_delay_us(PITn,us)          pit_delay(PITn,us * bus_clk_khz/1000);   //PIT��ʱ us
#define     pit_delay_ns(PITn,ns)          pit_delay(PITn,ns * bus_clk_khz/1000000);//PIT��ʱ ns

/*****************************���ϴ�������PIT��ʱ*************************************/
/*****************************���´�������PIT��ʱ*************************************/

void    pit_time_start  (PITn pitn);                                                //PIT��ʼ��ʱ
uint32  pit_time_get    (PITn pitn);                                                //��ȡ PITn��ʱʱ��(��ʱʱ��ر� ��ʱ��)����λΪ busʱ�ӣ�(��ֵΪ 0xFFFFFFFF�����ʾ���)
void    pit_time_close  (PITn pitn);                                                //�ر� PIT ��ʱ
void PIT_Enable(PITn pitn);
void PITINT_Enable(PITn pitn);
#define pit_time_get_ms(pitn)   (pit_time_get(pitn)/bus_clk_khz)                    //��ȡ��ʱʱ�䣨��λΪ ms��
#define pit_time_get_us(pitn)   (pit_time_get(pitn)/(bus_clk_khz/1000))             //��ȡ��ʱʱ�䣨��λΪ us��
/*****************************���ϴ�������PIT��ʱ*************************************/


#endif  //_MK60_PIT_H_
