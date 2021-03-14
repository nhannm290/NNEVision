module floatingpoint(
input wire clk,
input wire [31:0]a,
input wire [31:0]b,
input wire [7:0]bias,
output [31:0] out,
output Result,overflow,
input flag,NEG1,MAN3,OUT4,DONE5,ENXor,REG2,REG4
);
wire [7:0] outbias;
wire [47:0] mo;
wire [22:0] ma,mb,mout;
wire sa,sb,so;
wire [7:0] e1,e2,eout,eo;
wire [7:0] CLAout;
wire [31:0] outs1;
wire flagout;
wire [7:0] outreg2eo;
wire [47:0] outreg2mo;
assign sa = a[31];
assign sb = b[31];
xor1bit xor1bit_inst0(.a(sa),
							.b(sb),
							.ENXor(ENXor),
							.c(so));

assign e1[7:0]= a[30:23];
assign e2[7:0]= b[30:23];
Carry_look_ahead_adder8 inst0( //adder of 2 exponents 8bits.
										.e1(e1),
										.e2(e2),
										.eOut(CLAout)
										);
negnumber negnumber_inst0( //true with EN
								.a(bias),
								.b(outbias),
								.EN(NEG1)
								);
wire [7:0] outreg1bias,outreg1eout;
register1 register1(
							.biasOut(outbias),
							.eOut(CLAout),
							.clk(clk),
							.outBias(outreg1bias),
							.OutE(outreg1eout)
							);//assign eo [7:0]= CLAout - bias; // adder of two's complement or subtractor bias (127)
Carry_look_ahead_adder8 inst1( //adder of 2 exponents 8bits.
										.e1(outreg1bias),
										.e2(outreg1eout), // so dang bu 2 cua bias -127
										.eOut(eo)
										);
													
comparator10 comparator_inst0(
										.a(eout),
										.overflow(overflow));
//-------------------------
assign ma[22:0] = a[22:0];
assign mb[22:0] = b[22:0];
mul multi_inst0(
						.a({1'b1,ma}),
						.b({1'b1,mb}),
						.out(mo)
						);
register2 register2_inst0(
									.clk(clk),
									.EN(REG2),
									.eoIN(eo),
									.MultiIn(mo),
									.eoOut(outreg2eo),
									.moOut(outreg2mo)
									);
mantissa man_inst0(
					.mo(outreg2mo),
					.eo(outreg2eo),
					.mout(mout),
					.EN(MAN3),
					.eout(eout)
					);
											//Rouding the result to fit in the available bits
											// Checking for underflow/overflow occurence.
out out_inst0( //true with EN
				.so(so),
				.eo(eout),
				.mout(mout),
				.flag(flagout),
				.result(outs1),
				.EN(OUT4)
				);
register3 register3_inst0(
									.clk(clk),
									.EN(REG4),
									.flagIN(flagout),
									.ResultIn(outs1),
									.flagout(flagout2),
									.ResultOut(outs2)
									);
									wire [31:0] outs2;
									wire flagout2;
Tristate Tristate_inst0(.in(outs2), 
								.oe(Result), 
								.out(out));
DONE DONE_inst0(
					
					.flag(flag),
					.flagout(flagout2),
					.ENDone(DONE5),
					.done(Result)
);

endmodule
