module basic_gates(A, B, out_and, out_or, out_nand, out_nor, out_xor, out_xnor);

input A, B;
output out_and, out_or, out_nand, out_nor, out_xor, out_xnor;

assign out_and = A & B;
assign out_or = A | B;
assign out_nand = ~(A & B);
assign out_nor = ~(A | B);
assign out_xor = (A & ~(B)) | (~(A) & B); // A^B
assign out_xnor = (A & B) | (~(A) & ~(B)); // ~(A^B)    

endmodule