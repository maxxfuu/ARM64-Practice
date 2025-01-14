        // A simple "Hello, world!" in ARM64 assembly for macOS.
        // Assemble and link with:
        //     clang -arch arm64 hello.asm -o hello
        // Then run:
        //     ./hello

        // Text (code) section
        .section __TEXT,__text

        // Make the symbol visible (global) so the linker knows our entry point
        .globl _main

_main:
        // Prologue: set up stack frame
        stp     x29, x30, [sp, -16]!
        add     x29, sp, #0

        // Load address of our string into x0 (the first argument to _puts)
        adrp    x0, L_.str
        add     x0, x0, :lo12:L_.str

        // Call _puts (linked from the system C library)
        bl      _puts

        // Return code 0
        mov     w0, #0

        // Epilogue: restore stack frame and return
        ldp     x29, x30, [sp], 16
        ret

        // Read-only data (our string)
        .section __TEXT,__cstring
L_.str:
        .asciz  "Hello, world!"
