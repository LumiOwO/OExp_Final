module SSeg7_Dev(
	input wire clk,
	input wire rst,
	input wire Start,
	input wire SW0,
	input wire flash,
	input wire [31:0] Hexs,
	input wire [7:0] point,
	input wire [7:0] LES,
	output wire seg_clk,
	output wire seg_sout,
	output wire SEG_PEN,
	output wire seg_clrn
);
	
	wire [63:0] SEG_TXT;
	wire [63:0] Seg_map;
	wire [63:0] P_Data;

	HexTo8SEG hextoseg(
		.flash(flash),
		.Hexs(Hexs),
		.points(point),
		.LES(LES),
		.SEG_TXT(SEG_TXT)
	);

	SSeg_Map map(
		.Disp_num({Hexs[31:0], Hexs[31:0]}),
		.Seg_map(Seg_map)
	);

	MUX2T1_64 mux(
		.s(SW0),
		.I0(Seg_map),
		.I1(SEG_TXT),
		.o(P_Data)
	);

	P2S p2s(
		.clk(clk),
		.rst(rst),
		.Serial(Start),
		.P_Data(P_Data),
		.s_clk(seg_clk),
		.sout(seg_sout),
		.EN(SEG_PEN),
		.s_clrn(seg_clrn)

	);

endmodule