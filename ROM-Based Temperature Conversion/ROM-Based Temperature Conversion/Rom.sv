`timescale 1ns / 1ps

module Rom
#(parameter DEPTH = 4, WIDTH = 8, MEM_FILE = "farenheit.mem")
    (
        input logic [(2**DEPTH)-1 : 0] addr,
        input logic clk, 
        output logic [WIDTH-1 : 0] data
    );
    
    // (* rom_style = "block" *) is intended to force Nexys-A7 to use BRAM (may not always work)
    // Use template for single port rom in reference manual
     
    (* rom_style = "block" *)logic [WIDTH-1 : 0] rom_mem [(2**DEPTH)-1 : 0];
    
    initial
        $readmemb(MEM_FILE, rom_mem); // read selected file in rom_mem
        
    always_ff @(posedge clk)
    begin
        data <= rom_mem[addr];
    end
endmodule
