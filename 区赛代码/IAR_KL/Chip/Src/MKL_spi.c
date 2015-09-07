/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MK60_spi.c
 * @brief      SPI��������
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-07-16
 */

#include "common.h"
#include "MKL_port.h"
#include "MKL_gpio.h"
#include "MKL_spi.h"


SPI_MemMapPtr SPIN[2] = {SPI0_BASE_PTR, SPI1_BASE_PTR}; //��������ָ�����鱣�� SPIx �ĵ�ַ

static void spi_pcs_io(SPIn_e spin, SPI_PCSn_e pcs,uint8 data)        //IO���� CS ��ƽ�ߵ�
{
    switch(spin)
    {

    case SPI0:
        if(pcs ==SPI_PCS0)
        {
            PTXn_T(SPI0_PCS0_PIN,OUT) = data ;
        }
        break;

    case SPI1:
        if(pcs ==SPI_PCS0)
        {
            PTXn_T(SPI1_PCS0_PIN,OUT) = data ;
        }
        break;
    default:
        break;

    }

}

uint32 spi_set_baud(SPIn_e spin,uint32 baud)
{
    SPI_MemMapPtr spi_ptr = SPIN[spin];
    uint32 clk;
    uint8  spr;
    uint32 fit_baud,fit_sppr=0,fit_spr,min_diff =~0,diff;
    uint32 tmp,tmp_baud;

    if(spin == SPI0)
    {
        clk =  bus_clk_khz*1000;
    }
    else if(spin == SPI1)
    {
        clk =  core_clk_khz*1000;
    }

    //SPI ������ =  SPI ģ��ʱ�� / �� (SPPR + 1) * (2<<(SPR )) ��
    for(spr = 0;spr<=8;spr++)
    {
        tmp = clk/((2<<spr)*baud );
        if(tmp>=8)continue;
        tmp_baud  = clk/((2<<spr)*tmp);
        diff = abs(tmp_baud - baud);
        if(min_diff > diff)
        {
            min_diff = diff;
            fit_spr = spr;
            fit_sppr = tmp -1;
            fit_baud = tmp_baud;
            if(diff == 0)
            {
                //�պ�ƥ��
                goto SPI_CLK_EXIT;
            }
        }

        tmp++;

        tmp = clk/((2<<spr)*baud );
        if(tmp>=8)continue;
        tmp_baud  = clk/((2<<spr)*tmp);
        diff = abs(tmp_baud - baud);

        if(min_diff > diff)
        {
            min_diff = diff;
            fit_spr = spr;
            fit_sppr = tmp -1;
            fit_baud = tmp_baud;
            if(diff == 0)
            {
                //�պ�ƥ��
                goto SPI_CLK_EXIT;
            }

        }
    }

SPI_CLK_EXIT:

    SPI_BR_REG(spi_ptr) = (0
                              | SPI_BR_SPR(fit_spr)
                              | SPI_BR_SPPR(fit_sppr)
                              );


    return fit_baud;

}

/*!
 *  @brief      SPI��ʼ��������ģʽ
 *  @param      SPIn_e          SPIģ��(SPI0��SPI1)
 *  @param      SPIn_PCSn_e     Ƭѡ�ܽű��
 *  @param      SPI_CFG         SPI���ӻ�ģʽѡ��
 *  @since      v5.0
 *  Sample usage:       spi_init(SPI0,SPIn_PCS0, MASTER);              //��ʼ��SPI,ѡ��CS0,����ģʽ
 */
