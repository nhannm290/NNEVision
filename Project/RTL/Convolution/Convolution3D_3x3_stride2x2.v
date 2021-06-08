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
    wire [31:0] Channel0_Data_Out,Channel1_Data_Out,Channel2_Data_Out;
    wire Channel0_Valid_Out,Channel1_Valid_Out,Channel2_Valid_Out;

    Convolution2D_3x3_stride2x2  #(.IMG_WIDHT(IMG_WIDHT),.IMG_HEIGHT(IMG_WIDHT))
        conv2d_Channel0(
            .Data_In(Channel0),
            .Kernel0(Kernel0),
            .Kernel1(Kernel1),
            .Kernel2(Kernel2),
            .Kernel3(Kernel3),
            .Kernel4(Kernel4),
            .Kernel5(Kernel5),
            .Kernel6(Kernel6),
            .Kernel7(Kernel7),
            .Kernel8(Kernel8),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Channel0_Data_Out),
            .Valid_Out(Channel0_Valid_Out)
        );

    Convolution2D_3x3_stride2x2  #(.IMG_WIDHT(IMG_WIDHT),.IMG_HEIGHT(IMG_WIDHT))
        conv2d_Channel1(
            .Data_In(Channel1),
            .Kernel0(Kernel9),
            .Kernel1(Kernel10),
            .Kernel2(Kernel11),
            .Kernel3(Kernel12),
            .Kernel4(Kernel13),
            .Kernel5(Kernel14),
            .Kernel6(Kernel15),
            .Kernel7(Kernel16),
            .Kernel8(Kernel17),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Channel0_Data_Out),
            .Valid_Out(Channel1_Valid_Out)
        );

    Convolution2D_3x3_stride2x2  #(.IMG_WIDHT(IMG_WIDHT),.IMG_HEIGHT(IMG_WIDHT))
        conv2d_Channel2(
            .Data_In(Channel2),
            .Kernel0(Kernel18),
            .Kernel1(Kernel19),
            .Kernel2(Kernel20),
            .Kernel3(Kernel21),
            .Kernel4(Kernel22),
            .Kernel5(Kernel23),
            .Kernel6(Kernel24),
            .Kernel7(Kernel25),
            .Kernel8(Kernel26),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Channel0_Data_Out),
            .Valid_Out(Channel2_Valid_Out)
        );

    wire [31:0] reg0_Out0,reg0_Out1,reg0_Out2;

    nbit_Dff #(.DATA_WIDHT(32))
        reg0[2:0] (
            .Data_In({Channel0_Valid_Out,Channel1_Valid_Out,Channel2_Valid_Out}),
            .clk(clk),
            .rst(rst),
            .enable(Channel0_Valid_Out & Channel1_Valid_Out & Channel2_Valid_Out),
            .Data_Out({reg0_Out0,reg0_Out1,reg0_Out2})  
        );        

    wire[31:0] add0_Data_Out;
    wire add0_Valid_Out;
    FP_Adder add0 (
        .Data_A(reg0_Out0),
        .Data_B(reg1_Out0),
        .Valid_In(Valid_In),
        .Mode(1'b0),
        .RMode(2'b0),
        .Data_Out(add0_Data_Out),
        .Valid_Out(add0_Valid_Out)
    );

    wire [31:0] reg1_Out0,reg1_Out1;

    nbit_Dff #(.DATA_WIDHT(32))
        reg1[1:0] (
            .Data_In({add0_Valid_Out,reg0_Out2}),
            .clk(clk),
            .rst(rst),
            .Data_Out({reg1_Out0,reg1_Out1})
        );


    FP_Adder add1 (
        .Data_A(reg1_Out0),
        .Data_B(reg1_Out1),
        .Valid_In(Valid_In),
        .Mode(1'b0),
        .RMode(2'b0),
        .Data_Out(Data_Out),
        .Valid_Out(Valid_Out)
    );

endmodule