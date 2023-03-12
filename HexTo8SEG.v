module HexTo8SEG(
	input wire flash,
	input wire [31:0] Hexs,
	input wire [7:0] points,
	input wire [7:0] LES,
	output wire [63:0] SEG_TXT
);

	generate
		genvar i;
		for(i=0; i<8; i=i+1) begin: hextoseg
			MyMC14495 m(
				.D0(Hexs[32 - 4*i - 4]),
				.D1(Hexs[32 - 4*i - 3]),
				.D2(Hexs[32 - 4*i - 2]),
				.D3(Hexs[32 - 4*i - 1]),
				.LE(LES[7-i] & flash),
				.point(points[7-i]), 
				.a(SEG_TXT[8*i + 7]),
				.b(SEG_TXT[8*i + 6]),
				.c(SEG_TXT[8*i + 5]),
				.d(SEG_TXT[8*i + 4]),
				.e(SEG_TXT[8*i + 3]),
				.f(SEG_TXT[8*i + 2]),
				.g(SEG_TXT[8*i + 1]),
				.p(SEG_TXT[8*i + 0])
			);
		end
	endgenerate
	
endmodule
