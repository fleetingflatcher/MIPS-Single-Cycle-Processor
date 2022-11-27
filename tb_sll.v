module testbench;

reg [31:0] bench_testInput;
wire [31:0] bench_monitor;

sll_32b U0 (
	.operand (bench_testInput),
	.result (bench_monitor)
);

initial begin
		bench_testInput = 32'hFFFF_0001;
	#1	bench_testInput = 32'h0000_0001;
	#1	bench_testInput = 32'h0001_0001;
	#1	bench_testInput = 32'h1010_0001;
end

endmodule