`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2021 03:49:14 PM
// Design Name: 
// Module Name: Test_Kernel2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Test_Kernel_3x3_stride_2x2(
    
    );
    parameter   DATA_WIDHT = 32;
    parameter   IMG_WIDHT = 220;
    parameter   IMG_HEIGHT =220;
    parameter   ADDRESS_READ = "E:/ChuyenDeHeViMach/NNL/Project/Testbench/Testfile_Convert.txt";
    parameter   ADDRESS_WRITE = "E:/ChuyenDeHeViMach/NNL/Project/Testbench/RTL_Result.txt";
    parameter CLK = 20;
    parameter Period = CLK*2;
    
    reg [DATA_WIDHT-1:0] Data_In;
    reg clk,rst,Valid_in;
    
    
    wire [DATA_WIDHT-1:0] Data_Out1,Data_Out2,Data_Out3,Data_Out4,Data_Out5,Data_Out6,Data_Out7,Data_Out8,Data_Out9;
    wire Valid_Out;
    
    integer file_read,Data,file_write;
    initial begin
        clk = 0;
        rst = 0;
        Valid_in =0;
        #Period
        rst = 1;
        #CLK
        Valid_in = 1;
        file_read = $fopen(ADDRESS_READ,"r");
        file_write = $fopen(ADDRESS_WRITE,"w");
        while(!$feof(file_read) || Valid_Out ==1) begin
           Data = $fscanf(file_read,"%b",Data_In);
           if (Valid_Out) begin
               $fwrite(file_write,"%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\n",Data_Out1,Data_Out2,Data_Out3,Data_Out4,Data_Out5,Data_Out6,Data_Out7,Data_Out8,Data_Out9);
           end
           #Period;
        end
        Data_In = 0;
        $finish;
    end
always  #CLK clk =~clk;

   Kernel_3x3_stride_2x2#(.DATA_WIDHT(DATA_WIDHT),.IMG_WIDHT(IMG_WIDHT),.IMG_HEIGHT(IMG_HEIGHT))
   DUT(
        .Data_In(Data_In),
        .Valid_in(Valid_in),
        .clk(clk),
        .rst(rst),
        .Data_Out1(Data_Out1),
        .Data_Out2(Data_Out2),
        .Data_Out3(Data_Out3),
        .Data_Out4(Data_Out4),
	    .Data_Out5(Data_Out5),
	    .Data_Out6(Data_Out6),
	    .Data_Out7(Data_Out7),
	    .Data_Out8(Data_Out8),
	    .Data_Out9(Data_Out9),
        .Valid_Out(Valid_Out)
        );
endmodule
    
