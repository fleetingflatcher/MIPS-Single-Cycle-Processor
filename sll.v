module sll_16b (operand, result);
input [15:0] operand;
output [15:0] result;

wire [15:0] operand;
wire [15:0] result;

assign result [15:1] 	= operand[14:0];
assign result [0] 		= 0;

endmodule