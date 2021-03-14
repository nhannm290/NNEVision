module i8b2i32b (out,a);
input [0:7] a;
output reg [31:0] out;
	
	
	always @ (a) begin
	out[31:8] <= 1'b0;
	out[7:0] <= a[0:7];
	end
	/*
assign out [31:8] = 1'b0;
assign out [7:0] = a[7:0];
*/

endmodule
