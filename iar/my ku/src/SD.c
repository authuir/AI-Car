#include "all.h"

uint8 SDHC_init(uint32 coreclock,uint32 baud,uint16 size)
 {
     SIM_SCGC3|=SIM_SCGC3_ESDHC_MASK;//开启时钟
     //复位SDHC
     SDHC_SYSCTL=SDHC_SYSCTL_RSTA_MASK|SDHC_SYSCTL_SDCLKFS(0X01);
     whlie(SDHC_SYSCTL|SDHC_SYSCTL_RSTA_MASK);
     
     //初始化相关寄存器
     SDHC_VENDOR=0;
     SDHC_BLKATTR=SDHC_BLKATTR_TLKCNT(1)|SDHC_BLKATTR_BLKSIZE(size);
     SDHC_PROCTL=SDHC_PROCTL_EMODE(1)|SDHC_PROCTL_D3CD_MASK;
     SDHC_WML=SDHC_WML_RDWML(1)|SDHC_WML_WRWML(1);
     while(SDHC_PRSSTAT&(SDHC_PRSSTAT_CIHB_MASK|SDHC_PRSSTAT_CDIHB_MASK)){};
     PORTE_PCR0=PORT_PCR_MUX(4)|PORT_PCR_PS_MASK|PORT_PCR_PE_MASK|PORT_PCR_DSE_MASK;//D1
     PORTE_PCR1=PORT_PCR_MUX(4)|PORT_PCR_PS_MASK|PORT_PCR_PE_MASK|PORT_PCR_DSE_MASK;//D0
     PORTE_PCR2=PORT_PCR_MUX(4)|PORT_PCR_DSE_MASK;//CLK
     PORTE_PCR3=PORT_PCR_MUX(4)|PORT_PCR_PS_MASK|PORT_PCR_PE_MASK|PORT_PCR_DSE_MASK;//CMD
     PORTE_PCR4=PORT_PCR_MUX(4)|PORT_PCR_PS_MASK|PORT_PCR_PE_MASK|PORT_PCR_DSE_MASK;//D3
     PORTE_PCR5=PORT_PCR_MUX(4)|PORT_PCR_PS_MASK|PORT_PCR_PE_MASK|PORT_PCR_DSE_MASK;//D2
     
     //清除中断
     SDHC_IRQSTAT=0XFFFF;
     
     
     SDHC_IRQSTATEN=0X007F00B3;
     SDHC_SYSCTL|=SDHC_SYSCTL_INITA_MASK;
     
     //检查是否插入
     while((SDHC_PRSSTAT&SDHC_PRSSTAT_CINS_MASK)==0)
      {};
     SDHC_IRQSTAT|=SDHC_IRQSTAT_CRM_MASK;
 }

uint8 SDHC_Receive(uint8 *buff,uint32 btr)
 {
     uint32 bytes,i,j;
     uint32 *ptr=(uint32*)buff;
     while(SDHC_PRSSTAT&SDHC_PRSSTAT_DLA_MASK){};
     bytes=btr;
     while(bytes)
      {
          i=bytes>512?512:bytes;
          for(j=(i+3)>>2;j!=0;j--)
           {
               if(SDHC_IRQSTAT&(SDHC_IRQSTAT_DEBE_MASK|SDHC_IRQSTAT_DCE_MASK|SDHC_IRQSTAT_DTOE_MASK))
                {
                    SDHC_IRQSTAT|=SDHC_IRQSTAT_DEBE_MASK|SDHC_IRQSTAT_DCE_MASK|SDHC_IRQSTAT_DTOE_MASK|SDHC_IRQSTAT_BRR_MASK;
                    return 0;
                }
               while(0==(SDHC_PRSSTAT&SDHC_PRSSTAT_BREN_MASK)){};
               *ptr++=SDHC_DATPORT;
           }
          bytes-=i;
      }
     return 1;//success
 }


uint8 SDHC_Send(const uint8 *buff,uint32 btr)
 {
     uint32 bytes,i;
     uint32 *ptr=(uint32 *)buff;
     bytes=btr;
     while(bytes)
      {
          i=bytes>512?512:bytes;
          bytes-=i;
          for(i=(i+3)>>2;i!=0;i--)
           {
               if(SDHC_IRQSTAT&(SDHC_IRQSTAT_DEBE_MASK|SDHC_IRQSTAT_DCE_MASK|SDHC_IRQSTAT_DTOE_MASK))
                {
                    SDHC_IRQSTAT|=SDHC_IRQSTAT_DEBE_MASK|SDHC_IRQSTAT_DCE_MASK|SDHC_IRQSTAT_DTOE_MASK|SDHC_IRQSTAT_BWR_MASK;
                return 0;
                }
              
          while(0==(SDHC_PRSSTAT&SDHC_PRSSTAT_BWEN_MASK)){};
          SDHC_DATPORT=*ptr++;
      }
 }
        return 1;
 }