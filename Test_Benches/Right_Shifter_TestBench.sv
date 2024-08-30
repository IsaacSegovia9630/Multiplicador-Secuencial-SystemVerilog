// ---------------------------------------------------------------------
// File Name    : Right_Shifter_TestBench.sv
// Description  : El proposito de este TB, es el de probar si el registro Right_Shifter, puede cargar y mantener los datos cuando Load_Enable = 1. Y tambien Si los desplaza hacia
//						la derecha una vez que Load_enable = 0
//                
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 24-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------


module Right_Shifter_TestBench();

	parameter Word_Length = 8;

	logic clk;
	logic reset;
	logic Load_enable;
	logic [Word_Length-1:0] Data_Input; //Multiplier

	logic [Word_Length-1:0] Data_Output; //Multiplier
	
	Right_Shifter#(Word_Length) dut(.*);
	
	//Generador de reloj
    initial begin
        clk = 0;  // Inicialización de la señal de reloj
        forever #5 clk = ~clk; // Período del reloj = 10 unidades de tiempo (5 unidades para HIGH (0.005ns), 5 unidades para LOW(0.005ns)) 
    end	
	
	initial begin
		
		reset = 1; Load_enable = 0; Data_Input = 8'b10101010;#10
	
		reset = 1; Load_enable = 1; Data_Input = 8'b10101010;#30
	
		reset = 1; Load_enable = 0; Data_Input = 8'b10101010;#50
		
		
		#(10*Word_Length);
		
		$stop;
	
	end
endmodule