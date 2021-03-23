module Mux2_1 (
    Data_Out,Data_A,Data_B,Select
);
    input [31:0] Data_A,Data_B;
    input Select;
    output reg [31:0] Data_Out;

    always @(Select,Data_A,Data_B) begin
        case (Select) 
            1'b0: Data_Out = Data_A;
            1'b1: Data_Out = Data_B;
        endcase
    end
    
endmodule