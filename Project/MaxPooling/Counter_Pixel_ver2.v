`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2021 06:05:20 PM
// Design Name: 
// Module Name: Counter_Pixel_ver2
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


module Counter_Pixel_ver2#(parameter IMG_WIDTH=220,parameter IMG_HEIGHT = 220) (
    input Data_In,
    input clk,
    input rst,
    output reg Data_Out
    );
    reg[31:0] Counter=0;
    reg[31:0] Height =0;
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            Counter <=0;
            Height <=0;
        end
        else if (Data_In) begin
            if(Height != IMG_HEIGHT) begin
                Counter <= Counter+1'd1;
                Data_Out <=1;
            end
        end
        else Data_Out <=0;
    end
    
    
endmodule
