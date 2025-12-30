module min_max(
    input [3:0] A,B,
    output A_less_B, A_great_B, A_equal_B
);

assign A_equal_B = (A==B)?1'b1:1'b0;
assign A_less_B = (A<B)?1'b1:1'b0;
assign A_great_B = (A>B)?1'b1:1'b0;

endmodule