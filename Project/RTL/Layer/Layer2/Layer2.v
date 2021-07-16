module Layer2 #(
    parameter DATA_WIDHT = 32,
    parameter IMG_WIDTH =46,
    parameter IMG_HEIGHT =46
) (
    input [DATA_WIDHT*8-1:0] Data_In,
    input clk,
    input rst,
    input Valid_In,
    output [DATA_WIDHT*8-1:0] Data_Out,
    output Valid_Out 
);
    wire [DATA_WIDHT*8-1:0] Data_Out_Kernel1,Data_Out_Kernel2,Data_Out_Kernel3,Data_Out_Kernel4,Data_Out_Kernel5,Data_Out_Kernel6,Data_Out_Kernel7,Data_Out_Kernel8;

    wire channel1_k1_valid_out,channel2_k1_valid_out,channel3_k1_valid_out,channel4_k1_valid_out,channel5_k1_valid_out,channel6_k1_valid_out,channel7_k1_valid_out,channel8_k1_valid_out;

    wire channel1_k2_valid_out,channel2_k2_valid_out,channel3_k2_valid_out,channel4_k2_valid_out,channel5_k2_valid_out,channel6_k2_valid_out,channel7_k2_valid_out,channel8_k2_valid_out;

    wire channel1_k3_valid_out,channel2_k3_valid_out,channel3_k3_valid_out,channel4_k3_valid_out,channel5_k3_valid_out,channel6_k3_valid_out,channel7_k3_valid_out,channel8_k3_valid_out;

    wire channel1_k4_valid_out,channel2_k4_valid_out,channel3_k4_valid_out,channel4_k4_valid_out,channel5_k4_valid_out,channel6_k4_valid_out,channel7_k4_valid_out,channel8_k4_valid_out;

    wire channel1_k5_valid_out,channel2_k5_valid_out,channel3_k5_valid_out,channel4_k5_valid_out,channel5_k5_valid_out,channel6_k5_valid_out,channel7_k5_valid_out,channel8_k5_valid_out;

    wire channel1_k6_valid_out,channel2_k6_valid_out,channel3_k6_valid_out,channel4_k6_valid_out,channel5_k6_valid_out,channel6_k6_valid_out,channel7_k6_valid_out,channel8_k6_valid_out;

    wire channel1_k7_valid_out,channel2_k7_valid_out,channel3_k7_valid_out,channel4_k7_valid_out,channel5_k7_valid_out,channel6_k7_valid_out,channel7_k7_valid_out,channel8_k7_valid_out;

    wire channel1_k8_valid_out,channel2_k8_valid_out,channel3_k8_valid_out,channel4_k8_valid_out,channel5_k8_valid_out,channel6_k8_valid_out,channel7_k8_valid_out,channel8_k8_valid_out;

    wire add_kerne1,add_kerne2,add_kerne3,add_kerne4,add_kerne5,add_kerne6,add_kerne7,add_kerne8;

    wire add_kerne1_Valid_Out,add_kerne2_Valid_Out,add_kerne3_Valid_Out,add_kerne4_Valid_Out,add_kerne5_Valid_Out,add_kerne6_Valid_Out,add_kerne7_Valid_Out,add_kerne8_Valid_Out;

    wire [31:0] add_k1_Data_Out,add_k2_Data_Out,add_k3_Data_Out,add_k4_Data_Out,add_k5_Data_Out,add_k6_Data_Out,add_k7_Data_Out,add_k8_Data_Out;


    wire [31:0] bn1_Data_Out,bn2_Data_Out,bn3_Data_Out,bn4_Data_Out,bn5_Data_Out,bn6_Data_Out,bn7_Data_Out,bn8_Data_Out;

    wire bn1_Valid_Out, bn2_Valid_Out, bn3_Valid_Out,bn4_Valid_Out,bn5_Valid_Out,bn6_Valid_Out,bn7_Valid_Out,bn8_Valid_Out;

    wire rl1_Valid_Out, rl2_Valid_Out, rl3_Valid_Out, rl4_Valid_Out, rl5_Valid_Out, rl6_Valid_Out, rl7_Valid_Out, rl8_Valid_Out;

    assign add_kerne1 = channel1_k1_valid_out & channel2_k1_valid_out & channel3_k1_valid_out & channel4_k1_valid_out & channel5_k1_valid_out & channel6_k1_valid_out & channel7_k1_valid_out & channel8_k1_valid_out;

    assign add_kerne2 = channel1_k2_valid_out & channel2_k2_valid_out & channel3_k2_valid_out & channel4_k2_valid_out & channel5_k2_valid_out  & channel6_k2_valid_out & channel7_k2_valid_out & channel8_k2_valid_out;
    
    assign add_kerne3 = channel1_k3_valid_out & channel2_k3_valid_out & channel3_k3_valid_out & channel4_k3_valid_out & channel5_k3_valid_out  & channel6_k3_valid_out & channel7_k3_valid_out & channel8_k3_valid_out;

    assign add_kerne4 = channel1_k4_valid_out & channel2_k4_valid_out & channel3_k4_valid_out & channel4_k4_valid_out & channel5_k4_valid_out  & channel6_k4_valid_out & channel7_k4_valid_out & channel8_k4_valid_out;


    assign add_kerne5 = channel1_k5_valid_out & channel2_k5_valid_out & channel3_k5_valid_out & channel4_k5_valid_out & channel5_k5_valid_out  & channel6_k5_valid_out & channel7_k5_valid_out & channel8_k5_valid_out;

    assign add_kerne6 = channel1_k6_valid_out & channel2_k6_valid_out & channel3_k6_valid_out & channel4_k6_valid_out & channel5_k6_valid_out  & channel6_k6_valid_out & channel7_k6_valid_out & channel8_k6_valid_out;

    assign add_kerne7 = channel1_k7_valid_out & channel2_k7_valid_out & channel3_k7_valid_out & channel4_k7_valid_out & channel5_k7_valid_out  & channel6_k7_valid_out & channel7_k7_valid_out & channel8_k7_valid_out;

    assign add_kerne8 = channel1_k8_valid_out & channel2_k8_valid_out & channel3_k8_valid_out & channel4_k8_valid_out & channel5_k8_valid_out  & channel6_k8_valid_out & channel7_k8_valid_out & channel8_k8_valid_out;

    assign Valid_Out = rl1_Valid_Out & rl2_Valid_Out & rl3_Valid_Out & rl4_Valid_Out & rl5_Valid_Out & rl6_Valid_Out & rl7_Valid_Out & rl8_Valid_Out;




    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL1_K1(
            .Data_In(Data_In[DATA_WIDHT-1:0]),
            .Kernel1(32'b10111110110001110110101110000100),
            .Kernel2(32'b00111111000000101111001010101111),
            .Kernel3(32'b00111111001010001110011100010011),
            .Kernel4(32'b10111111011101011110011010011000),
            .Kernel5(32'b10111101100111101111000100010100),
            .Kernel6(32'b00111110000001001011101110000001),
            .Kernel7(32'b10111110101010000110110011001001),
            .Kernel8(32'b00111110000111011001010011101110),
            .Kernel9(32'b10111110010000000100000111111100),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel1[DATA_WIDHT-1:0]),
            .Valid_Out(channel1_k1_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL2_K1(
            .Data_In(Data_In[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Kernel1(32'b10111111011001111010010100101010),
            .Kernel2(32'b10111110101101111110011000101010),
            .Kernel3(32'b10111111000011110111010100011001),
            .Kernel4(32'b00111100110111110001110101000001),
            .Kernel5(32'b00111110011110011111011011000010),
            .Kernel6(32'b10111100101000011110000101001111),
            .Kernel7(32'b10111100101000011110000101001111),
            .Kernel8(32'b10111101110011110110001111100100),
            .Kernel9(32'b10111110101100001010000111010101),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel1[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Valid_Out(channel2_k1_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL3_K1(
            .Data_In(Data_In[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Kernel1(32'b00111110101101010100011110010001),
            .Kernel2(32'b00111110011010011011111010011100),
            .Kernel3(32'b00111101111111111000110011101111),
            .Kernel4(32'b00111110011110011011110001001111),
            .Kernel5(32'b00111101110011101000100101010010),
            .Kernel6(32'b00111110001111011010101010011011),
            .Kernel7(32'b00111110000011111100011011110011),
            .Kernel8(32'b00111110000011011110111100000010),
            .Kernel9(32'b00111100001111100000001010011101),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel1[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Valid_Out(channel3_k1_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL4_K1(
            .Data_In(Data_In[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Kernel1(32'b00111111001000001110100011111100),
            .Kernel2(32'b00111101110110010111001111001110),
            .Kernel3(32'b10111111010111010101001101110100),
            .Kernel4(32'b00111110001010000100100011111100),
            .Kernel5(32'b10111100111111000101010101110000),
            .Kernel6(32'b10111110111000000100010110101000),
            .Kernel7(32'b00111101111001101101001010011100),
            .Kernel8(32'b00111110011100001101001001000111),
            .Kernel9(32'b10111110101111110100011101010100),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel1[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Valid_Out(channel4_k1_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL5_K1(
            .Data_In(Data_In[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Kernel1(32'b10111111001001110001101101101010),
            .Kernel2(32'b00111101110111011101101001101001),
            .Kernel3(32'b00111110110110010000011000111100),
            .Kernel4(32'b00111101001101110011101010010000),
            .Kernel5(32'b00111110010110110010100001101010),
            .Kernel6(32'b10111101110011011110101111000000),
            .Kernel7(32'b10111101001010111100100110011101),
            .Kernel8(32'b00111110101001110110101111011111),
            .Kernel9(32'b00111110010010101111110011010010),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel1[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Valid_Out(channel5_k1_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL6_K1(
            .Data_In(Data_In[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Kernel1(32'b10111110101001111001000101101011),
            .Kernel2(32'b00111111011001011000100100000001),
            .Kernel3(32'b00111110001110001111110101111110),
            .Kernel4(32'b10111110111011000010001000101001),
            .Kernel5(32'b10111110001011011000111100100000),
            .Kernel6(32'b10111110000101011111000001100000),
            .Kernel7(32'b00111101101111100011100001110000),
            .Kernel8(32'b00111110010010111110110111100110),
            .Kernel9(32'b10111110010001000100100111001001),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel1[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Valid_Out(channel6_k1_valid_out)
        );
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL7_K1(
            .Data_In(Data_In[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Kernel1(32'b00111110001111101011110001010000),
            .Kernel2(32'b00111110101110110010001111000011),
            .Kernel3(32'b10111101000011100110110001010111),
            .Kernel4(32'b00111111000001000100100011101001),
            .Kernel5(32'b00111110101101111000110100001100),
            .Kernel6(32'b10111110000111001110000010111101),
            .Kernel7(32'b00111101101101110000111111100001),
            .Kernel8(32'b10111100101101011110100101011100),
            .Kernel9(32'b00111110001010100000110011001010),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel1[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Valid_Out(channel7_k1_valid_out)
        );    

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL8_K1(
            .Data_In(Data_In[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Kernel1(32'b00111110101011011010110001111110),
            .Kernel2(32'b00111111001001000110110111001011),
            .Kernel3(32'b00111110111001101001110110111111),
            .Kernel4(32'b00111110000100101000101001011001),
            .Kernel5(32'b10111101111111011110101010001110),
            .Kernel6(32'b10111011010110110110101001101111),
            .Kernel7(32'b10111110110100100000000011010000),
            .Kernel8(32'b10111110111111011101010000110001),
            .Kernel9(32'b10111111000011110000011110100001),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel1[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_Out(channel8_k1_valid_out)
        );

        Adder_8input add_k1(
            .Data1(Data_Out_Kernel1[DATA_WIDHT-1:0]),
            .Data2(Data_Out_Kernel1[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Data3(Data_Out_Kernel1[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Data4(Data_Out_Kernel1[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Data5(Data_Out_Kernel1[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Data6(Data_Out_Kernel1[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Data7(Data_Out_Kernel1[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Data8(Data_Out_Kernel1[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_In(add_kerne1),
            .Data_Out(add_k1_Data_Out),
            .Valid_Out(add_kerne1_Valid_Out)
        );

        Batch_Norm bn1(
            .Data_A(32'b00111110100011110110110000001101), // Thông số A sau khi tính
            .Data_B(32'b10111110000001110110010011100111),
            .Data_In(add_k1_Data_Out),
            .Valid_In(add_kerne1_Valid_Out),
            .Data_Out(bn1_Data_Out),
            .Valid_Out(bn1_Valid_Out)
        );
        Relu_Core rl1(
            .Data_In(bn1_Data_Out),
            .Valid_In(bn1_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT-1:0]),
            .Valid_Out(rl1_Valid_Out)
        );


    ///////////////////////// KERNEL 2
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL1_K2(
            .Data_In(Data_In[DATA_WIDHT-1:0]),
            .Kernel1(32'b10111111001110011101110111000000),
            .Kernel2(32'b10111110110111010010111110110100),
            .Kernel3(32'b00111110010101001100110111100101),
            .Kernel4(32'b00111110000010111000101110000001),
            .Kernel5(32'b10111100101001111111101111100100),
            .Kernel6(32'b00111101001000000001011110110101),
            .Kernel7(32'b00111110011110101011111100010011),
            .Kernel8(32'b00111110101101101110101011110110),
            .Kernel9(32'b00111110010100010101110001110110),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel2[DATA_WIDHT-1:0]),
            .Valid_Out(channel1_k2_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL2_K2(
            .Data_In(Data_In[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Kernel1(32'b00111101010001100110111011111100),
            .Kernel2(32'b00111100001001001111110101101000),
            .Kernel3(32'b10111101100101111101111011110110),
            .Kernel4(32'b00111101111010101111011010000110),
            .Kernel5(32'b10111110000100001100101101100100),
            .Kernel6(32'b00111110110010110010000010101001),
            .Kernel7(32'b10111111001010111010110101000110),
            .Kernel8(32'b10111110111000101110111100001110),
            .Kernel9(32'b00111110100011101100001111100101),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel2[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Valid_Out(channel2_k2_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL3_K2(
            .Data_In(Data_In[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Kernel1(32'b10111111000111101110101011101100),
            .Kernel2(32'b10111110111011101000101010011110),
            .Kernel3(32'b10111101101100111101101100010101),
            .Kernel4(32'b00111110111001001011010100111111),
            .Kernel5(32'b00111110111011111010011000001010),
            .Kernel6(32'b00111110101000001000111001101011),
            .Kernel7(32'b10111110010011111011001110001101),
            .Kernel8(32'b10111110100111100101111011110101),
            .Kernel9(32'b10111101110010110001001010011100),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel2[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Valid_Out(channel3_k2_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL4_K2(
            .Data_In(Data_In[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Kernel1(32'b00111110101001101110111111100100),
            .Kernel2(32'b10111110110111000010111000100010),
            .Kernel3(32'b10111110111110010110101000010110),
            .Kernel4(32'b00111110010001101001001011010111),
            .Kernel5(32'b10111101100001010001001000000101),
            .Kernel6(32'b10111110000101101000011111101000),
            .Kernel7(32'b10111110000011110101010010111001),
            .Kernel8(32'b00111100001110011011110111111101),
            .Kernel9(32'b00111111000111001011011110101011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel2[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Valid_Out(channel4_k2_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL5_K2(
            .Data_In(Data_In[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Kernel1(32'b00111110111000011100101100100000),
            .Kernel2(32'b10111101101001011100001101000011),
            .Kernel3(32'b10111110101011101010101100000000),
            .Kernel4(32'b00111110101010000011110110001010),
            .Kernel5(32'b10111110100101100000110001000111),
            .Kernel6(32'b00111101001101100110100100001111),
            .Kernel7(32'b00111110100101101011111111000111),
            .Kernel8(32'b00111101100000100100110110110011),
            .Kernel9(32'b00111101001000110110101101011011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel2[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Valid_Out(channel5_k2_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL6_K2(
            .Data_In(Data_In[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Kernel1(32'b10111110100001001000110111000110),
            .Kernel2(32'b10111111000010101111000001001001),
            .Kernel3(32'b10111101101000010100111011100001),
            .Kernel4(32'b10111110001101111110100100100010),
            .Kernel5(32'b00111110110001000100110011010110),
            .Kernel6(32'b00111111100100011000110010000001),
            .Kernel7(32'b00111101110010111100101111101011),
            .Kernel8(32'b10111101111011011111101011010011),
            .Kernel9(32'b10111110111101110101110100101101),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel2[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Valid_Out(channel6_k2_valid_out)
        );
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL7_K2(
            .Data_In(Data_In[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Kernel1(32'b10111111100000101110001000110010),
            .Kernel2(32'b10111111000011100101101101110101),
            .Kernel3(32'b10111110011110001010000101100001),
            .Kernel4(32'b00111101110101001110010101001111),
            .Kernel5(32'b00111110100110111111101010110111),
            .Kernel6(32'b00111110101110110111101110011111),
            .Kernel7(32'b00111110111101101011110011101101),
            .Kernel8(32'b00111110111011001111000110111110),
            .Kernel9(32'b10111101011010001101010101001111),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel2[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Valid_Out(channel7_k2_valid_out)
        );    

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL8_K2(
            .Data_In(Data_In[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Kernel1(32'b00111110110100000000110100101010),
            .Kernel2(32'b00111101001001001011001010010000),
            .Kernel3(32'b10111110100010001010111110000001),
            .Kernel4(32'b10111110100001010000101010100001),
            .Kernel5(32'b10111101000111011101001001111011),
            .Kernel6(32'b00111110000100001011011100000101),
            .Kernel7(32'b10111110111101111110000110111110),
            .Kernel8(32'b00111110000010011101011111110011),
            .Kernel9(32'b10111101101110100100000101111011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel2[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_Out(channel8_k2_valid_out)
        );

        

        Adder_8input add_k2(
            .Data1(Data_Out_Kernel2[DATA_WIDHT-1:0]),
            .Data2(Data_Out_Kernel2[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Data3(Data_Out_Kernel2[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Data4(Data_Out_Kernel2[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Data5(Data_Out_Kernel2[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Data6(Data_Out_Kernel2[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Data7(Data_Out_Kernel2[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Data8(Data_Out_Kernel2[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_In(add_kerne2),
            .Data_Out(add_k2_Data_Out),
            .Valid_Out(add_kerne2_Valid_Out)
        );

        Batch_Norm bn2(
            .Data_A(32'b00111110101011100101100011100010), // Thông số A sau khi tính
            .Data_B(32'b00111110010011110111010010011000),
            .Data_In(add_k2_Data_Out),
            .Valid_In(add_kerne2_Valid_Out),
            .Data_Out(bn2_Data_Out),
            .Valid_Out(bn2_Valid_Out)
        );
        Relu_Core rl2(
            .Data_In(bn2_Data_Out),
            .Valid_In(bn2_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Valid_Out(rl2_Valid_Out)
        );




/////////////////////////////// KERNEL 3
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL1_K3(
            .Data_In(Data_In[DATA_WIDHT-1:0]),
            .Kernel1(32'b00111110100111100001011000110010),
            .Kernel2(32'b00111110011010110011011001110111),
            .Kernel3(32'b10111110010110110111100100101110),
            .Kernel4(32'b10111110110011100000111111100100),
            .Kernel5(32'b10111110000011010111100011000100),
            .Kernel6(32'b00111110101101000101011100011011),
            .Kernel7(32'b10111110001110010100011110100101),
            .Kernel8(32'b10111111001011111101001110011101),
            .Kernel9(32'b00111110101001001011100110001001),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel3[DATA_WIDHT-1:0]),
            .Valid_Out(channel1_k3_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL2_K3(
            .Data_In(Data_In[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Kernel1(32'b10111111001000011111010010010010),
            .Kernel2(32'b10111110100101011011101101010001),
            .Kernel3(32'b10111110111011100011011101111101),
            .Kernel4(32'b10111111010011110111010011100110),
            .Kernel5(32'b10111110001000100011110111100011),
            .Kernel6(32'b10111110110010001001011111111001),
            .Kernel7(32'b10111110001101100110111100110110),
            .Kernel8(32'b00111110101001111111010111110111),
            .Kernel9(32'b00111110101111010100101001000111),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel3[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Valid_Out(channel2_k3_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL3_K3(
            .Data_In(Data_In[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Kernel1(32'b00111110010001001111010110000110),
            .Kernel2(32'b10111101000101101100111110011010),
            .Kernel3(32'b10111110010011011001111011100011),
            .Kernel4(32'b10111011001100010000111110111001),
            .Kernel5(32'b10111110111000011110000111000001),
            .Kernel6(32'b10111111010001010111100101011111),
            .Kernel7(32'b10111110100100101101110101100111),
            .Kernel8(32'b10111110010100101100111101010111),
            .Kernel9(32'b10111101000001000100001110010111),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel3[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Valid_Out(channel3_k3_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL4_K3(
            .Data_In(Data_In[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Kernel1(32'b00111110011100110001011101000000),
            .Kernel2(32'b10111111000001000010010101010110),
            .Kernel3(32'b10111101110000100101110100100010),
            .Kernel4(32'b00111100100010001000011100000111),
            .Kernel5(32'b10111110101011110100101010100011),
            .Kernel6(32'b00111100100101111001111011001010),
            .Kernel7(32'b00111110101101011010111110110101),
            .Kernel8(32'b10111101100001011001011001111000),
            .Kernel9(32'b10111110010110000000010001000000),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel3[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Valid_Out(channel4_k3_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL5_K3(
            .Data_In(Data_In[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Kernel1(32'b10111110110011101010111011001110),
            .Kernel2(32'b00111110101010011001001011101010),
            .Kernel3(32'b10111110111100100110000100100000),
            .Kernel4(32'b00111100100001011111001111101101),
            .Kernel5(32'b10111110101111001110010101100110),
            .Kernel6(32'b00111101010110100111100000001010),
            .Kernel7(32'b00111110001100110011010101110110),
            .Kernel8(32'b10111110111101110111100010000101),
            .Kernel9(32'b00111100001110001110111001010100),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel3[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Valid_Out(channel5_k3_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL6_K3(
            .Data_In(Data_In[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Kernel1(32'b10111101111001111011011001111001),
            .Kernel2(32'b00111111000001110000011001100111),
            .Kernel3(32'b10111110101000111011001010010011),
            .Kernel4(32'b10111101001110011110000101110010),
            .Kernel5(32'b10111110101001101010010010010000),
            .Kernel6(32'b10111101100111001011111010101010),
            .Kernel7(32'b10111100011001100000001111101001),
            .Kernel8(32'b00111100011011111101011011111010),
            .Kernel9(32'b00111111000000111011111001100100),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel3[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Valid_Out(channel6_k3_valid_out)
        );
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL7_K3(
            .Data_In(Data_In[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Kernel1(32'b00111110101001000111000001110101),
            .Kernel2(32'b10111110010111000111111100011101),
            .Kernel3(32'b00111101110111110100110011100010),
            .Kernel4(32'b10111110100000011101001010110011),
            .Kernel5(32'b10111111000111111100110100001000),
            .Kernel6(32'b00111111001110100001110100100001),
            .Kernel7(32'b10111111011110110011011001001011),
            .Kernel8(32'b10111110110101111101000111000100),
            .Kernel9(32'b00111101011110011101111011101000),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel3[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Valid_Out(channel7_k3_valid_out)
        );    

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL8_K3(
            .Data_In(Data_In[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Kernel1(32'b00111111000010111001100000110100),
            .Kernel2(32'b00111110010101111011101110001111),
            .Kernel3(32'b00111110001111011110000011000100),
            .Kernel4(32'b00111101000001001000110000011100),
            .Kernel5(32'b10111110010000011111001001000001),
            .Kernel6(32'b10111110010000101000011000101001),
            .Kernel7(32'b10111110101000000000111010001010),
            .Kernel8(32'b10111101011111100110000100110111),
            .Kernel9(32'b10111101111100100110111100100101),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel3[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_Out(channel8_k3_valid_out)
        );


        Adder_8input add_k3(
            .Data1(Data_Out_Kernel3[DATA_WIDHT-1:0]),
            .Data2(Data_Out_Kernel3[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Data3(Data_Out_Kernel3[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Data4(Data_Out_Kernel3[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Data5(Data_Out_Kernel3[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Data6(Data_Out_Kernel3[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Data7(Data_Out_Kernel3[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Data8(Data_Out_Kernel3[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_In(add_kerne3),
            .Data_Out(add_k3_Data_Out),
            .Valid_Out(add_kerne3_Valid_Out)
        );

        Batch_Norm bn3(
            .Data_A(32'b00111110101011011101000100110101), // Thông số A sau khi tính
            .Data_B(32'b00111111100111110000100100100011),
            .Data_In(add_k3_Data_Out),
            .Valid_In(add_kerne3_Valid_Out),
            .Data_Out(bn3_Data_Out),
            .Valid_Out(bn3_Valid_Out)
        );
        Relu_Core rl3(
            .Data_In(bn3_Data_Out),
            .Valid_In(bn3_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Valid_Out(rl3_Valid_Out)
        );

////////////////////////////// KERNEL 4
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL1_K4(
            .Data_In(Data_In[DATA_WIDHT-1:0]),
            .Kernel1(32'b00111101101111110000011110011101),
            .Kernel2(32'b00111100000000011101010100101111),
            .Kernel3(32'b10111110110001010001010111001111),
            .Kernel4(32'b00111110010001101110111100000100),
            .Kernel5(32'b10111101000110110100000100110001),
            .Kernel6(32'b10111111000010111100000100011100),
            .Kernel7(32'b00111111000100100001011101001000),
            .Kernel8(32'b00111101011111101101010001101000),
            .Kernel9(32'b10111110010111001011010100101110),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel4[DATA_WIDHT-1:0]),
            .Valid_Out(channel1_k4_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL2_K4(
            .Data_In(Data_In[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Kernel1(32'b10111110001011000001001000101110),
            .Kernel2(32'b10111110010001111001010011000000),
            .Kernel3(32'b00111110101000011101101011000010),
            .Kernel4(32'b10111110101110001001001110110101),
            .Kernel5(32'b10111110101100100000110010110100),
            .Kernel6(32'b10111110010110001110011110010001),
            .Kernel7(32'b10111110100010010010111100010101),
            .Kernel8(32'b10111110100010000001100101100000),
            .Kernel9(32'b10111110100011010101111110110001),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel4[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Valid_Out(channel2_k4_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL3_K4(
            .Data_In(Data_In[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Kernel1(32'b10111110010110000111000100011100),
            .Kernel2(32'b10111110101101111000111101001001),
            .Kernel3(32'b10111111011010100010001001000001),
            .Kernel4(32'b10111110101010101011010011011101),
            .Kernel5(32'b10111110101000010011111101000111),
            .Kernel6(32'b10111111001001101001101101100100),
            .Kernel7(32'b10111101101110100111101111100001),
            .Kernel8(32'b00111110100011100001100000101011),
            .Kernel9(32'b10111111000001100100101000000100),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel4[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Valid_Out(channel3_k4_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL4_K4(
            .Data_In(Data_In[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Kernel1(32'b10111111001110010110111011000000),
            .Kernel2(32'b00111110011011111000101010001000),
            .Kernel3(32'b10111110101011001000111011111101),
            .Kernel4(32'b10111110011010101011100101011110),
            .Kernel5(32'b10111110100010011011010011101001),
            .Kernel6(32'b00111111000000111110000111000101),
            .Kernel7(32'b10111110100010001100011100010110),
            .Kernel8(32'b00111101001101010000100101010100),
            .Kernel9(32'b00111111000110010000110011010011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel4[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Valid_Out(channel4_k4_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL5_K4(
            .Data_In(Data_In[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Kernel1(32'b10111110111001000101101101010010),
            .Kernel2(32'b10111110100101101100100110110101),
            .Kernel3(32'b10111110001101100111010110011010),
            .Kernel4(32'b00111110001101111101010101010011),
            .Kernel5(32'b10111110011010111101101111111011),
            .Kernel6(32'b00111010010100111001100111110100),
            .Kernel7(32'b10111111000011000100000001000010),
            .Kernel8(32'b00111110001001010100011010010111),
            .Kernel9(32'b00111101111000100011011000111110),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel4[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Valid_Out(channel5_k4_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL6_K4(
            .Data_In(Data_In[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Kernel1(32'b10111100111000101010010010011101),
            .Kernel2(32'b00111110100010010110001111110010),
            .Kernel3(32'b10111101010101101111101001010000),
            .Kernel4(32'b00111110100000110001110000101100),
            .Kernel5(32'b00111101100101110111011001010001),
            .Kernel6(32'b10111110111101001001001001101010),
            .Kernel7(32'b00111110110010100001110001110111),
            .Kernel8(32'b10111101001000010110110010110010),
            .Kernel9(32'b10111110110101001010001011011000),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel4[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Valid_Out(channel6_k4_valid_out)
        );
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL7_K4(
            .Data_In(Data_In[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Kernel1(32'b00111101110111010001110010001001),
            .Kernel2(32'b00111110011011110011010010111000),
            .Kernel3(32'b10111101110111111011110010010111),
            .Kernel4(32'b10111011100011001010011011111101),
            .Kernel5(32'b00111111001011011101100000111100),
            .Kernel6(32'b10111111000011010111010010010010),
            .Kernel7(32'b10111110110011001010001000111001),
            .Kernel8(32'b10111110010010101010010011101001),
            .Kernel9(32'b10111100010001111010100110011110),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel4[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Valid_Out(channel7_k4_valid_out)
        );    

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL8_K4(
            .Data_In(Data_In[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Kernel1(32'b10111110110111000011010011100110),
            .Kernel2(32'b00111110100100111000101001000100),
            .Kernel3(32'b10111110110010110100110011100101),
            .Kernel4(32'b00111110101010001100100000111010),
            .Kernel5(32'b10111111000011111011100010011000),
            .Kernel6(32'b10111111001110110110111010001111),
            .Kernel7(32'b00111101100000111101001100101110),
            .Kernel8(32'b10111111100011100100110110011011),
            .Kernel9(32'b10111111010100011000011100001000),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel4[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_Out(channel8_k4_valid_out)
        );

        Adder_8input add_k4(
            .Data1(Data_Out_Kernel4[DATA_WIDHT-1:0]),
            .Data2(Data_Out_Kernel4[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Data3(Data_Out_Kernel4[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Data4(Data_Out_Kernel4[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Data5(Data_Out_Kernel4[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Data6(Data_Out_Kernel4[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Data7(Data_Out_Kernel4[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Data8(Data_Out_Kernel4[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_In(add_kerne4),
            .Data_Out(add_k4_Data_Out),
            .Valid_Out(add_kerne4_Valid_Out)
        );

        Batch_Norm bn4(
            .Data_A(32'b00111110100110110011001010010000), // Thông số A sau khi tính
            .Data_B(32'b00111111100011110000110000010010),
            .Data_In(add_k4_Data_Out),
            .Valid_In(add_kerne4_Valid_Out),
            .Data_Out(bn4_Data_Out),
            .Valid_Out(bn4_Valid_Out)
        );
        Relu_Core rl4(
            .Data_In(bn4_Data_Out),
            .Valid_In(bn4_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Valid_Out(rl4_Valid_Out)
        );


//////////////////////// Kernel 5
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL1_K5(
            .Data_In(Data_In[DATA_WIDHT-1:0]),
            .Kernel1(32'b00111101110110101001101011111000),
            .Kernel2(32'b00111111001001101011100100011110),
            .Kernel3(32'b00111110101011001100000010100010),
            .Kernel4(32'b00111110110100010011011111110101),
            .Kernel5(32'b00111110110011010010100001001001),
            .Kernel6(32'b10111110001000000011100011110010),
            .Kernel7(32'b10111101101001111100100101101011),
            .Kernel8(32'b00111101110111011011001111100100),
            .Kernel9(32'b10111100110111000000010010001011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel5[DATA_WIDHT-1:0]),
            .Valid_Out(channel1_k5_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL2_K5(
            .Data_In(Data_In[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Kernel1(32'b10111111000101011011100111110010),
            .Kernel2(32'b00111101010101101100100101110010),
            .Kernel3(32'b10111110110110100100101010011100),
            .Kernel4(32'b10111110011110110101100010001100),
            .Kernel5(32'b00111100110011101001101111101110),
            .Kernel6(32'b00111110011010100110100001001110),
            .Kernel7(32'b10111111011010111010100011110001),
            .Kernel8(32'b10111111000001010101010011101011),
            .Kernel9(32'b00111110110001111111101001111011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel5[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Valid_Out(channel2_k5_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL3_K5(
            .Data_In(Data_In[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Kernel1(32'b10111110100000111111001000101111),
            .Kernel2(32'b10111110111010001001001001000110),
            .Kernel3(32'b00111110001111011110011010001010),
            .Kernel4(32'b10111110111000110111010001111001),
            .Kernel5(32'b00111110011100011011100000110001),
            .Kernel6(32'b10111110010101011001101000010111),
            .Kernel7(32'b10111110111110101111011001000101),
            .Kernel8(32'b10111110110110010101010011010110),
            .Kernel9(32'b00111110010011101111110011101110),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel5[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Valid_Out(channel3_k5_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL4_K5(
            .Data_In(Data_In[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Kernel1(32'b10111101111011100101010100110001),
            .Kernel2(32'b00111111000101000111100100011010),
            .Kernel3(32'b10111100001101101101010111010110),
            .Kernel4(32'b00111111000100100111001111000100),
            .Kernel5(32'b00111111001010110000001011001110),
            .Kernel6(32'b10111111010010111001101101010001),
            .Kernel7(32'b00111101010000110101001000011110),
            .Kernel8(32'b00111110110000111011100011000001),
            .Kernel9(32'b10111101011101000010100001100111),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel5[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Valid_Out(channel4_k5_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL5_K5(
            .Data_In(Data_In[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Kernel1(32'b10111110110011110010000011011011),
            .Kernel2(32'b10111011000001001000000010101101),
            .Kernel3(32'b00111110100010011000011100111101),
            .Kernel4(32'b00111110101011011111100111010011),
            .Kernel5(32'b10111110111011111111100011111011),
            .Kernel6(32'b10111100101000011100001011011101),
            .Kernel7(32'b00111101101111101101000010001100),
            .Kernel8(32'b10111110000110110110110010000101),
            .Kernel9(32'b10111110010110011100010110000001),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel5[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Valid_Out(channel5_k5_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL6_K5(
            .Data_In(Data_In[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Kernel1(32'b00111101001000111101100001000100),
            .Kernel2(32'b10111110111000100111111111010000),
            .Kernel3(32'b00111110100001111101111110011101),
            .Kernel4(32'b00111101001001000110111010100101),
            .Kernel5(32'b10111110010000010001110000101001),
            .Kernel6(32'b00111110100101100100001010100111),
            .Kernel7(32'b10111110101100111000100101110010),
            .Kernel8(32'b10111110011111100011101011011101),
            .Kernel9(32'b00111101001100000101101100010011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel5[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Valid_Out(channel6_k5_valid_out)
        );
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL7_K5(
            .Data_In(Data_In[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Kernel1(32'b10111111001100001010000101011000),
            .Kernel2(32'b10111101000010010010011101101100),
            .Kernel3(32'b10111100101110101001100001100000),
            .Kernel4(32'b10111110011000100001010111001111),
            .Kernel5(32'b00111110111001111011100010100011),
            .Kernel6(32'b10111110011100111100000011010100),
            .Kernel7(32'b00111110100111000100101111001010),
            .Kernel8(32'b00111110100101111100100010000001),
            .Kernel9(32'b00111100100011001101011001101011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel5[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Valid_Out(channel7_k5_valid_out)
        );    

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL8_K5(
            .Data_In(Data_In[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Kernel1(32'b10111110001000001011000101100100),
            .Kernel2(32'b00111110010001000000011011110110),
            .Kernel3(32'b00111110100000000011000101010111),
            .Kernel4(32'b10111111000110111101101000110011),
            .Kernel5(32'b00111110010100101010101100111110),
            .Kernel6(32'b00111110001100101110010110000011),
            .Kernel7(32'b10111111000010000100010000001111),
            .Kernel8(32'b10111111011001110011000110110001),
            .Kernel9(32'b00111110001101111111010101011011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel5[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_Out(channel8_k5_valid_out)
        );
        Adder_8input add_k5(
            .Data1(Data_Out_Kernel5[DATA_WIDHT-1:0]),
            .Data2(Data_Out_Kernel5[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Data3(Data_Out_Kernel5[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Data4(Data_Out_Kernel5[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Data5(Data_Out_Kernel5[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Data6(Data_Out_Kernel5[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Data7(Data_Out_Kernel5[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Data8(Data_Out_Kernel5[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_In(add_kerne5),
            .Data_Out(add_k5_Data_Out),
            .Valid_Out(add_kerne5_Valid_Out)
        );

        Batch_Norm bn5(
            .Data_A(32'b00111110110000000000101101001011), // Thông số A sau khi tính
            .Data_B(32'b00111110101101110010011010111110),
            .Data_In(add_k5_Data_Out),
            .Valid_In(add_kerne5_Valid_Out),
            .Data_Out(bn5_Data_Out),
            .Valid_Out(bn5_Valid_Out)
        );
        Relu_Core rl5(
            .Data_In(bn5_Data_Out),
            .Valid_In(bn5_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Valid_Out(rl5_Valid_Out)
        );
//////////////////////////////////// KERNEl 6
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL1_K6(
            .Data_In(Data_In[DATA_WIDHT-1:0]),
            .Kernel1(32'b10111110100100011100000000000001),
            .Kernel2(32'b10111110111101110100001110111111),
            .Kernel3(32'b10111111000000011110110100011010),
            .Kernel4(32'b00111110000101110011001011110111),
            .Kernel5(32'b00111111000101011101000101111111),
            .Kernel6(32'b00111110000001011110110000100100),
            .Kernel7(32'b10111100110110010110011111010101),
            .Kernel8(32'b00111101001010110010111001000000),
            .Kernel9(32'b00111101101110000110011001111000),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel6[DATA_WIDHT-1:0]),
            .Valid_Out(channel1_k6_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL2_K6(
            .Data_In(Data_In[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Kernel1(32'b10111110100110000110001110001100),
            .Kernel2(32'b00111100101010101101010100010010),
            .Kernel3(32'b00111101111001110110000011111001),
            .Kernel4(32'b10111110000110010000111111011111),
            .Kernel5(32'b10111101001000111011000100001011),
            .Kernel6(32'b00111110111010010001010110000011),
            .Kernel7(32'b00111111011101100111101001100011),
            .Kernel8(32'b00111110111100000111100000010100),
            .Kernel9(32'b00111111000101110101010001001000),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel6[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Valid_Out(channel2_k6_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL3_K6(
            .Data_In(Data_In[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Kernel1(32'b10111101101001100111000000110001),
            .Kernel2(32'b10111110010111010000111010111010),
            .Kernel3(32'b00111100101100010111000110100000),
            .Kernel4(32'b10111110001000010001011111101000),
            .Kernel5(32'b00111110110001111110010011110111),
            .Kernel6(32'b00111101011100011011110111101010),
            .Kernel7(32'b10111101110111010000101010011000),
            .Kernel8(32'b10111101100101001000100100101010),
            .Kernel9(32'b00111111010011011011111101111011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel6[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Valid_Out(channel3_k6_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL4_K6(
            .Data_In(Data_In[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Kernel1(32'b10111110001000010010110010010000),
            .Kernel2(32'b10111101100011000011100011101001),
            .Kernel3(32'b00111101110000000111100110001111),
            .Kernel4(32'b00111110100001001110011111011001),
            .Kernel5(32'b10111110101101100001101100101111),
            .Kernel6(32'b00111110111100110111010001101111),
            .Kernel7(32'b00111110001001000010011100000111),
            .Kernel8(32'b00111110001100011111000100000101),
            .Kernel9(32'b00111110100101111011010010101111),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel6[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Valid_Out(channel4_k6_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL5_K6(
            .Data_In(Data_In[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Kernel1(32'b00111101101110100101110100011010),
            .Kernel2(32'b10111101111011010000000111101011),
            .Kernel3(32'b10111111001000000111100111000101),
            .Kernel4(32'b00111110110101000001010110010111),
            .Kernel5(32'b00111111000001100111101101000010),
            .Kernel6(32'b10111110111000100001110101110010),
            .Kernel7(32'b10111110100110011110001010111101),
            .Kernel8(32'b00111111001010111011000110001101),
            .Kernel9(32'b10111110010010010101010001110000),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel6[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Valid_Out(channel5_k6_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL6_K6(
            .Data_In(Data_In[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Kernel1(32'b10111110100100000111000110111101),
            .Kernel2(32'b00111110001111110101011101001101),
            .Kernel3(32'b10111110011001100001010100001101),
            .Kernel4(32'b00111101101101101110110010011100),
            .Kernel5(32'b00111101101101110011001110010011),
            .Kernel6(32'b10111110001101010011100111010101),
            .Kernel7(32'b00111111000000000101000101010011),
            .Kernel8(32'b10111110111110111110001110001001),
            .Kernel9(32'b00111110110011111010010101001101),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel6[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Valid_Out(channel6_k6_valid_out)
        );
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL7_K6(
            .Data_In(Data_In[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Kernel1(32'b00111110111101000000001011010111),
            .Kernel2(32'b10111110100001111001111000110000),
            .Kernel3(32'b00111101011000100001111001110100),
            .Kernel4(32'b00111110110101111011001000110110),
            .Kernel5(32'b00111101101011100100111110011001),
            .Kernel6(32'b10111110100111100111101010001000),
            .Kernel7(32'b10111110011001101010001000111111),
            .Kernel8(32'b10111110011101001111010110101010),
            .Kernel9(32'b00111110001000011111101011001001),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel6[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Valid_Out(channel7_k6_valid_out)
        );    

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL8_K6(
            .Data_In(Data_In[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Kernel1(32'b10111110111010010000101100100000),
            .Kernel2(32'b10111111001000110001101100100101),
            .Kernel3(32'b10111100100001111010001000001101),
            .Kernel4(32'b10111110101110000111110100100001),
            .Kernel5(32'b10111110101010000001101011001101),
            .Kernel6(32'b00111111010100100001010111011101),
            .Kernel7(32'b00111110011100001111001100101001),
            .Kernel8(32'b00111111000101000111011010000011),
            .Kernel9(32'b00111110111101101110000011001110),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel6[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_Out(channel8_k6_valid_out)
        );

        Adder_8input add_k6(
            .Data1(Data_Out_Kernel6[DATA_WIDHT-1:0]),
            .Data2(Data_Out_Kernel6[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Data3(Data_Out_Kernel6[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Data4(Data_Out_Kernel6[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Data5(Data_Out_Kernel6[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Data6(Data_Out_Kernel6[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Data7(Data_Out_Kernel6[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Data8(Data_Out_Kernel6[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_In(add_kerne6),
            .Data_Out(add_k6_Data_Out),
            .Valid_Out(add_kerne6_Valid_Out)
        );    

        Batch_Norm bn6(
            .Data_A(32'b00111110111100101010010111101001), // Thông số A sau khi tính
            .Data_B(32'b10111111011101000100000101011011),
            .Data_In(add_k6_Data_Out),
            .Valid_In(add_kerne6_Valid_Out),
            .Data_Out(bn6_Data_Out),
            .Valid_Out(bn6_Valid_Out)
        );
        Relu_Core rl6(
            .Data_In(bn6_Data_Out),
            .Valid_In(bn6_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Valid_Out(rl6_Valid_Out)
        );

//////////////////////////////// KERNEL 7
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL1_K7(
            .Data_In(Data_In[DATA_WIDHT-1:0]),
            .Kernel1(32'b00111110110011101111000001101111),
            .Kernel2(32'b10111011111011100000000000001011),
            .Kernel3(32'b00111110010110101100111010111010),
            .Kernel4(32'b00111101010111111001000111000101),
            .Kernel5(32'b10111110000111100010110001010101),
            .Kernel6(32'b10111111000111110000110001100111),
            .Kernel7(32'b10111101101101111000011011111000),
            .Kernel8(32'b10111111100001001110110010011001),
            .Kernel9(32'b10111111001001010000001101000010),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel7[DATA_WIDHT-1:0]),
            .Valid_Out(channel1_k7_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL2_K7(
            .Data_In(Data_In[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Kernel1(32'b00111101011100101110011011101000),
            .Kernel2(32'b10111101000000100010101010000010),
            .Kernel3(32'b10111101111011010100001101000110),
            .Kernel4(32'b00111110001101111100001010100010),
            .Kernel5(32'b00111110001110010110111101101011),
            .Kernel6(32'b10111110100110110111001100011010),
            .Kernel7(32'b10111100111110100000100001010010),
            .Kernel8(32'b10111110000011100011010011011001),
            .Kernel9(32'b10111110001000111011110110000010),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel7[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Valid_Out(channel2_k7_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL3_K7(
            .Data_In(Data_In[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Kernel1(32'b00111100001001111100111011100011),
            .Kernel2(32'b10111110010100010100000111110111),
            .Kernel3(32'b10111110000110111000101000000101),
            .Kernel4(32'b10111110111011011100001000111100),
            .Kernel5(32'b10111111001011110010000111001111),
            .Kernel6(32'b10111110110011101100100001100101),
            .Kernel7(32'b00111110110110000011000100010110),
            .Kernel8(32'b10111110001010011011101101100100),
            .Kernel9(32'b10111100001000011111100010010001),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel7[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Valid_Out(channel3_k7_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL4_K7(
            .Data_In(Data_In[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Kernel1(32'b10111110000111101001111101110001),
            .Kernel2(32'b00111110100000001100010110101110),
            .Kernel3(32'b00111110111001111001011101101110),
            .Kernel4(32'b10111111100010100000100000011100),
            .Kernel5(32'b10111111011000110001010110101111),
            .Kernel6(32'b00111110000011100110111101011010),
            .Kernel7(32'b00111110001100010101011011111110),
            .Kernel8(32'b10111111000100010010101001001011),
            .Kernel9(32'b00111110001101111111111010100111),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel7[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Valid_Out(channel4_k7_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL5_K7(
            .Data_In(Data_In[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Kernel1(32'b10111110110001100111101101011100),
            .Kernel2(32'b10111101110101010000110011100100),
            .Kernel3(32'b10111101101001111011100011100110),
            .Kernel4(32'b10111110000011000110011010000000),
            .Kernel5(32'b10111101011110001011000100110101),
            .Kernel6(32'b10111111010011011101000110000101),
            .Kernel7(32'b10111101101010101000011111110000),
            .Kernel8(32'b00111100000010001111101101110001),
            .Kernel9(32'b00111101000010110111110010010100),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel7[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Valid_Out(channel5_k7_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL6_K7(
            .Data_In(Data_In[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Kernel1(32'b00111110001000000001110100001000),
            .Kernel2(32'b00111110101011001101101000011010),
            .Kernel3(32'b10111110100010111011011001111000),
            .Kernel4(32'b10111100111100011101001001111000),
            .Kernel5(32'b10111111001000011010111010100110),
            .Kernel6(32'b10111111001101100010001101011101),
            .Kernel7(32'b00111110110010001010010101111100),
            .Kernel8(32'b10111100111001010000110101000100),
            .Kernel9(32'b00111111001001110010110110111011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel7[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Valid_Out(channel6_k7_valid_out)
        );
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL7_K7(
            .Data_In(Data_In[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Kernel1(32'b00111100110000101000001010111010),
            .Kernel2(32'b10111101101100001010101010100001),
            .Kernel3(32'b10111110101101101001101011100001),
            .Kernel4(32'b10111111001000101000011111111100),
            .Kernel5(32'b10111111010100001111001011001000),
            .Kernel6(32'b10111101110101101000100011100011),
            .Kernel7(32'b10111110100101010101011101001000),
            .Kernel8(32'b00111101100010100001001000100110),
            .Kernel9(32'b00111110101001100111101110100010),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel7[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Valid_Out(channel7_k7_valid_out)
        );    

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL8_K7(
            .Data_In(Data_In[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Kernel1(32'b10111110000001010010010110110011),
            .Kernel2(32'b10111110000111000011000101111110),
            .Kernel3(32'b10111110100111100110010010110011),
            .Kernel4(32'b00111111001101100100101010101011),
            .Kernel5(32'b10111111000100000001010010010100),
            .Kernel6(32'b10111111001100111000000111011010),
            .Kernel7(32'b00111101001110011001000111011100),
            .Kernel8(32'b00111110000100100111101010110010),
            .Kernel9(32'b00111110000011111101100111010110),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel7[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_Out(channel8_k7_valid_out)
        );

        Adder_8input add_k7(
            .Data1(Data_Out_Kernel7[DATA_WIDHT-1:0]),
            .Data2(Data_Out_Kernel7[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Data3(Data_Out_Kernel7[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Data4(Data_Out_Kernel7[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Data5(Data_Out_Kernel7[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Data6(Data_Out_Kernel7[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Data7(Data_Out_Kernel7[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Data8(Data_Out_Kernel7[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_In(add_kerne7),
            .Data_Out(add_k7_Data_Out),
            .Valid_Out(add_kerne7_Valid_Out)
        );

        Batch_Norm bn7(
            .Data_A(32'b00111110011111101100010101111001), // Thông số A sau khi tính
            .Data_B(32'b00111111101000101001101000000011),
            .Data_In(add_k7_Data_Out),
            .Valid_In(add_kerne7_Valid_Out),
            .Data_Out(bn7_Data_Out),
            .Valid_Out(bn7_Valid_Out)
        );
        Relu_Core rl7(
            .Data_In(bn7_Data_Out),
            .Valid_In(bn7_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Valid_Out(rl7_Valid_Out)
        );



////////////////////////////////// KERNEL 8
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL1_K8(
            .Data_In(Data_In[DATA_WIDHT-1:0]),
            .Kernel1(32'b10111110001011011111000001100110),
            .Kernel2(32'b10111110110101100001011010101000),
            .Kernel3(32'b10111110000110101001110100101100),
            .Kernel4(32'b00111111000000111110110100011011),
            .Kernel5(32'b00111110001010010010100011101101),
            .Kernel6(32'b10111011101101111101001100001111),
            .Kernel7(32'b10111101111110000110001111100011),
            .Kernel8(32'b00111101111100110011001000011010),
            .Kernel9(32'b10111110010011010011110001111010),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel8[DATA_WIDHT-1:0]),
            .Valid_Out(channel1_k8_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL2_K8(
            .Data_In(Data_In[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Kernel1(32'b00111101000001000101001011011001),
            .Kernel2(32'b10111110010001101100010111110101),
            .Kernel3(32'b10111101111110000111010011010110),
            .Kernel4(32'b10111110001011000111101000100100),
            .Kernel5(32'b10111111000000100111100101100001),
            .Kernel6(32'b10111101011001101110110110110001),
            .Kernel7(32'b10111111000010101000011011000000),
            .Kernel8(32'b10111110010111011011011001110101),
            .Kernel9(32'b10111110100100011011100111110101),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel8[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Valid_Out(channel2_k8_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL3_K8(
            .Data_In(Data_In[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Kernel1(32'b10111110110100000011001110111101),
            .Kernel2(32'b10111110001111110000101010011000),
            .Kernel3(32'b00111110101111101111110011000110),
            .Kernel4(32'b10111101110001000001100000010001),
            .Kernel5(32'b10111101010110000010111001000011),
            .Kernel6(32'b00111110100100101001101111111101),
            .Kernel7(32'b00111110110100110000100010001101),
            .Kernel8(32'b10111110011010110101110010111100),
            .Kernel9(32'b10111101111001100110100100010100),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel8[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Valid_Out(channel3_k8_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL4_K8(
            .Data_In(Data_In[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Kernel1(32'b10111110010110100111111000010010),
            .Kernel2(32'b10111110101111010101000100001101),
            .Kernel3(32'b10111101111010000110001010011010),
            .Kernel4(32'b00111101110110011101000011001011),
            .Kernel5(32'b10111110011100100101100101001011),
            .Kernel6(32'b00111110110100100101110001001010),
            .Kernel7(32'b10111110111010111110111100110111),
            .Kernel8(32'b10111101110111110001010000100001),
            .Kernel9(32'b10111101110000011000100011101010),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel8[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Valid_Out(channel4_k8_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL5_K8(
            .Data_In(Data_In[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Kernel1(32'b00111110000111011111100100111010),
            .Kernel2(32'b10111101101011000000100100011010),
            .Kernel3(32'b10111110101110010111100010100010),
            .Kernel4(32'b00111111001000001010011110101111),
            .Kernel5(32'b00111111001000110000100111011011),
            .Kernel6(32'b10111111000110111001101001100001),
            .Kernel7(32'b00111011111110100000111011100010),
            .Kernel8(32'b00111110010001010011101010101110),
            .Kernel9(32'b10111110111110001100100011011101),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel8[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Valid_Out(channel5_k8_valid_out)
        );

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL6_K8(
            .Data_In(Data_In[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Kernel1(32'b00111100101000000011001101111101),
            .Kernel2(32'b00111110101111110101111110111111),
            .Kernel3(32'b10111110111010111101000110000010),
            .Kernel4(32'b00111111001110000101000000111010),
            .Kernel5(32'b00111101110001011010000011111011),
            .Kernel6(32'b10111110111101110101101111100001),
            .Kernel7(32'b00111100101001101110101110110001),
            .Kernel8(32'b10111110101000000110000001011001),
            .Kernel9(32'b10111100010010001000101110110010),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel8[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Valid_Out(channel6_k8_valid_out)
        );
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL7_K8(
            .Data_In(Data_In[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Kernel1(32'b00111101100111101100010010011011),
            .Kernel2(32'b00111101100011000010100110001010),
            .Kernel3(32'b10111110110001010101001000000101),
            .Kernel4(32'b00111111011011100100011101110111),
            .Kernel5(32'b10111101111101101100100110111011),
            .Kernel6(32'b10111101010100010111100111100000),
            .Kernel7(32'b00111110000001000111110111001000),
            .Kernel8(32'b10111111000110111100101011110001),
            .Kernel9(32'b00111110110111000011011000011001),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel8[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Valid_Out(channel7_k8_valid_out)
        );    

    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT)
        )
        CHANNEL8_K8(
            .Data_In(Data_In[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Kernel1(32'b00111110010011101100110100010110),
            .Kernel2(32'b10111110101100001001010100001100),
            .Kernel3(32'b00111111000010011110010011000100),
            .Kernel4(32'b00111111000000000000100000111101),
            .Kernel5(32'b10111110110110111111000011010100),
            .Kernel6(32'b10111110011000010000010110100110),
            .Kernel7(32'b00111111000101001001001111100110),
            .Kernel8(32'b00111110011110111010011101011101),
            .Kernel9(32'b10111110001010100001101001100011),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out_Kernel8[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_Out(channel8_k8_valid_out)
        );                

        Adder_8input add_k8(
            .Data1(Data_Out_Kernel8[DATA_WIDHT-1:0]),
            .Data2(Data_Out_Kernel8[DATA_WIDHT*2-1:DATA_WIDHT]),
            .Data3(Data_Out_Kernel8[DATA_WIDHT*3-1:DATA_WIDHT*2]),
            .Data4(Data_Out_Kernel8[DATA_WIDHT*4-1:DATA_WIDHT*3]),
            .Data5(Data_Out_Kernel8[DATA_WIDHT*5-1:DATA_WIDHT*4]),
            .Data6(Data_Out_Kernel8[DATA_WIDHT*6-1:DATA_WIDHT*5]),
            .Data7(Data_Out_Kernel8[DATA_WIDHT*7-1:DATA_WIDHT*6]),
            .Data8(Data_Out_Kernel8[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_In(add_kerne8),
            .Data_Out(add_k8_Data_Out),
            .Valid_Out(add_kerne8_Valid_Out)
        );

        Batch_Norm bn8(
            .Data_A(32'b00111110100111011110010001101001), // Thông số A sau khi tính
            .Data_B(32'b00111110110000110100101011001011),
            .Data_In(add_k8_Data_Out),
            .Valid_In(add_kerne8_Valid_Out),
            .Data_Out(bn8_Data_Out),
            .Valid_Out(bn8_Valid_Out)
        );
        Relu_Core rl8(
            .Data_In(bn8_Data_Out),
            .Valid_In(bn8_Valid_Out),
            .Data_Out(Data_Out[DATA_WIDHT*8-1:DATA_WIDHT*7]),
            .Valid_Out(rl8_Valid_Out)
        );

endmodule