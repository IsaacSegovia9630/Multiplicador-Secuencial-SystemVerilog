// ---------------------------------------------------------------------
// File Name    : Load_Control_TestBench.sv
// Description  : El proposito de este TB, es el de probar el modulo de Load Control, dependiendo de los signos de las entradas que tenga, deberá entregarle a los 
//						shifters los datos procesados al igual que una flag para saber si en el ultimo shift, es necesario aplicarle un complemento A2 (por la multipliacion A2 a mano)
//        
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 23-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------

module Load_Control_TestBench();

	parameter Word_Length = 8;

	//Input Ports
	logic [Word_Length-1:0] Multiplicand_Input;
	logic [Word_Length-1:0] Miltiplier_Input;
	
	
	//Output Ports
	logic [2*Word_Length-1:0] Multiplicand_Output;
	logic [Word_Length-1:0] Miltiplier_Output;
	
	logic Shift_CA2;

	Load_Control #(Word_Length) dut(
	
		.*
	
	);											
	
	
	initial begin
		
		Multiplicand_Input = -1; Miltiplier_Input =  1;#10;
		
		Multiplicand_Input = -1; Miltiplier_Input = -1;#10;
		
		Multiplicand_Input =  1; Miltiplier_Input = -1;#10;
		
		$stop;
	
	end
endmodule
