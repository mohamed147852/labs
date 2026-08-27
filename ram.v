module ram #(
    parameter int data_width = 16,
    parameter int mem_depth      = 512,
    parameter int addr_width = $clog2(mem_depth)
)(
    input       clk,
    input       reset,

    
    input       wr,  // 1 = Write, 0 = Read

    input   [data_width-1:0] wr_data,
    input   [addr_width-1:0] wr_addr,

    input   [addr_width-1:0] rd_addr1,
    input   [addr_width-1:0] rd_addr2,

    output  [data_width-1:0] rd_data1,
    output  [data_width-1:0] rd_data2
);

    reg [data_width-1:0] mem [0:mem_depth-1];
    integer i ;
    
    always f1 @(posedge clk) begin
        if (reset) begin
           for ( i = 0 ; i < mem_depth ; i = i + 1 ) begin
            mem[i] = {data_width,{1'b0}}
           
        end else if (wr ==1'b1) 
            mem[wr_addr] <= wr_data;
        
    end

    assign rd_data1 = (wr ==1'b0) ?  mem[rd_data1] : {data_width {1'bz}};   
    assign rd_data2 = (wr ==1'b0) ?  mem[rd_data2] : {data_width {1'bz}};
    end

endmodule
