`timescale 1ns / 1ns
module vedic_mul_4x4_tb;
reg [3:0] a,b;
wire [7:0] out;

vedic_mul_4x4 DUT(a,b,out);

always begin
    a=$random;
    b=$random;
    #10;
end

initial begin
    $monitor("%d * %d = %d", a,b,out);
    #60 $finish;
end
endmodule