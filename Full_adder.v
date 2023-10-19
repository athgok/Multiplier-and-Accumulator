`timescale 1ns / 1ps

module Full_adder(start, a, b, cin, sum, cout);
input start;
input a, b, cin;
output sum, cout;

wire x, y, z;
half_adder ha1(start, a, b, x, y);
half_adder ha2(start, cin, x, sum, z);
assign cout = start & (y|z);

endmodule
