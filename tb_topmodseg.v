`timescale 1ns/1ps

module tb_topmod_7seg;

    reg clk;
    reg rstn;
    reg en;
    reg up;
    wire [6:0] S;

    topmod_7seg dut (clk ,rstn ,en ,up,S );
    
    always #5 clk = ~clk;

    initial begin

     
        clk  = 0;
        rstn = 1;
        en   = 0;
        up   = 1;
        #20;
        rstn = 0;
        en = 1;
        #200;
        up = 0;
        #200;
        en = 0;
        #50;
        up = 1;
        en = 1;
        #200;

        $stop;
    end

endmodule