module up_down_counter #(parameter width = 4)(
    input       clk,
    input       rstn,
    input       en,
    input       up,
    output reg [width-1:0] count
);

  always @(posedge clk or negedge rstn) begin

    if (!rstn) begin   
      count <= 4'b0000;
    end 
    else if (en) begin
      if (up)
            count <= count + 1'b1;
        else 
            count <= count - 1'b1;
    end  
end
endmodule

