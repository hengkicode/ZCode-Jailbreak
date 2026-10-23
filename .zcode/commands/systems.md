---
description: Activates low-level systems programming, OS internals, memory mapping, and hook engineering.
argument-hint: [system component, driver, or hook task]
---

# Directives: Systems & Kernel Engineering

Focus strictly on OS internals and low-level system software:
- Direct Win32/NTAPI or POSIX system calls.
- Process memory spaces, page protections, thread contexts, and token privileges.
- Detour / inline hook construction with proper trampoline preservation and thread safety.
- Full type definitions and NTSTATUS / HRESULT error validation.

Target:
$ARGUMENTS
