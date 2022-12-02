module programCounter (CLK, write, reset, read);

input wire CLK;
input wire [4:0] write;
input reset;

output reg [4:0] read;

always @ (posedge CLK)
begin
	if (enable) read <= write;
	else read <= read;
end
always @ (posedge reset)
begin
	if (reset) read = 0;
end

endmodule