#include "all.h"

//Ĭ��Ϊ�̶����ȼ�ģʽ,Fixed Priority Mode

DMAMUX_MemMapPtr DMAMUXx_BASE_PTR[2] = {DMAMUX0_BASE_PTR, DMAMUX1_BASE_PTR}; 

//CDNEλ.NOTE: This bit must be cleared to write the MAJORELINK or ESG bits.
//DMA_CDNE |= DMA_CDNE_CDNE(DMA_CH1);

//����жϱ�־λ
//�����жϷ������ĵ�һ��
void DMA_Clear_Int(uint8 CHx)
{
	DMA_INT |= (1<<CHx);
}


void DMA_Init_new(uint8 DMAMUXx, uint8 CHx, uint8 TriggerSource,uint16 majorLoop,uint16 minorLoop,uint8 TrggerSourceMode)
 {
     SIM_SCGC6 |= (SIM_SCGC6_DMAMUX0_MASK + DMAMUXx);	//ʹ��DMAͨ����·������ʱ��
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









/****************** DMA��ʼ�� ******************************/
/* ���:	ѡ�񴥷�Դ,ѡ��ͨ��(���ݴ���Դ),ѡ��ģʽ
 * ����:	DMA_Init(DMAMUX0, DMA_CH0, Src_PORTA, DMA_Normal_Mode)
 * ����:	DMAMUXx:DMAMUX0,DMAMUX1
 * 		CHx:	ѡ��ͨ��0~31,DMA_CH0~DMA_CH31
 * 		Source:	����.h�ļ�
 * 		Mode:	Normal_Mode,Periodic_Mode
 */
void DMA_Init(uint8 DMAMUXx, uint8 CHx, uint32 Source,uint8 Mode)
{
	SIM_SCGC6 |= (SIM_SCGC6_DMAMUX0_MASK + DMAMUXx);	//ʹ��DMAͨ����·������ʱ��
	SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;		
	DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) &= ~DMAMUX_CHCFG_SOURCE_MASK;
	DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) |= (DMAMUX_CHCFG_ENBL_MASK | Mode | Source);
}


/* ���:	Դ��ַ���������
 * ����:	DMA_Source(DMA_CH1, (uint32)b, 2, DMA_16BIT, -4);
 * ����:	CHx:				ѡ��ͨ��0~31,DMA_CH0~DMA_CH31
 * 		Src_Addr:			Դ���ݵĵ�ַ
 * 		Src_Addr_Offset:	*�з���*��Դ��ַƫ��
 * 							����Դ���ݵ�ַƫ�ƣ���ÿִ����һ��Src_DataSize�Ĵ���Ͷ�Դ���ݵ�ַ����ƫ��Src_Addr_Offset���ֽ�
 * 		Src_DataSize:		Դ�������͵��ֽڳ���,8BIT,16BIT,32BIT,16BYTE
 * 		Src_Reset_Addr:		*�з���*Դ��ַ����ƫ��
 * 							���ļ���������major iteration count���ﵽ�����µ���Դ��ַ,ԭ����Դ���ݵ�ַ��ƫ��
 */
void DMA_Source(uint8 CHx, uint32 Src_Addr,int32 Src_AddrOffset, uint32 Src_DataSize, int32 Reset_Src_Addr)
{
	DMA_SADDR(CHx) = Src_Addr ;
	DMA_SOFF(CHx) = Src_AddrOffset;
	//DMA_ATTR = 0;				//���������ݳ��ȼĴ���
	DMA_ATTR(CHx) &= ~DMA_ATTR_SSIZE_MASK;
	DMA_ATTR(CHx) |= DMA_ATTR_SSIZE(Src_DataSize);
	DMA_SLAST(CHx) = Reset_Src_Addr;
}

/* ���:	Ŀ�ĵ�ַ���������
 * ����:	DMA_Destination(DMA_CH1, (uint32)&f, 4, DMA_16BIT, -4);
 * ����:	CHx:				ѡ��ͨ��0~15
 * 		Dest_Addr:			Ŀ�����ݵĵ�ַ
 * 		Dest_Addr_Offset:	*�з���*��Ŀ�ĵ�ַƫ��
 * 							����Ŀ�����ݵ�ַƫ�ƣ���ִ����Ŀ�ĵ�ַ�Ĳ���������Ŀ�ĵ�ַ��ƫ����
 * 		Dest_DataSize:		Ŀ�����ݵĳ���,8BIT,16BIT,32BIT,16BYTE
 * 		Reset_Dest_Addr:	*�з���*Ŀ�ĵ�ַ����ƫ��
 * 							���ļ���������major iteration count���ﵽ�����µ���Ŀ�ĵ�ַ,ԭ����Ŀ�ĵ�ַ��ƫ��
 */
