#include "all.h"

//默认为固定优先级模式,Fixed Priority Mode

DMAMUX_MemMapPtr DMAMUXx_BASE_PTR[2] = {DMAMUX0_BASE_PTR, DMAMUX1_BASE_PTR}; 

//CDNE位.NOTE: This bit must be cleared to write the MAJORELINK or ESG bits.
//DMA_CDNE |= DMA_CDNE_CDNE(DMA_CH1);

//清除中断标志位
//用于中断服务函数的第一句
void DMA_Clear_Int(uint8 CHx)
{
	DMA_INT |= (1<<CHx);
}


void DMA_Init_new(uint8 DMAMUXx, uint8 CHx, uint8 TriggerSource,uint16 majorLoop,uint16 minorLoop,uint8 TrggerSourceMode)
 {
     SIM_SCGC6 |= (SIM_SCGC6_DMAMUX0_MASK + DMAMUXx);	//使能DMA通道多路复用器时钟
     SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;	
     DMA_ERQ&=~(1<<CHx);
     DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) &= ~DMAMUX_CHCFG_SOURCE_MASK;
     DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx)|=0x80;
     DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) |= ( TrggerSourceMode | TriggerSource);	
     HWREG(0X40008000+(0x1006)+CHx*32)=0;
     HWREG(0X40008000+(DMA_TCD_CSR_OFF)+CHx*32)=0;
     DMA_CITER_ELINKNO(CHx) &= ~DMA_CITER_ELINKNO_CITER_MASK;
     DMA_BITER_ELINKNO(CHx) &= ~DMA_BITER_ELINKNO_BITER_MASK;
     DMA_CITER_ELINKNO(CHx) |= DMA_CITER_ELINKNO_CITER(majorLoop);
     DMA_BITER_ELINKNO(CHx) |= DMA_BITER_ELINKNO_BITER(majorLoop); 
     	DMA_NBYTES_MLNO(CHx) &= ~DMA_NBYTES_MLNO_NBYTES_MASK;
    HWREG(0X40008000+(DMA_TCD_CSR_OFF)+CHx*32)|=0X08;
	DMA_NBYTES_MLNO(CHx) = DMA_NBYTES_MLNO_NBYTES(minorLoop);	
 }

void DMA_Source_new(uint8 CHx, uint32 Src_Addr,int32 Src_AddrOffset, uint32 Src_DataSize, int32 Adjust_Src_Addr)
 {
     DMA_SADDR(CHx) = Src_Addr ;
     DMA_SOFF(CHx) = Src_AddrOffset;
     HWREG(0X40008000+(0x1006)+CHx*32)&= ~DMA_ATTR_SSIZE_MASK;
     HWREG(0X40008000+(0x1006)+CHx*32)|= DMA_ATTR_SSIZE(Src_DataSize);
     DMA_SLAST(CHx) = Adjust_Src_Addr;
 }

void DMA_Destination_new(uint8 CHx, uint32 Dest_Addr,int32 Dest_Addr_Offset, uint32 Dest_DataSize, int32 Adjust_Dest_Addr)
 {
     DMA_DADDR(CHx) = Dest_Addr ;
     DMA_DOFF(CHx) = Dest_Addr_Offset;
     HWREG(0X40008000+(0x1006)+CHx*32)&= ~DMA_ATTR_DSIZE_MASK;
     HWREG(0X40008000+(0x1006)+CHx*32)|= DMA_ATTR_DSIZE(Dest_DataSize);
     DMA_DLAST_SGA(CHx) = Adjust_Dest_Addr;
}

void DMA_Enable_new(uint8 DMAMUXx,uint8 CHx)
 {
     //DMA_ERQ|=1<<CHx;
     DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx)|=0x80;
     DMA_SERQ|=CHx;
 }
void DMA_Disable_new(uint8 DMAMUXx,uint8 CHx)
 {
     DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx)&=~(0x80);
     DMA_ERQ&=~(1<<CHx);
 }
void DMA_SetDestAddress(uint8 CHx,uint32 address)
 {
     DMA_DADDR(CHx) = address ;
 }
