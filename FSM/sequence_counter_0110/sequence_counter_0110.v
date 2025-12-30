module sequence_counter_0110(
    input clk, reset, din,
    output reg dout
);
// State encoding as parameters
localparam  S0 = 3'b000, // Initial state
            S1 = 3'b001, // Detected '0'
            S2 = 3'b010, // Detected '01'
            S3 = 3'b011, // Detected '011'
            S4 = 3'b100; // Detected '0110'

reg [2:0] current_state, next_state;

always @(posedge clk or posedge reset) begin
    if (reset)
        current_state <= S0; // Reset to initial state
    else
        current_state <= next_state;
end
always @(*) begin
    next_state = current_state;
    dout = 1'b0;
    case (current_state)
        S0: if (din == 1'b0) next_state = S1; // Transition to S1 on '0'
        S1: if (din == 1'b1) next_state = S2; // Transition to S2 on '1'
            else next_state = S1;            // Stay in S1 on '0'
        S2: if (din == 1'b1) next_state = S3; // Transition to S3 on '1'
            else next_state = S0;            // Back to S0 on '0'
        S3: if (din == 1'b0) next_state = S4; // Transition to S4 on '0'
            else next_state = S2;            // Back to S2 on '1'
        S4: begin
            dout = 1'b1;                 // Sequence detected
            if (din == 1'b0) next_state = S1; // Allow overlapping detection
            else next_state = S2;
        end
        default: next_state = S0;            // Default state
    endcase
end
endmodule

