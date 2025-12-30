module LFSR(
    input clk, reset,
    output reg [7:0] lfsr_out
);

wire feedback;

// Let the polynomial is x^8 + x^6 + x^5 + x^4 + 1
assign feedback = lfsr_out[7] ^ lfsr_out[5] ^ lfsr_out[4] ^ lfsr_out[3];

always @(posedge clk or posedge reset) begin
    if (reset) lfsr_out <= 8'b1;
    else lfsr_out <= {lfsr_out[6:0], feedback};
end

endmodule