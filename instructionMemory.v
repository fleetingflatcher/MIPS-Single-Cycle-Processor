module instructionMemory (address, currentInstruction);

	input wire [5:0] address;
	output reg [31:0] currentInstruction;
	
	reg [7:0] mem [127:0];
	
	initial
	begin
		mem[ 0] = 8'h21;	mem[ 1] = 8'h08;	mem[ 2] = 8'h00;	mem[ 3] = 8'h02; // addi $t2 $t2 2 
		mem[ 4] = 8'h01;	mem[ 5] = 8'h0a;	mem[ 6] = 8'h40;	mem[ 7] = 8'h20; // add  $t0 $t0 $t2
		mem[ 8] = 8'had;	mem[ 9] = 8'h28;	mem[10] = 8'h00;	mem[11] = 8'h00; // sw   $t0 0($t1)
		mem[12] = 8'h08;	mem[13] = 8'h00;	mem[14] = 8'h00;	mem[15] = 8'h01; // j to iMem position 4?
	end

	always@* currentInstruction = mem[address];

endmodule