void DMA_SetSourceAddress(uint8 CHx,uint32 address)
{
    DMA_SADDR(CHx) = address ;
}









/****************** DMA初始化 ******************************/
/* 简介:	选择触发源,选择通道(根据触发源),选择模式
 * 例程:	DMA_Init(DMAMUX0, DMA_CH0, Src_PORTA, DMA_Normal_Mode)
 * 参数:	DMAMUXx:DMAMUX0,DMAMUX1
 * 		CHx:	选择通道0~31,DMA_CH0~DMA_CH31
 * 		Source:	放在.h文件
 * 		Mode:	Normal_Mode,Periodic_Mode
 */
void DMA_Init(uint8 DMAMUXx, uint8 CHx, uint32 Source,uint8 Mode)
{
	SIM_SCGC6 |= (SIM_SCGC6_DMAMUX0_MASK + DMAMUXx);	//使能DMA通道多路复用器时钟
	SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;		
	DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) &= ~DMAMUX_CHCFG_SOURCE_MASK;
	DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) |= (DMAMUX_CHCFG_ENBL_MASK | Mode | Source);
}


/* 简介:	源地址的相关配置
 * 例程:	DMA_Source(DMA_CH1, (uint32)b, 2, DMA_16BIT, -4);
 * 参数:	CHx:				选择通道0~31,DMA_CH0~DMA_CH31
 * 		Src_Addr:			源数据的地址
 * 		Src_Addr_Offset:	*有符号*的源地址偏移
 * 							配置源数据地址偏移，即每执行完一次Src_DataSize的传输就对源数据地址进行偏移Src_Addr_Offset个字节
 * 		Src_DataSize:		源数据类型的字节长度,8BIT,16BIT,32BIT,16BYTE
 * 		Src_Reset_Addr:		*有符号*源地址最终偏移
 * 							主的计数次数（major iteration count）达到后，重新调整源地址,原来的源数据地址的偏移
 */
void DMA_Source(uint8 CHx, uint32 Src_Addr,int32 Src_AddrOffset, uint32 Src_DataSize, int32 Reset_Src_Addr)
{
	DMA_SADDR(CHx) = Src_Addr ;
	DMA_SOFF(CHx) = Src_AddrOffset;
	//DMA_ATTR = 0;				//先清零数据长度寄存器
	DMA_ATTR(CHx) &= ~DMA_ATTR_SSIZE_MASK;
	DMA_ATTR(CHx) |= DMA_ATTR_SSIZE(Src_DataSize);
	DMA_SLAST(CHx) = Reset_Src_Addr;
}

/* 简介:	目的地址的相关配置
 * 例程:	DMA_Destination(DMA_CH1, (uint32)&f, 4, DMA_16BIT, -4);
 * 参数:	CHx:				选择通道0~15
 * 		Dest_Addr:			目的数据的地址
 * 		Dest_Addr_Offset:	*有符号*的目的地址偏移
 * 							配置目的数据地址偏移，即执行完目的地址的操作后设置目的地址的偏移量
 * 		Dest_DataSize:		目的数据的长度,8BIT,16BIT,32BIT,16BYTE
 * 		Reset_Dest_Addr:	*有符号*目的地址最终偏移
 * 							主的计数次数（major iteration count）达到后，重新调整目的地址,原来的目的地址的偏置
 */
void DMA_Destination(uint8 CHx, uint32 Dest_Addr,int32 Dest_Addr_Offset, uint32 Dest_DataSize, int32 Reset_Dest_Addr)
{
	DMA_DADDR(CHx) = Dest_Addr ;
	DMA_DOFF(CHx) = Dest_Addr_Offset;
	DMA_ATTR(CHx) &= ~DMA_ATTR_DSIZE_MASK;
	DMA_ATTR(CHx) |= DMA_ATTR_DSIZE(Dest_DataSize);
	DMA_DLAST_SGA(CHx) = Reset_Dest_Addr;
}

