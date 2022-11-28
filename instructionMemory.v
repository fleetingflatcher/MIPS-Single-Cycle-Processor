module instructionMemory (address, currentInstruction);

	input wire [5:0] address;
	output reg [31:0] currentInstruction;
	
	reg [7:0] mem [127:0];
	
	initial
	begin
		mem[0] = 8'h21; mem[1] = 8'h08; mem[2] = 8'h00; mem[3] = 8'h02;
		mem[4] = 8'h21;	mem[5] = 8'h4a;	mem[6] = 8'h00;	mem[7] = 8'h02;
	end

	always@* currentInstruction = mem[address];

endmodule