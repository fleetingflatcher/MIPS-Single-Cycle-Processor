`timescale 10us / 10us

module testbench;

reg CLK;
reg writeEnable;
reg [31:0] getAddress1;
reg [31:0] getAddress2;
reg [4:0] writeAddress;
reg [31:0] writeData;

wire [31:0] read1;
wire [31:0] read2;

regFile U0 (
	.CLK 			(CLK), 
	.writeEnable 	(writeEnable), 
	.getAddress1 	(getAddress1), 
	.getAddress2 	(getAddress2), 
	.writeAddress 	(writeAddress), 
	.writeData 		(writeData),
	.read1 			(read1),
	.read2 			(read2)
);

always
begin
	#2 CLK = ~CLK;
end
initial
begin
		CLK = 1'b0;
		writeEnable = 1'b1;
	#1 	writeAddress = 5'b00000;
		writeData = 32'h0000_0000;
	#4	writeAddress = 5'b00001;
	#4	writeAddress = 5'b00010;
end

endmodule