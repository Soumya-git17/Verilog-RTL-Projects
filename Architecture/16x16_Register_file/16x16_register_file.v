module register_file_16x16 (
    input clk,
    input we,   //writeEnable
    input [3:0] waddr,
    input [15:0] wdata,
    input [3:0] raddr1,
    input [3:0] raddr2,
    output [15:0] rdata1,
    output [15:0] rdata2
);

reg [15:0] reg_file [15:0];     // 16 registers each 16 bit wide

//Read
assign rdata1 = reg_file[raddr1];
assign rdata2 = reg_file[raddr2];

//Write
always @(posedge clk) begin
    if (we) begin
        reg_file[waddr] <= wdata;
    end
end

endmodule