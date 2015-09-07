#define Cont_Num 50
#define Err_Range 3


#include "all.h"
#include "math.h"
#include <stdio.h>
#include <stdlib.h>
#include "rollway.h"

extern uint16 RST1[X_MAX*Y_MAX];
extern uint16 RST0[X_MAX*Y_MAX];

extern int16 * dPin;


int16 * GetCyclesPoints(uint16 R)
{
	uint16 i;
	int16 * dPin;
	dPin = (int16 *) malloc(2*Cont_Num*sizeof(int16));
	for (i=0;i<Cont_Num;i++)
	{
		dPin[2*i] = R * cos(2*pi/Cont_Num*(i+1)); 
		dPin[2*i+1] = R * sin(2*pi/Cont_Num*(i+1)); 		
	}
	return dPin;
}




/*
	：o?：：?2?：oy?┷o?D??|━?|━?,|━?|━?：oy：♂?,?∴???|━?
*/
extern uint16 type;
uint16  change_get2(int16 line[100][2],uint16 dot_n)
 {
     int16 i,j;
     int16 sub_value=0,times=0,times_all=0,check_ok=0;
     for(i=2;(i<dot_n-2)&&(check_ok==0);i+=1)
      {
        times=0;times_all=0;
          sub_value=(int16)(line[i+2][0]-line[i][0])-(int16)(line[i][0]-line[i-2][0]);
          sub_value=sub_value*-1;
          if((sub_value>Error_Corner_Num)&&(line[i+2][0]<line[i][0])&&(i<dot_n*4/5))
           {
               if(((type==1)&&(line[i+2][1]<line[i][1]))||((type==2)&&(line[i+2][1]>line[i][1]))) 
                {
                    for(j=i;j<dot_n-2;j+=1)
                     {
                         times_all++;
                         if(line[j+2][0]<line[i-1][0]-Error_Corner_Num)
                             times++;
                     }
                    if(times>times_all/2) 
                     {
                         check_ok=1;
                         return i+1;
                     }
                }
          }
      }
      for(i=2;(i<dot_n-2)&&(check_ok);i+=1)
      {
        times=0;times_all=0;
          sub_value=(int16)(line[i+2][1]-line[i][1])-(int16)(line[i][1]-line[i-2][1]);
          if((type==1)&&(sub_value>Error_Corner_Num)&&(i<dot_n*5/6))
          {
            for(j=i;j<dot_n-1;j+=1)
            {
              times_all++;
              if(line[j+2][1]>line[i-1][1])
                times++;
            }
            if(times>times_all/2) 
              return i+1;
          }
          else if((type==2)&&(sub_value*-1>Error_Corner_Num)&&(i<dot_n*5/6))
          {
            for(j=i;j<dot_n-1;j+=1)
            {
              times_all++;
              if(line[j+2][1]<line[i-1][1])
                times++;
            }
            if(times>times_all/2) 
              return i+1;
          }
      }
      return 0;
 }
extern uint16 type;
uint8 angle_type=0;
Line Delete_In_Corner(int16 Dot[][2], uint16 Dot_Num ,uint16 Split_Dot)
{
	int16 i,TFS=2;//TFS?a??：a?：?|━?|━?：oy
    int8 LFlag;
	Line Rtn;
	Rtn.num = 0;
    angle_type=0;
         if (type==2)
          {
              for (i = Split_Dot + 2; ( Dot[i][1] > Dot[Split_Dot-3][1])  &&(i<Dot_Num-1); i++)
               {
                   TFS++;
                   if (TFS == Split_Dot)
                       break;
               }
              if(left_line[left_dot-1][0]<110)
                angle_type=2;
              else angle_type=3;
          }
        else if(type==1)
         {
             	for (i = Split_Dot + 2; ( Dot[Split_Dot-3][1]>Dot[i][1]) &&(i<Dot_Num-1); i++)
                {
                    TFS++;
                    if (TFS == Split_Dot)
                        break;
                }
                 if(right_line[right_dot-1][0]<110)
                angle_type=1;
                else angle_type=4;
         }
	for (i = 0; i < Dot_Num; i++)
	{
		if (i <= (Split_Dot - TFS) || i >(Split_Dot + TFS))
		{
			Rtn.dot[Rtn.num][0] = Dot[i][0];
			Rtn.dot[Rtn.num][1] = Dot[i][1];
			Rtn.num++;
		}
	}
	return Rtn;
}
    