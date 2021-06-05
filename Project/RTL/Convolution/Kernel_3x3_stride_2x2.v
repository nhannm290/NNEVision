`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2021 03:41:38 PM
// Design Name: 
// Module Name: Double_Line_Buffer
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

module Kernel_3x3_stride_2x2#(parameter DATA_WIDHT = 32,parameter IMG_WIDHT =299,parameter IMG_HEIGHT =299)(
    input  [DATA_WIDHT-1:0] Data_In,
    input  Valid_in,
    input  clk,
    input  rst,
    output [DATA_WIDHT-1:0] Data_Out1,
    output [DATA_WIDHT-1:0] Data_Out2,
    output [DATA_WIDHT-1:0] Data_Out3,
    output [DATA_WIDHT-1:0] Data_Out4,
    output [DATA_WIDHT-1:0] Data_Out5,
    output [DATA_WIDHT-1:0] Data_Out6,
    output [DATA_WIDHT-1:0] Data_Out7,
    output [DATA_WIDHT-1:0] Data_Out8,
    output [DATA_WIDHT-1:0] Data_Out9,
    output reg Valid_Out
    );
    reg[31:0] Counter_Pixel = 1;
    reg[31:0] Counter_HEIGHT =0;
    always @ (posedge clk or negedge rst) begin 
        if(~rst) begin 
            Counter_Pixel <=1;
            Counter_HEIGHT <=0;
            Valid_Out <= 0;
        end
        else if(Valid_in) begin
            Counter_Pixel <= Counter_Pixel +1'd1;
        end
    end
    always @ (posedge clk or negedge rst) begin
        if(~rst) begin 
            Counter_Pixel <=1;
            Valid_Out <= 0;
            Counter_HEIGHT <=0;
        end
        else if(Valid_in) begin
            if (Counter_Pixel > IMG_WIDHT*(Counter_HEIGHT)+2 && (Counter_Pixel - IMG_WIDHT*(Counter_HEIGHT)+3) %2 ==0 && Counter_HEIGHT != 0) Valid_Out <=1;
            else Valid_Out <= 0;  
        end        
    end
    
    always @ (posedge clk or negedge rst) begin
        if(~rst) begin 
            Counter_Pixel <=1;
            Valid_Out <= 0;
            Counter_HEIGHT <=0;
        end
        else if(Valid_in) begin
            if (Counter_Pixel == IMG_WIDHT*2  && Counter_HEIGHT ==0) begin
                    Counter_HEIGHT <= Counter_HEIGHT +2;
            end
            else if (Counter_Pixel == IMG_WIDHT*(Counter_HEIGHT+1) && Counter_HEIGHT <IMG_HEIGHT+1) begin
                    Counter_HEIGHT <= Counter_HEIGHT +2;
            end
        end        
    end
    
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_9 (
            .Data_In(Data_In),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(Data_Out9)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_8 (
            .Data_In(Data_Out9),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(Data_Out8)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_7 (
            .Data_In(Data_Out8),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(Data_Out7)
        );
    wire Valid_Out_line6,Valid_Out_line3;    
    Line_Buffer #(.LENGHT(IMG_WIDHT-3),.DATA_WIDTH(DATA_WIDHT))
        line6(
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_in),
            .Data_In(Data_Out7),
            .Valid_Out(Valid_Out_line6),
            .Data_Out(Data_Out6)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_5 (
            .Data_In(Data_Out6),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(Data_Out5)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_4 (
            .Data_In(Data_Out5),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(Data_Out4)
        );                                    
    Line_Buffer #(.LENGHT(IMG_WIDHT-3),.DATA_WIDTH(DATA_WIDHT))
        line3(
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_in),
            .Data_In(Data_Out4),
            .Valid_Out(Valid_Out_line3),
            .Data_Out(Data_Out3)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_2 (
            .Data_In(Data_Out3),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(Data_Out2)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_1 (
            .Data_In(Data_Out2),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(Data_Out1)
        );
endmodule
