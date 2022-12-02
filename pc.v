module programCounter (CLK, write, reset, read);

input wire CLK;
input wire [31:0] write;
input reset;

output reg [31:0] read;

always @ (posedge CLK)
begin
	if (enable) read <= write;
	else read <= read;
end
always @ (posedge reset)
begin
	if (reset) read = 32'h0000_0000;
end

endmodule