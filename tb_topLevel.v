`timescale 1us / 1us

module tb_topLevel;

	reg 			clock;
	reg 			reset;
	reg				enablePC;

	// Cherry-picked Monitors
	wire	[31:0]	CurrentInstruction;
	wire 			Reg8;
	wire 	[31:0]	ALU_Operand1;
	wire 	[31:0]	ALU_Operand2;

	assign	CurrentInstruction = CPU.U3.currentInstruction;
	assign 	Reg8 = CPU.U4.outputNetwork[8];
	assign	ALU_Operand1 = CPU.U2.operand1;
	assign 	ALU_Operand2 = CPU.U2.operand2;

	topLevel CPU (
		.clock(clock),
		.reset(reset),
		.enablePC(enablePC)
	);

	always	#1	clock = ~clock;

	initial
	begin
			clock = 1'b0;
			reset = 1'b0;
			enablePC = 1'b0;
		#1	reset = 1'b1;
		#1	reset = 1'b0;
		#1	enablePC = 1'b1;
	end

endmodule