`default_nettype none

module clk_div #(parameter num = 6250000)(
    input wire  clk_in,
    input wire  rstn,
    output reg clk_out
);
localparam width = $clog2(num);
reg [width-1:0] counter;

always @(posedge clk_in or negedge rstn)begin
    if (!rstn) begin
        counter <= {width{1'b0}};
        clk_out <=1'b0;
    end else begin
        if (counter <= num-1 )begin
        counter <= 23'd0;
                clk_out <= ~clk_out;
            end else begin
                counter <= counter + 1'b1;
            end
        end
    end
endmodule

