`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2021 07:35:11 PM
// Design Name: 
// Module Name: FP_Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FP_Adder(
    input [31:0] Data_A,
    input [31:0] Data_B,
    input Valid_In,
    input Mode,
    input [1:0]  RMode,
    output [31:0] Data_Out,
    output Valid_Out
    );
    
    wire exchange = ({1'b0,Data_B[30:0]} > {1'b0,Data_A[30:0]});
    wire [31:0] fp_large = exchange? Data_B: Data_A;
    wire [31:0] fp_small = exchange? Data_A: Data_B;
    wire        fp_large_hidden_bit =| fp_large[30:23];
    wire        fp_small_hidden_bit =| fp_small[30:23];
    wire [23:0] large_frac24 = {fp_large_hidden_bit,fp_large[22:0]};
    wire [23:0] small_frac24 = {fp_small_hidden_bit,fp_small[22:0]};
    wire [ 7:0] temp_exp = fp_large[30:23];
    wire        sign = exchange? Mode ^ Data_B[31] : Data_A[31];
    wire        op_Mode = Mode ^fp_large[31] ^ fp_small[31];
    wire        fp_large_expo_is_ff = &fp_large[30:23];
    wire        fp_small_expo_is_ff = &fp_small[30:23];
    wire        fp_large_frac_is_00 = ~| fp_large[22:0];
    wire        fp_small_frac_is_00 = ~| fp_small[22:0];
    wire        fp_large_is_inf = fp_large_expo_is_ff & fp_large_frac_is_00;
    wire        fp_small_is_inf = fp_small_expo_is_ff & fp_small_frac_is_00;
    wire        fp_large_is_nan = fp_large_expo_is_ff &~fp_large_frac_is_00;
    wire        fp_small_is_nan = fp_small_expo_is_ff &~fp_small_frac_is_00;
    wire        Data_Out_is_inf = fp_large_is_inf | fp_small_is_inf;
    wire        Data_Out_is_nan = fp_large_is_nan | fp_small_is_nan |
                 ((Mode^fp_small[31] ^fp_large[31]) & fp_large_is_inf & fp_small_is_inf); 
    wire [22:0] nan_frac = ({1'b0,Data_A[22:0]} > {1'b0,Data_B[22:0]}) ? {1'b1,Data_A[21:0]} : {1'b1,Data_B[21:0]};
    wire [22:0] inf_nan_frac = Data_Out_is_nan ? nan_frac : 23'h0;
    wire [ 7:0] exp_diff = fp_large[30:23] - fp_small[30:23];
    wire        small_den_only = (fp_large[30:23] !=0) & (fp_small[30:23] ==0);
    wire [ 7:0] shift_amount = small_den_only? exp_diff -8'h1: exp_diff;
    wire [49:0] small_frac50 = (shift_amount >= 26)? {26'h0,small_frac24} :{small_frac24,26'h0} >> shift_amount;
    wire [26:0] small_frac27 = {small_frac50[49:24],|small_frac50[23:0]};
    wire [27:0] aligned_large_frac = {1'b0,large_frac24,3'd0};
    wire [27:0] aligned_small_frac = {1'b0,small_frac27};
    wire [27:0] cal_frac=  op_Mode? aligned_large_frac - aligned_small_frac : aligned_large_frac + aligned_small_frac;
    wire [26:0] f4,f3,f2,f1,f0;
    wire [ 4:0] zeros;
    assign      zeros[4] = ~|cal_frac[26:11];
    assign      f4 = zeros[4]? {cal_frac[10:0],16'd0} : cal_frac[26:0];
    assign      zeros[3] =~| f4[26:19];
    assign      f3 = zeros[3]? {f4[18:0],8'b0} :f4;
    assign      zeros[2] =~| f3[26:23];
    assign      f2 = zeros[2]? {f3[22:0],4'd0} :f3;
    assign      zeros[1] =~| f2[26:25];
    assign      f1 = zeros[1]? {f2[24:0],2'd0} :f2;
    assign      zeros[0] =~f1[26];
    assign      f0 = zeros[0]? {f1[25:0],1'b0} :f1;
    reg [ 7:0]  exp0;
    reg [26:0]  frac0;
    
    always @ * begin
        if(cal_frac[27]) begin
            frac0 = cal_frac[27:1];
            exp0 = temp_exp +8'h1;
        end
        else begin
            if((temp_exp >zeros) && (f0[26])) begin
                exp0 = temp_exp - zeros;
                frac0 = f0;
            end
            else begin
                exp0 =0;
                if (temp_exp !=0) frac0= cal_frac[26:0] << (temp_exp-8'h1);
                else frac0 = cal_frac[26:0];
            end
        end
    end
    wire frac_plus_1 = ~RMode[1] & ~RMode[0] & frac0[2] & (frac0[1]|   frac0[0])            |
                       ~RMode[1] & ~RMode[0] & frac0[2] & ~frac0[1] & ~frac0[0] & frac0[3] |
                       ~RMode[1] &  RMode[0] &(frac0[2] |  frac0[1] |  frac0[0])& sign     |
                        RMode[1] & ~RMode[0] &(frac0[2] |  frac0[1] |  frac0[0])&~sign;
     
    
    wire [24:0] frac_round = {1'b0,frac0[26:3]} + frac_plus_1;
    wire [ 7:0] exponent = frac_round[24]? exp0 + 8'h1 : exp0;
    wire        overflow =  &exp0 | &exponent;
    wire [31:0] Temp;
    
    assign Temp = final_result(overflow,RMode,sign,Data_Out_is_nan,Data_Out_is_inf,exponent,frac_round[22:0],inf_nan_frac[22:0]);
    
    assign Data_Out = (Valid_In)? Temp:32'd0;
    assign Valid_Out = (Valid_In)? 1'b1:1'b0;
    
    function [31:0] final_result;
        input           overflow;
        input [1:0]     rMode;
        input           sign;
        input           in_nan;
        input           is_inf;
        input [7:0]     exponent;
        input [22:0]    fraction, inf_nan_frac;
        casex ({overflow,rMode,sign,Data_Out_is_nan,Data_Out_is_inf})
            6'b1_00_x_0_x: final_result = {sign,8'hff,23'h000000};
            6'b1_01_0_0_x: final_result = {sign,8'hfe,23'h7fffff};
            6'b1_01_1_0_x: final_result = {sign,8'hff,23'h0000000};
            6'b1_10_0_0_x: final_result = {sign,8'hff,23'h0000000};
            6'b1_10_1_0_x: final_result = {sign,8'hfe,23'h7fffff};
            6'b1_11_x_0_x: final_result = {sign,8'hfe,23'h7fffff};
            6'b0_xx_x_0_0: final_result = {sign,exponent,fraction};
            6'bx_xx_x_1_x: final_result = {1'b1,8'hff,inf_nan_frac};
            6'bx_xx_x_0_1: final_result = {sign,8'hff,inf_nan_frac};
            default:       final_result = {sign,8'h00,23'h0000000};
        endcase 
    endfunction 
endmodule
