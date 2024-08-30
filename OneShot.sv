// ---------------------------------------------------------------------
// File Name    : One_Shot.sv
// Description  : El proposito de este módulo, es el de tener control de una señal de entrada tal que solo dure unos pocos ciclos en la salida del módulo.
//						De esta forma podemos despreocuparnos de si dejamos presionado un boton en la tarjeta no afecte a todo el circuito. Tambien se le conoce
//						como debouncer.
//                
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 23-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------
module OneShot(

	input clk,
	input Start_Input,
	
	
	output Start_Output


);

	wire FF1_Output;
	wire FF2_Output;

	Register FF1(

		.clk(clk),
		.Data_Input(Start_Input),

		.Data_Ouput(FF1_Output)

	);	
	
	
	Register FF2(

		.clk(clk),
		.Data_Input(FF1_Output),

		.Data_Ouput(FF2_Output)

	);		

	assign Start_Output = Start_Input & (~FF2_Output);


endmodule


module Register (

	input clk,
	input Data_Input,

	output Data_Ouput

);

logic Data_reg = 0;


always_ff@(posedge clk)begin

		Data_reg <= Data_Input;
end

assign Data_Ouput = Data_reg;

endmodule
