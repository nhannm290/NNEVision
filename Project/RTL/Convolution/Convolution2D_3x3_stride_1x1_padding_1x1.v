`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2021 10:48:53 PM
// Design Name: 
// Module Name: Convolution2D
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


   module Convolution2D_3x3_stride_1x1_padding_1x1 #(parameter IMG_WIDHT = 30,parameter IMG_HEIGHT = 30)
   (
      input [31:0] Data_In, 
      input [31:0] Kernel0,
      input [31:0] Kernel1,
      input [31:0] Kernel2,
      input [31:0] Kernel3,
      input [31:0] Kernel4,
      input [31:0] Kernel5,
      input [31:0] Kernel6,
      input [31:0] Kernel7,
      input [31:0] Kernel8,
      input clk,
      input rst,
      input Valid_In,
      output [31:0] Data_Out,
      output Valid_Out

   );

   wire [31:0] kernel_Data_Out1,kernel_Data_Out2,kernel_Data_Out3,kernel_Data_Out4,kernel_Data_Out5,kernel_Data_Out6,kernel_Data_Out7,kernel_Data_Out8,kernel_Data_Out9;
   wire kernal_Valid_Out;



   Kernel_3x3_stride_1x1_padding_1x1 #(.DATA_WIDHT(32),.IMG_WIDHT(IMG_WIDHT),.IMG_HEIGHT(IMG_HEIGHT))
   kernel   (
      .Data_In(Data_In),
      .Valid_in(Valid_In),
      .clk(clk),
      .rst(rst),
      .Data_Out1(kernel_Data_Out1),
      .Data_Out2(kernel_Data_Out2),
      .Data_Out3(kernel_Data_Out3),
      .Data_Out4(kernel_Data_Out4),
      .Data_Out5(kernel_Data_Out5),
      .Data_Out6(kernel_Data_Out6),
      .Data_Out7(kernel_Data_Out7),
      .Data_Out8(kernel_Data_Out8),
      .Data_Out9(kernel_Data_Out9),
      .Valid_Out(kernal_Valid_Out)
   );
   wire [31:0] Convo_Data_Out;
   wire Convo_Valid_Out;
   
   Convo_Core_3x3 core(
      .Data_In0(kernel_Data_Out1),
      .Data_In1(kernel_Data_Out2),
      .Data_In2(kernel_Data_Out3),
      .Data_In3(kernel_Data_Out4),
      .Data_In4(kernel_Data_Out5),
      .Data_In5(kernel_Data_Out6),
      .Data_In6(kernel_Data_Out7),
      .Data_In7(kernel_Data_Out8),
      .Data_In8(kernel_Data_Out9),
      .Kernel0(Kernel0),
      .Kernel1(Kernel1),
      .Kernel2(Kernel2),
      .Kernel3(Kernel3),
      .Kernel4(Kernel4),
      .Kernel5(Kernel5),
      .Kernel6(Kernel6),
      .Kernel7(Kernel7),
      .Kernel8(Kernel8),
      .Valid_In(Valid_In),
      .Data_Out(Data_Out),
      .Valid_Out(Valid_Out) 
   );
   
   endmodule
