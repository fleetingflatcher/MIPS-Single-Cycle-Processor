module register (CLK, enable, in, out);

input wire CLK;
input wire enable;
input wire [31:0] in;

output reg [31:0] out;

always @ (negedge CLK)
begin
	if (enable)
		out <= in;
	else out <= out;
end

endmodule