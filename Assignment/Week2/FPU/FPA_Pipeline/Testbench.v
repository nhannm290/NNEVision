module Testbench (
);
    reg Clk,Clear,Value_in,Sub_Signal;
    reg [31:0] OpA,OpB;
    reg [1:0] Rm;
    wire [31:0] Result;
    wire Value_Out;
    
    initial begin
        Clk = 1'b0;
        Clear = 1'b1;
        OpA = 32'h4234d70a; //45.21
        OpB = 32'h4176cccd; //15.425
        Value_in = 1'b1;
        Sub_Signal = 1'b0;
        Rm = 2'b0;
        #150
        OpA = 0; //45.21
        OpB = 0;
        Value_in = 1'b0;

    end
    always  
    #50 Clk <= ~Clk;

    FPA_Pipeline DUT (
        .Result(Result),
        .Value_Out(Value_Out), 
        .Value_In(Value_in),
        .Sub_Signal(Sub_Signal),
        .Rm(Rm),
        .OpA(OpA),
        .OpB(OpB),
        .Clk(Clk),
        .Clear(Clear)
    );
endmodule
