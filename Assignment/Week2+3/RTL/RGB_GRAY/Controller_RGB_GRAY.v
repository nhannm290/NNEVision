module Controller_RGB_GRAY (
   DONE,ItF_Enable_In,Reg0_Enable,Mul_Enable_In,Reg1_Enable,Add_Enable1,Add_Enable2,Reg2_Enable,FtI_Enable,RegOut_Enable,
   Mul_Red_Flag,Mul_Green_Flag,Mul_Blue_Flag,DONE_Add_Flag,DONE_Add_Flag1,DONE_Add_Flag2,START,CLK,Reg0_Add_Enable,Reg1_Add_Enable
);
   input wire Mul_Red_Flag,Mul_Green_Flag,Mul_Blue_Flag,DONE_Add_Flag,DONE_Add_Flag1,DONE_Add_Flag2,START,CLK;
   output reg ItF_Enable_In,Reg0_Enable,Mul_Enable_In,Reg1_Enable,Add_Enable1,Add_Enable2,Reg2_Enable,FtI_Enable,RegOut_Enable,DONE,Reg0_Add_Enable,Reg1_Add_Enable;


   parameter S0 = 4'b0000;
   parameter S1 = 4'b0001;
   parameter S2 = 4'b0010;
   parameter S3 = 4'b0011;
   parameter S4 = 4'b0100;
   parameter S5 = 4'b0101;
   parameter S6 = 4'b0110;
   parameter S7 = 4'b0111;
   parameter S8 = 4'b1000;
   parameter S9 = 4'b1001;
   parameter S10 = 4'b1010;
   parameter S11 = 4'b1011;
   parameter S12 = 4'b1100;
   wire Mul_Flag;
   assign Mul_Flag = Mul_Red_Flag & Mul_Green_Flag & Mul_Blue_Flag;

   wire DONE_ADD_PATH1;
   assign DONE_ADD_PATH1 = DONE_Add_Flag1 & DONE_Add_Flag2;


   reg [3:0] Next_State;

   always @(posedge CLK) begin
      case (Next_State)
         S0: begin
            if (START) begin
               Next_State <= S1;
            end
            else begin
               Next_State <= S0;
            end
         end
         S1: Next_State <= S2;
         S2: Next_State <= S3;
         S3: Next_State <= S4;
         S4: begin
            if (Mul_Flag) begin
               Next_State <= S5;
            end
            else  begin
               Next_State <= S4;
            end
         end
         S5: begin
            if(DONE_ADD_PATH1) begin
               Next_State <= S6;
            end
            else begin
               Next_State <= S5;
            end
         end
         S6: Next_State <= S7;
         S7: begin
            if (DONE_Add_Flag) begin
               Next_State <= 8;
            end
            else begin
               Next_State <= S7;
            end
         end
         S8: Next_State <= S9;
         S9: Next_State <= S10;
         S10: Next_State <= S11;
         default: Next_State <= S0;
      endcase
   end

   always @(Next_State) begin
      if(Next_State ==S0)begin
         ItF_Enable_In      <=0;
         Reg0_Enable        <=0;
         Mul_Enable_In      <=0;
         Reg1_Enable        <=0;
         Add_Enable1        <=0;
         Reg0_Add_Enable    <=0;
         Reg1_Add_Enable    <=0;
         Add_Enable2        <=0;
         Reg2_Enable        <=0;
         FtI_Enable         <=0;
         RegOut_Enable      <=0;
         DONE               <=0;
         
      end
      else if(Next_State ==S1) begin
         ItF_Enable_In <=1'b1;
         Reg0_Enable    <=0;
         Mul_Enable_In  <=0;
         Reg1_Enable    <=0;
         Add_Enable1    <=0;
         Add_Enable2    <=0;
         Reg2_Enable    <=0;
         FtI_Enable     <=0;
         RegOut_Enable  <=0;
         DONE           <=0;
      end
      else if(Next_State ==S2) begin
         ItF_Enable_In <=1'b0;
         Reg0_Enable    <=1'b1;
         Mul_Enable_In  <=0;
         Reg1_Enable    <=0;
         Add_Enable1    <=0;
         Add_Enable2    <=0;
         Reg2_Enable    <=0;
         FtI_Enable     <=0;
         RegOut_Enable  <=0;
         DONE           <= 0;
      end
      else if(Next_State ==S3) begin
         ItF_Enable_In  <=0;
         Reg0_Enable    <=0;
         Mul_Enable_In  <=1'b1;
         Reg1_Enable    <=0;
         Add_Enable1    <=0;
         Reg0_Add_Enable    <=0;
         Reg1_Add_Enable    <=0;
         Add_Enable2    <=0;
         Reg2_Enable    <=0;
         FtI_Enable     <=0;
         RegOut_Enable  <=0;
         DONE           <=0;
      end
      else if(Next_State ==S4)begin
         ItF_Enable_In  <=0;
         Reg0_Enable    <=0;
         Mul_Enable_In  <=0;
         Reg1_Enable    <=1'b1;
         Add_Enable1    <=0;
         Reg0_Add_Enable    <=0;
         Reg1_Add_Enable    <=0;
         Add_Enable2    <=0;
         Reg2_Enable    <=0;
         FtI_Enable     <=0;
         RegOut_Enable  <=0;
         DONE           <=0;
      end
      else if(Next_State ==S5) begin
         ItF_Enable_In  <=0;
         Reg0_Enable    <=0;
         Mul_Enable_In  <=0;
         Reg1_Enable    <=0;
         Add_Enable1    <=1'b1;
         Reg0_Add_Enable    <=0;
         Reg1_Add_Enable    <=0;
         Add_Enable2    <=0;
         Reg2_Enable    <=0;
         FtI_Enable     <=0;
         RegOut_Enable  <=0;
         DONE           <=0;
      end
      else if(Next_State ==S6) begin
         ItF_Enable_In  <=0;
         Reg0_Enable        <=0;
         Mul_Enable_In      <=0;
         Reg1_Enable        <=0;
         Add_Enable1        <=0;
         Reg0_Add_Enable    <=1'b1;
         Reg1_Add_Enable    <=1'b1;
         Add_Enable2        <=0;
         Reg2_Enable        <=0;
         FtI_Enable         <=0;
         RegOut_Enable      <=0;
         DONE               <=0;
      end
      else if(Next_State ==S7) begin
         ItF_Enable_In  <=0;
         Reg0_Enable        <=0;
         Mul_Enable_In      <=0;
         Reg1_Enable        <=0;
         Add_Enable1        <=0;
         Reg0_Add_Enable    <=0;
         Reg1_Add_Enable    <=0;
         Add_Enable2        <=1'b1;
         Reg2_Enable        <=0;
         FtI_Enable         <=0;
         RegOut_Enable      <=0;
         DONE               <=0;
      end
      else if(Next_State ==S8) begin
         ItF_Enable_In  <=0;
         Reg0_Enable    <=0;
         Mul_Enable_In  <=0;
         Reg1_Enable    <=0;
         Add_Enable1    <=0;
         Add_Enable2    <=0;
         Reg2_Enable    <=1'b1;
         FtI_Enable     <=0;
         RegOut_Enable  <=0;
         DONE           <=0;
      end
      else if(Next_State ==S9) begin
         ItF_Enable_In  <=0;
         Reg0_Enable    <=0;
         Mul_Enable_In  <=0;
         Reg1_Enable    <=0;
         Add_Enable1    <=0;
         Add_Enable2    <=0;
         Reg2_Enable    <=0;
         FtI_Enable     <=1'b1;
         RegOut_Enable  <=0;
         DONE           <=0;
      end
      else if(Next_State ==S10) begin
         ItF_Enable_In  <=0;
         Reg0_Enable    <=0;
         Mul_Enable_In  <=0;
         Reg1_Enable    <=0;
         Add_Enable1    <=0;
         Add_Enable2    <=0;
         Reg2_Enable    <=0;
         FtI_Enable     <=0;
         RegOut_Enable  <=1'b1;
         DONE           <=0;
      end
      else if(Next_State ==S11) begin
         ItF_Enable_In  <=0;
         Reg0_Enable    <=0;
         Mul_Enable_In  <=0;
         Reg1_Enable    <=0;
         Add_Enable1    <=0;
         Add_Enable2    <=0;
         Reg2_Enable    <=0;
         FtI_Enable     <=0;
         RegOut_Enable  <=0;
         DONE           <=1'b1;
      end 
   end
endmodule
