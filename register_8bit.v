`timescale 1ns / 1ps

module register_8bit(clk, rst, ld, in, out);
input ld;
input clk, rst;
input [7:0] in;
output reg [7:0] out;

always @(posedge clk)
if(rst)     out <= 8'd0;
else if (ld) out <= in;
endmodule
