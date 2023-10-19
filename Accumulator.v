`timescale 1ns / 1ps

module accumulator(clk, rst, ldacc, in, out);
input clk, rst;
input ldacc;
input [7:0] in;
output reg [7:0] out;

always @(negedge clk)
if (rst)    out <= 8'd0;
else if(ldacc)  out <= in;

endmodule
