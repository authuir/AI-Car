#ifndef __CATCH_H__
#define __CATCH_H__

#define  X_MAX     150
#define  Y_MAX    165


#define TRUE_X_MAX   175

#define X_MAX_OUT 241
#define Y_MAX_OUT 314
//定义采样点数
#define dot_num 20
//定义中线起始和终止位置

#define  white 120
#define dark    100
extern uint16 threshold_left,threshold_right, threshold_max, threshold_min,threshold_left_next,threshold_right_next;//阈值
;
extern  uint8   date[X_MAX][Y_MAX+15];
extern uint16 center_dot,center_change;
extern int16 center[300][2];
extern float driver,an;
//确定跟随扫描点个数
#define scale   5
extern uint16 left_last,right_last;
extern uint16 threshold;
extern uint16 left_line[300][2],right_line[300][2],left_dot,right_dot;
void CAM_get();
uint8 single_mode();
void two_wile_mode();
void hang_scan(uint8 change_left,uint8 change_right);
void type_get();
void type1_line();
void  type2_line();
void type3_line();
void type3_forsingle();
uint8  type4_line();
void type6_line();
void type7_line(int16 * max,int16 *min);
void black_cross_flag_search();
int32 area_sum();


void get_roll_left(uint32 R,uint16 forward_look);
void get_roll_right(uint32 R,uint16 forward_look);
uint16  change_get(uint16 line[][2],uint16 dot_n);
uint8 identify_angle();
float ave_center();
#endif