module FPA_Pipeline (
    Result, Value_Out, Value_In,Sub_Signal,Rm,OpA,OpB,Clk,Clear
);
    input Clk,Clear,Value_In;
    input [31:0] OpA,OpB;
    input [1:0] Rm;
    input Sub_Signal;
    output [31:0] Result;
    output Value_Out;
    wire [26:0] Alignment_Small_Frac;
    wire [23:0] Alignment_Large_Frac;
    wire [22:0] Alignment_Infinity_NaN_Frac;
    wire  [7:0] Alignment_Exp;
    wire Alignment_is_NaN, Alignment_is_Infinity;
    wire Alignment_Sign;
    wire Alignment_Sub_Signal;
    wire Alignment_Op_Sub;
    // Alignment Statements
    Alignment Al_State (
        .small_frac27(Alignment_Small_Frac),
        .large_frac24(Alignment_Large_Frac),
        .Infinity_NaN_fraction(Alignment_Infinity_NaN_Frac),
        .temp_exp(Alignment_Exp),
        .Result_is_NaN(Alignment_is_NaN),
        .Result_is_inf(Alignment_is_Infinity),
        .sign(Alignment_Sign),
        .op_sub(Alignment_Op_Sub),
        .OpA(OpA),
        .OpB(OpB),
        .Sub_Signal(Sub_Signal)
    );

    wire [26:0] Calculation_Small_Frac;
    wire [23:0] Calculation_Large_Frac;
    wire [22:0] Calculation_Infinity_NaN_Frac;
    wire [7:0] Calculation_Exp;
    wire [1:0] Calculation_Rm;
    wire Calculation_is_NaN,Calculation_is_Infinity;
    wire Calculation_Sign;
    wire Calculation_Op_Sub;

    // Pipeline Regsister
    Regsister_Aligment_to_Calculation RAtC (
        .Calculation_Small_Frac(Calculation_Small_Frac), 
        .Calculation_Large_Frac(Calculation_Large_Frac),
        .Calculation_Infinity_NaN_Frac(Calculation_Infinity_NaN_Frac), 
        .Calculation_Exp(Calculation_Exp), 
        .Calculation_Rm(Calculation_Rm), 
        .Calculation_is_NaN(Calculation_is_NaN), 
        .Calculation_is_Infinity(Calculation_is_Infinity),
        .Calculation_Sign(Calculation_Sign),
        .Calculation_Sub_Signal(Calculation_Op_Sub),
        .Alignment_Small_frac(Alignment_Small_Frac),
        .Alignment_Large_frac(Alignment_Large_Frac), 
        .Alignment_Infinity_NaN_frac(Alignment_Infinity_NaN_Frac),
        .Alignment_Exp(Alignment_Exp),
        .Alignment_Rm(Rm),
        .Alignment_is_NaN(Alignment_is_NaN),
        .Alignment_is_Infinity(Alignment_is_Infinity),
        .Alignment_Sign(Alignment_Sign),
        .Alignment_Sub_Signal(Alignment_Op_Sub),
        .Value_In(Value_In),
        .Clk(Clk),
        .Clear(Clear)
    );
    wire [27:0] Calculation_Frac;
    // Calculation State

    Calculation Cal_State (
        .Calculation_Frac(Calculation_Frac), 
        .Small_Frac27(Calculation_Small_Frac),
        .Large_Frac24(Calculation_Large_Frac),
        .Sub_Signal(Calculation_Op_Sub)
    );
    wire [27:0] Normalization_Frac;
    wire [22:0] Normalization_Infinity_NaN_Frac;
    wire  [7:0] Normalization_Exp;
    wire  [1:0] Normalization_Rm;
    wire        Normalization_is_NaN,Normalization_is_Infinity;
    //Pipeline Regsister and
    Regsister_Calculation_to_Normalization RCtN (
        .Normalization_is_NaN(Normalization_is_NaN), 
        .Normalization_is_Infinite(Normalization_is_Infinity), 
        .Normalization_Sign(Normalization_Sign), 
        .Normalization_Rm(Normalization_Rm), 
        .Normalization_Exp(Normalization_Exp), 
        .Normalization_Infinity_NaN_Frac(Normalization_Infinity_NaN_Frac), 
        .Normalization_Frac(Normalization_Frac),
        .Clk(Clk),
        .Clear(Clear),
        .Value_In(Value_In),
        .Calculation_is_NaN(Calculation_is_NaN), 
        .Calculation_is_Infinite(Calculation_is_Infinity), 
        .Calculation_Sign(Calculation_Sign), 
        .Calculation_Rm(Calculation_Rm), 
        .Calculation_Exp(Calculation_Exp), 
        .Calculation_Infinity_NaN_Frac(Calculation_Infinity_NaN_Frac), 
        .Calculation_Frac(Calculation_Frac)
    );

    // Normalization Stage
    Normalization Norm_State (
        .Result(Result),
        .Sign(Normalization_Sign),
        .Result_is_NaN(Normalization_is_NaN),
        .Result_is_Infinity(Normalization_is_Infinity), 
        .Rm(Normalization_Rm), 
        .Temp_Exp(Normalization_Exp), 
        .Infinity_NaN_Frac(Normalization_Infinity_NaN_Frac), 
        .Calculation_Frac(Normalization_Frac),
        .Value_Out(Value_Out)
    );
endmodule