module Adder_8input (
    input [31:0] Data1,
    input [31:0] Data2,
    input [31:0] Data3,
    input [31:0] Data4,
    input [31:0] Data5,
    input [31:0] Data6,
    input [31:0] Data7,
    input [31:0] Data8,
    input Valid_In,
    output [31:0] Data_Out,
    output Valid_Out
);

    FP_Adder add0[3:0] (
        .Data_A(), 
        .Data_B(),
    );
    
endmodule