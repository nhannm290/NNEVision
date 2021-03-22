module Reg_3_in_1 (
    Out2,Out1,Out0,In2,In1,In0,CLK,ENABLE,CLEAR
);
    input   [31:0] In2,In1,In0;
    output  [31:0] Out2,Out1,Out0;
    input CLK,ENABLE,CLEAR;

    Reg_Pipeline Reg_No1(
        .Data_out(Out0),
        .Data_in(In0),
        .Enable(ENABLE),
        .CLK(CLK),
        .CLEAR(CLEAR)
    );
    Reg_Pipeline Reg_No2(
        .Data_out(Out1),
        .Data_in(In1),
        .Enable(ENABLE),
        .CLK(CLK),
        .CLEAR(CLEAR)
    );
    Reg_Pipeline Reg_The_Last(
        .Data_out(Out2),
        .Data_in(In2),
        .Enable(ENABLE),
        .CLK(CLK),
        .CLEAR(CLEAR)
    );
    
endmodule