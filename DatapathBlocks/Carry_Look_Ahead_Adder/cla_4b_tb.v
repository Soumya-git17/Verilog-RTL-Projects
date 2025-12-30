`include "cla_4b.v"
`timescale 1ns/1ns

module cla_4b_tb;
reg [3:0] A,B;
reg Cin;
wire [3:0] S;
wire Cout;

cla_4b UUT(A,B,Cin,S,Cout);

initial begin
    $dumpfile("cla_4b_tb.vcd");  // for waveform
    $dumpvars(0, cla_4b_tb);
    $monitor("A = %d, B = %d, Cin = %b, S = %d, Cout = %b",A,B,Cin,S,Cout);

    Cin = 1'b0; A = 4'b0000; B = 4'b0000; #10;

    Cin = 1'b0; A = 4'b0011; B = 4'b0101; #10;

    Cin = 1'b0; A = 4'b1001; B = 4'b0101; #10;

    Cin = 1'b1; A = 4'b0110; B = 4'b0111; #10;
    
    Cin = 1'b0; A = 4'b1001; B = 4'b1001; #10;

    $finish;
end
endmodule
