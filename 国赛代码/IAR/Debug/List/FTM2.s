///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       05/Jun/2015  14:14:07
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\FTM2.c
//    Command line =  
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\my ku\src\FTM2.c" -lA
//        "C:\Users\love ben\Desktop\IAR_1_2\IAR\Debug\List\" -o "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\Debug\Obj\" --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M4F -e --fpu=VFPv4_sp --dlib_config
//        "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\" -I "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\my ku\" -I "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\my ku\src\" -I "C:\Users\love
//        ben\Desktop\IAR_1_2\IAR\my ku\project\" -On
//    List file    =  C:\Users\love  ben\Desktop\IAR_1_2\IAR\Debug\List\FTM2.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1


        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// C:\Users\love  ben\Desktop\IAR_1_2\IAR\my ku\src\FTM2.c
//    1 #include "all.h"
//    2 #if 0
//    3 void FTM_PWM_Init(uint16 Ftmn_CHx_PTnx, uint32 Freq, float Duty)
//    4  {
//    5      uint16 Ftmn = 4,CHx = 8, PS = 0, mod = 0;
//    6      uint32 FTM_NUM=0;
//    7     double temp = 0;
//    8     switch(Ftmn_CHx_PTnx & 0xF000) //写保护禁止 
//    9     	{
//   10     		case 0x0000:Ftmn = 0;FTM_NUM=FTM0;SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;FTM0_MODE |= FTM_MODE_WPDIS_MASK;break;
//   11     		case 0x1000:Ftmn = 1;FTM_NUM=FTM1;SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;FTM1_MODE |= FTM_MODE_WPDIS_MASK;break;
//   12     		case 0x2000:Ftmn = 2;FTM_NUM=FTM2;SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;FTM2_MODE |= FTM_MODE_WPDIS_MASK;break;
//   13     		case 0x3000:Ftmn = 3;FTM_NUM=FTM3;SIM_SCGC3 |= SIM_SCGC3_FTM3_MASK;FTM3_MODE |= FTM_MODE_WPDIS_MASK;break;
//   14     	}
//   15     	switch(Ftmn_CHx_PTnx & 0x0F00)
//   16     	{
//   17     		case 0x0000:CHx = 0;break;
//   18     		case 0x0100:CHx = 1;break;
//   19     		case 0x0200:CHx = 2;break;
//   20     		case 0x0300:CHx = 3;break;
//   21     		case 0x0400:CHx = 4;break;
//   22     		case 0x0500:CHx = 5;break;
//   23     		case 0x0600:CHx = 6;break;
//   24     		case 0x0700:CHx = 7;break;
//   25     	}	
//   26     	switch(Ftmn_CHx_PTnx & 0x00FF)
//   27     	{
//   28     	case 0 :PORT_Enable(PORTC);PORT_Configuer(PORTC, 1,  4);break;
//   29     	case 1 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 3,  3);break;
//   30     	case 2 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 4,  3);break;
//   31     	case 3 :PORT_Enable(PORTC);PORT_Configuer(PORTC, 2,  4);break;
//   32     	case 4 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 5,  3);break;
//   33     	case 5 :PORT_Enable(PORTC);PORT_Configuer(PORTC, 3,  4);break;
//   34     	case 6 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 6,  3);break;
//   35     	case 7 :PORT_Enable(PORTC);PORT_Configuer(PORTC, 4,  4);break;
//   36     	case 8 :PORT_Enable(PORTA);PORT_Configuer(PORTA, 7,  3);break;
//   37     	case 9 :PORT_Enable(PORTD);PORT_Configuer(PORTD, 4,  4);break;
//   38     	case 10:PORT_Enable(PORTD);PORT_Configuer(PORTD, 5,  4);break;
//   39     	case 11:PORT_Enable(PORTA);PORT_Configuer(PORTA, 0,  3);break;
//   40     	case 12:PORT_Enable(PORTD);PORT_Configuer(PORTD, 6,  4);break;
//   41     	case 13:PORT_Enable(PORTA);PORT_Configuer(PORTA, 1,  3);break;
//   42     	case 14:PORT_Enable(PORTD);PORT_Configuer(PORTD, 7,  4);break;
//   43     	case 15:PORT_Enable(PORTA);PORT_Configuer(PORTA, 2,  3);break;		
//   44     	case 16:PORT_Enable(PORTA);PORT_Configuer(PORTA, 12, 3);break;
//   45     	case 17:PORT_Enable(PORTA);PORT_Configuer(PORTA, 8,  3);break;
//   46     	case 18:PORT_Enable(PORTB);PORT_Configuer(PORTB, 0,  3);break;
//   47     	case 19:PORT_Enable(PORTA);PORT_Configuer(PORTA, 13, 3);break;
//   48     	case 20:PORT_Enable(PORTA);PORT_Configuer(PORTA, 9,  3);break;
//   49     	case 21:PORT_Enable(PORTB);PORT_Configuer(PORTB, 1,  3);break;
//   50     	case 22:PORT_Enable(PORTA);PORT_Configuer(PORTA, 10, 3);break;
//   51     	case 23:PORT_Enable(PORTB);PORT_Configuer(PORTB, 18, 3);break;
//   52     	case 24:PORT_Enable(PORTA);PORT_Configuer(PORTA, 11, 3);break;
//   53     	case 25:PORT_Enable(PORTB);PORT_Configuer(PORTB, 19, 3);break;
//   54     	case 26:PORT_Enable(PORTD);PORT_Configuer(PORTD, 0,  4);break;
//   55     	case 27:PORT_Enable(PORTD);PORT_Configuer(PORTD, 1,  4);break;
//   56     	case 28:PORT_Enable(PORTD);PORT_Configuer(PORTD, 2,  4);break;
//   57     	case 29:PORT_Enable(PORTD);PORT_Configuer(PORTD, 3,  4);break;
//   58     	case 30:PORT_Enable(PORTC);PORT_Configuer(PORTC, 8,  3);break;
//   59     	case 31:PORT_Enable(PORTC);PORT_Configuer(PORTC, 9,  3);break;
//   60     	case 32:PORT_Enable(PORTC);PORT_Configuer(PORTC, 10, 3);break;
//   61     	case 33:PORT_Enable(PORTC);PORT_Configuer(PORTC, 11, 3);break;
//   62     	case 34:PORT_Enable(PORTE);PORT_Configuer(PORTE, 5,  6);break;
//   63     	case 35:PORT_Enable(PORTE);PORT_Configuer(PORTE, 6,  6);break;
//   64     	case 36:PORT_Enable(PORTE);PORT_Configuer(PORTE, 7,  6);break;
//   65     	case 37:PORT_Enable(PORTE);PORT_Configuer(PORTE, 8,  6);break;
//   66     	case 38:PORT_Enable(PORTE);PORT_Configuer(PORTE, 9,  6);break;
//   67     	case 39:PORT_Enable(PORTE);PORT_Configuer(PORTE, 10, 6);break;
//   68     	case 40:PORT_Enable(PORTE);PORT_Configuer(PORTE, 11, 6);break;
//   69     	case 41:PORT_Enable(PORTE);PORT_Configuer(PORTE, 12, 6);break;
//   70     	}
//   71 	if(Freq >= BUS_CLK/0xFFFF*105/100)
//   72 		PS = 0;
//   73 	else if(Freq >= BUS_CLK/0xFFFF*105/100/2)
//   74 		PS = 1;
//   75 	else if(Freq >= BUS_CLK/0xFFFF*105/100/4)
//   76 		PS = 2;
//   77 	else if(Freq >= BUS_CLK/0xFFFF*105/100/8)
//   78 		PS = 3;
//   79 	else if(Freq >= BUS_CLK/0xFFFF*105/100/16)
//   80 		PS = 4;
//   81 	else if(Freq >= BUS_CLK/0xFFFF*105/100/32)
//   82 		PS = 5;
//   83 	else if(Freq >= BUS_CLK/0xFFFF*105/100/64)
//   84 		PS = 6;
//   85 	else if(Freq >= BUS_CLK/0xFFFF*105/100/128)
//   86 		PS = 7;
//   87     
//   88          HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx)&= ~FTM_CnSC_ELSA_MASK;
//   89          HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx)|= FTM_CnSC_MSB_MASK | FTM_CnSC_ELSB_MASK;
//   90          HWREG(FTM_SC_BASE+FTM_NUM*FTM_OFFSET)&= ~FTM_SC_CPWMS_MASK;//选择边沿对齐,
//   91         HWREG(FTM_SC_BASE+FTM_NUM*FTM_OFFSET)|= (FTM_SC_PS(PS)|FTM_SC_CLKS(1) ); 
//   92         temp = (double)(BUS_CLK)/Freq;
//   93         mod = (uint16)(temp / (1<<PS) +0.5);
//   94         HWREG(FTM_MOD_BASE+FTM_NUM*FTM_OFFSET)=mod-1;
//   95         HWREG(FTM_CNTIN_BASE+FTM_NUM*FTM_OFFSET)=0;
//   96         HWREG(FTM_CnV_BASE+FTM_NUM*FTM_OFFSET+ch_offset*CHx)=(uint16)((float)(mod)*Duty + 0.1+0.5-1);
//   97          HWREG(FTM_CNT_BASE+FTM_NUM*FTM_OFFSET)=1;
//   98  }
//   99 
//  100 void FTM_PWM_Set_Duty(uint8 Ftmn, uint8 CHx, float Duty)
//  101 {
//  102 	uint32 mod = 0;
//  103 	mod =  HWREG(FTM_MOD_BASE+FTM_NUM*FTM_OFFSET);
//  104 	HWREG(FTM_CnV_BASE+FTM_NUM*FTM_OFFSET+ch_offset*CHx)=(uint16)((float)(mod)*Duty-0.5);
//  105 }	
//  106 
//  107 void FTM_IC_Init(uint16 Ftmn_CHx_PTnx, FTM_Input_cfg cfg)
//  108 {
//  109 
//  110         uint32 Ftmn,CHx;
//  111         uint32 FTM_NUM=0;
//  112         switch(Ftmn_CHx_PTnx & 0xF000) //写保护禁止 
//  113             	{
//  114             		case 0x0000:Ftmn = 0;FTM_NUM=0;SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;FTM0_MODE |= FTM_MODE_WPDIS_MASK;break;
//  115             		case 0x1000:Ftmn = 1;FTM_NUM=1;SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;FTM1_MODE |= FTM_MODE_WPDIS_MASK;break;
//  116             		case 0x2000:Ftmn = 2;FTM_NUM=2;SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;FTM2_MODE |= FTM_MODE_WPDIS_MASK;break;
//  117             		case 0x3000:Ftmn = 3;FTM_NUM=3;SIM_SCGC3 |= SIM_SCGC3_FTM3_MASK;FTM3_MODE |= FTM_MODE_WPDIS_MASK;break;
//  118             	}
//  119             	switch(Ftmn_CHx_PTnx & 0x0F00)
//  120             	{
//  121             		case 0x0000:CHx = 0;break;
//  122             		case 0x0100:CHx = 1;break;
//  123             		case 0x0200:CHx = 2;break;
//  124             		case 0x0300:CHx = 3;break;
//  125             		case 0x0400:CHx = 4;break;
//  126             		case 0x0500:CHx = 5;break;
//  127             		case 0x0600:CHx = 6;break;
//  128             		case 0x0700:CHx = 7;break;
//  129             	}	
//  130             	switch(Ftmn_CHx_PTnx & 0x00FF)
//  131             	{
//  132             	case 0 :PORT_Configuer(PORTC, 1,  4);break;
//  133             	case 1 :PORT_Configuer(PORTA, 3,  3);break;
//  134             	case 2 :PORT_Configuer(PORTA, 4,  3);break;
//  135             	case 3 :PORT_Configuer(PORTC, 2,  4);break;
//  136             	case 4 :PORT_Configuer(PORTA, 5,  3);break;
//  137             	case 5 :PORT_Configuer(PORTC, 3,  4);break;
//  138             	case 6 :PORT_Configuer(PORTA, 6,  3);break;
//  139             	case 7 :PORT_Configuer(PORTC, 4,  4);break;
//  140             	case 8 :PORT_Configuer(PORTA, 7,  3);break;
//  141             	case 9 :PORT_Configuer(PORTD, 4,  4);break;
//  142             	case 10:PORT_Configuer(PORTD, 5,  4);break;
//  143             	case 11:PORT_Configuer(PORTA, 0,  3);break;
//  144             	case 12:PORT_Configuer(PORTD, 6,  4);break;
//  145             	case 13:PORT_Configuer(PORTA, 1,  3);break;
//  146             	case 14:PORT_Configuer(PORTD, 7,  4);break;
//  147             	case 15:PORT_Configuer(PORTA, 2,  3);break;		
//  148             	case 16:PORT_Configuer(PORTA, 12, 3);break;
//  149             	case 17:PORT_Configuer(PORTA, 8,  3);break;
//  150             	case 18:PORT_Configuer(PORTB, 0,  3);break;
//  151             	case 19:PORT_Configuer(PORTA, 13, 3);break;
//  152             	case 20:PORT_Configuer(PORTA, 9,  3);break;
//  153             	case 21:PORT_Configuer(PORTB, 1,  3);break;
//  154             	case 22:PORT_Configuer(PORTA, 10, 3);break;
//  155             	case 23:PORT_Configuer(PORTB, 18, 3);break;
//  156             	case 24:PORT_Configuer(PORTA, 11, 3);break;
//  157             	case 25:PORT_Configuer(PORTB, 19, 3);break;
//  158             	case 26:PORT_Configuer(PORTD, 0,  4);break;
//  159             	case 27:PORT_Configuer(PORTD, 1,  4);break;
//  160             	case 28:PORT_Configuer(PORTD, 2,  4);break;
//  161             	case 29:PORT_Configuer(PORTD, 3,  4);break;
//  162             	case 30:PORT_Configuer(PORTC, 8,  3);break;
//  163             	case 31:PORT_Configuer(PORTC, 9,  3);break;
//  164             	case 32:PORT_Configuer(PORTC, 10, 3);break;
//  165             	case 33:PORT_Configuer(PORTC, 11, 3);break;
//  166             	case 34:PORT_Configuer(PORTE, 5,  6);break;
//  167             	case 35:PORT_Configuer(PORTE, 6,  6);break;
//  168             	case 36:PORT_Configuer(PORTE, 7,  6);break;
//  169             	case 37:PORT_Configuer(PORTE, 8,  6);break;
//  170             	case 38:PORT_Configuer(PORTE, 9,  6);break;
//  171             	case 39:PORT_Configuer(PORTE, 10, 6);break;
//  172             	case 40:PORT_Configuer(PORTE, 11, 6);break;
//  173             	case 41:PORT_Configuer(PORTE, 12, 6);break;
//  174             	}
//  175 	/******************* 设置为输入捕捉功能 *******************/
//  176     switch(cfg)
//  177     {
//  178         //输入捕捉模式下：DECAPEN = 0 ， DECAPEN = 0 ，CPWMS = 0， MSnB:MSnA = 0
//  179 
//  180         // ELSnB:ELSnA         1          10          11
//  181         // 配置             上升沿      下降沿      跳变沿
//  182 
//  183     case FTM_Rising:    //上升沿触发
//  184         HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx)|=  ( FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK );                   //置1
//  185         HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) &= ~( FTM_CnSC_ELSB_MASK  | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
//  186         break;
//  187 
//  188     case FTM_Falling:   //下降沿触发
//  189         HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) |= (FTM_CnSC_ELSB_MASK  | FTM_CnSC_CHIE_MASK );                    //置1
//  190         HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) &= ~( FTM_CnSC_ELSA_MASK | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
//  191         break;
//  192 
//  193     case FTM_Rising_or_Falling: //上升沿、下降沿都触发
//  194         HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) |=  ( FTM_CnSC_ELSB_MASK | FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK ); //置1
//  195         HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) &= ~( FTM_CnSC_MSB_MASK  | FTM_CnSC_MSA_MASK); //清0
//  196         break;
//  197     }
//  198     HWREG(FTM_SC_BASE+FTM_NUM*FTM_OFFSET)= FTM_SC_CLKS(0x1);       //选择 bus 时钟
//  199     HWREG(FTM_COMBINE_BASE+FTM_NUM*FTM_OFFSET) = 0;
//  200     HWREG(FTM_MODE_BASE+FTM_NUM*FTM_OFFSET)    &= ~FTM_MODE_FTMEN_MASK;    //使能FTM
//  201     HWREG(FTM_CNTIN_BASE+FTM_NUM*FTM_OFFSET)   = 0;
//  202     HWREG(FTM_MOD_BASE+FTM_NUM*FTM_OFFSET) = 0; 
//  203     HWREG(FTM_CNT_BASE+FTM_NUM*FTM_OFFSET)   = 0;//计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
//  204     HWREG(FTM_STATUS_BASE+FTM_NUM*FTM_OFFSET)  = 0x00;               //清中断标志位
//  205 }
//  206 
//  207 
//  208 void FTM_TimeOut_Int_Enable(uint32 FTM_NUM, uint32 CHx)
//  209 {
//  210     HWREG(FTM_SC_BASE+FTM_NUM*FTM_OFFSET) |= FTM_SC_TOIE_MASK;  	
//  211     if(FTM_NUM>=128) FTM_NUM=FTM_NUM%126;
//  212     Enable_IRQ(78 + FTM_NUM);
//  213 }
//  214 void FTM_TimeOut_Int_Disable(uint32 FTM_NUM, uint32 CHx)
//  215 {
//  216     HWREG(FTM_SC_BASE+FTM_NUM*FTM_OFFSET )&=~ FTM_SC_TOIE_MASK;  	
//  217     if(FTM_NUM>=128) FTM_NUM=FTM_NUM%126;
//  218     Disable_IRQ(78 + FTM_NUM);
//  219 }
//  220 
//  221 
//  222 void FTM_Ch_Int_Enable(uint32 FTM_NUM, uint32 CHx)
//  223 {
//  224 	HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) |= FTM_CnSC_CHIE_MASK;
//  225     if(FTM_NUM>=128) FTM_NUM=FTM_NUM%126;
//  226     Enable_IRQ(78 + FTM_NUM);
//  227 }
//  228 void FTM_Ch_Int_Dis(FTMn_e Ftmn, FTM_CHn_e CHx)
//  229 {
//  230 	HWREG(FTM_CnSC_BASE+FTM_OFFSET*FTM_NUM+ch_offset*CHx) &= ~FTM_CnSC_CHIE_MASK;
//  231 	if(FTM_NUM>=128) FTM_NUM=FTM_NUM%126;
//  232     Disable_IRQ(78 + FTM_NUM);
//  233 }
//  234 
//  235 
//  236 
//  237 
//  238 
//  239 #endif
// 
//
// 
//
//
//Errors: none
//Warnings: none
