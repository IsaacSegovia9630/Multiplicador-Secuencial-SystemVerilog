// ---------------------------------------------------------------------
// File Name    : Multiplicador_Secuencial_TestBench.sv
// Description  : El proposito de este TB, es el de debuggear el Multiplicador Secuencial signado conforme avanza la práctica 1
//
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 25-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------


module Multiplicador_Secuencial_TestBench();

	parameter Word_Length = 6;

	//Input Ports
	logic Start_Input;
	logic Clk_Input;
	logic Reset_Input;
	logic signed [Word_Length-1:0] Multiplier_Input;
	logic signed [Word_Length-1:0] Multiplicand_Input;

	
	
	//Output Ports
	logic Ready_Output;
	logic signed[2*Word_Length-1:0] Product_Output;
	
	
	//Debug Outputs
	logic Start_Output;
	
	logic Load_Enable_output;
   logic Enable_output;
	logic [1:0] State_output;

	logic [Word_Length-1:0] count;
	
	logic [2*Word_Length-1:0] Multiplicand_Output;
	logic [Word_Length-1:0] Miltiplier_Output;
	logic Shift_CA2;
	logic Sign_output;
	
	logic [2*Word_Length-1:0] Left_Shifter_Multiplicand_output;
	
	logic [Word_Length-1:0]   Right_Shifter_Multiplier_output;
	
	logic [2*Word_Length-1:0] Product_Output_MUXANDSUM;
	
	logic [2*Word_Length-1:0] Product_Converted_Output;
	
	logic [27:0] BIN2BCD;
	
	logic [6:0] Unidades_Segmentos_output;
	
	logic [6:0] Decenas_Segmentos_output;
	
	logic [6:0] Centenas_Segmentos_output;
	
	logic [6:0] Milesimas_Segmentos_output;	

	Multiplicador_Secuencial #(Word_Length) dut(.*);											
	
	//Generador de reloj
    initial begin
        Clk_Input = 0;  // Inicialización de la señal de reloj
        forever #5 Clk_Input = ~Clk_Input; // Período del reloj = 10 unidades de tiempo (5 unidades para HIGH (0.005ns), 5 unidades para LOW(0.005ns))
		 
    end
   
	integer fd;
   
   integer EXP_VAL;
   
   logic signed [2*Word_Length-1:0] Expected_Val_logic; 
   
	initial begin
   
      fd = $fopen("./Multiplicaciones.csv","w");
      
      $fdisplay(fd,"STATUS, MULTIPLICAND, MULTIPLIER, RESULT, EXPECTED");
		
		
		for(integer i = -2**(Word_Length-1); i < 2**(Word_Length-1); i++)begin:MULTIPLICANT_VARIACION
		
			for(integer j=-2**(Word_Length-1); j < 2**(Word_Length-1); j++)begin:MULTIPLIER_VARIACION
			

					Start_Input = 1; Reset_Input = 1; Multiplicand_Input = i; Multiplier_Input = j; #(14*Word_Length);
					
					Start_Input = 0; #10;		
				
					EXP_VAL = i*j;
					
					Expected_Val_logic = EXP_VAL[2*Word_Length-1:0];
					
					if(Product_Output != Expected_Val_logic)begin
					
						$fdisplay(fd,"ERROR, %d, %d, %d, %d", Multiplicand_Input, Multiplier_Input, Product_Output, Expected_Val_logic);
					
					end
					
					else begin
						
						$fdisplay(fd,"PASS, %d, %d, %d, %d", Multiplicand_Input, Multiplier_Input, Product_Output, Expected_Val_logic);
                 
					end
			
			
			end:MULTIPLIER_VARIACION
			
		
		end:MULTIPLICANT_VARIACION
		
      $fclose(fd);
		
		$stop;
	
	end
endmodule
