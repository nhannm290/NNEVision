module Test_Convolution2D_3x3_stride_1x1 (
    
);
    parameter DATA_WIDHT = 32;
    parameter IMG_HEIGHT = 220;
    parameter IMG_WIDTH = 220;
    parameter Kernel1 = 32'h3f800000;
    parameter Kernel2 = 32'h00000000;
    parameter Kernel3 = 32'hbf800000;
    parameter Kernel4 = 32'h40000000;
    parameter Kernel5 = 32'h00000000;
    parameter Kernel6 = 32'hc0000000;
    parameter Kernel7 = 32'h3f800000;
    parameter Kernel8 = 32'h00000000;
    parameter Kernel9 = 32'hbf800000;

    parameter CLK = 20;
    parameter Period = CLK*2;

    parameter   ADDRESS_READ = "E:/ChuyenDeHeViMach/NNL/Project/Testbench/Testfile_Convert.txt";
    parameter   ADDRESS_WRITE = "E:/ChuyenDeHeViMach/NNL/Project/Testbench/RTL_Convo_Result.txt";

    //Port 
    reg [DATA_WIDHT-1:0] Data_In;
    reg clk,rst,Valid_In;

    wire [DATA_WIDHT-1:0] Data_Out;
    wire Valid_Out;

    integer file_read,Data,file_write;
    integer counter = 0;
    initial begin
        clk = 0;
        rst = 0;
        Valid_In =0;
        #Period
        rst = 1;
        #CLK
        Valid_In = 1;
        file_read = $fopen(ADDRESS_READ,"r");
        file_write = $fopen(ADDRESS_WRITE,"w");
        while(!$feof(file_read) || Valid_Out ==1) begin
           Data = $fscanf(file_read,"%b",Data_In);
           if (Valid_Out) begin
               $fwrite(file_write,"%h\n",Data_Out);
               counter = counter +1'd1;
           end
           #Period;
        end
        Data_In = 0;
        $finish;
    end
always  #CLK clk =~clk;
    Covolution2D_3x3_stride1x1 #(
        .DATA_WIDHT(DATA_WIDHT),
        .IMG_WIDTH(IMG_WIDTH),
        .IMG_HEIGHT(IMG_HEIGHT),
        .Kernel1(Kernel1),
        .Kernel2(Kernel2),
        .Kernel3(Kernel3),
        .Kernel4(Kernel4),
        .Kernel5(Kernel5),
        .Kernel6(Kernel6),
        .Kernel7(Kernel7),
        .Kernel8(Kernel8),
        .Kernel9(Kernel9)
        )
        DUT (
            .Data_In(Data_In),
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_Out(Data_Out),
            .Valid_Out(Valid_Out)
        );
endmodule