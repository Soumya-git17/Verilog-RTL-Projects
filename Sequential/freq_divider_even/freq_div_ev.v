module freq_div_ev(
    input clk, reset,
    output clk_by4
);
wire clk_by2;

d_ff d1(.D(~clk_by4), .clk(clk), .reset(reset), .Q(clk_by2));
d_ff d2(.D(clk_by2), .clk(clk), .reset(reset), .Q(clk_by4));

endmodule

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