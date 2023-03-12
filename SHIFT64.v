module SHIFT64(
	input wire clk,
	input wire SR,
	input wire SL,
	input wire S1,
	input wire S0,
	input wire [DATA_BITS: 0] D,
	output reg [DATA_BITS: 0] Q
);

	parameter
		DATA_BITS = 16;								// data length

	always @(posedge clk) begin
		case({S1, S0})
			2'b00: Q <= Q;							// stay
			2'b01: Q <= {SR, Q[DATA_BITS: 1]};		// right shift
			2'b10: Q <= {Q[DATA_BITS-1: 0], SL};	// left shift
			2'b11: Q <= D;							// parallel
		endcase
	end


endmodule