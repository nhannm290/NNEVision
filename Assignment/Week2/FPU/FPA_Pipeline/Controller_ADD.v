module Controller_ADD (
    Enable_Reg0,Enable_Reg1,DONE,CLK,START
);
    input wire CLK,START;
    output reg Enable_Reg0,Enable_Reg1,DONE;

///////////////////////////STATE0//////////////////////
    reg Enable_Reg1_0,Done_0;
    always @(posedge CLK ) begin
        if (START ==1'b1) begin
            Enable_Reg0     <=1'b1;
            Enable_Reg1_0   <=1'b1;
            Done_0          <=1'b1;
        end
        else begin
            Enable_Reg0     <= 1'b0;
            Enable_Reg1_0   <= 1'b0;
            Done_0          <= 1'b0;
        end
    end
//////////////////////////STATE1//////////////////////
    reg Done_1;
    always @(posedge CLK ) begin
        Enable_Reg1         <= Enable_Reg1_0;
        Done_1              <= Done_0;
    end
//////////////////////////////////////////////////////
    always @(posedge CLK) begin
        DONE                <= Done_1;
    end 
endmodule

