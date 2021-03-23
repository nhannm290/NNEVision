module FPA_Pipeline_FULL (
    Result,DONE,OpA,OpB,CLK,CLEAR,START,ADD_SIGNAL,RM
);  
    input  wire [31:0] OpA,OpB;
    output wire [31:0] Result;
    input  wire CLK,CLEAR,START,ADD_SIGNAL;
    input  [1:0] RM;
    output wire DONE;
    wire        Enable_Reg0,Enable_Reg1;

    FPA_Pipeline FPA (
        .Result(Result),
        .Enable_Reg0(Enable_Reg0),
        .Enable_Reg1(Enable_Reg1),
        .Sub_Signal(ADD_SIGNAL),
        .Rm(RM),
        .OpA(OpA),
        .OpB(OpB),
        .Clk(CLK),
        .Clear(CLEAR)
    );

    Controller Controll (
        .Enable_Reg0(Enable_Reg0),
        .Enable_Reg1(Enable_Reg1),
        .DONE(DONE),
        .CLK(CLK),
        .START(START)
    );
    
endmodule