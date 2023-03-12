// control signal
`define Signal {PCWrite, PCWriteCond, IorD, MemRead, MemWrite, IRWrite, MemtoReg, PCSource, ALUSrcA, ALUSrcB, RegWrite, RegDst, Branch, Shift, ALU_OP}

// op code
`define R_TYPE	6'b00_0000
`define LW		6'b10_0011
`define SW		6'b10_1011
`define BEQ		6'b00_0100
`define BNE		6'b00_0101
`define J		6'b00_0010
`define JAL		6'b00_0011
`define ADDI	6'b00_1000
`define ANDI	6'b00_1100
`define ORI		6'b00_1101
`define XORI	6'b00_1110
`define SLTI	6'b00_1010
`define LUI		6'b00_1111

// func code
`define ADD		6'b10_0000
`define SUB		6'b10_0010
`define AND		6'b10_0100
`define OR		6'b10_0101
`define SLT		6'b10_1010
`define SRL		6'b00_0010
`define NOR		6'b10_0111
`define XOR		6'b10_0110
`define JR		6'b00_1000
`define JALR	6'b00_1001

// state list:
`define FETCH 			5'd0	// 0: fetch instruction 
`define DECODE 			5'd1	// 1: decode instruction
`define COMPUTE_MEM 	5'd2	// 2: compute memory address -- lw, sw
`define MEM_READ		5'd3	// 3: read memory
`define MEM_WBACK		5'd4	// 4: write-back
`define MEM_WRITE		5'd5	// 5: write memory
`define R_TYPE_ALU		5'd6	// 6: R_type ALU operation
`define R_TYPE_WREG		5'd7	// 7: R_type write reg
`define BEQ_STATE		5'd8	// 8: beq
`define JUMP_STATE		5'd9	// 9: jump
`define BNE_STATE		5'd10	// 10: bne
`define I_TYPE_ALU		5'd11	// 11: I_type ALU operation
`define I_TYPE_WREG		5'd12	// 12: I_type write reg
`define LUI_STATE		5'd13	// 13: lui
`define JR_STATE		5'd14	// 14: jr
`define JAL_STATE		5'd15	// 15: jal
`define JALR_STATE		5'd16	// 16: jalr
`define SRL_STATE		5'd17	// 17: srl