`timescale 1ns/1ps
module tb_up_down_counter;

reg clk;
reg rstn;
reg en;
reg up;

wire [3:0] count;

up_down_conter #(.width(4)) uc (.*);

always #5 clk = ~clk;

initial begin

$monitor(" en=%b  up=%b count=%b" , en, up,count);
    
    clk      = 0;
    rstn     = 0;
    en       = 0;
    up       = 0;

    #10;
    
    rstn = 1;
    #10;
    en = 1;
    up = 1;

    #160;
    up = 0;
    #160;
    en = 0;

    #10;

    $finish;

end

endmodule

