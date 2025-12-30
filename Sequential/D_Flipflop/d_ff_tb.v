`timescale 1ns/1ns
`include "d_ff.v"
module d_ff_tb;
    reg D,clk,reset; 
    wire Q;
    d_ff uut (D,clk,reset,Q);
    initial begin
        clk=0;
        forever begin
            #5; clk =~clk;
        end
    end
    initial begin
        $dumpfile("d_ff_tb.vcd");
        $dumpvars(0,d_ff_tb);
        $monitor("D = %b, Q = %b", D, Q);
        reset = 0; 
        D = 1'd0; #10;
        D = 1'd1; #10;
        reset = 1; 
        D = 1'd0; #10;
        D = 1'd1; #10;
        $finish;
    end
endmodule
