`timescale 1ns/1ns
`include "IC_74148.v"

module IC_74148_tb;
reg [7:0] D;
reg En;
wire [2:0] A;
wire GS, EnOut;

IC_74148 uut (D, En, A, EnOut, GS);

initial begin
    $dumpfile("IC_74148.vcd");
    $dumpvars(0, IC_74148_tb);

    En = 0;   // enable active low

    // No input active
    D = 8'b11111111; #10;   // expect A=111, GS=1, EnOut=1

    // D0 active (lowest priority)
    D = 8'b11111110; #10;   // expect A=000, GS=0, EnOut=0

    // D1 active
    D = 8'b11111101; #10;   // expect A=001, GS=0, EnOut=0

    // D2 active
    D = 8'b11111011; #10;   // expect A=010, GS=0, EnOut=0

    // D3 active
    D = 8'b11110111; #10;   // expect A=011, GS=0, EnOut=0

    // D4 active
    D = 8'b11101111; #10;   // expect A=100, GS=0, EnOut=0

    // D5 active
    D = 8'b11011111; #10;   // expect A=101, GS=0, EnOut=0

    // D6 active
    D = 8'b10111111; #10;   // expect A=110, GS=0, EnOut=0

    // D7 active (highest priority)
    D = 8'b01111111; #10;   // expect A=111, GS=0, EnOut=0

    // Multiple inputs low (priority check)
    D = 8'b10111110; #10;   // D6 & D0 both active → D6 wins → A=110

    // Disable encoder
    En = 1; D = 8'b00000000; #10; // expect A=111, GS=1, EnOut=1

    $finish;
end

initial begin
    $monitor("time=%0t, D=%b, En=%b -> A=%b, GS=%b, EnOut=%b",
             $time, D, En, A, GS, EnOut);
end
endmodule
