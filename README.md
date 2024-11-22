# ICS3203-CAT2-Assembly

This repository contains solutions to CAT 2 tasks. The solutions demonstrate fundamental assembly programming concepts like control flow, array manipulation, modular programming, and port-based data monitoring.

## Repository Structure
- `task1.asm`: Control Flow and Conditional Logic
- `task2.asm`: Array Manipulation with Looping and Reversal
- `task3.asm`: Modular Program for Factorial Calculation
- `task4.asm`: Data Monitoring and Control Using Port-Based Simulation

---

## Task Summaries

### Task 1: Control Flow and Conditional Logic
- **Purpose**: Classifies a number as "POSITIVE," "NEGATIVE," or "ZERO" using conditional and unconditional jumps.
- **Instructions**:
  1. Compile: `nasm -f elf32 task1.asm`
  2. Link: `ld -m elf_i386 -o task1 task1.o`
  3. Run: `./task1`
- **Challenges**: Balancing simplicity and accuracy with branching logic.

### Task 2: Array Manipulation with Looping and Reversal
- **Purpose**: Reverses an array in place without using additional memory.
- **Instructions**:
  1. Compile: `nasm -f elf32 task2.asm`
  2. Link: `ld -m elf_i386 -o task2 task2.o`
  3. Run: `./task2`
- **Challenges**: Handling memory efficiently in a low-level language.

### Task 3: Modular Program for Factorial Calculation
- **Purpose**: Computes the factorial of a number using a subroutine and stack for modularity.
- **Instructions**:
  1. Compile: `nasm -f elf32 task3.asm`
  2. Link: `ld -m elf_i386 -o task3 task3.o`
  3. Run: `./task3`
- **Challenges**: Proper register management and stack manipulation.

### Task 4: Data Monitoring and Control Using Port-Based Simulation
- **Purpose**: Simulates a control program with sensor input to activate motors and alarms based on conditions.
- **Instructions**:
  1. Compile: `nasm -f elf32 task4.asm`
  2. Link: `ld -m elf_i386 -o task4 task4.o`
  3. Run: `./task4`
- **Challenges**: Simulating hardware behavior using assembly.

---

## Compilation and Running Instructions
1. Install NASM on your machine.
2. Compile each program using `nasm -f elf32 <filename>.asm`.
3. Link the compiled object file with `ld -m elf_i386 -o <output_name> <filename>.o`.
4. Run the executable using `./<output_name>`.

---

## Insights and Challenges
1. Balancing simplicity and clarity in assembly programs is tricky, as low-level programming lacks abstractions.
2. Managing memory efficiently is critical when working directly with registers and stack.
3. Understanding and simulating hardware behavior in software requires careful planning.
