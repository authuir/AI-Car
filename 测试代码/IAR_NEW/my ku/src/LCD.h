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
                
    //*********���ܳ���
    //D0�˿�ѡ��
    #define LCD_D0_PORT          PORTA
    #define LCD_D0_PORT_PIN      13
    //D1�˿�ѡ��
    #define LCD_D1_PORT          PORTA
    #define LCD_D1_PORT_PIN      14
    //reset�˿�ѡ��
    #define LCD_RESET_PORT       PORTA
    #define LCD_RESET_PORT_PIN   15
    //DC�˿�ѡ��
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
//�������� void LCD_PutPixel(uint8 x,uint8 y)
//��������������һ���㣨x,y��
//��������ʵ����ֵ(x,y),x�ķ�Χ0��127��y�ķ�Χ0��64
//���أ���
//==============================================================
void LCD_PutPixel(uint8 x,uint8 y);

//==============================================================
//�������� void LCD_Rectangle(uint8 x1,uint8 y1,uint8 x2,uint8 y2,uint8 gif)
//��������������һ��ʵ�ľ���
//���������Ͻ����꣨x1,y1��,���½����꣨x2��y2��
//      ����x1��x2�ķ�Χ0��127��y1��y2�ķ�Χ0��63������ʵ����ֵ
//���أ���
//==============================================================
void LCD_Rectangle(uint8 x1,uint8 y1,uint8 x2,uint8 y2,uint8 gif);
//==============================================================
//��������LCD_6x8Str(uint8 x,uint8 y,uint8 *p)
//����������д��һ���׼ASCII�ַ���
//��������ʾ��λ�ã�x,y����yΪҳ��Χ0��7��Ҫ��ʾ���ַ���
//���أ���
//==============================================================  
void LCD_6x8Str(uint8 x,uint8 y,uint8 ch[]);
//==============================================================
//��������LCD_8x16Str(uint8 x,uint8 y,uint8 *p)
//����������д��һ���׼ASCII�ַ���
//��������ʾ��λ�ã�x,y����yΪҳ��Χ0��7��Ҫ��ʾ���ַ���
//���أ���
//==============================================================  
void LCD_8x16Str(uint8 x,uint8 y,uint8 ch[]);
//==============================================================
//�������� void Draw_BMP(uint8 x,uint8 y)
//������������ʾBMPͼƬ128��64
//��������ʼ������(x,y),x�ķ�Χ0��127��yΪҳ�ķ�Χ0��7
//���أ���
//==============================================================
void Draw_BMP(uint8 x0,uint8 y0,uint8 x1,uint8 y1,uint8 bmp[]);

//============================================================== 
//��ʾһ��16*16�ĺ���
////����������д��һ������
//��������ʾ��λ�ã�x,y����yΪҳ��Χ0��3��xΪ0~7Ҫ��ʾ�ĺ���
//���أ���
//ȡģ��ʽ������ȡģ���ֽڵ���
//============================================================== 
void LCD_char16x16(uint8 x,uint8 y,const uint8 a[]);

//==============================================================
//LCD_6x8char(uint8 x,uint8 y,uint8 num)
//����������д��һ����׼ASCII�ַ�
//��������ʾ��λ�ã�x,y����yΪҳ��Χ0��7��xΪ20Ҫ��ʾ���ַ���
//���أ���
//==============================================================  
void LCD_6x8char(uint8 x,uint8 y,uint8 num);
//==============================================================
//void LCD_8x16char(uint8 x,uint8 y,uint8 num)
//����������д��һ����׼ASCII�ַ�
//��������ʾ��λ�ã�x,y����yΪҳ��Χ0��3��xΪ16Ҫ��ʾ���ַ���
//���أ���
//==============================================================
void LCD_8x16char(uint8 x,uint8 y,uint8 num);
#endif 