//简介:使能相应通道的中断,并设置中断类型
//设置中断类型,主循环计数器减到零时进入中断,还是主循环计数器减到一半时进入中断
//参数:Type:	DMA_MAJOR,DMA_HALF
void DMA_Int_Enable(uint8 CHx, uint32 Int_Type)
{
	DMA_INT |= (1<<CHx);	//使能相应通道的中断
	DMA_CSR(CHx) |= Int_Type;
	Enable_IRQ((CHx+16)%16+16);
}
void DMA_Int_Disable(uint8 CHx)
{
	DMA_INT &= ~(1<<CHx);
}

//当主循环计数器减到零时自动关闭DMA的硬件请求,如果调用这条语句会使DMA一直执行
void DMA_AutoClose_Enable(uint8 CHx)
{
	DMA_CSR(CHx) |= DMA_CSR_DREQ_MASK;
}

//一直执行DMA传输
void DMA_AutoClose_Disable(uint8 CHx)
{
	DMA_CSR(CHx) &= ~DMA_CSR_DREQ_MASK;
}

//设置主循环的循环次数,即传输Cycles个次计数器的字节数
void DMA_Major_Loop_Num(uint8 CHx, uint16 Cycles)
{
	DMA_CITER_ELINKNO(CHx) &= ~DMA_CITER_ELINKNO_CITER_MASK;
	DMA_CITER_ELINKNO(CHx) |= DMA_CITER_ELINKNO_CITER(Cycles);
	DMA_BITER_ELINKNO(CHx) &= ~DMA_BITER_ELINKNO_BITER_MASK;
	DMA_BITER_ELINKNO(CHx) |= DMA_BITER_ELINKNO_BITER(Cycles);    
	//DMA_BITER_ELINKYES(CHx) |= DMA_BITER_ELINKYES_BITER(Cycles); 
	//DMA_CITER_ELINKYES(CHx) |= DMA_CITER_ELINKYES_CITER(Cycles);
}

//设置次计数,即每一次传输数据字节的个数
//当个数达到源地址配置的8BIT/16BIT/32BIT/16BYTE时,DMA便将数据存在缓冲区
//当个数达到目的地址配置的8BIT/16BIT/32BIT/16BYTE时,DMA便开始把缓冲区的数据传输到目的地址
//直到传输完Bytes个字节
void DMA_Minor_Bytes(uint8 CHx, uint16 Bytes)
{
	DMA_NBYTES_MLNO(CHx) &= ~DMA_NBYTES_MLNO_NBYTES_MASK;
	DMA_NBYTES_MLNO(CHx) = DMA_NBYTES_MLNO_NBYTES(Bytes);	
	//DMA_NBYTES_MLOFFNO(CHx)  |= DMA_NBYTES_MLOFFNO_NBYTES(Bytes);    
	//DMA_NBYTES_MLOFFYES(CHx) |= DMA_NBYTES_MLOFFYES_NBYTES(Bytes); 
}

//软件启动(触发)传输
//其实如果是Src_ALWAYS_*(DMA常使能请求源)不调用这句也会触发的
void DMA_Software_Initiate (uint8 CHx)
{
	DMA_SSRT &= ~DMA_SSRT_SSRT_MASK;
	DMA_SSRT |= DMA_SSRT_SSRT(CHx);
}

//使能通道,若不使能,则只执行一次副循环,有例程,例程很直观
//默认情况下是禁能的,所以一般要调用
void DMA_Channal_Enable(uint8 CHx)
{
	DMA_ERQ|=1<<CHx;
}
void DMA_Channal_Disable(uint8 CHx)
{
	DMA_ERQ&=~(1<<CHx);
}

//重新开始DMA模块,默认情况下,是使能的
//前面用了DMA_Disable(),才需要用到这条语句,重新打开DMA模块
//当DMA_Disable()被用在配置的第一句时时可以用在配置的最后一句(除了软件触发,就是DMA_Software_Initiate(DMA_CH1)这句)
void DMA_Enable()
{
	//这种模式下，DMA复用器的配置过程中，主要是用来。
	//在DMA具有独立的通道使能/禁止，而应该用来禁用或重新配置DMA通道。
	//DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) |= DMAMUX_CHCFG_ENBL_MASK;
	DMA_CR &= ~DMA_CR_HALT_MASK;
}

