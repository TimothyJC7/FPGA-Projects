`timescale 1ns / 1ps


module Bin2bcd
    (
        input logic [7:0] b_in,
        output logic [11:0] bcd_out
    );

    logic [3:0] i;   
    
    // 8-bit Binary to BCD using Double Dabble Algorithm
    always_comb
    begin
        bcd_out = 0; 
        for (i = 0; i < 8; i = i+1) 
        begin
            bcd_out = {bcd_out[10:0],b_in[7-i]};     
            if(i < 7 && bcd_out[3:0] > 4) 
                bcd_out[3:0] = bcd_out[3:0] + 3;
            if(i < 7 && bcd_out[7:4] > 4)
                bcd_out[7:4] = bcd_out[7:4] + 3;
            if(i < 7 && bcd_out[11:8] > 4)
                bcd_out[11:8] = bcd_out[11:8] + 3;  
        end
    end     
                
endmodule
