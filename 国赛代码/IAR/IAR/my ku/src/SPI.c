#include "all.H"
//*********************************************************
//函数名称：SPI_init
//参数：SPI_NUM:SPI0~SPI3
//      master：是主机或者从机  MASTER   SLAVE
//*********************************************************
void SPI_init(uint8 SPI_NUM,uint8 master)//30M
 {
    switch(SPI_NUM)
     {
     case SPI0:SIM_SCGC6|=SIM_SCGC6_DSPI0_MASK;break;
     case SPI1:SIM_SCGC6|=SIM_SCGC6_DSPI1_MASK;break;
     case SPI2:SIM_SCGC3|=SIM_SCGC3_DSPI2_MASK;break;
     }
    HWREG(SPI_MCR_BASE+SPI_NUM*0X1000)=0|SPI_MCR_CLR_TXF_MASK
                                        |SPI_MCR_CLR_RXF_MASK
                                        |SPI_MCR_PCSIS_MASK
                                        |SPI_MCR_FRZ_MASK    //debug使能
                                        |SPI_MCR_HALT_MASK;         //Start trans
    if(master==MASTER) 
     {
         HWREG(SPI_MCR_BASE+SPI_NUM*(0X1000))|=SPI_MCR_MSTR_MASK;
         HWREG(SPI_CTAR0_BASE+SPI_NUM*(0X1000))=0
                                         //|SPI_CTAR_DBR_MASK
                                         |SPI_CTAR_FMSZ(0X07)
                                         |SPI_CTAR_PDT(0)
                                         |SPI_CTAR_BR(0)
                                         |SPI_CTAR_PCSSCK(2)
                                        // |SPI_CTAR_CPOL_MASK
                                        // |SPI_CTAR_CPHA_MASK
                                         |SPI_CTAR_PBR(1)|SPI_CTAR_DBR_MASK;
                            
     }
    else 
     {
         HWREG(SPI_CTAR0_BASE+SPI_NUM*(0X1000))=0
                                         |SPI_CTAR_FMSZ(0X07);
                                        // |SPI_CTAR_CPOL_MASK
                                         //|SPI_CTAR_CPHA_MASK;
     }
    HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))=0XFFFF0000;//全部清零
    HWREG(SPI_MCR_BASE+SPI_NUM*(0X1000))&=~SPI_MCR_HALT_MASK;
 }

void GPIOType_SPI(uint32 SPI_NUM,uint8 PCSx_NUM,uint8 SCK,uint8 SOUT,uint8 SIN)
 {
     if(SPI_NUM==SPI0)
      {
          switch(SCK)
           {
           case SPI0_SCK_PTA15:PORTA_PCR15=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_SCK_PTC5:PORTC_PCR5=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_SCK_PTD1:PORTD_PCR1=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           }
          switch(PCSx_NUM)
           {
           case SPI0_PCS0_PTA14:PORTA_PCR14=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_PCS5_PTB23:PORTB_PCR23=0|PORT_PCR_MUX(3)|PORT_PCR_DSE_MASK;break;
           case SPI0_PCS4_PTC0:PORTC_PCR0=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_PCS3_PTC1:PORTC_PCR1=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_PCS2_PTC2:PORTC_PCR2=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_PCS1_PTC3:PORTC_PCR3=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_PCS0_PTC4:PORTC_PCR4=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_PCS0_PTD0:PORTD_PCR0=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_PCS1_PTD4:PORTD_PCR4=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_PCS2_PTD5:PORTD_PCR5=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_PCS3_PTD6:PORTD_PCR6=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           }
          switch(SOUT)
           {
           case SPI0_SOUT_PTA16:PORTA_PCR16=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_SOUT_PTC6:PORTC_PCR6=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_SOUT_PTD2:PORTD_PCR2=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           }
          switch(SIN)
           {
           case SPI0_SIN_PTA17:PORTA_PCR17=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_SIN_PTC7:PORTC_PCR7=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI0_SIN_PTD3:PORTD_PCR3=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           }
      }
     if(SPI_NUM==SPI1)
      {
           switch(PCSx_NUM)
           {
           case SPI1_PCS1_PTE0:PORTE_PCR1=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI1_PCS0_PTE4:PORTE_PCR4=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI1_PCS2_PTE5:PORTE_PCR5=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI1_PCS3_PTE6:PORTE_PCR6=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI1_PCS1_PTB9:PORTB_PCR9=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI1_PCS0_PTB10:PORTB_PCR10=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           }
          switch(SCK)
           {
           case SPI1_SCK_PTE2:PORTE_PCR2=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI1_SCK_PTB11:PORTB_PCR11=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           }
          switch(SOUT)
           {
           case SPI1_SOUT_PTE1:PORTE_PCR1=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI1_SOUT_PTE3:PORTE_PCR3=0|PORT_PCR_MUX(7)|PORT_PCR_DSE_MASK;break;
           case SPI1_SOUT_PTB16:PORTB_PCR16=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           }
          switch(SIN)
           {
           case SPI1_SIN_PTE1:PORTE_PCR1=0|PORT_PCR_MUX(7)|PORT_PCR_DSE_MASK;break;
           case SPI1_SIN_PTE3:PORTE_PCR3=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI1_SIN_PTB17:PORTB_PCR17=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           }
      }
     if(SPI_NUM==SPI2)
      {
           switch(PCSx_NUM)
           {
           case SPI2_PCS0_PTB20:PORTB_PCR20=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI2_PCS0_PTD11:PORTD_PCR11=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI2_PCS1_PTD15:PORTD_PCR15=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           }
          switch(SCK)
           {
           case SPI2_SCK_PTB21:PORTB_PCR21=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI2_SCK_PTD12:PORTD_PCR12=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           }
          switch(SOUT)
           {
           case SPI2_SOUT_PTB22:PORTB_PCR22=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI2_SOUT_PTD13:PORTD_PCR13=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           }
          switch(SIN)
           {
           case SPI2_SIN_PTB23:PORTB_PCR23=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           case SPI2_SIN_PTD14:PORTD_PCR14=0|PORT_PCR_MUX(2)|PORT_PCR_DSE_MASK;break;
           }
      }
 }
