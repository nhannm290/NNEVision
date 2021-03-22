module Reg_Out (
    Data_Out,Data_In,Enable,CLK,CLEAR
);
    input   [7:0] Data_In;
    input       Enable,CLK,CLEAR;
    output reg  [7:0] Data_Out;

    always @(posedge CLK) begin
        if (Enable) begin
            Data_Out <= Data_In;
        end
        else if (~CLEAR) begin
            Data_Out <= 8'b0;
        end
        else begin
            Data_Out <= Data_Out;
        end
    end
    
endmodule