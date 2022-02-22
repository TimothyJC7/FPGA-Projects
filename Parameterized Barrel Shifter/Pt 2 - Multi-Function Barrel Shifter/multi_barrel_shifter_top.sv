`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Timothy Calvert
// 
// Create Date: 02/01/2022 12:34:04 PM
// Design Name: 
// Module Name: param_right_shifter
// Project Name: multi_barrel_shifter
// Target Devices: Basys3
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
    input logic lr,
    output logic [(2**N)-1:0] out
    );
    
    logic [(2**N)-1:0] left_shifted, right_shifted;
    
    param_right_shifter #(.N(N)) u1(.in(in), .out(right_shifted), .amt(amt));
    param_left_shifter #(.N(N)) u2(.in(in), .out(left_shifted), .amt(amt));
    multi_barrel_shifter_mux #(.N(N)) u3(.lr(lr), .left(left_shifted), .right(right_shifted), .out(out));
    
endmodule