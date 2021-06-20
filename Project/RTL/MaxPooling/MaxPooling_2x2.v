module MaxPooling_2x2 (
    input [31:0] Data_In,
    input Valid_In,
    input clk,
    input rst,
    output [31:0] Data_Out,
    output Valid_Out
);

    wire [31:0] kernel_Data_Out1,kernel_Data_Out2,kernel_Data_Out3,kernel_Data_Out4;
    wire kernel_Valid_Out;

    Kernel_2x2_stride_2x2 #(.DATA_WIDHT(32), .IMG_WIDHT(299),.IMG_HEIGHT(299))
    kernel (
        .Data_In(Data_In),
        .Valid_In(Valid_In),
        .clk(clk),
        .rst(rst),
        .Data_Out1(kernel_Data_Out1),
        .Data_Out2(kernel_Data_Out2),
        .Data_Out3(kernel_Data_Out3),
        .Data_Out4(kernel_Data_Out4),
        .Valid_Out(kernel_Valid_Out)
    );
    Find_Max_2x2 #(.DATA_WIDHT(32))
    max_core(
        .Data_A(kernel_Data_Out1),
        .Data_B(kernel_Data_Out2),
        .Data_C(kernel_Data_Out3),
        .Data_D(kernel_Data_Out4),
        .Valid_In(kernel_Valid_Out),
        .clk(clk),
        .rst(rst),
        .Data_Out(Data_Out),
        .Valid_Out(Valid_Out)
    );
endmodule