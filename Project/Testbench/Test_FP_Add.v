`timescale 1ns/1ps
module Test_FP_Add (
    
);
    parameter CLK = 20;
    parameter Period =CLK*2 ;

    reg [31:0] Data_A, Data_B;
    reg Valid_In,Mode;
    reg [1:0] RMode;
    wire [31:0] Data_Out;
    wire Valid_Out;

    initial begin
        Valid_In = 1;
        Mode = 0;
        Data_A = 32'h401c28f6;
        Data_B = 32'h40a39581;
        RMode = 2'd0;
        #100
        Mode = 1;

    end
    FP_Adder DUT (
        .Data_A(Data_A),
        .Data_B(Data_B),
        .Valid_In(Valid_In),
        .Mode(Mode),
        .RMode(RMode),
        .Data_Out(Data_Out),
        .Valid_Out(Valid_Out)
    );

endmodule