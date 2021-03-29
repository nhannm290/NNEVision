module DONE(
input flag,
input flagout,
output reg done,
input ENDone
);
//assign done = (flag==1'b1 && flagout ==1'b1)?1'b1:1'b0;
always @(*)begin
		if(flag ==1'b1 && flagout ==1'b1 && ENDone == 1'b1)
		done <= 1'b1;
		else
		done <= 1'b0;
end

endmodule
