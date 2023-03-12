module Regs(
	input wire clk,
	input wire rst,
	input wire L_S,
	input wire [4:0] R_addr_A,
	input wire [4:0] R_addr_B,
	input wire [4:0] Wt_addr,
	input wire [31:0] Wt_data,
	output wire [31:0] rdata_A,
	output wire [31:0] rdata_B
);

	reg [31:0] reg32x32 [31:1];
	assign rdata_A = (R_addr_A == 0)? 0: reg32x32[R_addr_A];
	assign rdata_B = (R_addr_B == 0)? 0: reg32x32[R_addr_B];

	integer i;
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			for(i=1; i<32; i=i+1) begin
				reg32x32[i] <= 0;
			end		
		end else begin
			if((Wt_addr != 0) && (L_S == 1)) begin
				reg32x32[Wt_addr] <= Wt_data;
			end
		end
	end

endmodule