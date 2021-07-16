module Batch_Norm (
    input [31:0] Data_A,
    input [31:0] Data_B,
    input [31:0] Data_In,
    input Valid_In,
    output [31:0] Data_Out,
    output Valid_Out
);
    reg[1:0] Counter = 0;

    // assign Valid_Out = (Counter ==2'd2 && Valid_In ==1) ? 1:0;

    // always @(posedge clk or negedge rst) begin
    //     if (~rst) Counter <= 0;
    //     else if (Valid_In) begin
    //         if (Counter != 2'd2) Counter <= Counter+1'd1;
    //         else if (Counter == 2'd2) Counter <= Counter ;
    //     end
    //     else if (Counter == 2'd2 && Valid_In ==0) Counter <= 0;
    // end


    wire [31:0] mul_Data_Out;

    FP_Mul mul (
        .data_iA(Data_A),
        .data_iB(Data_In),
        .Valid_In(Valid_In),
        .data_o(mul_Data_Out),
        .Valid_Out()
    );

    wire [31:0] reg0_Data_Out0,reg0_Data_Out1;

    // nbit_Dff #(.DATA_WIDHT(32))
    //     reg0[1:0] (
    //         .Data_In({mul_Data_Out,Data_B}),
    //         .clk(clk),
    //         .rst(rst),
    //         .enable(1'b1),
    //         .Data_Out({reg0_Data_Out0,reg0_Data_Out1})
    //     );
    wire [31:0] add_Data_Out;
    FP_Adder add(
        .Data_A(mul_Data_Out),
        .Data_B(Data_B),
        .Valid_In(Valid_In),
        .Mode(1'b0),
        .RMode(2'b0),
        .Data_Out(Data_Out),
        .Valid_Out(Valid_Out)
    );

    // nbit_Dff #(.DATA_WIDHT(32)) 
    //     reg1(
    //         .Data_In(add_Data_Out),
    //         .clk(clk),
    //         .rst(rst),
    //         .enable(1'b1),
    //         .Data_Out(Data_Out)
    //     );

endmodule