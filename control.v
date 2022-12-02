module control (instructionBits, writeRegAddressSource, jumpEnable, branchEnable, memReadEnable, writeRegFromMem, 
				aluInstruct, enableWriteToDataMemory, aluSourceImmediate, writeRegEnable);

	input wire [5:0] instructionBits;		// Bits from instruction required to determine all control signals. 

	output reg writeRegAddressSource;		// set to 1 for 3 register R-instruction.
											// if 1, writeReg address is taken from bits [15:11]
											// if 0, writeReg address is duplicated from 2nd readReg address

	output reg jumpEnable;					// if 1, jump instruction. unconditionally divert control 
											// path for program counter away from PC + 4

	output reg branchEnable;				// compared with zero output of ALU for BEQ and BNE

	output reg memReadEnable;				// if 0, data memory output is high-impedance

	output reg writeRegFromMem;				// if 1, any register write 

	output reg [1:0] aluInstruct;			// ALU instruction code. supplemented with `func` bits
											// by ALUController if necessary 

	output reg enableWriteToDataMemory;		// if 1, data memory is written to.

	output reg aluSourceImmediate;			// if 1, an immediate value is taken as ALU operand B

	output reg writeRegEnable;				// if 1, a register is written to.

	always @ * 
	begin

		// Update 12/1/2022:
		//		Only the control logic for the required functions:
		//			{	R-instruction
		//				lw, sw
		//				beq, j
		//				addi			}
		//		has been implemented. Further implementation required.	}
		
		case (instructionBits) 
			6'b000000: 	// R-instruction
			begin 
				writeRegAddressSource	<= 1'b1;
				jumpEnable				<= 1'b0;
				branchEnable			<= 1'b0;
				memReadEnable			<= 1'b0;
				writeRegFromMem			<= 1'bX;
				aluInstruct				<= 2'b10;
				enableWriteToDataMemory	<= 1'b0;
				aluSourceImmediate		<= 1'b0;
				writeRegEnable			<= 1'b1;
			end
			6'b001000: 	// Immediate;	addi
			begin 
				writeRegAddressSource	<= 1'b0;
				jumpEnable				<= 1'b0;
				branchEnable			<= 1'b0;
				memReadEnable			<= 1'b0;
				writeRegFromMem			<= 1'bX;
				aluInstruct				<= 2'b11;
				enableWriteToDataMemory	<= 1'b0;
				aluSourceImmediate		<= 1'b1;
				writeRegEnable			<= 1'b1;
			end
			6'b100011:	// lw
			begin
				writeRegAddressSource	<= 1'b0;
				jumpEnable				<= 1'b0;
				branchEnable			<= 1'b0;
				memReadEnable			<= 1'b1;
				writeRegFromMem			<= 1'b1;
				aluInstruct				<= 2'b00;
				enableWriteToDataMemory	<= 1'b0;
				aluSourceImmediate		<= 1'b1;
				writeRegEnable			<= 1'b1;
			end
			6'b101011:	// sw
			begin
				writeRegAddressSource	<= 1'bX;
				jumpEnable				<= 1'b0;
				branchEnable			<= 1'b0;
				memReadEnable			<= 1'b0;
				writeRegFromMem			<= 1'bX;
				aluInstruct				<= 2'b00;
				enableWriteToDataMemory	<= 1'b1;
				aluSourceImmediate		<= 1'b1;
				writeRegEnable			<= 1'b0;
			end
			6'b000100:	// beq
			begin
				writeRegAddressSource	<= 1'bX;
				jumpEnable				<= 1'b0;
				branchEnable			<= 1'b1;
				memReadEnable			<= 1'b0;
				writeRegFromMem			<= 1'bX;
				aluInstruct				<= 2'b01;
				enableWriteToDataMemory	<= 1'b0;
				aluSourceImmediate		<= 1'b0;
				writeRegEnable			<= 1'b0;
			end
			6'b000010:	// j
			begin
				writeRegAddressSource	<= 1'b0;
				jumpEnable				<= 1'b1;
				branchEnable			<= 1'b0;
				memReadEnable			<= 1'b0;
				writeRegFromMem			<= 1'bX;
				aluInstruct				<= 2'b00;
				enableWriteToDataMemory	<= 1'b0;
				aluSourceImmediate		<= 1'b0;
				writeRegEnable			<= 1'b0;
			end
		endcase
	end

endmodule