# MIPS-CPU-Design
This project involves the creation of a single-cycle MIPS CPU design using Verilog. The single-cycle microarchitecture is characterized by executing an entire instruction in one clock cycle. The project delves into the intricacies of designing and implementing a simplified MIPS CPU, providing insights into its fundamental components and their interactions.
## Table of Contents
- Introduction
- Project Overview
- Features
- Getting Started
- Conclusion

## Introduction
This repository contains the implementation of a simple single-cycle and multi-cycle MIPS CPU design in VHDL. The designs are discussed in detail, and they were developed as part of the Computer Architecture course.

## Project Overview
### 1. 4-bit Sequential Adder
The 4-bit sequential adder project focuses on building a basic two's complement adder. It explores the internal structure of the adder, including the controller and state machine used for the addition algorithm.

#### Design
The controller houses a state machine with a counter that manages the three steps of the addition algorithm.

#### Architecture
The `sequential_adder.vhd` architecture consists of five process sections:
- SIPO: Reads the A input serially and converts it to parallel after four clock cycles.
- REG: Loads the B input into the system upon receiving a signal from the controller.
- PISO: Outputs the C register serially, governed by the controller signals.
- FSM_COMB: Governs the behavior of the sequential adder based on the algorithm.
- FSM_SEQ: Advances the algorithm states with each rising edge of the clock.

### 2. 32-Bit MIPS ALU Design
The 32-Bit MIPS ALU project focuses on implementing an ALU capable of performing arithmetic and logic operations. It discusses the various operations, such as addition, subtraction, logical AND/OR, and provides insight into the control signals.

#### Design
The ALU is divided into several units to handle different operations: Add-Sub Unit, Comparison Unit, Logical Unit, and Shift/Rotate Unit.

#### Specifications
The ALU has different units for various operations:
- Add-Sub Unit: Performs additions and subtractions with flags for carry, zero, and overflow.
- Comparison Unit: Handles comparisons like equal, not equal, greater or equal, and less than.
- Logical Unit: Executes logical AND, OR, NOR, and XOR operations.
- Shift/Rotate Unit: Performs shifts and rotations on operands.

### 3. Single Cycle CPU Design
In this project, a single-cycle MIPS CPU was implemented. Note that this project might have issues and may not work properly.

#### Single-cycle CPU Description
The single-cycle microarchitecture executes instructions in one cycle, with the cycle time determined by the slowest instruction. The design consists of a datapath and a control unit, interacting to process instructions.

#### Key Components
- Program Counter: Keeps track of the current instruction's address.
- Instruction Memory: Stores and reads instructions.
- Register File: Manages registers for data storage.
- Data Memory: Handles data read and write operations.
- Multiplexers: Selects input sources based on control signals.
- ALU: Performs arithmetic and logical operations.
- Datapath Components: Includes adder, shift unit, and ALU.
- Control Unit: Generates control signals for datapath operations.

## Features
- Implementation of a 4-bit sequential adder.
- Design and explanation of a 32-bit MIPS ALU.
- Implementation and exploration of a single-cycle MIPS CPU.

## Getting Started
To explore the projects, you can clone the repository and review the Verilog code and associated explanations.

## Conclusion
This repository showcases the implementation of simple CPU components and designs, offering insights into different aspects of computer architecture.

Feel free to explore the code and explanations provided in each project's section for a deeper understanding.
