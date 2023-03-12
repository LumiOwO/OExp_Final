module M_datapath(
    input wire clk, 
    input wire reset, 
    input wire MIO_ready, 
    input wire IorD, 
    input wire IRWrite, 
    input wire RegWrite, 
    input wire ALUSrcA, 
    input wire PCWrite, 
    input wire PCWriteCond, 
    input wire Branch, 
    input wire Shift,
    input wire [1:0] RegDst, 
    input wire [1:0] MemtoReg, 
    input wire [1:0] ALUSrcB, 
    input wire [1:0] PCSource, 
    input wire [2:0] ALU_operation, 
    input wire [31:0] data2CPU, 
    output wire zero, 
    output wire overflow, 
    output wire [31:0] PC_Current, 
    output wire [31:0] Inst, 
    output wire [31:0] data_out, 
    output wire [31:0] M_addr 
);

    // wires
    wire [4:0] rs = Inst[25:21];
    wire [4:0] rt = Inst[20:16];
    wire [4:0] rd = Inst[15:11];
    wire [15:0] imm = Inst[15:0];

    wire [31:0] MemData;

    wire [4:0] Wt_addr;
    wire [31:0] Wt_data;

    wire [31:0] rdata_A;
    wire [31:0] rdata_B;
    wire [31:0] imm_32;
    wire [31:0] offset = {imm_32[29:0], 2'b0};
    wire [31:0] lui_data = {imm, 16'b0};

    wire [31:0] ALU_DataA;
    wire [31:0] ALU_DataB;
    wire [31:0] res;
    wire [31:0] ALU_Out;

    wire [31:0] Jump_addr = {PC_Current[31:28], Inst[25:0], 2'b0};
    wire [31:0] PC_temp;
    wire PC_EN;

    // cycle 1 -- fetch instruction
    // Instruction reg
    REG32 IR(
        .clk(clk),
        .rst(reset),
        .CE(IRWrite),
        .D(data2CPU),
        .Q(Inst)
    );
    MUX4T1_5 mux1(
        .s(RegDst),
        .I0(rt),
        .I1(rd),
        .I2(5'b11111),
        .I3(5'b0),
        .o(Wt_addr)
    );

    // cycle 2 -- decode instruction
    wire [4:0] R_addr_A;
    assign R_addr_A = Shift? rt: rs;
    Regs U2(
        .clk(clk),
        .rst(reset),
        .R_addr_A(R_addr_A),
        .R_addr_B(rt),
        .Wt_addr(Wt_addr),
        .Wt_data(Wt_data),
        .L_S(RegWrite),
        .rdata_A(rdata_A),
        .rdata_B(rdata_B)
    );
    assign data_out = rdata_B;
    Ext_32 ext(
        .imm_16(imm),
        .Imm_32(imm_32)
    );
    MUX2T1_32 mux2(
        .s(ALUSrcA),
        .I0(PC_Current),
        .I1(rdata_A),
        .o(ALU_DataA)
    );
    wire [31:0] ALU_DataB_temp;
    MUX4T1_32 mux3(
        .s(ALUSrcB),
        .I0(rdata_B),
        .I1(32'd4),
        .I2(imm_32),
        .I3(offset),
        .o(ALU_DataB_temp)
    );
    assign ALU_DataB = Shift? Inst: ALU_DataB_temp;
    alu Alu(
        .A(ALU_DataA),
        .B(ALU_DataB),
        .ALU_operation(ALU_operation),
        .zero(zero),
        .res(res),
        .overflow(overflow)
    );

    // cycle 3 -- get op result
    REG32 ALUOut(
        .clk(clk),
        .rst(1'b0),
        .CE(1'b1),
        .D(res),
        .Q(ALU_Out)
    );
    MUX2T1_32 mux4(
        .s(IorD),
        .I0(PC_Current),
        .I1(ALU_Out),
        .o(M_addr)
    );
    MUX4T1_32 mux5(
        .s(PCSource),
        .I0(res),
        .I1(ALU_Out),
        .I2(Jump_addr),
        .I3(rdata_A),
        .o(PC_temp)
    );

    // cycle 4 -- write addr/reg or memory access
    // PC pointer
    assign PC_EN = MIO_ready && (PCWrite || 
            (PCWriteCond && ~(Branch ^ zero)));
    REG32 PC(
        .clk(clk),
        .rst(reset),
        .CE(PC_EN),
        .D(PC_temp),
        .Q(PC_Current)
    );
    // Memory data reg
    REG32 MDR(
        .clk(clk),
        .rst(1'b0),
        .CE(1'b1),
        .D(data2CPU),
        .Q(MemData)
    );
    MUX4T1_32 mux6(
        .s(MemtoReg),
        .I0(ALU_Out),
        .I1(MemData),
        .I2(lui_data),
        .I3(PC_Current),
        .o(Wt_data)
    );

    // cycle 5 -- write data to memory

endmodule