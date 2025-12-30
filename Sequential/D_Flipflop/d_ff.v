module d_ff(
    input D,clk,reset,
    output reg Q
);
always @(posedge clk) begin
    if(reset) Q<= 1'b0;
    else begin
        Q = D;
    end
end
endmodule