module bcd_7seg(
    input [3:0] bcd,
    output [6:0] s
);
assign {a,b,c,d} = bcd;
assign s[0] =  a |  c | (~(b ^ d));
assign s[1] = ~b | ~(c ^ d);
assign s[2] =  b |  (~c) | d;
assign s[3] =  a |  (c & ~d) | b ^ (c | ~d);
assign s[4] = ~d &  (~b | c);
assign s[5] =  a | ~(c & d) | b & (~c | ~d);
assign s[6] =  a |  (c & ~d) | (b ^ c);
endmodule