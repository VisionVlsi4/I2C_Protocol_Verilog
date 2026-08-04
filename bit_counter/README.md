
# Bit Counter

## Overview

The **Bit Counter** is a key component of the I2C Master Controller. It counts the number of bits transmitted during serial communication. Once the required number of bits has been sent, it generates a **done** signal to inform the Finite State Machine (FSM) that the current byte transmission is complete.

---

## Objective

- Count the number of transmitted bits.
- Generate a completion signal after transmitting one byte.
- Synchronize data transmission with the I2C Master FSM.

---

## Features

- 3-bit synchronous counter
- Active-high reset
- Counts only when enabled
- Generates a **done** signal after 8 bits
- Synthesizable Verilog HDL
- Compatible with Xilinx Vivado

---

# Block Diagram

```
                 +----------------------+
 clk ----------->|                      |
 rst ----------->|     Bit Counter      |-----> count[2:0]
 enable -------->|                      |-----> done
                 +----------------------+
```

---

# Working Principle

1. Initially, the counter is reset to zero.
2. When the **enable** signal becomes HIGH, the counter increments on each rising edge of the clock.
3. The counter counts from **0 to 7**, representing the transmission of 8 bits.
4. After the eighth bit is transmitted, the **done** signal is asserted.
5. The FSM uses the **done** signal to proceed to the next state.

---

# Counter Operation

| Clock Cycle | Count | Done |
|-------------|-------|------|
| Reset | 000 | 0 |
| 1 | 001 | 0 |
| 2 | 010 | 0 |
| 3 | 011 | 0 |
| 4 | 100 | 0 |
| 5 | 101 | 0 |
| 6 | 110 | 0 |
| 7 | 111 | 0 |
| 8 | 000 | 1 |

---

# Module Ports

## Inputs

| Signal | Width | Description |
|---------|------|-------------|
| clk | 1 | System clock |
| rst | 1 | Active-high reset |
| enable | 1 | Enables counting |

---

## Outputs

| Signal | Width | Description |
|---------|------|-------------|
| count | 3 | Current bit count |
| done | 1 | Indicates completion of 8-bit transmission |

---

# Timing Diagram

```
clk

_|‾|_|‾|_|‾|_|‾|_|‾|_

enable

__________|‾‾‾‾‾‾‾‾‾‾

count

000 001 010 011 100 101 110 111 000

done

_____________________________|‾|____
```

---

# Simulation

The behavioral simulation verifies:

- Reset operation
- Counter increment
- Counter reset after 8 bits
- Generation of the **done** signal

---

# Expected Behavior

```
Reset
   ↓
Enable Counter
   ↓
Count 8 Bits
   ↓
done = 1
   ↓
Counter Reset
```

---

# Applications

- I2C Master Controller
- SPI Controller
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
bit_counter/
│── bit_counter.v
│── bit_counter_tb.v
│── waveform.png
│── rtl_schematic.png
└── README.md
```

---

# Results

- ✔ Successfully counted transmitted bits.
- ✔ Generated the **done** signal after 8 bits.
- ✔ Behavioral simulation verified.
- ✔ RTL synthesis compatible.

---

# Future Enhancements

- Parameterizable counter width.
- Configurable bit count for different data widths.
- Overflow detection.
- Support for multi-byte data transfers.

---

