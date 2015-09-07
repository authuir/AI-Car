#ifndef __FUZZY_H__
#define __FUZZY_H__

/**************求隶属度（三角形）模糊化处理***************/
float trimf(float x,float a,float b,float c);

/****************三角形反模糊化处理**********************/
float ctrimf(float x,float a,float b,float c);

/*****************梯形(左)求隶属度 模糊化*******************/
float zmf(float x,float a,float b);

/*******************梯形反模糊化***********************/
float czmf(float x,float a,float b);

/*****************梯形(右)求隶属度 模糊化*******************/
float smf(float x,float a,float b);

/*******************梯形反模糊化***********************/
float csmf(float x,float a,float b);

/*******************求交集***********************/
float fand(float a,float b);

/*******************求并集***********************/
float forr(float a,float b);

 //模糊处理函数，输入误差和误差的变化率，输出对应参数的变化值
float Fuzzy_P(float error,float error_rate,uint8 table[][7]);
float Fuzzy_I(float error,float error_rate,uint8 table[][7]);
float Fuzzy_D(float error,float error_rate,uint8 table[][7]);

//调用Fuzzy函数处理所有参数
void FuzzyAll(void);

#endif

