`timescale 1us / 1us
module topLevel (clock, reset, enablePC);

	// Universal wires
	input wire			clock;
	input wire			reset;

	// ALU wires
	wire	[31:0]		operand1;
	wire	[31:0]		operand2;
	wire	[2:0]		aluOperationCode;
	wire				isZero;
	wire	[31:0]		result;
	// ALU Control wires
	wire				aluSourceImmediate;
	wire	[1:0]		aluInstruct;
	
	wire	[31:0]		signExtendedImmediate;

	// RegFile wires
	wire				writeRegEnable;
	wire				writeRegAddressSource;
	wire	[4:0]		writeRegAddress;

	wire	[31:0]		regRead2;
	wire	[31:0]		regWriteData;

	// Instruction Memory & Program Counter
	wire	[31:0]		currentInstruction;
	input wire			enablePC;
	wire 	[4:0]		PC;
	
	wire	[4:0]		PCplus4;
	wire	[4:0]		writePC;
	
	// temporary use connections
	wire	_unnecessaryOutput;
	assign regWriteData = 32'h1234_ABCD;
	assign writePC = PCplus4;

	control U0 (
		.instructionBits(currentInstruction[31:26]), 
		.writeRegAddressSource(writeRegAddressSource), 
		.jumpEnable(_unnecessaryOutput), 
		.branchEnable(_unnecessaryOutput), 
		.memReadEnable(_unnecessaryOutput), 
		.writeRegFromMem(_unnecessaryOutput), 
		.aluInstruct(aluInstruct), 
		.enableWriteToDataMemory(_unnecessaryOutput), 
		.aluSourceImmediate(aluSourceImmediate), 
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
		.address(PC), 
		.currentInstruction(currentInstruction)
	);
	
	mux_5b M2 (
		.a(currentInstruction[20:16]), 
		.b(currentInstruction[15:11]), 
		.sel(writeRegAddressSource), 
		.out(writeRegAddress)
	);

	regFile U4 (
		.clock(clock), 
		.writeEnable(writeRegEnable), 
		.reset(reset), 
		.readAddress1(currentInstruction[25:21]), 
		.readAddress2(currentInstruction[20:16]), 
		.writeAddress(writeRegAddress),
		.writeData(regWriteData), 
		.read1(operand1), 
		.read2(regRead2)
	);

	programCounter U5 (
		.clock(clock),
		.reset(reset),
		.enable(enablePC),
		.write(writePC),
		.read(PC)
	);

	adder U6 (
		.operand1(PC),
		.operand2(5'b00100),
		.result(PCplus4)
	);
endmodule