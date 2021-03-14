`timescale 1ns/1ps
module Testbench;
	reg clk,start;
	reg [31:0] a,b;
	reg [7:0] bias;
	wire [31:0] out;
	
	wire Result;

initial 
begin
	clk =0;
	start = 0;
	a = 0;
	b = 0;
	bias = 8'd0;
	#15
	start = 1;
	bias = 8'd127;
	a = 32'b01000001110011000000000000000000;//01000001110011000000000000000000
	b = 32'b11000010011111010000000000000000;//11000010011111010000000000000000
	#30
	a = 32'b10111110100110011001100110011010;
	b = 32'b01000011111110100010000000000000;
	#45 start =0;
	    bias =0;
	#50 start =1;
	    bias = 8'd127;
	a = 32'b11000010011111010000000000000000;//01000001110011000000000000000000
	b = 32'b01000001110011000000000000000000;//11000010011111010000000000000000
	#65
	a = 32'b11000011011111110000000000000000; //-255
	b = 32'b11000011110001100000000000000000; //-396
	#80
	a = 32'b11000111000001101111000100000000; //-34545
	b = 32'b01001100000000110000001010100011; //34343565
	#95
	a = 32'b01001110001110110101011011001011; //46345345345435
	b = 32'b01010100110111000100000011101101;//7567856856856
	#110
	a = 32'b01111110010010110101010000101001; //67567567567657567657568567567568567567
	b = 32'b01101010110011000010101100100110;//123412312312323123123343434
	#125
	a = 32'b10111111100000000000000000000000; //-1
	b = 32'b10111111110001011100001010001111; //-1.545
	#140
	a = 32'b11000000000111111011101110111111; //-2.4958340593120940129423432452365
	b = 32'b10111110110010100010011110111010; //-0.394834342
	  #200 $stop;
end
//floatingpoint fpmulti_inst0(.a(a),.b(b),.bias(bias),.out(out),.Result(Result),.clk(clk));
FLpointCTRL FLpointCTRL_inst0(.a(a),.b(b),.clk(clk),.start(start),.bias(bias),.out(out),.result(Result));
always
#5 clk=~clk;
endmodule
