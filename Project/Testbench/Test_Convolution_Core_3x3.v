`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2021 07:29:29 PM
// Design Name: 
// Module Name: Test_Convolution
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


module Test_Convolution_Core_3x3(
    );
    parameter DATA_WIDHT = 32;
    parameter CLK = 20;
    parameter Period = CLK*2;
    //parameter ADDRESS_Module = "/home/joenguyen/Convolution/Python/Gx_Filer.txt";
    parameter Kernel = 3;
    
    reg [DATA_WIDHT-1:0] Data_In1,Data_In2,Data_In3,Data_In4,Data_In5,Data_In6,Data_In7,Data_In8,Data_In9;
    wire 
    reg Valid_In,clk,rst;
    
    wire [DATA_WIDHT-1:0] Data_Out;
    wire Valid_Out;
    
    /*integer file_read0,file_read1,file_read2,file_read3,file_read4,file_read5,file_read6,file_read7,file_read8;
    integer Data0,Data1,Data2,Data3,Data4,Data5,Data6,Data7,Data8;*/
    
    initial begin
        clk = 0;
        rst = 0;
        Valid_In =0;

        #Period
        rst = 1;
        Valid_In = 1;
        Data_In1 = 32'h401c28f6; //2.44
        Data_In2 = 32'h3f9c8b44; // 1.223
        Data_In3 = 32'h40839581; //4.112
        Data_In4 = 32'h40a3f7cf; //5.124
        Data_In5 = 32'h40ce147b; //6.44
        Data_In6 = 32'h40aa3d71;//5.32
        Data_In7 = 32'h3fe39581;// 1.778
        Data_In8 = 32'h40766666; // 3.85
        Data_In9 = 32'h40c722d1; //6.223
	
        #1000 $finish;
    end
    always #CLK clk =~clk;
    Convo_Core_3x3#(.DATA_WIDHT(DATA_WIDHT))
        DUT (
                .Data_In0(Data_In1),
                .Data_In1(Data_In2),
                .Data_In2(Data_In3),
                .Data_In3(Data_In4),
                .Data_In4(Data_In5),
                .Data_In5(Data_In6),
                .Data_In6(Data_In7),
                .Data_In7(Data_In8),
                .Data_In8(Data_In9),
                .Kernel0(32'h3f800000),//1
                .Kernel1(32'h40000000),//2
                .Kernel2(32'h40400000),//3
                .Kernel3(32'h40800000),//4
                .Kernel4(32'h40a00000),
                .Kernel5(32'h40c00000),
                .Kernel6(32'h40e00000),
                .Kernel7(32'h41000000),
                .Kernel8(32'h41100000),
                .Valid_In(Valid_In),
                .clk(clk),
                .rst(rst),
                .Data_Out(Data_Out),
                .Valid_Out(Valid_Out)
            );
endmodule
