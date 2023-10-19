`timescale 1ns / 1ps

module mac_tb();

reg [7:0] data_inA, data_inB;
reg clk, rst, rst_for_mul, start_datapath;

wire [2:0] state;
wire start_mul;
wire done;
wire [7:0] Product;
wire valid_mul;
wire [7:0] Adderin_A;
wire [7:0] Adderin_B;
wire [7:0] out_sum;

mac_datapath dp(clk, rst, rst_for_mul, ldA, ldB, data_inA, data_inB, start_mul, 
                    ldacc, start_adder, valid_mul, Product, Adderin_A, Adderin_B, out_sum);

mac_controller con(clk, rst, start_datapath, ldA, ldB, start_mul, ldacc, start_adder, valid_mul, done, state);

initial begin 
 clk=1'b0;
 rst = 1'b1;
 #4 rst = 1'b0;
 #12 start_datapath=1'b1;
 #4 start_datapath=1'b0;
 end

always #1 clk=~clk;

initial begin 
    data_inA = 17;
    data_inB = 5;
    rst_for_mul = 1'b1;
    #4 rst_for_mul = 1'b0;
    
    #36.4 data_inA = 11;
    data_inB = 12;
    
    #4 rst_for_mul = 1'b1;
    #4 rst_for_mul = 1'b0;
    
    #2 start_datapath=1'b1;
    #4 start_datapath=1'b0;
    
    #25 data_inA = 14;
    data_inB = 9;
    
    #4 rst_for_mul = 1'b1;
    #2.4 rst_for_mul = 1'b0;
    
    #2 start_datapath=1'b1;
    #2 start_datapath=1'b0;
    #17 $finish;

end

endmodule 
