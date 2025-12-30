`timescale 1ns/1ns
`include "wdt.v"

module wdt_tb;
reg clock, reset, kick;
wire wdt_reset;
wdt WDT(clock, reset, kick, wdt_reset);

initial begin
    clock = 0;
    forever #5 clock = ~clock; //10ns clock period
end
initial begin
    $dumpfile("wdt_tb.vcd");
    $dumpvars(0,wdt_tb);
    reset = 0;
    kick = 0;
    #10; reset=1;
    #10;
    // Let the counter run without kick to see timeout
    kick = 0;
    $display("Waiting for timeout...");
    #400;  // enough time for counter to reach 0
    // Now feed the watchdog (kick) before timeout
    $display("Feeding the watchdog...");
    kick = 1;
    #10 kick = 0;
    // Let it run again without kick
    #400;
    $finish; 
end
endmodule