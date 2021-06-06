module Convolution2D_1x1_stride1x1 (
    input [31:0] Data_In,
    input [31:0] Kernel,
    input Valid_In,
    input clk,
    input rst,
    output [31:0] Data_Out,
    output Valid_Out
    
);
    wire [31:0] kernel_Data_Out;
    wire kernel_Valid_Out;

    Kernel_1x1_stride_1x1 kernel (
        .Data_In(Data_In),
        .Valid_In(Valid_In),
        .clk(clk),
        .rst(rst),
        .Data_Out(kernel_Data_Out),
        .Valid_Out(kernel_Valid_Out)
    );

    Convo_Core_1x1 core(
        .Data_In(kernel_Data_Out),
        .Kernel(Kernel),
        .Valid_In(kernel_Valid_Out),
        .Data_Out(Data_Out),
        .Valid_Out(Valid_Out)
    );

    
endmodule