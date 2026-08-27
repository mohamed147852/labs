module topmod_7seg #(parameter width = 4)(
  input clk,rstn,en,up,
  input [width-1:0] count,  
  output [width+2:0] S
   );
  wire clk_out;
    clk_div clkd (clk,rstn,clk_out);
       up_down_counter udc (clk_out,rstn,en,up,count);
            G2B2S b2s(count,S);

endmodule
