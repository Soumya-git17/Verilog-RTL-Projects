module bm (
    input signed[3:0] M,Q,
    output reg signed [7:0] R
);
reg q0;
integer i;
reg [8:0] temp;
always @(*) begin
    R = {4'b0000,Q};
    q0 = 1'b0;
    temp = 9'b0;
    for(i=0;i<4;i++) begin
        case ({R[0],q0})
            2'b01: R[7:4] = R[7:4] + M;
            2'b10: R[7:4] = R[7:4] - M;
        endcase
        // temp = {R,q0} >> 1;
        // temp[8] = temp[7];
        // R = temp[8:1];
        // q0 = temp[0];
        {R,q0} = {R[7],R,q0} >> 1;
    end
end
endmodule