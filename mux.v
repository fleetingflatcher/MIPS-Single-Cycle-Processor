module mux_4b (a, b, sel, out);
	
	input wire [3:0] a;
	input wire [3:0] b;
	input wire sel;
	output wire [3:0] out;
	
	assign out = (sel) ? b : a;
	
endmodule

module mux_32b (a, b, sel, out);

	input wire [31:0] a;
	input wire [31:0] b;
	input wire sel;
	output wire [31:0] out;

	assign out = (sel) ? b : a;

endmodule