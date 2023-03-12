module P2S(
	input wire clk,						
	input wire rst,
	input wire Serial,
	input wire [DATA_BITS-1:0] P_Data,
	output wire s_clk,
	output wire s_clrn,
	output wire sout,
	output reg  EN = 1
);
						
	parameter
		DATA_BITS = 64,  		// data length
		DIR = 1;				// Shift direction =0 left

	wire [DATA_BITS: 0] data = DIR? {1'b0, P_Data}: {P_Data, 1'b0};
	wire [DATA_BITS: 0] Q_out;
	wire finish = DIR? &Q_out[DATA_BITS: 1]: &Q_out[DATA_BITS-1: 0];

	reg [1:0] start = 2'b00;
	wire start_pulse = (start == 2'b01);
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			start <= 2'b00;
		end else begin
			start <= {start[0], Serial};
		end
	end
	
	reg [1:0] S = 2'b11;
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			S <= 2'b11;
			EN <= 1;
		end else if (start_pulse) begin
			S <= 2'b11;
			EN <= 0;
		end else if(!finish) begin
			S <= DIR? 2'b01: 2'b10;
			EN <= 0;
		end else begin
			S <= 2'b00;
			EN <= 1;
		end
	end
	
	SHIFT64 #(.DATA_BITS(DATA_BITS))
		shift64(
			.clk(clk),
			.SR(1'b1),
			.SL(1'b1),
			.S1(S[1]),
			.S0(S[0]),
			.D(data),
			.Q(Q_out)
		);

	assign sout = DIR? Q_out[0]: Q_out[DATA_BITS];
	assign s_clk = clk | finish;
	assign s_clrn = 1;

endmodule