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
    
    wire [31:0] add0_Out1,add0_Out2,add0_Out3,add0_Out4;
    wire add0_Valid_Out;
    FP_Adder add0[3:0] (
        .Data_A({Data1,Data3,Data5,Data7}), 
        .Data_B({Data2,Data4,Data6,Data8}),
        .Valid_In(Valid_In),
        .Mode(1'b0),
        .RMode(2'b0),
        .Data_Out({add0_Out1,add0_Out2,add0_Out3,add0_Out4}),
        .Valid_Out(add0_Valid_Out)
    );
    
    wire [31:0] add1_Out1,add1_Out2;

    FP_Adder add1[1:0] (
        .Data_A({add0_Out1,add0_Out3}), 
        .Data_B({add0_Out2,add0_Out4}),
        .Valid_In(add0_Valid_Out),
        .Mode(1'b0),
        .RMode(2'b0),
        .Data_Out({add1_Out1,add1_Out2}),
        .Valid_Out(add1_Valid_Out)
    );

    FP_Adder add2 (
        .Data_A(add1_Out1), 
        .Data_B(add1_Out2),
        .Valid_In(add1_Valid_Out),
        .Mode(1'b0),
        .RMode(2'b0),
        .Data_Out(Data_Out),
        .Valid_Out(Valid_Out)
    );


endmodule