module aluControl (aluInstruct, instructFunc, aluOperationCode);

	input wire [1:0] aluInstruct;
	input wire [5:0] instructFunc;

	output reg [2:0] aluOperationCode;

	always @ (aluInstruct or instructFunc)
	begin
		case (aluInstruct)
			3'b00:
			begin
				aluOperationCode <= 3'b000;
			end
			3'b01:
			begin
				aluOperationCode <= 3'b001;
			end
			3'b10:
			begin
				if (instructFunc == 6'b100000) 
					aluOperationCode <= 3'b000;
				else if (instructFunc == 6'b100010) 
					aluOperationCode <= 3'b001;
				else 
					aluOperationCode <= 3'bZZZ;
			end
			3'b11:
			begin
				aluOperationCode <= 3'b000;
			end
		endcase
	end



endmodule