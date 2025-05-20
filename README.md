<!-- 
  SPDX-FileCopyrightText: 2025 Dom Rodriguez <shymega@shymega.org.uk>

  SPDX-License-Identifier: GPL-3.0-only
-->

RV-DOS
======

RV-DOS is a RISC-V operating system, which is designed to be DOS-like in
structure, and allowing for emulation of DOS programs on a RISC-V platform.

### Core system.

- Microkernel
  - Minimalist microkernel.
    - Perform an minimal amount of functions in kernel-space as possible.
    - Try to perform all functions in user-space.
    - WASM extensions for kernel-space.
    - WASM extensions are loaded into the kernel-space, and run in
      a sandboxed environment.
   - Aim for nearly all of the kernel to be written in [Rust][rust].
    - With exceptions for low-level components, which cannot be
      written in Rust.
    - Non-Rust components **must** be thread-safe *and* thoroughly
      tested continously.
- DOS emulation layer
    - This is a layer which allows for DOS programs to run on RV-DOS. It uses
    the microkernel to present a DOS-like environment, translating register
    access and syscalls to the RV-DOS kernel as required by DOS programs.
- AC²N - artifical CPU clock nerfing.
    - This is to allow for a more accurate emulation of DOS programs.
- Filesystem:
    - akin to FAT32.
- License: GPL-3.0-only.

[rust]: https://www.rust-lang.org
