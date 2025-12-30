module IC_74148(
    input  [7:0] D,   // active low inputs, D7 highest priority
    input  En,        // active low enable
    output reg [2:0] A,      // encoded output
    output reg EnOut, GS     // active low outputs
);

always @(*) begin
    if (~En) begin  // chip enabled
        casex(D)
            8'b01111111: begin A = 3'b111; GS=0; EnOut=0; end // D7=0 highest priority
            8'b10111111: begin A = 3'b110; GS=0; EnOut=0; end // D6=0
            8'b11011111: begin A = 3'b101; GS=0; EnOut=0; end // D5=0
            8'b11101111: begin A = 3'b100; GS=0; EnOut=0; end // D4=0
            8'b11110111: begin A = 3'b011; GS=0; EnOut=0; end // D3=0
            8'b11111011: begin A = 3'b010; GS=0; EnOut=0; end // D2=0
            8'b11111101: begin A = 3'b001; GS=0; EnOut=0; end // D1=0
            8'b11111110: begin A = 3'b000; GS=0; EnOut=0; end // D0=0 lowest priority
            default:     begin A = 3'b111; GS=1; EnOut=1; end // no inputs active
        endcase
    end 
    else begin        // Disabled: all outputs inactive
        A = 3'b111; GS=1; EnOut=1;
    end
end
endmodule
