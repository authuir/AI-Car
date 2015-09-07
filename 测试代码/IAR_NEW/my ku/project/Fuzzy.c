#include "all.h"
#define NB 0
#define NM 1
#define NS 2
#define ZO 3
#define PS 4
#define PM 5
#define PB 6
//extern float idealPitch,idealRoll,idealYaw;
extern float Kpx,Kix,Kdx;//定义x轴上三个角度的PID参数
extern float Kpy,Kiy,Kdy;
extern float Kpz,Kiz,Kdz;
//extern float Pitch,Roll,Yaw;//欧拉角
extern float Pitch_error,Roll_error,Yaw_error; //欧拉角误差
float Pitch_error_rate,Roll_error_rate,Yaw_error_rate;
//Pitch_error_rate=gyro[1],Roll_error_rate=gyro[0],Yaw_error_rate=gyro[2]; //欧拉角误差变化率

//建立PID参数规则表
//int NB=0,NM=1,NS=2,Z=3,PS=4,PM=5,PB=6；
//P参数规则表
uint8 P_change_table[7][7]={{PB,PB,PM,PM,PS,ZO,ZO},
                            {PB,PB,PM,PS,PS,ZO,NS},
                            {PM,PM,PM,PS,ZO,NS,NS},
                            {PM,PM,PS,ZO,NS,NM,NM},
                            {PS,PS,ZO,NS,NS,NM,NM},
                            {PS,ZO,NS,NM,NM,NM,NB},
                            {ZO,ZO,NM,NM,NM,NB,NB}};
 //I参数规则表
uint8 I_change_table[7][7]={{NB,NB,NM,NM,NS,ZO,ZO},
                            {NB,NB,NM,NS,NS,ZO,ZO},
                            {NB,NM,NS,NS,ZO,PS,PS},
                            {NM,NM,NS,ZO,PS,PM,PM},
                            {NM,NS,ZO,PS,PS,PM,PB},
                            {ZO,ZO,PS,PS,PM,PB,PB},
                            {ZO,ZO,PS,PM,PM,PB,PB}};
//D参数规则表
uint8 D_change_table[7][7]={{PS,NS,NB,NB,NB,NM,PS},
                            {PS,NS,NB,NM,NM,NS,ZO},
                            {ZO,NS,NM,NM,NS,NS,ZO},
                            {ZO,NS,NS,NS,NS,NS,ZO},
                            {ZO,ZO,ZO,ZO,ZO,ZO,ZO},
                            {PB,NS,PS,PS,PS,PS,PB},
                            {PB,PM,PM,PM,PS,PS,PB}};

//论域e:[-6,6]  ec:[-6,6]  kp:[-0.3,0.3]

/**************求隶属度（三角形）模糊化处理***************/
float trimf(float x,float a,float b,float c)
{
if(x<=a)
return 0;
else if((a<x)&&(x<=b))
return (x-a)/(b-a);
else if((b<x)&&(x<=c))
return (c-x)/(c-b);
else if(x>c)
return 0;
}
/****************三角形反模糊化处理**********************/
float ctrimf(float x,float a,float b,float c)
{ 
float y,z;
z=(b-a)*x+a;
y=c-(c-b)*x;
return (y+z)/2;
}
/*****************梯形(左)求隶属度 模糊化*******************/
float zmf(float x,float a,float b)
{
if(x<=a)  
return 1;
else if((a<x)&&(x<=b))
return (b-x)/(b-a);
else if(x>b)
return 0;
}
/*******************梯形反模糊化***********************/
float czmf(float x,float a,float b)
{
return b-(b-a)*x;
}

/*****************梯形(右)求隶属度 模糊化*******************/
float smf(float x,float a,float b)
{
if(x<=a)
return 0;
if((a<x)&&(x<b))
return (x-a)/(b-a);
if(x>=b)
return 1;
}
/*******************梯形反模糊化***********************/
float csmf(float x,float a,float b)
{
return (b-a)*x +a;
}

/*******************求交集***********************/
float fand(float a,float b)
{
return (a<b)?a:b;
}
/*******************求并集***********************/
float forr(float a,float b)
{
return (a<b)?b:a;
}


 //模糊处理函数，输入误差和误差的变化率，输出对应参数的变化值
