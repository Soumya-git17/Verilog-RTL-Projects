`timescale 1ns/1ns
`include "bm.v"
module bm_tb;
reg signed [3:0] M,Q;
wire signed [7:0] R;
bm DUT (Q,M,R);

initial begin
    Q=  3; M=  7; #10;
    Q=  3; M= -7; #10;
    Q= -3; M= -7; #10;
    Q=  5; M=  6; #10;
    Q=  5; M= -6; #10;
    Q= -5; M= -6; #10;
end

initial begin
    $monitor("%d * %d = %d", Q,M,R);
    #60 $finish;
end
endmodule