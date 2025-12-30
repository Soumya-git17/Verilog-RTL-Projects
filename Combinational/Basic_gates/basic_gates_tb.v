`timescale 1ns/1ns
`include "basic_gates.v"

module basic_gates_tb;

reg A, B;
wire out_and, out_or, out_nand, out_nor, out_xor, out_xnor;

basic_gates DUT(A, B, out_and, out_or, out_nand, out_nor, out_xor, out_xnor);

initial begin
    $dumpfile("basic_gates.vcd");
    $dumpvars(0, basic_gates_tb);
    A = 1'b0; B = 1'b0; #10;
    A = 1'b0; B = 1'b1; #10;
    A = 1'b1; B = 1'b0; #10;
    A = 1'b1; B = 1'b1; #10;
    $display("Test Complete");
end
endmodule