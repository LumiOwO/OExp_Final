module MUX2T1_32(
	input wire s,
	input wire [31:0] I0,
	input wire [31:0] I1,
	output wire [31:0] o
);

	assign o = s? I1: I0;

endmodule
