// ---------------------------------------------------------------------
// File Name    : Product_Register_TestBench.sv
// Description  : El proposito de este TB, es el de observar que el registro del producto se reincie cuando 
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 28-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------


module Product_Register_TestBench();

	parameter Word_Length = 6;

	logic clk;
	logic reset;
	logic Load_enable;
	logic [2*Word_Length-1:0] Product_Input;

	logic [2*Word_Length-1:0] Product_Output;

	Product_Register #(Word_Length) dut(.*);											
	
	//Generador de reloj
    initial begin
        clk = 0;  // Inicialización de la señal de reloj
        forever #5 clk = ~clk; // Período del reloj = 10 unidades de tiempo (5 unidades para HIGH (0.005ns), 5 unidades para LOW(0.005ns))
		 
    end

   
	initial begin
   
      reset = 1; Load_enable = 0; Product_Input = 20; #30;
      
      reset = 1; Load_enable = 1; Product_Input = 20; #30;
      
      reset = 0; Load_enable = 1; Product_Input = 20; #30;
		
		$stop;
	
	end
endmodule
