module Calculation (
    Calculation_Frac, Small_Frac27,Large_Frac24,Sub_Signal
);
    input wire [23:0] Large_Frac24;
    input wire        Sub_Signal;
    input wire [26:0] Small_Frac27;
    output wire[27:0] Calculation_Frac;

    wire [27:0] Aligned_Large_Frac = {1'b0,Large_Frac24,3'b000};
    wire [27:0] Aligned_Small_Frac = {1'b0,Small_Frac27};
    assign Calculation_Frac = Sub_Signal? Aligned_Large_Frac - Aligned_Small_Frac : Aligned_Large_Frac + Aligned_Small_Frac;      
    
endmodule