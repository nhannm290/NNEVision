module Adder_Block (
    Result_OUT,DONE,DONE_BZ,DONE_RG,Red_In,Green_In,Blue_In,CLK,CLEAR,START_No1,START_No2
);
    input   wire [31:0] Red_In,Green_In,Blue_In;
    output  wire [31:0] Result_OUT;
    output  wire DONE,DONE_BZ,DONE_RG;
    input   wire CLEAR,CLK,START_No1,START_No2;

    wire [31:0] RED_GREEN_OUT,BLUE_ZERO_OUT;
    FPA_Pipeline_FULL RED_GREEN (
        .Result(RED_GREEN_OUT),
        .DONE(DONE_RG),
        .OpA(Red_In),
        .OpB(Green_In),
        .CLK(CLK),
        .CLEAR(CLEAR),
        .START(START_No1),
        .ADD_SIGNAL(1'b0),
        .RM(2'b0)
    );

    FPA_Pipeline_FULL BLUE_ZERO (
        .Result(BLUE_ZERO_OUT),
        .DONE(DONE_BZ),
        .OpA(Blue_In),
        .OpB(32'b0),
        .CLK(CLK),
        .CLEAR(CLEAR),
        .START(START_No1),
        .ADD_SIGNAL(1'b0),
        .RM(2'b0)
    );

    FPA_Pipeline_FULL RESULT (
        .Result(Result_OUT),
        .DONE(DONE),
        .OpA(RED_GREEN_OUT),
        .OpB(BLUE_ZERO_OUT),
        .CLK(CLK),
        .CLEAR(CLEAR),
        .START(START_No2),
        .ADD_SIGNAL(1'b0),
        .RM(2'b0)
    );

endmodule