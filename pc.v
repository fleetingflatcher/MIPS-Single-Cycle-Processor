module programCounter (CLK, write, read);

input wire CLK;
input wire [31:0] write;

output reg [31:0] read;

always @ (posedge CLK)
begin
	if (enable) read <= write;
	else read <= read;
end


endmodule