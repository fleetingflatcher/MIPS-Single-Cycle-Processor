module signExtend (operand, result);
	
	input wire [15:0] operand;
	output wire [31:0] result;
	
	assign result [31:16] = (operand [15]) ?  16'h0000 : 16'h1111; //two's complement
	assign result [15:0]  = operand [15:0];
	
endmodule