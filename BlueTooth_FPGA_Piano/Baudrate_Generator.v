`timescale 1ns / 1ps

module Baudrate_Generator(
    input clock_in,
    input [25:0] clkdiv,
    output reg baudrateX4 
    ); 

    reg [25:0] counter = 26'd0;

    // clkdiv is the value needed to generate 4 x 9600 baudrate
    
    always @(posedge clock_in)
    begin
        counter <= counter + 26'd1;
        if(counter == clkdiv) begin
            counter <= 0;
            baudrateX4 <= ~baudrateX4; // Toggle baudrateX4 every time counter = clkdiv
        end
            
    end
    
    endmodule