`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2021 08:28:11 PM
// Design Name: 
// Module Name: Mux_nbit
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


module Mux_nbit#(parameter DATA_WIDHT =8) (
    input [DATA_WIDHT-1:0] Data_A,
    input [DATA_WIDHT-1:0] Data_B,
    input Select,
    output reg [DATA_WIDHT-1:0] Data_Out
    );
    always @(Select or Data_A or Data_B) begin
        case(Select)
            1'd0: Data_Out <= Data_A;
            1'd1: Data_Out <= Data_B;
        endcase 
    end
endmodule
