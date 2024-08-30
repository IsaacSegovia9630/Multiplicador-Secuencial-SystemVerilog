// ---------------------------------------------------------------------
// File Name    : Bin_2_Display7Segments.sv
//
// Description  : Este TB, es para probar si cada conunto de 4 bits, representa las unidades, decenas, centenas y milesimas del número de entrada.
//						SE RECOMIENDA ver la salida en Hexadecimal para facilitar la visualisación del resultado.
//
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 25-08-2024
// Version      : 1.0
// 
// --------------------------------------------------------------------- 

module Bin_2_BCD_TestBench();
   
	//Input Ports
	logic  [11:0]Data_Input;

	logic  [27:0] Data_Output;
   
   Bin_2_BCD dut(.*);
   
   initial begin
	
		Data_Input = 0; 	 #5;
		Data_Input = 1;		 #5;
		Data_Input = 28; 	 #5;
		Data_Input = 999; 	 #5;
		Data_Input = 1000;  #5;
		Data_Input = 1024;  #5;
      
      $stop;
   
   end
endmodule
