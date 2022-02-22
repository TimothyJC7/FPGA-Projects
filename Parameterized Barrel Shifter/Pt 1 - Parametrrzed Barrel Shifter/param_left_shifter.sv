`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 12:34:04 PM
// Design Name: 
// Module Name: param_right_shifter
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


module param_left_shifter
#(parameter N = 3)
    (
        input logic [(2**N)-1:0] in,
        input logic [N-1:0] amt,
        output logic [(2**N)-1:0] out
    );
    
    logic [(2**N)-1:0] s [N:0];
    
    assign s[0][(2**N)-1:0] = in;
    
    generate
        genvar i;
        for (i = 1; i <= N; i = i + 1)
            assign s[i][(2**N)-1:0] = amt[i-1] ? {s[i-1][((2**N)-1)-(2**(i-1)):0], s[i-1][(2**N)-1:(2**N)-(2**(i-1))]} : s[i-1][(2**N)-1:0]; 
    endgenerate
    
    assign out = s[N][(2**N)-1:0];
    
    
endmodule
