/*!
 *     COPYRIGHT NOTICE
 *     Copyright (c) 2013,野火科技
 *     All rights reserved.
 *     技术讨论：野火初学论坛 http://www.chuxue123.com
 *
 *     除注明出处外，以下所有内容版权均属野火科技所有，未经允许，不得用于商业用途，
 *     修改内容时必须保留野火科技的版权声明。
 *
 * @file       MK60_wdog.h
 * @brief      看门狗驱动函数
 * @author     野火科技
 * @version    v5.0
 * @date       2013-07-02
 */

#ifndef __MK60_WDOG_H__
#define __MK60_WDOG_H__

/********************************************************************/

typedef enum
{
    WDOG_LPO_32MS   = SIM_COPC_COPT(1) ,                            // 使用 LPO 1KHz 时钟，喂狗时间为32ms
    WDOG_LPO_256MS  = SIM_COPC_COPT(2) ,                            // 使用 LPO 1KHz 时钟，喂狗时间为256ms
    WDOG_LPO_1024MS = SIM_COPC_COPT(3) ,                            // 使用 LPO 1KHz 时钟，喂狗时间为1024ms

    WDOG_BUS_8192T  = SIM_COPC_COPT(1) | SIM_COPC_COPCLKS_MASK,     // 使用 BUS 时钟，喂狗时间为8192T ，T 为bus时钟周期
    WDOG_BUS_65536T = SIM_COPC_COPT(2) | SIM_COPC_COPCLKS_MASK,     // 使用 BUS 时钟，喂狗时间为65536T ，T 为bus时钟周期
    WDOG_BUS_262144T= SIM_COPC_COPT(3) | SIM_COPC_COPCLKS_MASK,     // 使用 BUS 时钟，喂狗时间为262144T ，T 为bus时钟周期
}wdog_cfg_e;



extern void wdog_init(wdog_cfg_e cfg);   //初始化看门狗，设置喂狗时间
extern void wdog_feed(void);           //喂狗


extern void wdog_disable(void);        //禁用看门狗
extern void wdog_enable(void);         //启用看门狗

/********************************************************************/
#endif /* __MK60_WDOG_H__ */
