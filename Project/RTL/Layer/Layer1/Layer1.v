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
            .Kernel1(32'b10111110100101010101000101011100),
            .Kernel2(32'b10111011011001001001100010011100),
            .Kernel3(32'b00111110100100101011010001001010),
            .Kernel4(32'b10111110111110100010011011000111),
            .Kernel5(32'b00111110011110101111101111011011),
            .Kernel6(32'b00111110101100111001010001101000),
            .Kernel7(32'b10111111000111000110001111011001),
            .Kernel8(32'b00111110101011101100101111000001),
            .Kernel9(32'b00111110111001111100110000111001),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL1_Data_Out),
            .Valid_Out(CHANNEL1_Valid_Out)
        );
        
        Batch_Norm bn1(
            .Data_A(32'b01000000100001111000001110011001), // Thông số A sau khi tính
            .Data_B(32'b10111111000110101000110101100010),
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
            .Kernel1(32'b00111110000001010011100111110011),
            .Kernel2(32'b00111110101010111001101111000001),
            .Kernel3(32'b00111110111111111110000110001000),
            .Kernel4(32'b10111010100011111100111000101111),
            .Kernel5(32'b00111100000010111010010101001000),
            .Kernel6(32'b00111110111111010000110101100100),
            .Kernel7(32'b10111110111001100101011011111011),
            .Kernel8(32'b10111111000010100110110110100100),
            .Kernel9(32'b10111111000010100001000011100111),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL2_Data_Out),
            .Valid_Out(CHANNEL2_Valid_Out)
        );
        
        Batch_Norm bn2(
            .Data_A(32'b01000000100100011110101110000000), // Thông số A sau khi tính
            .Data_B(32'b00111110000011011101001100101001),
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
            .Kernel1(32'b10111110100001001001000011010101),
            .Kernel2(32'b10111110101010001110111010101001),
            .Kernel3(32'b00111110110010110001001000000010),
            .Kernel4(32'b10111110000001111111101010110111),
            .Kernel5(32'b10111110111110001100110010000001),
            .Kernel6(32'b10111110101010100001011010100100),
            .Kernel7(32'b00111111001111010001000111000100),
            .Kernel8(32'b00111110010101010110111000011101),
            .Kernel9(32'b00111101010000100000101111110001),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL3_Data_Out),
            .Valid_Out(CHANNEL3_Valid_Out)
        );
        
        Batch_Norm bn3(
            .Data_A(32'b01000000110100111100010010000011), // Thông số A sau khi tính
            .Data_B(32'b00111111000000010010110010101110),
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
            .Kernel1(32'b00111100111100001001101000111101),
            .Kernel2(32'b10111110010111101011010011001010),
            .Kernel3(32'b00111110010011110110101001011110),
            .Kernel4(32'b00111111010010011011101111110000),
            .Kernel5(32'b10111111001000000110110100101011),
            .Kernel6(32'b10111110100101101001001010011001),
            .Kernel7(32'b00111110010100010001000000001001),
            .Kernel8(32'b00111110010100111100111000101111),
            .Kernel9(32'b10111110001001001100001101000011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL4_Data_Out),
            .Valid_Out(CHANNEL4_Valid_Out)
        );
        
        Batch_Norm bn4(
            .Data_A(32'b01000000110111100111001000001110), // Thông số A sau khi tính
            .Data_B(32'b10111110111011011000101101110000),
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
            .Kernel1(32'b10111110000000101100100110000010),
            .Kernel2(32'b00111110000010001100110100101100),
            .Kernel3(32'b10111111000101110100100111001001),
            .Kernel4(32'b10111111001010111111000011011100),
            .Kernel5(32'b00111110100010110101000010110011),
            .Kernel6(32'b00111110101101111111101011011010),
            .Kernel7(32'b10111101111111100110110101110011),
            .Kernel8(32'b00111110111111101110010001110111),
            .Kernel9(32'b00111110010110011111110010101001),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL5_Data_Out),
            .Valid_Out(CHANNEL5_Valid_Out)
        );
        
        Batch_Norm bn5(
            .Data_A(32'b01000000110100100000111001110101), // Thông số A sau khi tính
            .Data_B(32'b00111110000010100100010000001110),
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
            .Kernel1(32'b00111111000001000010110110011000),
            .Kernel2(32'b10111110011010000010010100000110),
            .Kernel3(32'b00111110010101110001001101100011),
            .Kernel4(32'b10111110111000110101001110111100),
            .Kernel5(32'b10111110101010011001110100010101),
            .Kernel6(32'b00111110001011010111110100100000),
            .Kernel7(32'b10111110110100000110110100000010),
            .Kernel8(32'b00111111000110110011111000100110),
            .Kernel9(32'b10111101101111111010011111101010),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL6_Data_Out),
            .Valid_Out(CHANNEL6_Valid_Out)
        );
        
        Batch_Norm bn6(
            .Data_A(32'b01000001000111111000011001000101), // Thông số A sau khi tính
            .Data_B(32'b00111010100100001100010001101110),
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
            .Kernel1(32'b00111110110001110101011100010110),
            .Kernel2(32'b10111111001100100001001000001000),
            .Kernel3(32'b10111110011000101110100100101010),
            .Kernel4(32'b10111101101011000001010010111001),
            .Kernel5(32'b10111110101100001111011010010100),
            .Kernel6(32'b00111101000111010111011110100000),
            .Kernel7(32'b10111100111000111000010111111001),
            .Kernel8(32'b00111110100000100001010100001100),
            .Kernel9(32'b00111111001111100000110001001111),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL7_Data_Out),
            .Valid_Out(CHANNEL7_Valid_Out)
        );
        
        Batch_Norm bn7(
            .Data_A(32'b01000000110010001110111100110001), // Thông số A sau khi tính
            .Data_B(32'b10111110000111000010101100010100),
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
            .Kernel1(32'b10111110011011101011010100001101),
            .Kernel2(32'b10111110011111111111110011010011),
            .Kernel3(32'b00111110100001000111100000000110),
            .Kernel4(32'b10111110110110110011100000110110),
            .Kernel5(32'b10111111010111100010100001111111),
            .Kernel6(32'b00111111001010010011001011010101),
            .Kernel7(32'b00111110010111110101010100100011),
            .Kernel8(32'b10111110011000001101111100011001),
            .Kernel9(32'b00111101100110001000111010111101),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(CHANNEL8_Data_Out),
            .Valid_Out(CHANNEL8_Valid_Out)
        );
        
        Batch_Norm bn8(
            .Data_A(32'b01000000011001100110100000111110), // Thông số A sau khi tính
            .Data_B(32'b00111111101101111010100101000111),
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