uint32 spi_init(SPIn_e spin, SPI_PCSn_e pcs, SPI_CFG master,uint32 baud)
{
    SPI_MemMapPtr spi_ptr = SPIN[spin];



    //ʹ��SPIģ��ʱ�ӣ�����SPI���Ź���
    if(spin == SPI0)
    {
        SIM_SCGC4 |= SIM_SCGC4_SPI0_MASK;

        //���йܽŸ���
        port_init(SPI0_SCK_PIN , ALT2  );       //ȫ������ ALT2

        if( (SPI0_SOUT_PIN == PTE19) || (SPI0_SOUT_PIN == PTA17) || (SPI0_SOUT_PIN == PTC7)  || (SPI0_SOUT_PIN == PTD3)  )
        {
            port_init(SPI0_SOUT_PIN, ALT5  );
        }
        else
        {
            port_init(SPI0_SOUT_PIN, ALT2  );
        }

        if( (SPI0_SIN_PIN == PTE18 ) || (SPI0_SIN_PIN == PTA16 ) || (SPI0_SIN_PIN == PTC6 ) || (SPI0_SIN_PIN == PTD2 ))
        {
            port_init(SPI0_SIN_PIN , ALT5 | PULLUP   );
        }
        else
        {
            port_init(SPI0_SIN_PIN , ALT2  );
        }

        if(pcs & SPI_PCS0)         //ѡ�� IO �� ���� CS
        {
            gpio_init(SPI0_PCS0_PIN,GPO,1);
            //port_init(SPI0_PCS0_PIN, ALT1  );
        }
    }
    else if(spin == SPI1)
    {
        SIM_SCGC4 |= SIM_SCGC4_SPI1_MASK;

        port_init(SPI1_SCK_PIN , ALT2  );

        if((SPI1_SOUT_PIN == PTB17) || (SPI1_SOUT_PIN == PTE3) || (SPI1_SOUT_PIN == PTD7) )
        {
            port_init(SPI1_SOUT_PIN, ALT5  );
        }
        else
        {
            port_init(SPI1_SOUT_PIN, ALT2  );
        }

        if((SPI1_SIN_PIN == PTE1) || (SPI1_SIN_PIN == PTB16) || (SPI1_SIN_PIN == PTD6))
        {
            port_init(SPI1_SIN_PIN , ALT5  );
        }
        else
        {
            port_init(SPI1_SIN_PIN , ALT2  );
        }

        if(pcs & SPI_PCS0)        //ѡ�� IO �� ���� CS
        {
            gpio_init(SPI1_PCS0_PIN,GPO,1);
            //port_init(SPI1_PCS0_PIN, ALT1  );
        }

    }
    else
    {
        //���ݽ����� spi ģ������ֱ���ж϶���ʧ��
        ASSERT(0);
    }

    //�������ӻ�ģʽ���ù���ģʽ��MCU�ṩ�������Ƶ����1/2��Ƶ�����ӻ�Ƶ����1/4��Ƶ
    if(master == MASTER)
    {
        SPI_C1_REG(spi_ptr) = (0
                          | SPI_C1_SPE_MASK     //ʹ��SPI
                          | SPI_C1_MSTR_MASK    //����ģʽ
                          //| SPI_C1_SSOE_MASK    //ʹ���Զ�Ƭѡ

                          );
        SPI_C2_REG(spi_ptr) =  (0
                                  //| SPI_C2_MODFEN_MASK //����ģʽ���Ϲ���ʹ��
                                   );
        return spi_set_baud(spin,baud);

    }
    else
    {
        SPI_C1_REG(spi_ptr) = (0
                          | SPI_C1_SPE_MASK     //ʹ��SPI
                          //| SPI_C1_MSTR_MASK    //����ģʽ
                          //| SPI_C1_SSOE_MASK    //ʹ���Զ�Ƭѡ

                          );
        SPI_C2_REG(spi_ptr) =  (0
                                  //| SPI_C2_MODFEN_MASK //����ģʽ���Ϲ���ʹ��
                                   );
    }

    return 0;

}

/*!
 *  @brief      SPI���ͽ��պ���
 *  @param      SPIn_e          SPIģ��(SPI0��SPI1)
 *  @param      SPIn_PCSn_e     Ƭѡ�ܽű��
 *  @param      modata          ���͵����ݻ�������ַ(����Ҫ������ NULL)
 *  @param      midata          ��������ʱ���յ������ݵĴ洢��ַ(����Ҫ������ NULL)
 *  @since      v5.0
 *  Sample usage:           spi_mosi(SPI0,SPIn_PCS0,buff,buff,2);    //����buff�����ݣ������յ�buff�����Ϊ2�ֽ�
 */
     
