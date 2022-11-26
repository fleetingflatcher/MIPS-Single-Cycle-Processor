`timescale 10us / 10us

module testbench;

	reg [4:0] operand;
	wire [31:0] result;

	decoder_5bit U0 (
		.operand (operand),
		.result (result)
	);

	initial begin
		operand = 5'b00101;
		#1 operand = 5'b10010;
		#1 operand = 5'b11100;
		#1 operand = 5'b00000;
		#1 operand = 5'b10101;
	end

endmodule