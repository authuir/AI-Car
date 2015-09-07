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

Mid_Rtn_ GetMidPoints(uint16 * SidePoint,uint16 SideNum,uint8 IS_Right)
{
	uint16 i,j,dotCR[2][Cont_Num];
        
	Mid_Rtn_ Mid_Rtn;
        Mid_Rtn.dot_Num = 0;
	uint16 dot_Mid[300] = {301};
	if (!IS_Right)
		for(i=0;i<300;i++)
		{ 
			dot_Mid[i] = 0;
		}
        else
		for(i=0;i<300;i++)
		{ 
			dot_Mid[i] = 301;
		}
	for (i=0;i<SideNum;i++)
	{
		for (j=0;j<Cont_Num;j++)
		{
			/*dotCR[0][j] = SidePoint[2*i+ 1]+ dPin[2*j];
			dotCR[1][j] = SidePoint[2*i ]+ dPin[2*j+1];*/
			dotCR[0][j] = RST1[SidePoint[2*i ]*180+SidePoint[2*i+ 1]] + dPin[2*j];
			dotCR[1][j] = RST0[SidePoint[2*i ]*180+SidePoint[2*i+ 1]]+ dPin[2*j+1];   
                        if ( IS_Right )
                        {
                        if ( ((dotCR[1][j]) > 0) && ((dotCR[1][j]) <301) )
                            if (dot_Mid[(dotCR[1][j])] > dotCR[0][j])
                                dot_Mid[(dotCR[1][j])] = dotCR[0][j];	 
                        }else{ 
                        if ( ((dotCR[1][j]) > 0) && ((dotCR[1][j]) <301) )
                            if (dot_Mid[(dotCR[1][j])] < dotCR[0][j])
                                dot_Mid[(dotCR[1][j])] = dotCR[0][j];	 
                        }
		}
	}
        dot_Mid[0]=dot_Mid[1];
/*	
        Mid_Rtn.dot_Rtn[0][0] = dot_Mid[0];
	Mid_Rtn.dot_Rtn[1][0] = 0;
	Mid_Rtn.dot_Num = 1;
*/
	for(i=1;i<300;i++)
	{
		if ( (abs(dot_Mid[i+1] - dot_Mid[i]) < Err_Range) && (dot_Mid[i]>=0)&&(dot_Mid[i]<301))
		{
			Mid_Rtn.dot_Num++;
			Mid_Rtn.dot_Rtn[i][0]= i;
			Mid_Rtn.dot_Rtn[i][1] = dot_Mid[i];
		}
	}
 	Mid_Rtn.dot_Rtn[0][0]= Mid_Rtn.dot_Rtn[1][0];
	Mid_Rtn.dot_Rtn[0][1] = Mid_Rtn.dot_Rtn[1][1];

	return Mid_Rtn;
}





/*
	：o?：：?2?：oy?┷o?D??|━?|━?,|━?|━?：oy：♂?,?∴???|━?
*/

uint16  change_get2(int16 line[200][2],uint16 dot_n)
 {
     int16 i,j;
     int16 sub_value=0,times=0;
     for(i=2;i<dot_n-2;i+=1)
      {
        times=0;
          sub_value=(int16)(line[i+2][0]-line[i][0])-(int16)(line[i][0]-line[i-2][0]);
          sub_value=sub_value*-1;
          if((sub_value>Error_Corner_Num)&&(i<dot_n/2))
          {
            for(j=0;j<15;j+=1)
            {
              if(line[i+j+2][0]<line[i-1][0])
                times++;
            }
            if(times>10) 
              return i+1;
          }
      }
      return 0;
 }
extern uint16 type;
uint8 angle_type=0;
Line Delete_In_Corner(int16 Dot[MAX_DOT_NUM][2], uint16 Dot_Num ,uint16 Split_Dot)
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
              if(left_dot<80)
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
                 if(right_dot<80)
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

float GetCircleR(Line MidLine)
{
	float X_Mean = 0, Y_Mean = 0;
	uint16 i;
	float Center_X;
	float Center_Y;
	float DET;
	float Mxx = 0, Myy = 0, Mxy = 0, Mxz = 0, Myz = 0, Mzz = 0, Xi, Yi, Zi, Mz, Cov_xy, Mxz2, Myz2, A2, A1, A0, A22;
	float yold;
	float epsilon = 0.01;
	float ynew = 1e+20;
	
	float xnew = 0;
	float Dy;
	float xold;
	float rtn;
	for (i = 0; i < MidLine.num; i++)
	{
		X_Mean += MidLine.dot[i][0];
		Y_Mean += MidLine.dot[i][1];
	}
	X_Mean = X_Mean / MidLine.num;
	Y_Mean = Y_Mean / MidLine.num;
	for (i = 0; i < MidLine.num; i++)
	{
		Xi = MidLine.dot[i][0] - X_Mean;
		Yi = MidLine.dot[i][1] - Y_Mean;
		Zi = Xi*Xi + Yi*Yi;
		Mxy = Mxy + Xi*Yi;
		Mxx = Mxx + Xi*Xi;
		Myy = Myy + Yi*Yi;
		Mxz = Mxz + Xi*Zi;
		Myz = Myz + Yi*Zi;
		Mzz = Mzz + Zi*Zi;
	}
	Mxx = Mxx / MidLine.num;
	Myy = Myy / MidLine.num;
	Mxy = Mxy / MidLine.num;
	Mxz = Mxz / MidLine.num;
	Myz = Myz / MidLine.num;
	Mzz = Mzz / MidLine.num;

	Mz = Mxx + Myy;
	Cov_xy = Mxx*Myy - Mxy*Mxy;
	Mxz2 = Mxz*Mxz;
	Myz2 = Myz*Myz;

	A2 = 4 * Cov_xy - 3 * Mz*Mz - Mzz;
	A1 = Mzz*Mz + 4 * Cov_xy*Mz - Mxz2 - Myz2 - Mz*Mz*Mz;
	A0 = Mxz2*Myy + Myz2*Mxx - Mzz*Cov_xy - 2 * Mxz*Myz*Mxy + Mz*Mz*Cov_xy;
	A22 = A2 + A2;

	for (i = 0; i < IterMax; i++)
	{
		yold = ynew;
		ynew = A0 + xnew*(A1 + xnew*(A2 + 4.*xnew*xnew));
		if (fabs(ynew)>fabs(yold))
		{
			return 0;
		}
		Dy = A1 + xnew*(A22 + 16 * xnew*xnew);
		xold = xnew;
		xnew = xold - ynew / Dy;
		if (abs((xnew - xold) / xnew) < epsilon) 
			break;
		if (i > IterMax)
			return 0;
		if (xnew < 0)
			return 0;
	}
	
	DET = xnew*xnew - xnew*Mz + Cov_xy;
	Center_X =  (Mxz*(Myy - xnew) - Myz*Mxy )/ DET / 2;
	Center_Y = (Myz*(Mxx - xnew) - Mxz*Mxy )/ DET / 2;
	rtn = sqrt(Center_X*Center_X + Center_Y*Center_Y + Mz + 2 * xnew);
	if (MidLine.dot[0][0]>MidLine.dot[MidLine.num - 1][0])
		rtn = rtn / -1;
	return  abs(rtn);
}
    