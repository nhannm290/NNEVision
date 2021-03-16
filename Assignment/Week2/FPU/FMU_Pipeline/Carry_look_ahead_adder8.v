module Carry_look_ahead_adder8(
  input wire [7:0] e1,
  input wire [7:0] e2,
  output wire [7:0] eOut
  );
  
  wire [7:0]g;
  wire [7:0]p;
  wire [7:1]C;
  wire [20:0]temp;
  
  and a[7:0](g, e1, e2);
  or o[7:0](p, e1, e2);
  
  assign C[1] = g[0];
  and inst0(temp[0], p[1], g[0]);
  assign C[2] = g[1] | temp[0];
  
  and inst1(temp[1], p[2], g[1]);
  and inst2(temp[2], p[2], p[1], g[0]);
  assign C[3] = g[2] | temp[1]  | temp[2];
  
  and inst3(temp[3], p[3], g[2]);
  and inst4(temp[4], p[3], p[2], g[1]);
  and inst5(temp[5], p[3], p[2], p[1], g[0]);
  assign C[4] = g[3] | temp[3]  | temp[4]   | temp[5];
  
  and inst6(temp[6], p[4], g[3]);
  and inst7(temp[7], p[4], p[3], g[2]);
  and inst8(temp[8], p[4], p[3], p[2], g[1]);
  and inst9(temp[9], p[4], p[3], p[2], p[1], g[0]);
  assign C[5] = g[4] | temp[6]  | temp[7]   | temp[8]    | temp[9];
  
  and inst10(temp[10], p[5], g[4]);
  and inst11(temp[11], p[5], p[4], g[3]);
  and inst12(temp[12], p[5], p[4], p[3], g[2]);
  and inst13(temp[13], p[5], p[4], p[3], p[2], g[1]);
  and inst14(temp[14], p[5], p[4], p[3], p[2], p[1], g[0]);
  assign C[6] = g[5] | temp[10]  | temp[11]   | temp[12]    | temp[13]     | temp[14];
  
  and inst15(temp[15], p[6], g[5]);
  and inst16(temp[16], p[6], p[5], g[4]);
  and inst17(temp[17], p[6], p[5], p[4], g[3]);
  and inst18(temp[18], p[6], p[5], p[4], p[3], g[2]);
  and inst19(temp[19], p[6], p[5], p[4], p[3], p[2], g[1]);
  and inst20(temp[20], p[6], p[5], p[4], p[3], p[2], p[1], g[0]);
  assign C[7] = g[6] | temp[15]  | temp[16]   | temp[17]    | temp[18]     | temp[19]     | temp[20];  
  xor n_gate[7:0](eOut[7:0], e1[7:0], e2[7:0], {C[7:1], 1'b0});
endmodule

