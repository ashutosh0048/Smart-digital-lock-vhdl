# Smart-digital-lock-vhdl
VHDL-based secure digital lock system implemented on Basys 3 FPGA board
# Smart Digital Lock System Using VHDL

This project implements a secure **Smart Digital Lock System** using **VHDL**, designed to run on the **Basys 3 FPGA development board**. It allows users to enter a 4-digit password via a keypad, provides feedback through a 7-segment display, and uses LEDs to indicate lock status. The system includes error handling for incorrect attempts and a master reset function.

---

## Features

- **4-digit password input** using a 4x4 matrix keypad
- **7-segment display** shows each entered digit
- **Wrong attempt alert** after 3 incorrect tries
- **Master reset** button to reset the system anytime
- **Lock status LEDs**:
  - Green (unlocked)
  - Red (locked)

---

## File Structure
| File | Description |
|------|-------------|
| [keypad.vhd]) | Scans matrix keypad input |
| [seven_segment_driver.vhd]| Drives the 7-segment display |
| [lock_control.vhd] | Lock logic: password check, resets, alerts |
| [top_module.vhd]| Top-level module connecting all others |
| [tb_top_module.vhd] | Testbench to simulate behavior |
| [constraints.xdc] | Pin mapping for Basys 3 FPGA |
| ![diagram.png] | System architecture diagram |

|

## Hardware Requirements

- Digilent **Basys 3 FPGA** (Artix-7)
- **4x4 Matrix Keypad**
- **7-Segment Display** (onboard)
- **LEDs** and **Reset Button** (onboard)

---

## Simulation Instructions

1. Open Vivado.
2. Add all VHDL files and set `tb_top_module.vhd` as the top module.
3. Run **Behavioral Simulation**.
4. Observe:
   - `seg` signal for display
   - `lock_led` for lock status

You’ll see the password being entered and validated. After 3 wrong attempts, the system locks out.

---

## FPGA Deployment

1. Create a new Vivado project for Basys 3.
2. Add all VHDL source files.
3. Include `constraints.xdc` to apply correct pin mappings.
4. Set `top_module.vhd` as top module.
5. Run synthesis and implementation.
6. Generate and load the bitstream onto the board.

---

## Pin Mapping (Basys 3)

| Signal         | Pins       |
|----------------|------------|
| Clock (`clk`)  | W5         |
| Reset          | U18        |
| `row[3:0]`     | T9, T10, T11, T14 |
| `col[3:0]`     | U14, V14, V13, V12 |
| `seg[6:0]`     | W7, W6, V6, U8, V8, U5, V5 |
| `lock_led[1:0]`| U16, E19   |

---

## System Diagram

![System Diagram](src/diagram.png
