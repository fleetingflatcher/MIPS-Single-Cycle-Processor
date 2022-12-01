`timescale 1us / 1us

module testbench;

	reg [31:0] write;
	reg addressed;
	reg enable;
	reg clock;

	wire [31:0] read;
	
	register U0 (
		.CLK (clock),
		.enabled (enable),
		.addressed (addressed),
		.write (write),
		.read (read)
	);

	always begin
		#2 clock = ~clock;
	end
	initial begin
		clock = 0;
		write = 32'hFFFF_1111;
		addressed = 1;
		enable = 0;
		#5 	enable = 1;
		#5  enable = 0;
		#5	write = 32'h0000_0001;
		#5	enable = 1;
		#5 	write = 32'h0001_0001;
		#5	enable = 0;
		#5	write = 32'hF001_0001;
		#5	addressed = 0;
		#5	enable = 1;
		#5 	addressed = 1;
		#5	$finish;
	end

endmodule