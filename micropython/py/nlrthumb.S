/*
 * This file is part of the Micro Python project, http://micropython.org/
 *
 * The MIT License (MIT)
 *
 * Copyright (c) 2013, 2014 Damien P. George
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#if !MICROPY_NLR_SETJMP && (defined(__thumb2__) || defined(__thumb__) || defined(__arm__))

// We only need the functions here if we are on arm/thumb, and we are not
// using setjmp/longjmp.
//
// For reference, arm/thumb callee save regs are:
//      r4-r11, r13=sp

    .syntax unified
    /*.cpu cortex-m4*/
    /*.thumb*/
    .text
    .align  2

/**************************************/
// mp_uint_t nlr_push(r0=nlr_buf_t *nlr)

    .global nlr_push
#if defined(__thumb2__)
    .thumb
    .thumb_func
#endif
    .type   nlr_push, %function
nlr_push:
    str     lr, [r0, #8]            @ store lr into nlr_buf
    str     r4, [r0, #12]           @ store r4 into nlr_buf
    str     r5, [r0, #16]           @ store r5 into nlr_buf
    str     r6, [r0, #20]           @ store r6 into nlr_buf
    str     r7, [r0, #24]           @ store r7 into nlr_buf
    str     r8, [r0, #28]           @ store r8 into nlr_buf
    str     r9, [r0, #32]           @ store r9 into nlr_buf
    str     r10, [r0, #36]          @ store r10 into nlr_buf
    str     r11, [r0, #40]          @ store r11 into nlr_buf
    str     r13, [r0, #44]          @ store r13=sp into nlr_buf

    ldr     r3, .L2                 @ load addr of nlr_top
    ldr     r2, [r3]                @ load nlr_top
    str     r2, [r0]                @ store nlr_top into nlr_buf
    str     r0, [r3]                @ store nlr_buf into nlr_top (to link list)

    movs    r0, #0                  @ return 0, normal return
    bx      lr                      @ return
    .align  2
.L2:
    .word   .LANCHOR0
    .size   nlr_push, .-nlr_push

/**************************************/
// void nlr_pop()

    .global nlr_pop
#if defined(__thumb2__)
    .thumb
    .thumb_func
#endif
    .type   nlr_pop, %function
nlr_pop:
    ldr     r3, .L5                 @ load addr of nlr_top
    ldr     r2, [r3]                @ load nlr_top
    ldr     r2, [r2]                @ load prev nlr_buf
    str     r2, [r3]                @ store prev nlr_buf to nlr_top (to unlink list)
    bx      lr                      @ return
    .align    2
.L5:
    .word    .LANCHOR0
    .size   nlr_pop, .-nlr_pop

/**************************************/
// void nlr_jump(r0=mp_uint_t val)

    .global nlr_jump
#if defined(__thumb2__)
    .thumb
    .thumb_func
#endif
    .type   nlr_jump, %function
nlr_jump:
    ldr     r3, .L2                 @ load addr of nlr_top
    ldr     r2, [r3]                @ load nlr_top
    cmp     r2, #0                  @ test if nlr_top is NULL
    beq     nlr_jump_fail           @ if nlr_top is NULL, transfer control to nlr_jump_fail
    str     r0, [r2, #4]            @ store return value
    ldr     r0, [r2]                @ load prev nlr_buf
    str     r0, [r3]                @ store prev nol_buf into nlr_top (to unlink list)

    ldr     lr, [r2, #8]            @ load lr from nlr_buf
    ldr     r4, [r2, #12]           @ load r4 from nlr_buf
    ldr     r5, [r2, #16]           @ load r5 from nlr_buf
    ldr     r6, [r2, #20]           @ load r6 from nlr_buf
    ldr     r7, [r2, #24]           @ load r7 from nlr_buf
    ldr     r8, [r2, #28]           @ load r8 from nlr_buf
    ldr     r9, [r2, #32]           @ load r9 from nlr_buf
    ldr     r10, [r2, #36]          @ load r10 from nlr_buf
    ldr     r11, [r2, #40]          @ load r11 from nlr_buf
    ldr     r13, [r2, #44]          @ load r13=sp from nlr_buf

    movs    r0, #1                  @ return 1, non-local return
    bx      lr                      @ return
    .align    2
.L6:
    .word    .LANCHOR0
    .size   nlr_jump, .-nlr_jump

/**************************************/
// local variable nlr_top

    .bss
    .align  2
    .set    .LANCHOR0,. + 0
    .type   nlr_top, %object
    .size   nlr_top, 4
nlr_top:
    .space  4

#endif // !MICROPY_NLR_SETJMP && (defined(__thumb2__) || defined(__thumb__) || defined(__arm__))
