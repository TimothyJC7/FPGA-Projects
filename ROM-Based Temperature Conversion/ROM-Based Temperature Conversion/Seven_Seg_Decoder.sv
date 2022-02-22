`timescale 1ns / 1ps

module Seven_Seg_Decoder
    (
        input logic [3:0] bcd_in,
        output logic [6:0] seg_out    
    );
    
    // Nexys-A7 7-segments are common anode meaning a logic 0 indicates a segment is on.
    
    always_comb
    begin
        case(bcd_in)
            0 : seg_out = 7'b1000000; // 7-segment codes according to Nexys-A7 reference manual
            1 : seg_out = 7'b1111001;
            2 : seg_out = 7'b0100100;
            3 : seg_out = 7'b0110000;
            4 : seg_out = 7'b0011001;
            5 : seg_out = 7'b0010010;
            6 : seg_out = 7'b0000010;
            7 : seg_out = 7'b1111000;
            8 : seg_out = 7'b0000000;
            9 : seg_out = 7'b0011000;
            default : seg_out = 7'b1111111;
        endcase
    end
endmodule
