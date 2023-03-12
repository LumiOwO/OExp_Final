module Scansync(
	input wire [15:0] Hexs,
	input wire [1:0] Scan,
	input wire [3:0] point,
	input wire [3:0] LES,
	output reg [3:0] Hexo,
	output reg p,
	output reg LE,
	output reg [3:0] AN
);

	always @ (*) begin
		case(Scan)
			2'b00: begin Hexo <= Hexs[3:0]; AN <= 4'b1110; p = point[0]; LE = LES[0]; end
			2'b01: begin Hexo <= Hexs[7:4]; AN <= 4'b1101; p = point[1]; LE = LES[1]; end
			2'b10: begin Hexo <= Hexs[11:8]; AN <= 4'b1011; p = point[2]; LE = LES[2]; end
			2'b11: begin Hexo <= Hexs[15:12]; AN <= 4'b0111; p = point[3]; LE = LES[3]; end
		endcase
	end

endmodule