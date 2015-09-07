//*************************************************
//designed for SCCB of  OV  CAMARA
//defsigner : L J
//the fastest frequence:400K HZ
//***************************************************
//ov7620
#include "all.h"
#define uint8_t uint8
#define uint16_t uint16
void SCCB_init()
 {
     GPIO_INIT(SIO_C_PORT,SIO_C_PIN,OUTPUT);
     GPIO_INIT(SIO_D_PORT,SIO_D_PIN,OUTPUT);
     GPIOPULL_SET(SIO_C_PORT,SIO_C_PIN,PULL_UP);
     GPIOPULL_SET(SIO_D_PORT,SIO_D_PIN,PULL_UP);
     SIO_C_Set;
     GPIO_SET(SIO_D_PORT,SIO_D_PIN,0);
     
     
     GPIO_INIT(PORTC,19,OUTPUT);
     GPIO_INIT(PORTC,16,OUTPUT);
     GPIO_SET(PORTC,19,1);
 }
void trrigle()
 {
     GPIO_SET(PORTC,16,1);
     SYSDelay_us(1);
      GPIO_SET(PORTC,16,0);
 }
//************************************************
//OV7620
void write_Date(uint8 write_date)
 {
     uint8 i,bit;
     for(i=0;i<8;i++)
      {
          SIO_C_Clear;
          bit=write_date&0x80;
          GPIO_SET(SIO_D_PORT,SIO_D_PIN,bit);
          SYSDelay_us(3);
          SIO_C_Set;
          SYSDelay_us(3);
          write_date=write_date<<1;
      }
     SIO_C_Clear;
     GPIO_SET(SIO_D_PORT,SIO_D_PIN,0);
     SYSDelay_us(3);
     SIO_C_Set;
     SYSDelay_us(3);
     SIO_C_Clear;
 }
void SCCB_start()
 {
     SIO_C_Set;
     SYSDelay_us(1);
     GPIO_SET(SIO_D_PORT,SIO_D_PIN,1);
     SYSDelay_us(2);
     GPIO_SET(SIO_D_PORT,SIO_D_PIN,0);
     SYSDelay_us(1);
     SIO_C_Clear;
     SYSDelay_us(1);
 }

void SCCB_stop()
 {
     GPIO_INIT(SIO_D_PORT,SIO_D_PIN,OUTPUT);
     SIO_C_Set;
     SYSDelay_us(1);
     GPIO_SET(SIO_D_PORT,SIO_D_PIN,1);
     SYSDelay_us(1);
     GPIO_SET(SIO_D_PORT,SIO_D_PIN,0);
 }
void SCCB_write(uint8 ID_Address,uint8 Sub_address,uint8 write_date)
 {
     SCCB_start();
     write_Date((ID_Address<<1)&0xfe);
     write_Date(Sub_address);
     write_Date(write_date);
     SYSDelay_us(3);
     SCCB_stop();
     SYSDelay_us(100);
 }
uint8 SCCB_read(uint8 ID_Address,uint8 Sub_address)
 {
    uint8 i,bit,read_date; 
    SCCB_start();
    write_Date((ID_Address<<1)&0xfe);
    write_Date(Sub_address);
    SYSDelay_us(1);
    SCCB_start();
    write_Date((ID_Address<<1)|0x01);
    GPIO_INIT(SIO_D_PORT,SIO_D_PIN,INPUT);
    for(i=0;i<8;i++)
     {
         SIO_C_Set;
         bit=GPIO_GET(SIO_D_PORT,SIO_D_PIN);
         SYSDelay_us(3);
         read_date|=bit<<(7-i);
         SIO_C_Clear;
         SYSDelay_us(4);
     }
    SIO_C_Set;
    bit=GPIO_GET(SIO_D_PORT,SIO_D_PIN);
    SYSDelay_us(3);
    SIO_C_Clear;
    SYSDelay_us(3);
    SCCB_stop();
    SYSDelay_us(10);
    return read_date;
 }


void SCCB_CAT_Start(void)
 {
     SIO_D_Set;
     SYSDelay_us(1);
     SIO_C_Set;
     SYSDelay_us(1);
     SIO_D_Clear;
     SYSDelay_us(1);
     SIO_C_Clear;
     SYSDelay_us(2);
 }

