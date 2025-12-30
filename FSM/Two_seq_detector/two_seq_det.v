module two_seq_det(
    input clk, reset,
    input din,
    output reg detected_0110, detected_0111
);
localparam   IDLE = 3'b000,
               S0 = 3'b001,
              S01 = 3'b010,
             S011 = 3'b011;

reg [2:0] current_state, next_state;

always @(posedge clk or posedge reset) begin
    if (reset) current_state <= IDLE;
    else current_state <= next_state;
end

always @(*) begin
    next_state = current_state;
    detected_0110 = 1'b0;
    detected_0111 = 1'b0;
    case(current_state)
        IDLE: if (din == 1'b0) next_state = S0;
            else next_state  = IDLE;
        S0: if (din == 1'b1) next_state = S01;
            else next_state = S0;
        S01: if (din == 1'b1) next_state = S011;
            else next_state = S0;
        S011: if (din == 1'b1) begin
            next_state = IDLE;
            detected_0111 = 1;
        end
        else begin
            next_state = S0;
            detected_0110 = 1;
        end
    endcase 
end

endmodule