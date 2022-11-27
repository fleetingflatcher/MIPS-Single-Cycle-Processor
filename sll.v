module sll_32b (operand, result);
	input wire [31:0] operand;
	output wire [31:0] result;
	
	assign result [31:1] 	= operand[30:0];
	assign result [0] 		= 0;
endmodule