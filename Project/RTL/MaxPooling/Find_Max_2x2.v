module Find_Max_2x2 #(parameter DATA_WIDHT =32)(
    input [DATA_WIDHT-1:0] Data_A,
    input [DATA_WIDHT-1:0] Data_B,
    input [DATA_WIDHT-1:0] Data_C,
    input [DATA_WIDHT-1:0] Data_D,
    input Valid_In,
    input clk,
    input rst,
    output [DATA_WIDHT-1:0] Data_Out,
    output Valid_Out
    );
    
    reg [31:0] Counter_Valid_Out=0;
    wire [31:0] sub1_Data_Out,sub2_Data_Out,mux1_Data_Out,mux2_Data_Out,sub3_Data_Out;//,reg_Out_Data_Out;
    wire [31:0] mux3_Data_Out; 
    reg [31:0] Counter =0;
    
    
    assign Valid_Out= (Counter ==3 && Valid_In ==1)? 1'd1:1'd0;
    always @(posedge clk or negedge rst) begin
        if(~rst) begin 
            Counter <=0;
        end
        else if (Valid_In ==1 && Counter !=3) Counter <= Counter +1'd1;
        else if (Valid_In ==1 && Counter ==3) Counter <= Counter;
        else if (Valid_In == 0 && Counter ==3) Counter <=0;
    end   
    FP_Adder sub1(
        .Data_A(Data_A),
        .Data_B(Data_B),
        .Valid_In(Valid_In),
        .Mode(1'b1),
        .RMode(2'b0),
        .Data_Out(sub1_Data_Out),
        .Valid_Out()
    );
    wire [31:0] reg_0_Data_Out;  
    Mux_nbit#(.DATA_WIDHT(32))
        mux1(
            .Data_A(Data_A),
            .Data_B(Data_B),
            .Select(sub1_Data_Out[31]),
            .Data_Out(mux1_Data_Out)
        );  
    nbit_Dff #(.DATA_WIDHT(32))
        reg_0(
            .Data_In(mux1_Data_Out),
            .clk(clk),
            .rst(rst),
            .enable(1'b1),
            .Data_Out(reg_0_Data_Out)
        );
          
    FP_Adder sub2(
        .Data_A(Data_C),
        .Data_B(Data_D),
        .Valid_In(Valid_In),
        .Mode(1'b1),
        .RMode(2'b0),
        .Data_Out(sub2_Data_Out),
        .Valid_Out()
    );
    wire [31:0] reg_1_Data_Out;
    Mux_nbit#(.DATA_WIDHT(32))
        mux2(
            .Data_A(Data_C),
            .Data_B(Data_D),
            .Select(sub2_Data_Out[31]),
            .Data_Out(mux2_Data_Out)
        );
    nbit_Dff #(.DATA_WIDHT(32))
        reg_1(
            .Data_In(mux2_Data_Out),
            .clk(clk),
            .rst(rst),
            .enable(1'b1),
            .Data_Out(reg_1_Data_Out)
        );   

    FP_Adder sub3(
        .Data_A(reg_0_Data_Out),
        .Data_B(reg_1_Data_Out),
        .Valid_In(Valid_In),
        .Mode(1'b1),
        .RMode(2'b0),
        .Data_Out(sub3_Data_Out),
        .Valid_Out()
    );  
     
    Mux_nbit#(.DATA_WIDHT(32))
        mux3(
            .Data_A(reg_0_Data_Out),
            .Data_B(reg_1_Data_Out),
            .Select(sub3_Data_Out[31]),
            .Data_Out(mux3_Data_Out)
        );
    nbit_Dff #(.DATA_WIDHT(32))
        reg_Out(
            .Data_In(mux3_Data_Out),
            .clk(clk),
            .rst(rst),
            .enable(1'b1),
            .Data_Out(Data_Out)
        );
    
endmodule