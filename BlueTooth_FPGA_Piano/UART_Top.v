`timescale 1ns / 1ps

module UART_Top(
    input clk,rst,rx,
    output [7:0] LED,
    output done,audioOut
    );
    
    reg [25:0] baudrate_divider = 1302.083;  // baudrate of HC-05 Bluetooth Module is 9600 by default 
                                             // We need a clock frequency of 4 x 9600 = 38400 Hz
                                             // Therefore, baudrate_divider = (FPGA Clock / 2) / 38400 Hz = 1302.083         
    wire baudX4;
    wire [7:0] rxData;
    wire [25:0] note;
    
    assign LED = rxData;
    
    Baudrate_Generator u1(.clock_in(clk),.clkdiv(baudrate_divider),.baudrateX4(baudX4));
    UART_Rx u2(.clk(baudX4),.reset(rst),.rx(rx),.rx_byte(rxData),.done(done));
    NoteDecoder u3(.rxIn(rxData),.note(note));
    NotePlayer u4(.clk(clk),.note(note),.audioOut(audioOut),.reset(rst));

endmodule
