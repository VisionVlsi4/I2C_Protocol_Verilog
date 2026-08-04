# I2C Master Finite State Machine (FSM)

## Overview

The **I2C Master FSM** is the control unit of the I2C Master Controller. It coordinates the complete communication process by controlling the sequence of operations required for data transmission over the I2C bus.

The FSM generates the control signals required by other modules such as the Shift Register, ACK Detector, Bit Counter, and SCL/SDA Controller.

---

## Objective

- Control the complete I2C write transaction.
- Generate START and STOP conditions.
- Control data shifting.
- Check acknowledgment from the slave.
- Indicate transaction completion.

---

## Features

- Modular RTL design
- Synchronous state transitions
- Active-high reset
- Controls complete I2C transaction
- Synthesizable Verilog HDL
- Compatible with Xilinx Vivado

---

# FSM State Diagram

```
                +------+
                | IDLE |
                +------+
                    |
              start_tx = 1
                    |
                    ▼
               +---------+
               | START   |
               +---------+
                    |
                    ▼
          +----------------+
          | SEND_ADDRESS   |
          +----------------+
                    |
             bit_done = 1
                    |
                    ▼
               +---------+
               | ACK1    |
               +---------+
                    |
         ack_received = 1
                    |
                    ▼
            +---------------+
            | SEND_DATA     |
            +---------------+
                    |
             bit_done = 1
                    |
                    ▼
               +---------+
               | ACK2    |
               +---------+
                    |
                    ▼
                +--------+
                | STOP   |
                +--------+
                    |
                    ▼
                +------+
                | IDLE |
                +------+
```

---

# Block Diagram

```
                    +---------------------------+
start_tx ---------->|                           |
bit_done ---------->|       I2C Master FSM      |
ack_received ------>|                           |
clk --------------->|                           |
rst --------------->|                           |
                    +---------------------------+
                           |
        ------------------------------------------------
        |        |          |          |         |      |
        ▼        ▼          ▼          ▼         ▼      ▼
 load_shift shift_enable start_condition stop_condition check_ack
                              busy                done
```

---

# Module Ports

## Inputs

| Signal | Width | Description |
|---------|------|-------------|
| clk | 1 | System clock |
| rst | 1 | Active-high reset |
| start_tx | 1 | Starts the I2C transaction |
| bit_done | 1 | Indicates completion of 8-bit transmission |
| ack_received | 1 | Indicates ACK received from slave |

---

## Outputs

| Signal | Width | Description |
|---------|------|-------------|
| load_shift | 1 | Loads data into shift register |
| shift_enable | 1 | Enables serial shifting |
| start_condition | 1 | Generates START condition |
| stop_condition | 1 | Generates STOP condition |
| check_ack | 1 | Enables ACK detection |
| busy | 1 | Indicates transaction in progress |
| done | 1 | Indicates transaction completed |

---

# State Description

### IDLE

- Waits for `start_tx`
- `busy = 0`

---

### START

- Generates the START condition.
- Loads the transmit data into the shift register.

---

### SEND_ADDRESS

- Enables shifting of the slave address.
- Waits until all bits are transmitted.

---

### ACK1

- Checks for acknowledgment after the address transmission.

---

### SEND_DATA

- Enables shifting of the data byte.

---

### ACK2

- Checks for acknowledgment after data transmission.

---

### STOP

- Generates the STOP condition.
- Asserts the `done` signal.
- Returns to the IDLE state.

---

# Working Principle

1. The FSM starts in the **IDLE** state.
2. When `start_tx` is asserted, it moves to the **START** state.
3. The transmit data is loaded into the Shift Register.
4. The FSM enables serial transmission of the address and data.
5. After each byte, it checks for an ACK from the slave.
6. Once the transaction is complete, it generates the STOP condition.
7. The `done` signal is asserted and the FSM returns to the **IDLE** state.

---

# Simulation

The behavioral simulation verifies:

- Correct state transitions
- START generation
- Address transmission control
- ACK detection
- Data transmission control
- STOP generation
- Transaction completion

---

# Expected Output Sequence

```
IDLE
   ↓
START
   ↓
SEND_ADDRESS
   ↓
ACK1
   ↓
SEND_DATA
   ↓
ACK2
   ↓
STOP
   ↓
DONE
```

---

# Tools Used

- Verilog HDL
- Xilinx Vivado 2023.2
- Behavioral Simulation

---

# Folder Structure

```
i2c_master_fsm/
│── i2c_master_fsm.v
│── i2c_master_fsm_tb.v
│── waveform.png
│── rtl_schematic.png
└── README.md
```

---

# Results

- ✔ FSM successfully controls the I2C transaction.
- ✔ Correct state transitions verified.
- ✔ START and STOP conditions generated.
- ✔ Data shifting controlled successfully.
- ✔ Behavioral simulation completed successfully.

---

# Future Enhancements

- Read transaction support
- Repeated START condition
- Multi-byte transfer
- Clock stretching support
- Multi-master arbitration
- Full I2C protocol compliance

---


