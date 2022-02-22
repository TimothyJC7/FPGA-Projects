`timescale 1ns / 1ps

module Clock_Divider
#(parameter CNT_SIZE = 16)
    (
        input logic [CNT_SIZE-1:0] count_val,
        input logic clk_in, rst,
        output logic clk_out
    );
    
    // count_val = FPGA Clock Freq (Hz) / Desired Clock Frequency (Hz)
    
    logic [CNT_SIZE-1:0] counter;
    
    always_ff @(posedge clk_in)
    begin
        if (rst)
        begin
            clk_out <= 0;
            counter <= 0;
        end
        else
        begin
            if (counter == count_val - 1) 
            begin
                clk_out <= ~clk_out;
                counter <= 0;
            end
            else
                counter <= counter + 1;
        end
    end
    
    
endmodule
