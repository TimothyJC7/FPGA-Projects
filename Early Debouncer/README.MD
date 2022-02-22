# Early Debouncer

This circuit represents an early debouncer which is used to debounce the input of a button. When a mechanical button is pressed and released, the input is unstable for a period of time which can result in errors in digital circuits. The debouncer circuit utilizes a state machine to remove the unstable periods of the button input and provide a clean and stable pulse. The debounced output and the unchanged button input signal are displayed on an oscilloscope. The raw button input signal does not contain the expected bounces because the button input is sent through the FPGA first. This prevents us from seeing the true nature of the button press signal.

## Hardware Used

Digilent's Basys3 Artix-7 FPGA Board

## Software Used

Vivado 2019.2

## State Diagram

![State_Diagram](https://user-images.githubusercontent.com/89544050/154218561-914f79bd-ac77-4f61-82f4-8c678be6dc62.png)

## Algorithmic State Machine Diagram

![ASM_Diagram](https://user-images.githubusercontent.com/89544050/154218578-a50a890d-9140-4f1c-b26c-955f4e1a2121.png)

## Oscilloscope Waveform

![Early_Debouncer_Oscilloscope_Output](https://user-images.githubusercontent.com/89544050/154218655-e0b1de98-444f-4847-b22c-1e4573092af6.png)

## FPGA Utilization

### Synthesization Phase

Number of LUT's: 9 

Number of FF's: 24

### Implementation Phase

Number of LUT's: 8

Number of FF's: 24

Worst Negative Slack (WNS): 7.301 ns

Worst Hold Slack (WHS): 0.280 ns

Worst Pulse Width Slack (WPWS): 4.500 ns

Power:  0.074 W

## File Organization

The files included in this directory are .sv files containing system verilog code along with images which consist of a state diagram, algorithmic state machine diagram, and a image capture of an oscilloscope displaying the output signal(s).

## Video Link

[Early Debouncer](https://youtu.be/q5vKcye35Qg)
