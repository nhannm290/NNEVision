module Kernel_3x3_stride_1x1_padding_1 #(parameter IMG_WIDHT = 299, parameter IMG_HEIGHT = 299, parameter DATA_WIDHT = 32) (
    input [31:0] Data_In,
    input clk,
    input rst,
    input Valid_in,
    output reg [31:0] Data_Out1,
    output reg [31:0] Data_Out2,
    output reg [31:0] Data_Out3,
    output reg [31:0] Data_Out4,
    output reg [31:0] Data_Out5,
    output reg [31:0] Data_Out6,
    output reg [31:0] Data_Out7,
    output reg [31:0] Data_Out8,
    output reg [31:0] Data_Out9,
    output  Valid_Out
);
    wire [31:0] temp_Data_Out1,temp_Data_Out2,temp_Data_Out3,temp_Data_Out4,temp_Data_Out5,temp_Data_Out6,temp_Data_Out7,temp_Data_Out8,temp_Data_Out9;

    reg[31:0] Counter_Pixel = 1;
    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            Counter_Pixel <=0;
        end
        else if (Valid_in) Counter_Pixel <= Counter_Pixel +1;
    end

    reg [31:0] Counter_HEIGHT = 1;
    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            Counter_HEIGHT <=1;
        end
        else if (Valid_in) begin
            if (Counter_HEIGHT < IMG_HEIGHT && Counter_Pixel == IMG_WIDHT * Counter_HEIGHT) Counter_HEIGHT <= Counter_HEIGHT +1;
            else Counter_HEIGHT <= Counter_HEIGHT;
        end
    end


    // Process Result
    always @ (posedge clk or negedge rst) begin
        if (~rst) begin
            Data_Out1 <=0;
            Data_Out2 <=0;
            Data_Out3 <=0;
            Data_Out4 <=0;
            Data_Out5 <=0;
            Data_Out6 <=0;
            Data_Out7 <=0;
            Data_Out8 <=0;
            Data_Out9 <=0;
            
        end
        else if (Valid_in)  begin
            if (Counter_Pixel >=  IMG_WIDHT +2 && Counter_Pixel <= IMG_WIDHT*2+1) begin
                if (Counter_Pixel == IMG_WIDHT +2) begin
                    Data_Out1 <=0;
                    Data_Out2 <=0;
                    Data_Out3 <=0;
                    Data_Out4 <=0;
                    Data_Out5 <=temp_Data_Out5;
                    Data_Out6 <=temp_Data_Out6;
                    Data_Out7 <=0;
                    Data_Out8 <=temp_Data_Out8;
                    Data_Out9 <=temp_Data_Out9;
                end
                else if (Counter_Pixel == IMG_WIDHT*2+1) begin
                    Data_Out1 <=0;
                    Data_Out2 <=0;
                    Data_Out3 <=0;
                    Data_Out4 <=temp_Data_Out4;
                    Data_Out5 <=temp_Data_Out5;
                    Data_Out6 <=0;
                    Data_Out7 <=temp_Data_Out7;
                    Data_Out8 <=temp_Data_Out8;
                    Data_Out9 <=0;
                end
                else begin
                    Data_Out1 <=0;
                    Data_Out2 <=0;
                    Data_Out3 <=0;
                    Data_Out4 <=temp_Data_Out4;
                    Data_Out5 <=temp_Data_Out5;
                    Data_Out6 <=temp_Data_Out6;
                    Data_Out7 <=temp_Data_Out7;
                    Data_Out8 <=temp_Data_Out8;
                    Data_Out9 <=temp_Data_Out9;
                end
            end 
            else if (Counter_Pixel >= IMG_WIDHT*2+2 && Counter_Pixel < IMG_WIDHT *IMG_HEIGHT+2) begin
                if (Counter_Pixel == IMG_WIDHT*2 +2 || Counter_Pixel == IMG_WIDHT*(Counter_HEIGHT-1) +2 || 
                Counter_Pixel == IMG_WIDHT*IMG_HEIGHT +2) begin
                    Data_Out1 <=0;
                    Data_Out2 <=temp_Data_Out2;
                    Data_Out3 <=temp_Data_Out3;
                    Data_Out4 <=0;
                    Data_Out5 <=temp_Data_Out5;
                    Data_Out6 <=temp_Data_Out6;
                    Data_Out7 <=0;
                    Data_Out8 <=temp_Data_Out8;
                    Data_Out9 <=temp_Data_Out9;
                end
                else if (Counter_HEIGHT >=3 && (Counter_Pixel == IMG_WIDHT *(Counter_HEIGHT-1)+1 ||
                Counter_Pixel == IMG_WIDHT*IMG_HEIGHT +1 )) begin
                    Data_Out1 <=temp_Data_Out1;
                    Data_Out2 <=temp_Data_Out2;
                    Data_Out3 <=0;
                    Data_Out4 <=temp_Data_Out4;
                    Data_Out5 <=temp_Data_Out5;
                    Data_Out6 <=0;
                    Data_Out7 <=temp_Data_Out7;
                    Data_Out8 <=temp_Data_Out8;
                    Data_Out9 <=0;
                end
                else begin
                    Data_Out1 <=temp_Data_Out1;
                    Data_Out2 <=temp_Data_Out2;
                    Data_Out3 <=temp_Data_Out3;
                    Data_Out4 <=temp_Data_Out4;
                    Data_Out5 <=temp_Data_Out5;
                    Data_Out6 <=temp_Data_Out6;
                    Data_Out7 <=temp_Data_Out7;
                    Data_Out8 <=temp_Data_Out8;
                    Data_Out9 <=temp_Data_Out9;
                end 
            end
            else begin
                if (Counter_Pixel >= IMG_WIDHT*Counter_HEIGHT+2 && Counter_Pixel <IMG_WIDHT*(IMG_HEIGHT+1)+2) begin
                    if (Counter_Pixel ==  (IMG_WIDHT*IMG_HEIGHT)+2) begin
                        Data_Out1 <=0;
                        Data_Out2 <=temp_Data_Out2;
                        Data_Out3 <=temp_Data_Out3;
                        Data_Out4 <=0;
                        Data_Out5 <=temp_Data_Out5;
                        Data_Out6 <=temp_Data_Out6;
                        Data_Out7 <=0;
                        Data_Out8 <=0;
                        Data_Out9 <=0;
                    end
                    if (Counter_Pixel == IMG_WIDHT*(IMG_HEIGHT+1)+1) begin
                        Data_Out1 <=temp_Data_Out1;
                        Data_Out2 <=temp_Data_Out2;
                        Data_Out3 <=0;
                        Data_Out4 <=temp_Data_Out4;
                        Data_Out5 <=temp_Data_Out5;
                        Data_Out6 <=0;
                        Data_Out7 <=0;
                        Data_Out8 <=0;
                        Data_Out9 <=0;
                    end
                    else if (Counter_Pixel !=  (IMG_WIDHT*IMG_HEIGHT)+2) begin
                        Data_Out1 <=temp_Data_Out1;
                        Data_Out2 <=temp_Data_Out2;
                        Data_Out3 <=temp_Data_Out3;
                        Data_Out4 <=temp_Data_Out4;
                        Data_Out5 <=temp_Data_Out5;
                        Data_Out6 <=temp_Data_Out6;
                        Data_Out7 <=0;
                        Data_Out8 <=0;
                        Data_Out9 <=0;
                    end
                end
            end
        end
        else begin
            Data_Out1 <=0;
            Data_Out2 <=0;
            Data_Out3 <=0;
            Data_Out4 <=0;
            Data_Out5 <=0;
            Data_Out6 <=0;
            Data_Out7 <=0;
            Data_Out8 <=0;
            Data_Out9 <=0;
        end
    end

    assign Valid_Out= (Counter_Pixel>(IMG_WIDHT+2) && Counter_Pixel< (IMG_WIDHT*(IMG_HEIGHT+1)+3)) ? 1'b1:1'b0;

    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_9 (
            .Data_In(Data_In),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(temp_Data_Out9)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_8 (
            .Data_In(temp_Data_Out9),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(temp_Data_Out8)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_7 (
            .Data_In(temp_Data_Out8),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(temp_Data_Out7)
        );
    wire Valid_Out_line6,Valid_Out_line3;    
    Line_Buffer #(.LENGHT(IMG_WIDHT-3),.DATA_WIDTH(DATA_WIDHT))
        line6(
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_in),
            .Data_In(temp_Data_Out7),
            .Valid_Out(Valid_Out_line6),
            .Data_Out(temp_Data_Out6)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_5 (
            .Data_In(temp_Data_Out6),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(temp_Data_Out5)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_4 (
            .Data_In(temp_Data_Out5),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(temp_Data_Out4)
        );                                    
    Line_Buffer #(.LENGHT(IMG_WIDHT-3),.DATA_WIDTH(DATA_WIDHT))
        line3(
            .clk(clk),
            .rst(rst),
            .Valid_In(Valid_in),
            .Data_In(temp_Data_Out4),
            .Valid_Out(Valid_Out_line3),
            .Data_Out(temp_Data_Out3)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_2 (
            .Data_In(temp_Data_Out3),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(temp_Data_Out2)
        );
    nbit_Dff #(.DATA_WIDHT(DATA_WIDHT))
        dff_1 (
            .Data_In(temp_Data_Out2),
            .clk(clk),
            .rst(rst),
            .enable(Valid_in),
            .Data_Out(temp_Data_Out1)
        );
endmodule