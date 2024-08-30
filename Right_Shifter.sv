// ---------------------------------------------------------------------
// File Name    : Right_Shifter.sv
// Description  : El proposito de este módulo, es el de cargar el Multiplier para luego hacerle un desplazamiento a la derecha conforme la Control Unit indique usando la
//						señal de Load_Enable.
//                
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 24-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------
module Right_Shifter #(Word_Length = 8)(

	input clk,
	input reset,
	input Load_enable,
	input [Word_Length-1:0] Data_Input, //Multiplier

	output logic [Word_Length-1:0] Data_Output //Multiplier

);

	logic [Word_Length-1:0] Current_Reg = 0;


always_ff@(posedge clk or negedge reset)begin:ThisIsaRightShifter


	if(~reset)begin:RESET
	
			Current_Reg <= 0;
		
	end:RESET
	
	
	else if(Load_enable)begin:LOAD_DATA
	
		Current_Reg <= Data_Input;
		
	end:LOAD_DATA
	
		
	else begin: SHIFTING
	
		Current_Reg <=  Current_Reg >> 1;
		
	end:SHIFTING	
		
	
end:ThisIsaRightShifter

	assign Data_Output = Current_Reg;

endmodule
