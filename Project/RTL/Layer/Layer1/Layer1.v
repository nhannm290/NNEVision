module Layer1  #(
    parameter DATA_WIDHT = 32,
    parameter IMG_WIDHT =220,
    parameter IMG_HEIGHT =220,
    parameter CHANNEL_IN = 1, 
    parameter CHANNEL_OUT =8;
) (
    input [DATA_WIDHT-1:0] Data_In,
    input clk,
    input rst,
    input Valid_In,
    output [DATA_WIDHT*CHANNEL_OUT-1:0] DataOut,
    output Valid_Out
);  
    wire CHANNEL1_Valid_Out,CHANNEL2_Valid_Out,CHANNEL3_Valid_Out,CHANNEL4_Valid_Out,CHANNEL5_Valid_Out,CHANNEL6_Valid_Out,CHANNEL7_Valid_Out,CHANNEL8_Valid_Out;
    wire [31:0] CHANNEL1_Data_Out,CHANNEL2_Data_Out,CHANNEL3_Data_Out,CHANNEL4_Data_Out,CHANNEL5_Data_Out,CHANNEL6_Data_Out,CHANNEL7_Data_Out,CHANNEL8_Data;
    wire [31:0] bn1_Data_Out,bn2_Data_Out,bn3_Data_Out,bn4_Data_Out,bn5_Data_Out,bn6_Data_Out,bn7_Data_Out,bn8_Data_Out;
    wire bn1_Valid_Out,bn2_Valid_Out,bn3_Valid_Out,bn4_Valid_Out,bn5_Valid_Out,bn6_Valid_Out,bn7_Valid_Out,bn8_Valid_Out;
    wire rl1_Valid_Out,rl2_Valid_Out,rl3_Valid_Out,rl4_Valid_Out,rl5_Valid_Out,rl6_Valid_Out,rl7_Valid_Out,rl8_Valid_Out;

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL1 (
            .Data_In(Data_In),
            .Kernel1(0),
            .Kernel2(0),
            .Kernel3(0),
            .Kernel4(0),
            .Kernel5(0),
            .Kernel6(0),
            .Kernel7(0),
            .Kernel8(0),
            .Kernel9(0),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL1_Data_Out),
            .Valid_Out(CHANNEL1_Valid_Out)
        );
        
        Batch_Norm bn1(
            .Data_A(), // Thông số A sau khi tính
            .Data_B(),
            .Data_In(CHANNEL1_Data_Out),
            .Valid_In(CHANNEL1_Valid_Out),
            .Data_Out(bn1_Data_Out),
            .Valid_Out(bn1_Valid_Out)
        );

        Relu_Core rl1(
            .Data_In(bn1_Data_Out),
            .Valid_In(bn1_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT-1:0]),
            .Valid_Out(rl1_Valid_Out)

        );
    
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL2 (
            .Data_In(Data_In),
            .Kernel1(0),
            .Kernel2(0),
            .Kernel3(0),
            .Kernel4(0),
            .Kernel5(0),
            .Kernel6(0),
            .Kernel7(0),
            .Kernel8(0),
            .Kernel9(0),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL2_Data_Out),
            .Valid_Out(CHANNEL2_Valid_Out)
        );
        
        Batch_Norm bn2(
            .Data_A(), // Thông số A sau khi tính
            .Data_B(),
            .Data_In(CHANNEL2_Data_Out),
            .Valid_In(CHANNEL2_Valid_Out),
            .Data_Out(bn2_Data_Out),
            .Valid_Out(bn2_Valid_Out)
        );

        Relu_Core rl2(
            .Data_In(bn2_Data_Out),
            .Valid_In(bn2_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Valid_Out(rl2_Valid_Out)
        );

        Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL3 (
            .Data_In(Data_In),
            .Kernel1(0),
            .Kernel2(0),
            .Kernel3(0),
            .Kernel4(0),
            .Kernel5(0),
            .Kernel6(0),
            .Kernel7(0),
            .Kernel8(0),
            .Kernel9(0),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL3_Data_Out),
            .Valid_Out(CHANNEL3_Valid_Out)
        );
        
        Batch_Norm bn3(
            .Data_A(), // Thông số A sau khi tính
            .Data_B(),
            .Data_In(CHANNEL3_Data_Out),
            .Valid_In(CHANNEL3_Valid_Out),
            .Data_Out(bn3_Data_Out),
            .Valid_Out(bn3_Valid_Out)
        );

        Relu_Core rl3(
            .Data_In(bn3_Data_Out),
            .Valid_In(bn3_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Valid_Out(rl3_Valid_Out)
        );

        Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL4 (
            .Data_In(Data_In),
            .Kernel1(0),
            .Kernel2(0),
            .Kernel3(0),
            .Kernel4(0),
            .Kernel5(0),
            .Kernel6(0),
            .Kernel7(0),
            .Kernel8(0),
            .Kernel9(0),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL4_Data_Out),
            .Valid_Out(CHANNEL4_Valid_Out)
        );
        
        Batch_Norm bn4(
            .Data_A(), // Thông số A sau khi tính
            .Data_B(),
            .Data_In(CHANNEL4_Data_Out),
            .Valid_In(CHANNEL4_Valid_Out),
            .Data_Out(bn4_Data_Out),
            .Valid_Out(bn4_Valid_Out)
        );

        Relu_Core rl4(
            .Data_In(bn4_Data_Out),
            .Valid_In(bn4_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Valid_Out(rl4_Valid_Out)
        );

        Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL5 (
            .Data_In(Data_In),
            .Kernel1(0),
            .Kernel2(0),
            .Kernel3(0),
            .Kernel4(0),
            .Kernel5(0),
            .Kernel6(0),
            .Kernel7(0),
            .Kernel8(0),
            .Kernel9(0),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL5_Data_Out),
            .Valid_Out(CHANNEL5_Valid_Out)
        );
        
        Batch_Norm bn5(
            .Data_A(), // Thông số A sau khi tính
            .Data_B(),
            .Data_In(CHANNEL5_Data_Out),
            .Valid_In(CHANNEL5_Valid_Out),
            .Data_Out(bn5_Data_Out),
            .Valid_Out(bn5_Valid_Out)
        );

        Relu_Core rl3(
            .Data_In(bn5_Data_Out),
            .Valid_In(bn5_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Valid_Out(rl5_Valid_Out)
        );

        Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL6 (
            .Data_In(Data_In),
            .Kernel1(0),
            .Kernel2(0),
            .Kernel3(0),
            .Kernel4(0),
            .Kernel5(0),
            .Kernel6(0),
            .Kernel7(0),
            .Kernel8(0),
            .Kernel9(0),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL6_Data_Out),
            .Valid_Out(CHANNEL6_Valid_Out)
        );
        
        Batch_Norm bn6(
            .Data_A(), // Thông số A sau khi tính
            .Data_B(),
            .Data_In(CHANNEL6_Data_Out),
            .Valid_In(CHANNEL6_Valid_Out),
            .Data_Out(bn6_Data_Out),
            .Valid_Out(bn6_Valid_Out)
        );

        Relu_Core rl6(
            .Data_In(bn6_Data_Out),
            .Valid_In(bn6_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Valid_Out(rl6_Valid_Out)
        );

        Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL7 (
            .Data_In(Data_In),
            .Kernel1(0),
            .Kernel2(0),
            .Kernel3(0),
            .Kernel4(0),
            .Kernel5(0),
            .Kernel6(0),
            .Kernel7(0),
            .Kernel8(0),
            .Kernel9(0),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL7_Data_Out),
            .Valid_Out(CHANNEL7_Valid_Out)
        );
        
        Batch_Norm bn7(
            .Data_A(), // Thông số A sau khi tính
            .Data_B(),
            .Data_In(CHANNEL7_Data_Out),
            .Valid_In(CHANNEL7_Valid_Out),
            .Data_Out(bn7_Data_Out),
            .Valid_Out(bn7_Valid_Out)
        );

        Relu_Core rl7(
            .Data_In(bn6_Data_Out),
            .Valid_In(bn7_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Valid_Out(rl7_Valid_Out)
        );

        Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL8 (
            .Data_In(Data_In),
            .Kernel1(0),
            .Kernel2(0),
            .Kernel3(0),
            .Kernel4(0),
            .Kernel5(0),
            .Kernel6(0),
            .Kernel7(0),
            .Kernel8(0),
            .Kernel9(0),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL8_Data_Out),
            .Valid_Out(CHANNEL8_Valid_Out)
        );
        
        Batch_Norm bn8(
            .Data_A(), // Thông số A sau khi tính
            .Data_B(),
            .Data_In(CHANNEL8_Data_Out),
            .Valid_In(CHANNEL8_Valid_Out),
            .Data_Out(bn8_Data_Out),
            .Valid_Out(bn8_Valid_Out)
        );

        Relu_Core rl8(
            .Data_In(bn6_Data_Out),
            .Valid_In(bn6_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_Out(rl8_Valid_Out)
        );

endmodule