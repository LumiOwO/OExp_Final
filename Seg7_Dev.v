module Seg7_Dev(
	input wire [2:0] Scan,
	input wire SW0,
	input wire flash,
	input wire [31:0] Hexs,
	input wire [7:0] point,
	input wire [7:0] LES,
	output wire [7:0] SEGMENT,
	output wire [3:0] AN
);
	
	wire [3:0] Hexo;
	wire p;
	wire LE;

	wire [15:0] Hexs_now;
	wire [3:0] point_now;
	wire [3:0] LES_now;
	assign Hexs_now = Scan[2]? Hexs[31:16]: Hexs[15:0];
	assign point_now = Scan[2]? point[7:4]: point[3:0];
	assign LES_now = Scan[2]? LES[7:4]: LES[3:0];

	Scansync M2(
		.Hexs(Hexs_now),
		.Scan(Scan[1:0]),
		.point(point_now),
		.LES(LES_now),
		.Hexo(Hexo),
		.p(p),
		.LE(LE),
		.AN(AN)
	);

	wire [7:0] SEG_TXT;

	MyMC14495 M1(
		.D0(Hexo[0]),
		.D1(Hexo[1]),
		.D2(Hexo[2]),
		.D3(Hexo[3]),
		.LE(LE & flash),
		.point(p),
		.a(SEG_TXT[0]),
		.b(SEG_TXT[1]),
		.c(SEG_TXT[2]),
		.d(SEG_TXT[3]),
		.e(SEG_TXT[4]),
		.f(SEG_TXT[5]),
		.g(SEG_TXT[6]),
		.p(SEG_TXT[7])
	);

	wire [7:0] Seg_map;
	Seg_map M3(
		.Hexs(Hexs),
		.Scan(Scan),
		.Seg_map(Seg_map)
	);

	MUX2T1_8 M(
		.s(SW0),
		.I1(SEG_TXT),
		.I0(Seg_map),
		.o(SEGMENT)
	);

endmodule