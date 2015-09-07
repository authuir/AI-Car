/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       system_MK60DZ10.h
 * @brief      ϵͳ������غ���
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-07-02
 */

#ifndef __SYSTEM_MK60_H__
#define __SYSTEM_MK60_H__

extern int pll_clk_mhz;
extern int core_clk_khz;
extern int core_clk_mhz;
extern int bus_clk_khz;


void start(void);           //kinetis ��������
void sysinit (void);        //ϵͳ��ʼ��������ϵͳƵ�ʣ���ʼ��printf�˿�
void trace_clk_init(void);  //trace ʱ����� ��ʼ��
void fb_clk_init(void);     //fb ʱ����� ��ʼ��

void common_startup(void);  //�����ж������� �� ��Ҫ�����ݵ� RAM��

#endif  //__SYSTEM_MK60_H__
