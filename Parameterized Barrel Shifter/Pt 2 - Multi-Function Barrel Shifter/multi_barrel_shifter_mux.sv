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


module multi_barrel_shifter_mux
#(parameter N = 3)
    (
        input logic lr,
        input logic [(2**N)-1:0] left,
        input logic [(2**N)-1:0] right,
        output logic [(2**N)-1:0] out
    );
    
    assign out = lr ? right : left;
    
endmodule