void SPI_Send(SPIn_e spin,uint32 len,uint8 *modata )
{
    uint8 *midata;
    SPI_PCSn_e pcs=SPI_PCS0;
    SPI_MemMapPtr spi_ptr = SPIN[spin];
    uint32 i = 0;

    while((!SPI_S_REG(spi_ptr))&SPI_S_SPTEF_MASK);//�ȴ����ͻ���������

    while((SPI_S_REG(spi_ptr)& SPI_S_SPRF_MASK))    //�����ջ�����Ϊ��
    {
        SPI_DL_REG(spi_ptr);                     //ֱ�Ӷ�ȡ��������ս��ջ�����
    }

    spi_pcs_io(spin, pcs,0);


    /***************** ����len������ *******************/                                                ;
    for(i = 0; i < (len ); i++)
    {
        while((!SPI_S_REG(spi_ptr))&SPI_S_SPTEF_MASK);  //�ȴ����ͻ���������
        SPI_DL_REG(spi_ptr)=modata[i];
        while(!(SPI_S_REG(spi_ptr)& SPI_S_SPRF_MASK));  //�����ջ������ǿ�
        if(midata != NULL)
        {
            //midata[i] = SPI_DL_REG(SPI1_BASE_PTR);            //������յ�������
        }
        else
        {
            SPI_DL_REG(spi_ptr);
        }
    }
    spi_pcs_io(spin, pcs,1);
}
void spi_mosi(SPIn_e spin, SPI_PCSn_e pcs, uint8 *modata, uint8 *midata, uint32 len)
{
    SPI_MemMapPtr spi_ptr = SPIN[spin];
    uint32 i = 0;

    while((!SPI_S_REG(spi_ptr))&SPI_S_SPTEF_MASK);//�ȴ����ͻ���������

    while((SPI_S_REG(spi_ptr)& SPI_S_SPRF_MASK))    //�����ջ�����Ϊ��
    {
        SPI_DL_REG(spi_ptr);                     //ֱ�Ӷ�ȡ��������ս��ջ�����
    }

    spi_pcs_io(spin, pcs,0);


    /***************** ����len������ *******************/                                                ;
    for(i = 0; i < (len ); i++)
    {
        while((!SPI_S_REG(spi_ptr))&SPI_S_SPTEF_MASK);  //�ȴ����ͻ���������
        SPI_DL_REG(spi_ptr)=modata[i];
        while(!(SPI_S_REG(spi_ptr)& SPI_S_SPRF_MASK));  //�����ջ������ǿ�
        if(midata != NULL)
        {
            midata[i] = SPI_DL_REG(spi_ptr);            //������յ�������
        }
        else
        {
            SPI_DL_REG(spi_ptr);
        }
    }
    spi_pcs_io(spin, pcs,1);
}

/*!
 *  @brief      SPI���ͽ��պ���
 *  @param      SPIn_e          SPIģ��(SPI0��SPI1)
 *  @param      SPIn_PCSn_e     Ƭѡ�ܽű��
 *  @param      mocmd           ���͵����������ַ(����Ҫ������ NULL)
 *  @param      micmd           ��������ʱ���յ������ݵĴ洢��ַ(����Ҫ������ NULL)
 *  @param      modata          ���͵����ݻ�������ַ(����Ҫ������ NULL)
 *  @param      midata          ��������ʱ���յ������ݵĴ洢��ַ(����Ҫ������ NULL)
 *  @since      v5.0
 *  Sample usage:           spi_mosi(SPI0,SPIn_PCS0,cmd,NULL,buff,buff,1,2);    //����cmd/buff�����ݣ�������cmd����ʱ�����ݣ�����buff����ʱ�����ݵ�buff����ȷֱ�Ϊ1��2�ֽ�
 */
void spi_mosi_cmd(SPIn_e spin, SPI_PCSn_e pcs, uint8 *mocmd , uint8 *micmd , uint8 *modata , uint8 *midata, uint32 cmdlen , uint32 len)
{
    SPI_MemMapPtr spi_ptr = SPIN[spin];
    uint32 i = 0;

    while((!SPI_S_REG(spi_ptr))&SPI_S_SPTEF_MASK);//�ȴ����ͻ���������

    while((SPI_S_REG(spi_ptr)& SPI_S_SPRF_MASK))    //�����ջ�����Ϊ��
    {
        SPI_DL_REG(spi_ptr);                     //ֱ�Ӷ�ȡ��������ս��ջ�����
    }

    spi_pcs_io(spin, pcs,0);

    /***************** ����len������ *******************/                                                ;
    for(i = 0; i < cmdlen; i++)
    {
        while((!SPI_S_REG(spi_ptr))&SPI_S_SPTEF_MASK);  //�ȴ����ͻ���������
        SPI_DL_REG(spi_ptr)=mocmd[i];
        while(!(SPI_S_REG(spi_ptr)& SPI_S_SPRF_MASK));  //�����ջ������ǿ�
        if(micmd != NULL)
        {
            micmd[i] = SPI_DL_REG(spi_ptr);            //������յ�������
        }
        else
        {
            SPI_DL_REG(spi_ptr);
        }
    }

    /***************** ����len������ *******************/                                                ;
    for(i = 0; i < (len); i++)
    {
        while((!SPI_S_REG(spi_ptr))&SPI_S_SPTEF_MASK);  //�ȴ����ͻ���������
        SPI_DL_REG(spi_ptr)=modata[i];
        while(!(SPI_S_REG(spi_ptr)& SPI_S_SPRF_MASK));  //�����ջ������ǿ�
        if(midata != NULL)
        {
            midata[i] = SPI_DL_REG(spi_ptr);            //������յ�������
        }
        else
        {
            SPI_DL_REG(spi_ptr);
        }
    }

    spi_pcs_io(spin, pcs,1);
}


