`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2021 09:59:21 AM
// Design Name: 
// Module Name: FP_Mul
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

module FP_Mul(data_iA, data_iB,Valid_In, data_o,Valid_Out);
    parameter   BUS_WIDTH = 32;
    
    input       [BUS_WIDTH - 1:0] data_iA, data_iB;
    input       Valid_In;
    output   [BUS_WIDTH - 1:0] data_o;
    output      Valid_Out;
    reg [31:0] temp_data_o;
    reg SignA, SignB, SignFinal;
    reg [7:0]   ExpA, ExpB, ExpFinal;
    reg [22:0]  MantA, MantB;
    reg [48:0]  MantFinal;
    assign data_o = (Valid_In)? temp_data_o:32'h0;
    assign Valid_Out = (Valid_In)? 1'b1:1'b0;
    always @ (data_iA, data_iB) begin
        // Separate all components
        SignA   =   data_iA[31];
        SignB   =   data_iB[31];
        ExpA    =   data_iA[30:23] - 8'd127;
        ExpB    =   data_iB[30:23] - 8'd127;
        MantA   =   data_iA[22:0];
        MantB   =   data_iB[22:0];

        // Calculate sign bit
        SignFinal   =   SignA ^ SignB;

        // Calculte exponent
        ExpFinal    =   ExpA + ExpB + 8'd127;

        // Multiply two mantissae
        MantFinal =   { 1'b1,MantA } * { 1'b1, MantB };
		  
		  // HANDLE EXCEPTIONAL CASES
		  
		  // Missing NaN case
		  
		  // Missing Infinity number case
		  
		  // If either A or B is 0 (both mantissa and exponent are zero)
		  // the result is always 0
		  if ((data_iA[30:23] == 8'd0 && data_iA[22:0] == 23'd0) ||
				(data_iB[30:23] == 8'd0 && data_iB[22:0] == 23'd0)) begin
				temp_data_o = { SignFinal, 30'd0 };
		  end
		  
		  // A and B not equal zero
		  else begin
			  if (MantFinal[47] == 1'b0) begin
					temp_data_o 	=	{ SignFinal, ExpFinal, MantFinal[45:23] };
			  end
			  else begin
					temp_data_o	=	{ SignFinal, ExpFinal + 8'd1, MantFinal[46:24] };
			  end
		  end
    end
endmodule
