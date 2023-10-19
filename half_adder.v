`timescale 1ns / 1ps

module half_adder(start, a, b, sum, cout);
input start;
input a, b;
output sum, cout;

assign sum = start  & (a^b);   
assign cout = start & a&b;
endmodule
