// ---------------------------------------------------------------------
// File Name    : MUX_AND_SUM.sv
// Description  : El proposito de este módulo, es el de evaluar como se hará la suma del prodcuto, ya sea solo sumando el multiplicand, si no se le sumará nada ó
//						si se le aplicará una resta para hacer un complemento A2 al multiplicand si está en el último shift
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 23-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------

module MUX_AND_SUM #(Word_Length = 8)(

	//Input Ports
	input 		 [2*Word_Length-1:0]  Product_Input,
	input 		 [2*Word_Length-1:0]  Multiplicand_Input,
	input 		 [Word_Length-1:0]    Multiplier_Input,
	input 		 						  	 Shift_CA2,
	input 		 [Word_Length-1:0]    counter,

	//Output Ports
	output logic [2*Word_Length-1:0]  Product_Output

);


always_comb begin:MUX

	if(Multiplier_Input & 2'h01)begin
	
		if(Shift_CA2 && (counter == Word_Length-1)) begin
		
			Product_Output = Product_Input + (0-Multiplicand_Input);
		
		end
		
		else begin
	
			Product_Output = Product_Input + Multiplicand_Input;
			
		end
	
	end
	
	else begin
	
		Product_Output = Product_Input + 0;
	
	end



end:MUX

endmodule
