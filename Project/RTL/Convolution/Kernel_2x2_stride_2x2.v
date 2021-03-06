module Kernel_2x2_stride_2x2 #(parameter DATA_WIDHT = 32,parameter IMG_WIDHT =220,parameter IMG_HEIGHT =220)
    (
    input [DATA_WIDHT-1:0] Data_In,
    input Valid_In,
    input clk,
    input rst,
    output [DATA_WIDHT-1:0] Data_Out1,
    output [DATA_WIDHT-1:0] Data_Out2,
    output [DATA_WIDHT-1:0] Data_Out3,
    output [DATA_WIDHT-1:0] Data_Out4,
    output reg Valid_Out
    );
    reg[31:0] Counter_Pixel = 1;
    reg[31:0] Counter_HEIGHT =1;
    //Control for module
    always @ (posedge clk or negedge rst) begin 
        if(~rst) begin 
            Counter_Pixel <=1;
            Valid_Out <= 0;
        end
        else if(Valid_In) begin
            Counter_Pixel <= Counter_Pixel +1'd1;
        end
    end
    
    always @ (posedge clk or negedge rst) begin
        if(~rst) begin 
            Counter_Pixel <=1;
            Valid_Out <= 0;
        end
        else if(Valid_In) begin
            if (Counter_Pixel > IMG_WIDHT*Counter_HEIGHT+1 && (Counter_Pixel - IMG_WIDHT*Counter_HEIGHT+2) %2 ==0) Valid_Out <=1;
            else Valid_Out <= 0;  
        end        
    end
    
    always @ (posedge clk or negedge rst) begin
        if(~rst) begin 
            Counter_Pixel <=1;
            Valid_Out <= 0;
        end
        else if(Valid_In) begin
            if (Counter_Pixel == IMG_WIDHT*(Counter_HEIGHT+1) && Counter_HEIGHT <IMG_HEIGHT ) begin
                    Counter_HEIGHT <= Counter_HEIGHT +2;
            end
        end        
    end
    //Datapath
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_4 (
            .Data_In(Data_In),
            .clk(clk),
            .rst(rst),
            .enable(Valid_In),
            .Data_Out(Data_Out4)
        );
    
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_3 (
            .Data_In(Data_Out4),
            .clk(clk),
            .rst(rst),
            .enable(Valid_In),
            .Data_Out(Data_Out3)
        );
    wire [DATA_WIDHT-1:0] Line_Out;
    wire Valid_Out_line0;
    Line_Buffer #(.LENGHT(IMG_WIDHT-2),.DATA_WIDTH(DATA_WIDHT))
        line0(
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_In),
            .Data_In(Data_Out3),
            .Valid_Out(Valid_Out_line0),
            .Data_Out(Data_Out2)
        ); 
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_1 (
            .Data_In(Data_Out2),
            .clk(clk),
            .rst(rst),
            .enable(Valid_In),
            .Data_Out(Data_Out1)
        );  
    
    


endmodule