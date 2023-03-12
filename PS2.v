module PS2(
    input wire clk,
    input wire rst,
    input wire ps2_clk,
    input wire ps2_data,
    output reg [8:0] data_out
);

    reg ps2_clk_flag0, ps2_clk_flag1, ps2_clk_flag2;
    wire negedge_ps2_clk;

    always @(posedge clk or posedge rst)begin
        if(rst) begin
            ps2_clk_flag0 <= 1'b0;
            ps2_clk_flag1 <= 1'b0;
            ps2_clk_flag2 <= 1'b0;
        end
        else begin
            ps2_clk_flag0 <= ps2_clk;
            ps2_clk_flag1 <= ps2_clk_flag0;
            ps2_clk_flag2 <= ps2_clk_flag1;
        end
    end

    assign negedge_ps2_clk = !ps2_clk_flag1 & ps2_clk_flag2;
    reg [3:0] num;
    always @ (posedge clk or posedge rst)begin
        if(rst)
            num <= 4'd0;
        else if(num == 4'd11)
            num <= 4'd0;
        else if(negedge_ps2_clk)
            num <= num + 1'b1;
    end

    reg negedge_ps2_clk_shift;
    always @ (posedge clk) begin
        negedge_ps2_clk_shift <= negedge_ps2_clk;
    end

    reg [7:0] temp_data;
    always @ (posedge clk or posedge rst) begin
        if(rst)
            temp_data <= 8'd0;
        else if(negedge_ps2_clk_shift) begin
            case (num)
                4'd2 : temp_data[0] <= ps2_data;
                4'd3 : temp_data[1] <= ps2_data;
                4'd4 : temp_data[2] <= ps2_data;
                4'd5 : temp_data[3] <= ps2_data;
                4'd6 : temp_data[4] <= ps2_data;
                4'd7 : temp_data[5] <= ps2_data;
                4'd8 : temp_data[6] <= ps2_data;
                4'd9 : temp_data[7] <= ps2_data;
                default : temp_data <= temp_data;
            endcase
        end else
            temp_data <= temp_data;
    end

    reg data_unpress, data_done, data_extend;
    reg [9:0] data;
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            data_unpress <= 1'b0;
            data <= 10'd0;
            data_done <= 1'b0;
            data_extend <= 1'b0;
        end
        else if(num == 4'd11) begin
            if(temp_data == 8'hE0)
                data_extend <= 1'b1;
            else if(temp_data == 8'hF0)
                data_unpress <= 1'b1;
            else begin
                data <= {data_extend, data_unpress, temp_data};
                data_done <= 1'b1;
                data_extend <= 1'b0;
                data_unpress <= 1'b0;
            end
        end
        else begin
            data <= data;
            data_done <= 1'b0;
            data_extend <= data_extend;
            data_unpress <= data_unpress;
        end
    end

    always @ * begin
    	if (data_done) begin
    		data_out <= data[8:0];
    	end else begin
            data_out <= data_out;
        end
    end

endmodule
