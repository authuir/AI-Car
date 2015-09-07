/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,Ұ��Ƽ�
 *     All rights reserved.
 *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
 *
 *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
 *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
 *
 * @file       MK60_dma.c
 * @brief      DMA������
 * @author     Ұ��Ƽ�
 * @version    v5.0
 * @date       2013-09-01
 */


#include "common.h"
#include "MKL_port.h"
#include "MKL_gpio.h"
#include "MKL_dma.h"


/*!
 *  @brief      DMA��ʼ������ȡ�˿����ݵ��ڴ�
 *  @param      DMA_CHn         ͨ���ţ�DMA_CH0 ~ DMA_CH15��
 *  @param      SADDR           Դ��ַ( (void * )&PTx_Bn_IN �� (void * )&PTx_Wn_IN   )
 *  @param      DADDR           Ŀ�ĵ�ַ
 *  @param      PTxn            �����˿�
 *  @param      DMA_BYTEn       ÿ��DMA�����ֽ���
 *  @param      count           һ����ѭ�������ֽ���
 *  @param      cfg             DMA�������ã���DMA_cfg��ѡ��
 *  @since      v5.0
 *  @note       DMA PTXn����ԴĬ�������ش������䣬�����޸ģ����ʼ������� port_init ����DMA ������ʽ
                ��ʼ������Ҫ���� DMA_EN ��ʵ��
 *  Sample usage:   uint8 buff[10];
                    dma_portx2buff_init(DMA_CH0, PTB_B0_IN, buff, PTA7, DMA_BYTE1, 10, DADDR_RECOVER);
                    //DMA��ʼ����Դ��ַ��PTB_B0_IN��Ŀ�ĵ�ַ��buff,PTA7����(Ĭ��������)��ÿ�δ���1�ֽڣ������� 10�� �����������ָ���ַ

                    port_init(PTA7,ALT1 | DMA_FALLING);             //Ĭ�ϴ���Դ�������أ��˴���Ϊ �½��ش���

                    DMA_EN(DMA_CH0);                //��Ҫʹ�� DMA ����ܴ�������
 */
