module regFile (clock, writeEnable, reset, readAddress1, readAddress2, 
					writeAddress, writeData, read1, read2);

	input wire clock;
	input wire writeEnable;
	input wire reset;
	input wire [4:0] readAddress1;
	input wire [4:0] readAddress2;
	
	input wire [4:0] writeAddress;
	input wire [31:0] writeData;
	
	output wire [31:0] read1;
	output wire [31:0] read2;

	wire [31:0] outputNetwork [0:31];
	wire [31:0] decodedAddress;
	// Write addresses need to be decoded.
	// Decoded addresses look like this:
	//		10010 -> 	00000000_00000100_00000000_00000000
	//	as	   18 -> 	1,024
	//
	//		The number 18 refers to the register we want to write to.
	//		The 32-bit binary value 1,024 (radix 10) refers to a
	//		one-hot value which will address the proper register.
	decoder_5bit D0 (
		.operand (writeAddress),
		.result (decodedAddress)
	);

	generate
		genvar i;
		for (i = 0; i < 32; i = i + 1)
		begin
			register regs (
				// Single bit clock input.
				.clock (clock),
				// One bit, shared between all regs. Primes all registers
				.enabled (writeEnable),			// for writing when high.
				// One bit, shared between all regs. Erases all registers
				.reset (reset),					// when high.
				// 5 bits into the regFile, decoded to a single bit into
				.addressed (decodedAddress[i]),	// a particular register.
				// Data to be written if register is write-enabled
				.write (writeData),				// and addressed.
				// Stored value of register, always connected to regFile's
				.read (outputNetwork[i])		// output network.
			);
		end
	endgenerate

	// Read addresses do not need to be decoded.
	// Decoded addresses look like this:
	//		10010 -> 	00000000_00000100_00000000_00000000
	//	as	   18 -> 	1,024
	//
	//		The number 1,024 is not an index in any array.
	//		if instead we want to read from reg 18,
	//		we just refer to index 18 in the outputNetwork vector.

	assign read1 = outputNetwork[readAddress1];
	assign read2 = outputNetwork[readAddress2];
	
	//always @ (negedge clock) read1 <= outputNetwork[readAddress1];
	//always @ (negedge clock) read2 <= outputNetwork[readAddress2];
	

endmodule