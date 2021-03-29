module RGB_2_GRAY (
    DONE,GRAY,RGB,START,CLK,CLEAR
);
    
    input START,CLK,CLEAR;
    input [23:0] RGB;
    output [7:0] GRAY;
    output DONE;
    wire ItF_Enable_In,ItF_Enable_Out,Reg0_Enable,Mul_Enable_In,Reg1_Enable,Add_Enable1,Add_Enable2,Reg2_Enable,FtI_Enable,RegOut_Enable,DON;

    wire Mul_Red_Flag,Mul_Green_Flag,Mul_Blue_Flag,DONE_Add_Flag,DONE_Add_Flag1,DONE_Add_Flag2;

    RGB_2_GRAY_Pipeline DATAPATH (
        .GRAY(GRAY),
        .RGB(RGB),
        .CLK(CLK),
        .CLEAR(CLEAR),
        .ItF_Enable_In(ItF_Enable_In),
        .ItF_Enable_Out(ItF_Enable_Out),
        .Reg0_Enable(Reg0_Enable),
        .Reg1_Enable(Reg1_Enable),
        .Mul_Enable_IN(Mul_Enable_In),
        .Add_Enable1(Add_Enable1),
        .Add_Enable2(Add_Enable2),
        .Reg2_Enable(Reg2_Enable),
        .FtI_Enable(FtI_Enable),
        .Mul_Red_Flag(Mul_Red_Flag),
        .Mul_Green_Flag(Mul_Green_Flag),
        .Mul_Blue_Flag(Mul_Blue_Flag),
        .DONE_Add_Flag(DONE_Add_Flag),
        .DONE_Add_Flag1(DONE_Add_Flag1),
        .DONE_Add_Flag2(DONE_Add_Flag2),
        .RegOut_Enable(RegOut_Enable)
    );

    Controller_RGB_GRAY CONTROL (
        .DONE(DONE),
        .ItF_Enable_In(ItF_Enable_In),
        .ItF_Enable_Out(ItF_Enable_Out),
        .Reg0_Enable(Reg0_Enable),
        .Mul_Enable_In(Mul_Enable_In),
        .Reg1_Enable(Reg1_Enable),
        .Add_Enable1(Add_Enable1),
        .Add_Enable2(Add_Enable2),
        .Reg2_Enable(Reg2_Enable),
        .FtI_Enable(FtI_Enable),
        .RegOut_Enable(RegOut_Enable),
        .Mul_Red_Flag(Mul_Red_Flag),
        .Mul_Green_Flag(Mul_Green_Flag),
        .Mul_Blue_Flag(Mul_Blue_Flag),
        .DONE_Add_Flag(DONE_Add_Flag),
        .DONE_Add_Flag1(DONE_Add_Flag1),
        .DONE_Add_Flag2(DONE_Add_Flag2),
        .START(START),
        .CLK(CLK)
    );

endmodule