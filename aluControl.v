module aluControl (aluInstruct, instructFunc, aluOperationCode);

	input wire [1:0] aluInstruct;
	input wire [5:0] instructFunc;

	output reg [2:0] aluOperationCode;

	always @ (aluInstruct or instructFunc)
	begin
		case (aluInstruct)
			3'b00:
			begin
				aluOperationCode <= 3'b010;
			end
			3'b01:
			begin
				aluOperationCode <= 3'b110;
			end
			3'b10:
			begin
				if (instructFunc == 6'b100000) 
					aluOperationCode <= 3'b010;
				else if (instructFunc == 6'b100010) 
					aluOperationCode <= 3'b110;
				else 
					aluOperationCode <= 3'bZZZ;
			end
			3'b11:
			begin
				aluOperationCode <= 3'b010;
			end
		endcase
	end



endmodule