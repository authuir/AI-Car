#include "all.h"
extern float b;

float solv_line_k(uint16 array[500][2], uint32 arr_sta, uint32 arr_end, uint8 ok, float *x, uint32 step_line, uint32 line_swap);
float simple_k_solve(uint16 array[][2], uint32 arr_sta, uint32 arr_end, uint32 line_swap);
float solv_line_k2(int16 array[][2], uint32 arr_sta, uint32 arr_end, uint8 ok, float *x, uint32 step_line, uint32 line_swap);
float simple_k_solve2(int16 array[][2],uint32 arr_sta, uint32 arr_end,uint32 line_swap);

