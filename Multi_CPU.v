module Multi_CPU(
    input wire INT,
    input wire clk,
    input wire reset,
    input wire MIO_ready,
    input wire [31:0] Data_in,
    output wire mem_w,
    output wire [31:0] PC_out,
    output wire [31:0] inst_out,
    output wire [31:0] Data_out,
    output wire [31:0] Addr_out,
    output wire CPU_MIO,
    output wire [4:0] state
);

    wire zero;
    wire overflow;
    wire MemRead;
    wire MemWrite;
    wire IorD;
    wire IRWrite;
    wire RegWrite;
    wire ALUSrcA;
    wire PCWrite;
    wire PCWriteCond;
    wire Branch;
    wire Shift;
    wire [1:0] RegDst;
    wire [1:0] MemtoReg;
    wire [1:0] ALUSrcB;
    wire [1:0] PCSource;
    wire [2:0] ALU_operation;

    assign mem_w = ~MemRead && MemWrite;

    ctrl U11(
        .clk(clk),
        .reset(reset),
        .zero(zero),
        .overflow(overflow),
        .MIO_ready(MIO_ready),
        .Inst_in(inst_out),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .CPU_MIO(CPU_MIO),
        .IorD(IorD),
        .IRWrite(IRWrite),
        .RegWrite(RegWrite),
        .ALUSrcA(ALUSrcA),
        .PCWrite(PCWrite),
        .PCWriteCond(PCWriteCond),
        .Branch(Branch),
        .Shift(Shift),
        .RegDst(RegDst),
        .MemtoReg(MemtoReg),
        .ALUSrcB(ALUSrcB),
        .PCSource(PCSource),
        .ALU_operation(ALU_operation),
        .state_out(state)
    );

    M_datapath U12(
        .clk(clk),
        .reset(reset),
        .MIO_ready(MIO_ready),
        .IorD(IorD),
        .IRWrite(IRWrite),
        .RegWrite(RegWrite),
        .ALUSrcA(ALUSrcA),
        .PCWrite(PCWrite),
        .PCWriteCond(PCWriteCond),
        .Branch(Branch),
        .Shift(Shift),
        .RegDst(RegDst),
        .MemtoReg(MemtoReg),
        .ALUSrcB(ALUSrcB),
        .PCSource(PCSource),
        .ALU_operation(ALU_operation),
        .data2CPU(Data_in),
        .zero(zero),
        .overflow(overflow),
        .PC_Current(PC_out),
        .Inst(inst_out),
        .data_out(Data_out),
        .M_addr(Addr_out)
    );

endmodule