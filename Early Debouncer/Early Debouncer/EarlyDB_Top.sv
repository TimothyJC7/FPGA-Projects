`timescale 1ns / 1ps

module EarlyDB_Top
    (
        input logic button, rst, clk,
        output logic led,
        output logic [1:0] out
    );
    
    Early_debouncer u1(.reset(rst),.clk(clk),.in(button),.out(out[0]));
    
    assign led = out[0];
    assign out[1] = button;
endmodule
