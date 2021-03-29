module register2(
input EN,clk,
input [7:0]eoIN,
input [47:0] MultiIn,
output reg [7:0] eoOut,
output reg [47:0]moOut
);
always @(posedge clk)
	if (EN == 1'b1)
	 begin
	eoOut <= eoIN;
	moOut <= MultiIn;
	end
	else begin
	eoOut <= 0;
	moOut <= 0;
	end

endmodule
