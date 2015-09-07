/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MK60_dac.h
 * @brief      DAC����
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-08-28
 */

#ifndef     _MK60_DAC_H_
#define     _MK60_DAC_H_ 1u

typedef enum DACn       //DACģ��
{
    DAC0,
} DACn_e;

extern void dac_init(DACn_e);               //DACһ��ת����ʼ��
extern void dac_out(DACn_e, uint16 val);    //DACһ��ת������

#endif  //_MK60_DAC_H_

