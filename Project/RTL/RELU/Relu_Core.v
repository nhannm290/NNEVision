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
    input clk,
    input rst,
    input Valid_In,
    output reg [31:0] Data_Out,
    output reg Valid_Out
    );
    always @(posedge clk or rst) begin
        if(~rst) begin
            Data_Out<=0;
            Valid_Out<=0;
        end
        else if (Valid_In) begin
            if(Data_In[31]) begin
                Data_Out <= 32'h0;
                Valid_Out <= 1;
            end
            else begin
                Data_Out <= Data_In;
                Valid_Out <= 1;
            end
        end
            
    end
endmodule
