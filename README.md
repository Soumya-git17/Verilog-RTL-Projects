# Verilog HDL – Digital & FPGA-Oriented Design Portfolio

This repository is some of my hands-on experience with **digital electronics,
RTL design, and FPGA-oriented hardware development**.

The projects span **combinational logic, arithmetic datapaths,
sequential circuits, finite state machines (FSMs), and basic
architectural blocks**, with an emphasis on **clean, synthesizable
Verilog and verification through simulation**.

---

## 🔧 Tools & Workflow

- **HDL:** Verilog (RTL level)
- **Simulation:** Icarus Verilog
- **Waveform Analysis:** GTKWave (`.vcd`)
- **Verification:** Module-specific testbenches
- **Design Principles:**
  - Modular and hierarchical RTL
  - Synchronous design with clock and reset
  - FPGA-synthesis–friendly coding style

---

## 📁 Repository Structure

- ├── 1_Combinational
- ├── 2_Arithmatic_datapath
- ├── 3_Sequential
- ├── 4_FSM
- ├── 5_Architecture
- └── README.md


Each project directory typically includes:
- RTL source file(s) (`.v`)
- Corresponding testbench (`_tb.v`)
- Simulation outputs (`.vcd`, `.vvp`)

---

## 🧩 Project Categories

### 🔹 Combinational Logic (`Combinational`)
Foundational digital building blocks focused on Boolean logic,
comparison, encoding, and display decoding.

Representative designs:
- Basic logic gates
- 4-bit magnitude comparator
- Priority encoder
- BCD to 7-segment display decoder

---

### 🔹 Arithmetic & Datapath Blocks (`DatapathBlocks`)
Core processing elements commonly used in CPU datapaths and
digital signal processing systems.

Representative designs:
- 8-bit ALU
- Carry Look-Ahead Adder
- Booth Multiplier
- Vedic Multiplier
- Barrel Shifter

These modules emphasize parallelism, performance, and structured datapath design.

---

### 🔹 Sequential Circuits (`Sequential`)
Clocked logic designs demonstrating timing behavior, state retention,
and control mechanisms.

Representative designs:
- D Flip-Flop
- MOD-N Counter
- Even Frequency Divider
- Linear Feedback Shift Register (LFSR)
- Watchdog Timer

---

### 🔹 FSM & Control Logic (`FSM`)
Finite State Machine–based designs focusing on control-path modeling
and sequence detection.

Representative designs:
- Sequence counter (0110)
- Two-sequence detector (FSM-based)

---

### 🔹 Architecture-Level Design (`Architecture`)
System-level digital components used in processors and embedded systems.

Representative design:
- 16×16 Register File

This section reflects architectural thinking beyond individual logic blocks.

---

## ✅ Highlights

- RTL-level design using Verilog HDL
- Strong coverage of combinational, sequential, and FSM logic
- Datapath and architectural block implementation
- Verification-driven development using testbenches and waveforms
- Designs written with FPGA synthesis considerations in mind

---

## 👤 Author

**Soumyadip Dutta**  

---


