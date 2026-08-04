# Clock Divider

## Overview

The **Clock Divider** is a fundamental module in digital systems that generates a slower clock from a high-frequency system clock. In this I2C Master Controller project, it is used to generate the **Serial Clock (SCL)** required for I2C communication.

---

## Objective

- Divide the high-frequency input clock.
- Generate a slower clock (`scl_tick`) for I2C data transmission.
- Synchronize the communication between the I2C Master and Slave devices.

---

## Features

- Synchronous design
- Active-high reset
- Synthesizable Verilog HDL
- Compatible with Xilinx Vivado
- Used as the timing source for the I2C Master Controller

---

## Block Diagram

```
             +----------------------+
 clk ------->|                      |
 rst ------->|    Clock Divider     |-------> scl_tick
             |                      |
             +----------------------+
```

---

## Module Ports

| Port | Direction | Width | Description |
|------|-----------|-------|-------------|
| clk | Input | 1 | System clock |
| rst | Input | 1 | Active-high reset |
| scl_tick | Output | 1 | Divided clock output |

---

## Working Principle

1. The module receives the high-frequency system clock.
2. An internal counter increments on every rising edge of the clock.
3. When the counter reaches a predefined value, it resets to zero.
4. The output signal `scl_tick` toggles, producing a slower clock suitable for I2C communication.

---

## Simulation

The waveform verifies:

- Reset operation
- Counter increment
- Generation of the divided clock (`scl_tick`)
- Stable periodic output

---

## Expected Waveform

```
clk

_|‾|_|‾|_|‾|_|‾|_|‾|_

scl_tick

____|‾‾‾‾|____|‾‾‾‾|____
```

---

## Applications

- I2C Protocol
- SPI Clock Generation
- UART Baud Rate Generator
- FPGA Designs
- Digital Communication Systems

---

## Tools Used

- Verilog HDL
- Xilinx Vivado 2023.2
- Behavioral Simulation

---

## Folder Structure

```
clock_divider/
│── clock_divider.v
│── clock_divider_tb.v
│── waveform.png
│── rtl_schematic.png
└── README.md
```

---

## Results

- ✔ Clock successfully divided.
- ✔ Correct `scl_tick` generated.
- ✔ Behavioral simulation passed.
- ✔ RTL synthesis completed successfully.

---
