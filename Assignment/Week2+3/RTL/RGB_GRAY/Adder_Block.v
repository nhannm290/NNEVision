module Adder_Block (

    Result_OUT,DONE,DONE_BZ,DONE_RG,Red_In,Green_In,Blue_In,CLK,CLEAR,START_No1,START_No2,Reg0_Enable,Reg1_Enable

);

    input   wire [31:0] Red_In,Green_In,Blue_In;

    output  wire [31:0] Result_OUT;

    output  wire DONE,DONE_BZ,DONE_RG;

    input   wire CLEAR,CLK,START_No1,START_No2;

    wire [31:0] Reg0_Add0,Reg1_Add1;

    input   wire        Reg0_Enable,Reg1_Enable;



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

    

    Reg_Pipeline Reg0(

        .Data_out(Reg0_Add0),

        .Data_in(RED_GREEN_OUT),

        .Enable(Reg0_Enable),

        .CLK(CLK),

        .CLEAR(CLEAR)

    );

    

    Reg_Pipeline Reg1(

        .Data_out(Reg1_Add1),

        .Data_in(BLUE_ZERO_OUT),

        .Enable(Reg1_Enable),

        .CLK(CLK),

        .CLEAR(CLEAR)

    );



    FPA_Pipeline_FULL RESULT (

        .Result(Result_OUT),

        .DONE(DONE),

        .OpA(Reg0_Add0),

        .OpB(Reg1_Add1),

        .CLK(CLK),

        .CLEAR(CLEAR),

        .START(START_No2),

        .ADD_SIGNAL(1'b0),

        .RM(2'b0)

    );



endmodule
