	.file	"vt52.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.text.VT52_reset,"ax",@progbits
.global	VT52_reset
	.type	VT52_reset, @function
VT52_reset:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(-72)
	ldi r25,lo8(7)
	sts fgcolor+1,r25
	sts fgcolor,r24
	sts bgcolor+1,__zero_reg__
	sts bgcolor,__zero_reg__
	call cursor_home
	jmp erase_screen
	.size	VT52_reset, .-VT52_reset
	.section	.text.VT52_process,"ax",@progbits
.global	VT52_process
	.type	VT52_process, @function
VT52_process:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r30,r24
	lds r24,state
	lds r25,state+1
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L4
	brge .L5
	or r24,r25
	breq .L6
	rjmp .L28
.L5:
	cpi r24,2
	cpc r25,__zero_reg__
	brne .+2
	rjmp .L7
	sbiw r24,3
	brne .+2
	rjmp .L8
	rjmp .L28
.L6:
	cpi r30,lo8(10)
	breq .L10
	brge .L11
	cpi r30,lo8(7)
	brne .+2
	rjmp .L30
	cpi r30,lo8(9)
	breq .+2
	rjmp .L28
	call cursor_tabstop
	rjmp .L30
.L11:
	cpi r30,lo8(13)
	breq .L13
	cpi r30,lo8(27)
	breq .+2
	rjmp .L28
	ldi r24,lo8(1)
	ldi r25,0
	sts state+1,r25
	sts state,r24
	rjmp .L30
.L10:
	call linefeed
	rjmp .L30
.L13:
	call carriage_return
	rjmp .L30
.L4:
	mov r24,r30
	lsl r30
	sbc r25,r25
	sbc r26,r26
	sbc r27,r27
	movw r30,r24
	subi r30,65
	sbc r31,__zero_reg__
	cpi r30,26
	cpc r31,__zero_reg__
	brsh .L15
	subi r30,lo8(-(gs(.L17)))
	sbci r31,hi8(-(gs(.L17)))
	jmp __tablejump2__
	.section	.progmem.gcc_sw_table.VT52_process,"a",@progbits
	.p2align	1
.L17:
	.word gs(.L16)
	.word gs(.L18)
	.word gs(.L19)
	.word gs(.L20)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L21)
	.word gs(.L22)
	.word gs(.L23)
	.word gs(.L24)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L15)
	.word gs(.L25)
	.word gs(.L26)
	.section	.text.VT52_process
.L16:
	call cursor_up
	rjmp .L27
.L18:
	call cursor_down
	rjmp .L27
.L19:
	call cursor_right
	rjmp .L27
.L20:
	call cursor_left
	rjmp .L27
.L21:
	call cursor_home
	rjmp .L27
.L22:
	call reverse_linefeed
	rjmp .L27
.L24:
	call erase_cursor_to_eol
	rjmp .L27
.L23:
	call erase_cursor_to_end
	rjmp .L27
.L25:
	ldi r24,lo8(2)
	ldi r25,0
	sts state+1,r25
	sts state,r24
	sts px+1,__zero_reg__
	sts px,__zero_reg__
	sts py+1,__zero_reg__
	sts py,__zero_reg__
	rjmp .L30
.L26:
	ldi r24,lo8(75)
	call tx_char
	rjmp .L27
.L15:
	sts state+1,__zero_reg__
	sts state,__zero_reg__
	rjmp .L28
.L27:
	sts state+1,__zero_reg__
	sts state,__zero_reg__
	rjmp .L30
.L7:
	cpi r30,lo8(32)
	brlt .L27
	ldi r24,lo8(3)
	ldi r25,0
	sts state+1,r25
	sts state,r24
	mov r24,r30
	lsl r30
	sbc r25,r25
	sbiw r24,31
	sts py+1,r25
	sts py,r24
	rjmp .L30
.L8:
	sts state+1,__zero_reg__
	sts state,__zero_reg__
	cpi r30,lo8(32)
	brlt .L30
	mov r24,r30
	lsl r30
	sbc r25,r25
	sbiw r24,31
	sts px+1,r25
	sts px,r24
	lds r22,py
	lds r23,py+1
	call cursor_goto
	rjmp .L30
.L28:
	ldi r24,lo8(1)
	ret
.L30:
	ldi r24,0
	ret
	.size	VT52_process, .-VT52_process
	.section	.bss.py,"aw",@nobits
	.type	py, @object
	.size	py, 2
py:
	.zero	2
	.section	.bss.px,"aw",@nobits
	.type	px, @object
	.size	px, 2
px:
	.zero	2
	.section	.bss.state,"aw",@nobits
	.type	state, @object
	.size	state, 2
state:
	.zero	2
	.ident	"GCC: (GNU) 4.9.2"
.global __do_clear_bss
