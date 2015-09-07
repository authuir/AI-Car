#include "transform.h"
/*
void Send_Transformed(void)
 {
  int M;
	UART_SS(UART0,"image");
	for (M = 223*300-1;M>=0;M--)
	{
		if ( RST0[M] >0 && RST1[M] >0 && RST0[M] <= BmpHeightX && RST1[M] <= BmpWidthX)
		{
			UART_S1(UART0,(date   [(RST0[M] )]    
								  [(RST1[M])]
						  )
			);
		}
		else
			UART_S1(UART0,1);
	} 
}
uint8 Get_Transform_Value(uint16 i,uint16 j)
{
        return date[RST0[i*180+j]][RST1[i*180+j]];
}

void source_dot(uint16 i,uint16 j,uint8 *source_i,uint8 *source_j)
 {
     *source_i=RST0[i*300+j];
     *source_j=RST1[i*300+j];
 }*/