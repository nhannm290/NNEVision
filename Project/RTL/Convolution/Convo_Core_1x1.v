module Convo_Core_1x1 (
    input [31:0] Data_In,
    input [31:0] Kernel,
    input Valid_In,
    output [31:0] Data_Out,
    output Valid_Out
);
    // Controler
    // Datapath

    FP_Mul mul (
        .data_iA(Data_In),
        .data_iB(Kernel),
        .Valid_In(Valid_In),
        .data_o(Data_Out),
        .Valid_Out(Valid_Out)
    );
endmodule