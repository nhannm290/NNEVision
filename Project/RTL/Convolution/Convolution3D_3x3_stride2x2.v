module Convolution3D_3x3_stride2x2 #(parameter IMG_WIDHT = 299,parameter IMG_HEIGHT = 299) (
    input [31:0] RED.
    input [31:0] GREEN,
    input [31:0] BLUE
);
    Convolution2D_3x3_stride2x2  #(.IMG_WIDHT(IMG_WIDHT),.IMG_HEIGHT(IMG_WIDHT))
        conv2d_RED(
            .Data_In(),
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
            .Data_In(),
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
            .Data_In(),
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