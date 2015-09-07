#ifndef __KEYBOARD_H__
#define __KEYBOARD_H__

#define Key0    100
#define Key1    101
#define Key2    102
#define Key3    103
#define Key4    104
#define Key5    105

typedef struct __MenuVar
{
	void * Ptr;
	uint8 AD_Name[10];
	float AD_Var;
} _MenuVar;

extern uint8 RUN_TIME_MODE;

void Key_init();
uint8 Key_get();
extern uint8 start_run,run_time; 
extern int8 mulu;
extern float for_ward;
void Switch_init();
uint8 Switch_get(uint8 swtch_num);
void ChooseMode();
void ThouSet();

#endif


