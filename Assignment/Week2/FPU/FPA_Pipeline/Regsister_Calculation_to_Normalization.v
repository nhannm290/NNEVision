module Regsister_Calculation_to_Normalization (
    Normalization_is_NaN, Normalization_is_Infinite, Normalization_Sign, Normalization_Rm, Normalization_Exp, Normalization_Infinity_NaN_Frac, Normalization_Frac,Clk,Clear,Value_In,Calculation_is_NaN, Calculation_is_Infinite, Calculation_Sign, Calculation_Rm, Calculation_Exp, Calculation_Infinity_NaN_Frac, Calculation_Frac    
);  
    input [27:0] Calculation_Frac;
    input [22:0] Calculation_Infinity_NaN_Frac;
    input  [7:0] Calculation_Exp;
    input  [1:0] Calculation_Rm;
    input        Calculation_is_NaN, Calculation_is_Infinite, Calculation_Sign;
    input Value_In,Clk,Clear;
    output reg [27:0] Normalization_Frac;
    output reg [22:0] Normalization_Infinity_NaN_Frac;
    output reg [7:0] Normalization_Exp;
    output reg [1:0] Normalization_Rm;
    output reg Normalization_is_NaN, Normalization_is_Infinite, Normalization_Sign;

    always @(posedge Clk or negedge Clear) begin
        if (~Clear) begin
            Normalization_Rm                <= 0;
            Normalization_is_NaN            <= 0;
            Normalization_is_Infinite       <= 0;
            Normalization_Infinity_NaN_Frac <= 0;
            Normalization_Sign              <= 0;
            Normalization_Exp               <= 0;
            Normalization_Frac              <= 0;
        end
        else if (Value_In) begin
            Normalization_Rm                <= Calculation_Rm;
            Normalization_is_NaN            <= Calculation_is_NaN;
            Normalization_is_Infinite       <= Calculation_is_Infinite;
            Normalization_Infinity_NaN_Frac <= Calculation_Infinity_NaN_Frac;
            Normalization_Sign              <= Calculation_Sign;
            Normalization_Exp               <= Calculation_Exp;
            Normalization_Frac              <= Calculation_Frac;
        end
    end
endmodule