`timescale 1ns/1ns
`include "LFSR.v"
module LFSR_tb;
reg clk, reset;
wire [7:0] lfsr_out;

LFSR DUT (.clk(clk), .reset(reset), .lfsr_out(lfsr_out));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
  $dumpfile("LFSR.vcd");
  $dumpvars(0, LFSR_tb);
end
initial begin
   reset = 1;
   #7; reset = 0;
   #200;
   $finish;
end
initial begin
    $monitor("Time=%0dns, LFSR_Output=%b",$time, lfsr_out);
end

endmodule