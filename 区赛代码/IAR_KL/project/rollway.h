#ifndef __ROLLWAY_H__
#define __ROLLWAY_H__
#define pi 3.1415926
typedef struct Mid_Rtn__
{
	uint16 dot_Rtn[500][2];
	uint16 dot_Num;
} Mid_Rtn_;


 extern uint8 angle_type;

#define MAX_DOT_NUM 100
#define Error_Corner_Num 8
#define IterMax 20

typedef struct _Line{
	int16 dot[MAX_DOT_NUM][2];
	uint16 num;
}Line;


#define RIGHT_LINE 1
#define LEFT_LINE 0

int16 * GetCyclesPoints(uint16 R);
uint16  change_get2(int16 line[][2],uint16 dot_n);
Mid_Rtn_ GetMidPoints(uint16 * SidePoint,uint16 SideNum,uint8 IS_Right);
Line Delete_In_Corner(int16 Dot[][2], uint16 Dot_Num ,uint16 Split_Dot);
#endif