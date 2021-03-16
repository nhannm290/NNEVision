module register1(
input clk,
input wire [7:0] biasOut,eOut,
output reg [7:0] outBias,OutE
);
always @(posedge clk)
	begin
	outBias <= biasOut;
	OutE <= eOut;
	end

endmodule
