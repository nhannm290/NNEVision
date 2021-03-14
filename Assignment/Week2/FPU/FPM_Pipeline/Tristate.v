module Tristate (
	 input [31:0] in,
     input  oe,
    output tri [31:0] out
	 
	 );
  //  tri  [31:0]  out;
	
    bufif1  b0[31:0](out[31:0], in[31:0], oe);
	

endmodule
