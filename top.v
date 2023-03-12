module top(
	input wire clk_100mhz,
	input wire RSTN,
	input wire PS2_clk,
	input wire PS2_data,
	input wire [15:0] SW,
	input wire [3:0] BTN_y,
	output wire [4:0] BTN_x,
	output wire CR,
	output wire RDY,
	output wire readn,
	output wire seg_clk,
	output wire seg_sout,
	output wire SEG_PEN,
	output wire seg_clrn,
	output wire led_clk,
	output wire led_sout,
	output wire LED_PEN,
	output wire led_clrn,
	output wire [7:0] SEGMENT,
	output wire [3:0] AN,
	output wire [7:0] LED,
	output wire [3:0] Red,
	output wire [3:0] Green,
	output wire [3:0] Blue,
	output wire HSYNC,
	output wire VSYNC
);

	wire [4:0] Din;
	wire [3:0] Pulse;
	wire [3:0] BTN_OK;
	wire [15:0] SW_OK;
	wire rst;

	wire [31:0] Ai;
	wire [31:0] Bi;
	wire [7:0] blink;

	wire [31:0] Div;
	wire Clk_CPU;
	wire IO_clk;
	assign IO_clk = ~Clk_CPU;

	wire [31:0] Disp_num;
	wire [7:0] point_out;
	wire [7:0] LE_out;

	wire [31:0] inst;
	wire [31:0] PC;
	wire mem_w;
	wire [31:0] Addr_out;
	wire [31:0] Data_in;
	wire [31:0] Data_out;
	wire [4:0] State;

	wire [31:0] ram_data_in;
	wire data_ram_we;
	wire [9:0] ram_addr;
	wire [31:0] ram_data_out;
	wire [31:0] CPU2IO;
	wire GPIOE0;
	wire GPIOF0;
	wire [15:0] LED_out;
	wire [31:0] Counter_out;
	wire counter2_out;
	wire counter1_out;
	wire counter0_out;
	wire counter_we;
	wire [1:0] counter_set;

	wire [18:0] vram_read_addr;
	wire [18:0] vram_write_addr;
	wire [11:0] vram_read_data;
	wire [11:0] vram_write_data;
	wire vram_write_EN;

	wire [8:0] PS2_KeyCode;

	wire [16:0] pic_ram_addr;
	wire [11:0] pic_ram_data;

	wire [15:0] smallpic_ram_addr;
	wire [31:0] smallpic_ram_data;

	Multi_CPU U1(
		.clk(Clk_CPU),
		.reset(rst),
		.inst_out(inst),
		.INT(counter0_out),
		.PC_out(PC),
		.mem_w(mem_w),
		.Addr_out(Addr_out),
		.Data_in(Data_in),
		.Data_out(Data_out),
		.state(State),
		.CPU_MIO(),
		.MIO_ready(1'b1)
	);

	RAM_B U3(
		.addra(ram_addr),
		.wea(data_ram_we),
		.dina(ram_data_in),
		.clka(clk_100mhz),
		.douta(ram_data_out)
	);

	MIO_BUS U4(
		.clk(clk_100mhz),
		.rst(rst),
		.BTN(BTN_OK),
		.SW(SW_OK),
		.mem_w(mem_w),
		.addr_bus(Addr_out),
		.Cpu_data4bus(Data_in),
		.Cpu_data2bus(Data_out),
		.ram_data_in(ram_data_in),
		.data_ram_we(data_ram_we),
		.ram_addr(ram_addr),
		.ram_data_out(ram_data_out),
		.Peripheral_in(CPU2IO),
		.GPIOe0000000_we(GPIOE0),
		.GPIOf0000000_we(GPIOF0),
		.led_out(LED_out),
		.counter_out(Counter_out),
		.counter2_out(counter2_out),
		.counter1_out(counter1_out),
		.counter0_out(counter0_out),
		.counter_we(counter_we),

		.vram_write_EN(vram_write_EN),
		.vram_write_addr(vram_write_addr),
		.vram_write_data(vram_write_data),

		.PS2_data(PS2_KeyCode),

		.pic_ram_addr(pic_ram_addr),
		.pic_ram_data(pic_ram_data),

		.smallpic_ram_addr(smallpic_ram_addr),
		.smallpic_ram_data(smallpic_ram_data)
	);

	Multi_8CH32 U5(
		.clk(IO_clk),
		.rst(rst),
		.EN(GPIOE0),
		.Test(SW_OK[7:5]),
		.point_in({Div[31:0], Div[31:13], State[4:0], 8'b0}),
		.LES(64'b0),
		.Data0(CPU2IO),
		.data1({2'b0, PC[31:2]}),
		.data2(inst),
		.data3(Counter_out),
		.data4(Addr_out),
		.data5(Data_out),
		.data6(Data_in),
		.data7(PC),
		.Disp_num(Disp_num),
		.point_out(point_out),
		.LE_out(LE_out)
	);

	SSeg7_Dev U6(
		.clk(clk_100mhz),
		.rst(rst),
		.Start(Div[20]),
		.SW0(SW_OK[0]),
		.flash(Div[25]),
		.Hexs(Disp_num),
		.point(point_out),
		.LES(LE_out),
		.seg_clk(seg_clk),
		.seg_sout(seg_sout),
		.SEG_PEN(SEG_PEN),
		.seg_clrn(seg_clrn)
	);

	SPIO U7(
		.clk(IO_clk),
		.rst(rst),
		.EN(GPIOF0),
		.Start(Div[20]),
		.P_Data(CPU2IO),
		.counter_set(counter_set),
		.LED_out(LED_out),
		.GPIOf0(),
		.led_clk(led_clk),
		.led_sout(led_sout),
		.LED_PEN(LED_PEN),
		.led_clrn(led_clrn)
	);

	clk_div U8(
		.clk(clk_100mhz),
		.rst(rst),
		.SW2(SW_OK[2]),
		.clkdiv(Div),
		.Clk_CPU(Clk_CPU)
	);

	SAnti_jitter U9(
		.RSTN(RSTN),
		.clk(clk_100mhz),
		.Key_y(BTN_y),
		.Key_x(BTN_x),
		.SW(SW),
		.readn(readn),
		.CR(CR),
		.Key_out(Din),
		.Key_ready(RDY),
		.pulse_out(Pulse),
		.BTN_OK(BTN_OK),
		.SW_OK(SW_OK),
		.rst(rst)
	);

	Counter_x U10(
		.clk(IO_clk),
		.rst(rst),
		.clk0(Div[8]),
		.clk1(Div[9]),
		.clk2(Div[11]),
		.counter_we(counter_we),
		.counter_val(CPU2IO),
		.counter_ch(counter_set),
		.counter0_OUT(counter0_out),
		.counter1_OUT(counter1_out),
		.counter2_OUT(counter2_out),
		.counter_out(Counter_out)
	);

	SEnter_2_32 M4(
		.clk(clk_100mhz),
		.Din(Din),
		.D_ready(RDY),
		.BTN(BTN_OK[2:0]),
		.Ctrl({SW_OK[7:5], SW_OK[15], SW_OK[0]}),
		.readn(readn),
		.Ai(Ai),
		.Bi(Bi),
		.blink(blink)
	);

	Seg7_Dev U61(
		.Scan({SW_OK[1], Div[19:18]}),
		.SW0(SW_OK[0]),
		.flash(Div[25]),
		.Hexs(Disp_num),
		.point(point_out),
		.LES(LE_out),
		.SEGMENT(SEGMENT),
		.AN(AN)
	);

	PIO U71(
		.clk(IO_clk),
		.rst(rst),
		.EN(GPIOF0),
		.PData_in(CPU2IO),
		.counter_set(),
		.LED_out(LED),
		.GPIOf0()
	);

	VRAM vram(
		.clka(Clk_CPU),
		.clkb(clk_100mhz),

		.addra(vram_write_addr),	// write
		.dina(vram_write_data),
		.wea(vram_write_EN),

		.addrb(vram_read_addr),		// read
		.doutb(vram_read_data)
	);

	VGA vga(
		.vga_clk(Div[1]),
		.rst(rst),
		.color(vram_read_data),
		.addr(vram_read_addr),
		.rdn(),
		.HS(HSYNC),
		.VS(VSYNC),
		.R(Red),
		.G(Green),
		.B(Blue)
	);

	PS2 ps2(
		.clk(clk_100mhz),
    	.rst(rst),
    	.ps2_clk(PS2_clk),
    	.ps2_data(PS2_data),
    	.data_out(PS2_KeyCode)
	);

	PIC_RAM Pic(
		.addra(pic_ram_addr),
		.wea(1'b0),
		.dina(12'b0),
		.clka(clk_100mhz),
		.douta(pic_ram_data)
	);

	SMALLPIC_RAM smallPic(
		.addra(smallpic_ram_addr),
		.wea(1'b0),
		.dina(32'b0),
		.clka(clk_100mhz),
		.douta(smallpic_ram_data)
	);

endmodule
