module LEDP2S(
	input wire clk,						
	input wire rst,
	input wire Start,
	input wire [DATA_BITS-1:0] PData,
	output wire sclk,
	output wire sclrn,
	output wire sout,
	output wire EN
);
						
	parameter
		DATA_BITS = 16,  			// data length
		DIR = 0;					// Shift direction =0 left

	P2S #(.DATA_BITS(DATA_BITS), .DIR(DIR))
		ledp2s(
			.clk(clk),
			.rst(rst),
			.Serial(Start),
			.P_Data(PData),
			.s_clk(sclk),
			.s_clrn(sclrn),
			.sout(sout),
			.EN(EN)
		);
		
endmodule
