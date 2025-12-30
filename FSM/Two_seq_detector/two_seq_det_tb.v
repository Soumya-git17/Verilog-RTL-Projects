`timescale 1ns/1ns
`include "two_seq_det.v"

module two_seq_det_tb;
    reg clk, reset, din;
    wire detected_0110, detected_0111;
    two_seq_det DUT (.clk(clk), .reset(reset), .din(din), .detected_0110(detected_0110), .detected_0111(detected_0111));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("two_seq_det.vcd");
        $dumpvars(0, two_seq_det_tb);

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

endmodule
