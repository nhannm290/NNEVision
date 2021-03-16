module Regsister_Aligment_to_Calculation (
    Calculation_Small_Frac, Calculation_Large_Frac,Calculation_Infinity_NaN_Frac, Calculation_Exp, Calculation_Rm, Calculation_is_NaN, Calculation_is_Infinity,Calculation_Sign, Calculation_Sub_Signal,Alignment_Small_frac,Alignment_Large_frac, Alignment_Infinity_NaN_frac,Alignment_Exp,Alignment_Rm,Alignment_is_NaN,Alignment_is_Infinity,Alignment_Sign,Alignment_Sub_Signal,Value_In,Clk,Clear
);

    input [26:0] Alignment_Small_frac;
    input [23:0] Alignment_Large_frac;
    input [22:0] Alignment_Infinity_NaN_frac;
    input  [7:0] Alignment_Exp;
    input  [1:0] Alignment_Rm;
    input        Alignment_is_Infinity,Alignment_Sign,Alignment_Sub_Signal,Alignment_is_NaN;
    input        Value_In,Clk,Clear;
    output reg [26:0] Calculation_Small_Frac; 
    output reg [23:0] Calculation_Large_Frac;
    output reg [22:0] Calculation_Infinity_NaN_Frac; 
    output reg  [7:0] Calculation_Exp;
    output reg  [1:0] Calculation_Rm;
    output reg        Calculation_is_NaN, Calculation_is_Infinity,Calculation_Sign, Calculation_Sub_Signal;

    always @(posedge Clk or negedge Clear) begin
        if (~Clear) begin
            Calculation_Rm                  <=0;
            Calculation_is_NaN              <=0;
            Calculation_is_Infinity         <=0;
            Calculation_Infinity_NaN_Frac   <=0;
            Calculation_Sign                <=0;
            Calculation_Exp                 <=0;
            Calculation_Sub_Signal          <=0;
            Calculation_Large_Frac          <=0;
            Calculation_Small_Frac          <=0;
        end
        else if (Value_In) begin
            Calculation_Rm                  <=Alignment_Rm;
            Calculation_is_NaN              <=Alignment_is_NaN;
            Calculation_is_Infinity         <=Alignment_is_Infinity;
            Calculation_Infinity_NaN_Frac   <=Alignment_Infinity_NaN_frac;
            Calculation_Sign                <=Alignment_Sign;
            Calculation_Exp                 <=Alignment_Exp;
            Calculation_Sub_Signal          <=Alignment_Sub_Signal;
            Calculation_Large_Frac          <=Alignment_Large_frac;
            Calculation_Small_Frac          <=Alignment_Small_frac;
        end
        
    end
    
endmodule