// ---------------------------------------------------------------------
// File Name    : bin2bcd.sv
// Description  : El proposito de este módulo, es el de evaluar si el valor de las unidades, decenas o centenas han pasado de 5, y por lo tantop si es necesario sumarle 3 para
//						para emular el carry en base 10. Después se hace un shifteo hacua la izquierda.
//						Para el Test Bench y debug, es recomendable visializar la señal con formato hexadecimal.
//
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 24-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------

module Bin_2_BCD
(

	//Input Ports
	input  [11:0]Data_Input,

	output [27:0] Data_Output

);

	logic [27:0] Register = 0;
	
	always_comb begin
	
		Register = Data_Input;
		
		for(integer i = 0; i < 12; i++)begin
		
				if(Register[15:12]  > 4) Register[15:12] = Register[15:12] +3; //Unidades
				 
				if(Register[19:16] > 4)  Register[19:16] = Register[19:16] +3; //Decenas
				 
				if(Register[23:20] > 4)  Register[23:20] = Register[23:20] +3; //Centenas
				 
				if(Register[27:24] > 4)  Register[27:24] = Register[27:24] +3; //Milesimas
				
				Register = Register << 1;		
			
		end
	
	
	end	
	
	assign Data_Output = Register;

endmodule
