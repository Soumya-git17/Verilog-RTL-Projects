`timescale 1ns/1ns
`include "bcd_7seg.v"
module bcd_7seg_tb;
    reg [3:0] bcd;       
    wire [6:0] s;
    bcd_7seg uut (.bcd(bcd),.s(s));
    initial begin
        $monitor("BCD = %b, 7_seg = %b", bcd, s);
        bcd = 4'b0000; #10;
        bcd = 4'b0001; #10;
        bcd = 4'b0010; #10;
        bcd = 4'b0011; #10;
        bcd = 4'b0100; #10;
        bcd = 4'b0101; #10;
        bcd = 4'b0110; #10;
        bcd = 4'b0111; #10;
        bcd = 4'b1000; #10;
        bcd = 4'b1001; #10;
        bcd = 4'b1010; #10;
        bcd = 4'b1011; #10;
        bcd = 4'b1100; #10;
        bcd = 4'b1101; #10;
        bcd = 4'b1110; #10;
        bcd = 4'b1111; #10;
        
        $finish;
    end
endmodule
