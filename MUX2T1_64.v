module MUX2T1_64(
	input wire s,
	input wire [63:0] I0,
	input wire [63:0] I1,
	output wire [63:0] o
);

	assign o = s? I1: I0;

endmodule
