module MUX2T1_8(
	input wire s,
	input wire [7:0] I0,
	input wire [7:0] I1,
	output wire [7:0] o
);

	assign o = s? I1: I0;

endmodule
