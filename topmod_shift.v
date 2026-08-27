module topmod_shift (
    input clk_in,rstn,hold,
    output wire[3:0] sh_out ,led 
);

wire clk_out ;
    clk_div cd (
    .clk_in(clk_in),
    .rstn(rstn),
    .clk_out(clk_out)
    );
      
      shift_reg sr (
        .clk_in(clk_out),
        .rstn(rstn),
        .hold(hold),
        .sh_out(sh_out),
        .led (led)
      );
    
endmodule
