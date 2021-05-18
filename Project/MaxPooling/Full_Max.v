`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2021 03:55:21 PM
// Design Name: 
// Module Name: Full_Max
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


module Full_Max #(parameter DATA_WIDHT = 32,parameter IMG_WIDHT =220,parameter IMG_HEIGHT =220)
    (
    input [31:0] Data_In,
    input clk,
    input rst, 
    input Valid_In,   
    output [31:0] Data_Out,
    output Valid_Out
    );
    wire Enable_Reg0,Enable_Reg1;
    
    wire [31:0] kernel_Data_Out1,kernel_Data_Out2,kernel_Data_Out3,kernel_Data_Out4,max_Data_Out;
    wire kernel_Valid_Out;
    Kernel_2#(.DATA_WIDHT(),.IMG_WIDHT(IMG_WIDHT),.IMG_HEIGHT(IMG_HEIGHT))
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
    wire max_Valid_Out;
    Max_Value find_max(
        .Data_A(kernel_Data_Out1),
        .Data_B(kernel_Data_Out2),
        .Data_C(kernel_Data_Out3),
        .Data_D(kernel_Data_Out4),
        .Valid_In(kernel_Valid_Out),
        .clk(clk),
        .rst(rst),
        .Data_Out(max_Data_Out),
        .Valid_Out(max_Valid_Out)
    );
    
    Counter_Pixel_ver2 #(.IMG_WIDTH(IMG_WIDHT/2),.IMG_HEIGHT(IMG_HEIGHT/2))
        counter (
            .Data_In(max_Valid_Out),
            .clk(clk),
            .rst(rst),
            .Data_Out(Valid_Out)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT)) 
        delay_reg(
            .Data_In(max_Data_Out),
            .clk(clk),
            .rst(rst),
            .enable(max_Valid_Out),
            .Data_Out(Data_Out)
        ); 
    
    
endmodule
