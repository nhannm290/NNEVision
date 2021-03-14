module out(
input so,
input [7:0] eo,
input [22:0] mout,
output reg[31:0] result,
output reg flag,
input EN
);
	always @(*)
if (EN==1'b1)begin
	result <= {so,eo,mout};
	flag <= 1'b1;
	end
else begin
		result <= 0;
		flag <= 0;
	end
	
endmodule
/*always @ (*)
	if (EN ==1)begin
	s1 <= ~a;
	b <= s1 +1'b1;
	end
	else begin
	s1 <= 0;
	b <= 0;
	end
*/