float Fuzzy_P(float error,float error_rate,uint8 table[7][7])
{
  float form[7][7];
  float es[7],ecs[7];
  float lsd,det;
  int i,j,a,b,p;
  Pitch_error_rate=gyro[1],Roll_error_rate=gyro[0],Yaw_error_rate=gyro[2];
//规则模糊化
//误差模糊
es[NB]=zmf(error,-6,-2); 
es[NM]=trimf(error,-6,-4,0);
es[NS]=trimf(error,-6,-2,2);
es[ZO]=trimf(error,-4,0,4);
es[PS]=trimf(error,-2,2,6);
es[PM]=trimf(error,0,4,6);
es[PB]=smf(error,2,6);
//误差变化率模糊化
ecs[NB]=zmf(error_rate,-60,-20);
ecs[NM]=trimf(error_rate,-60,-40,0);
ecs[NS]=trimf(error_rate,-60,-20,20);
ecs[ZO]=trimf(error_rate,-40,0,40);
ecs[PS]=trimf(error_rate,-20,20,60);
ecs[PM]=trimf(error_rate,0,40,60);
ecs[PB]=smf(error_rate,20,60);
/******模糊推理 规则的可信度通过取小点运算得到*****/

for(i=0;i<7;i++)
{
 for(j=0;j<7;j++)
 {
form[i][j]=fand(es[i],ecs[j]);
 }
}
/*************求得的最大值赋给form[a][b]*********/

for(i=0;i<7;i++)
{
 for(j=0;j<7;j++)
 {
if(form[a][b]<form[i][j]) 
 {
a=i;
 b=j;
 }
}}

lsd=form[a][b];//es和ecs最值中的最大值
p=table[a][b];

 //反模糊化处理
if(p==NB)
det=czmf(lsd,-3,-1);
else if(p==NM)
det=ctrimf(lsd,-3,-2,0);
else if(p==NS)
det=ctrimf(lsd,-3,-1,1);
else if(p==ZO)
det=ctrimf(lsd,-2,0,2);
else if(p==PS)
det=ctrimf(lsd,-1,1,3);
else if(p==PM)
det=ctrimf(lsd,0,2,3);
else if(p==PB)
det=csmf(lsd,1,3);

//float kpint；
//kpint+=detkp;
return det;
}

 //模糊处理函数，输入误差和误差的变化率，输出对应参数的变化值
