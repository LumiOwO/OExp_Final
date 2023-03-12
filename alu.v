module alu(
	input wire [31:0] A,
	input wire [31:0] B,
	input wire [2:0] ALU_operation,
	output wire [31:0] res,
	output wire zero,
	output wire overflow
);

	wire [31:0] res_and;
	wire [31:0] res_or;
	wire [31:0] res_add;
	wire [31:0] res_sub;
	wire [31:0] res_slt;
	wire [31:0] res_nor;
	wire [31:0] res_srl;
	wire [31:0] res_xor;

	and32 and32(
		.a(A),
		.b(B),
		.c(res_and)
	);
	or32 or32(
		.a(A),
		.b(B),
		.c(res_or)
	);

	wire [31:0] ext;
	wire [31:0] B_temp;
	wire [32:0] S;
	SignalExt_32 signal_ext(
		.S(ALU_operation[2]),
		.So(ext)
	);
	xor32 xor_adc(
		.a(ext),
		.b(B),
		.c(B_temp)
	);
	adc32 adc32(
		.C0(ALU_operation[2]),
		.A(A),
		.B(B_temp),
		.S(S)
	);
	assign res_add = S[31:0];
	assign res_sub = S[31:0];
	assign res_slt = { 31'b0, S[32] };

	xor32 xor32(
		.a(A),
		.b(B),
		.c(res_xor)
	);
	nor32 nor32(
		.a(A),
		.b(B),
		.c(res_nor)
	);
	srl32 srl32(
		.a(A),
		.b(B),
		.c(res_srl)
	);

	MUX8T1_32 mux(
		.s(ALU_operation),
		.I0(res_and),		//000
		.I1(res_or),		//001
		.I2(res_add),		//010
		.I3(res_xor),		//011
		.I4(res_nor),		//100
		.I5(res_srl),		//101
		.I6(res_sub),		//110
		.I7(res_slt),		//111
		.o(res)
	);

	wire z;
	or_bit_32 or_bit_32(
		.A(res),
		.O(z)
	);
	assign zero = ~z;

endmodule