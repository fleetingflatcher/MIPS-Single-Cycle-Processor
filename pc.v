module programCounter (clock, reset, enable, write, read);

input wire clock;
input wire enable;
input wire [4:0] write;
input reset;

output reg [4:0] read;

always @ (posedge clock)
begin
	if (enable) read <= write;
	else read <= read;
end
always @ (posedge reset)
begin
	if (reset) read = 0;
end

endmodule