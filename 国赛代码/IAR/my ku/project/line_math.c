#include"line_math.h"



extern uint16 RST0[X_MAX * Y_MAX];
extern  uint16 RST1[X_MAX * Y_MAX];
float b;

float solv_line_k(uint16 array[][2], uint32 arr_sta, uint32 arr_end, uint8 ok, float *x, uint32 step_line, uint32 line_swap)
{
	int32 mul_sum_arr_xx = 0, mul_sum_arr_yy = 0, mul_sum_arr_xy = 0;
	uint32  length = 0,sum_of_arr_x = 0, sum_of_arr_y = 0;
	float mean_of_arr_x = 0, mean_of_arr_y = 0;
	float num_up = 0, num_down = 0, b_get;
	float result = 0;	uint32 i = 0;
	length = 1 + (arr_end - arr_sta) / step_line;


	if (!ok)
	{
		for (i = arr_sta; i <= arr_end; i = i + step_line)
		{
			sum_of_arr_x += array[i][0];
			sum_of_arr_y += array[i][1];
			mul_sum_arr_xy += array[i][0] * array[i][1];
			mul_sum_arr_xx += array[i][0] * array[i][0];
			mul_sum_arr_yy += array[i][1] * array[i][1];
		}
	}
	else
	{
		for (i = arr_sta; i <= arr_end; i = i + step_line)
		{
			sum_of_arr_x += RST0[array[i][0] * Y_MAX + array[i][1]];
			sum_of_arr_y += RST1[array[i][0] * Y_MAX + array[i][1]];
			mul_sum_arr_xy += RST0[array[i][0] * Y_MAX + array[i][1]] * RST1[array[i][0] * Y_MAX + array[i][1]];
			mul_sum_arr_xx += RST0[array[i][0] * Y_MAX + array[i][1]] * RST0[array[i][0] * Y_MAX + array[i][1]];
			mul_sum_arr_yy += RST1[array[i][0] * Y_MAX + array[i][1]] * RST1[array[i][0] * Y_MAX + array[i][1]];
		}
	}

	/////////mean();
	mean_of_arr_x = (float)sum_of_arr_x / (float)length;
	mean_of_arr_y = (float)sum_of_arr_y / (float)length;

	num_up = mul_sum_arr_xy - sum_of_arr_x*mean_of_arr_y;
	if (line_swap)
		num_down = mul_sum_arr_yy - sum_of_arr_y*mean_of_arr_y;
	else
		num_down = mul_sum_arr_xx - sum_of_arr_x*mean_of_arr_x;
	if ((num_down == 0))
	{
		if (num_up>0) { return 30.0; }
		else if (num_up<0) { return  -30.0; }
		else { return 0; }
	}
	result = num_up / num_down;
	b_get = mean_of_arr_y - result*mean_of_arr_x;
		*x = b_get;
	return result;
}


float simple_k_solve(uint16 array[][2],uint32 arr_sta, uint32 arr_end,uint32 line_swap)
{
  uint32 t=0,xy_val=0,xx_val=0,yy_val=0,x_sum=0,y_sum=0,i=0;
  float K_val=0,up_val=0,down_val=0;
  for(i=arr_sta;i<=arr_end;i++)
  {
    xy_val+=array[i][0]*array[i][1];
    xx_val+=array[i][0]*array[i][0];
    yy_val+=array[i][1]*array[i][1];
    x_sum+=array[i][0];
    y_sum+=array[i][1];
  }
  up_val=xy_val-((float)(x_sum*y_sum))/((float)(arr_end-arr_sta+1));
  if(line_swap)
  {
    down_val=yy_val-((float)(y_sum*y_sum))/((float)(arr_end-arr_sta+1));
  }
  else
  {
    down_val=xx_val-((float)(x_sum*x_sum))/((float)(arr_end-arr_sta+1));
  }
  if ((down_val == 0))
	{
		if (up_val>0) { return 10.0; }
		else if (up_val<0) { return  -10.0; }
		else { return 0; }
	}
  K_val=up_val/down_val;
  if(K_val>10) K_val=10;
  if(K_val<-10) K_val=-10;
  return K_val;
}

