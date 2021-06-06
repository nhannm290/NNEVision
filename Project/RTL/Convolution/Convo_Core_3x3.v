`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2021 10:16:21 PM
// Design Name: 
// Module Name: Convo_Core
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


module Convo_Core_3x3(
         input [31:0] Data_In0,
         input [31:0] Data_In1,
         input [31:0] Data_In2,
         input [31:0] Data_In3,
         input [31:0] Data_In4,
         input [31:0] Data_In5,
         input [31:0] Data_In6,
         input [31:0] Data_In7,
         input [31:0] Data_In8,
         input [31:0] Kernel0, 
         input [31:0] Kernel1,
         input [31:0] Kernel2,
         input [31:0] Kernel3,
         input [31:0] Kernel4,
         input [31:0] Kernel5,
         input [31:0] Kernel6,
         input [31:0] Kernel7,
         input [31:0] Kernel8,
         input Valid_In,
         input clk,
         input rst,
         output [31:0] Data_Out,
         output  Valid_Out
         
      );
      reg [2:0] Counter =0;
    
      //assign Data_Out = (Counter ==4)? add3_Out:8'dz;
      assign Valid_Out= (Counter ==4 && Valid_In ==1)? 1'd1:1'd0;
      always @(posedge clk or negedge rst) begin
         if(~rst) begin 
               Counter <=0;
               
         end
         else if (Valid_In ==1 && Counter !=4) Counter <= Counter +1'd1;
         else if (Valid_In ==1 && Counter ==4) Counter <= Counter;
         else if (Valid_In == 0 && Counter ==4) Counter <=0;
      end


      wire [31:0] mul0,mul1,mul2,mul3,mul4,mul5,mul6,mul7,mul8;
      wire mul_valid_out;
      
      FP_Mul mul [8:0] (
         .data_iA({Data_In0,Data_In1,Data_In2,Data_In3,Data_In4,Data_In5,Data_In6,Data_In7,Data_In8}),
         .data_iB({Kernel0,Kernel1,Kernel2,Kernel3,Kernel4,Kernel5,Kernel6,Kernel7,Kernel8}),
         .Valid_In(Valid_In),
         .data_o({mul0,mul1,mul2,mul3,mul4,mul5,mul6,mul7,mul8}),
         .Valid_Out(mul_valid_out) 
      ); 
      wire [31:0] reg0_Out1,reg0_Out2,reg0_Out3,reg0_Out4,reg0_Out5,reg0_Out6,reg0_Out7,reg0_Out8,reg0_Out9;
      nbit_Dff #(.DATA_WIDHT(32)) reg0 [8:0]
      (
            .Data_In({{mul0,mul1,mul2,mul3,mul4,mul5,mul6,mul7,mul8}}),
            .clk(clk),
            .rst(rst),
            .enable(Valid_In),
            .Data_Out({reg0_Out1,reg0_Out2,reg0_Out3,reg0_Out4,reg0_Out5,reg0_Out6,reg0_Out7,reg0_Out8,reg0_Out9})
      );
      wire [31:0] add0_Out0,add0_Out1,add0_Out2,add0_Out3;
      

      FP_Adder adder0 [3:0] (
            .Data_A({reg0_Out1,reg0_Out3,reg0_Out5,reg0_Out7}),
            .Data_B({reg0_Out2,reg0_Out4,reg0_Out6,reg0_Out8}),
            .Valid_In(Valid_In),
            .Mode(1'b0),
            .RMode(2'b0),
            .Data_Out({add0_Out0,add0_Out1,add0_Out2,add0_Out3}),
            .Valid_Out()
      );
      wire [31:0] reg1_Out1,reg1_Out2,reg1_Out3,reg1_Out4,reg1_Out5;
      nbit_Dff #(.DATA_WIDHT(32)) reg1_In [4:0]
      (
         .Data_In({add0_Out0,add0_Out1,add0_Out2,add0_Out3,reg0_Out9}),
         .clk(clk),
         .rst(rst),
         .enable(Valid_In),
         .Data_Out({reg1_Out1,reg1_Out2,reg1_Out3,reg1_Out4,reg1_Out5})
      );
      wire [31:0] add1_Out1,add1_Out2;
      wire [31:0] reg2_Out1,reg2_Out2,reg2_Out3;
      FP_Adder adder1 [1:0]
      (
         .Data_A({reg1_Out1,reg1_Out3}),
         .Data_B({reg1_Out2,reg1_Out4}),
         .Valid_In(Valid_In),
         .Mode(1'b0),
         .RMode(2'b0),
         .Data_Out({add1_Out1,add1_Out2}),
         .Valid_Out()
      );

      nbit_Dff #(.DATA_WIDHT(32)) reg2_In [2:0]
      (
         .Data_In({add1_Out1,add1_Out2,reg1_Out5}),
         .clk(clk),
         .rst(rst),
         .enable(Valid_In),
         .Data_Out({reg2_Out1,reg2_Out2,reg2_Out3})    
      );  
      wire [31:0] add2_Out1;    
      FP_Adder adder2
      (
         .Data_A(reg2_Out1),
         .Data_B(reg2_Out2),
         .Valid_In(Valid_In),
         .Mode(1'b0),
         .RMode(2'b0),
         .Data_Out(add2_Out1),
         .Valid_Out()
      );
      wire [31:0] reg3_Out1,reg3_Out2;
      nbit_Dff #(.DATA_WIDHT(32)) reg3 [1:0]
      (
         .Data_In({add2_Out1,reg2_Out3}),
         .clk(clk),
         .rst(rst),
         .enable(Valid_In),
         .Data_Out({reg3_Out1,reg3_Out2})
      );  
      FP_Adder adder3
      (
         .Data_A(reg3_Out1),
         .Data_B(reg3_Out2),
         .Valid_In(Valid_In),
         .Mode(1'b0),
         .RMode(2'b0),
         .Data_Out(Data_Out),
         .Valid_Out()
      ); 

endmodule
