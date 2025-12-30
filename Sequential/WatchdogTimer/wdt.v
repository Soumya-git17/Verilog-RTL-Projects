module wdt(
    input clock,reset,kick,
    output reg wdt_reset
);
reg [5:0] counter;
localparam PERIOD = 30;

always @(posedge clock or negedge reset) begin
    if(~reset) begin
        counter <= PERIOD;
        wdt_reset <= 0;
    end
    else begin
        if (kick) begin
            counter <= PERIOD;
            wdt_reset <= 0;
        end else if (counter > 0) begin
            counter--;
        end else begin
            wdt_reset <= 1;
        end
    end
end
endmodule

/*Watchdog Timer Logic
1. Initialization
On reset, the watchdog counter is loaded with a fixed value (TIMEOUT).
This value represents how many clock cycles the system has before the WDT expires.
2. Counting Down
On every clock edge (posedge clk), the counter decrements by 1 if it is enabled.
This is like a ticking countdown timer.
3. Kick (Feed the Dog)
The processor or main logic must periodically assert the kick signal.
When kick = 1:
The counter reloads back to the full TIMEOUT value.
This prevents the watchdog from expiring.
If the system is healthy, it should always provide kicks before the counter runs out.
4. Timeout Detection
If the counter reaches 0 and no kick occurred → the watchdog times out.
When timeout happens, the wdt_reset signal goes HIGH.
This can be connected to:
Reset the CPU/system.
Trigger a fail-safe mechanism.
5. Cycle Repeats
After a timeout, system resets → counter reloads → counting begins again.

⚡ Logical Flow (Step-by-step)
Reset signal → counter = TIMEOUT.
Clock ticks → counter = counter − 1.
If kick occurs before timeout → counter = TIMEOUT again.
If no kick and counter = 0 → wdt_reset = 1.
System responds (usually resets).*/