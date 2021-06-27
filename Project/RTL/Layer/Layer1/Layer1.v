module Layer1  #(
    parameter DATA_WIDHT = 32,
    parameter IMG_WIDHT =220,
    parameter IMG_HEIGHT =220,
    parameter CHANNEL = 1
) (
    input [DATA_WIDHT-1:0] Data_In,
    input clk,
    input rst,
    input Valid_In,
    output [DATA_WIDHT*8-1:0] DataOut,
    output Valid_Out
);
    
endmodule