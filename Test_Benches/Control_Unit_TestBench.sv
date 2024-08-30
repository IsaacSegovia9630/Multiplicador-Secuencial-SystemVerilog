// ---------------------------------------------------------------------
// File Name    : Control_Unit_TestBench.sv
// Description  : El proposito de este TB, es observar si el Control Unit responde bien ante sus entradas con respecto a start y counter. Este debará levantar las señales
//						de acuerdo a las restricciones y condiones del multiplicador secuencial.
//                
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 24-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------


module Control_Unit_TestBench();

	parameter Word_Length = 8;

	logic clk;
	logic reset_Input;
	logic start;
	logic [3:0] Counter;
	
	
	logic Load_Enable_output;
	logic Ready_output;
   logic Enable_output;
	logic [1:0] State_output;
											
	Control_Unit dut(.*);
	
	//Generador de reloj
    initial begin
        clk = 0;  // Inicialización de la señal de reloj
        forever #5 clk = ~clk; // Período del reloj = 10 unidades de tiempo (5 unidades para HIGH (0.005ns), 5 unidades para LOW(0.005ns))
		 
    end	
	
	initial begin
		
		Counter = 0; reset_Input = 1; start=0; #10;
		
		Counter = 0; reset_Input = 1; start=1; #10;
		
		Counter = 0; reset_Input = 1; start=0; #30;
		
		Counter = 7; reset_Input = 1; start=0; #30;

		
		$stop;
	
	end
endmodule