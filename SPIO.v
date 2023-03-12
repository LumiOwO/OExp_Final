module SPIO(
	input wire clk,
	input wire rst,
	input wire Start,
	input wire EN,
	input wire [31:0] P_Data,
	output reg [1:0] counter_set,
	output wire [15:0] LED_out,
	output wire led_clk,
	output wire led_sout,
	output wire led_clrn,
	output wire LED_PEN,
	output reg [13:0] GPIOf0
);

	reg [15:0] LED;
	assign LED_out = LED;
	always @(negedge clk or posedge rst) begin
		if (rst) begin
			LED <= 16'h5A5A;
			counter_set <= 2'b00;			
		end else if (EN) begin
			{GPIOf0, LED, counter_set} <= P_Data;
		end else begin
			LED <= LED;
			counter_set <= counter_set;
		end
	end

	LEDP2S #(.DATA_BITS(16))
		LEDP2S(
			.clk(clk),
			.rst(rst), 
			.Start(Start),
			.PData(~LED),
			.sclk(led_clk),
			.sclrn(led_clrn),
			.sout(led_sout),
			.EN(LED_PEN)
		);

endmodule