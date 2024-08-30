// ---------------------------------------------------------------------
// File Name    : Multiplicador_Secuencial.sv
// Description  : El proposito de este módulo, es conectar todos los módulos necesarios para crear un algortimo de multiplicación secuencial signado.
//                
// Author       : Isaac Segovia Hernández
// Email        : ie721714@iteso.mx
// Date         : 25-08-2024
// Version      : 1.0
// 
// ---------------------------------------------------------------------

module Multiplicador_Secuencial #(parameter Word_Length = 6) 
(

	//Input Ports
	input Start_Input,
	
	input Reset_Input,
	
	input Clk_Input,
	
	input signed[Word_Length-1:0] Multiplier_Input,
	input signed[Word_Length-1:0] Multiplicand_Input,

	
	
	//Output Ports
	output Ready_Output,
	
	output Sign_output,
	
	output [6:0] Unidades_Segmentos_output,
	
	output [6:0] Decenas_Segmentos_output,
	
	output [6:0] Centenas_Segmentos_output,
	
	output [6:0] Milesimas_Segmentos_output,
	
	
	output signed[2*Word_Length-1:0] Product_Output,	
	
	//Debug Outputs
	output Start_Output,
	
	output Load_Enable_output,
   output Enable_output,
	output [1:0] State_output,

	output [Word_Length-1:0] count,
	
	output [2*Word_Length-1:0] Multiplicand_Output,
	output [Word_Length-1:0] Miltiplier_Output,
	output Shift_CA2,
	
	output [2*Word_Length-1:0] Left_Shifter_Multiplicand_output,
	
	output [Word_Length-1:0]   Right_Shifter_Multiplier_output,
	
	output [2*Word_Length-1:0] Product_Converted_Output,
	
	output [27:0] BIN2BCD
	
);
	
	wire Start_Output_Wire;
	
	wire Load_Enable_output_Wire;
	wire Ready_output_Wire;
   wire Enable_output_Wire;
	wire [1:0] State_output_Wire;
	

   wire [Word_Length-1:0] count_output_Wire;
	
	wire [2*Word_Length-1:0] Multiplicand_Output_Wire;
	wire [Word_Length-1:0] Miltiplier_Output_Wire;
	wire Shift_CA2_Wire;

	wire [2*Word_Length-1:0] Left_Shifter_Multiplicand_output_Wire;
	
	wire [Word_Length-1:0] Right_Shifter_Multiplier_output_Wire;
	
	wire [2*Word_Length-1:0] Product_Output_MUXANDSUM_Wire;
	
	wire [2*Word_Length-1:0] Product_Output_Register_Wire;
	
	wire [2*Word_Length-1:0] Product_Converted_Output_Wire;
	
	wire [27:0] Bin_2_BCD_output_Wire;

	//ONE SHOT-------------------------------------------------------------
	OneShot O_SHOT(

	//Input Ports
	.clk(Clk_Input),
	
	.Start_Input(Start_Input),
	
	//Output Ports
	.Start_Output(Start_Output_Wire)

	);
	
	//Control Unit---------------------------------------------------------
	Control_Unit #(Word_Length) C_UNIT(

	//Input Ports
	.clk(Clk_Input),
	
	.reset_Input(Reset_Input),
	
	.start(Start_Output_Wire),
	
	.Counter(count_output_Wire),
	
	//Output Ports
	.Load_Enable_output(Load_Enable_output_Wire),
	
	.Ready_output(Ready_output_Wire),
	
   .Enable_output(Enable_output_Wire),
	
	.State_output(State_output_Wire)

	);
	
	//Counter---------------------------------------------------------------
	Counter #(Word_Length) COUNTER_PERRON(
	
	//Input Ports
   .clk(Clk_Input),
	
   .reset(Reset_Input),
	
   .enable(Enable_output_Wire),

	//Output Ports
   .count(count_output_Wire)
	 
	);	
	
	//Load Control----------------------------------------------------------
	Load_Control #(Word_Length) LOAD_CONTROL(
	
	//Input Ports
	.Multiplicand_Input(Multiplicand_Input),
	
	.Multiplier_Input(Multiplier_Input),
	
	
	//Output Ports
	.Multiplicand_Output(Multiplicand_Output_Wire),
	
	.Miltiplier_Output(Miltiplier_Output_Wire),
	
	.Shift_CA2(Shift_CA2_Wire)
	
	);	
	
	//Left Shifter-----------------------------------------------------------
	Left_Shifter #(Word_Length) LEFT_SHIFTER_MULTIPLICAND(

	//Input Ports
	.clk(Clk_Input),
	
	.reset(Reset_Input),
	
	.Load_enable(Load_Enable_output_Wire),
	
	.Data_Input(Multiplicand_Output_Wire), //Multiplicand

	//Output Ports
	.Data_Output(Left_Shifter_Multiplicand_output_Wire) //Multiplicand

	);	
	
	//Right Shifter-----------------------------------------------------------
	 Right_Shifter #(Word_Length) RIGHT_SHIFTER_MULTIPLIER(

	//Input Ports
	.clk(Clk_Input),
	
	.reset(Reset_Input),
	
	.Load_enable(Load_Enable_output_Wire),
	
	.Data_Input(Miltiplier_Output_Wire), //Multiplier

	//Output Ports
	.Data_Output(Right_Shifter_Multiplier_output_Wire) //Multiplier

	);
	
	//MUX AND SUM---------------------------------------------------------------
   MUX_AND_SUM #(Word_Length) MUX_AND_SUM_CHIDO(

	//Input Ports
	.Product_Input(Product_Output_Register_Wire),
	
	.Multiplicand_Input(Left_Shifter_Multiplicand_output_Wire),
	
	.Multiplier_Input(Right_Shifter_Multiplier_output_Wire),
	
	.Shift_CA2(Shift_CA2_Wire),
	
	.counter(count_output_Wire),

	//Output Ports
	.Product_Output(Product_Output_MUXANDSUM_Wire)

	);

	//Product Register-----------------------------------------------------------
	Product_Register #(Word_Length) PRODUCT_REGISTER(

	//Input Ports
	.clk(Clk_Input),
	
	.reset(Reset_Input),
	
	.Load_enable(Load_Enable_output_Wire),
	
	.Product_Input(Product_Output_MUXANDSUM_Wire),

	//Output Ports
	
	.Product_Output(Product_Output_Register_Wire)

	);

	//Conversor de valor absoluto-----------------------------------------------
	Conversor_Valor_Absoluto #(Word_Length) CONVERSOR_CHIDISMO(

	.Product_Input(Product_Output_Register_Wire),
	
	.Sign_Input(Product_Output_Register_Wire[2*Word_Length-1]),
	
	.Ready_Input(Ready_output_Wire),
	
	.Product_Converted_Output(Product_Converted_Output_Wire)

	);

	//Binary to BCD-------------------------------------------------------------
	Bin_2_BCD BINARIO_to_BCD(

	//Input Ports
	.Data_Input(Product_Converted_Output_Wire),

	//Output Ports
	.Data_Output(Bin_2_BCD_output_Wire)

	);	
	
	 //BCD to 7 Display	UNIDADES
	 BCD_7Display UNIDADES(

	//Input Ports
	.binary(Bin_2_BCD_output_Wire[15:12]),

	//Output ports
	.Segmentos(Unidades_Segmentos_output)

	);	
	
	 //BCD to 7 Display	DECENAS
	 BCD_7Display DECENAS(

	//Input Ports
	.binary(Bin_2_BCD_output_Wire[19:16]),

	//Output ports
	.Segmentos(Decenas_Segmentos_output)

	);	
	
	 //BCD to 7 Display	CENTENEAS
	 BCD_7Display CENTENEAS(

	//Input Ports
	.binary(Bin_2_BCD_output_Wire[23:20]),

	//Output ports
	.Segmentos(Centenas_Segmentos_output)

	);		
	
	 //BCD to 7 Display	MILESIMAS
	 BCD_7Display MILESIMAS(

	//Input Ports
	.binary(Bin_2_BCD_output_Wire[27:24]),

	//Output ports
	.Segmentos(Milesimas_Segmentos_output)

	);	
	
	//Assigns Chidos
	assign Ready_Output     = Ready_output_Wire;
	assign Sign_output 	   = Product_Output_Register_Wire[2*Word_Length-1];
	assign Product_Output   = Product_Output_Register_Wire;
	
	//Assigns Debug----------------------------------------------------------
	
	//ONE SHOT
	assign Start_Output = Start_Output_Wire; 
	
	//Control Unit
	assign Load_Enable_output = Load_Enable_output_Wire;
   assign Enable_output 	  = Enable_output_Wire;
	assign State_output 		  = State_output_Wire;
	
	//Counter
	assign count = count_output_Wire;
	
	//Load Control
	assign Multiplicand_Output = Multiplicand_Output_Wire;
	assign Miltiplier_Output   = Miltiplier_Output_Wire;
	assign Shift_CA2 				= Shift_CA2_Wire;
	
	//Left Shifter
	assign Left_Shifter_Multiplicand_output = Left_Shifter_Multiplicand_output_Wire;
	
	//Right Shifter
	assign Right_Shifter_Multiplier_output  = Right_Shifter_Multiplier_output_Wire;
	
	//Conversor abosoluto
	assign Product_Converted_Output = Product_Converted_Output_Wire;
	
	//BIN to BCD
	assign BIN2BCD = Bin_2_BCD_output_Wire;
	

endmodule
