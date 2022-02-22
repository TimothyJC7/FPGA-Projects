`timescale 1ns / 1ps

module Seven_Seg_Driver
#(parameter SIZE = 8)
    (
        input logic [SIZE-1:0] temp,
        input logic clk, rst,
        output logic [7:0] an,
        output logic [6:0] seg_out
    );
    
    logic [6:0] seg_wire0, seg_wire1, seg_wire2;
    logic [11:0] bcd_wire;
    
    Seven_Seg_Decoder ssdecoder0(.bcd_in(bcd_wire[3:0]),.seg_out(seg_wire0));
    Seven_Seg_Decoder ssdecoder1(.bcd_in(bcd_wire[7:4]),.seg_out(seg_wire1));
    Seven_Seg_Decoder ssdecoder2(.bcd_in(bcd_wire[11:8]),.seg_out(seg_wire2));
    Bin2bcd b2bcd(.b_in(temp),.bcd_out(bcd_wire));
    
    typedef enum {seg0, seg1, seg2, seg3} state_type;
    state_type state_reg, state_next;
    
    // This State Machine cycles through the first 4 7-segment displays on the Nexys-A7, displaying
    // the proper digit on each 7-segment
    
    always_comb
    begin
        case(state_reg)
            seg0 : state_next = seg1;
            seg1 : state_next = seg2;
            seg2 : state_next = seg3;
            seg3 : state_next = seg0;
            default : state_next = seg1;
        endcase
    end
    
    always_ff @(posedge clk)
    begin
        state_reg <= rst ? seg0 : state_next;
    end
    
    always_comb
    begin
        case(state_reg)
            seg0 : 
            begin
                an = 8'b11111110;
                seg_out = seg_wire0;
            end
            seg1 : 
            begin
                an = 8'b11111101;
                seg_out = seg_wire1;
            end
            seg2 : 
            begin
                an = 8'b11111011;
                seg_out = seg_wire2;
            end
            seg3 : 
            begin
                an = 8'b11110111;
                seg_out = 7'b1000000;
            end
            default : an = 8'b11111111;
        endcase
    end
    
endmodule
