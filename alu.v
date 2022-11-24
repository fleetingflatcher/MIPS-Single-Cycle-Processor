module ALU (operand1, operand2, ALU_opcode, isZero, result);

input wire [31:0] operand1;
input wire [31:0] operand2;
input reg [2:0] ALU_control;
output wire isZero;
output wire [31:0] result;

always
	begin
	    case (ALU_control)
	    3'b000: //and
	    begin
	        result = operand1 & operand2;
	    end
	    3'b001: //or
	    begin
	        result = operand1 | operand2;
	    end
	    3'b010: //add
	    begin
	        result = operand1 + operand2;
	    end
	    3'b110: //sub
	    begin
	        result = operand1 - operand2;
	    end
	    3'b111: //slt
	    begin
	        result = operand1 < operand2; // order?
	    end
	    default:
	        result = 32'hXXXX_XXXX;
	end
endmodule
