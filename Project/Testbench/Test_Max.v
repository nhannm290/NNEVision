`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2021 02:35:49 PM
// Design Name: 
// Module Name: Test_Max
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


module Test_Max(

    );
    parameter CLK = 20;
    parameter Period = CLK*2;
    
    reg [31:0] Data_In0,Data_In1,Data_In2,Data_In3,Data_In4,Data_In5,Data_In6,Data_In7,Data_In8;
    reg Valid_In;
    reg clk;
    reg rst;
    
    wire [31:0] Data_Out;
    wire Valid_Out;
    
    initial begin
        clk = 0;
        rst = 0;
        Valid_In = 0;
        Data_In0 = 0;
        Data_In1 = 0;
        Data_In2 = 0;
        Data_In3 = 0;
        Data_In4 = 0;
        Data_In5 = 0;
        Data_In6 = 0;
        Data_In7 = 0;
        Data_In8 = 0;
        #Period
        rst = 1;
        Valid_In = 1;
        #CLK
        Data_In0 = 32'h404851ec; //3.13
        Data_In1 = 32'hc0551eb8; //-3.33
        Data_In2 = 32'hbfab851f; //-1.34
        Data_In3 = 32'h40a75c29; //5.23
        Data_In4 = 32'h420070a4; //32.11
        Data_In5 = 32'h40c722d1; //6.23
        Data_In6 = 32'hc2c80000; //-100
        Data_In7 = 32'h401c28f6; //2.44
        Data_In8 = 32'h40f570a4; //7.67
        #CLK
        Valid_In = 0;
    end
    always #CLK clk =~clk;
    Find_Max_3x3 DUT(
        .Data_In0(Data_In0),
        .Data_In1(Data_In1),
        .Data_In2(Data_In2),
        .Data_In3(Data_In3),
        .Data_In4(Data_In4),
        .Data_In5(Data_In5),
        .Data_In6(Data_In6),
        .Data_In7(Data_In7),
        .Data_In8(Data_In8),
        .Valid_In(Valid_In),
        .clk(clk),
        .rst(rst),
        .Data_Out(Data_Out),
        .Valid_Out(Valid_Out)
    );   
endmodule
