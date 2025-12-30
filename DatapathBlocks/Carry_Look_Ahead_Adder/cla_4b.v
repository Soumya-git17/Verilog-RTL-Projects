module cla_4b(
    input [3:0] A,B,
    input Cin,
    output [3:0] S,
    output Cout
);
wire [3:0] C,G,P;

assign P[3:0] = A[3:0] ^ B[3:0];
assign G[3:0] = A[3:0] & B[3:0];
assign C[0] = Cin;
assign C[1] = G[0]|(P[0]&C[0]);
assign C[2] = G[1]|(P[1]&C[1]);
assign C[3] = G[2]|(P[2]&C[2]);
assign Cout = G[3]|(P[3]&C[3]);
assign S[3:0] = A[3:0] ^ B[3:0] ^ C[3:0];

endmodule