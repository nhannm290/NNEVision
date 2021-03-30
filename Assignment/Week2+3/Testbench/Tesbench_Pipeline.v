`timescale 1ns/1ps
module Tesbench_Pipeline (
);
    reg START,CLK,CLEAR;
    reg [23:0] RGB;
    wire [7:0] GRAY;
    wire DONE;

    integer Output_File,Input_File;
    integer i,Check;
    integer COUNT=0;

    initial begin
	
        Output_File = $fopen("/home/joenguyen/Desktop/RBG_GRAY/RGB_Convert2_Gray/bitmap.out", "w");
	    Input_File =  $fopen("/home/joenguyen/Desktop/RBG_GRAY/RGB_Convert2_Gray/bitmap.in", "r");
    
        CLK = 0;
        CLEAR = 0;
        START = 0;
        while (! $feof(Input_File)) begin 
            #16
            CLEAR = 1'b1;
            START = 1'b1;
            Check=$fscanf(Input_File,"%h\n", RGB);    
            #16
            START = 0;
	    #16;
            for(i = 32'd1;i <32'd20; i = i +1'd1) begin
                #16;               
            end
            if (COUNT !=1'd0) begin
                $fdisplay(Output_File, "%h", GRAY);
            end
            COUNT= COUNT+1'd1;
            CLEAR = 0;	
        end
	
        $finish;
        
    end

    always #8 CLK = ~CLK;
    RGB_2_GRAY DUT (
        .DONE(DONE),
        .GRAY(GRAY),
        .RGB(RGB),
        .START(START),
        .CLK(CLK),
        .CLEAR(CLEAR)
    );
endmodule
