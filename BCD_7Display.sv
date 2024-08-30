// ---------------------------------------------------------------------
// File Name    : BCD_7Display.sv
// Description  : El proposito de este módulo, es el de obtener el conjunto de 1 y 0 que puedan representen en decimal (en display de 7 segmentos) 
//						de acuerdo al numero binario entrante. El módulo está descrito de forma estructural con lógica combinacional.
//
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 25-08-2024
// Version      : 1.0
// 
// --------------------------------------------------------------------- 

module BCD_7Display (

	//Input Ports
	input [3:0]binary,

	//Output ports
	output [6:0]Segmentos

);

	logic a,b,c,d,e,f,g;
	
	always_comb begin
		
		a = (~binary[2] & ~binary[0]) | binary[1] | (binary[0] & binary[2]) | binary[3];
		
		b = ~binary[2] | (binary[1] & binary[0]) | (~binary[1] & ~binary[0]);
		
		c = ~binary[1] | binary[0] | binary[2];
		
		d = (~binary[2] & ~binary[0]) | (binary[1] & ~binary[2]) | (~binary[1] & binary[0] & binary[2]) | (binary[1] & ~binary[0]) | binary[3];

		e = (~binary[2] & ~binary[0]) | (binary[1] & ~binary[0]);
		
		f = (~binary[0] & ~binary[1]) | (binary[2] & ~binary[1]) | (binary[2] & ~binary[0]) | binary[3];
		
		g = (~binary[2] & binary[1]) | (binary[2] & ~binary[1]) | binary[3] | (binary[2] & ~binary[0]);	
	
	
	end
	
	assign Segmentos = ~{a,b,c,d,e,f,g};
	

endmodule
