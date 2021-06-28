module Covolution2D_3x3_stride1x1 #(
    parameter DATA_WIDHT = 32, 
    parameter IMG_HEIGHT = 220,
    parameter IMG_WIDTH = 220
) (
    input [DATA_WIDHT-1:0] Data_In,
    input [31:0] Kernel1,
    input [31:0] Kernel2,
    input [31:0] Kernel3,
    input [31:0] Kernel4,
    input [31:0] Kernel5,
    input [31:0] Kernel6,
    input [31:0] Kernel7,
    input [31:0] Kernel8,
    input [31:0] Kernel9,
    input clk,
    input rst,
    input Valid_In,
    output [DATA_WIDHT-1:0] Data_Out,
    output Valid_Out
);

    wire [DATA_WIDHT-1:0] Kernel_Data_Out1,Kernel_Data_Out2,Kernel_Data_Out3,Kernel_Data_Out4,Kernel_Data_Out5,Kernel_Data_Out6,Kernel_Data_Out7,Kernel_Data_Out8,Kernel_Data_Out9;
    wire kernel_Valid_Out;
    Kernel_3x3_stride_1x1 #(.DATA_WIDHT(32),.IMG_WIDHT(IMG_WIDTH),.IMG_HEIGHT(IMG_HEIGHT))
        Kernel (
            .Data_In(Data_In),
            .Valid_in(Valid_In),
            .clk(clk),
            .rst(rst),
            .Data_Out1(Kernel_Data_Out1),
            .Data_Out2(Kernel_Data_Out2),
            .Data_Out3(Kernel_Data_Out3),
            .Data_Out4(Kernel_Data_Out4),
            .Data_Out5(Kernel_Data_Out5),
            .Data_Out6(Kernel_Data_Out6),
            .Data_Out7(Kernel_Data_Out7),
            .Data_Out8(Kernel_Data_Out8),
            .Data_Out9(Kernel_Data_Out9),
            .Valid_Out(kernel_Valid_Out)
        );
    Convo_Core_3x3 core (
            .Data_In0(Kernel_Data_Out1),
            .Data_In1(Kernel_Data_Out2),
            .Data_In2(Kernel_Data_Out3),
            .Data_In3(Kernel_Data_Out4),
            .Data_In4(Kernel_Data_Out5),
            .Data_In5(Kernel_Data_Out6),
            .Data_In6(Kernel_Data_Out7),
            .Data_In7(Kernel_Data_Out8),
            .Data_In8(Kernel_Data_Out9),
            .Kernel0(Kernel1),
            .Kernel1(Kernel2),
            .Kernel2(Kernel3),
            .Kernel3(Kernel4),
            .Kernel4(Kernel5),
            .Kernel5(Kernel6),
            .Kernel6(Kernel7),
            .Kernel7(Kernel8),
            .Kernel8(Kernel9),
            .Valid_In(kernel_Valid_Out),
            .Data_Out(Data_Out),
            .Valid_Out(Valid_Out)
    );
endmodule