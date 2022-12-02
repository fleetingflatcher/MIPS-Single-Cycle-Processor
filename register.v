module register (CLK, enabled, reset, addressed, write, read);

input wire CLK;
input wire enabled;
input wire reset;
input wire addressed;
input wire [31:0] write;

output reg [31:0] read;

always @ (negedge CLK)
begin
	if (enabled&addressed)
		read <= write;
	else read <= read;
end

always @ (reset)
begin
	if (reset) read <= 32'h0000_0000;
end

endmodule