module xor1bit(
input wire a,b,
output c,
input ENXor
);
wire s1;
xor n1(s1,a,b);
assign c = (ENXor ==1)? s1:1'b0;

endmodule