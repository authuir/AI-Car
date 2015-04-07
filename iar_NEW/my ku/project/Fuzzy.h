#ifndef __FUZZY_H__
#define __FUZZY_H__

/**************�������ȣ������Σ�ģ��������***************/
float trimf(float x,float a,float b,float c);

/****************�����η�ģ��������**********************/
float ctrimf(float x,float a,float b,float c);

/*****************����(��)�������� ģ����*******************/
float zmf(float x,float a,float b);

/*******************���η�ģ����***********************/
float czmf(float x,float a,float b);

/*****************����(��)�������� ģ����*******************/
float smf(float x,float a,float b);

/*******************���η�ģ����***********************/
float csmf(float x,float a,float b);

/*******************�󽻼�***********************/
float fand(float a,float b);

/*******************�󲢼�***********************/
float forr(float a,float b);

 //ģ���������������������ı仯�ʣ������Ӧ�����ı仯ֵ
float Fuzzy_P(float error,float error_rate,uint8 table[][7]);
float Fuzzy_I(float error,float error_rate,uint8 table[][7]);
float Fuzzy_D(float error,float error_rate,uint8 table[][7]);

//����Fuzzy�����������в���
void FuzzyAll(void);

#endif

