module Alignment (
    small_frac27,large_frac24,Infinity_NaN_fraction,temp_exp,Result_is_NaN,Result_is_inf,sign,op_sub,OpA,OpB,Sub_Signal
);
    input [31:0] OpA,OpB;
    input Sub_Signal;
    output [26:0] small_frac27;
    output [23:0] large_frac24;
    output [22:0] Infinity_NaN_fraction;
    output [7:0] temp_exp;
    output Result_is_NaN,Result_is_inf,sign,op_sub;

    wire exchange = (OpB[30:0] > OpA[30:0]); // Check OpB > OpA for Sub calculation
    wire [31:0] number_large = exchange? OpB : OpA;
    wire [31:0] number_small = exchange? OpA : OpB;
    wire number_large_hidden_bit = |number_large[30:23];
    wire number_small_hidden_bit = |number_small[30:23];
    wire [23:0] large_frac24 = {number_large_hidden_bit, number_large[22:0]};
    wire [23:0] number_small_frac24 = {number_small_hidden_bit, number_small[22:0]}; 
    assign temp_exp = number_large[30:23]; 
    assign sign = exchange? Sub_Signal ^ OpB[31] : OpA[31];
    assign op_sub = Sub_Signal ^ number_large[31] ^ number_small[31];
    wire number_large_expo_is_ff = &number_large[30:23];  
    wire number_small_expo_is_ff = &number_small[30:23];
    wire number_large_fraction_is_00 = ~|number_large[22:0];
    wire number_small_fraction_is_00 = ~|number_small[22:0];
    wire number_large_is_infinity = number_large_expo_is_ff & number_large_fraction_is_00; // Check infinity number
    wire number_small_is_infinity = number_small_expo_is_ff & number_small_fraction_is_00; 
    wire number_large_is_NaN = number_large_expo_is_ff & ~number_large_fraction_is_00; // Check Not A Number 
    wire number_small_is_NaN = number_small_expo_is_ff & ~number_small_fraction_is_00;
    assign Result_is_inf = number_large_is_infinity | number_small_is_infinity;
    wire Result_is_NaN = number_large_is_NaN | number_small_is_NaN | ((Sub_Signal ^ number_small[31]^number_large[31]) & number_large_is_infinity & number_small_is_infinity);
    wire [22:0] NaN_fraction = (OpA[21:0] > OpB[21:0]) ? {1'b1,OpA[21:0]} : {1'b1,OpB[21:0]} ; 
    assign Infinity_NaN_fraction = Result_is_NaN ? NaN_fraction : 23'h0;
    wire [7:0] Exp_Sub = number_large[30:23] - number_small[30:23];
    wire small_den_only = (number_large[30:23] != 0) & (number_small[30:23] == 0);
    wire [7:0] Shift_Amout = small_den_only? Exp_Sub - 8'h1 : Exp_Sub;
    wire [49:0] small_frac50 = (Shift_Amout >=26)? {26'h0,number_small_frac24} : {number_small_frac24,26'h0} >> Shift_Amout;
    assign small_frac27 = {small_frac50[49:24] , |small_frac50[23:0]};

endmodule