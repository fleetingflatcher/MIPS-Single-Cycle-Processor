module ALU (operand1, operand2, ALU_control, isZero, result);

	input wire [31:0] operand1;
	input wire [31:0] operand2;
	input wire [2:0] ALU_control;
	output reg isZero;
	output reg [31:0] result;

	always @ (operand1 or operand2 or ALU_control)
	begin
	    case (ALU_control)
	    	3'b000: 	//and
			begin
	    	    result = operand1 & operand2;
			end
	    	3'b001: 	//or
			begin
	    	    result = operand1 | operand2;
			end
	    	3'b010: 	//add
			begin
	    	    result = operand1 + operand2;
			end
	    	3'b110: 	//sub
			begin
	    	    result = operand1 - operand2;
			end
	    	3'b111: 	//slt
			begin
	    	    result = operand1 < operand2; // order?
			end
	    	default:
	    	    result = 32'hZZZZ_ZZZZ;
		endcase
		if (result == 0) isZero = 1'b1;
		else isZero = 1'b0;
	end
endmodule
