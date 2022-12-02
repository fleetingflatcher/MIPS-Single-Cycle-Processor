`timescale 1us / 1us
module topLevel;

	wire 	[31:0] 		operand1;
	wire 	[31:0] 		operand2;
	wire 	[2:0] 		aluOperationCode;
	wire				isZero;
	wire	[31:0]		result;

	
	wire	[1:0] 		aluInstruct;

	reg 	[31:0]		instruction;

	wire	_unnecessaryOutput;

	control U0 (
		.instructionBits(instruction[31:26]), 
		.writeRegAddressSource(_unnecessaryOutput), 
		.jumpEnable(_unnecessaryOutput), 
		.branchEnable(_unnecessaryOutput), 
		.memReadEnable(_unnecessaryOutput), 
		.writeRegFromMem(_unnecessaryOutput), 
		.aluInstruct(aluInstruct), 
		.enableWriteToDataMemory(_unnecessaryOutput), 
		.aluSourceImmediate(_unnecessaryOutput), 
		.writeRegEnable(_unnecessaryOutput)
	);

	aluControl U1 (
		.aluInstruct(aluInstruct),
		.instructFunc(instruction[5:0]),
		.aluOperationCode(aluOperationCode)
	);

	ALU U2 (
		.operand1(operand1),
		.operand2(operand2),
		.aluOperationCode(aluOperationCode),
		.isZero(isZero),
		.result(result)
	);


endmodule