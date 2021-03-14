module register1 
(
input clk,Value_In,
input [31:0] a,
output reg [31:0] b
);
	always @(posedge clk) begin
	if (Value_In == 1'b1)
		b <= a;
	else 
		b <= 0;
	end

endmodule
