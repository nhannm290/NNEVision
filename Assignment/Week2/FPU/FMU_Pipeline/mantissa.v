module mantissa(
input [47:0]mo,
input [7:0] eo,
output reg [22:0]mout,
output reg[7:0]eout,
input EN
);

always @(EN,mo,eo)
if (EN == 1'b1) 
begin
	if (mo[47]==1)	begin
	eout <= eo +1'b1;
	mout <= mo[46:24];
					end    
	else begin
	 eout <= eo;
	 mout <= mo[45:23];
	 end
	 end
else begin
	eout <= 0;
	mout <= mo[22:0];
end
endmodule
