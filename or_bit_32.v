module or_bit_32(
	input wire [31:0] A,
	output wire O
);

	assign O = |A;

endmodule