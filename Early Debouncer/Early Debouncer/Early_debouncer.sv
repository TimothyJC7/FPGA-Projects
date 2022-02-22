`timescale 1ns / 1ps

module Early_debouncer(
        input logic in, clk, reset,
        output logic out
    );
    
    logic cnt_en, c_tick;
    logic [20:0] counter;
    logic [1:0] S,nS;
    
    localparam start = 2'b00, wait1 = 2'b01, hold = 2'b10, wait2 = 2'b11; 
    localparam val = 21'd2000000;
    
    // Next state logic
    always_comb
    begin
        case(S)
            start: 
            begin
                if (~in)
                    nS = start;
                else
                    nS = wait1;
            end
            wait1:
            begin
                if(~c_tick)
                    nS = wait1;
                else
                    nS = hold;
            end
            hold:
            begin
                if(in)
                    nS = hold;
                else
                    nS = wait2;
            end
            wait2:
            begin
                if(!c_tick)
                    nS = wait2;
                else
                    nS = start;
            end
            default: nS = start;
        endcase
    end
    
    // State Machine
    always_ff @(posedge clk)
    begin
        if(reset)
        begin
            S <= start;
            counter <= 0;
        end
        else
        begin
            S <= nS;
            if (cnt_en) 
            begin
                counter <= counter + 1;
                c_tick <= (counter == val - 1)? 1 : 0;
            end
            else
            begin
                counter <= 0;
                c_tick <= 0;
            end
        end
    end
    
    // Output Logic
    
    always_comb
    begin
        case(S)
            start: 
            begin
            cnt_en = 0;
            out = 0;
            end
            wait1: 
            begin
                cnt_en = 1;
                out = 1;
            end
            hold: 
            begin
                cnt_en = 0;
                out = 1;
            end
            wait2:
            begin
                out = 0;
                cnt_en = 1;        
            end
            default : out = 0;
        endcase
    end
endmodule
