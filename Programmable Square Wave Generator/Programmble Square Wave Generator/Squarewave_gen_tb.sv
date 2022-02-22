`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2022 03:06:47 PM
// Design Name: 
// Module Name: Squarewave_gen_tb
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


module Squarewave_gen_tb();

SquareWave_gen_Top #(.M(M),.N(N)) uut(.*);

localparam M = 4, N = 4;
localparam T = 10;
logic clk, rst;
logic [M-1:0] m;
logic [N-1:0] n;
logic out;

always
begin
    clk = 1'b1;
    #(T / 2);
    clk = 1'b0;
    #(T / 2);
end

initial
begin
    rst = 1'b1;
    #(T / 2);
    rst = 1'b0;
end

initial 
begin
    m = 0;
    n = 0;
    #(50*T);
    m = 1;
    n = 0;
    #(50*T);
    m = 0;
    n = 1;
    #(50*T);
    m = 1;
    n = 1;
    #(50*T);
    m = 1;
    n = 2;
    #(50*T);
    m = 2;
    n = 1;
    #(50*T);
    $stop;
end

endmodule
