module Normalization (
    Result,Sign,Result_is_NaN,Result_is_Infinity, Rm, Temp_Exp, Infinity_NaN_Frac, Calculation_Frac,Value_Out
);
    input [27:0] Calculation_Frac ;
    input [22:0] Infinity_NaN_Frac;
    input [7:0] Temp_Exp;
    input [1:0] Rm;
    input Result_is_NaN,Result_is_Infinity;
    input Sign;
    output Value_Out;
    output [31:0] Result;
    wire [26:0] F4,F3,F2,F1,F0;
    wire [4:0] Zeros;
    assign Zeros[4] = ~|Calculation_Frac[26:11];
    assign F4 = Zeros[4]?  {Calculation_Frac[10:0],16'b0} : Calculation_Frac[26:0];
    assign Zeros[3] = ~|F4[26:19];
    assign F3 = Zeros[3]? {F4[18:0],8'b0} : F4;
    assign Zeros[2] = ~|F3[26:23] ;
    assign F2 = Zeros[2]? {F3[22:0],4'b0} : F3;
    assign Zeros[1] = ~|F2[26:25];
    assign F1 = Zeros[1]? {F2[24:0],2'b0} : F2;
    assign Zeros[0] = ~F1[26];
    assign F0 = Zeros[0] ? {F1[25:0],1'b0}: F1;
    reg [26:0] Frac0;
    reg [7:0] Exp0;
    always @* begin
        if (Calculation_Frac[27]) begin
            Frac0 = Calculation_Frac[27:1];
            Exp0 = Temp_Exp + 8'h1;
        end
        else begin
            if ((Temp_Exp>Zeros) && (F0[26])) begin
                Exp0 = Temp_Exp - Zeros;
                Frac0 = F0;
            end
            else begin
                Exp0 = 0 ;
                if (Temp_Exp !=0) Frac0 = Calculation_Frac[26:0] << (Temp_Exp - 8'h1);
                else Frac0 = Calculation_Frac[26:0];
            end
        end
    end
    wire Frac_Plus_1 =  ~Rm[1] & ~Rm[0] &  Frac0[2] & (Frac0[1] |  Frac0[0])             | 
                        ~Rm[1] & ~Rm[0] &  Frac0[2] & ~Frac0[1] & ~Frac0[0]  &  Frac0[3] | 
                        ~Rm[1] &  Rm[0] & (Frac0[2]|   Frac0[1] |  Frac0[0]) &  Sign     |
                         Rm[1] & ~Rm[0] & (Frac0[2]|   Frac0[1] |  Frac0[0]) & ~Sign     ;
    wire [24:0] Frac_Round = {1'b0, Frac0[26:3]} + Frac_Plus_1;
    wire  [7:0] Exponent = Frac_Round[24]? Exp0 + 8'h1 :Exp0;
    wire        Overflow = &Exp0 | &Exponent;
    assign Result = Final_Result (Overflow,Rm,Sign,Result_is_NaN,Result_is_Infinity,Exponent,Frac_Round[22:0], Infinity_NaN_Frac);
    assign Value_Out = 1'b1;


    function [31:0] Final_Result;
        input Overflow;
        input [1:0] Rm;
        input Sign,Is_NaN,Is_Infinity;
        input [7:0] Exponent;
        input [22:0] Fraction,Infinity_NaN_Frac;
        casex ({Overflow,Rm,Sign,Is_NaN,Is_Infinity})
            6'b1_00_x_0_x: Final_Result = {Sign,8'hff,23'h0000000}; // Infinity
            6'b1_01_0_0_x:  Final_Result = {Sign,8'hfe,23'h7ffffff};
            6'b1_01_1_0_x:  Final_Result = {Sign,8'hff,23'h0000000};
            6'b1_10_0_0_x:  Final_Result = {Sign,8'hff,23'h0000000};
            6'b1_10_1_0_x:  Final_Result = {Sign,8'hfe,23'h7ffffff};
            6'b1_11_x_0_x:  Final_Result = {Sign,8'hfe,23'h7ffffff};
            6'b0_xx_x_0_0:  Final_Result = {Sign,Exponent,Fraction};
            6'bx_xx_x_1_x:  Final_Result = {Sign,8'hff,Infinity_NaN_Frac};
            6'bx_xx_x_0_1:  Final_Result = {Sign,8'hff,Infinity_NaN_Frac};
            default:        Final_Result = {Sign,8'h00,23'h000000};    
        endcase
    endfunction
endmodule