`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UIT
// Engineer: Nguyen Hong Lac
// 
// Create Date: 05/01/2021 10:25:52 PM
// Design Name: 
// Module Name: Line_Buffer
// Project Name: 
// Target Devices: 
// Tool Versions: Vivado 2020.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Line_Buffer#(parameter LENGHT = 10,parameter DATA_WIDTH = 8)(
    input wire clk,
    input wire rst,
    input wire Valid_In,
    input wire [DATA_WIDTH -1:0] Data_In,
    output reg Valid_Out,
    output reg [DATA_WIDTH-1:0] Data_Out
    );
    reg [31:0] Counter = 0;
    reg [31:0] Address =0;
    reg [DATA_WIDTH -1:0] BUFFER [LENGHT -1:0];
    
    integer i;
    initial  begin  
        for(i=0;i<LENGHT;i=i+1'd1) begin
            BUFFER[i] <=0;
        end 
    end
    
    always @ (posedge clk, negedge rst) begin
        if(~rst) begin
            Valid_Out <=0;
            Data_Out <=0;
            Counter <=0;
            Address <=0;
        end
        else begin
            // First we need to fill BUFFER before pop data out
            if (Counter < LENGHT && Valid_In ==1) begin
                BUFFER[Counter] <= Data_In;
                Counter = Counter + 1'd1;
            end
            // After fill buffer. If data's pushed, let pop data out
            // The first data out is the firs data in (like FIFO)
            else if (Counter == LENGHT && Valid_In ==1) begin
                // The first data will pop out first
                Data_Out <= BUFFER[0];
                Valid_Out <= 1;
                //Let swap the data
                // The second data -> the first data. anothers to
                for (i =0;i< LENGHT;i=i+1'd1) begin
                    if(i== LENGHT-1'd1) begin
                        BUFFER[i] <= Data_In;
                    end
                    else BUFFER[i] <= BUFFER[i+1'd1];
                end
            end
            if (Counter == LENGHT && Valid_In == 0) begin
                if(Address != LENGHT) begin
                    Data_Out <= BUFFER[Address];
                    BUFFER[Address] <= 0;
                    Address <= Address +1'd1;
                    Valid_Out <= 1;
                end
                else begin
                    Data_Out <= 0;
                    Valid_Out <= 0;
                end
            end  
        end    
    end
    
    
endmodule
