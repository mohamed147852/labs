module shift_reg #(parameter width = 4 ) (
    input clk_in,
    input rstn,
    input hold,
    output reg [width-1:0] sh_out,
    output [width-1:0] led
);
    always @ (posedge clk_in , negedge rstn) begin
        if (!rstn) begin
            sh_out <= 4'b1000;
        end else if (hold == 1'b0 ) begin
            sh_out <= {sh_out[0],sh_out[width-1:1]};
        end else begin
            sh_out <= sh_out ;
        end
    end
    assign led = ~sh_out ;
endmodule
