`timescale 1ns/1ns
`include "mod_n_counter.v"

module mod_n_counter_tb;
reg clk;
reg reset;
wire [3:0] q;
mod_n_counter #(10) DUT (.clk(clk), .reset(reset), .q(q));

initial begin
    clk = 0;
    forever #5 clk = ~ clk;
end

initial begin
    reset = 1;       
    #10 reset = 0;   

    #100;            
    reset = 1;       
    #10 reset = 0;

    #50 $finish;
end
initial begin
    $monitor("Time = %0t | Reset = %b | Count = %d", $time, reset, q);
end

endmodule