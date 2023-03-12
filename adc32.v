module adc32(
	input wire C0,
	input wire [31:0] A,
	input wire [31:0] B,
	output wire [32:0] S
);

	assign S = { 1'b0, A } + { C0, B } + { 32'b0, C0 };
	
endmodule