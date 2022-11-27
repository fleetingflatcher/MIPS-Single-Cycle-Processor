`timescale 10us / 10us

module testbench;

reg CLK;
reg writeEnable;
reg [31:0] readAddress1;
reg [31:0] readAddress2;
reg [4:0] writeAddress;
reg [31:0] writeData;

wire [31:0] read1;
wire [31:0] read2;

regFile U0 (
	.CLK 			(CLK), 
	.writeEnable 	(writeEnable), 
	.readAddress1 	(readAddress1), 
	.readAddress2 	(readAddress2), 
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
	#5 	writeAddress = 5'b00000;
	#5	writeData = 32'h0000_0000;
	#5	writeAddress = 5'b00001;
	#5	writeAddress = 5'b00010;
	#5	writeAddress = 5'b00011;
	#5 	readAddress1 = 5'b00000;
		readAddress2 = 5'b00001;
		writeAddress = 5'b00100;
		writeData = 32'h0001_0000;
	#5	writeEnable = 1'b0;
		writeAddress = 5'b00101;
	#5	readAddress1 = 5'b00100;
		readAddress2 = 5'b00101;
	#10 $finish;
end

endmodule