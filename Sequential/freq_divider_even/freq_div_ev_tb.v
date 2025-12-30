`timescale 1ns/1ns
`include "freq_div_ev.v"

module freq_div_ev_tb;
reg clk, reset;
wire clk_by4;

freq_div_ev DUT (clk, reset, clk_by4);

initial begin
    clk= 1'b0;
    forever #10 clk= ~clk;
end
initial begin
    $dumpfile("freq_div_ev.vcd");
    $dumpvars(0,freq_div_ev_tb);
    reset= 1'b1;
    #20
    reset= 1'b0;
    #220 $finish;
end
endmodule