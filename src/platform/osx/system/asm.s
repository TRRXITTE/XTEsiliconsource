.globl _setmcontext
_setmcontext:
    ldr	x1, [x0, #16]     // Load context from x0+16 into x1 (rsi)
    ldr	x2, [x0, #24]     // Load context from x0+24 into x2 (rdx)
    ldr	x3, [x0, #32]     // Load context from x0+32 into x3 (rcx)
    ldr	x4, [x0, #40]     // Load context from x0+40 into x4 (r8)
    ldr	x5, [x0, #48]     // Load context from x0+48 into x5 (r9)
    ldr	x6, [x0, #56]     // Load context from x0+56 into x6 (rax)
    ldr	x7, [x0, #64]     // Load context from x0+64 into x7 (rbx)
    ldr	x8, [x0, #72]     // Load context from x0+72 into x8 (rbp)
    ldr	x9, [x0, #80]     // Load context from x0+80 into x9 (r10)
    ldr	x10, [x0, #88]    // Load context from x0+88 into x10 (r11)
    ldr	x11, [x0, #96]    // Load context from x0+96 into x11 (r12)
    ldr	x12, [x0, #104]   // Load context from x0+104 into x12 (r13)
    ldr	x13, [x0, #112]   // Load context from x0+112 into x13 (r14)
    ldr	x14, [x0, #120]   // Load context from x0+120 into x14 (r15)
    ldr	x15, [x0, #160]   // Load context from x0+160 into x15 (rip)
    ldr	x0, [x0, #8]      // Load context from x0+8 into x0 (rdi)
    ret

.globl _getmcontext
_getmcontext:
    str	x1, [x0, #8]      // Store x1 into context at x0+8 (rdi)
    str	x2, [x0, #16]     // Store x2 into context at x0+16 (rsi)
    str	x3, [x0, #24]     // Store x3 into context at x0+24 (rdx)
    str	x4, [x0, #32]     // Store x4 into context at x0+32 (rcx)
    str	x5, [x0, #40]     // Store x5 into context at x0+40 (r8)
    str	x6, [x0, #48]     // Store x6 into context at x0+48 (r9)
    mov	x7, #1            // Move 1 into x7 (rax)
    str	x7, [x0, #56]     // Store x7 into context at x0+56 (rax)
    str	x8, [x0, #64]     // Store x8 into context at x0+64 (rbx)
    str	x9, [x0, #72]     // Store x9 into context at x0+72 (rbp)
    str	x10, [x0, #80]    // Store x10 into context at x0+80 (r10)
    str	x11, [x0, #88]    // Store x11 into context at x0+88 (r11)
    str	x12, [x0, #96]    // Store x12 into context at x0+96 (r12)
    str	x13, [x0, #104]   // Store x13 into context at x0+104 (r13)
    str	x14, [x0, #112]   // Store x14 into context at x0+112 (r14)
    str	x15, [x0, #120]   // Store x15 into context at x0+120 (r15)

    // Save the stack pointer as part of the context (indirectly)
    mov     x16, sp          // Move the stack pointer into x16
    str     x16, [x0, #184] // Store x16 into context at x0+184 (rsp)

    // Load the value from the stack (indirectly)
    ldr     x2, [x0, #32]   // Restore x2 from context at x0+32 (rcx)

    mov     x0, #0          // Move 0 into x0 (rax)
    ret
