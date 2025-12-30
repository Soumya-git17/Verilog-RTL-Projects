`timescale 1ns/1ns
`include "sequence_counter_0110.v"

module sequence_counter_0110_tb;
    reg clk, reset, din;
    wire dout;
    sequence_counter_0110 DUT (.clk(clk), .reset(reset), .din(din), .dout(dout));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("sequence_counter_0110.vcd");
        $dumpvars(0, sequence_counter_0110_tb);

        reset = 1;
        din = 0;

        @(posedge clk);
        reset = 0;

        // Sequence: 0110
        @(posedge clk) din = 0;  
        @(posedge clk) din = 1;  
        @(posedge clk) din = 1;  
        @(posedge clk) din = 0;  // <-- here dout will become 1

        @(posedge clk) din = 0;
        @(posedge clk) din = 0;
        @(posedge clk) din = 1;
        @(posedge clk) din = 1;
        @(posedge clk) din = 1;
        @(posedge clk) din = 0;

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | din=%b | dout=%b", $time, din, dout);
    end

endmodule
