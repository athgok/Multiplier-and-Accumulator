`timescale 1ns / 1ps

// Implementing Addder for adding
module Adder_Module(start2, in1, in2, out);

input [7:0] in1, in2;
input start2;
output [8:0] out;

wire [8:0] z;
wire [6:0] c;

Full_adder fa0(start2, in1[0], in2[0], 0, z[0], c[0]);
Full_adder fa1(start2, in1[1], in2[1], c[0], z[1], c[1]);
Full_adder fa2(start2, in1[2], in2[2], c[1], z[2], c[2]);
Full_adder fa3(start2, in1[3], in2[3], c[2], z[3], c[3]);
Full_adder fa4(start2, in1[4], in2[4], c[3], z[4], c[4]);
Full_adder fa5(start2, in1[5], in2[5], c[4], z[5], c[5]);
Full_adder fa6(start2, in1[6], in2[6], c[5], z[6], c[6]);
Full_adder fa7(start2, in1[7], in2[7], c[6], z[7], z[8]);

assign out = z;
endmodule
