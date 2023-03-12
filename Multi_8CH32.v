module Multi_8CH32(
	input wire clk,
	input wire rst,
	input wire EN,
	input wire [2:0] Test,
	input wire [63:0] point_in,
	input wire [63:0] LES,
	input wire [31:0] Data0,
	input wire [31:0] data1,
	input wire [31:0] data2,
	input wire [31:0] data3,
	input wire [31:0] data4,
	input wire [31:0] data5,
	input wire [31:0] data6,
	input wire [31:0] data7,
	output wire [7:0] point_out,
	output wire [7:0] LE_out,
	output wire [31:0] Disp_num
);

	reg [31:0] disp_data = 32'hAA55_55AA;
	reg [7:0] cpu_LE = 8'b1111_1111;
	reg [7:0] cpu_point = 4'b0000_0000;

	always @ (posedge clk) begin
		if(EN) begin
			disp_data 	<= Data0;
			cpu_LE 		<= LES[7:0];
			cpu_point	<= point_in[7:0];
		end else begin
			disp_data	<= disp_data;
			cpu_LE		<= cpu_LE;
			cpu_point	<= cpu_point;
		end
	end

	MUX8T1_32 MUX1_DispData(
		.I0(disp_data),
		.I1(data1),
		.I2(data2),
		.I3(data3),
		.I4(data4),
		.I5(data5),
		.I6(data6),
		.I7(data7),
		.s(Test),
		.o(Disp_num)
	);

	MUX8T1_8 MUX2_LE(
		.I0(cpu_LE),
		.I1(LES[15:8]),
		.I2(LES[23:16]),
		.I3(LES[31:24]),
		.I4(LES[39:32]),
		.I5(LES[47:40]),
		.I6(LES[55:48]),
		.I7(LES[63:56]),
		.s(Test),
		.o(LE_out)
	);

	MUX8T1_8 MUX3_Point(
		.I0(cpu_point),
		.I1(point_in[15:8]),
		.I2(point_in[23:16]),
		.I3(point_in[31:24]),
		.I4(point_in[39:32]),
		.I5(point_in[47:40]),
		.I6(point_in[55:48]),
		.I7(point_in[63:56]),
		.s(Test),
		.o(point_out)
	);


endmodule
