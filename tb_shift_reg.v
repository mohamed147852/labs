`timescale 1ns/1ps
module tb_shift_reg ;
    reg clk , rst,hold;
    wire [3:0] out;

shift_reg  #(.width (4) ) sr (.*) ;
    
    always #5 clk = ~clk ;
        
    initial begin
        $monitor ("clk=%b   rstn=%b  hold=%b   output=%b   ",clk,rstn,hold,out);
        clk = 0 ;
           rstn = 0;
           hold = 0;
           
           #10;
        rstn = 1;
        #20;
        hold = 1 ;
        #30;
        hold =0 ;
        #20;
        $finish;
        end
    
endmodule
