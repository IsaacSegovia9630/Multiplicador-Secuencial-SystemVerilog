// ---------------------------------------------------------------------
// File Name    : Counter.sv
// Description  : El proposito de este módulo, es contar hasta la cantidad de bits de entrada para el Miltiplier y el Multiplicand.
//                
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 24-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------

module Counter #(parameter Word_Length = 8)
(
    input clk,               
    input reset,             
    input enable,            
    output logic [Word_Length-1:0] count = 0
);

    // Bloque secuencial para el conteo
    always_ff @(posedge clk or negedge reset) begin:COUNT
	 
        if (~reset) begin:RESET
		  
            count <= 0;  // Reiniciar el contador a 0
				
        end:RESET 
		  
		  else if (enable) begin:ENABLE
		  
            if (count ==  Word_Length-1) begin:NEW_COUNT
				
                count <= 0;  // Reiniciar el contador si alcanza el valor máximo
					 
            end:NEW_COUNT
				
				else begin:COUNT_PLUS
				
                count <= count + 1;  // Incrementar el contador
					 
            end:COUNT_PLUS
				
        end:ENABLE
		  
    end:COUNT

endmodule
