module FtI (
    Interger_Out,Float_In,Clk,Clear,OE
);
    input Clk,Clear,OE;
    input [31:0] Float_In;
    output [31:0] Interger_Out;

    wire [31:0] Int_out_FtI;
    Float_To_Int FtI (
        .a(Float_In),
        .d(Int_out_FtI),
        .p_lost(),
        .denorm(),
        .invalid()
    );

    Regsister_Out Reg (
        .Data_Out(Interger_Out),
        .Data_In(Int_out_FtI),
        .Value_In(OE),
        .Clk(Clk),
        .Clear(Clear)
    );

endmodule