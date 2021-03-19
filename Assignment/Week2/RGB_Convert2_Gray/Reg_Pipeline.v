module Reg_Pipeline (
    Data_out,Data_in,Enable,CLK
);
    input wire [31:0] Data_in;
    input wire Enable,CLK;
    output reg [31:0] Data_out;

    always @(posedge CLK) begin 
        Data_out <= Enable? Data_in: Data_out;
    end
    
endmodule