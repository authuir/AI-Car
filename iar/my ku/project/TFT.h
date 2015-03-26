#ifndef __TFT_H__
#define __TFT_H__

//SPI显示屏接口

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


//LCD重要参数集
typedef struct  
{ 					    
	uint16 width;			//LCD 宽度
	uint16 height;			//LCD 高度
	uint16 id;				//LCD ID
	uint8	wramcmd;		//开始写gram指令
	uint8  setxcmd;		//设置x坐标指令
    uint8  dir;         //设置横竖屏方向
	uint8  setycmd;		//设置y坐标指令	 
}_lcd_dev; 

//LCD参数
extern _lcd_dev lcddev;	//管理LCD重要参数
//LCD的画笔颜色和背景色	   
extern uint16  POINT_COLOR;//默认红色    
extern uint16  BACK_COLOR; //背景颜色.默认为白色

typedef struct
{
	uint16 LCD_REG;
	uint16 LCD_RAM;
} LCD_TypeDef;
//使用NOR/SRAM的 Bank1.sector4,地址位HADDR[27,26]=11 A10作为数据命令区分线 
//注意设置时STM32内部会右移一位对其! 111110=0X3E			    
#define LCD_BASE        ((uint32)(0x60000000 | 0x0007FFFE))
#define LCD             ((LCD_TypeDef *) LCD_BASE)
//////////////////////////////////////////////////////////////////////////////////

//画笔颜色
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
#define BROWN 			 0XBC40 //棕色
#define BRRED 			 0XFC07 //棕红色
#define GRAY  			 0X8430 //灰色
//GUI颜色

#define DARKBLUE      	 0X01CF	//深蓝色
#define LIGHTBLUE      	 0X7D7C	//浅蓝色  
#define GRAYBLUE       	 0X5458 //灰蓝色
//以上三色为PANEL的颜色 
 
#define LIGHTGREEN     	 0X841F //浅绿色
//#define LIGHTGRAY        0XEF5B //浅灰色(PANNEL)
#define LGRAY 			 0XC618 //浅灰色(PANNEL),窗体背景色

#define LGRAYBLUE        0XA651 //浅灰蓝色(中间层颜色)
#define LBBLUE           0X2B12 //浅棕蓝色(选择条目的反色)


void LCD_WR_REG(uint16 regval);
void LCD_WR_DATA(uint16 data);
void LCD_WR_DATA8(uint8 da);   //写8位数据
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
void showimage(uint16 x,uint16 y); //显示40*40图片
#endif