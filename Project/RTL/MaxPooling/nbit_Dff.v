`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2021 03:48:07 PM
// Design Name: 
// Module Name: Dff
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


module nbit_Dff #(parameter DATA_WIDHT = 8) (
    input wire [DATA_WIDHT-1:0] Data_In,
    input wire clk,
    input wire rst,
    input wire enable,
    output reg [DATA_WIDHT-1:0] Data_Out
    );
    
    always @ (posedge clk or negedge rst) begin
        if(~rst) begin
            Data_Out <= 0;
        end
        else if(enable) begin
            Data_Out <= Data_In;
        end
        else;
    end   
endmodule
