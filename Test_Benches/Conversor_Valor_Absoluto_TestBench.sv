

module Conversor_Valor_Absoluto_TestBench();

   parameter Word_Length = 8;
   
	logic  [2*Word_Length-1:0] Product_Input;
	logic	 Sign_Input;
   logic  Ready_Input;
	
	logic [2*Word_Length-1:0] Product_Converted_Output;

   
   Conversor_Valor_Absoluto#(Word_Length) dut(.*);
   
   initial begin
      
		Ready_Input = 0; Product_Input = -1;
		
		Sign_Input = Product_Input[Word_Length-1];
		
		#10;
      
		Ready_Input = 1; Product_Input = -1;
		
		Sign_Input = Product_Input[Word_Length-1];
		
		#10;      
		
		Ready_Input = 0; Product_Input = 1;
		
		Sign_Input = Product_Input[Word_Length-1];
		
		#10;
 
		Ready_Input = 1; Product_Input = 1;
		
		Sign_Input = Product_Input[Word_Length-1];
		
		#10; 

		Ready_Input = 0; Product_Input = -1024;
		
		Sign_Input = Product_Input[Word_Length-1];
		
		#10;		
		
		
		Ready_Input = 1; Product_Input = -1024;
		
		Sign_Input = Product_Input[Word_Length-1];
		
		#10;	
      
		Ready_Input = 0; Product_Input = 1024;
		
		Sign_Input = Product_Input[Word_Length-1];
		
		#10;      
      
		Ready_Input = 1; Product_Input = 1024;
		
		Sign_Input = Product_Input[Word_Length-1];
		
		#10;       
		
      
      $stop;
   
   end
endmodule
