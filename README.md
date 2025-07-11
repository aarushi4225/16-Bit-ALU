# Basic 16-Bit Arithmetic Logic Unit (ALU)

This repository contains the Verilog HDL design and a testbench for a basic 8-bit Arithmetic Logic Unit (ALU) with a 16-bit output.

## 1. Overview

This project implements a fundamental building block of a CPU: an Arithmetic Logic Unit (ALU). It takes two 8-bit input operands (`A` and `B`), a 4-bit `sel` (selection) code to choose the operation, a clock signal (`clk`), and a reset signal (`rst`). The result of the operation is produced on a 16-bit output (`Z`).

## 2. Features

The ALU supports the following 16 operations, selected by the `sel` input:

| `sel` (Hex) | Operation       | Description                                  | Output `Z` Calculation (`A`, `B` are 8-bit, `Z` is 16-bit) |
| :---------- | :-------------- | :------------------------------------------- | :--------------------------------------------------------- |
| `4'h0`      | `ADD`           | Addition                                     | `A + B`                                                    |
| `4'h1`      | `SUB`           | Subtraction                                  | `A - B`                                                    |
| `4'h2`      | `MUL`           | Multiplication                               | `A * B`                                                    |
| `4'h3`      | `DIV`           | Division (Integer)                           | `A / B`                                                    |
| `4'h4`      | `SRA`           | Logical Right Shift of A by 1 bit            | `A >> 1`                                                   |
| `4'h5`      | `SLA`           | Logical Left Shift of A by 1 bit             | `A << 1`                                                   |
| `4'h6`      | `AND`           | Bitwise AND                                  | `A & B`                                                    |
| `4'h7`      | `OR`            | Bitwise OR                                   | `A \| B`                                                   |
| `4'h8`      | `XOR`           | Bitwise XOR                                  | `A ^ B`                                                    |
| `4'h9`      | `INV`           | Bitwise Inversion of A                       | `~A`                                                       |
| `4'hA`      | `XNOR`          | Bitwise XNOR                                 | `~(A ^ B)`                                                 |
| `4'hB`      | `NAND`          | Bitwise NAND                                 | `~(A & B)`                                                 |
| `4'hC`      | `RRA`           | Right Rotate of A by 1 bit                   | `{A[0], A[7:1]}`                                           |
| `4'hD`      | `RLA`           | Left Rotate of A by 1 bit                    | `{A[6:0], A[7]}`                                           |
| `4'hE`      | `GT`            | Greater Than (A > B)                         | `16'd1` if A > B, else `16'd0`                             |
| `4'hF`      | `EQ`            | Equal To (A == B)                            | `16'd1` if A == B, else `16'd0`                            |

## 3. Files Included

* **`alu.v`**: The Verilog HDL source code for the ALU module.
* **`alu_tb.sv`**: The SystemVerilog testbench for simulating and verifying the `alu.v` module.

## 4. Design Details

* **Inputs:**
    * `A` (8-bit): First operand.
    * `B` (8-bit): Second operand.
    * `sel` (4-bit): Operation selection code.
    * `clk` (1-bit): Clock signal for synchronous operations.
    * `rst` (1-bit): Synchronous, active-high reset signal.
* **Output:**
    * `Z` (16-bit): The result of the selected operation.
* **Reset Logic:** The `Z` output is reset to `16'h0000` when `rst` is high (`1`), synchronous to the positive edge of `clk`.
* **Clocking:** All operations are synchronous and update on the positive edge of the `clk` signal.
