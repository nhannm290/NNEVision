module Converter_ItF_Block (
    Red_Out,Green_Out,Blue_Out,Red_In,Green_In,Blue_In,CLK,CLEAR, ENABLE_IN,ENABLE_OUT
);
    input   wire [7:0] Red_In,Green_In,Blue_In;
    input   wire CLK,CLEAR,ENABLE_IN,ENABLE_OUT;
    output  wire [31:0] Red_Out,Green_Out,Blue_Out;

    wire [7:0] Red_to_Reg,Green_to_Reg,Blue_to_Reg;

    Reg_Out Reg_Red(
        .Data_Out(Red_to_Reg),
        .Data_In(Red_In),
        .Enable(ENABLE_IN),
        .CLK(CLK),
        .CLEAR(CLEAR)
    );

    Reg_Out Reg_Green( 
        .Data_Out(Green_to_Reg),
        .Data_In(Green_In),
        .Enable(ENABLE_IN),
        .CLK(CLK),
        .CLEAR(CLEAR)
    );

    Reg_Out Reg_Blue(
        .Data_Out(Blue_to_Reg),
        .Data_In(Blue_In),
        .Enable(ENABLE_IN),
        .CLK(CLK),
        .CLEAR(CLEAR)
    );
  
    ItF RED (
        .Int_In({24'h0,Red_to_Reg}),
        .Float_Out(Red_Out),
        .clk(CLK),
        .clr(CLEAR),
        .Out_Enable(ENABLE_OUT)
    );
    ItF GREEN (
        .Int_In({24'h0,Green_to_Reg}),
        .Float_Out(Green_Out),
        .clk(CLK),
        .clr(CLEAR),
        .Out_Enable(ENABLE_OUT)
    );
    ItF BLUE (
        .Int_In({24'h0,Blue_to_Reg}),
        .Float_Out(Blue_Out),
        .clk(CLK),
        .clr(CLEAR),
        .Out_Enable(ENABLE_OUT)
    );

    
    
endmodule