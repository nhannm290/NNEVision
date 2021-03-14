module mul(a,b,out);
	input [23:0] a,b;
	output [47:0] out;
	
	wire [23:0] p0;
	wire [24:0] p1;
	wire [25:0] p2;
	wire [26:0] p3;
	wire [27:0] p4;
	wire [28:0] p5;
	wire [29:0] p6;
	wire [30:0] p7;
	wire [31:0] p8;
	wire [32:0] p9;
	wire [33:0] p10;
	wire [34:0] p11;
	wire [35:0] p12;
	wire [36:0] p13;
	wire [37:0] p14;
	wire [38:0] p15;
	wire [39:0] p16;
	wire [40:0] p17;
	wire [41:0] p18;
	wire [42:0] p19;
	wire [43:0] p20;
	wire [44:0] p21;
	wire [45:0] p22;
	wire [46:0] p23;
	
	wire [47:0]s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23;
	
	assign p0={24{a[0]}} & b[23:0];
	assign p1={24{a[1]}} & b[23:0];
	assign p2={24{a[2]}} & b[23:0];
	assign p3={24{a[3]}} & b[23:0];
	assign p4={24{a[4]}} & b[23:0];
	assign p5={24{a[5]}} & b[23:0];
	assign p6={24{a[6]}} & b[23:0];
	assign p7={24{a[7]}} & b[23:0];
	assign p8={24{a[8]}} & b[23:0];
	assign p9={24{a[9]}} & b[23:0];
	assign p10={24{a[10]}} & b[23:0];
	assign p11={24{a[11]}} & b[23:0];
	assign p12={24{a[12]}} & b[23:0];
	assign p13={24{a[13]}} & b[23:0];
	assign p14={24{a[14]}} & b[23:0];
	assign p15={24{a[15]}} & b[23:0];
	assign p16={24{a[16]}} & b[23:0];
	assign p17={24{a[17]}} & b[23:0];
	assign p18={24{a[18]}} & b[23:0];
	assign p19={24{a[19]}} & b[23:0];
	assign p20={24{a[20]}} & b[23:0];
	assign p21={24{a[21]}} & b[23:0];
	assign p22={24{a[22]}} & b[23:0];
	assign p23={24{a[23]}} & b[23:0];
	
	assign s1= p0 + (p1<<1);
	assign s2= s1 + (p2<<2);
	assign s3= s2 + (p3<<3);
	assign s4= s3 + (p4<<4);
	assign s5= s4 + (p5<<5);
	assign s6= s5 + (p6<<6);
	assign s7= s6 + (p7<<7);
	assign s8= s7 + (p8<<8);
	assign s9= s8 + (p9<<9);
	assign s10= s9 + (p10<<10);
	assign s11= s10 + (p11<<11);
	assign s12= s11 + (p12<<12);
	assign s13= s12 + (p13<<13);
	assign s14= s13 + (p14<<14);
	assign s15= s14 + (p15<<15);
	assign s16= s15 + (p16<<16);
	assign s17= s16 + (p17<<17);
	assign s18= s17 + (p18<<18);
	assign s19= s18 + (p19<<19);
	assign s20= s19 + (p20<<20);
	assign s21= s20 + (p21<<21);
	assign s22= s21 + (p22<<22);
	assign s23= s22 + (p23<<23);
	
	assign out=s23;
	
endmodule

	

	
	
	
	