`timescale 1ns / 1ps

module tb_clkdiv;

reg clk_in ;
reg rstn ;
wire clk_out ;

clk_div cd (.*);

always #10 clk_in = ~clk_in ;

initial
begin
    
    $monitor(" clk_in = %b  rst = %b  clk_out = %b",
              clk_in, rstn, clk_out);
    clk_in = 1'b0 ;
    rstn = 1'b0 ;

    #20;
    rstn = 1'b1 ;
     repeat (300000000) @(negedge clk_out);
    
    $stop ;
end

endmodule
