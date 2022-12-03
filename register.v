module register (clock, enabled, reset, addressed, write, read);

input wire clock;
input wire enabled;
input wire reset;
input wire addressed;
input wire [31:0] write;

output reg [31:0] read;

always @ (negedge clock)
begin
	if (enabled&addressed)
		read <= write;
	else read <= read;
end

always @ (posedge reset)
begin
	read <= 32'h0000_0000;
end

endmodule