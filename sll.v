module sll_16_bit (in, out);
input [15:0] in;
output [15:0] out;

wire [15:0] in;
wire [15:0] out;

assign out [15:1] 	= in[14:0];
assign out [0] 		= 0;

endmodule