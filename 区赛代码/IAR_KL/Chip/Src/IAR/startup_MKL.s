 /*!
  *     COPYRIGHT NOTICE
  *     Copyright (c) 2013,Ұ��Ƽ�
  *     All rights reserved.
  *     �������ۣ�Ұ���ѧ��̳ http://www.chuxue123.com
  *
  *     ��ע�������⣬�����������ݰ�Ȩ����Ұ��Ƽ����У�δ����������������ҵ��;��
  *     �޸�����ʱ���뱣��Ұ��Ƽ��İ�Ȩ������
  *
  * @file       startup_MKL.s
  * @brief      ϵͳ������λ����
  * @author     Ұ��Ƽ�
  * @version    v5.0
  * @date       2013-11-19
  */



    SECTION .noinit : CODE          ; //ָ������Σ�.noinit
 
    EXPORT  Reset_Handler           ; //���� Reset_Handler ����
Reset_Handler
    CPSIE   i                       ; //ʹ��ȫ���ж�
                  ; //���� C���Ժ��� start
   import start                    ; //��������
    BL      start
__done
    B       __done

        END
