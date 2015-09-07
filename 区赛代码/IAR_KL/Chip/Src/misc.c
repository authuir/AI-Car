/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,野火科技
 *     All rights reserved.
 *     技术讨论：野火初学论坛 http://www.chuxue123.com
 *
 *     除注明出处外，以下所有内容版权均属野火科技所有，未经允许，不得用于商业用途，
 *     修改内容时必须保留野火科技的版权声明。
 *
 * @file       misc.c
 * @brief      野火KL26 平台其他需要用到的函数的实现
 * @author     野火科技
 * @version    v5.0
 * @date       2013-06-26
 */

#include "common.h"
#include "MKL_uart.h"


/*!
 *  @brief      设置中断向量表地址
 *  @param      vtor    新的中断向量表地址
 *  @since      v5.0
 *  @author     飞思卡尔公司
 *  Sample usage:       write_vtor ((uint32)__VECTOR_RAM);  //新的中断向量地址
 */
void write_vtor (int vtor)
{
    ASSERT(vtor % 0x200 == 0);   //Vector Table base offset field. This value must be a multiple of 0x200.

    /* Write the VTOR with the new value */
    SCB_VTOR = vtor;
}
void SET_IRQ_PRIOR(int IRQ_NUM,uint8 IRQ_PRIOR)
 {
	 IRQ_NUM = IRQ_NUM-16;
     uint32 *prio_reg;//设定IRQ优先级指针
     if(IRQ_NUM>31 || IRQ_NUM <0) return ;//确定IRQ号是否有效
     if(IRQ_PRIOR>3) IRQ_PRIOR=3;//确定优先级是否在范围内，共16个优先级
     prio_reg=(uint32 *) ( 0xE000E400+4 * ( IRQ_NUM/4) );//设置IRQ对应的NVICX
     *prio_reg=( ((IRQ_PRIOR&0X0F)<<6) <<(8*(IRQ_NUM%4)) );
 }


/*!
 *  @brief      设置中断向量表里的中断复位函数
 *  @since      v5.0
 *  @warning    只有中断向量表位于icf指定的RAM区域时，此函数才有效
 *  Sample usage:       set_vector_handler(UART3_RX_TX_VECTORn , uart3_handler);    //把 uart3_handler 函数添加到中断向量表
 */
void set_vector_handler(VECTORn_t vector , void pfunc_handler(void))
{
    extern uint32 __VECTOR_RAM[];

    ASSERT(SCB_VTOR == (uint32)__VECTOR_RAM);  //断言，检测中断向量表是否在 RAM 里

    __VECTOR_RAM[vector] = (uint32)pfunc_handler;
}

void fire_cpy( uint8 *dst, uint8 *src, uint32 count)
{
    uint32 n;
    if(count != 0)
    {
        //printf("-");

        n = (count + 7 ) / 8 ;
        switch (count % 8 )
        {
            do
            {
            case 0 :
                * dst ++ = * src ++ ;
            case 7 :
                * dst ++ = * src ++ ;
            case 6 :
                * dst ++ = * src ++ ;
            case 5 :
                * dst ++ = * src ++ ;
            case 4 :
                * dst ++ = * src ++ ;
            case 3 :
                * dst ++ = * src ++ ;
            case 2 :
                * dst ++ = * src ++ ;
            case 1 :
                * dst ++ = * src ++ ;
            }
            while ( -- n >    0 );
        }
    }
}

