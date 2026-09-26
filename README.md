# GCD RTL Design & SystemVerilog Verification

A complete RTL design and functional verification project for calculating the Greatest Common Divisor (GCD) using Verilog and SystemVerilog.

---

## 📌 Project Overview

The Greatest Common Divisor (GCD) is the largest positive integer that divides two integers without leaving a remainder.

This project implements a hardware-based GCD calculator using the Euclidean Algorithm.

The project consists of two major parts:

1. GCD RTL Design
2. SystemVerilog Functional Verification

The RTL design uses registers, modulo/remainder logic, and an FSM-based control unit.

The SystemVerilog verification environment generates randomized inputs, drives them to the DUT, monitors the response, compares the DUT result with a reference model, and collects functional coverage.

---

## 🧮 GCD Algorithm

The project uses the Euclidean Algorithm.

The main equation is:

GCD(A, B) = GCD(B, A % B)

### Algorithm

1. Calculate the remainder:

   R = A % B

2. Update A:

   A = B

3. Update B:

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

## 🏗️ Hardware Architecture

The GCD hardware is divided into two major parts:

### 1. Datapath

The datapath stores and processes the data required for the GCD calculation.

Main components:

- A register
- B register
- Remainder register
- Modulo operation
- GCD result register

### 2. Control Unit

The control unit controls the sequence of operations using a Finite State Machine (FSM).

It controls:

- Loading of input values
- Remainder calculation
- Register updates
- Termination checking
- Final result generation

---

## 🔄 FSM Architecture

The GCD RTL uses an FSM to control the calculation.

### FSM Flow

IDLE → LOAD → CHECK → CALCULATE → UPDATE → CHECK

When B becomes zero:

CHECK → DONE

### State Description

#### IDLE

The DUT waits for the start signal.

#### LOAD

The input values A and B are loaded into internal registers.

#### CHECK

The FSM checks whether B is zero.

If:

B == 0

the calculation is complete and the FSM moves to DONE.

Otherwise, it moves to CALCULATE.

#### CALCULATE

The remainder is calculated:

R = A % B

#### UPDATE

The registers are updated:

A = B

B = R

The FSM then returns to CHECK.

#### DONE

The final GCD value is transferred to the output and the done signal is asserted.

---

## 🔌 RTL Interface

| Signal | Width | Description |
|--------|-------|-------------|
| clk | 1-bit | Clock signal |
| reset | 1-bit | Reset signal |
| start | 1-bit | Starts GCD calculation |
| A | 8-bit | First input operand |
| B | 8-bit | Second input operand |
| gcd | 8-bit | GCD result |
| busy | 1-bit | Indicates calculation in progress |
| done | 1-bit | Indicates calculation completion |

---

## 🧪 SystemVerilog Verification Architecture

The design is verified using a SystemVerilog testbench without UVM.

### Verification Flow

Generator  
↓  
Driver  
↓  
GCD DUT  
↓  
Monitor  
↓  
Scoreboard  
↓  
Functional Coverage

Mailboxes are used for communication between the verification components.

A virtual interface is used by the driver and monitor to communicate with the DUT interface.

---

## 🧩 Verification Components

### Packet

The packet represents a transaction.

Randomized inputs:

- start
- A
- B

Observed outputs:

- gcd
- busy
- done

### Generator

The generator creates randomized transaction packets and sends them to the driver through a mailbox.

### Driver

The driver receives transactions from the generator and drives the DUT inputs through a virtual interface.

### Monitor

The monitor observes the DUT signals and collects the input and output transaction information.

The monitored transaction is sent to the scoreboard and coverage components.

### Scoreboard

The scoreboard calculates the expected GCD using the Euclidean Algorithm as a reference model.

The expected result is compared with the DUT output.

If both match:

PASS

Otherwise:

FAIL

### Coverage

Functional coverage is used to measure whether the required input scenarios are exercised.

Coverage is implemented using SystemVerilog covergroups and coverpoints.

---

## 📊 Functional Coverage

The project includes functional coverage for:

### START

- start_0
- start_1

### A

- LOW: 0–10
- MEDIUM: 11–100
- HIGH: 101–255

### B

- LOW: 0–10
- MEDIUM: 11–100
- HIGH: 101–255

The implemented covergroup achieved:

100% Functional Coverage

The coverage report was generated using QuestaSim 2024.1.

---

## 📈 Simulation Results

The design was simulated using QuestaSim 2024.1.

The waveform verifies:

- Clock
- Reset
- Start
- A input
- B input
- GCD output
- Busy status
- Done status

Multiple GCD transactions were simulated and checked using the SystemVerilog scoreboard.

---

## 🏗️ SystemVerilog Verification Architecture

The verification environment contains:

Generator → Driver → DUT → Monitor → Scoreboard → Functional Coverage

### Components

- Generator
- Driver
- Monitor
- Scoreboard
- Coverage
- Environment
- Program
- Interface
- Packet

---

## 🛠️ Tools & Technologies

- Verilog
- SystemVerilog
- QuestaSim 2024.1
- GVIM
- Git
- GitHub

---

## 📁 Project Structure

GCD-RTL-SystemVerilog-Verification/

├── README.md  
├── gcd.v  
├── interface.sv  
├── packet.sv  
├── generator.sv  
├── driver.sv  
├── monitor.sv  
├── scoreboard.sv  
├── coverage.sv  
├── environment.sv  
├── program.sv  
├── tb.sv  
└── run.do

---

## ▶️ How to Run

### Step 1: Open QuestaSim

Open QuestaSim 2024.1 and navigate to the project directory.

### Step 2: Run the simulation

Execute:

do run.do

The run.do file compiles the RTL and SystemVerilog testbench and starts the simulation.

### Step 3: View Waveform

Open the Wave window and observe:

- clk
- reset
- start
- A
- B
- gcd
- busy
- done

### Step 4: View Coverage

Generate the QuestaSim coverage report after simulation.

---

## 📚 Project Documentation

The project documentation covers:

- GCD concept
- Euclidean Algorithm
- Hardware implementation
- Datapath
- Control Unit
- FSM
- RTL signals
- SystemVerilog verification architecture
- Generator
- Driver
- Monitor
- Scoreboard
- Functional Coverage

---

## 🚀 Future Improvements

Possible future improvements include:

- Adding SystemVerilog Assertions
- Adding cross coverage
- Adding more directed test scenarios
- Adding corner-case testing
- Supporting larger input widths
- Developing a UVM-based verification environment
- Adding automated regression testing

---

## 🎯 Key Learning Outcomes

This project helped in understanding:

- RTL design
- FSM-based control
- Datapath and control unit
- Verilog coding
- SystemVerilog classes
- Randomization
- Mailboxes
- Virtual interfaces
- Generator-Driver architecture
- Monitor
- Scoreboard
- Functional coverage
- Reference models
- QuestaSim simulation
- Waveform debugging

---

## 👨‍💻 Author

### Shyamprasad Koduru

B.Tech – Electronics and Communication Engineering

### Areas of Interest

- VLSI Design Verification
- SystemVerilog
- RTL Design
- Digital Design
- Semiconductor Hardware

---

## ⭐ Conclusion

This project demonstrates the complete flow from GCD algorithm to RTL implementation and SystemVerilog functional verification.

The overall project flow is:

GCD Algorithm  
↓  
RTL Design  
↓  
FSM + Datapath  
↓  
SystemVerilog Testbench  
↓  
Randomized Stimulus  
↓  
DUT  
↓  
Monitor  
↓  
Scoreboard  
↓  
Functional Coverage
