module MIO_BUS(
	input wire clk,
	input wire rst,
	input wire [3:0] BTN,			// 4 
	input wire [15:0] SW,			// 8 
	input wire mem_w,				// CPU
	input wire [31:0] Cpu_data2bus,	// data from CPU
	input wire [31:0] addr_bus, 	// addr from CPU
	input wire [31:0] ram_data_out,	// RAM 
	input wire [15:0] led_out,		// LED 
	input wire [31:0] counter_out,	// 
	input wire counter0_out,		// 0 
	input wire counter1_out,		// 1 
	input wire counter2_out,		// 2 
	input wire [31:0] lg_out,
	input wire [8:0] PS2_data,

	input wire [11:0] pic_ram_data,
	input wire [31:0] smallpic_ram_data,

	output reg lg_we,
	output reg [6:0] lg_addr,

	output reg [31:0] Cpu_data4bus,	// write to CPU
	output reg [31:0] ram_data_in,	// from CPU write to Memory
	output reg [9:0] ram_addr,	    // Memory Address signals
	output reg data_ram_we,			// RAM  RAM
	output reg GPIOf0000000_we, 	// GPIOffffff00_we
	output reg GPIOe0000000_we, 	// GPIOfffffe00_we
	output reg counter_we,	        // 记数器
	output reg [31:0] Peripheral_in,// 送外部设备总线

	output reg vram_write_EN,
	output reg [18:0] vram_write_addr,
	output reg [11:0] vram_write_data,

	output reg [16:0] pic_ram_addr,
	output reg [15:0] smallpic_ram_addr
);

	reg data_ram_rd;
	reg GPIOf0000000_rd;
	reg GPIOe0000000_rd;
	reg counter_rd;
	reg [7:0] led_in;

	reg lg_rd;

	reg [8:0] PS2_data_reg;

	always @ (*) begin
		data_ram_we = 0;		// 主存写信号
		data_ram_rd = 0;		// 主存读信号
		counter_we = 0;			// 计数器写信号
		counter_rd = 0;			// 计数器读信号
		GPIOf0000000_we = 0;	// 设备1：PIO写信号 
		GPIOe0000000_we = 0;	// 计数器：Counter_x写信号 
		GPIOf0000000_rd = 0;	// 设备3、4：SW等读信号 
		GPIOe0000000_rd = 0;	// 设备2：七段显示器写信号 
		ram_addr = 10'h0;		// 内存物理地址：RAM_B地址
		ram_data_in = 32'h0;	// 内存读数据：RAM_B输出数据
		Peripheral_in = 32'h0;	// 外设总线：CPU输出，外设写入数据 
		Cpu_data4bus = 32'h0;	// 开始译码

		lg_we = 0;
		lg_rd = 0;
		lg_addr = 7'b0;

		vram_write_EN = 0;
		vram_write_addr = 19'b0;
		vram_write_data = 12'b0;

		PS2_data_reg = PS2_data;

		pic_ram_addr = 17'b0;
		smallpic_ram_addr = 16'b0;
		
		case (addr_bus[31:28])
			4'h0: begin 	// 存储器 data_ram (00000000 - 00000ffc, actually lower 4KB RAM)
				data_ram_we = mem_w;
				ram_addr = addr_bus[11:2];
				ram_data_in = Cpu_data2bus;
				Cpu_data4bus = ram_data_out;
				data_ram_rd = ~mem_w;
			end
			4'he: begin		// 七段显示器 (e0000000 - efffffff, SSeg7_Dev)
				GPIOe0000000_we = mem_w;
				Peripheral_in = Cpu_data2bus;
				Cpu_data4bus = counter_out;
				GPIOe0000000_rd = ~mem_w;
			end
			4'hf: begin   	// PIO   (f0000000 - ffffffff0, 8 LEDs & counter, f000004-fffffff4) 
				if (addr_bus[2]) begin				// f0000004
					counter_we = mem_w;
					Peripheral_in = Cpu_data2bus;
					Cpu_data4bus = counter_out;		// write Counter Value
					counter_rd = ~mem_w;
				end 
					
				else begin
					GPIOf0000000_we = mem_w;
					Peripheral_in = Cpu_data2bus;
					Cpu_data4bus = {led_out, SW};
					GPIOf0000000_rd = ~mem_w;
				end
			end
			4'hC: begin 	// VGA (c0000000 - cfffffff)
				vram_write_EN = mem_w;
				vram_write_addr = addr_bus[18:0];
				vram_write_data = Cpu_data2bus[11:0];
			end
			4'hD: begin 	// PS2 (d0000000 - dfffffff)
				Cpu_data4bus = {23'b0, PS2_data_reg};
			end
			4'hB: begin 	// Picture Ram (b0000000 - bfffffff)
				pic_ram_addr = addr_bus[16:0];
				Cpu_data4bus = {20'b0, pic_ram_data};
			end
			4'hA: begin 	// small Picture Ram (a0000000 - afffffff)
				smallpic_ram_addr = addr_bus[17:2];
				Cpu_data4bus = smallpic_ram_data;
			end
		endcase

		casex ({data_ram_rd, lg_rd, GPIOe0000000_rd, counter_rd, GPIOf0000000_rd})
			5'b1xxxx: Cpu_data4bus = ram_data_out;	// read from RAM
			5'bx1xxx: Cpu_data4bus = lg_out;		// read from life game
			5'bxx1xx: Cpu_data4bus = counter_out;	// read from Counter
			5'bxxx1x: Cpu_data4bus = counter_out;	// read from Counter
			5'bxxxx1: Cpu_data4bus = {led_out, SW};	// read from SW & BTN
		endcase
	end
endmodule
