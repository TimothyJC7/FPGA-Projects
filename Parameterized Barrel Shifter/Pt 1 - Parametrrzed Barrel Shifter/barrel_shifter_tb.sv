`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 01:34:39 PM
// Design Name: 
// Module Name: barrel_shifter_tb
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


module barrel_shifter_tb
#(parameter N = 3)
    (
        input reg [(2**N)-1:0] in,
        input reg [N-1:0] amt,
        output wire [(2**N)-1:0] right_shifted, left_shifted
    );
    
    barrel_shifter_top #(.N(N)) uut(.*);
    
    initial begin
    in = 8'b11010010;
    amt = 3'b000;
    #10
    amt = 1;
    #10
    amt = 2;
    #10
    amt = 3;
    #10
    amt = 4;
    #10
    amt = 5;
    #10
    amt = 6;
    #10
    amt = 7;
    end
    
    
endmodule
