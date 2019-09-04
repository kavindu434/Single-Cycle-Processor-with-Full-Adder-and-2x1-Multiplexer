`timescale 1ns/1ps

module test_cpu();
	
	reg reset;
	reg clk;
	 reg A,B,Cin;
 wire S,Cout; 
wire [9:0] SW, LEDR; 

reg in0, in1, sel;
wire out;
 
CPU DUT(SW, LEDR);
 
assign SW[0] = in0;
assign SW[1] = in1;
assign SW[2] = sel;
 
assign out = LEDR[0];

assign SW[7] = A;
assign SW[8] = B;
assign SW[9] = Cin;
 
assign Cout = LEDR[8];
assign S = LEDR[9];

	CPU cpu1(reset, clk);
	
	initial begin
		reset = 0;
		clk = 1;
		#100 reset = 0;
		
		      sel = 0; in1 = 0; in0 = 0;
    #10     sel = 0; in1 = 0; in0 = 1;
    #10     sel = 0; in1 = 1; in0 = 0;
    #10     sel = 0; in1 = 1; in0 = 1;
    #10     sel = 1; in1 = 0; in0 = 0;
    #10     sel = 1; in1 = 0; in0 = 1;
    #10     sel = 1; in1 = 1; in0 = 0;
    #10     sel = 1; in1 = 1; in0 = 1;
    #10     $stop;
	 
	 A = 0;
   B = 0;
   Cin = 0;
   #10;
   A = 0;
   B = 0;
   Cin = 1;
   #10;  
   A = 0;
   B = 1;
   Cin = 0;
   #10;
   A = 0;
   B = 1;
   Cin = 1;
   #10;
   A = 1;
   B = 0;
   Cin = 0;
   #10;
   A = 1;
   B = 0;
   Cin = 1;
   #10;
   A = 1;
   B = 1;
   Cin = 0;
   #10;  
   A = 1;
   B = 1;
   Cin = 1;
   #10;
end
	
	always #50 clk = ~clk;
		
endmodule
