module register3(
input EN,clk,
input flagIN,
input [31:0] ResultIn,
output reg flagout,
output reg [31:0]ResultOut
);
always @(posedge clk)
	if (EN == 1'b1)
	 begin
	ResultOut <= ResultIn;
	flagout <= flagIN;
	end
	else begin
	ResultOut <= 0;
	flagout <= 0;
	end

endmodule
