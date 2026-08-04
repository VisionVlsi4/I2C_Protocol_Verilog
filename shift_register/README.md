# Shift Register

## Overview

The **Shift Register** is one of the core modules of the I2C Master Controller. It converts **8-bit parallel data** into **serial data** for transmission over the I2C bus.

The module loads the input data when the **load** signal is asserted and shifts one bit at every clock cycle when the **shift** signal is enabled. The serial output is transmitted to the SDA line under the control of the I2C Master FSM.

---

## Objective

- Load 8-bit parallel data.
- Convert parallel data into serial data.
- Shift one bit on every clock cycle.
- Provide serial data for I2C transmission.

---

## Features

- 8-bit shift register
- Parallel data loading
- Serial data transmission
- Active-high synchronous reset
- Synthesizable Verilog HDL
- Compatible with Xilinx Vivado

---

# Block Diagram

```
                   +----------------------------+
 data_in[7:0] ---->|                            |
 load ------------>|       Shift Register       |------> serial_out
 shift ----------->|                            |------> data_out[7:0]
 clk ------------->|                            |
 rst ------------->|                            |
                   +----------------------------+
```

---

# Internal Architecture

```
+-----+ +-----+ +-----+ +-----+ +-----+ +-----+ +-----+ +-----+
| FF7 |-| FF6 |-| FF5 |-| FF4 |-| FF3 |-| FF2 |-| FF1 |-| FF0 |
+-----+ +-----+ +-----+ +-----+ +-----+ +-----+ +-----+ +-----+
                                                           |
                                                           |
                                                      serial_out
```

---

# Module Ports

## Inputs

| Signal | Width | Description |
|---------|------|-------------|
| clk | 1 | System clock |
| rst | 1 | Active-high reset |
| load | 1 | Loads parallel input data |
| shift | 1 | Enables shifting operation |
| data_in | 8 | Parallel input data |

---

## Outputs

| Signal | Width | Description |
|---------|------|-------------|
| serial_out | 1 | Serial output bit |
| data_out | 8 | Current contents of the shift register |

---

# Working Principle

1. After reset, the register is cleared.
2. When **load** is HIGH, the 8-bit input (`data_in`) is loaded into the shift register.
3. When **shift** is HIGH, the register shifts by one bit on every rising edge of the clock.
4. The most significant bit (or least significant bit, depending on implementation) appears on the `serial_out` signal.
5. The process continues until all bits are transmitted.

---

# Example

Suppose:

```
data_in = 10100101
```

After loading:

```
10100101
```

Each shift operation produces:

| Shift Cycle | Register Content | Serial Output |
|--------------|------------------|---------------|
| Load | 10100101 | 1 |
| 1 | 01001010 | 0 |
| 2 | 10010100 | 1 |
| 3 | 00101000 | 0 |
| 4 | 01010000 | 0 |
| 5 | 10100000 | 1 |
| 6 | 01000000 | 0 |
| 7 | 10000000 | 1 |
| 8 | 00000000 | 0 |

*(The exact sequence depends on whether your implementation shifts left or right.)*

---

# Timing Diagram

```
clk

_|‾|_|‾|_|‾|_|‾|_|‾|_

load

_____|‾|_____________

shift

__________|‾‾‾‾‾‾‾‾‾‾

data_in

10100101

serial_out

1----0----1----0----0----1----0----1
```

---

# Simulation

The behavioral simulation verifies:

- Reset operation
- Parallel data loading
- Shift operation
- Serial output generation
- Correct register contents after each shift

---

# Applications

- I2C Master Controller
- SPI Master/Slave
- UART Transmitter
- Serial Communication Systems
- FPGA and ASIC Designs

---

# Tools Used

- Verilog HDL
- Xilinx Vivado 2023.2
- Behavioral Simulation

---

# Folder Structure

```
shift_register/
│── shift_register.v
│── shift_register_tb.v
│── waveform.png
│── rtl_schematic.png
└── README.md
```

---

# Results

- ✔ Parallel data loaded successfully.
- ✔ Serial data transmitted correctly.
- ✔ Shift operation verified through simulation.
- ✔ RTL synthesis completed successfully.

---

# Future Enhancements

- Parameterizable data width
- Bidirectional shifting (left/right)
- Serial input support
- Configurable load and shift control
- Universal Shift Register implementation

---


