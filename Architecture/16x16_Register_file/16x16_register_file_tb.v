`timescale 1ns/1ns
`include "16x16_register_file.v"

module register_file_16x16_tb;
reg clk;
reg we;
reg [3:0] waddr;
reg [15:0] wdata;
reg [3:0] raddr1;
reg [3:0] raddr2;
wire [15:0] rdata1;
wire [15:0] rdata2;

register_file_16x16 dut (.clk(clk), .we(we), .waddr(waddr), .wdata(wdata), .raddr1(raddr1), .raddr2(raddr2), .rdata1(rdata1), .rdata2(rdata2));

always #5 clk = ~clk;

initial begin
    clk = 0;
    we = 0;
    raddr1 = 4'b0000;
    raddr2 = 4'b0001;
    waddr = 4'b0000;
    wdata = 16'h0000;

    // Write data to register 0
    #10 we = 1; waddr = 4'b0000; wdata = 16'hAAAA;
    #10 we = 0; // Disable write

    // Write data to register 1
    #10 we = 1; waddr = 4'b0001; wdata = 16'h5555;
    #10 we = 0;

    // Read data from register 0 and register 1
    #10 raddr1 = 4'b0000;
    raddr2 = 4'b0001;

    // Write data to register 2
    #10 we = 1; waddr = 4'b0010; wdata = 16'hF0F0;
    #10 we = 0;

    // Read data from register 0 and register 2
    #10 raddr1 = 4'b0000;
    raddr2 = 4'b0010;

    #20 $finish;
end

initial begin
    $monitor("Time = %0d, we = %b, write_addr = %b, write_data = %h, raddr1 = %b, read_data1 = %h, read_addr2 = %b, read_data2 = %h", 
                $time, we, waddr, wdata, raddr1, rdata1, raddr2, rdata2);
end

endmodule