module Ext_32(
	input wire [15:0] imm_16,
	output wire [31:0] Imm_32
);

	wire [15:0] ext;
	assign ext = imm_16[15]? 16'hFFFF: 16'h0000;
	assign Imm_32 = { ext, imm_16 };

endmodule
