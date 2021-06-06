`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2021 11:11:29 PM
// Design Name: 
// Module Name: Kernel_1x1_stride_1x1
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


module Kernel_1x1_stride_1x1 #(parameter IMG_WIDHT = 299)
    (
        input [31:0] Data_In,
        input Valid_In,
        input clk,
        input rst,
        output [31:0] Data_Out,
        output Valid_Out
    );

    Line_Buffer #(.LENGHT(IMG_WIDHT),.DATA_WIDHT(32))
        line (
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_In(Data_In),
            .Valid_Out(Valid_Out),
            .Data_Out(Data_Out)
        );




endmodule
