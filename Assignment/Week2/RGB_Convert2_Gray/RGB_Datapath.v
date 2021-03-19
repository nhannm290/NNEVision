module RGB_Datapath (
    Data_Out,Data_In,CLK,Clear,Controll_Out
);
    parameter RED_Factor = 32'h3e991687;
    parameter GREEN_Factor = 32'h3f1645a2;
    parameter BLUE_Factor = 32'h3de978d5;

    input wire [23:0] Data_In;
    input CLK,Clear,Controll_Out;
    output [7:0] Data_Out;
    wire [31:0] Result;
    wire [31:0] Red_Line_Mul,Blue_Line_Mul, GREEN_Line_Mul;
    wire [31:0] Red_Line_Add,GREEN_Line_Add,BLUE_Line_Add,Red_GREEN_Line_Add,RED_GREEN_BLUE_Add_Line;
    wire FtI_Out;
    wire Out_Signal_Red_Mul,Out_Signal_GREEN_Mul,Out_Signal_BLUE_Mul;
    wire Out_Signal_RED_GREEN_Add,Out_Signal_RED_GREEN_BLUE_Add,In_Signal_RED_GREEN_Add;
    wire [31:0] BLUE_Line_Reg1, BLUE_Line_Reg2, BLUE_Line_Reg3,BLUE_Line_Reg4;


    ItF RED (
        .Int_In({24'b0,Data_In[23:16]}),
        .Float_Out(Red_Line_Mul),
        .clk(CLK),
        .clr(Clear),
        .Out_Enable(1'b1)
    );
    ItF GREEN (
        .Int_In({24'b0,Data_In[15:8]}),
        .Float_Out(GREEN_Line_Mul),
        .clk(CLK),
        .clr(Clear),
        .Out_Enable(1'b1)
    );
    ItF BLUE (
        .Int_In({24'b0,Data_In[7:0]}),
        .Float_Out(Blue_Line_Mul),
        .clk(CLK),
        .clr(Clear),
        .Out_Enable(1'b1)
    );
    
    FPM RED_Mul(
        .clk(CLK),
        .start(1'b1),
        .a(Red_Line_Mul),
        .b(RED_Factor),
        .bias(8'd127),
        .out(Red_Line_Add),
        .result(Out_Signal_Red_Mul),
        .overflow()
    );

    FPM GREEN_Mul(
        .clk(CLK),
        .start(1'b1),
        .a(GREEN_Line_Mul),
        .b(GREEN_Factor),
        .bias(8'd127),
        .out(GREEN_Line_Add),
        .result(Out_Signal_GREEN_Mul),
        .overflow()
    );
    
    FPM BLUE_Mul(
        .clk(CLK),
        .start(1'b1),
        .a(Blue_Line_Mul),
        .b(BLUE_Factor),
        .bias(8'd127),
        .out(BLUE_Line_Reg1),
        .result(Out_Signal_BLUE_Mul),
        .overflow()
    );
    
    Reg_Pipeline R1(
        .Data_out(BLUE_Line_Reg2),
        .Data_in(BLUE_Line_Reg1),
        .Enable(1'b1),
        .CLK(CLK)
    );
    Reg_Pipeline R2(
        .Data_out(BLUE_Line_Reg3),
        .Data_in(BLUE_Line_Reg2),
        .Enable(1'b1),
        .CLK(CLK)
    );
    Reg_Pipeline R3(
        .Data_out(BLUE_Line_Reg4),
        .Data_in(BLUE_Line_Reg3),
        .Enable(1'b1),
        .CLK(CLK)
    );
    Reg_Pipeline R4(
        .Data_out(BLUE_Line_Add),
        .Data_in(BLUE_Line_Reg4),
        .Enable(1'b1),
        .CLK(CLK)
    );
    assign In_Signal_RED_GREEN_Add = Out_Signal_GREEN_Mul & Out_Signal_Red_Mul;
    FPA_Pipeline RED_GREEN_Add(
        .Result(Red_GREEN_Line_Add), 
        .Value_Out(Out_Signal_RED_GREEN_Add), 
        .Value_In(In_Signal_RED_GREEN_Add),
        .Sub_Signal(1'b0),
        .Rm(2'b0),
        .OpA(Red_Line_Add),
        .OpB(GREEN_Line_Add),
        .Clk(~CLK),
        .Clear(Clear)
    );
    assign Out_Signal_RED_GREEN_BLUE_Add =Out_Signal_BLUE_Mul & Out_Signal_RED_GREEN_Add ;

    

    FPA_Pipeline RED_GREEN_BLUE_Add(
        .Result(RED_GREEN_BLUE_Add_Line), 
        .Value_Out(FtI_Out), 
        .Value_In(Out_Signal_RED_GREEN_BLUE_Add),
        .Sub_Signal(1'b0),
        .Rm(2'b0),
        .OpA(Red_GREEN_Line_Add),
        .OpB(BLUE_Line_Add),
        .Clk(~CLK),
        .Clear(Clear)
    );

    FtI Out_Gray(
        .Interger_Out(Result),
        .Float_In(RED_GREEN_BLUE_Add_Line),
        .Clk(CLK),
        .Clear(Clear),
        .OE(FtI_Out)
    );
    Reg_Output RO (
        .Data_out(Data_Out),
        .Data_in(Result),
        .Enable(Controll_Out),
        .CLK(CLK)
    );


endmodule
