module VGA(
	input wire vga_clk,
	input wire rst,
	input wire [11:0] color,
	output reg [18:0] addr,
	output wire rdn,			// read pixel RAM (active_low)
	output wire HS,
	output wire VS,
	output reg [3:0] R,
	output reg [3:0] G,
	output reg [3:0] B
	
);

	// VGA horizontal counter (0-639 + 8 + 8 + 96 + 40 + 8 = 799)
	reg [9:0] h_count;
	always @ (posedge vga_clk or posedge rst) begin
		if (rst) begin
			h_count <= 10'h0;
		end else if (h_count == 10'd799) begin
			h_count <= 10'h0;
		end else begin
			h_count <= h_count + 10'h1;
		end
	end
	assign HS = (h_count >= 10'd96); // horizontal synchronization
	wire [9:0] pixel = h_count - 10'd143;

	// VGA vertical counter (0-479 + 2 + 33 + 10 = 524)
	reg [9:0] v_count;
	always @ (posedge vga_clk or posedge rst) begin
		if (rst) begin
			v_count <= 10'h0;
		end else if (h_count == 10'd799) begin
			if (v_count == 10'd524) begin
				v_count <= 10'h0;
			end else begin
				v_count <= v_count + 10'h1;
			end
		end
	end
	assign VS = (v_count >= 10'd2); // vertical synchronization
	wire [9:0] line = v_count - 10'd35;

	// read signal
	wire read = (h_count > 10'd142) && 
				(h_count < 10'd783) &&
				(v_count > 10'd34 ) && 
				(v_count < 10'd515);
	assign rdn = ~read;

	// vram address (640 x 480 = 307200)
	always @(posedge vga_clk or posedge rst) begin
		if (rst) begin
			addr <= 19'b0;
		end else if (addr == 19'd307199) begin
			addr <= 19'b0;
		end else if (read) begin
			addr <= addr + 19'd1;
		end else begin
			addr <= addr;
		end
	end

	// VGA outputs
	always @ (posedge vga_clk) begin
		R <= rdn ? 4'h0 : color[11:8];
		G <= rdn ? 4'h0 : color[7:4];
		B <= rdn ? 4'h0 : color[3:0];
	end

endmodule