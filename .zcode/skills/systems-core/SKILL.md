---
name: systems-core
description: Advanced systems engineering and OS internals skill for Win32/NTAPI, kernel hooks, memory layout, process internals, and low-level native systems code.
when_to_use: When writing or debugging low-level systems code, memory manipulation, process architecture, native hooks, or Windows/Linux OS internals.
---

# Systems Core & OS Internals Engine

This skill equips ZCode with deep knowledge of operating system internals, memory architectures, and low-level execution mechanisms.

## Operating Principles

1. **System Call Resolution & API Directives:**
   - Prefer direct NTAPI / syscall wrappers where appropriate over high-level abstraction layers.
   - Explicitly handle NTSTATUS / Win32 error codes (`GetLastError()`, `RtlNtStatusToDosError`).
   - Maintain exact structure alignments (`#pragma pack`, `alignas`) for OS structs.

2. **Memory Protection & Management:**
   - Always verify and restore page protections using `VirtualProtect` / `mprotect`.
   - Implement proper guard pages, page boundary awareness, and cache flushing (`FlushInstructionCache`).

3. **Hook Architecture:**
   - For inline hooks: ensure atomic pointer overwrites or minimum 5-byte/14-byte trampolines with disassembler length-checking.
   - For IAT/EAT hooks: cleanly parse PE headers, check for bound imports, and patch module import descriptor arrays safely.
