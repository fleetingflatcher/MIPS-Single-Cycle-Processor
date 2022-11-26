module decoder_5bit (operand, result);

input wire [4:0] operand;
output reg [31:0] result;

always @ (operand)
begin
	result[0] = (operand ==  5'b00000 ? 1 : 0);
	result[1] = (operand ==  5'b00001 ? 1 : 0);
	result[2] = (operand ==  5'b00010 ? 1 : 0);
	result[3] = (operand ==  5'b00011 ? 1 : 0);
	result[4] = (operand ==  5'b00100 ? 1 : 0);
	result[5] = (operand ==  5'b00101 ? 1 : 0);
	result[6] = (operand ==  5'b00110 ? 1 : 0);
	result[7] = (operand ==  5'b00111 ? 1 : 0);
	result[8] = (operand ==  5'b01000 ? 1 : 0);
	result[9] = (operand ==  5'b01001 ? 1 : 0);
	result[10] = (operand ==  5'b01010 ? 1 : 0);
	result[11] = (operand ==  5'b01011 ? 1 : 0);
	result[12] = (operand ==  5'b01100 ? 1 : 0);
	result[13] = (operand ==  5'b01101 ? 1 : 0);
	result[14] = (operand ==  5'b01110 ? 1 : 0);
	result[15] = (operand ==  5'b01111 ? 1 : 0);
	result[16] = (operand ==  5'b10000 ? 1 : 0);
	result[17] = (operand ==  5'b10001 ? 1 : 0);
	result[18] = (operand ==  5'b10010 ? 1 : 0);
	result[19] = (operand ==  5'b10011 ? 1 : 0);
	result[20] = (operand ==  5'b10100 ? 1 : 0);
	result[21] = (operand ==  5'b10101 ? 1 : 0);
	result[22] = (operand ==  5'b10110 ? 1 : 0);
	result[23] = (operand ==  5'b10111 ? 1 : 0);
	result[24] = (operand ==  5'b11000 ? 1 : 0);
	result[25] = (operand ==  5'b11001 ? 1 : 0);
	result[26] = (operand ==  5'b11010 ? 1 : 0);
	result[27] = (operand ==  5'b11011 ? 1 : 0);
	result[28] = (operand ==  5'b11100 ? 1 : 0);
	result[29] = (operand ==  5'b11101 ? 1 : 0);
	result[30] = (operand ==  5'b11110 ? 1 : 0);
	result[31] = (operand ==  5'b11111 ? 1 : 0);
end
endmodule