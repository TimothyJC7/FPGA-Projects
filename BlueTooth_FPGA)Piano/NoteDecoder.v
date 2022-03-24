`timescale 1ns / 1ps

module NoteDecoder(
    input [7:0] rxIn,
    output reg [25:0] note
    );
    
    parameter val = 50000000;
    
    // Declare Notes , val / note frequency = note
    // val is half of the FPGA Clock Frequency
    
    parameter As3 = val/233.08,
              B3 = val/246.94,
              C4 = val/261.63,
              Cs4 = val/277.18,
              D4 = val/293.66,
              Ds4 = val/311.13,
              E4 = val/329.63,
              F4 = val/349.23,
              Fs4 = val/369.99,
              G4 = val/392,
              Gs4 = val/415.3,
              A4 = val/440,
              As4 = val/466.16,
              B4 = val/493.88,
              C5 = val/523.25,
              Cs5 = val/554.37;
              
       
    // Decode received byte into notes
                   
    always @(*) begin
        case(rxIn)
        8'd1 : note = As3;
        8'd2 : note = B3;
        8'd3 : note = C4;
        8'd4 : note = Cs4;
        8'd5 : note = D4;
        8'd6 : note = Ds4;
        8'd7 : note = E4;
        8'd8 : note = F4;
        8'd9 : note = Fs4;
        8'd10 : note = G4;
        8'd11 : note = Gs4;
        8'd12 : note = A4;
        8'd13 : note = As4;
        8'd14 : note = B4;
        8'd15 : note = C5;
        8'd16 : note = Cs5;
        default : note = 1;
        endcase
    end
endmodule
