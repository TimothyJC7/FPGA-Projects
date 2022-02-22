`timescale 1ns / 1ps 

module Rom_Temp_Conv_Top
#(parameter SIZE = 8)
    (
        input logic [SIZE - 1:0] temp_in,
        input logic temp_format, clk, rst,
        output logic [6:0] seg,
        output logic [7:0] AN,
        output logic [SIZE - 1:0] led
    );
    
    logic [SIZE - 1:0] temp_out;
    logic [SIZE - 1:0] f_out, c_out;
    logic [SIZE - 1:0] temp_wire;
    logic fivehundredhz;
    
    Rom #(.WIDTH(SIZE),.DEPTH(SIZE),.MEM_FILE("farenheit.mem")) farenheit(.addr(temp_wire - 32),.data(c_out),.clk(clk));
    Rom #(.WIDTH(SIZE),.DEPTH(SIZE),.MEM_FILE("celsius.mem")) celsius(.addr(temp_wire),.data(f_out),.clk(clk));
    
    Seven_Seg_Driver #(.SIZE(SIZE)) ssdriver(.temp(temp_out),.clk(fivehundredhz),.rst(rst),.seg_out(seg),.an(AN));
    Clock_Divider #(.CNT_SIZE(18)) clkdiv(.clk_in(clk),.clk_out(fivehundredhz),.rst(rst),.count_val(18'd200_000));
    
    assign led = temp_in;
    
    always_comb
    begin
        if (temp_format)
        begin
            if (temp_in < 0 || temp_in > 100) temp_out = 0; // ROM only stores coversion values for 0 to 100 deg celsius
            else 
            begin
            temp_wire = temp_in; // Send input to ROM's only when input is in range
            temp_out = f_out; // Output in farenheit
            end
        end
        else
        begin
            if (temp_in < 32 || temp_in > 212) temp_out = 0;
            else 
            begin
            temp_wire = temp_in;
            temp_out = c_out; // Output in celsius
            end
        end
    end
    
endmodule
