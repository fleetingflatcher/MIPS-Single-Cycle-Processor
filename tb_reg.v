`timescale 1us / 1us

module testbench;

	reg [31:0] in;
	wire [31:0] out;
	reg enable;
	reg clock;

	register U0 (
		.CLK (clock),
		.enable (enable),
		.in (in),
		.out (out)
	);

	always begin
		#2 clock = ~clock;
	end
	initial begin
		clock = 0;
		in = 32'hFFFF_1111;
		enable = 0;
		#5 	enable = 1;
		#10 enable = 0;
		#1	in = 32'h0000_0001;
		#4	enable = 1;
		#2 	in = 32'h0001_0001;
		#3	enable = 0;
		#1	in = 32'hF001_0001;
	end

endmodule