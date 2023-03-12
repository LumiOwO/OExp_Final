`include "ctrl_header.v"

module ctrl(
    input wire clk,
    input wire reset,
    input wire zero,
    input wire overflow,
    input wire MIO_ready,
    input wire [31:0] Inst_in,
    output reg MemRead,
    output reg MemWrite,
    output wire CPU_MIO,
    output reg IorD,
    output reg IRWrite,
    output reg RegWrite,
    output reg ALUSrcA,
    output reg PCWrite,
    output reg PCWriteCond,
    output reg Branch,
    output reg Shift,
    output reg [1:0] RegDst,
    output reg [1:0] MemtoReg,
    output reg [1:0] ALUSrcB,
    output reg [1:0] PCSource,
    output reg [2:0] ALU_operation,
    output wire [4:0] state_out
);
    
    // wires
    wire [5:0] op = Inst_in[31:26];
    wire [5:0] func = Inst_in[5:0];

    // state transfer
    reg [4:0] state = `FETCH;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= `FETCH;
        end else if (clk) begin
            case(state)
                `FETCH:         state <= `DECODE;
                `DECODE: case(op)
                    `LW:        state <= `COMPUTE_MEM;
                    `SW:        state <= `COMPUTE_MEM;
                    `R_TYPE: case(func)
                        `JR:    state <= `JR_STATE;
                        `JALR:  state <= `JALR_STATE;
                        `SRL:   state <= `SRL_STATE;
                        default:state <= `R_TYPE_ALU;
                    endcase
                    `BEQ:       state <= `BEQ_STATE;
                    `J:         state <= `JUMP_STATE;
                    `BNE:       state <= `BNE_STATE;
                    `ADDI:      state <= `I_TYPE_ALU;
                    `ANDI:      state <= `I_TYPE_ALU;
                    `SLTI:      state <= `I_TYPE_ALU;
                    `ORI:       state <= `I_TYPE_ALU;
                    `XORI:      state <= `I_TYPE_ALU;
                    `LUI:       state <= `LUI_STATE;
                    `JAL:       state <= `JAL_STATE;
                    default:    state <= state;
                endcase
                `COMPUTE_MEM: case(op)
                    `LW:        state <= `MEM_READ;
                    `SW:        state <= `MEM_WRITE;
                    default:    state <= state;
                endcase
                `MEM_READ:      state <= `MEM_WBACK;
                `MEM_WBACK:     state <= `FETCH;
                `MEM_WRITE:     state <= `FETCH;
                `R_TYPE_ALU:    state <= `R_TYPE_WREG;
                `R_TYPE_WREG:   state <= `FETCH;
                `BEQ_STATE:     state <= `FETCH;
                `JUMP_STATE:    state <= `FETCH;
                `BNE_STATE:     state <= `FETCH;
                `I_TYPE_ALU:    state <= `I_TYPE_WREG;
                `I_TYPE_WREG:   state <= `FETCH;
                `LUI_STATE:     state <= `FETCH;
                `JR_STATE:      state <= `FETCH;
                `JAL_STATE:     state <= `JUMP_STATE;
                `JALR_STATE:    state <= `JR_STATE;
                `SRL_STATE:     state <= `R_TYPE_WREG;
                default:        state <= state;
            endcase
        end
    end
    // truth table
    reg [1:0] ALU_OP;
    always @ * begin
        case(state)
            `FETCH:         `Signal <= {1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 2'b00, 2'b00, 1'b0, 2'b01, 1'b0, 2'b00, 1'b0, 1'b0, 2'b00};
            `DECODE:        `Signal <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00, 2'b00, 1'b0, 2'b11, 1'b0, 2'b00, 1'b0, 1'b0, 2'b00};
            `COMPUTE_MEM:   `Signal <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00, 2'b00, 1'b1, 2'b10, 1'b0, 2'b00, 1'b0, 1'b0, 2'b00};
            `MEM_READ:      `Signal <= {1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 2'b00, 2'b00, 1'b0, 2'b00, 1'b0, 2'b00, 1'b0, 1'b0, 2'b00};
            `MEM_WBACK:     `Signal <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b01, 2'b00, 1'b0, 2'b00, 1'b1, 2'b00, 1'b0, 1'b0, 2'b00};
            `MEM_WRITE:     `Signal <= {1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 2'b00, 2'b00, 1'b0, 2'b00, 1'b0, 2'b00, 1'b0, 1'b0, 2'b00};
            `R_TYPE_ALU:    `Signal <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00, 2'b00, 1'b1, 2'b00, 1'b0, 2'b00, 1'b0, 1'b0, 2'b10};
            `R_TYPE_WREG:   `Signal <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00, 2'b00, 1'b0, 2'b00, 1'b1, 2'b01, 1'b0, 1'b0, 2'b00};
            `BEQ_STATE:     `Signal <= {1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00, 2'b01, 1'b1, 2'b00, 1'b0, 2'b00, 1'b1, 1'b0, 2'b01};
            `JUMP_STATE:    `Signal <= {1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00, 2'b10, 1'b0, 2'b00, 1'b0, 2'b00, 1'b0, 1'b0, 2'b00};
            `BNE_STATE:     `Signal <= {1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00, 2'b01, 1'b1, 2'b00, 1'b0, 2'b00, 1'b0, 1'b0, 2'b01};
            `I_TYPE_ALU:    `Signal <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00, 2'b00, 1'b1, 2'b10, 1'b0, 2'b00, 1'b0, 1'b0, 2'b11};
            `I_TYPE_WREG:   `Signal <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00, 2'b00, 1'b0, 2'b00, 1'b1, 2'b00, 1'b0, 1'b0, 2'b00};
            `LUI_STATE:     `Signal <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b10, 2'b00, 1'b0, 2'b00, 1'b1, 2'b00, 1'b0, 1'b0, 2'b00};
            `JR_STATE:      `Signal <= {1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00, 2'b11, 1'b0, 2'b00, 1'b0, 2'b00, 1'b0, 1'b0, 2'b00};
            `JAL_STATE:     `Signal <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b11, 2'b00, 1'b0, 2'b00, 1'b1, 2'b10, 1'b0, 1'b0, 2'b00};
            `JALR_STATE:    `Signal <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b11, 2'b00, 1'b0, 2'b00, 1'b1, 2'b01, 1'b0, 1'b0, 2'b00};
            `SRL_STATE:     `Signal <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00, 2'b00, 1'b1, 2'b00, 1'b0, 2'b00, 1'b0, 1'b1, 2'b10};
            default:        `Signal <= 20'b0;
        endcase
    end

    // ALU translate
    always @ * begin
        case(ALU_OP)
            2'b00: ALU_operation <= 3'b010;     // add 
            2'b01: ALU_operation <= 3'b110;     // sub
            2'b10: case(func)                   // R_Type
                `ADD: ALU_operation <= 3'b010;  // add
                `SUB: ALU_operation <= 3'b110;  // sub
                `AND: ALU_operation <= 3'b000;  // and
                `OR : ALU_operation <= 3'b001;  // or
                `SLT: ALU_operation <= 3'b111;  // slt
                `SRL: ALU_operation <= 3'b101;  // srl
                `NOR: ALU_operation <= 3'b100;  // nor
                `XOR: ALU_operation <= 3'b011;  // xor
            endcase
            2'b11: case(op)                     // I_Type  
                `ADDI: ALU_operation <= 3'b010; // add
                `ANDI: ALU_operation <= 3'b000; // and
                `ORI : ALU_operation <= 3'b001; // or
                `SLTI: ALU_operation <= 3'b111; // slt
                `XORI: ALU_operation <= 3'b011; // xor
            endcase
        endcase
    end

    assign CPU_MIO = MIO_ready & (MemRead | MemWrite);
    assign state_out = state;

endmodule