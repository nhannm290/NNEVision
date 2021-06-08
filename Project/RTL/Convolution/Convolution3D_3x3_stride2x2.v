module Convolution3D_3x3_stride2x2_3_Channel #(parameter IMG_WIDHT = 299,parameter IMG_HEIGHT = 299) (
    input [31:0] Channel0,
    input [31:0] Channel1,
    input [31:0] Channel2,
    input [31:0] Kernel0,
    input [31:0] Kernel1,
    input [31:0] Kernel2,
    input [31:0] Kernel3,
    input [31:0] Kernel4,
    input [31:0] Kernel5,
    input [31:0] Kernel6,
    input [31:0] Kernel7,
    input [31:0] Kernel8,
    input [31:0] Kernel9,
    input [31:0] Kernel10,
    input [31:0] Kernel11,
    input [31:0] Kernel12,
    input [31:0] Kernel13,
    input [31:0] Kernel14,
    input [31:0] Kernel15,
    input [31:0] Kernel16,
    input [31:0] Kernel17,
    input [31:0] Kernel18,
    input [31:0] Kernel19,
    input [31:0] Kernel20,
    input [31:0] Kernel21,
    input [31:0] Kernel22,
    input [31:0] Kernel23,
    input [31:0] Kernel24,
    input [31:0] Kernel25,
    input [31:0] Kernel26,
    input Valid_In,
    input clk,
    input rst,
    output [31:0] Data_Out,
    output Valid_Out

);
    Convolution2D_3x3_stride2x2  #(.IMG_WIDHT(IMG_WIDHT),.IMG_HEIGHT(IMG_WIDHT))
        conv2d_RED(
            .Data_In(Channel0),
            .Kernel0(),
            .Kernel1(),
            .Kernel2(),
            .Kernel3(),
            .Kernel4(),
            .Kernel5(),
            .Kernel6(),
            .Kernel7(),
            .Kernel8(),
            .clk(),
            .rst(),
            .Valid_In(),
            .Data_Out(),
            .Valid_Out()
        );

    Convolution2D_3x3_stride2x2  #(.IMG_WIDHT(IMG_WIDHT),.IMG_HEIGHT(IMG_WIDHT))
        conv2d_GREEN(
            .Data_In(Channel1),
            .Kernel0(),
            .Kernel1(),
            .Kernel2(),
            .Kernel3(),
            .Kernel4(),
            .Kernel5(),
            .Kernel6(),
            .Kernel7(),
            .Kernel8(),
            .clk(),
            .rst(),
            .Valid_In(),
            .Data_Out(),
            .Valid_Out()
        );

    Convolution2D_3x3_stride2x2  #(.IMG_WIDHT(IMG_WIDHT),.IMG_HEIGHT(IMG_WIDHT))
        conv2d_BLUE(
            .Data_In(Channel2),
            .Kernel0(),
            .Kernel1(),
            .Kernel2(),
            .Kernel3(),
            .Kernel4(),
            .Kernel5(),
            .Kernel6(),
            .Kernel7(),
            .Kernel8(),
            .clk(),
            .rst(),
            .Valid_In(),
            .Data_Out(),
            .Valid_Out()
        );

    nbit_Dff #(.DATA_WIDHT(32))
        reg0[2:0] (
            .Data_In(),
            .clk(),
            .rst(),
            .enable(),
            .
        );        
endmodule