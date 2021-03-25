`timescale 1ns/1ps
module Tesbench_Pipeline (
);
    reg START,CLK,CLEAR;
    reg [23:0] RGB;
    wire [7:0] GRAY;
    wire DONE;

    integer Output_File,Input_File;
    integer i;
    integer COUNT=0;

    initial begin

        Output_File = $fopen("bitmap.out", "w");
        Input_File = $fopen("binmap.in", "r");

        CLK = 0;
        CLEAR = 0;
        START = 1;
        while (! $feof(Input_File)) begin     
            #40
            CLEAR = 1;
            $fscanf(Input_File,"%h\n", RGB);
            for(i = 32'd0;i <20; i = i +1'd1) begin
                #40;               
            end
            COUNT= COUNT+1'd1;
            $fdisplay(Output_File, "%h", GRAY);
            CLEAR = 0;
        end
        $finish;
        
    end
    always #20 CLK = ~CLK;
    RGB_2_GRAY DUT (
        .DONE(DONE),
        .GRAY(GRAY),
        .RGB(RGB),
        .START(START),
        .CLK(CLK),
        .CLEAR(CLEAR)
    );
endmodule
