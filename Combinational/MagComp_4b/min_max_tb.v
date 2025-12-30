`include "min_max.v"
`timescale 1ns/1ns

module min_max_tb;
reg [3:0] A,B;
wire A_less_B, A_great_B, A_equal_B;

min_max UUT(
    .A(A),.B(B),.A_less_B(A_less_B), .A_great_B(A_great_B), .A_equal_B(A_equal_B)
);

initial begin
    $dumpfile("min_max_tb.vcd");  // for waveform
    $dumpvars(0, min_max_tb);
    $monitor("A = %d, B = %d, A_equal_B = %b, A_great_B = %b, A_less_B = %b",A,B,A_equal_B,A_great_B,A_less_B);

    repeat(10) begin
        A = $random %16;
        B = $random %16;
        #10;
    end
    $finish;
end

endmodule
