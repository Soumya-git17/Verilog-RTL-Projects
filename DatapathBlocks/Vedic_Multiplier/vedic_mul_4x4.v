module vedic_mul_4x4(
    input [3:0] a,b,
    output [7:0] out
);
wire [3:0] w1,w2,w3,w4,w5,w6;
wire c0,c1,c2,c,s;

vedic_mul_2x2 m1(b[1:0],a[1:0],w1);
vedic_mul_2x2 m2(b[3:2],a[1:0],w2);
vedic_mul_2x2 m3(b[1:0],a[3:2],w3);
vedic_mul_2x2 m4(b[3:2],a[3:2],w4);

adder_4b m5(w2,w3,w5,c1);
adder_4b m6(w5,{2'b00,w1[3:2]},w6,c2);
half_adder m7(c1,c2,s,c);
adder_4b m8(w4,{c,s,w6[3:2]},out[7:4],c0);

assign out[1:0] = w1[1:0];
assign out[3:2] = w6[1:0];

endmodule