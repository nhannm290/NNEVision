`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2021 11:11:29 PM
// Design Name: 
// Module Name: Kernel_1x1_stride_2x2
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


module Kernel_1x1_stride_2x2#(parameter IMG_WIDHT = 299, parameter IMG_HEIGHT = 299)
    (
        input [31:0] Data_In,
        input Valid_In,
        input clk,
        input rst,
        output [31:0] Data_Out,
        output reg Valid_Out
    );

    reg[31:0] Counter_Pixel =0;
    // Counter pixel processing
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            Counter_Pixel <=0;
        end
        else if (Valid_In) begin
            if (Counter_Pixel < IMG_WIDHT *IMG_HEIGHT -1) Counter_Pixel <= Counter_Pixel + 32'd1;
            else Counter_Pixel <= Counter_Pixel;
        end
    end
    // Counter HEIGHT processing
    reg[31:0] Counter_HEIGHT = 0;
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            Counter_Pixel <=0;
        end
        else if (Valid_In) begin
            if(Counter_Pixel == 2*IMG_WIDHT -1 && Counter_HEIGHT < IMG_HEIGHT) Counter_HEIGHT = Counter_HEIGHT +1'd1;
        end
    end
    // Valid_Out processing
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            Valid_Out <= 0;
        end
        else if (Valid_In) begin
            if (Counter_Pixel > IMG_WIDHT*Counter_HEIGHT && (Counter_Pixel - IMG_WIDHT*Counter_HEIGHT+2) %2 ==0) Valid_Out <= 1;
            else Valid_Out <= 0;
        end
    end

    Line_Buffer #(.LENGHT(IMG_WIDHT),.DATA_WIDHT(32))
        line (
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_In(Data_In),
            .Valid_Out(),
            .Data_Out(Data_Out)
        );
endmodule
