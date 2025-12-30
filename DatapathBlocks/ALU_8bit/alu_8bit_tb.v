`timescale 1ns / 1ns
`include "alu_8bit.v"

module alu_8bit_tb;
    reg [7:0] A, B;
    reg [3:0] opcode;
    wire [7:0] result;
    wire carry, zero, overflow, sign;

    alu_8bit uut (
        .A(A), .B(B), .opcode(opcode), .result(result), .carry(carry), .zero(zero),
        .overflow(overflow), .sign(sign)
    );

    task display_results;
        input [7:0] A, B;
        input [3:0] opcode;
        input [7:0] expected_result;
        input expected_carry, expected_zero, expected_overflow, expected_sign;
        begin
            $display("A=%b, B=%b, Opcode=%b | Result=%b, Carry=%b, Zero=%b, Overflow=%b, Sign=%b",
                     A, B, opcode, result, carry, zero, overflow, sign);

            if (result !== expected_result) 
                $display("Expected Result=%b", expected_result);
            if (carry !== expected_carry) 
                $display("Expected Carry=%b", expected_carry);
            if (zero !== expected_zero) 
                $display("Expected Zero=%b", expected_zero);
            if (overflow !== expected_overflow) 
                $display("Expected Overflow=%b", expected_overflow);
            if (sign !== expected_sign) 
                $display("Expected Sign=%b", expected_sign);
        end
    endtask

    initial begin
        $display("\n--- ADD ---");
        A=8'b00001111; B=8'b00000001; opcode=4'b0000; #10
        display_results(A,B,opcode,8'b00010000,0,0,0,0);

        A=8'b01111111; B=8'b00000001; opcode=4'b0000; #10
        display_results(A,B,opcode,8'b10000000,0,0,1,1);

        $display("\n--- SUB ---");
        A=8'b00001000; B=8'b00000100; opcode=4'b0001; #10
        display_results(A,B,opcode,8'b00000100,0,0,0,0);

        A=8'b00000000; B=8'b00000001; opcode=4'b0001; #10
        display_results(A,B,opcode,8'b11111111,1,0,0,1);

        $display("\n--- LOGIC ---");
        A=8'b11001100; B=8'b10101010; opcode=4'b0010; #10
        display_results(A,B,opcode,8'b10001000,0,0,0,1);

        A=8'b11001100; B=8'b10101010; opcode=4'b0011; #10
        display_results(A,B,opcode,8'b11101110,0,0,0,1);

        $display("\n--- MUL / DIV ---");
        A=8'b00001000; B=8'b00000010; opcode=4'b1101; #10
        display_results(A,B,opcode,8'b00010000,0,0,0,0);

        A=8'b00001000; B=8'b00000010; opcode=4'b1110; #10
        display_results(A,B,opcode,8'b00000100,0,0,0,0);

        A=8'b00001000; B=8'b00000000; opcode=4'b1110; #10
        display_results(A,B,opcode,8'b11111111,1,0,0,1);

        $finish;
    end
endmodule
