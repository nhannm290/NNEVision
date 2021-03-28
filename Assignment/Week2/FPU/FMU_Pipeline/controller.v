module controller(
input clk,start,
output reg flag,
output reg NEG1,MAN3,OUT4,XOR4,DONE5,REG2,REG4
); 

/////////////////////////////////STATE0///////////////////////////////////////////////////////////////////////////////////////
//////////////Reg For STATE0//////////////////////
	reg REG2_0,MAN3_0,OUT4_0,XOR4_0,REG4_0,DONE5_0,flag_0;

	always @(posedge clk ) begin
		if (start ==1) begin
			NEG1 <= 1'b1;
			REG2_0 <= 1'b1;
			MAN3_0 <= 1'b1;
			OUT4_0 <= 1'b1;
			XOR4_0 <= 1'b1;
			REG4_0 <= 1'b1;
			DONE5_0 <= 1'b1;
			flag_0 <= 1'b1;
		end
		else begin
			NEG1 <= 1'b0;
			REG2_0 <= 1'b0;
			MAN3_0 <= 1'b0;
			OUT4_0 <= 1'b0;
			XOR4_0 <= 1'b0;
			REG4_0 <= 1'b0;
			DONE5_0 <= 1'b0;
			flag_0 <= 1'b0;
		end
	end
/////////////////////////////////STATE1///////////////////////////////////////////////////////////////////////////////////////
//////////////Reg For STATE1//////////////////////
	reg MAN3_1,OUT4_1,XOR4_1,REG4_1,DONE5_1,flag_1;
	always @(posedge clk ) begin
			REG2 	<= REG2_0;
			MAN3_1 	<= MAN3_0;
			OUT4_1 	<= OUT4_0;
			XOR4_1 	<= XOR4_0;
			REG4_1 	<= REG4_0;
			DONE5_1 <= DONE5_0;
			flag_1 	<= flag_0;
	end
/////////////////////////////////STATE2///////////////////////////////////////////////////////////////////////////////////////
//////////////Reg For STATE2//////////////////////
	reg DONE5_2,flag_2;
	always @(posedge clk ) begin
			MAN3	<= MAN3_1;
			OUT4	<= OUT4_1;
			XOR4 	<= XOR4_1;
			REG4 	<= REG4_1;
			DONE5_2	<= DONE5_1;
			flag_2 	<= flag_1;
	end
/////////////////////////////////STATE3///////////////////////////////////////////////////////////////////////////////////////
//////////////Reg For STATE3//////////////////////
	always @(posedge clk ) begin
			DONE5	<= DONE5_2;
			flag 	<= flag_2;
	end


endmodule
