# Programmable Sqaure Wave Generator

This Programmable Square Wave Generator is a circuit that can generate a square wave with variable on and off times controlled by inputs. In this project, two 4-bit inputs control the amount of time the square wave pulses high and low. Utilizing the internal clock on the FPGA, a counter can be used to turn on or off the output depending on the value of the counter. The counter values are 10 times that of what 'm' and 'n' are. This is because we want each value of 'm' and 'n' to represent 100 ns up or down time but the FPGA has an internal clock period of 10 ns. To compensate we need the counter to count 10 times the value of 'm' or 'n'. This results in having the capability of generating a square wave with m * 100ns or n * 100ns on/off durations.

## Hardware Used

Digilent's Basys3 Artix-7 FPGA Board

## Software Used

Vivado 2019.2

## Logic Diagram

![Logic_Diagram](https://user-images.githubusercontent.com/89544050/153112242-b536d4c9-c28b-4b53-9f88-884fedc21328.png)

## Testbench Simulation Results

![Lab2_Sim](https://user-images.githubusercontent.com/89544050/153112279-1903a036-9123-4fc9-bf92-24c72219b424.png)

## FPGA Utilization

### Synthesization Phase

Number of LUT's: 48

### Implementation Phase

Number of LUT's: 47

Worst Negative Slack (WNS): 4.622 ns

Worst Hold Slack (WHS): 0.217 ns

Worst Pulse Width Slack (WPWS): 4.5 ns

Power: 0.072 W

## File Organization

The files included in this directory are .sv files containing system verilog code along with images which consist of a logic diagram based on the algorithm used and an image of Vivado's simulation results of the implementated code.

## Video Link

[FPGA Implementation: Programmable Sqaure Wave Generator](https://youtu.be/mK-iXRkY900)
