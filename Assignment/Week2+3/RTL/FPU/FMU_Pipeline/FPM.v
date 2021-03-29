module FPM(
input wire clk,start,
input wire [31:0] a,b,
input wire [7:0]bias,
output [31:0]out,
output result,overflow
);

wire flag,NEG1,MAN3,OUT4,DONE5,ENXor,REG2,REG4;


floatingpoint floatingpoint_inst0(
											
											.clk(clk),
											.a(a),
											.b(b),
											.flag(flag),
											.NEG1(NEG1),
											.MAN3(MAN3),
											.OUT4(OUT4),
											.DONE5(DONE5),
											.ENXor(ENXor),
											.REG2(REG2),
											.REG4(REG4),
											.bias(bias),
											.out(out),
											.Result(result),
											.overflow(overflow)
											);

controller controller_inst1(
											
											.clk(clk),
											.start(start),
											.flag(flag),
											.NEG1(NEG1),
											.REG2(REG2),
											.MAN3(MAN3),
											.OUT4(OUT4),
											.XOR4(ENXor),
											.REG4(REG4),
											.DONE5(DONE5)
											);

endmodule

