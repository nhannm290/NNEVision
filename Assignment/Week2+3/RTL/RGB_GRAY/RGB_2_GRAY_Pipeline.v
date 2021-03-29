module RGB_2_GRAY_Pipeline (
    GRAY,RGB,CLK,CLEAR,ItF_Enable_In,ItF_Enable_Out,Reg0_Enable,Reg1_Enable,Mul_Enable_IN,Add_Enable1,Add_Enable2,Reg2_Enable,FtI_Enable, Mul_Red_Flag,Mul_Green_Flag,Mul_Blue_Flag,DONE_Add_Flag,DONE_Add_Flag1,DONE_Add_Flag2,RegOut_Enable
);
    input [23:0] RGB;
    input CLK,CLEAR,ItF_Enable_In,ItF_Enable_Out,Reg0_Enable,Mul_Enable_IN,Reg1_Enable,Reg2_Enable,FtI_Enable,Add_Enable1,Add_Enable2,RegOut_Enable;

    output [7:0] GRAY;
    output Mul_Red_Flag,Mul_Green_Flag,Mul_Blue_Flag,DONE_Add_Flag,DONE_Add_Flag1,DONE_Add_Flag2;


    wire [31:0] ItF_Red,ItF_Green,ItF_Blue;
    wire [31:0] Reg0_Out2,Reg0_Out1,Reg0_Out0;
    wire [31:0] Reg1_Out2,Reg1_Out1,Reg1_Out0;
    wire [31:0] Reg2_Out;
    wire [31:0] Mul_Red,Mul_Green,Mul_Blue;
    wire [31:0] Add_Out;
    wire [ 7:0] Gray_Out; 

    Converter_ItF_Block Convert_ItF (
        .Red_Out(ItF_Red),
        .Green_Out(ItF_Green),
        .Blue_Out(ItF_Blue),
        .Red_In(RGB[23:16]),
        .Green_In(RGB[15:8]),
        .Blue_In(RGB[7:0]),
        .CLK(CLK),
        .CLEAR(CLEAR), 
        .ENABLE_IN(ItF_Enable_In),
        .ENABLE_OUT(ItF_Enable_Out)
    );

    Reg_3_in_1 Reg0 (
        .Out2(Reg0_Out2),
        .Out1(Reg0_Out1),
        .Out0(Reg0_Out0),
        .In2(ItF_Red),
        .In1(ItF_Green),
        .In0(ItF_Blue),
        .CLK(CLK),
        .ENABLE(Reg0_Enable),
        .CLEAR(CLEAR)
    );

    Multiple_Block Mul (
        .Red_Out(Mul_Red),
        .Green_Out(Mul_Green),
        .Blue_Out(Mul_Blue),
        .Flag_Red(Mul_Red_Flag),
        .Flag_Green(Mul_Green_Flag),
        .Flag_Blue(Mul_Blue_Flag),
        .Red_In(Reg0_Out2),
        .Green_In(Reg0_Out1),   
        .Blue_In(Reg0_Out0),
        .ENABLE_IN(Mul_Enable_IN),
        .CLK(CLK)
    );


    Reg_3_in_1 Reg1 (
        .Out2(Reg1_Out2),
        .Out1(Reg1_Out1),
        .Out0(Reg1_Out0),
        .In2(Mul_Red),
        .In1(Mul_Green),
        .In0(Mul_Blue),
        .CLK(CLK),
        .ENABLE(Reg1_Enable),
        .CLEAR(CLEAR)
    );

    Adder_Block Add (
        .Result_OUT(Add_Out),
        .DONE(DONE_Add_Flag),
        .DONE_BZ(DONE_Add_Flag2),
        .DONE_RG(DONE_Add_Flag1),
        .Red_In(Reg1_Out2),
        .Green_In(Reg1_Out1),
        .Blue_In(Reg1_Out0),
        .CLK(CLK),
        .CLEAR(CLEAR),
        .START_No1(Add_Enable1),
        .START_No2(Add_Enable2)
    );

    Reg_Pipeline Reg2 (
        .Data_out(Reg2_Out),
        .Data_in(Add_Out),
        .Enable(Reg2_Enable),
        .CLK(CLK),
        .CLEAR(CLEAR)
    );

    FtI Gray(
        .Interger_Out(Gray_Out),
        .Float_In(Reg2_Out),
        .Clk(CLK),
        .Clear(CLEAR),
        .OE(FtI_Enable)
    );

    Reg_Out OUT (
        .Data_Out(GRAY),
        .Data_In(Gray_Out),
        .Enable(RegOut_Enable),
        .CLK(CLK),
        .CLEAR(CLEAR)
    );


endmodule