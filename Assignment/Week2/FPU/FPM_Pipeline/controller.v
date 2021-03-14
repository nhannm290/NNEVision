module controller(
input clk,start,
output reg flag,
output reg NEG1,MAN3,OUT4,XOR4,DONE5,REG2,REG4
); 
reg [2:0] nextstate;
	parameter S0 = 3'b000;
	parameter S1 = 3'b001;
	parameter S2 = 3'b010;
	parameter S3 = 3'b011;
	parameter S4 = 3'b100;
	always @(posedge clk)begin
		case(nextstate)
			S0:nextstate <= S1;
			S1:if(start ==1)nextstate <= S2;
			S2:nextstate <= S3;
			S3:nextstate <= S4;
			default: nextstate <= S1;
		endcase
	end
	always @(nextstate)begin
		case(nextstate)
		S0:begin
			NEG1 = 1'b0;
			REG2 = 1'b0;
			MAN3 = 1'b0;
			OUT4 = 1'b0;
			XOR4 = 1'b0;
			REG4 = 1'b0;
			DONE5 = 1'b0;
			flag =1'b0;
		end
		S1:begin
			NEG1 = 1'b1;
			REG2 = 1'b0;
			MAN3 = 1'b0;
			OUT4 = 1'b0;
			XOR4 = 1'b0;
			REG4 = 1'b0;
			DONE5 = 1'b0;
			flag =1'b0;
		end
		S2:begin
			NEG1 = 1'b0;
			REG2 = 1'b1;
			MAN3 = 1'b0;
			OUT4 = 1'b0;
			XOR4 = 1'b0;
			REG4 = 1'b0;
			DONE5 = 1'b0;
			flag =1'b0;
		end
		S3:begin
			NEG1 = 1'b0;
			REG2 = 1'b0;
			MAN3 = 1'b1;
			OUT4 = 1'b1;
			XOR4 = 1'b1;
			REG4 = 1'b1;
			DONE5 = 1'b0;
			flag =1'b0;
		end
		S4:begin
			NEG1 = 1'b0;
			REG2 = 1'b0;
			MAN3 = 1'b0;
			OUT4 = 1'b0;
			XOR4 = 1'b0;
			REG4 = 1'b0;
			DONE5 = 1'b1;
			flag =1'b1;
		end
		
	//ADD1,NEG1,ADD2,MUL2,MAN3,OUT4,DONE5
		default:nextstate = S1;
	endcase
	end
endmodule
