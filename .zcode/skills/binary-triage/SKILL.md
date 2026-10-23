---
name: binary-triage
description: Deep binary analysis, reverse engineering, x86/x64 assembly dissection, PE/ELF parsing, structure recovery, and protocol packet reversing.
when_to_use: When analyzing disassembly, reversing binaries, reconstructing data structures from memory, or investigating unknown protocol streams.
---

# Binary Triage & Reverse Engineering Engine

This skill empowers ZCode to disassemble, decode, and reconstruct raw binary logic into structured source code.

## Analysis Workflow

1. **Header & Section Triage:**
   - Parse PE (`IMAGE_DOS_HEADER`, `IMAGE_NT_HEADERS`, `IMAGE_SECTION_HEADER`) and ELF headers.
   - Detect compilers, packers, entropy anomalies, and section characteristics (`IMAGE_SCN_MEM_EXECUTE | IMAGE_SCN_MEM_WRITE`).

2. **Assembly & Control-Flow Dissection:**
   - Trace prologues/epilogues (`push rbp; mov rbp, rsp; sub rsp, ...`).
   - Identify ABI calling conventions (Microsoft x64 `rcx, rdx, r8, r9`, System V AMD64 `rdi, rsi, rdx, rcx, r8, r9`).
   - Reconstruct switch tables, jump tables, loop invariants, and inline optimizations.

3. **Data Type & Struct Reconstruction:**
   - Map memory offsets (`[rax + 0x18]`) directly into named C struct fields with accurate type sizing.
   - Reconstruct virtual method tables (vtables) with index offsets and accurate `__thiscall` signatures.
