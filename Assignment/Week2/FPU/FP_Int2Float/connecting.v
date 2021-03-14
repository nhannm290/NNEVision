module connecting(
input clk,value_i,

input [7:0] i8,
output [31:0] outputfloat,
output Flag_done
);
wire [31:0] w1,w2;
wire [7:0] w3;

i8b2i32b inst_inst0(
							.out(w1), //32bit
							.a(i8) //8bit
							//.clk(clk)
							);
register1 register_inst0(
								.clk(clk),
								.Value_In(value_i),
								.a(w1),
								.b(w2)
								);
i2f i2f_inst0(
				.d(w2), //input 32bit
				.a(outputfloat), //output 
				.p_lost(),
				.Flag_done(Flag_done)
				);

endmodule

