
# ACK Detector

## Overview

The **ACK Detector** is an essential module of the I2C Master Controller. It detects the acknowledgment (ACK) signal sent by the slave device after receiving an address or data byte.

In the I2C protocol, the slave responds by pulling the SDA line LOW during the acknowledgment clock pulse. If SDA remains HIGH, it indicates a Not Acknowledge (NACK).

---

## Objective

- Detect the acknowledgment sent by the slave.
- Differentiate between ACK and NACK.
- Notify the I2C Master FSM whether communication should continue.

---

## Features

- Active-high synchronous reset
- Simple and synthesizable Verilog RTL
- Compatible with Xilinx Vivado
- Supports ACK/NACK detection
- Easy integration with the I2C Master FSM

---

# Block Diagram

```
                 +----------------------+
 ack_in -------->|                      |
 check_ack ----->|    ACK Detector      |-----> ack_received
 clk ----------->|                      |
 rst ----------->|                      |
                 +----------------------+
```

---

# Working Principle

1. The module waits for the `check_ack` signal from the FSM.
2. When `check_ack` is asserted:
   - If `ack_in = 0`, the slave has acknowledged the transfer.
   - If `ack_in = 1`, the slave has not acknowledged the transfer.
3. The output `ack_received` is updated accordingly.
4. The FSM uses this output to determine the next state.

---

# Truth Table

| check_ack | ack_in | ack_received | Description |
|------------|--------|--------------|-------------|
| 0 | X | Previous Value | ACK not checked |
| 1 | 0 | 1 | ACK Received |
| 1 | 1 | 0 | NACK Received |

---

# Module Ports

## Inputs

| Signal | Width | Description |
|---------|------|-------------|
| clk | 1 | System clock |
| rst | 1 | Active-high reset |
| ack_in | 1 | ACK/NACK input from slave |
| check_ack | 1 | Enables ACK detection |

---

## Outputs

| Signal | Width | Description |
|---------|------|-------------|
| ack_received | 1 | Indicates whether ACK was received |

---

# Timing Diagram

### ACK Received

```
check_ack

________|‾‾‾‾‾‾|________

ack_in

____________0___________

ack_received

___________1____________
```

---

### NACK Received

```
check_ack

________|‾‾‾‾‾‾|________

ack_in

____________1___________

ack_received

___________0____________
```

---

# Simulation

The simulation verifies:

- Reset operation
- ACK detection (`ack_in = 0`)
- NACK detection (`ack_in = 1`)
- Correct generation of `ack_received`

---

# Expected Behavior

```
Reset
   ↓
Wait for check_ack
   ↓
ACK Received?
      │
      ├── Yes → ack_received = 1
      │
      └── No  → ack_received = 0
```

---

# Applications

- I2C Master Controller
- Digital Communication Systems
- FPGA Designs
- Embedded Systems
- Digital VLSI Projects

---

# Tools Used

- Verilog HDL
- Xilinx Vivado 2023.2
- Behavioral Simulation

---

# Folder Structure

```
ack_detector/
│── ack_detector.v
│── ack_detector_tb.v
│── waveform.png
│── rtl_schematic.png
└── README.md
```

---

# Results

- ✔ ACK detection implemented successfully.
- ✔ NACK detection verified.
- ✔ Behavioral simulation completed successfully.
- ✔ RTL synthesis compatible.

---

# Future Enhancements

- Support for multiple ACK cycles.
- Error flag generation for repeated NACKs.
- Integration with advanced I2C controllers.
- Support for clock stretching and multi-byte transfers.

---

