module ItF (
    Float_Out,Int_In,clk,clr,Out_Enable
);
    input wire [31:0] Int_In;
    output wire [31:0] Float_Out;
    input clk,clr,Out_Enable;

    wire [31:0] ItF_to_Reg;
    Int_to_Float Module1 (
        .d(Int_In),
        .a(ItF_to_Reg),
        .p_lost()
    );

    Reg Module2 (
        .Result(Float_Out),
        .Float_In(ItF_to_Reg),
        .clk(clk),
        .clr(clr),
        .enable(Out_Enable)
    );
endmodule