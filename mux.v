module mux_5b (a, b, sel, out);
	
	input wire [4:0] a;
	input wire [4:0] b;
	input wire sel;
	output wire [4:0] out;
	
	assign out = (sel) ? b : a;
	
endmodule

module mux_32b (a, b, sel, out);

	input wire [31:0] a;
	input wire [31:0] b;
	input wire sel;
	output wire [31:0] out;

	assign out = (sel) ? b : a;

endmodule