float solv_line_k2(int16 array[][2], uint32 arr_sta, uint32 arr_end, uint8 ok, float *x, uint32 step_line, uint32 line_swap)
{
	int32 mul_sum_arr_xx = 0, mul_sum_arr_yy = 0, mul_sum_arr_xy = 0;
	int32  length = 0,sum_of_arr_x = 0, sum_of_arr_y = 0;
	float mean_of_arr_x = 0, mean_of_arr_y = 0;
	float num_up = 0, num_down = 0, b_get;
	float result = 0;	int32 i = 0;
	length = 1 + (arr_end - arr_sta) / step_line;


	if (!ok)
	{
		for (i = arr_sta; i <= arr_end; i = i + step_line)
		{
			sum_of_arr_x += array[i][0];
			sum_of_arr_y += array[i][1];
			mul_sum_arr_xy += array[i][0] * array[i][1];
			mul_sum_arr_xx += array[i][0] * array[i][0];
			mul_sum_arr_yy += array[i][1] * array[i][1];
		}
	}
	else
	{
		for (i = arr_sta; i <= arr_end; i = i + step_line)
		{
			sum_of_arr_x += RST0[array[i][0] * Y_MAX + array[i][1]];
			sum_of_arr_y += RST1[array[i][0] * Y_MAX + array[i][1]];
			mul_sum_arr_xy += RST0[array[i][0] * Y_MAX + array[i][1]] * RST1[array[i][0] * Y_MAX + array[i][1]];
			mul_sum_arr_xx += RST0[array[i][0] * Y_MAX + array[i][1]] * RST0[array[i][0] * Y_MAX + array[i][1]];
			mul_sum_arr_yy += RST1[array[i][0] * Y_MAX + array[i][1]] * RST1[array[i][0] * Y_MAX + array[i][1]];
		}
	}

	/////////mean();
	mean_of_arr_x = (float)sum_of_arr_x / (float)length;
	mean_of_arr_y = (float)sum_of_arr_y / (float)length;

	num_up = mul_sum_arr_xy - sum_of_arr_x*mean_of_arr_y;
	if (line_swap)
		num_down = mul_sum_arr_yy - sum_of_arr_y*mean_of_arr_y;
	else
		num_down = mul_sum_arr_xx - sum_of_arr_x*mean_of_arr_x;
	if ((num_down == 0))
	{
		if (num_up>0) { return 30.0; }
		else if (num_up<0) { return  -30.0; }
		else { return 0; }
	}
	result = num_up / num_down;
	b_get = mean_of_arr_y - result*mean_of_arr_x;
		*x = b_get;
	return result;
}


float simple_k_solve2(int16 array[][2],uint32 arr_sta, uint32 arr_end,uint32 line_swap)
{
  int32 t=0,xy_val=0,xx_val=0,yy_val=0,x_sum=0,y_sum=0,i=0;
  float K_val=0,up_val=0,down_val=0;
  for(i=arr_sta;i<=arr_end;i++)
  {
    xy_val+=array[i][0]*array[i][1];
    xx_val+=array[i][0]*array[i][0];
    yy_val+=array[i][1]*array[i][1];
    x_sum+=array[i][0];
    y_sum+=array[i][1];
  }
  up_val=xy_val-((float)(x_sum*y_sum))/((float)(arr_end-arr_sta+1));
  if(line_swap)
  {
    down_val=yy_val-((float)(y_sum*y_sum))/((float)(arr_end-arr_sta+1));
  }
  else
  {
    down_val=xx_val-((float)(x_sum*x_sum))/((float)(arr_end-arr_sta+1));
  }
  if ((down_val == 0))
	{
		if (up_val>0) { return 10.0; }
		else if (up_val<0) { return  -10.0; }
		else { return 0; }
	}
  K_val=up_val/down_val;
  if(K_val>10) K_val=10;
  if(K_val<-10) K_val=-10;
  return K_val;
}
