module comparator10(
input [7:0]a,
output overflow
);

assign overflow = (a > 8'd254) ?1'd1:1'd0;

endmodule
