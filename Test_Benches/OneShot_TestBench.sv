// ---------------------------------------------------------------------
// File Name    : OneShot_TestBench.sv
// Description  : El proposito de este TB, es el de probar el modulo de One Shot dejando en alto la señal de start y que la salida se mantenga en alto por pocos ciclos y
//						no de forma permanente.
//        
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 23-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------

module OneShot_TestBench();

	//Input Ports
	logic clk;
	logic Start_Input;
	
	//Output Ports
	logic Start_Output;

	OneShot dut(
		.*

	);											
	
	//Generador de reloj
    initial begin
        clk = 0;  // Inicialización de la señal de reloj
        forever #5 clk = ~clk; // Período del reloj = 10 unidades de tiempo (5 unidades para HIGH (0.005ns), 5 unidades para LOW(0.005ns))
		 
    end
	
	initial begin
		
		Start_Input = 0; #15;
		Start_Input = 1; #70;
		
		$stop;
	
	end
endmodule
