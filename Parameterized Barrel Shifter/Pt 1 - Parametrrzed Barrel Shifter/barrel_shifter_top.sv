`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 01:28:32 PM
// Design Name: 
// Module Name: barrel_shifter_top
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


module barrel_shifter_top
#(parameter N = 3)
    (
        input logic [(2**N)-1:0] in,
        input logic [N-1:0] amt,
        output logic [(2**N)-1:0] right_shifted, left_shifted
    );
    
    param_left_shifter #(.N(N)) u1(.in(in), .amt(amt), .out(left_shifted));
    param_right_shifter #(.N(N)) u2(.in(in), .amt(amt), .out(right_shifted));
    
    
    
endmodule
