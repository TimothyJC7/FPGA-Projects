`timescale 1ns / 1ps

module UART_Rx (
  input         reset,
  input         rx,
  input         clk, // Baud Rate x 4 (4 posedge's per bit)
  output  [7:0] rx_byte,
  output        done
);

// Count to 32 (8 bits x 4 samples )
reg       [4:0] count;
reg       [2:0] state;
reg       [2:0] state_nxt;

reg       [2:0] rx_shifter;
reg       [7:0] rx_byte_ff;
wire            rx_sample;

localparam WAIT = 3'b000,
           SNS1 = 3'b100,
           SNS2 = 3'b101,
           SNS3 = 3'b110,
           SNSX = 3'b111,
           READ = 3'b001,
           DONE = 3'b010;

//When sampling RX if we got 2 highs in a row our sample is high

assign rx_sample = (rx_shifter[2] && rx_shifter[1]) || 
                   (rx_shifter[1] && rx_shifter[0]);

assign rx_byte = rx_byte_ff;
assign done = state == DONE;

// Finite State Machine

always @ (*)
begin
  case (state)
    WAIT: begin
         if (!rx)  // As long was we are high stay waiting 
        state_nxt = SNS1;
      else          
        state_nxt = WAIT;
        end
    SNS1: begin
        if (!rx)
        state_nxt = SNS2;
      else
        state_nxt = WAIT;
        end
    SNS2: begin
        if (!rx)  // If we get 4 lows in a row we got to read 
        state_nxt = SNSX;
      else
        state_nxt = WAIT;
        end
    SNSX: begin
      state_nxt = READ;
      end
    READ: begin
        if (count == 5'b11111) // When read count is full, go back to wait
        state_nxt = DONE;
      else
        state_nxt = READ;
        end
    DONE:    state_nxt = WAIT;
    default: state_nxt = WAIT;
  endcase
end

// Sense the start bit on posedge and negedge 

always @ (posedge clk, negedge reset)
begin
   if (!reset) 
    begin
      state <= WAIT;
      count <= 5'd0;
      rx_shifter <= 3'd0;
    end
   else
    begin
      state <= state_nxt;
      if (state == READ) begin
        rx_shifter <= {rx, rx_shifter[2:1]};
        count <= count + 1'b1;
      end
      else 
      begin
        rx_shifter <= 3'd0;
        count <= 5'd0;
      end
    end
end

// If we are reading, stample the RX bits every 3 samples shift it into RX byte

always @ (posedge clk, negedge reset)
begin
   if (!reset) 
      rx_byte_ff <= 8'd0;
   else begin
     if ((state == READ) && count[1] && count[0])  // When we are at count 3, sample the shift register 
       rx_byte_ff <= {rx_sample, rx_byte_ff[7:1]};
     else 
       rx_byte_ff <= rx_byte_ff;
   end
end

endmodule

