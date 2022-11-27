module regFile (CLK, writeEnable, getAddress1, getAddress2, writeAddress, writeData, read1, read2);

	input wire CLK;
	input wire writeEnable;
	input wire [4:0] getAddress1;
	input wire [4:0] getAddress2;
	
	input wire [4:0] writeAddress;
	input wire [31:0] writeData;
	
	output wire [31:0] read1;
	output wire [31:0] read2;

	wire [31:0] outputNetwork [0:31];
	wire [31:0] decodedAddress;

	decoder_5bit D0 (
		.operand (writeAddress),
		.result (decodedAddress)
	);

	generate
		genvar i;
		for (i = 1; i < 32; i = i + 1)
		begin
			register regs (
				.CLK (CLK),
				.enabled (writeEnable),	// this line isn't right
				.addressed (writeAddress),
				.write (writeData),
				.read (outputNetwork[i])	
			);
		end
	endgenerate

endmodule