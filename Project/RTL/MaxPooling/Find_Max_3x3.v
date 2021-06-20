module Find_Max_3x3 (
    input [31:0] Data_In0,
    input [31:0] Data_In1,
    input [31:0] Data_In2,
    input [31:0] Data_In3,
    input [31:0] Data_In4,
    input [31:0] Data_In5,
    input [31:0] Data_In6,
    input [31:0] Data_In7,
    input [31:0] Data_In8,
    input Valid_In,
    input clk,
    input rst,
    output [31:0] Data_Out,
    output Valid_Out
);
    reg[31:0] Counter = 0;
    //Controler
    assign Valid_Out= (Counter ==4 && Valid_In ==1)? 1'd1:1'd0;
    always @(posedge clk or negedge rst) begin
        if(~rst) begin 
            Counter <=0;
        end
        else if (Valid_In ==1 && Counter !=4) Counter <= Counter +1'd1;
        else if (Valid_In ==1 && Counter ==4) Counter <= Counter;
        else if (Valid_In == 0 && Counter ==4) Counter <=0;
    end




    // 1F Pipeline
    wire [31:0] sub0_Data_Out0,sub0_Data_Out1,sub0_Data_Out2,sub0_Data_Out3;

    FP_Adder sub0[3:0] (
        .Data_A({Data_In0,Data_In2,Data_In4,Data_In6}),
        .Data_B({Data_In1,Data_In3,Data_In5,Data_In7}),
        .Valid_In(Valid_In),
        .Mode(1'b1),
        .RMode(2'b0),
        .Data_Out({sub0_Data_Out0,sub0_Data_Out1,sub0_Data_Out2,sub0_Data_Out3}),
        .Valid_Out()
    );
    
    wire [31:0] mux0_Data_Out0,mux0_Data_Out1,mux0_Data_Out2,mux0_Data_Out3;

    Mux_nbit #(.DATA_WIDHT(32))
        mux0 [3:0](
            .Data_A({Data_In0,Data_In2,Data_In4,Data_In6}),
            .Data_B({Data_In1,Data_In3,Data_In5,Data_In7}),
            .Select({sub0_Data_Out0[31],sub0_Data_Out1[31],sub0_Data_Out2[31],sub0_Data_Out3[31]}),
            .Data_Out({mux0_Data_Out0,mux0_Data_Out1,mux0_Data_Out2,mux0_Data_Out3})
        );

    wire [31:0] reg0_Data_Out0,reg0_Data_Out1,reg0_Data_Out2,reg0_Data_Out3,reg0_Data_Out4;

    nbit_Dff #(.DATA_WIDHT(32))
        reg0 [4:0] (
            .Data_In({mux0_Data_Out0,mux0_Data_Out1,mux0_Data_Out2,mux0_Data_Out3,Data_In8}),
            .clk(clk),
            .rst(rst),
            .enable(enable),
            .Data_Out({reg0_Data_Out0,reg0_Data_Out1,reg0_Data_Out2,reg0_Data_Out3,reg0_Data_Out4})
        );
    // 2F Pipeline

    wire [31:0] sub1_Data_Out0,sub1_Data_Out1;

    FP_Adder sub1 [1:0] (
        .Data_A({reg0_Data_Out0,reg0_Data_Out2}),
        .Data_B({reg0_Data_Out1,reg0_Data_Out3}),
        .Valid_In(Valid_In),
        .Mode(1'b1),
        .RMode(2'b0),
        .Data_Out({sub1_Data_Out0,sub1_Data_Out1}),
        .Valid_Out()
    );

    wire [31:0] mux1_Data_Out0,mux1_Data_Out1;

    Mux_nbit #(.DATA_WIDHT(32))
        mux1 [1:0] (
            .Data_A({reg0_Data_Out0,reg0_Data_Out2}),
            .Data_B({reg0_Data_Out1,reg0_Data_Out3}),
            .Select({sub1_Data_Out0[31],sub1_Data_Out1[31]}),
            .Data_Out({mux1_Data_Out0,mux1_Data_Out1})
        );

    wire [31:0] reg1_Data_Out0,reg1_Data_Out1,reg1_Data_Out2;

    nbit_Dff #(.DATA_WIDHT(32))
        reg1[2:0] (
            .Data_In({mux1_Data_Out0,mux1_Data_Out1,reg0_Data_Out4}),
            .clk(clk),
            .rst(rst),
            .enable(Valid_In),
            .Data_Out({reg1_Data_Out0,reg1_Data_Out1,reg1_Data_Out2})
        );
    // 3F Pipeline

    wire [31:0] sub2_Data_Out;

    FP_Adder sub2 (
        .Data_A(reg1_Data_Out0),
        .Data_B(reg1_Data_Out1),
        .Valid_In(Valid_In),
        .Mode(1'b1),
        .RMode(2'b0),
        .Data_Out(sub2_Data_Out),
        .Valid_Out()
    );

    wire [31:0] mux2_Data_Out;

    Mux_nbit#(.DATA_WIDHT(32)) 
        mux2 (
            .Data_A(reg1_Data_Out0),
            .Data_B(reg1_Data_Out1),
            .Select(sub2_Data_Out[31]),
            .Data_Out(mux2_Data_Out)
        );
    
    wire [31:0] reg2_Data_Out0,reg2_Data_Out1;

    nbit_Dff #(.DATA_WIDHT(32)) 
        reg2 [1:0] (
            .Data_In({mux2_Data_Out,reg1_Data_Out2}),
            .clk(clk),
            .rst(rst),
            .enable(1'b1),
            .Data_Out({reg2_Data_Out0,reg2_Data_Out1})
        );
    // 4F Pipeline

    wire [31:0] sub3_Data_Out;
    wire sub3_Valid_Out;

    FP_Adder sub3 (
        .Data_A(reg2_Data_Out0),
        .Data_B(reg2_Data_Out1),
        .Valid_In(Valid_In),
        .Mode(1'b1),
        .RMode(2'b0),
        .Data_Out(sub3_Data_Out),
        .Valid_Out(sub3_Valid_Out)
    );
    
    wire [31:0] mux3_Data_Out;

    Mux_nbit #(.DATA_WIDHT(32)) 
        mux3(
            .Data_A(reg2_Data_Out0),
            .Data_B(reg2_Data_Out1),
            .Select(sub3_Data_Out[31]),
            .Data_Out(mux3_Data_Out)
        );

    nbit_Dff #(.DATA_WIDHT(32)) 
        reg3 (
            .Data_In(mux3_Data_Out),
            .clk(clk),
            .rst(rst),
            .enable(1'b1),
            .Data_Out(Data_Out)
        );

endmodule