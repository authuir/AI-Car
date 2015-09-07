 /*!
  *     COPYRIGHT NOTICE
  *     Copyright (c) 2013,野火科技
  *     All rights reserved.
  *     技术讨论：野火初学论坛 http://www.chuxue123.com
  *
  *     除注明出处外，以下所有内容版权均属野火科技所有，未经允许，不得用于商业用途，
  *     修改内容时必须保留野火科技的版权声明。
  *
  * @file       startup_MKL.s
  * @brief      系统启动复位函数
  * @author     野火科技
  * @version    v5.0
  * @date       2013-11-19
  */



    SECTION .noinit : CODE          ; //指定代码段：.noinit
 
    EXPORT  Reset_Handler           ; //定义 Reset_Handler 函数
Reset_Handler
    CPSIE   i                       ; //使能全部中断
                  ; //调用 C语言函数 start
   import start                    ; //声明函数
    BL      start
__done
    B       __done

        END
