module Reg (
    Result,Float_In,clk,clr,enable
);
    input wire clk,clr,enable;
    input wire [31:0] Float_In;
    output reg [31:0] Result;


    always @(posedge clk) begin
        if(~clr) Result <= 32'b0;
        else if (enable) Result <= Float_In;
        else Result <= Result;
    end

endmodule