//*********************************************************
//函数名称：SPI_Send
//参数：SPI_NUM:SPI0~SPI3
//      len:数据长度
//      data[]:传输数据数组
//*********************************************************
void SPI_Send(uint8 SPI_NUM,uint8 len,uint8 data[])
 {
    uint8 i=0;
    HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))=0XFFFF0000;//全部清零
    HWREG(SPI_MCR_BASE+SPI_NUM*(0X1000))|=SPI_MCR_CLR_TXF_MASK
                                        |SPI_MCR_CLR_RXF_MASK;
    for(i=0;i<len;i++)
     {
         if(i==len-1)
          {
         HWREG(SPI_PUSHR_BASE+SPI_NUM*(0X1000))=SPI_PUSHR_CTAS(0)
                                                |SPI_PUSHR_EOQ_MASK
                                                |SPI_PUSHR_PCS(1)
                                                |SPI_PUSHR_TXDATA(data[i]);
          }
         else
          {
          HWREG(SPI_PUSHR_BASE+SPI_NUM*(0X1000))=SPI_PUSHR_CONT_MASK
                                                |SPI_PUSHR_CTAS(0)
                                                |SPI_PUSHR_PCS(1)   
                                                |SPI_PUSHR_TXDATA(data[i]);    
          }
         while(!(HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))&(SPI_SR_TCF_MASK)));
         HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))|=SPI_SR_TCF_MASK;
     }
 }

//*********************************************************
//函数名称：SPI_Read
//参数：SPI_NUM:SPI0~SPI3
//      data[]:传输数据数组
//*********************************************************
void SPI_Read(uint8 SPI_NUM,uint8* data)
 {
     while(!((HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))&SPI_SR_RFDF_MASK)>>1));
          *data=(uint8)HWREG(SPI_POPR_BASE+SPI_NUM*(0X1000));
          HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))|=SPI_SR_RFDF_MASK;
     HWREG(SPI_SR_BASE+SPI_NUM*(0X1000))=0XFFFF0000;
     HWREG(SPI_MCR_BASE+SPI_NUM*0X1000)|=SPI_MCR_CLR_TXF_MASK
                                        |SPI_MCR_CLR_RXF_MASK;
 }

uint8 SPIx_ReadWriteByte(uint8 TX_DATA)
 {
     uint8 date;
          HWREG(SPI_PUSHR_BASE+SPI2*(0X1000))=SPI_PUSHR_CONT_MASK
                                                |SPI_PUSHR_CTAS(0)
                                                |SPI_PUSHR_PCS(1)   
                                                |SPI_PUSHR_TXDATA(TX_DATA); 
     while(!(HWREG(SPI_SR_BASE+SPI2*(0X1000))&(SPI_SR_TCF_MASK)));
     while(!((HWREG(SPI_SR_BASE+SPI2*(0X1000))&SPI_SR_RFDF_MASK)>>1));
     date=(uint8)HWREG(SPI_POPR_BASE+SPI2*(0X1000));
     HWREG(SPI_SR_BASE+SPI2*(0X1000))=0XFFFF0000;
     HWREG(SPI_MCR_BASE+SPI2*(0X1000))|=SPI_MCR_CLR_TXF_MASK
                                       |SPI_MCR_CLR_RXF_MASK;
      return date;
 }

uint8 SPIx_ReadWriteByte_last(uint8 TX_DATA)
 {
     uint8 date;
     HWREG(SPI_PUSHR_BASE+SPI0*(0X1000))=SPI_PUSHR_CTAS(0)
                                                |SPI_PUSHR_EOQ_MASK
                                                |SPI_PUSHR_PCS(1)
                                                |SPI_PUSHR_TXDATA(TX_DATA); 
     while(!(HWREG(SPI_SR_BASE+SPI0*(0X1000))&(SPI_SR_TCF_MASK)));
     while(!((HWREG(SPI_SR_BASE+SPI0*(0X1000))&SPI_SR_RFDF_MASK)>>1));
     date=(uint8)HWREG(SPI_POPR_BASE+SPI0*(0X1000));
     HWREG(SPI_SR_BASE+SPI0*(0X1000))=0XFFFF0000;
     HWREG(SPI_MCR_BASE+SPI0*(0X1000))|=SPI_MCR_CLR_TXF_MASK
                                        |SPI_MCR_CLR_RXF_MASK;
      return date;
 }
