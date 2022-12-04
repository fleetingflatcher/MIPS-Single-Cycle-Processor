module adder_5b (operand1, operand2, result);
	
	input wire [4:0] operand1;
	input wire [4:0] operand2;
	output wire [4:0] result;
	
	assign result = operand1 + operand2;

endmodule


module adder_32b (operand1, operand2, result);

	input wire [31:0] operand1;
	input wire [31:0] operand2;
	output wire [31:0] result;

	assign result = operand1 + operand2;

endmodule