# Parametrized Multi-Function Barrel Shifter

This Multi-Function Barrel Shifter is a combinational circuit which arithmetically rotates a register in both the left direction and right direction depending on a 1 bit input. The circuit is design in system verilog and parametrized to allow for any number of shifts to occur depending on the size of one of the inputs and the capabilities of the development board in use.

## Hardware Used

Digilent's Basys3 Artix-7 FPGA Board

## Software Used

Vivado 2019.2

## Sketch of Multi-Function Barrel Shifter

![Multi-Function Barrel Shifter](https://user-images.githubusercontent.com/89544050/152111412-8c6185f0-aeb4-4ab0-b776-7041a7084e0e.png)

## Sketch of Multi-Function Barrel Shifter with Reverser Circuit

![Multi-Function Barrel Shifter with Reverser](https://user-images.githubusercontent.com/89544050/152243987-f83a6b46-8c1b-436b-a01d-1d7472d6bad9.png)

## Parametrized Left and Right Barrel Shifter Simulation Results

![Simulation Results](https://user-images.githubusercontent.com/89544050/152241172-8cd71966-7543-45a0-9949-e80910c8a9cc.png)

## Multi-Function Barrel Shifter with Reverser Circuit TestBench

![TestBench Simulation](https://user-images.githubusercontent.com/89544050/152240690-6aa2342b-9c75-4901-bcf9-e1e52406442c.png)

## FPGA Utilization

### Multi-Function Barrel Shifter

- 24 LUT's
- 12 IBUF's
- 8 OBUF's

### Multi-Function Barrel Shifter with Reverser

- 24 LUT's
- 12 IBUF's
- 8 OBUF's

## File Organization

The files included in this directory are .sv files and are separated in three folders. The first folder is made up of the left and right barrel shifter code files and a simulated testbench. The second and third folders is made up of the parametrized Multi-Function Barrel Shifter with and without using a reverser circuit.

## Video Link

[Parametrized Multi-Function Barrel Shifter FPGA Implementation](https://youtu.be/5wEzRTIzyEE)