void SCCB_CAT_Stop(void)
 {
     SIO_D_Clear;
     SYSDelay_us(1);
     SIO_C_Set;
      SYSDelay_us(1);
      SIO_D_Set;
     SYSDelay_us(1);
     SIO_C_Clear;
      SYSDelay_us(2);
 }

void slave_ACK(void)
 {
     SIO_D_Clear; 
     SYSDelay_us(1);      // ?車那㊣1us 
     SIO_C_Set;
     SYSDelay_us(1);	
     SIO_C_Clear;
     SYSDelay_us(2);
     SIO_D_Set;
     SYSDelay_us(1);      // ?車那㊣1us 

 }
void slave_NOACK(void)
 {
     SIO_D_Set;  
        SYSDelay_us(1);      // ?車那㊣1us 
	SIO_C_Set;
	SYSDelay_us(3);
    	SIO_C_Clear;
    SYSDelay_us(2);
	SIO_D_Clear;
    SYSDelay_us(1);      // ?車那㊣1us 

 }
//--------------------------------------------------------------------------------------------------
// o‘那y??3?㏒o check_ACK
// o‘那y1|?邦㏒o ?¯?迆車|∩e???足2谷℅車3足D辰㏒??豕那1那y?Y∩?那?1y3足?芍那?
//--------------------------------------------------------------------------------------------------
uint8_t check_ACK(void)
{ 
	uint8_t check ;
        SIO_D_Set; 
        GPIO_INIT(SIO_D_PORT,SIO_D_PIN,INPUT);
        SYSDelay_us(1);      // ?車那㊣1us 
	SIO_C_Set;
	check = 0;
	if(GPIO_GET(SIO_D_PORT,SIO_D_PIN) == 1)    // 豕?BFSDA=1 ㊣赤?¯﹞?車|∩e㏒?????﹞?車|∩e㊣那??F0
	   check = 1;
        SYSDelay_us(1);      // ?車那㊣1us 
	SIO_C_Clear;
        //gpio_init (PORTE , 12, GPO,HIGH);      
        GPIO_INIT(SIO_D_PORT,SIO_D_PIN,OUTPUT);         //
        SIO_D_Set;
        return  check ;
}

//--------------------------------------------------------------------------------------------------
// o‘那y??3?㏒o IICSendByte
// 豕??迆2?那y㏒o ch
// o‘那y1|?邦㏒o ﹞⊿?赤辰???℅??迆
//--------------------------------------------------------------------------------------------------
void CAT_write(uint8_t ch)
{ 
	uint8_t n=8;     // ?辰BFSDA谷?﹞⊿?赤辰???那y?Y℅??迆㏒?12～???
	while(n--)
	{ 
		if((ch&0x80) == 0x80)    // 豕?辰a﹞⊿?赤米?那y?Y℅??????a1?辰﹞⊿?赤??1
		{
                  SIO_D_Set;    // ∩??赤??1
                  SYSDelay_us(1);
                  SIO_C_Set;
                  SYSDelay_us(2);
                  SIO_C_Clear;  
                  SYSDelay_us(1);
                  SIO_D_Clear;
                  SYSDelay_us(1);
                  
		}
		else
		{  
                  SIO_D_Clear;    // ﹞??辰∩??赤??0
                  SYSDelay_us(1);
                  SIO_C_Set;
                  SYSDelay_us(2);
                  SIO_C_Clear;  
                  SYSDelay_us(2);
		}
		ch = ch<<1;    // 那y?Y℅車辰?辰???
	}
}
//--------------------------------------------------------------------------------------------------
// o‘那y??3?㏒o IICreceiveByte
// ﹞米???車那?米?那y?Y
// o‘那y1|?邦㏒o ?車那?辰?℅??迆℅車3足D辰
//--------------------------------------------------------------------------------------------------
uint8_t CAT_read(void)
{
	uint8_t n=8;    // ∩車BFSDA??谷??芍豕?辰?谷?那y?Y℅??迆㏒?12～???
	uint8_t tdata = 0;
    GPIO_INIT(SIO_D_PORT,SIO_D_PIN,INPUT);
	while(n--)
	{      
                SYSDelay_us(1);
                SIO_C_Clear;
                SYSDelay_us(2);
		SIO_C_Set;
                SYSDelay_us(2);
		tdata = tdata<<1;    // ℅車辰?辰???㏒??辰_crol_(temp,1)
		if(GPIO_GET(SIO_D_PORT,SIO_D_PIN) == 1)
                  tdata = tdata|0x01;    // 豕??車那?米?米????a1㏒??辰那y?Y米?℅?o車辰?????1
		else 
                  tdata = tdata&0xfe;    // ﹞??辰那y?Y米?℅?o車辰?????0
	       SIO_C_Clear;
	}
     GPIO_INIT(SIO_D_PORT,SIO_D_PIN,OUTPUT);
	return(tdata);
}


