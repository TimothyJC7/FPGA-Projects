`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 05:59:06 PM
// Design Name: 
// Module Name: multi_barrel_shifter_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multi_barrel_shifter_top
#(parameter N = 3)
    (
    input logic [(2**N)-1:0] in,
    input logic [N-1:0] amt,
    input logic reverse,
    output logic [(2**N)-1:0] out
    );
    
    logic [(2**N)-1:0] w1,w2;
    multi_barrel_shifter_reverser #(.N(N)) u1(.in(in), .out(w1), .reverse(reverse));
    param_right_shifter #(.N(N)) u2(.in(w1), .out(w2), .amt(amt));
    multi_barrel_shifter_reverser #(.N(N)) u3(.in(w2), .out(out), .reverse(reverse));
    
endmodule
