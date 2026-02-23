# FPGA Traffic Light Controller

This project implements a basic **Traffic Light Controller using Verilog HDL**.  
It controls traffic signals for North, South, East, and West directions and is simulated using **Xilinx/AMD Vivado**.

## Features
- Verilog-based FSM design  
- Red, Yellow, Green signals for all 4 directions  
- Emergency input support  
- Clock and reset controlled  
- Testbench included  
- Simulated in Vivado (XSim)

## Files
- `traffic_light.v` – Main traffic light controller module  
- `traffic_light_tb.v` – Testbench for simulation  

## How to Run
1. Open Vivado  
2. Create a new RTL project  
3. Add both Verilog files  
4. Set `traffic_light_tb` as simulation top  
5. Run Behavioral Simulation  

## Author
loki1826