uint8 SCCB_Cat_write(uint8 slave_add,uint8 register_add,uint8 date)
 {
     uint8_t check = 1;
     SCCB_CAT_Start();
     CAT_write(slave_add);
     check = check_ACK();   
     /*if(check == 1)
      { 
	      return 0;    // 豕?﹞?車|∩e㊣赤?¯?¯?t∩赤?車?辰辰??米㏒???∩赤?車㊣那????SystemError
      }*/
     CAT_write(register_add);     
     check= check_ACK();    // ?足2谷車|∩e??
     //uart_putchar(UART0,send_da);
     /*if (check == 1)
      {
          return 0;    // 豕?﹞?車|∩e㊣赤?¯?¯?t∩赤?車?辰辰??米㏒???∩赤?車㊣那????SystemError
      }*/
     CAT_write(date);     
     check= check_ACK();    // ?足2谷車|∩e??
     //uart_putchar(UART0,send_da);
     /*if (check == 1)
      {
          return 0;    // 豕?﹞?車|∩e㊣赤?¯?¯?t∩赤?車?辰辰??米㏒???∩赤?車㊣那????SystemError
      }*/
     SCCB_CAT_Stop();
     return 1;
 }

uint8 SCCB_Cat_read(uint8 slave_add,uint8 register_add)
{ 
	uint8_t receive_da,check;
    SCCB_CAT_Start();
	CAT_write(slave_add);
        SYSDelay_us(1);      // ?車那㊣1us 
        check =check_ACK();
	/*if(check == 1)
	{
		return 0 ;
	}*/
        CAT_write(register_add);
        SYSDelay_us(1);      // ?車那㊣1us 
        check =check_ACK();
	/*if(check == 1)
	{
		return 0 ;
	}*/
       // uart_putchar(UART0,rece_data_buff[0]);
	SCCB_CAT_Start();
	CAT_write(slave_add+1);
        SYSDelay_us(1);      // ?車那㊣1us 
	check =check_ACK();
	/*if(check == 1)
	{
		return 0 ;
	}    */
       receive_da=CAT_read();
       slave_NOACK();    // 那?米?℅?o車辰???℅??迆o車﹞⊿?赤辰???﹞?車|∩e??
       SCCB_CAT_Stop();
       return receive_da;
}

uint8_t  write_catch[ ] ={
   0x03,0x00,0x0c,0x00,0X11,0X00,0X12,0X11,0X13,0X17,0X15,0X02,0X16,0X03,0X03,0X00,
   0X17,0X20,0X18,0Xf0,0X19,0X30,0X1a,0Xf0,0X1b,0X2a,0X1f,0X20,0X20,0X02,0X09,0X03,
   0X21,0X00,0X22,0X20,0X23,0X33,0X24,0X8a,0X25,0X7a,0X2A,0X00,0X2B,0X00,0X2c,0X00,
   0X2d,0X4f,0X2e,0X96,0X2f,0X00,0X3a,0X00,0X3b,0X60,0X3e,0X34,0X3f,0Xb0,0X40,0X4c,
   0X41,0X3b,0X42,0X30,0X43,0X25,0X44,0X1d,0X45,0X15,0X46,0X10,0X47,0X0f,0X48,0X0d,
   0X49,0X0b,0X4b,0X09,0X4c,0X09,0X4e,0X08,0X4f,0X06,0X50,0X05,0X51,0X2f,0X52,0X90,
   0X53,0X01,0X54,0X87,0X56,0xf0,0X57,0X32,0X58,0X8b,0X59,0X06,0X5a,0X9b,0X5b,0X35,
   0X64,0X02,0X67,0X80,0X68,0X80,0X69,0XA0,0X6a,0X89,0X70,0Xae,0X71,0Xa6,0X72,0X4f,
   0X73,0X5f,0X74,0X27,0X80,0X41,0X81,0X08,0X82,0X16,0X83,0X24,0X84,0X24,0X85,0X2a,
   0X86,0X4f,0X89,0Xb2,0X8a,0Xaa,0X8b,0X02,0X8e,0X02,0X8f,0X70,0X95,0X14,0X9d,0X36,
   0X9e,0X04,0Xa1,0X27,0Xa2,0X12,0Xa3,0X2d,0Xa4,0X08,0Xa5,0X2e,0Xa6,0X04,0Xa7,0X80,
   0Xa8,0X80,0Xa9,0X21,0Xaa,0X21,0Xab,0X21,0Xac,0X0a,0Xad,0Xf0,0Xae,0Xff,0Xb1,0Xb0,
   0Xb2,0Xb0,0Xb6,0X80,0Xb7,0X80,0Xb8,0X80,0Xb9,0X00,0Xe7,0X7c,0Xf0,0X00,0Xf1,0X01,
   0Xf1,0X01,0Xf1,0X01,
};

