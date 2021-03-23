module Controller (
    Enable_Reg0,Enable_Reg1,DONE,CLK,START
);
    input wire CLK,START;
    output reg Enable_Reg0,Enable_Reg1,DONE;

    reg [2:0] NEXT_STATE;
    parameter STATE0 = 3'b000;
    parameter STATE1 = 3'b001;
    parameter STATE2 = 3'b010;
    parameter STATE3 = 3'b011 ;
    
    always @(posedge CLK) begin
        case(NEXT_STATE)
            STATE0:
                if (START) begin
                        NEXT_STATE <= STATE1;
                end
                else begin
                        NEXT_STATE <= STATE0;
                end
            STATE1:     NEXT_STATE <= STATE2;
            STATE2:     NEXT_STATE <= STATE3;
            default:    NEXT_STATE <= STATE0;

        endcase
    end

    always @(NEXT_STATE) begin
        case (NEXT_STATE)
            STATE0:
                begin
                    Enable_Reg0 <=0;
                    Enable_Reg1 <=0;
                    DONE        <=0;
                end
            STATE1: 
                begin
                    Enable_Reg0 <=1'b1;
                    Enable_Reg1 <=0;
                    DONE        <=0;   
                end
            STATE2: 
                begin
                    Enable_Reg0 <=0;
                    Enable_Reg1 <=1'b1;
                    DONE        <=0;
                end
            STATE3:
                begin
                    Enable_Reg0 <=0;
                    Enable_Reg1 <=0;
                    DONE        <=1'b1;
                end
            default: NEXT_STATE = STATE0;
        endcase
        
    end
endmodule