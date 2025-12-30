module BarrelShifter(
    input [7:0] data_in,
    input [2:0] shift,
    input dir, // 1 for left rotate, 0 for right rotate
    output reg [7:0] data_out
);
always @(*) begin
    if (dir)
        data_out = (data_in << shift) | (data_in >> (8 - shift));
    else
        data_out = (data_in >> shift) | (data_in << (8 - shift));
end
endmodule