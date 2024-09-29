	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 0
	.globl	_initFood                       ; -- Begin function initFood
	.p2align	2
_initFood:                              ; @initFood
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	str	xzr, [sp, #24]
	str	xzr, [sp, #32]
	str	xzr, [sp, #40]
	str	wzr, [sp, #20]
	str	wzr, [sp, #16]
	adrp	x8, _stdscr@GOTPAGE
	ldr	x8, [x8, _stdscr@GOTPAGEOFF]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	x0, [x8]
	bl	_getmaxy
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	str	w0, [sp, #20]
	ldr	x0, [x8]
	bl	_getmaxx
	str	w0, [sp, #16]
	str	xzr, [sp, #8]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #8]
	ldur	x9, [x29, #-16]
	subs	x8, x8, x9
	cset	w8, hs
	tbnz	w8, #0, LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	x8, [x29, #-8]
	ldr	x9, [sp, #8]
	mov	x10, #24                        ; =0x18
	mul	x9, x9, x10
	add	x9, x8, x9
	ldur	q0, [sp, #24]
	str	q0, [x9]
	ldr	x8, [sp, #40]
	str	x8, [x9, #16]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]
	add	x8, x8, #1
	str	x8, [sp, #8]
	b	LBB0_1
LBB0_4:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_initTail                       ; -- Begin function initTail
	.p2align	2
_initTail:                              ; @initTail
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	xzr, [sp, #8]
	str	xzr, [sp]
	b	LBB1_1
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp]
	ldr	x9, [sp, #16]
	subs	x8, x8, x9
	cset	w8, hs
	tbnz	w8, #0, LBB1_4
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	x9, [sp, #24]
	ldr	x10, [sp]
	ldr	x8, [sp, #8]
	str	x8, [x9, x10, lsl #3]
	b	LBB1_3
LBB1_3:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [sp]
	add	x8, x8, #1
	str	x8, [sp]
	b	LBB1_1
LBB1_4:
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_initHead                       ; -- Begin function initHead
	.p2align	2
_initHead:                              ; @initHead
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	str	w2, [sp]
	ldr	w8, [sp, #4]
	ldr	x9, [sp, #8]
	str	w8, [x9]
	ldr	w8, [sp]
	ldr	x9, [sp, #8]
	str	w8, [x9, #4]
	ldr	x9, [sp, #8]
	mov	w8, #2                          ; =0x2
	str	w8, [x9, #16]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_initSnake                      ; -- Begin function initSnake
	.p2align	2
_initSnake:                             ; @initSnake
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	w2, [sp, #12]
	str	w3, [sp, #8]
	mov	x0, #800                        ; =0x320
	bl	_malloc
	str	x0, [sp]
	ldr	x0, [sp]
	mov	x1, #100                        ; =0x64
	bl	_initTail
	ldur	x0, [x29, #-8]
	ldr	w1, [sp, #12]
	ldr	w2, [sp, #8]
	bl	_initHead
	ldr	x8, [sp]
	ldur	x9, [x29, #-8]
	str	x8, [x9, #24]
	ldr	x8, [sp, #16]
	add	x8, x8, #1
	ldur	x9, [x29, #-8]
	str	x8, [x9, #8]
	ldur	x9, [x29, #-8]
	adrp	x8, _default_controls@PAGE
	add	x8, x8, _default_controls@PAGEOFF
	str	x8, [x9, #32]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_putFoodSeed                    ; -- Begin function putFoodSeed
	.p2align	2
_putFoodSeed:                           ; @putFoodSeed
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	wzr, [x29, #-12]
	stur	wzr, [x29, #-16]
	sub	x8, x29, #18
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	sturh	wzr, [x29, #-18]
	adrp	x8, _stdscr@GOTPAGE
	ldr	x8, [x8, _stdscr@GOTPAGEOFF]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x0, [x8]
	bl	_getmaxy
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	stur	w0, [x29, #-16]
	ldr	x0, [x8]
	bl	_getmaxx
	stur	w0, [x29, #-12]
	ldur	x8, [x29, #-8]
	ldr	w0, [x8, #4]
	ldur	x8, [x29, #-8]
	ldr	w1, [x8]
	adrp	x2, l_.str@PAGE
	add	x2, x2, l_.str@PAGEOFF
	bl	_mvprintw$NCURSES60
	bl	_rand
	ldur	w8, [x29, #-12]
	subs	w9, w8, #1
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	ldur	x9, [x29, #-8]
	str	w8, [x9]
	bl	_rand
	ldur	w8, [x29, #-16]
	subs	w9, w8, #2
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #1
	ldur	x9, [x29, #-8]
	str	w8, [x9, #4]
	mov	x0, #0                          ; =0x0
	bl	_time
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x9, [x29, #-8]
	str	x0, [x9, #8]
	ldur	x10, [x29, #-8]
	mov	w9, #36                         ; =0x24
	strb	w9, [x10, #16]
	ldur	x10, [x29, #-8]
	mov	w9, #1                          ; =0x1
	strb	w9, [x10, #17]
	ldur	x9, [x29, #-8]
	ldrb	w9, [x9, #16]
	sturb	w9, [x29, #-18]
	ldur	x9, [x29, #-8]
	ldr	w0, [x9, #4]
	ldur	x9, [x29, #-8]
	ldr	w1, [x9]
	mov	x9, sp
	str	x8, [x9]
	adrp	x2, l_.str.1@PAGE
	add	x2, x2, l_.str.1@PAGEOFF
	bl	_mvprintw$NCURSES60
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_putFood                        ; -- Begin function putFood
	.p2align	2
_putFood:                               ; @putFood
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	xzr, [sp, #8]
	b	LBB5_1
LBB5_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #8]
	ldr	x9, [sp, #16]
	subs	x8, x8, x9
	cset	w8, hs
	tbnz	w8, #0, LBB5_4
	b	LBB5_2
LBB5_2:                                 ;   in Loop: Header=BB5_1 Depth=1
	ldur	x8, [x29, #-8]
	ldr	x9, [sp, #8]
	mov	x10, #24                        ; =0x18
	mul	x9, x9, x10
	add	x0, x8, x9
	bl	_putFoodSeed
	b	LBB5_3
LBB5_3:                                 ;   in Loop: Header=BB5_1 Depth=1
	ldr	x8, [sp, #8]
	add	x8, x8, #1
	str	x8, [sp, #8]
	b	LBB5_1
LBB5_4:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_refreshFood                    ; -- Begin function refreshFood
	.p2align	2
_refreshFood:                           ; @refreshFood
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	w1, [x29, #-12]
	stur	wzr, [x29, #-16]
	stur	wzr, [x29, #-20]
	sturh	wzr, [x29, #-22]
	adrp	x8, _stdscr@GOTPAGE
	ldr	x8, [x8, _stdscr@GOTPAGEOFF]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x0, [x8]
	bl	_getmaxy
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	stur	w0, [x29, #-20]
	ldr	x0, [x8]
	bl	_getmaxx
	stur	w0, [x29, #-16]
	str	xzr, [sp, #16]
	b	LBB6_1
LBB6_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #16]
	ldursw	x9, [x29, #-12]
	subs	x8, x8, x9
	cset	w8, hs
	tbnz	w8, #0, LBB6_9
	b	LBB6_2
LBB6_2:                                 ;   in Loop: Header=BB6_1 Depth=1
	ldur	x8, [x29, #-8]
	ldr	x9, [sp, #16]
	mov	x10, #24                        ; =0x18
	mul	x9, x9, x10
	add	x8, x8, x9
	ldr	x8, [x8, #8]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB6_7
	b	LBB6_3
LBB6_3:                                 ;   in Loop: Header=BB6_1 Depth=1
	ldur	x8, [x29, #-8]
	ldr	x9, [sp, #16]
	mov	x10, #24                        ; =0x18
	mul	x9, x9, x10
	add	x8, x8, x9
	ldrb	w8, [x8, #17]
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB6_5
	b	LBB6_4
LBB6_4:                                 ;   in Loop: Header=BB6_1 Depth=1
	mov	x0, #0                          ; =0x0
	bl	_time
	ldur	x8, [x29, #-8]
	ldr	x9, [sp, #16]
	mov	x10, #24                        ; =0x18
	mul	x9, x9, x10
	add	x8, x8, x9
	ldr	x8, [x8, #8]
	subs	x8, x0, x8
	subs	x8, x8, #10
	cset	w8, le
	tbnz	w8, #0, LBB6_6
	b	LBB6_5
LBB6_5:                                 ;   in Loop: Header=BB6_1 Depth=1
	ldur	x8, [x29, #-8]
	ldr	x9, [sp, #16]
	mov	x10, #24                        ; =0x18
	mul	x9, x9, x10
	add	x0, x8, x9
	bl	_putFoodSeed
	b	LBB6_6
LBB6_6:                                 ;   in Loop: Header=BB6_1 Depth=1
	b	LBB6_7
LBB6_7:                                 ;   in Loop: Header=BB6_1 Depth=1
	b	LBB6_8
LBB6_8:                                 ;   in Loop: Header=BB6_1 Depth=1
	ldr	x8, [sp, #16]
	add	x8, x8, #1
	str	x8, [sp, #16]
	b	LBB6_1
LBB6_9:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_haveEat                        ; -- Begin function haveEat
	.p2align	2
_haveEat:                               ; @haveEat
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	str	xzr, [sp]
	b	LBB7_1
LBB7_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp]
	subs	x8, x8, #20
	cset	w8, hs
	tbnz	w8, #0, LBB7_8
	b	LBB7_2
LBB7_2:                                 ;   in Loop: Header=BB7_1 Depth=1
	ldr	x8, [sp, #8]
	ldr	x9, [sp]
	mov	x10, #24                        ; =0x18
	mul	x9, x9, x10
	add	x8, x8, x9
	ldrb	w8, [x8, #17]
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB7_6
	b	LBB7_3
LBB7_3:                                 ;   in Loop: Header=BB7_1 Depth=1
	ldr	x8, [sp, #16]
	ldr	w8, [x8]
	ldr	x9, [sp, #8]
	ldr	x10, [sp]
	mov	x11, #24                        ; =0x18
	mul	x10, x10, x11
	ldr	w9, [x9, x10]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB7_6
	b	LBB7_4
LBB7_4:                                 ;   in Loop: Header=BB7_1 Depth=1
	ldr	x8, [sp, #16]
	ldr	w8, [x8, #4]
	ldr	x9, [sp, #8]
	ldr	x10, [sp]
	mov	x11, #24                        ; =0x18
	mul	x10, x10, x11
	add	x9, x9, x10
	ldr	w9, [x9, #4]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB7_6
	b	LBB7_5
LBB7_5:
	ldr	x8, [sp, #8]
	ldr	x9, [sp]
	mov	x10, #24                        ; =0x18
	mul	x9, x9, x10
	add	x8, x8, x9
	strb	wzr, [x8, #17]
	mov	w8, #1                          ; =0x1
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	strb	w8, [sp, #31]
	b	LBB7_9
LBB7_6:                                 ;   in Loop: Header=BB7_1 Depth=1
	b	LBB7_7
LBB7_7:                                 ;   in Loop: Header=BB7_1 Depth=1
	ldr	x8, [sp]
	add	x8, x8, #1
	str	x8, [sp]
	b	LBB7_1
LBB7_8:
	mov	w8, #0                          ; =0x0
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	strb	w8, [sp, #31]
	b	LBB7_9
LBB7_9:
	ldrb	w8, [sp, #31]
	and	w0, w8, #0x1
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_addTail                        ; -- Begin function addTail
	.p2align	2
_addTail:                               ; @addTail
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB8_2
	b	LBB8_1
LBB8_1:
	ldr	x8, [sp, #8]
	ldr	x8, [x8, #8]
	subs	x8, x8, #100
	cset	w8, ls
	tbnz	w8, #0, LBB8_3
	b	LBB8_2
LBB8_2:
	mov	w1, #0                          ; =0x0
	mov	x0, x1
	adrp	x2, l_.str.2@PAGE
	add	x2, x2, l_.str.2@PAGEOFF
	bl	_mvprintw$NCURSES60
	b	LBB8_4
LBB8_3:
	ldr	x9, [sp, #8]
	ldr	x8, [x9, #8]
	add	x8, x8, #1
	str	x8, [x9, #8]
	b	LBB8_4
LBB8_4:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_go                             ; -- Begin function go
	.p2align	2
_go:                                    ; @go
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	mov	w8, #64                         ; =0x40
	sturb	w8, [x29, #-9]
	ldur	x8, [x29, #-8]
	ldr	w0, [x8, #4]
	ldur	x8, [x29, #-8]
	ldr	w1, [x8]
	adrp	x2, l_.str@PAGE
	add	x2, x2, l_.str@PAGEOFF
	bl	_mvprintw$NCURSES60
	ldur	x8, [x29, #-8]
	ldr	w8, [x8, #16]
	subs	w8, w8, #0
	mov	w8, w8
                                        ; kill: def $x8 killed $w8
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	subs	x8, x8, #3
	cset	w8, hi
	tbnz	w8, #0, LBB9_6
; %bb.1:
	ldr	x11, [sp, #8]                   ; 8-byte Folded Reload
	adrp	x10, lJTI9_0@PAGE
	add	x10, x10, lJTI9_0@PAGEOFF
Ltmp3:
	adr	x8, Ltmp3
	ldrsw	x9, [x10, x11, lsl #2]
	add	x8, x8, x9
	br	x8
LBB9_2:
	ldur	x8, [x29, #-8]
	ldr	w0, [x8, #4]
	ldur	x8, [x29, #-8]
	ldr	w9, [x8]
	subs	w1, w9, #1
	str	w1, [x8]
	ldursb	w10, [x29, #-9]
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	adrp	x2, l_.str.3@PAGE
	add	x2, x2, l_.str.3@PAGEOFF
	bl	_mvprintw$NCURSES60
	b	LBB9_7
LBB9_3:
	ldur	x8, [x29, #-8]
	ldr	w0, [x8, #4]
	ldur	x8, [x29, #-8]
	ldr	w9, [x8]
	add	w1, w9, #1
	str	w1, [x8]
	ldursb	w10, [x29, #-9]
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	adrp	x2, l_.str.3@PAGE
	add	x2, x2, l_.str.3@PAGEOFF
	bl	_mvprintw$NCURSES60
	b	LBB9_7
LBB9_4:
	ldur	x8, [x29, #-8]
	ldr	w9, [x8, #4]
	subs	w0, w9, #1
	str	w0, [x8, #4]
	ldur	x8, [x29, #-8]
	ldr	w1, [x8]
	ldursb	w10, [x29, #-9]
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	adrp	x2, l_.str.3@PAGE
	add	x2, x2, l_.str.3@PAGEOFF
	bl	_mvprintw$NCURSES60
	b	LBB9_7
LBB9_5:
	ldur	x8, [x29, #-8]
	ldr	w9, [x8, #4]
	add	w0, w9, #1
	str	w0, [x8, #4]
	ldur	x8, [x29, #-8]
	ldr	w1, [x8]
	ldursb	w10, [x29, #-9]
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	adrp	x2, l_.str.3@PAGE
	add	x2, x2, l_.str.3@PAGEOFF
	bl	_mvprintw$NCURSES60
	b	LBB9_7
LBB9_6:
	b	LBB9_7
LBB9_7:
	adrp	x8, _stdscr@GOTPAGE
	ldr	x8, [x8, _stdscr@GOTPAGEOFF]
	ldr	x0, [x8]
	bl	_wrefresh$NCURSES60
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
	.p2align	2
lJTI9_0:
	.long	LBB9_2-Ltmp3
	.long	LBB9_4-Ltmp3
	.long	LBB9_3-Ltmp3
	.long	LBB9_5-Ltmp3
                                        ; -- End function
	.globl	_goTail                         ; -- Begin function goTail
	.p2align	2
_goTail:                                ; @goTail
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	mov	w8, #42                         ; =0x2a
	sturb	w8, [x29, #-9]
	ldur	x8, [x29, #-8]
	ldr	x8, [x8, #24]
	ldur	x9, [x29, #-8]
	ldr	x9, [x9, #8]
	subs	x9, x9, #1
	add	x8, x8, x9, lsl #3
	ldr	w0, [x8, #4]
	ldur	x8, [x29, #-8]
	ldr	x8, [x8, #24]
	ldur	x9, [x29, #-8]
	ldr	x9, [x9, #8]
	subs	x9, x9, #1
	lsl	x9, x9, #3
	ldr	w1, [x8, x9]
	adrp	x2, l_.str@PAGE
	add	x2, x2, l_.str@PAGEOFF
	bl	_mvprintw$NCURSES60
	ldur	x8, [x29, #-8]
	ldr	x8, [x8, #8]
	subs	x8, x8, #1
	str	x8, [sp, #8]
	b	LBB10_1
LBB10_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #8]
	subs	x8, x8, #0
	cset	w8, ls
	tbnz	w8, #0, LBB10_7
	b	LBB10_2
LBB10_2:                                ;   in Loop: Header=BB10_1 Depth=1
	ldur	x8, [x29, #-8]
	ldr	x9, [x8, #24]
	ldr	x10, [sp, #8]
	ldur	x8, [x29, #-8]
	ldr	x8, [x8, #24]
	ldr	x11, [sp, #8]
	subs	x11, x11, #1
	ldr	x8, [x8, x11, lsl #3]
	str	x8, [x9, x10, lsl #3]
	ldur	x8, [x29, #-8]
	ldr	x8, [x8, #24]
	ldr	x9, [sp, #8]
	add	x8, x8, x9, lsl #3
	ldr	w8, [x8, #4]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB10_4
	b	LBB10_3
LBB10_3:                                ;   in Loop: Header=BB10_1 Depth=1
	ldur	x8, [x29, #-8]
	ldr	x8, [x8, #24]
	ldr	x9, [sp, #8]
	lsl	x9, x9, #3
	ldr	w8, [x8, x9]
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB10_5
	b	LBB10_4
LBB10_4:                                ;   in Loop: Header=BB10_1 Depth=1
	ldur	x8, [x29, #-8]
	ldr	x8, [x8, #24]
	ldr	x9, [sp, #8]
	add	x8, x8, x9, lsl #3
	ldr	w0, [x8, #4]
	ldur	x8, [x29, #-8]
	ldr	x8, [x8, #24]
	ldr	x9, [sp, #8]
	lsl	x9, x9, #3
	ldr	w1, [x8, x9]
	ldursb	w10, [x29, #-9]
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	adrp	x2, l_.str.3@PAGE
	add	x2, x2, l_.str.3@PAGEOFF
	bl	_mvprintw$NCURSES60
	b	LBB10_5
LBB10_5:                                ;   in Loop: Header=BB10_1 Depth=1
	b	LBB10_6
LBB10_6:                                ;   in Loop: Header=BB10_1 Depth=1
	ldr	x8, [sp, #8]
	subs	x8, x8, #1
	str	x8, [sp, #8]
	b	LBB10_1
LBB10_7:
	ldur	x8, [x29, #-8]
	ldr	w8, [x8]
	ldur	x9, [x29, #-8]
	ldr	x9, [x9, #24]
	str	w8, [x9]
	ldur	x8, [x29, #-8]
	ldr	w8, [x8, #4]
	ldur	x9, [x29, #-8]
	ldr	x9, [x9, #24]
	str	w8, [x9, #4]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_changeDirection                ; -- Begin function changeDirection
	.p2align	2
_changeDirection:                       ; @changeDirection
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	str	wzr, [sp]
	b	LBB11_1
LBB11_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp]
	subs	w8, w8, #3
	cset	w8, ge
	tbnz	w8, #0, LBB11_15
	b	LBB11_2
LBB11_2:                                ;   in Loop: Header=BB11_1 Depth=1
	ldr	w8, [sp, #4]
	ldr	x9, [sp, #8]
	ldr	x9, [x9, #32]
	ldrsw	x10, [sp]
	lsl	x10, x10, #4
	ldr	w9, [x9, x10]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB11_4
	b	LBB11_3
LBB11_3:                                ;   in Loop: Header=BB11_1 Depth=1
	ldr	x9, [sp, #8]
	mov	w8, #3                          ; =0x3
	str	w8, [x9, #16]
	b	LBB11_13
LBB11_4:                                ;   in Loop: Header=BB11_1 Depth=1
	ldr	w8, [sp, #4]
	ldr	x9, [sp, #8]
	ldr	x9, [x9, #32]
	ldrsw	x10, [sp]
	add	x9, x9, x10, lsl #4
	ldr	w9, [x9, #4]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB11_6
	b	LBB11_5
LBB11_5:                                ;   in Loop: Header=BB11_1 Depth=1
	ldr	x9, [sp, #8]
	mov	w8, #1                          ; =0x1
	str	w8, [x9, #16]
	b	LBB11_12
LBB11_6:                                ;   in Loop: Header=BB11_1 Depth=1
	ldr	w8, [sp, #4]
	ldr	x9, [sp, #8]
	ldr	x9, [x9, #32]
	ldrsw	x10, [sp]
	add	x9, x9, x10, lsl #4
	ldr	w9, [x9, #12]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB11_8
	b	LBB11_7
LBB11_7:                                ;   in Loop: Header=BB11_1 Depth=1
	ldr	x9, [sp, #8]
	mov	w8, #2                          ; =0x2
	str	w8, [x9, #16]
	b	LBB11_11
LBB11_8:                                ;   in Loop: Header=BB11_1 Depth=1
	ldr	w8, [sp, #4]
	ldr	x9, [sp, #8]
	ldr	x9, [x9, #32]
	ldrsw	x10, [sp]
	add	x9, x9, x10, lsl #4
	ldr	w9, [x9, #8]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB11_10
	b	LBB11_9
LBB11_9:                                ;   in Loop: Header=BB11_1 Depth=1
	ldr	x8, [sp, #8]
	str	wzr, [x8, #16]
	b	LBB11_10
LBB11_10:                               ;   in Loop: Header=BB11_1 Depth=1
	b	LBB11_11
LBB11_11:                               ;   in Loop: Header=BB11_1 Depth=1
	b	LBB11_12
LBB11_12:                               ;   in Loop: Header=BB11_1 Depth=1
	b	LBB11_13
LBB11_13:                               ;   in Loop: Header=BB11_1 Depth=1
	b	LBB11_14
LBB11_14:                               ;   in Loop: Header=BB11_1 Depth=1
	ldr	w8, [sp]
	add	w8, w8, #1
	str	w8, [sp]
	b	LBB11_1
LBB11_15:
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_isTail                         ; -- Begin function isTail
	.p2align	2
_isTail:                                ; @isTail
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #16]
	ldr	x8, [sp, #16]
	ldr	x8, [x8, #8]
	subs	x8, x8, #1
	str	x8, [sp, #8]
	b	LBB12_1
LBB12_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #8]
	subs	x8, x8, #0
	cset	w8, ls
	tbnz	w8, #0, LBB12_7
	b	LBB12_2
LBB12_2:                                ;   in Loop: Header=BB12_1 Depth=1
	ldr	x8, [sp, #16]
	ldr	w8, [x8, #4]
	ldr	x9, [sp, #16]
	ldr	x9, [x9, #24]
	ldr	x10, [sp, #8]
	add	x9, x9, x10, lsl #3
	ldr	w9, [x9, #4]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB12_5
	b	LBB12_3
LBB12_3:                                ;   in Loop: Header=BB12_1 Depth=1
	ldr	x8, [sp, #16]
	ldr	w8, [x8]
	ldr	x9, [sp, #16]
	ldr	x9, [x9, #24]
	ldr	x10, [sp, #8]
	lsl	x10, x10, #3
	ldr	w9, [x9, x10]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB12_5
	b	LBB12_4
LBB12_4:
	mov	w8, #0                          ; =0x0 Режим самопересечения включён
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	strb	w8, [sp, #31]
	b	LBB12_8
LBB12_5:                                ;   in Loop: Header=BB12_1 Depth=1
	b	LBB12_6
LBB12_6:                                ;   in Loop: Header=BB12_1 Depth=1
	ldr	x8, [sp, #8]
	subs	x8, x8, #1
	str	x8, [sp, #8]
	b	LBB12_1
LBB12_7:
	mov	w8, #0                          ; =0x0
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	strb	w8, [sp, #31]
	b	LBB12_8
LBB12_8:
	ldrb	w8, [sp, #31]
	and	w0, w8, #0x1
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_printLevel                     ; -- Begin function printLevel
	.p2align	2
_printLevel:                            ; @printLevel
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	wzr, [x29, #-12]
	str	wzr, [sp, #16]
	adrp	x8, _stdscr@GOTPAGE
	ldr	x8, [x8, _stdscr@GOTPAGEOFF]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x0, [x8]
	bl	_getmaxy
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	stur	w0, [x29, #-12]
	ldr	x0, [x8]
	bl	_getmaxx
	str	w0, [sp, #16]
	ldur	w8, [x29, #-12]
	subs	w1, w8, #10
	ldur	x8, [x29, #-8]
	ldr	x8, [x8, #8]
	mov	x9, sp
	str	x8, [x9]
	mov	w0, #5                          ; =0x5
	adrp	x2, l_.str.4@PAGE
	add	x2, x2, l_.str.4@PAGEOFF
	bl	_mvprintw$NCURSES60
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_printExit                      ; -- Begin function printExit
	.p2align	2
_printExit:                             ; @printExit
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	wzr, [x29, #-12]
	str	wzr, [sp, #16]
	adrp	x8, _stdscr@GOTPAGE
	ldr	x8, [x8, _stdscr@GOTPAGEOFF]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x0, [x8]
	bl	_getmaxy
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	stur	w0, [x29, #-12]
	ldr	x0, [x8]
	bl	_getmaxx
	str	w0, [sp, #16]
	ldr	w8, [sp, #16]
	mov	w9, #2                          ; =0x2
	sdiv	w0, w8, w9
	ldur	w8, [x29, #-12]
	sdiv	w8, w8, w9
	subs	w1, w8, #5
	ldur	x8, [x29, #-8]
	ldr	x8, [x8, #8]
	mov	x9, sp
	str	x8, [x9]
	adrp	x2, l_.str.5@PAGE
	add	x2, x2, l_.str.5@PAGEOFF
	bl	_mvprintw$NCURSES60
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x0, [x8]
	bl	_wrefresh$NCURSES60
	bl	_getchar
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_pause                          ; -- Begin function pause
	.p2align	2
_pause:                                 ; @pause
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	str	wzr, [sp, #8]
	adrp	x8, _stdscr@GOTPAGE
	ldr	x8, [x8, _stdscr@GOTPAGEOFF]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	x0, [x8]
	bl	_getmaxy
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	stur	w0, [x29, #-4]
	ldr	x0, [x8]
	bl	_getmaxx
	str	w0, [sp, #8]
	ldr	w8, [sp, #8]
	mov	w9, #2                          ; =0x2
	sdiv	w0, w8, w9
	ldur	w8, [x29, #-4]
	sdiv	w8, w8, w9
	subs	w1, w8, #5
	adrp	x2, l_.str.6@PAGE
	add	x2, x2, l_.str.6@PAGEOFF
	bl	_mvprintw$NCURSES60
	b	LBB15_1
LBB15_1:                                ; =>This Inner Loop Header: Depth=1
	adrp	x8, _stdscr@GOTPAGE
	ldr	x8, [x8, _stdscr@GOTPAGEOFF]
	ldr	x0, [x8]
	bl	_wgetch$NCURSES60
	subs	w8, w0, #112
	cset	w8, eq
	tbnz	w8, #0, LBB15_3
	b	LBB15_2
LBB15_2:                                ;   in Loop: Header=BB15_1 Depth=1
	b	LBB15_1
LBB15_3:
	ldr	w8, [sp, #8]
	mov	w9, #2                          ; =0x2
	sdiv	w0, w8, w9
	ldur	w8, [x29, #-4]
	sdiv	w8, w8, w9
	subs	w1, w8, #5
	adrp	x2, l_.str.7@PAGE
	add	x2, x2, l_.str.7@PAGEOFF
	bl	_mvprintw$NCURSES60
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0                          ; -- Begin function main
lCPI16_0:
	.quad	0x412e848000000000              ; double 1.0E+6
lCPI16_1:
	.quad	0x3f826e978d4fdf3b              ; double 0.0089999999999999993
lCPI16_2:
	.quad	0x3fb999999999999a              ; double 0.10000000000000001
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #0                          ; =0x0
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	mov	x0, #40                         ; =0x28
	bl	_malloc
	stur	x0, [x29, #-16]
	ldur	x0, [x29, #-16]
	mov	x1, #3                          ; =0x3
	mov	w3, #10                         ; =0xa
	mov	x2, x3
	bl	_initSnake
	bl	_initscr$NCURSES60
	adrp	x0, _food@GOTPAGE
	ldr	x0, [x0, _food@GOTPAGEOFF]
	mov	x1, #10                         ; =0xa
	bl	_putFood
	adrp	x8, _stdscr@GOTPAGE
	ldr	x8, [x8, _stdscr@GOTPAGEOFF]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x0, [x8]
	mov	w8, #1                          ; =0x1
	and	w1, w8, #0x1
	bl	_keypad$NCURSES60
	bl	_raw
	bl	_noecho
	ldr	w0, [sp, #20]                   ; 4-byte Folded Reload
	bl	_curs_set
	ldr	w1, [sp, #20]                   ; 4-byte Folded Reload
	mov	x0, x1
	adrp	x2, l_.str.8@PAGE
	add	x2, x2, l_.str.8@PAGEOFF
	bl	_mvprintw$NCURSES60
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w1, [sp, #20]                   ; 4-byte Folded Reload
	adrp	x9, lCPI16_2@PAGE
	ldr	d0, [x9, lCPI16_2@PAGEOFF]
	stur	d0, [x29, #-24]
	stur	wzr, [x29, #-28]
	ldr	x0, [x8]
	bl	_wtimeout
	b	LBB16_1
LBB16_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB16_9 Depth 2
	ldur	w8, [x29, #-28]
	subs	w8, w8, #274
	cset	w8, eq
	tbnz	w8, #0, LBB16_12
	b	LBB16_2
LBB16_2:                                ;   in Loop: Header=BB16_1 Depth=1
	bl	_clock
	str	x0, [sp, #24]
	adrp	x8, _stdscr@GOTPAGE
	ldr	x8, [x8, _stdscr@GOTPAGEOFF]
	ldr	x0, [x8]
	bl	_wgetch$NCURSES60
	stur	w0, [x29, #-28]
	ldur	x0, [x29, #-16]
	bl	_go
	ldur	x0, [x29, #-16]
	bl	_goTail
	ldur	x0, [x29, #-16]
	bl	_isTail
	tbz	w0, #0, LBB16_4
	b	LBB16_3
LBB16_3:
	b	LBB16_12
LBB16_4:                                ;   in Loop: Header=BB16_1 Depth=1
	ldur	x0, [x29, #-16]
	ldur	w1, [x29, #-28]
	bl	_changeDirection
	ldur	w8, [x29, #-28]
	subs	w8, w8, #112
	cset	w8, ne
	tbnz	w8, #0, LBB16_6
	b	LBB16_5
LBB16_5:                                ;   in Loop: Header=BB16_1 Depth=1
	bl	_pause
	b	LBB16_6
LBB16_6:                                ;   in Loop: Header=BB16_1 Depth=1
	adrp	x0, _food@GOTPAGE
	ldr	x0, [x0, _food@GOTPAGEOFF]
	str	x0, [sp]                        ; 8-byte Folded Spill
	mov	w1, #3                          ; =0x3
	bl	_refreshFood
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	ldur	x0, [x29, #-16]
	bl	_haveEat
	tbz	w0, #0, LBB16_8
	b	LBB16_7
LBB16_7:                                ;   in Loop: Header=BB16_1 Depth=1
	ldur	x0, [x29, #-16]
	bl	_addTail
	ldur	x0, [x29, #-16]
	bl	_printLevel
	ldur	d0, [x29, #-24]
	adrp	x8, lCPI16_1@PAGE
	ldr	d1, [x8, lCPI16_1@PAGEOFF]
	fsub	d0, d0, d1
	stur	d0, [x29, #-24]
	b	LBB16_8
LBB16_8:                                ;   in Loop: Header=BB16_1 Depth=1
	b	LBB16_9
LBB16_9:                                ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	bl	_clock
	ucvtf	d0, x0
	ldr	d1, [sp, #24]
	ucvtf	d1, d1
	fsub	d0, d0, d1
	adrp	x8, lCPI16_0@PAGE
	ldr	d1, [x8, lCPI16_0@PAGEOFF]
	fdiv	d0, d0, d1
	ldur	d1, [x29, #-24]
	fcmp	d0, d1
	cset	w8, pl
	tbnz	w8, #0, LBB16_11
	b	LBB16_10
LBB16_10:                               ;   in Loop: Header=BB16_9 Depth=2
	b	LBB16_9
LBB16_11:                               ;   in Loop: Header=BB16_1 Depth=1
	adrp	x8, _stdscr@GOTPAGE
	ldr	x8, [x8, _stdscr@GOTPAGEOFF]
	ldr	x0, [x8]
	bl	_wrefresh$NCURSES60
	b	LBB16_1
LBB16_12:
	ldur	x8, [x29, #-16]
	ldr	x0, [x8, #24]
	bl	_free
	ldur	x0, [x29, #-16]
	bl	_free
	bl	_endwin$NCURSES60
	mov	w0, #0                          ; =0x0
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__data
	.globl	_default_controls               ; @default_controls
	.p2align	2, 0x0
_default_controls:
	.long	258                             ; 0x102
	.long	259                             ; 0x103
	.long	260                             ; 0x104
	.long	261                             ; 0x105
	.long	115                             ; 0x73
	.long	119                             ; 0x77
	.long	97                              ; 0x61
	.long	100                             ; 0x64
	.long	83                              ; 0x53
	.long	87                              ; 0x57
	.long	65                              ; 0x41
	.long	68                              ; 0x44

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	" "

l_.str.1:                               ; @.str.1
	.asciz	"%s"

l_.str.2:                               ; @.str.2
	.asciz	"Can't add tail"

l_.str.3:                               ; @.str.3
	.asciz	"%c"

l_.str.4:                               ; @.str.4
	.asciz	"LEVEL: %d"

l_.str.5:                               ; @.str.5
	.asciz	"Total level: %d"

l_.str.6:                               ; @.str.6
	.asciz	"Press P to continue"

l_.str.7:                               ; @.str.7
	.asciz	"                   "

	.comm	_food,480,3                     ; @food
l_.str.8:                               ; @.str.8
	.asciz	"Use arrows for control. Press'F10' for EXIT"

	.comm	_control_buttons,16,2           ; @control_buttons
.subsections_via_symbols
