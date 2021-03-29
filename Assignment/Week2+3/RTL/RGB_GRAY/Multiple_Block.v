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

    wire [31:0] Red_to_Mux,Green_to_Mux,Blue_to_Mux;
    wire Control_Red,Control_Green,Control_Blue;

    assign Control_Red      = ~| Red_In;
    assign Control_Green    = ~| Green_In;
    assign Control_Blue     = ~| Blue_In;

    FPM RED_Mul(
        .clk(CLK),
        .start(ENABLE_IN),
        .a(Red_In),
        .b(RED_Factor),
        .bias(8'd127),
        .out(Red_to_Mux),
        .result(Flag_Red),
        .overflow()
    );

    FPM GREEN_Mul(
        .clk(CLK),
        .start(ENABLE_IN),
        .a(Green_In),
        .b(GREEN_Factor),
        .bias(8'd127),
        .out(Green_to_Mux),
        .result(Flag_Green),
        .overflow()
    );
    
    FPM BLUE_Mul(
        .clk(CLK),
        .start(ENABLE_IN),
        .a(Blue_In),
        .b(BLUE_Factor),
        .bias(8'd127),
        .out(Blue_to_Mux),
        .result(Flag_Blue),
        .overflow()
    );
    Mux2_1 RED (
        .Data_Out(Red_Out),
        .Data_A(Red_to_Mux),
        .Data_B(32'b0),
        .Select(Control_Red)
    );
    Mux2_1 GREEN (
        .Data_Out(Green_Out),
        .Data_A(Green_to_Mux),
        .Data_B(32'b0),
        .Select(Control_Green)
    );
    Mux2_1 BLUE (
        .Data_Out(Blue_Out),
        .Data_A(Blue_to_Mux),
        .Data_B(32'b0),
        .Select(Control_Blue)
    );

    
endmodule
