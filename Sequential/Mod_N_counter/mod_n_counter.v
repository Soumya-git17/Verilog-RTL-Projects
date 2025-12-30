module mod_n_counter #(parameter n = 10)(
    input clk,
    input reset,
    output reg [$clog2(n)-1:0] q    // Dynamically calculate bit length (cylling of log base 2 of n)
);

always @(posedge clk or posedge reset) begin
    if (reset) q <= 0;
    else if (q == n-1) q <= 0;
    else q <= q + 1;
end

endmodule