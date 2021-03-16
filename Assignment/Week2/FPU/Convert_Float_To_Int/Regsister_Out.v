module Regsister_Out (
    Data_Out,Data_In,Value_In,Clk,Clear
);
    input wire [31:0] Data_In;
    input wire Value_In,Clk,Clear;
    output reg [31:0] Data_Out;
    always @(posedge Clk) begin
        if (Value_In) begin
            Data_Out <= Data_In;
        end
        else if (~Clear) begin
            Data_Out <= 32'b0;
        end
        else Data_Out <= Data_Out;
    end
endmodule