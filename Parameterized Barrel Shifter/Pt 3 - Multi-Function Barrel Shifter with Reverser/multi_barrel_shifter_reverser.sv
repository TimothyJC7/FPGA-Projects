`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 05:59:06 PM
// Design Name: 
// Module Name: multi_barrel_shifter_reverser
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


module multi_barrel_shifter_reverser
#(parameter N = 3)
    (
    input logic reverse,
    input logic [(2**N)-1:0] in,
    output logic [(2**N)-1:0] out
    );
    
    logic [(2**N)-1:0] in_reverse;
    
    always_comb
    begin
        for (int i = 0; i < 2**N; i = i + 1) begin
            in_reverse[i] = in[(2**N)-1-i];
        end
    end 
    
    assign out = reverse ? in_reverse : in;
    
endmodule
