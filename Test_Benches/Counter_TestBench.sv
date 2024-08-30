// ---------------------------------------------------------------------
// File Name    : Counter_TestBench.sv
// Description  : El proposito de este TB, es observar si el contador llega a "Word_Length-1" para resetear la cuenta a 0. Al igual que observar que el reset asíncronico
//						y el enable funcionen adecuadamente. 
//                
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 24-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------


module Counter_TestBench();

	parameter Word_Length = 8;

    logic clk;             
    logic reset;           
    logic enable;
    logic [Word_Length-1:0] count;
											
	Counter #(Word_Length) dut(.*);
	
	//Generador de reloj
    initial begin
        clk = 0;  // Inicialización de la señal de reloj
        forever #5 clk = ~clk; // Período del reloj = 10 unidades de tiempo (5 unidades para HIGH (0.005ns), 5 unidades para LOW(0.005ns))
		 
    end	
	
	initial begin
		
		reset = 1; enable=0; #30;
	
		reset = 1; enable=1; #(20*Word_Length);
	
		reset = 0; enable=1; #30;

		
		$stop;
	
	end
endmodule