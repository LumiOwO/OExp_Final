module SignalExt_32(
	input wire S,
	output wire [31:0] So
);

	assign So = { 32{S} };

endmodule