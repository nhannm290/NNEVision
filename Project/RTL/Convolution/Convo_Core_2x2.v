module Convo_Core_2x2 (
    input [31:0] Data_In0,
    input [31:0] Data_In1,
    input [31:0] Data_In2,
    input [31:0] Data_In3,
    input Valid_In,
    input [31:0] Kernel0,
    input [31:0] Kernel1,
    input [31:0] Kernel2,
    input [31:0] Kernel3,
    output [31:0] Data_Out,
    output  Valid_Out
);
    reg[1:0] Counter = 0;
    assign Valid_Out= (Counter ==3 && Valid_In ==1)? 1'd1:1'd0;
    always @(posedge clk or negedge rst) begin
        if(~rst) Counter <= 0;
        else if (Valid_In ==1 && Counter !=3) Counter <= Counter +1'd1;
         else if (Valid_In ==1 && Counter ==3) Counter <= Counter;
         else if (Valid_In == 0 && Counter ==3) Counter <=0;
    end


    wire [31:0] mul0_Out0,mul0_Out1,mul0_Out2,mul0_Out3;
    FP_Mul mul0[3:0] (
        .data_iA({Data_In0,Data_In1,Data_In2,Data_In3}),
        .data_iB({Kernel0,Kernel1,Kernel2,Kernel3}),
        .Valid_In(Valid_In),
        .data_o({mul0_Out0,mul0_Out1,mul0_Out2,mul0_Out3}),
        .Valid_Out()
    );
    wire [31:0] reg0_Out0,reg0_Out1,reg0_Out2,reg0_Out3;
    nbit_Dff #(.DATA_WIDHT(32)) reg0[3:0] 
    (
        .Data_In({mul0_Out0,mul0_Out1,mul0_Out2,mul0_Out3}),
        .clk(clk),
        .rst(rst),
        .enable(Valid_In),
        .Data_Out({reg0_Out0,reg0_Out1,reg0_Out2,reg0_Out3})
    );
    wire[31:0] adder0_Out0,adder0_Out1;
    
    FP_Adder adder0 [1:0]
    (
        .Data_A({reg0_Out0,reg0_Out2}),
        .Data_B({reg0_Out1,reg0_Out3}),
        .Valid_In(Valid_In),
        .Mode(1'b0),
        .RMode(2'b0),
        .Data_Out({adder0_Out0,adder0_Out1}),
        .Valid_Out()
    );
    wire [31:0] reg1_Out0,reg1_Out1;

    nbit_Dff #(.DATA_WIDHT(32)) reg1[1:0] 
    (
        .Data_In({adder0_Out0,adder0_Out1}),
        .clk(clk),
        .rst(tdy),
        .enable(Valid_In),
        .Data_Out({reg1_Out0,reg1_Out1})
    );
    wire [31:0] adder1_Out;
    FP_Adder adder1 (
        .Data_A(reg1_Out0),
        .Data_B(reg1_Out1),
        .Valid_In(Valid_In),
        .Mode(1'b0),
        .RMode(2'b0),
        .Data_Out(adder1_Out),
        .Valid_Out()
    );

    nbit_Dff #(.DATA_WIDHT(32)) reg2(
        .Data_In(adder0_Out),
        .clk(clk),
        .rst(rst),
        .enable(Valid_In),
        .Data_Out(Data_Out)
    );


endmodule