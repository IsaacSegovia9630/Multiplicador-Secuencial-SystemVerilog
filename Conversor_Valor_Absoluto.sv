// ---------------------------------------------------------------------
// File Name    : Conversor_Valor_Absoluto.sv
// Description  : El proposito de este módulo, es el de convertir el resultado del algoritmo en un valor absoluto para poder el valor resultante
//                
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 25-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------


module Conversor_Valor_Absoluto #(parameter Word_Length = 8) 
(

	input  [2*Word_Length-1:0] Product_Input,
	input	 Sign_Input,
	input  Ready_Input,
	
	output logic [2*Word_Length-1:0] Product_Converted_Output

);

always_comb begin
	
	if(Ready_Input)begin
	
		if(Sign_Input)begin
	
			Product_Converted_Output = 0-Product_Input;
	
		end
	
		else begin 
	
			Product_Converted_Output = Product_Input;
	
		end	
		
	end
	
	else begin
		
		Product_Converted_Output = 0;
	
	end

end


endmodule