void DMA_Destination(uint8 CHx, uint32 Dest_Addr,int32 Dest_Addr_Offset, uint32 Dest_DataSize, int32 Reset_Dest_Addr)
{
	DMA_DADDR(CHx) = Dest_Addr ;
	DMA_DOFF(CHx) = Dest_Addr_Offset;
	DMA_ATTR(CHx) &= ~DMA_ATTR_DSIZE_MASK;
	DMA_ATTR(CHx) |= DMA_ATTR_DSIZE(Dest_DataSize);
	DMA_DLAST_SGA(CHx) = Reset_Dest_Addr;
}

//���:ʹ����Ӧͨ�����ж�,�������ж�����
//�����ж�����,��ѭ��������������ʱ�����ж�,������ѭ������������һ��ʱ�����ж�
//����:Type:	DMA_MAJOR,DMA_HALF
void DMA_Int_Enable(uint8 CHx, uint32 Int_Type)
{
	DMA_INT |= (1<<CHx);	//ʹ����Ӧͨ�����ж�
	DMA_CSR(CHx) |= Int_Type;
	Enable_IRQ((CHx+16)%16+16);
}
void DMA_Int_Disable(uint8 CHx)
{
	DMA_INT &= ~(1<<CHx);
}

//����ѭ��������������ʱ�Զ��ر�DMA��Ӳ������,���������������ʹDMAһֱִ��
void DMA_AutoClose_Enable(uint8 CHx)
{
	DMA_CSR(CHx) |= DMA_CSR_DREQ_MASK;
}

//һֱִ��DMA����
void DMA_AutoClose_Disable(uint8 CHx)
{
	DMA_CSR(CHx) &= ~DMA_CSR_DREQ_MASK;
}

//������ѭ����ѭ������,������Cycles���μ��������ֽ���
void DMA_Major_Loop_Num(uint8 CHx, uint16 Cycles)
{
	DMA_CITER_ELINKNO(CHx) &= ~DMA_CITER_ELINKNO_CITER_MASK;
	DMA_CITER_ELINKNO(CHx) |= DMA_CITER_ELINKNO_CITER(Cycles);
	DMA_BITER_ELINKNO(CHx) &= ~DMA_BITER_ELINKNO_BITER_MASK;
	DMA_BITER_ELINKNO(CHx) |= DMA_BITER_ELINKNO_BITER(Cycles);    
	//DMA_BITER_ELINKYES(CHx) |= DMA_BITER_ELINKYES_BITER(Cycles); 
	//DMA_CITER_ELINKYES(CHx) |= DMA_CITER_ELINKYES_CITER(Cycles);
}

//���ôμ���,��ÿһ�δ��������ֽڵĸ���
//�������ﵽԴ��ַ���õ�8BIT/16BIT/32BIT/16BYTEʱ,DMA�㽫���ݴ��ڻ�����
//�������ﵽĿ�ĵ�ַ���õ�8BIT/16BIT/32BIT/16BYTEʱ,DMA�㿪ʼ�ѻ����������ݴ��䵽Ŀ�ĵ�ַ
//ֱ��������Bytes���ֽ�
void DMA_Minor_Bytes(uint8 CHx, uint16 Bytes)
{
	DMA_NBYTES_MLNO(CHx) &= ~DMA_NBYTES_MLNO_NBYTES_MASK;
	DMA_NBYTES_MLNO(CHx) = DMA_NBYTES_MLNO_NBYTES(Bytes);	
	//DMA_NBYTES_MLOFFNO(CHx)  |= DMA_NBYTES_MLOFFNO_NBYTES(Bytes);    
	//DMA_NBYTES_MLOFFYES(CHx) |= DMA_NBYTES_MLOFFYES_NBYTES(Bytes); 
}

