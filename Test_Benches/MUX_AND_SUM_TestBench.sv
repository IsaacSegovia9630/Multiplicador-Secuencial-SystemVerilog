// ---------------------------------------------------------------------
// File Name    : MUX_AND_SUM_TestBench.sv
// Description  : El proposito de este TB, es el de probar el modulo de MUX AND SUM tal que, podamos validar si las multiplicaciones (-)(+), (-)(-), (+)(-) y (+)(+) se
//						hagan correctamente. En este TB se usó de ejemplo 8 iteraciones por los 8 bits de Word_Length
//        
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 23-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------

module MUX_AND_SUM_TestBench();

	parameter Word_Length = 8;
	
	//Input Ports
	logic 		 [2*Word_Length-1:0]  Product_Input;
	logic 		 [2*Word_Length-1:0]  Multiplicand_Input;
	logic 		 [Word_Length-1:0]    Multiplier_Input;
	logic 		 						  	 Shift_CA2;
	logic 		 [Word_Length-1:0]    counter;

	//Output Ports
	logic 		 [2*Word_Length-1:0]  Product_Output;

	MUX_AND_SUM #(Word_Length) dut(
		.*

	);											
	
	initial begin

		 //Multiplicando -128 y 128
		
		 Multiplicand_Input = -128;  Multiplier_Input = 128;  counter = 0; Product_Input = 0; Shift_CA2 = 0; #10; //Product_Output = 0
											 													                   
		 Multiplicand_Input = -256;   Multiplier_Input = 64;  counter = 1; Product_Input = 0; Shift_CA2 = 0; #10; //Product_Output = 0
											 													                   
		 Multiplicand_Input = -512;   Multiplier_Input = 32;  counter = 2; Product_Input = 0; Shift_CA2 = 0; #10; //Product_Output = 0
											 													                   
		 Multiplicand_Input = -1024;  Multiplier_Input = 16;  counter = 3; Product_Input = 0; Shift_CA2 = 0; #10; //Product_Output = 0
		  
		 Multiplicand_Input = -2048;  Multiplier_Input = 8;   counter = 4; Product_Input = 0; Shift_CA2 = 0; #10; //Product_Output = 0
		  
		 Multiplicand_Input = -4096;  Multiplier_Input = 4;   counter = 5; Product_Input = 0; Shift_CA2 = 0; #10; //Product_Output = 0
		  
		 Multiplicand_Input = -8192;  Multiplier_Input = 2;   counter = 6; Product_Input = 0; Shift_CA2 = 0; #10; //Product_Output = 0
		 
		 Multiplicand_Input = -16384; Multiplier_Input = 1;   counter = 7; Product_Input = 0; Shift_CA2 = 0; #10; //Product_Output = -16384
		
	

		 //Multiplicando -5 y -7
		 
		 Multiplicand_Input = -5; Multiplier_Input = -7;  counter = 0; Product_Input = 0; Shift_CA2 = 1; #10; //Product_Output = -5
																								                  
		 Multiplicand_Input = -10;  Multiplier_Input = -4;  counter = 1; Product_Input = -5; Shift_CA2 = 1; #10; //Product_Output = -5
																								                  
		 Multiplicand_Input = -20;  Multiplier_Input = -2;   counter = 2; Product_Input = -5; Shift_CA2 = 1; #10; //Product_Output = -5
																								                  
		 Multiplicand_Input = -40; Multiplier_Input = -1;   counter = 3; Product_Input = -5; Shift_CA2 = 1; #10; //Product_Output = -45
		 
		 Multiplicand_Input = -80; Multiplier_Input = -1;   counter = 4; Product_Input = -45; Shift_CA2 = 1; #10; //Product_Output = -125
		 
		 Multiplicand_Input = -160; Multiplier_Input = -1;   counter = 5; Product_Input = -125; Shift_CA2 = 1; #10; //Product_Output = -285
		 
		 Multiplicand_Input = -320; Multiplier_Input = -1;   counter = 6; Product_Input = -285; Shift_CA2 = 1; #10; //Product_Output = -605
		 
		 Multiplicand_Input = -640; Multiplier_Input = -1;   counter = 7; Product_Input = -605; Shift_CA2 = 1; #10; //Product_Output = 35
		 
	
		 //Multiplicando 128 y -128
		 Multiplicand_Input = 128;   Multiplier_Input = -128; counter = 0; Product_Input = 0; Shift_CA2 = 1; #10; //Product_Output = 0
											 													                   
		 Multiplicand_Input = 256;   Multiplier_Input = -64;  counter = 1; Product_Input = 0; Shift_CA2 = 1; #10; //Product_Output = 0
											 													                   
		 Multiplicand_Input = 512;   Multiplier_Input = -32;  counter = 2; Product_Input = 0; Shift_CA2 = 1; #10; //Product_Output = 0
											 													                   
		 Multiplicand_Input = 1024;  Multiplier_Input = -16;  counter = 3; Product_Input = 0; Shift_CA2 = 1; #10; //Product_Output = 0
		  
		 Multiplicand_Input = 2048;  Multiplier_Input = -8;   counter = 4; Product_Input = 0; Shift_CA2 = 1; #10; //Product_Output = 0
		  
		 Multiplicand_Input = 4096;  Multiplier_Input = -4;   counter = 5; Product_Input = 0; Shift_CA2 = 1; #10; //Product_Output = 0
		  
		 Multiplicand_Input = 8192;  Multiplier_Input = -2;   counter = 6; Product_Input = 0; Shift_CA2 = 1; #10; //Product_Output = 0
		 
		 Multiplicand_Input = 16384; Multiplier_Input = -1;   counter = 7; Product_Input = 0; Shift_CA2 = 1; #10; //Product_Output = -16384
		 

		 //Multiplicando 2 y 10
		 
		 Multiplicand_Input = 2;  Multiplier_Input = 10;  counter = 0; Product_Input = 0; Shift_CA2 = 0; #10; //Product_Output = 0
																								                  
		 Multiplicand_Input = 4;  Multiplier_Input =  5;  counter = 1; Product_Input = 0; Shift_CA2 = 0; #10; //Product_Output = 4
																								                  
		 Multiplicand_Input = 8;  Multiplier_Input = 2;   counter = 2; Product_Input = 4; Shift_CA2 = 0; #10; //Product_Output = 4
																								                  
		 Multiplicand_Input = 16; Multiplier_Input = 1;   counter = 3; Product_Input = 4; Shift_CA2 = 0; #10; //Product_Output = 20		
		 
		 
		
		$stop;
	
	end
endmodule
