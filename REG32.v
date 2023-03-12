module REG32(
	input wire clk,
	input wire rst,
	input wire CE,
	input wire [31:0] D,
	output reg [31:0] Q
);

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			Q <= 32'b0;			
		end else if (CE) begin
			Q <= D;
		end
	end

endmodule