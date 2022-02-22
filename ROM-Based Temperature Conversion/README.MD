# ROM-Based Temperature Conversion

This circuit converts farenheit into celsius and vice versa. Instead of implementing the multiplication and division needed to implement the conversion formula, the values are pre-generated in a range of 0 to 100 degrees for celsius and 32 to 212 for farenheit. Then, the values are stored in two ROM modules which utilizes the BRAM on the Artix-7 FPGA. The circuit retrieves the conversion value from the ROM based on the input and outputs the converted temperature value on the seven segment displays provided to us by the Nexys A7-100T FPGA Board.

## Hardware Used

Digilent's Nexys A7-100T FPGA Board

## Software Used

Vivado 2019.2

## Top Block Diagram

![Top_Diagram](https://user-images.githubusercontent.com/89544050/155059747-8f7d5411-5c2d-43e5-b97e-591cba160ed3.png)

## Seven Segment Driver Block Diagram

![seven_seg_driver](https://user-images.githubusercontent.com/89544050/155059739-1c8a0e30-2ca5-41f0-8952-2ccb6045a985.png)

## FPGA Utilization

### Synthesization Phase

Amount of LUT's: 60 

Amount of FF's: 21

Amount of BRAM : 1.0

### Implementation Phase

Amount of LUT's: 59

Amount of FF's: 21

Amount of BRAM : 1.0

Worst Negative Slack (WNS): 4.955 ns

Worst Hold Slack (WHS): 0.320 ns

Worst Pulse Width Slack (WPWS): 4.500 ns

Power:  0.128 W

## File Organization

The files included in this directory are .sv files containing system verilog code and block diagrams. The top module block diagram represents simple structure of this circuit. The second block diagram represents the inner circuits of the seven segment driver.

## Video Link

[ROM-Based Temperature Conversion](https://youtu.be/HHoyHJnJ4so)
