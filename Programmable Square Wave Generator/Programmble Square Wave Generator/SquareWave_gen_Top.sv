`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2022 01:13:52 PM
// Design Name: 
// Module Name: SquareWave_gen_Top
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


module SquareWave_gen_Top
#(parameter M = 4, N = 4) 
    (
        input logic clk, rst,
        input logic [M-1:0] m,
        input logic [N-1:0] n,
        output logic out
    );
    // CLK = 100 MHZ, PERIOD = 10 ns
    localparam T = 10;
    
    // M and N counters need to be 10 times the size in order to achieve the 100 ns base period
    logic [$clog2((2**M)*T):0] m_count;
    logic [$clog2((2**N)*T):0] n_count;
    logic state;
    
    always_ff @(posedge clk)
    begin
    if (rst) begin
        out <= 0;
        state <= 0;
        m_count <= 0;
        n_count <= 0;
    end
    else begin
        case (state) 
        1'b0 : begin
            out <= 0;
            if (m != 0) begin
                m_count <= m_count + 1;
                out <= 1;
                if (m_count == 10*m - 1) begin
                    state <= 1;
                    m_count <= 0;
                end  
            end   
        end
        1'b1 : begin
            out <= 1;
            if (n != 0) begin
                n_count <= n_count + 1;
                out <= 0;
                if (n_count == 10*n - 1) begin
                    state <= 0;
                    n_count <= 0;
                end  
            end    
        end
        endcase         
    end
    end
endmodule
