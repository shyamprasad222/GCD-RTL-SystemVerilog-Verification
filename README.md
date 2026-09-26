# GCD RTL Design & SystemVerilog Verification

## Project Overview

This project implements a **Greatest Common Divisor (GCD)** hardware accelerator using **Verilog RTL** and verifies the design using a **SystemVerilog testbench**.

The GCD calculation is based on the **Euclidean Algorithm**. The RTL design uses registers, modulo operation, and an FSM-based control unit to perform the calculation sequentially.

## GCD Algorithm

For two input values A and B:

```text
R = A % B
A = B
B = R
