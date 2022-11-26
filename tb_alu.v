`timescale 10us / 10us

module testbench;

	reg [31:0] operand1;
	reg [31:0] operand2;
	reg [2:0] control;
	wire isZero;
	wire [31:0] result;

	ALU U0 (
		.operand1 (operand1),
		.operand2 (operand2),
		.ALU_control (control),
		.isZero (isZero),
		.result (result)
	);

	initial begin
		operand1 = 32'h0000_1010;
		operand2 = 32'h0000_1000;
		control = 3'b010;
		#1 control = 3'b110;
		#1 control = 3'b000;
		#1 control = 3'b001;
		#1 control = 3'b111;
		#1 operand2 = 32'h0001_0000;
		#1 control = 3'b110;
		operand2 = 32'h0000_1010;
		#1 ;
	end

endmodule