float Fuzzy_I(float error,float error_rate,uint8 table[7][7])
{
  float form[7][7];
  float es[7],ecs[7];
  float lsd,det;
  int i,j,a,b,p;
  Pitch_error_rate=gyro[1],Roll_error_rate=gyro[0],Yaw_error_rate=gyro[2];
//规则模糊化
//误差模糊
es[NB]=zmf(error,-6,-2); 
es[NM]=trimf(error,-6,-4,0);
es[NS]=trimf(error,-6,-2,2);
es[ZO]=trimf(error,-4,0,4);
es[PS]=trimf(error,-2,2,6);
es[PM]=trimf(error,0,4,6);
es[PB]=smf(error,2,6);
//误差变化率模糊化
ecs[NB]=zmf(error_rate,-60,-20);
ecs[NM]=trimf(error_rate,-60,-40,0);
ecs[NS]=trimf(error_rate,-60,-20,20);
ecs[ZO]=trimf(error_rate,-40,0,40);
ecs[PS]=trimf(error_rate,-20,20,60);
ecs[PM]=trimf(error_rate,0,40,60);
ecs[PB]=smf(error_rate,20,60);
/******模糊推理 规则的可信度通过取小点运算得到*****/

for(i=0;i<7;i++)
{
 for(j=0;j<7;j++)
 {
form[i][j]=fand(es[i],ecs[j]);
 }
}
/*************求得的最大值赋给form[a][b]*********/

for(i=0;i<7;i++)
{
 for(j=0;j<7;j++)
 {
if(form[a][b]<form[i][j]) 
 {
a=i;
 b=j;
 }
}}

lsd=form[a][b];//es和ecs最值中的最大值
p=table[a][b];

 //反模糊化处理
if(p==NB)
det=czmf(lsd,-0.0015,-0.0005);
else if(p==NM)
det=ctrimf(lsd,-0.0015,-0.001,0);
else if(p==NS)
det=ctrimf(lsd,-0.0015,-0.0005,0.0005);
else if(p==ZO)
det=ctrimf(lsd,-0.001,0,0.001);
else if(p==PS)
det=ctrimf(lsd,-0.0005,0.0005,0.0015);
else if(p==PM)
det=ctrimf(lsd,0,0.001,0.0015);
else if(p==PB)
det=csmf(lsd,0.0005,0.0015);

//float kpint；
//kpint+=detkp;
return det;
}
//模糊处理函数，输入误差和误差的变化率，输出对应参数的变化值
float Fuzzy_D(float error,float error_rate,uint8 table[7][7])
{
  float form[7][7];
  float es[7],ecs[7];
  float lsd,det;
  int i,j,a,b,p;
  Pitch_error_rate=gyro[1],Roll_error_rate=gyro[0],Yaw_error_rate=gyro[2];
//规则模糊化
//误差模糊
es[NB]=zmf(error,-6,-2); 
es[NM]=trimf(error,-6,-4,0);
es[NS]=trimf(error,-6,-2,2);
es[ZO]=trimf(error,-4,0,4);
es[PS]=trimf(error,-2,2,6);
es[PM]=trimf(error,0,4,6);
es[PB]=smf(error,2,6);
//误差变化率模糊化
ecs[NB]=zmf(error_rate,-60,-20);
ecs[NM]=trimf(error_rate,-60,-40,0);
ecs[NS]=trimf(error_rate,-60,-20,20);
ecs[ZO]=trimf(error_rate,-40,0,40);
ecs[PS]=trimf(error_rate,-20,20,60);
ecs[PM]=trimf(error_rate,0,40,60);
ecs[PB]=smf(error_rate,20,60);
/******模糊推理 规则的可信度通过取小点运算得到*****/

for(i=0;i<7;i++)
{
 for(j=0;j<7;j++)
 {
form[i][j]=fand(es[i],ecs[j]);
 }
}
/*************求得的最大值赋给form[a][b]*********/

for(i=0;i<7;i++)
{
 for(j=0;j<7;j++)
 {
if(form[a][b]<form[i][j]) 
 {
a=i;
 b=j;
 }
}}

lsd=form[a][b];//es和ecs最值中的最大值
p=table[a][b];

 //反模糊化处理
if(p==NB)
det=czmf(lsd,-0.3,-0.1);
else if(p==NM)
det=ctrimf(lsd,-0.3,-0.2,0);
else if(p==NS)
det=ctrimf(lsd,-0.3,-0.1,0.1);
else if(p==ZO)
det=ctrimf(lsd,-0.2,0,0.2);
else if(p==PS)
det=ctrimf(lsd,-0.1,0.1,0.3);
else if(p==PM)
det=ctrimf(lsd,0,0.2,0.3);
else if(p==PB)
det=csmf(lsd,0.1,0.3);

//float kpint；
//kpint+=detkp;
return det;
}


//调用Fuzzy函数处理所有参数
void FuzzyAll(void)
{
  //处理Kpx
  Kpx +=Fuzzy_P(Pitch_error,Pitch_error_rate,P_change_table);
  //处理Kix
  Kix +=Fuzzy_I(Pitch_error,Pitch_error_rate,I_change_table);
  //处理Kdx
  Kdx +=Fuzzy_D(Pitch_error,Pitch_error_rate,D_change_table);
  //处理Kpy
  Kpy +=Fuzzy_P(Roll_error,Roll_error_rate,P_change_table);
  //处理Kiy
  Kiy +=Fuzzy_I(Roll_error,Roll_error_rate,I_change_table);
  //处理Kdy
  Kdy +=Fuzzy_D(Roll_error,Roll_error_rate,D_change_table);
  //处理Kpz                                           
  Kpz +=Fuzzy_P(Yaw_error,Yaw_error_rate,P_change_table);
  //处理Kiz
  Kiz +=Fuzzy_I(Yaw_error,Yaw_error_rate,I_change_table);
  //处理Kdz
  Kdz +=Fuzzy_D(Yaw_error,Yaw_error_rate,D_change_table);
}

























 