uint8 SCCB_Catch(void)
 {
     uint8 read_da=0,i;
     for(i=0;i<212;i+=2)
      {
        SCCB_Cat_write(cat_address,write_catch[i],write_catch[i+1]);
        read_da=SCCB_Cat_read(cat_address,write_catch[i]);
        if(read_da!=write_catch[i+1]) return 0;
        SYSDelay_us(100);
      }
     return 1;
 }
uint8 MT34_Write(uint8 slave_add,uint8 register_add,uint16 date)
 {
     uint8_t check = 1;
     uint8 date1=(uint8)(date>>8),date2=(uint8)(date&0xff);
     SCCB_CAT_Start();
     CAT_write(slave_add);
     check = check_ACK();   
     if(check == 1)
      { 
	      return 0;    // 豕?﹞?車|∩e㊣赤?¯?¯?t∩赤?車?辰辰??米㏒???∩赤?車㊣那????SystemError
      }
     CAT_write(register_add);     
     check= check_ACK();    // ?足2谷車|∩e??
     //uart_putchar(UART0,send_da);
     if (check == 1)
      {
          return 0;    // 豕?﹞?車|∩e㊣赤?¯?¯?t∩赤?車?辰辰??米㏒???∩赤?車㊣那????SystemError
      }
     CAT_write(date1);     
     check= check_ACK();    // ?足2谷車|∩e??
     //uart_putchar(UART0,send_da);
     if (check == 1)
      {
          return 0;    // 豕?﹞?車|∩e㊣赤?¯?¯?t∩赤?車?辰辰??米㏒???∩赤?車㊣那????SystemError
      }
     CAT_write(date2);     
     check= check_ACK();
     if (check == 1)
      {
          return 0;    // 豕?﹞?車|∩e㊣赤?¯?¯?t∩赤?車?辰辰??米㏒???∩赤?車㊣那????SystemError
      }
     SCCB_CAT_Stop();
     return 1;
 }

uint16 MT34_Read(uint8 slave_add,uint8 register_add)
{ 
	uint8_t check;
    uint16 date_out;
    uint16 date1=0,date2;
    SCCB_CAT_Start();
	CAT_write(slave_add);
    check =check_ACK();
    SYSDelay_us(1);
    if(check == 1)
	{
		return 0 ;
	}   
    CAT_write(register_add);      // ?車那㊣1us 
    check =check_ACK();
    SYSDelay_us(1);
    if(check == 1)
	{
		return 0 ;
	}   
	SCCB_CAT_Start();
	CAT_write(slave_add+1);
    check =check_ACK();
      if(check == 1)
	{
		return 0 ;
	}  
    date1=CAT_read();
    slave_ACK();
    date2=CAT_read();
    slave_NOACK();
    SCCB_CAT_Stop();
    date_out=((uint16)date1<<8)|(uint16)(date2);
       return date_out;
}

uint16 read_ru;
uint8 MT34_init()
 {  
      //MT34_Write(0xb8,0x0F,1);//HDR
   // MT34_Write(0xb8,0xaf,0);//AEC=0 AGC=0*/
   //  MT34_Write(0xb8,0x0a,0);//Auto _exposure
     
     /*MT34_Write(0xb8,0x08,250);
     MT34_Write(0xb8,0x09,300);
     MT34_Write(0xb8,0x0b,500);
    //MT34_Write(0xb8,0x07,0X01CE);*/
      //MT34_Write(0xb8,0X35,50);
         while(read_ru!=0x0305)
      {
            MT34_Write(0xb8,0x0d,0x0305);
            read_ru=MT34_Read(0xb8,0x0d);
      }
     return 1;
 
 }
