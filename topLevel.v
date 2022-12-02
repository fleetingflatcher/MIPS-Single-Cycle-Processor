`timescale 1us / 1us
module topLevel;

	// Universal wires
	wire				clock;
	wire				reset;

	// ALU wires
	wire	[31:0]		operand1;
	wire	[31:0]		operand2;
	wire	[2:0]		aluOperationCode;
	wire				isZero;
	wire	[31:0]		result;
	// ALU Control wires
	wire	[1:0]		aluInstruct;

	wire	[31:0]		signExtendedImmediate;

	// RegFile wires
	wire				writeRegEnable;
	wire				writeRegAddressSource;
	wire				writeRegAddress;
//	wire	[31:0]		regRead1; 	// unneeded
	wire	[31:0]		regRead2;
	wire	[31:0]		regWrite;

	wire	[31:0]		currentInstruction;
	reg 	[4:0]		pretendPC;

	

	wire	_unnecessaryOutput;

	control U0 (
		.instructionBits(currentInstruction[31:26]), 
		.writeRegAddressSource(writeRegAddressSource), 
		.jumpEnable(_unnecessaryOutput), 
		.branchEnable(_unnecessaryOutput), 
		.memReadEnable(_unnecessaryOutput), 
		.writeRegFromMem(_unnecessaryOutput), 
		.aluInstruct(aluInstruct), 
		.enableWriteToDataMemory(_unnecessaryOutput), 
		.aluSourceImmediate(_unnecessaryOutput), 
		.writeRegEnable(writeRegEnable)
	);

	aluControl U1 (
		.aluInstruct(aluInstruct),
		.instructFunc(currentInstruction[5:0]),
		.aluOperationCode(aluOperationCode)
	);

	signExtend E1 (
		.operand(currentInstruction[15:0]),
		.result(signExtendedImmediate)
	);

	mux_32b M1 (
		.a(regRead2),
		.b(signExtendedImmediate),
		.sel(aluSourceImmediate),
		.out(operand2)
	);

	ALU U2 (
		.operand1(operand1),
		.operand2(operand2),
		.aluOperationCode(aluOperationCode),
		.isZero(isZero),
		.result(result)
	);

	instructionMemory U3 (
		.address(pretendPC), 
		.currentInstruction(currentInstruction)
	);
	
	mux_5b M2 (
		.a(currentInstruction[20:16]), 
		.b(currentInstruction[15:11]), 
		.sel(writeRegAddressSource), 
		.out(writeRegAddress)
	);

	regFile U4 (
		.CLK(clock), 
		.writeEnable(writeRegEnable), 
		.reset(reset), 
		.readAddress1(currentInstruction[25:21]), 
		.readAddress2(currentInstruction[20:16]), 
		.writeAddress(writeRegAddress),
		.writeData(regWrite), 
		.read1(operand1), 
		.read2(regRead2)
	);

endmodule