void dma_portx2buff_init(DMA_CHn CHn, void * SADDR, void *DADDR, PTXn_e ptxn, DMA_BYTEn byten, uint32 count)
{
    uint8 n, tmp;
    uint8 BYTEs = (byten == DMA_BYTE1 ? 1 : (byten == DMA_BYTE2 ? 2 : (byten == DMA_BYTE4 ? 4 : 0 ) ) ); //���㴫���ֽ���
    uint8 ptx0;

    //���ԣ���⴫�ݽ��������Ƿ���ȷ
#if  1
    ASSERT(                                             //�ö��Լ�� Դ��ַ��ÿ�δ����ֽ����Ƿ���ȷ
        (   (byten == DMA_BYTE1)                    //����һ���ֽ�
            && ( (SADDR >= &PTA_B0_IN) && (SADDR <= ( &PTE_B3_IN )))
        )

        || (   (byten == DMA_BYTE2)                   //���������ֽ�(ע�⣬���ܿ�˿�)
               && ( (SADDR >= &PTA_B0_IN)
                    && (SADDR <= ( &PTE_W1_IN ))
                    && (((uint32)SADDR & 0x03) != 0x03) )         //��֤����˿�
           )

        || (   (byten == DMA_BYTE4)                   //�����ĸ��ֽ�
               && ((SADDR >= &PTA_B0_IN) && (SADDR <= ( &PTE_B0_IN )))
               && (((uint32)SADDR & 0x03) == 0x00)           //��֤����˿�
           )
    );
#endif
   ASSERT( count< 0x8000); //���ԣ����ֻ֧��0x7FFF

    //DMA �Ĵ��� ����

    /* ����ʱ�� */
    SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;                        //��DMAģ��ʱ��
#if (defined(MK60DZ10)|| defined(MKL26Z4))
    SIM_SCGC6 |= SIM_SCGC6_DMAMUX_MASK;                     //��DMA��·������ʱ��
#elif defined(MK60F15)
    SIM_SCGC6 |= SIM_SCGC6_DMAMUX0_MASK;                    //��DMA��·������ʱ��
#endif

    DMAMUX0_CHCFG(CHn)=0x00;
    DMA_DSR_BCR(CHn)|=DMA_DSR_BCR_DONE_MASK;

    /* ���� DMA ͨ�� �� ������ƿ� TCD ( Transfer Control Descriptor ) */
    DMA_SAR(CHn) =    (uint32)SADDR;                      // ����  Դ��ַ
    DMA_DAR(CHn) =    (uint32)DADDR;                      // ����Ŀ�ĵ�ַ
    DMA_DCR(CHn) =    (0
                       | DMA_DCR_SSIZE(byten)
                       | DMA_DCR_DSIZE(byten)
                       //| DMA_DCR_SINC_MASK                  //�����Դ��ַ����(����λ��)
                       | DMA_DCR_DINC_MASK                  //�����Ŀ�ĵ�ַ����(����λ��)
                       //| DMA_DCR_START_MASK               //�����������
                       | DMA_DCR_ERQ_MASK                   //Ӳ���������䣨������START��ѡһ��
                      |DMA_DCR_CS_MASK
                           | DMA_DCR_D_REQ_MASK                 //������ɺ�Ӳ���Զ���ERQ

                       );
    DMA_DSR_BCR(CHn) =   (0
                     | DMA_DSR_BCR_BCR(count)              //������Ŀ
                     );


    /* ���� DMA ����Դ */
#if defined(MK60DZ10)
    DMAMUX_CHCFG_REG(DMAMUX_BASE_PTR, CHn) = (0
#elif (defined(MK60F15) || defined(MKL26Z4))
    DMAMUX_CHCFG_REG(DMAMUX0_BASE_PTR, CHn) = (0
#endif                       /* Enable routing of DMA request */
            //| DMAMUX_CHCFG_TRIG_MASK                        /* Trigger Mode: Periodic   PIT���ڴ�������ģʽ   ͨ��1��ӦPIT1������ʹ��PIT1����������Ӧ��PIT��ʱ���� */
            | DMAMUX_CHCFG_SOURCE( PTX(ptxn) + DMA_PORTA) /* ͨ����������Դ:     */
                                             );
    //���ô���Դ��Ĭ���� �����ش�����
   // port_init(ptxn, ALT1 | DMA_RISING);

    /*  ��������Դ   */
    //SADDR ʵ���Ͼ��� GPIO�� ����Ĵ��� PDIR �ĵ�ַ
    //GPIOA��GPIOB��GPIOC��GPIOD��GPIOE �ĵ�ַ �ֱ��� 0x400FF000u ��0x400FF040u ��0x400FF080u�� 0x400FF0C0u��0x400FF100u
    //sizeof(GPIO_MemMap) = 0x18
    //ÿ��GPIO��ַ &0x1C0 �󣬵õ� 0x000 , 0x040 , 0x080 ,0x0C0 ,0x100
    //�� /0x40 ��õ� 0 �� 1 �� 2�� 3��4 ���պþ��� PTA��PTB��PTC ��PTD ��PTD ��PTE
   // ptx0 = ((((uint32)SADDR) & 0x1C0) / 0x40 ) * 32;

    //ÿ��GPIO ��Ӧ�ļĴ�����ַ�� &0x 3F ��õ���ֵ������ͬ�ġ�
    //PTA_B0_IN �� GPIOA �� ����Ĵ��� PDIR �� ��ַ
    // (SADDR & 0x3f - PTA_B0_IN & 0x3f) ��Ч�� (SADDR - PTA_B0_IN) & 0x3f
    //������Ҫ�ɼ���λ Ϊ 0~7��8~15��16~23��24~31 ���� ����ʽ�Ӷ�Ӧ��ֵ Ϊ 0��1��2��3
    //�պ���  0~7��8~15��16~23��24~31 λ�ĵ�ַƫ�ƣ��� * 8 �ͱ�� 0��8��16��24

    /*n = (uint8)(((uint32)SADDR - ((uint32)(&PTA_B0_IN))) & 0x3f) * 8;       //��С�����ź�

    ptx0 += n;
    tmp = ptx0 + (BYTEs * 8 ) - 1;                                          //�������ź�
    while(ptx0 <= tmp)
    {
        //������� GPIO ��ʼ��Ϊ����
        gpio_init((PTXn_e )ptx0, GPI, 0);               //����Ϊ����
        port_init((PTXn_e )ptx0 , ALT1 | PULLDOWN );    //����ԴӦ��������Ĭ�϶�ȡ������0
        ptx0 ++;
    }
*/
    DMA_DIS(CHn);                                    //ʹ��ͨ��CHn Ӳ������
    //DMA_IRQ_CLEAN(CHn);
    /* �����ж� */
    //DMA_EN(CHn);                                    //ʹ��ͨ��CHn Ӳ������
    //DMA_IRQ_EN(CHn);                                //����DMAͨ������
}
