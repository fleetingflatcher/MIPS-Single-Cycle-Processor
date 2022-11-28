module dataMemory (address, writeEnable, dataInput, dataOutput);

	input wire writeEnable;
	input wire [7:0] address;
	input wire [31:0] dataInput;

	output reg [31:0] dataOutput;
	
	reg [31:0] mem [0:255];
	
	assign dataOutput = mem[address];

endmodule