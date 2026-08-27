`timescale 1ns/1ps

module tb_ram;

    reg                     clk;
    reg                     reset;
    reg                     wr;
    reg  [DATA_WIDTH-1:0]   wr_data;
    reg  [ADDR_WIDTH-1:0]   wr_addr;
    reg  [ADDR_WIDTH-1:0]   rd_addr1;
    reg  [ADDR_WIDTH-1:0]   rd_addr2;
    wire [DATA_WIDTH-1:0]   rd_data1;
    wire [DATA_WIDTH-1:0]   rd_data2;

    ram rn (
        .clk(clk),
        .reset(reset),
        .wr(wr),
        .wr_data(wr_data),
        .wr_addr(wr_addr),
        .rd_addr1(rd_addr1),
        .rd_addr2(rd_addr2),
        .rd_data1(rd_data1),
        .rd_data2(rd_data2)
       );

     
       always #5 clk = ~clk;

      initial begin
       
       $monitor("rst=%b wr=%b  wr_addr=%0d wr_data=0%h  rd_addr1=%0d rd_data1=0%h  rd_addr2=%0d rd_data2=0%h",
                 reset, wr, wr_addr, wr_data, rd_addr1, rd_data1, rd_addr2, rd_data2);

        clk      = 0;
        reset    = 1;
        wr       = 0;
        wr_data  = 0;
        wr_addr  = 0;
        rd_addr1 = 0;
        rd_addr2 = 0;
       
        #20;
        reset = 0;
       
        wr = 1'b0; 
      
        rd_addr1 = 9'd5;
        rd_addr2 = 9'd10;
        #10;

        rd_addr1 = 9'd20;
        rd_addr2 = 9'd5;
        #10;

        $display("\n--- Testing Reset ---");
        reset = 1;
        #10;
        reset = 0;
        wr = 1'b0;
        rd_addr1 = 9'd5; 
        #10;

        $finish;
    end

endmodule