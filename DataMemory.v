
module DataMemory(reset, clk, Address, Write_data, Read_data, MemRead, MemWrite, A, B, Cin, Cout, S, in0, in1, sel, out);
	input reset, clk, A, B, Cin, in0, in1, sel;
	input [31:0] Address, Write_data;
	input MemRead, MemWrite;
	output [31:0] Read_data, S, Cout, out;
	
	parameter RAM_SIZE = 256;
	parameter RAM_SIZE_BIT = 8;
	
	reg [31:0] RAM_data[RAM_SIZE - 1: 0];
	assign Read_data = MemRead? RAM_data[Address[RAM_SIZE_BIT + 1:2]]: 32'h00000000;
	
	integer i;
	always @(posedge reset or posedge clk)
		if (reset)
			for (i = 0; i < RAM_SIZE; i = i + 1)
				RAM_data[i] <= 32'h00000000;
		else if (MemWrite)
			RAM_data[Address[RAM_SIZE_BIT + 1:2]] <= Write_data;
	
	
	 wire a1, a2, a3;    
		xor u1(a1,A,B);
	 and u2(a2,A,B);
	 and u3(a3,a1,Cin);
	 or u4(Cout,a2,a3);
		 xor u5(S,a1,Cin);	
		 
		 
	wire nsel;
    wire A0, A1;
 
    not not1(nsel, sel);
    and and1(A0, in0, nsel);
    and and2(A1, in1, sel);
    or  or1 (out, A0, A1);
	 
endmodule
