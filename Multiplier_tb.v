`timescale 1ns / 1ps

module Multiplier_tb();

reg clk,rst,start;
reg [7:0] X, Y;
wire [7:0] Z_inuse;
wire valid;

always #5 clk = ~clk;

Multiplier tb_1(clk, rst, start, X, Y, valid, Z_inuse);

initial
$monitor($time," X=%d, Y=%d, valid=%d, Z=%d ", X, Y, valid, Z_inuse);
initial
begin
    X=12; 
    Y=11;
    clk=1'b1;
    rst=1'b1;
    start=1'b0;
    
    #10 rst = 1'b0;
    #10 start = 1'b1;
    #10 start = 1'b0;
    @valid
    #10 X=4;
    Y=6;
    start = 1'b1;
    #10 start = 1'b0;
    #10 $finish;
end      
endmodule
