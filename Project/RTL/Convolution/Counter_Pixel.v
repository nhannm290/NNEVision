`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2021 07:33:05 PM
// Design Name: 
// Module Name: Counter_Pixel
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


module Counter_Pixel#(parameter IMG_WIDTH=220,parameter IMG_HEIGHT = 220) (
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
            if(Counter ==IMG_WIDTH-2'd2) begin
                Counter <= Counter +1'd1;
                Data_Out <=0;
            end
            else if (Counter ==IMG_WIDTH-1'd1) begin
                Counter <= 0;
                Data_Out <= 0;
                Height = Height +1'd1;
            end
            else if(Height != IMG_HEIGHT-2'd2) begin
                Counter <= Counter+1'd1;
                Data_Out <=1;
            end
        end
        else Data_Out <=0;
    end
    
    
endmodule
