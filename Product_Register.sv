	// ---------------------------------------------------------------------
// File Name    : Product_Register.sv
// Description  : El proposito de este módulo, es memrorizar el producto del módulo MUX_SUM para retroalimentarlo.
//                
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 24-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------

module Product_Register #(Word_Length = 8)(

	input clk,
	input reset,
	input Load_enable,
	input [2*Word_Length-1:0] Product_Input,

	output [2*Word_Length-1:0] Product_Output

);

logic [2*Word_Length-1:0] Data_reg = 0;


always_ff@(posedge clk or negedge reset)begin

	if(~reset)begin:RESET
	
		Data_reg <= 0; 
		
	end:RESET
	
	else if(Load_enable) begin
	
		Data_reg <= 0; 
		
	end

	else begin
	
		Data_reg <= Product_Input;
	
	end
	
end

assign Product_Output = Data_reg;

endmodule