//�������(����)����
//��ʵ�����Src_ALWAYS_*(DMA��ʹ������Դ)���������Ҳ�ᴥ����
void DMA_Software_Initiate (uint8 CHx)
{
	DMA_SSRT &= ~DMA_SSRT_SSRT_MASK;
	DMA_SSRT |= DMA_SSRT_SSRT(CHx);
}

//ʹ��ͨ��,����ʹ��,��ִֻ��һ�θ�ѭ��,������,���̺�ֱ��
//Ĭ��������ǽ��ܵ�,����һ��Ҫ����
void DMA_Channal_Enable(uint8 CHx)
{
	DMA_ERQ|=1<<CHx;
}
void DMA_Channal_Disable(uint8 CHx)
{
	DMA_ERQ&=~(1<<CHx);
}

//���¿�ʼDMAģ��,Ĭ�������,��ʹ�ܵ�
//ǰ������DMA_Disable(),����Ҫ�õ��������,���´�DMAģ��
//��DMA_Disable()���������õĵ�һ��ʱʱ�����������õ����һ��(�����������,����DMA_Software_Initiate(DMA_CH1)���)
void DMA_Enable()
{
	//����ģʽ�£�DMA�����������ù����У���Ҫ��������
	//��DMA���ж�����ͨ��ʹ��/��ֹ����Ӧ���������û���������DMAͨ����
	//DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) |= DMAMUX_CHCFG_ENBL_MASK;
	DMA_CR &= ~DMA_CR_HALT_MASK;
}

//�ر�DMAģ��
//�����������õĵ�һ��
void DMA_Disable()
{
	//DMAMUX_CHCFG_REG(DMAMUXx_BASE_PTR[DMAMUXx], CHx) &= ~DMAMUX_CHCFG_ENBL_MASK;
	DMA_CR |= DMA_CR_HALT_MASK;
}

//�ڵ���ģʽ��,DMA��ֹ��ͨ���Ŀ�ʼ,����ִ�е�ͨ���������.
//������DMA_Debug_Disable(DMA_CH0)ʱ, Channel execution resumes
void DMA_Debug_Enable(uint8 CHx)
{
	DMA_CSR(CHx) &= ~DMA_CSR_ACTIVE_MASK;//��CR�Ĵ���һ��Ҫ�����������
	DMA_CR |= DMA_CR_EDBG_MASK;
}

//�ڵ���ģʽ��,DMA��ֹͣ,��ִ��
void DMA_Debug_Disable(uint8 CHx)
{
	DMA_CSR(CHx) &= ~DMA_CSR_ACTIVE_MASK;//��CR�Ĵ���һ��Ҫ�����������
	DMA_CR &= ~DMA_CR_EDBG_MASK;
}

/* In group fixed priority arbitration mode
 * ֻ������(DMAMUX0,DMAMUX1),ȴ��������4�����ȼ�,�ֵֹ�.
 * 0 is the lowest priority, 1is the next higher priority, then 2, 3
 * ����:	Group0_Priority:	0~3	//����������������ͬ
 * 		Group1_Priority:	0~3
 */
void DMA_Set_Group_Priority(uint8 CHx, uint8 Group0_Priority, uint8 Group1_Priority)
{
	DMA_CSR(CHx) &= ~DMA_CSR_ACTIVE_MASK;//��CR�Ĵ���һ��Ҫ�����������
	DMA_CR |= DMA_CR_GRP0PRI(Group0_Priority);
	DMA_CR |= DMA_CR_GRP1PRI(Group1_Priority);
}

//Priority:	0~15 CHx:0~31,,ǰ��:Ϊfixed-priority�̶����ȼ�ģʽ,CR[ERCA] = 0
//��ֵԽ��,���ȼ�Խ��
//ע��:ͨ��֮������ȼ�����һ��,�������
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

//0~31,ע�ⷵ��ֵ����Ϊuint8,ǰ��:Ϊfixed-priority�̶����ȼ�ģʽ,CR[ERCA] = 0
//��ֵԽ��,���ȼ�Խ��
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
//0~31,ע�ⷵ��ֵ����Ϊuint8,ǰ��:Ϊfixed-priority�̶����ȼ�ģʽ,CR[ERCA] = 0
//��ֵԽ��,���ȼ�Խ��
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