//关闭DMA模块
//可以用在配置的第一句
void DMA_Disable()
{
	//DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) &= ~DMAMUX_CHCFG_ENBL_MASK;
	DMA_CR |= DMA_CR_HALT_MASK;
}

//在调试模式下,DMA禁止新通道的开始,正在执行的通道可以完成.
//当调用DMA_Debug_Disable(DMA_CH0)时, Channel execution resumes
void DMA_Debug_Enable(uint8 CHx)
{
	DMA_CSR(CHx) &= ~DMA_CSR_ACTIVE_MASK;//用CR寄存器一定要调用这条语句
	DMA_CR |= DMA_CR_EDBG_MASK;
}

//在调试模式下,DMA不停止,在执行
void DMA_Debug_Disable(uint8 CHx)
{
	DMA_CSR(CHx) &= ~DMA_CSR_ACTIVE_MASK;//用CR寄存器一定要调用这条语句
	DMA_CR &= ~DMA_CR_EDBG_MASK;
}

/* In group fixed priority arbitration mode
 * 只有两组(DMAMUX0,DMAMUX1),却可以设置4个优先级,怪怪的.
 * 0 is the lowest priority, 1is the next higher priority, then 2, 3
 * 参数:	Group0_Priority:	0~3	//这两个参数不能相同
 * 		Group1_Priority:	0~3
 */
void DMA_Set_Group_Priority(uint8 CHx, uint8 Group0_Priority, uint8 Group1_Priority)
{
	DMA_CSR(CHx) &= ~DMA_CSR_ACTIVE_MASK;//用CR寄存器一定要调用这条语句
	DMA_CR |= DMA_CR_GRP0PRI(Group0_Priority);
	DMA_CR |= DMA_CR_GRP1PRI(Group1_Priority);
}

//Priority:	0~15 CHx:0~31,,前提:为fixed-priority固定优先级模式,CR[ERCA] = 0
//数值越大,优先级越高
//注意:通道之间的优先级不能一样,否则出错
void DMA_Set_Channel_Priority(uint8 CHx, uint8 Priority)
{
	switch(CHx % 4)
	{
		case 0:HWREG(DMA_DCHPRIn_BASE + CHx/4 + 3) |= (Priority & 0xFu);break;
		case 1:HWREG(DMA_DCHPRIn_BASE + CHx/4 + 2) |= (Priority & 0xFu);break;
		case 2:HWREG(DMA_DCHPRIn_BASE + CHx/4 + 1) |= (Priority & 0xFu);break;
		case 3:HWREG(DMA_DCHPRIn_BASE + CHx/4 + 0) |= (Priority & 0xFu);break;
	}
}

//0~31,注意返回值类型为uint8,前提:为fixed-priority固定优先级模式,CR[ERCA] = 0
//数值越大,优先级越高
uint8 DMA_Get_Channel_Priority(uint8 CHx)
{
	uint32 temp;
	switch(CHx % 4)
	{
	case 0:temp = (DMA_DCHPRIn_BASE + CHx/4 + 3);break;
	case 1:temp = (DMA_DCHPRIn_BASE + CHx/4 + 2);break;
	case 2:temp = (DMA_DCHPRIn_BASE + CHx/4 + 1);break;
	case 3:temp = (DMA_DCHPRIn_BASE + CHx/4 + 0);break;
	}
	return (HWREG(temp) & 0xFu);
}
//0~31,注意返回值类型为uint8,前提:为fixed-priority固定优先级模式,CR[ERCA] = 0
//数值越大,优先级越高
uint8 DMA_Get_Group_Priority(uint8 CHx)
{
	uint32 temp;
	switch(CHx % 4)
	{
	case 0:temp = (DMA_DCHPRIn_BASE + CHx/4 + 3);break;
	case 1:temp = (DMA_DCHPRIn_BASE + CHx/4 + 2);break;
	case 2:temp = (DMA_DCHPRIn_BASE + CHx/4 + 1);break;
	case 3:temp = (DMA_DCHPRIn_BASE + CHx/4 + 0);break;
	}
	return (HWREG(temp) & 0x30u);
}
