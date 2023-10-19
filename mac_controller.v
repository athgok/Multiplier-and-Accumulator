`timescale 1ns / 1ps

module mac_controller(clk, rst, start_datapath, ldA, ldB, start_mul, ldacc, start_adder, valid_mul, done, state);
input clk, rst;
input start_datapath;
input valid_mul;

output reg ldA, ldB;
output reg start_mul;
output reg ldacc;
output reg start_adder;
output reg done;
output reg [2:0] state;

parameter S0 = 3'b000, 
          S1 = 3'b001, 
          S2 = 3'b010, 
          S3 = 3'b011, 
          S4 = 3'b100;

always @(posedge clk)
begin
    case(state)
        S0: if(start_datapath) state <= S1;
        S1: if(ldA&ldB)  state <= S2;
        S2: if(valid_mul)   state <= S3;
            else state <= S2;
        S3: if(start_adder) state<=S4;
        
        default: state <= S0;
    endcase
end

always@(state) begin
    case(state)
        S0:begin ldA=0;ldB=0;start_mul=0;start_adder=0;ldacc=0;done=0; end
        S1:begin ldA=1;  ldB=1; end
        S2:begin ldA=0;  ldB=0; start_mul=1;end
        S3:begin start_mul=0;   ldacc=1; start_adder=1;end
        S4:begin   ldacc=0; start_adder=0;   done=1;   end
        
        default:    begin ldA=0;ldB=0;start_mul=0;done=0; end
     endcase
 end

endmodule

