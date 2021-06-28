`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2021 10:48:50 PM
// Design Name: 
// Module Name: Relu_Core
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


module Relu_Core(
    input [31:0] Data_In,
    input Valid_In,
    output reg [31:0] Data_Out,
    output  Valid_Out
    );
    assign Valid_Out = (Valid_In ==1) ? 1 : 0;
    always @(Data_In or Valid_In) begin 
        if (Valid_In ==1) begin
            if (Data_In[31]) Data_Out <=32'h0;
            else Data_Out <= Data_In;
        end
        else Data_Out <= 32'hzzzzzzzz;
    end
endmodule
