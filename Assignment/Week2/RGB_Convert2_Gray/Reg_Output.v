module Reg_Output (
    Data_out,Data_in,Enable,CLK
);
    input wire [31:0] Data_in;
    input wire Enable,CLK;
    output reg [7:0] Data_out;

    always @(posedge CLK) begin 
        Data_out <= Enable? Data_in[7:0]: Data_out;
    end
    
endmodule