module Testbench (
);
    reg [23:0] Data_In;
    reg CLK,Clear,Controll_Out;
    wire [7:0] Data_Out;
    integer Count_CLK=32'd1;
    integer Output_File,Input_File; 
    initial begin
        Output_File = $fopen("bitmap.out", "w");
        Input_File = $fopen("bitmap.in", "w");
        CLK = 0;
        Clear = 0;
        Controll_Out = 0;
        #25
        Clear = 1'b1;
        while (! $feof(infile)) begin
            $fscanf(Input_File,"%h\n", Data_In);

            while (Count_CLK < 32'd19) begin
            if (Count_CLK ==32'd18) begin
                Controll_Out = 1;
                end
                #50 Count_CLK = Count_CLK +1'b1;
            end
            $fdisplay(Output_File, "%h", Data_Out);
            Count_CLK = 32'd1;
        end
        $fclose(Output_File);
        $finish;
        
    end
    always #25 CLK <= ~CLK;

    RGB_Datapath DUT (
        .Data_Out(Data_Out),
        .Data_In(Data_In),
        .CLK(CLK),
        .Clear(Clear),
        .Controll_Out(Controll_Out)
    );
endmodule
