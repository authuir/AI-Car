#ifndef __CATCH_H__
#define __CATCH_H__

#define  X_MAX     155
#define  Y_MAX    198

#define X_MAX_OUT 213
#define Y_MAX_OUT 257
//定义采样点数
#define dot_num 20
//定义中线起始和终止位置
#define start   0
#define end     10
#define  white 120
#define dark    100
extern uint16 threshold_left,threshold_right, threshold_max, threshold_min,threshold_left_next,threshold_right_next;//阈值
;
extern  uint8   date[X_MAX][Y_MAX+15];
extern uint16 center_dot,center_change,ave_line[60][2],ave_dot;
extern int16 center[300][2];
extern float driver,an;
//确定跟随扫描点个数
#define scale   5
extern uint16 left_last,right_last;


extern uint16 threshold;
extern uint16 left_line[500][2],right_line[500][2],left_dot,right_dot;
void CAM_get();
void single_mode();
void two_wile_mode();
void hang_scan();
void type_get();
void type1_line();
void  type2_line();
void type3_line();
uint8  type4_line();
void type6_line();
void black_cross_flag_search();
uint32 area_sum();


void get_roll_left(uint32 R,uint16 forward_look);
void get_roll_right(uint32 R,uint16 forward_look);
uint16  change_get(uint16 line[1000][2],uint16 dot_n);
uint8 identify_angle();
#endif