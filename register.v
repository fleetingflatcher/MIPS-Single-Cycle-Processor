module register (CLK, enabled, addressed, write, read);

input wire CLK;
input wire enabled;
input wire addressed;
input wire [31:0] write;

output reg [31:0] read;

always @ (negedge CLK)
begin
	if (enabled&addressed)
		read <= write;
	else read <= read;
end

endmodule