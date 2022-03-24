`timescale 1ns / 1ps

module NotePlayer(
    input clk,reset,
    input [25:0] note,
    output reg audioOut
    );
    
    reg [25:0] counter = 26'd0;
    reg [25:0] note_last;

    always @(posedge clk, negedge reset)
    begin
        note_last <= note;
        if (!reset) begin
            counter <= 0;
            audioOut <= 0;
        end
        else begin
            counter <= counter + 26'd1;
            if(counter == note) begin
                counter <= 0;
                audioOut <= ~audioOut; //Count up to note value and toggle audioOut to generate different frequencies   
            end   
            if(note != note_last) begin
                counter <= 0;                // Check if note has changed. If so, set counter = 0
            end  
        end     
    end

endmodule
