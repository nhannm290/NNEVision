module Reg_Pipeline (
    Data_out,Data_in,Enable,CLK,CLEAR
);
    input wire [31:0] Data_in;
    input wire Enable,CLK,CLEAR;
    output reg [31:0] Data_out;

    always @(posedge CLK) begin 
        if (~CLEAR) begin
            Data_out <= 32'b0;
        end
        else if (Enable) begin
            Data_out <= Data_in;
        end
        else begin
            Data_out <= Data_out;
        end
    end
    
endmodule