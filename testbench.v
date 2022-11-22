`timescale 10us / 10us

module bench;

	reg [3:0] A;
	reg [3:0] B;
	reg sel;
	wire [3:0] result;

	mux_4_bit U0 (
		.a (A),
		.b (B),
		.sel (sel),
		.out (result) 
	);

	initial 
	begin
			B = 4'b1111;
			A = 4'b0000;
			sel = 1;
		#1 	A = 4'b0001;
			sel = 0;
		#1 	A = 4'b0010;
		#1	sel = 1;
		 	A = 4'b0100;
		#1	sel = 0;
		#1 	A = 4'b1000;
	end

endmodule