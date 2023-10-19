`timescale 1ns / 1ps
module read_write_data();

integer file_handle;
parameter N = 3;
reg [15:0] memory [0:N-1];
reg hasdata;
integer i = 0;
reg big_clk, clk, rst, rst_for_mul, start_datapath;

reg [7:0] data_inA, data_inB;
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
 big_clk = 1'b0;
 start_datapath = 1'b0;
 
 rst = 1'b1;
 rst_for_mul = 1'b1;
 #3 rst = 1'b0;
 rst_for_mul = 1'b0;

#200 $finish;
 end

always #1 clk=~clk;
always #16 big_clk = ~big_clk;

//Code for writing the data is not working right now!!
//Will change the code later
initial begin
  file_handle = $fopen("[YourLocation]/outputdata.txt", "w");
    $readmemb("[YourLocation]/inputdata.txt", memory);
    if(N > 0)   hasdata = 1;
end


always @(posedge big_clk & hasdata) begin
    if(N <= i) begin
        hasdata = 0;
        $fclose(file_handle);
    end
    else begin
        data_inA = memory[i][15:8];
        data_inB = memory[i][7:0];
        
        rst_for_mul = 1'b1;
        #2.4 rst_for_mul = 1'b0;
    
        #1.2 start_datapath=1'b1;
        #2.4 start_datapath=1'b0;
    
        $fwrite(file_handle, "%b\n", Adderin_B);
        i = i + 1;
    end
end

endmodule
