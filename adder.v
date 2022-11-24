module adder (operand1, operand2, result);
	
	input wire [31:0] operand1;
	input wire [31:0] operand2;
	output wire [31:0] result;
	
	assign result = operand1 + operand2;
	
endmodule