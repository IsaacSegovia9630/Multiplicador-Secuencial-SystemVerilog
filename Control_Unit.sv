// ---------------------------------------------------------------------
// File Name    : Control_Unit.sv
// Description  : El proposito de este módulo, es controlar el resto de módulos para lograr la multiplicación secuencial de forma adecuada a las restricciones
//                
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 24-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------

module Control_Unit #(parameter Word_Length = 8)
(

	input clk,
	input reset_Input,	
	input start,
	input [Word_Length-1:0] Counter,
	
	
	output Load_Enable_output,
	output Ready_output,
   output Enable_output,
	output [1:0] State_output

);
	logic Load    = 0;
	logic Enable  = 0;
	logic Ready   = 1;
	
	typedef enum logic [1:0] {
		
			
			IDLE_STATE  	= 2'b00,
			LOAD_STATE  	= 2'b01,
			SHIFTING_STATE = 2'b10
	
	
	}state_t;


	state_t Current_state = IDLE_STATE;
	state_t Next_state;
	
	
	
    // Lógica secuencial para la transición de estados-------------------------------------------------------------------
    always_ff @(posedge clk or negedge reset_Input) begin:TRANSICION
	 
        if(~reset_Input)
		  
            Current_state <= IDLE_STATE;
				
        else
		  
            Current_state <= Next_state;
				
    end:TRANSICION
	 
	
	//INICIO DEL MULTIPlICADOR---------------------------------------------------------------------------------------------	
	always_comb begin:INICIO
	
			Next_state = Current_state; // Estado por defecto es mantenerse igual
			
			unique case (Current_state)
				
				IDLE_STATE: 	 if (start)        		       Next_state = LOAD_STATE;
				
				LOAD_STATE: 	  						 		       Next_state = SHIFTING_STATE;
				
				SHIFTING_STATE: if (Counter == Word_Length-1) Next_state = IDLE_STATE;
			
			endcase
	
	end:INICIO
	
	
	//Fijamos salidas------------------------------------------------------------------------------------------------------
	always_comb begin:SALIDAS
			
			{Enable,Load,Ready} = 3'b001;
			
			unique case (Current_state)

				IDLE_STATE: 	    {Enable, Load, Ready}=3'b001;
				
				LOAD_STATE:			 {Enable, Load, Ready}=3'b010;
				
				SHIFTING_STATE:	 {Enable, Load, Ready}=3'b100;		
				
			endcase
	
	end:SALIDAS
	
	assign  Enable_output 		= Enable;
	assign  Load_Enable_output = Load;
	assign  Ready_output  		= Ready;	
	assign  State_output       = Current_state;

endmodule