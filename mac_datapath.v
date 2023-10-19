`timescale 1ns / 1ps

module mac_datapath(clk, rst, rst_for_mul, ldA, ldB, data_inA, data_inB, start_mul, 
                    ldacc, start_adder, valid_mul, Product, Adderin_A, Adderin_B, out_sum);
input clk, rst, rst_for_mul;
input ldA, ldB;
input [7:0] data_inA, data_inB;
input start_mul;
input ldacc;
input start_adder;

output [7:0] Product;
output valid_mul;
output [7:0] Adderin_A;
output [7:0] Adderin_B;
output [7:0] out_sum;

wire [7:0] outA, outB;

register_8bit r1(clk, rst, ldA, data_inA, outA);
register_8bit r2(clk, rst, ldB, data_inB, outB);
Multiplier m1(clk, rst_for_mul, start_mul, outA, outB, valid_mul, Product);
register_8bit r3(clk, rst, valid_mul, Product, Adderin_A);
accumulator a1(clk, rst, ldacc, out_sum, Adderin_B);
Adder_Module ad1(start_adder, Adderin_A, Adderin_B, out_sum);

endmodule
