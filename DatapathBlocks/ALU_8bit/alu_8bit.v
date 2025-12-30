module alu_8bit(
    input wire [7:0] A,
    input wire [7:0] B,
    input wire [3:0] opcode,
    output reg [7:0] result,
    output reg carry,
    output reg zero,
    output reg overflow,
    output reg sign
);

reg [15:0] temp;

localparam ADD = 4'b0000;
localparam SUB = 4'b0001;
localparam AND = 4'b0010;
localparam OR  = 4'b0011;
localparam XOR = 4'b0100;
localparam NOT = 4'b0101;
localparam LSH = 4'b0110;
localparam RSH = 4'b0111;
localparam LT  = 4'b1000;
localparam GT  = 4'b1001;
localparam EQ  = 4'b1010;
localparam INC = 4'b1011;
localparam DEC = 4'b1100;
localparam MUL = 4'b1101;
localparam DIV = 4'b1110;

always @(*) begin
    carry = 0;
    overflow = 0;
    zero = 0;
    sign = 0;

    case (opcode)
        ADD: begin
            temp = A + B;
            result = temp[7:0];
            carry = temp[8];
            overflow = (A[7] & B[7] & ~result[7]) | (~A[7] & ~B[7] & result[7]);
        end
        SUB: begin 
            temp = A - B;
            result = temp[7:0];
            carry = (A<B);
            overflow = (A[7] ^ B[7]) & (A[7] ^ result[7]);
        end
        AND: result = A & B;
        OR:  result = A | B;
        XOR: result = A ^ B;
        NOT: result = ~A;
        LSH: result = A << 1;
        RSH: result = A >> 1;
        LT:  result = {7'b0000000,(A < B)};
        GT:  result = {7'b0000000,(A > B)};
        EQ:  result = {7'b0000000,(A == B)};
        INC: begin
            temp = A + 1;
            result = temp[7:0];
            carry = temp[8];
        end
        DEC: begin
            temp = A - 1;
            result = temp[7:0];
            carry = (A == 0);
        end
        MUL: begin
            temp = A * B;
            result = temp[7:0];
            carry = temp[15:8] != 0;
            overflow = temp[15:8] != 0;
        end
        DIV: begin
            if (B != 0) begin
                result = A / B;
                carry = 0;
            end else begin
                result = 8'hFF;
                carry = 1;
            end
        end
        default: result = 8'b00000000;
    endcase

    zero = (result == 8'b00000000);
    sign = result[7];
end
endmodule