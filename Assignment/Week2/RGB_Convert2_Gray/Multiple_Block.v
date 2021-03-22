/*module Multiple_Block (
    Red_Out,Green_Out,Blue_Out,Flag_Reg,Flag_Green,Flag_Blue,Red_In,Green_In,Blue_In,ENABLE_IN,ENABLE_OUT,CLK
);*/
    module Multiple_Block (
    Red_Out,Green_Out,Blue_Out,Flag_Red,Flag_Green,Flag_Blue,Red_In,Green_In,Blue_In,ENABLE_IN,CLK
);
    parameter RED_Factor = 32'h3e991687;
    parameter GREEN_Factor = 32'h3f1645a2;
    parameter BLUE_Factor = 32'h3de978d5;

    input   wire [31:0] Red_In,Green_In,Blue_In;
    input   wire CLK,ENABLE_IN;
    output  wire [31:0] Red_Out,Green_Out,Blue_Out;
    output Flag_Red,Flag_Green,Flag_Blue;

    //wire [31:0] Red_to_Reg,Green_to_Reg,Blue_to_Reg;


    FPM RED_Mul(
        .clk(CLK),
        .start(ENABLE_IN),
        .a(Red_In),
        .b(RED_Factor),
        .bias(8'd127),
        .out(Red_Out),
        .result(Flag_Red),
        .overflow()
    );

    FPM GREEN_Mul(
        .clk(CLK),
        .start(ENABLE_IN),
        .a(Green_In),
        .b(GREEN_Factor),
        .bias(8'd127),
        .out(Green_Out),
        .result(Flag_Green),
        .overflow()
    );
    
    FPM BLUE_Mul(
        .clk(CLK),
        .start(ENABLE_IN),
        .a(Blue_In),
        .b(BLUE_Factor),
        .bias(8'd127),
        .out(Blue_Out),
        .result(Flag_Blue),
        .overflow()
    );

    
endmodule