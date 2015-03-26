#ifndef __TFT_H__
#define __TFT_H__

//SPI��ʾ���ӿ�

#define RST_PORT    PORTB
#define RST_PIN     0

#define DC_PORT     PORTB
#define DC_PIN      1

#define CS_PORT     PORTB
#define CS_PIN      2
//LCD_RST
#define SPILCD_RST_SET      GPIO_SET(RST_PORT, RST_PIN,1)//PB0 
#define SPILCD_RST_RESET    GPIO_SET(RST_PORT, RST_PIN,0)//PB0  
//LCD_RS//dc  
#define SPILCD_RS_SET       GPIO_SET(DC_PORT, DC_PIN,1)//PC4 
#define SPILCD_RS_RESET     GPIO_SET(DC_PORT, DC_PIN,0)//PC4  
//LCD_CS  
#define SPILCD_CS_SET       GPIO_SET(CS_PORT, CS_PIN,1)//PA4 
#define SPILCD_CS_RESET     GPIO_SET(CS_PORT, CS_PIN,0)//PA4 


//LCD��Ҫ������
typedef struct  
{ 					    
	uint16 width;			//LCD ���
	uint16 height;			//LCD �߶�
	uint16 id;				//LCD ID
	uint8	wramcmd;		//��ʼдgramָ��
	uint8  setxcmd;		//����x����ָ��
    uint8  dir;         //���ú���������
	uint8  setycmd;		//����y����ָ��	 
}_lcd_dev; 

//LCD����
extern _lcd_dev lcddev;	//����LCD��Ҫ����
//LCD�Ļ�����ɫ�ͱ���ɫ	   
extern uint16  POINT_COLOR;//Ĭ�Ϻ�ɫ    
extern uint16  BACK_COLOR; //������ɫ.Ĭ��Ϊ��ɫ

typedef struct
{
	uint16 LCD_REG;
	uint16 LCD_RAM;
} LCD_TypeDef;
//ʹ��NOR/SRAM�� Bank1.sector4,��ַλHADDR[27,26]=11 A10��Ϊ�������������� 
//ע������ʱSTM32�ڲ�������һλ����! 111110=0X3E			    
#define LCD_BASE        ((uint32)(0x60000000 | 0x0007FFFE))
#define LCD             ((LCD_TypeDef *) LCD_BASE)
//////////////////////////////////////////////////////////////////////////////////

//������ɫ
#define WHITE         	 0xFFFF
#define BLACK         	 0x0000	  
#define BLUE         	 0x001F  
#define BRED             0XF81F
#define GRED 			 0XFFE0
#define GBLUE			 0X07FF
#define RED           	 0xF800
#define MAGENTA       	 0xF81F
#define GREEN         	 0x07E0
#define CYAN          	 0x7FFF
#define YELLOW        	 0xFFE0
#define BROWN 			 0XBC40 //��ɫ
#define BRRED 			 0XFC07 //�غ�ɫ
#define GRAY  			 0X8430 //��ɫ
//GUI��ɫ

#define DARKBLUE      	 0X01CF	//����ɫ
#define LIGHTBLUE      	 0X7D7C	//ǳ��ɫ  
#define GRAYBLUE       	 0X5458 //����ɫ
//������ɫΪPANEL����ɫ 
 
#define LIGHTGREEN     	 0X841F //ǳ��ɫ
//#define LIGHTGRAY        0XEF5B //ǳ��ɫ(PANNEL)
#define LGRAY 			 0XC618 //ǳ��ɫ(PANNEL),���屳��ɫ

#define LGRAYBLUE        0XA651 //ǳ����ɫ(�м����ɫ)
#define LBBLUE           0X2B12 //ǳ����ɫ(ѡ����Ŀ�ķ�ɫ)


void LCD_WR_REG(uint16 regval);
void LCD_WR_DATA(uint16 data);
void LCD_WR_DATA8(uint8 da);   //д8λ����
void LCD_WR_REG_DATA(uint8 LCD_Reg, uint16 LCD_RegValue);
void LCD_WriteRAM_Prepare(void);
void opt_delay(uint8 i);
void LCD_DisplayOn(void);
void LCD_DisplayOff(void);
void LCD_SetCursor(uint16 Xpos, uint16 Ypos);
void LCD_DrawPoint(uint16 x,uint16 y);
void TFT_Init(void);
void TFT_Clear(uint16 color);
void TFT_Fill(uint16 sx,uint16 sy,uint16 ex,uint16 ey,uint16 color);
void TFT_Color_Fill(uint16 sx,uint16 sy,uint16 ex,uint16 ey,uint16 *color);
void TFT_DrawLine(uint16 x1, uint16 y1, uint16 x2, uint16 y2);
void TFT_DrawRectangle(uint16 x1, uint16 y1, uint16 x2, uint16 y2);
void Draw_Circle(uint16 x0,uint16 y0,uint8 r);
void showhanzi16(unsigned int x,unsigned int y,unsigned char index)	;
void showhanzi32(unsigned int x,unsigned int y,unsigned char index)	;
void LCD_ShowChar(uint16 x,uint16 y,uint8 num,uint8 size,uint8 mode);
uint32 LCD_Pow(uint8 m,uint8 n);
void LCD_ShowNum(uint16 x,uint16 y,uint32 num,uint8 len,uint8 size);
void LCD_ShowxNum(uint16 x,uint16 y,uint32 num,uint8 len,uint8 size,uint8 mode);
void LCD_ShowString(uint16 x,uint16 y,uint16 width,uint16 height,uint8 size,uint8 *p);
void showimage(uint16 x,uint16 y); //��ʾ40*40ͼƬ
#endif