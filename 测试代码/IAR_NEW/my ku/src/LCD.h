#ifndef __LCD_H__
#define __LCD_H__

#define XLevelL		0x00
#define XLevelH		0x10
#define XLevel		((XLevelH&0x0F)*16+XLevelL)
#define Max_Column	128
#define Max_Row		  64
#define	Brightness	0xCF 

#define X_WIDTH 128
#define Y_WIDTH 64


#if 1
                
    //*********智能车板
    //D0端口选择
    #define LCD_D0_PORT          PORTA
    #define LCD_D0_PORT_PIN      13
    //D1端口选择
    #define LCD_D1_PORT          PORTA
    #define LCD_D1_PORT_PIN      14
    //reset端口选择
    #define LCD_RESET_PORT       PORTA
    #define LCD_RESET_PORT_PIN   15
    //DC端口选择
    #define LCD_DC_PORT          PORTA
    #define LCD_DC_PORT_PIN      16

#endif

#define DC_set         GPIO_SET(LCD_DC_PORT,LCD_DC_PORT_PIN,1) 
#define DC_clear       GPIO_SET(LCD_DC_PORT,LCD_DC_PORT_PIN,0) 

#define D0_set         GPIO_SET(LCD_D0_PORT,LCD_D0_PORT_PIN,1) 
#define D0_clear       GPIO_SET(LCD_D0_PORT,LCD_D0_PORT_PIN,0)

#define D1_set         GPIO_SET(LCD_D1_PORT,LCD_D1_PORT_PIN,1) 
#define D1_clear       GPIO_SET(LCD_D1_PORT,LCD_D1_PORT_PIN,0)

#define reset_set      GPIO_SET(LCD_RESET_PORT,LCD_RESET_PORT_PIN,1) 
#define reset_clear    GPIO_SET(LCD_RESET_PORT,LCD_RESET_PORT_PIN,0)
void LCD_WrDat(uint8 data);

void LCD_WrCmd(uint8 cmd);
void LCD_Set_Pos(uint8 x, uint8 y);

void LCD_Fill(uint8 bmp_data);
void LCD_clear(void);
void LCD_Init(void);

//==============================================================
//函数名： void LCD_PutPixel(uint8 x,uint8 y)
//功能描述：绘制一个点（x,y）
//参数：真实坐标值(x,y),x的范围0～127，y的范围0～64
//返回：无
//==============================================================
void LCD_PutPixel(uint8 x,uint8 y);

//==============================================================
//函数名： void LCD_Rectangle(uint8 x1,uint8 y1,uint8 x2,uint8 y2,uint8 gif)
//功能描述：绘制一个实心矩形
//参数：左上角坐标（x1,y1）,右下角坐标（x2，y2）
//      其中x1、x2的范围0～127，y1，y2的范围0～63，即真实坐标值
//返回：无
//==============================================================
void LCD_Rectangle(uint8 x1,uint8 y1,uint8 x2,uint8 y2,uint8 gif);
//==============================================================
//函数名：LCD_6x8Str(uint8 x,uint8 y,uint8 *p)
//功能描述：写入一组标准ASCII字符串
//参数：显示的位置（x,y），y为页范围0～7，要显示的字符串
//返回：无
//==============================================================  
void LCD_6x8Str(uint8 x,uint8 y,uint8 ch[]);
//==============================================================
//函数名：LCD_8x16Str(uint8 x,uint8 y,uint8 *p)
//功能描述：写入一组标准ASCII字符串
//参数：显示的位置（x,y），y为页范围0～7，要显示的字符串
//返回：无
//==============================================================  
void LCD_8x16Str(uint8 x,uint8 y,uint8 ch[]);
//==============================================================
//函数名： void Draw_BMP(uint8 x,uint8 y)
//功能描述：显示BMP图片128×64
//参数：起始点坐标(x,y),x的范围0～127，y为页的范围0～7
//返回：无
//==============================================================
void Draw_BMP(uint8 x0,uint8 y0,uint8 x1,uint8 y1,uint8 bmp[]);

//============================================================== 
//显示一个16*16的汉字
////功能描述：写入一个汉字
//参数：显示的位置（x,y），y为页范围0～3，x为0~7要显示的汉字
//返回：无
//取模方式：纵向取模，字节倒序
//============================================================== 
void LCD_char16x16(uint8 x,uint8 y,const uint8 a[]);

//==============================================================
//LCD_6x8char(uint8 x,uint8 y,uint8 num)
//功能描述：写入一个标准ASCII字符
//参数：显示的位置（x,y），y为页范围0～7，x为20要显示的字符串
//返回：无
//==============================================================  
void LCD_6x8char(uint8 x,uint8 y,uint8 num);
//==============================================================
//void LCD_8x16char(uint8 x,uint8 y,uint8 num)
//功能描述：写入一个标准ASCII字符
//参数：显示的位置（x,y），y为页范围0～3，x为16要显示的字符串
//返回：无
//==============================================================
void LCD_8x16char(uint8 x,uint8 y,uint8 num);
#endif 