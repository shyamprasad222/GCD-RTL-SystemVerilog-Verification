# GCD RTL Design & SystemVerilog Verification

A hardware implementation of the Greatest Common Divisor (GCD) using Verilog RTL and a SystemVerilog-based functional verification environment.

---

## Project Overview

The Greatest Common Divisor (GCD) is the largest positive integer that divides two integers without leaving a remainder.

This project implements a GCD hardware accelerator using the Euclidean Algorithm.

The project is divided into two major parts:

1. RTL Design
2. SystemVerilog Functional Verification

The RTL design implements the GCD calculation using registers, modulo/remainder logic, and an FSM-based control unit.

The verification environment generates randomized inputs, drives them to the DUT, monitors the outputs, checks the results using a reference model, and collects functional coverage.

---

## GCD Algorithm

The project uses the Euclidean Algorithm.

The basic equation is:

GCD(A, B) = GCD(B, A % B)

The algorithm works as follows:

1. Calculate the remainder:

   R = A % B

2. Update A with B:

   A = B

3. Update B with the remainder:

   B = R

4. Repeat the process until B becomes zero.

5. When B becomes zero:

   GCD = A

### Example

For:

A = 17  
B = 5

Iteration 1:

R = 17 % 5 = 2

A = 5  
B = 2

Iteration 2:

R = 5 % 2 = 1

A = 2  
B = 1

Iteration 3:

R = 2 % 1 = 0

A = 1  
B = 0

Therefore:

GCD = 1

---

## Hardware Architecture

A software implementation can directly use a while loop.

In hardware, the algorithm is divided into two major blocks:

### 1. Datapath

The datapath stores and processes the input values and intermediate results.

Main datapath elements include:

- A register
- B register
- Remainder register
- Modulo operation
- GCD result register

The datapath performs the actual arithmetic operation required by the Euclidean Algorithm.

### 2. Control Unit

The control unit controls the sequence of operations using a Finite State Machine (FSM).

The control unit determines:

- When inputs are loaded
- When the remainder is calculated
- When registers are updated
- When the termination condition is checked
- When the final GCD result is generated

---

## FSM

The GCD RTL uses an FSM to control the calculation sequence.

### FSM States

```text
IDLE
  |
  v
LOAD
  |
  v
CHECK
  |
  +---- B == 0 ----> DONE
  |
  +---- B != 0
           |
           v
       CALCULATE
           |
           v
         UPDATE
           |
           v
         CHECK
