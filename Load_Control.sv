// ---------------------------------------------------------------------
// File Name    : Load_Control.sv
// Description  : El proposito de este módulo, es el de tener control sobre los inputs al multiplicador secuencial y poderle indicar a los shifters como realizar el último shift
//                
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 23-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------

module Load_Control #(parameter Word_Length = 8)
(
		//Input Ports
		input [Word_Length-1:0] Multiplicand_Input,
		input [Word_Length-1:0] Multiplier_Input,
		
		
		//Output Ports
		output logic[2*Word_Length-1:0] Multiplicand_Output,
		output logic[Word_Length-1:0] Miltiplier_Output,
		
		output logic Shift_CA2
);

	always_comb begin
	
		case({Multiplicand_Input[Word_Length-1], Multiplier_Input[Word_Length-1]})
		
			2'b10 : begin
							
							Multiplicand_Output = {{Word_Length{1'b1}},Multiplicand_Input};
							
							Miltiplier_Output = Multiplier_Input;
							
							Shift_CA2 = 0;
							
					  end
					  
			2'b11 : begin
							
							Multiplicand_Output = {{Word_Length{1'b1}},Multiplicand_Input};
							
							Miltiplier_Output = Multiplier_Input;
							
							Shift_CA2 = 1;
							
							
					  end

			2'b01 : begin
							
							Multiplicand_Output = {{Word_Length{1'b0}},Multiplicand_Input};
							
							Miltiplier_Output = Multiplier_Input;
							
							Shift_CA2 = 1;
							
							
					  end
					  
			default : begin
							
							Multiplicand_Output = {{Word_Length{1'b0}},Multiplicand_Input};
							
							Miltiplier_Output = Multiplier_Input;
							
							Shift_CA2 = 0;
							
							
					  end
		
		endcase
	
	end


endmodule
