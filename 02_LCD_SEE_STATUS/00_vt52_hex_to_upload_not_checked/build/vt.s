	.file	"vt.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.text.VT_reset,"ax",@progbits
.global	VT_reset
	.type	VT_reset, @function
VT_reset:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r30,lo8(tabstops)
	ldi r31,hi8(tabstops)
	ldi r24,0
.L3:
	ldi r18,lo8(1)
	mov r25,r24
	andi r25,lo8(7)
	cpi r25,lo8(7)
	breq .L2
	ldi r18,0
.L2:
	st Z+,r18
	subi r24,lo8(-(1))
	cpi r24,lo8(80)
	brne .L3
	lds r24,mode
	tst r24
	breq .L5
	cpi r24,lo8(2)
	breq .L6
	ret
.L5:
	jmp VT52_reset
.L6:
	jmp VT220_reset
	.size	VT_reset, .-VT_reset
	.section	.text.VT_init,"ax",@progbits
.global	VT_init
	.type	VT_init, @function
VT_init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp VT_reset
	.size	VT_init, .-VT_init
	.section	.text.get_color,"ax",@progbits
.global	get_color
	.type	get_color, @function
get_color:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	andi r24,lo8(15)
	mov r30,r24
	ldi r31,0
	lsl r30
	rol r31
	subi r30,lo8(-(colors))
	sbci r31,hi8(-(colors))
/* #APP */
 ;  98 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/vt.c" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
	ret
	.size	get_color, .-get_color
	.section	.text.set_tabstop,"ax",@progbits
.global	set_tabstop
	.type	set_tabstop, @function
set_tabstop:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r30,cursorX
	ldi r31,0
	subi r30,lo8(-(tabstops))
	sbci r31,hi8(-(tabstops))
	ldi r24,lo8(1)
	st Z,r24
	ret
	.size	set_tabstop, .-set_tabstop
	.section	.text.clear_tabstop,"ax",@progbits
.global	clear_tabstop
	.type	clear_tabstop, @function
clear_tabstop:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r30,cursorX
	ldi r31,0
	subi r30,lo8(-(tabstops))
	sbci r31,hi8(-(tabstops))
	st Z,__zero_reg__
	ret
	.size	clear_tabstop, .-clear_tabstop
	.section	.text.clear_all_tabstops,"ax",@progbits
.global	clear_all_tabstops
	.type	clear_all_tabstops, @function
clear_all_tabstops:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r30,lo8(tabstops)
	ldi r31,hi8(tabstops)
	ldi r24,lo8(80)
	add r24,r30
.L18:
	st Z+,__zero_reg__
	cpse r24,r30
	rjmp .L18
/* epilogue start */
	ret
	.size	clear_all_tabstops, .-clear_all_tabstops
	.section	.text.cursor_tabstop,"ax",@progbits
.global	cursor_tabstop
	.type	cursor_tabstop, @function
cursor_tabstop:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,cursorX
.L21:
	ldi r25,lo8(1)
	add r25,r24
	cpi r25,lo8(80)
	brsh .L27
	mov r24,r25
	mov r30,r25
	ldi r31,0
	subi r30,lo8(-(tabstops))
	sbci r31,hi8(-(tabstops))
	ld r25,Z
	tst r25
	breq .L21
	rjmp .L26
.L27:
	sts cursorX,r25
	cpi r25,lo8(80)
	brne .L20
.L26:
	sts cursorX,r24
.L20:
	ret
	.size	cursor_tabstop, .-cursor_tabstop
	.section	.text.cursor_down,"ax",@progbits
.global	cursor_down
	.type	cursor_down, @function
cursor_down:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,cursorY
	subi r24,lo8(-(1))
	cpi r24,lo8(40)
	breq .L28
	sts cursorY,r24
.L28:
	ret
	.size	cursor_down, .-cursor_down
	.section	.text.cursor_up,"ax",@progbits
.global	cursor_up
	.type	cursor_up, @function
cursor_up:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,cursorY
	tst r24
	breq .L33
	subi r24,lo8(-(-1))
	sts cursorY,r24
.L33:
	ret
	.size	cursor_up, .-cursor_up
	.section	.text.cursor_left,"ax",@progbits
.global	cursor_left
	.type	cursor_left, @function
cursor_left:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,cursorX
	tst r24
	breq .L38
	subi r24,lo8(-(-1))
	sts cursorX,r24
.L38:
	ret
	.size	cursor_left, .-cursor_left
	.section	.text.cursor_right,"ax",@progbits
.global	cursor_right
	.type	cursor_right, @function
cursor_right:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,cursorX
	subi r24,lo8(-(1))
	cpi r24,lo8(80)
	breq .L43
	sts cursorX,r24
.L43:
	ret
	.size	cursor_right, .-cursor_right
	.section	.text.cursor_down_n,"ax",@progbits
.global	cursor_down_n
	.type	cursor_down_n, @function
cursor_down_n:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r25,cursorY
	add r24,r25
	cpi r24,lo8(40)
	brlo .L51
	ldi r24,lo8(39)
.L51:
	sts cursorY,r24
	ret
	.size	cursor_down_n, .-cursor_down_n
	.section	.text.cursor_up_n,"ax",@progbits
.global	cursor_up_n
	.type	cursor_up_n, @function
cursor_up_n:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r25,cursorY
	mov r18,r25
	sub r18,r24
	mov r24,r18
.L53:
	cpse r25,r24
	rjmp .L54
	sts cursorY,r25
	ret
.L54:
	tst r25
	breq .L57
	subi r25,lo8(-(-1))
	rjmp .L53
.L57:
	sts cursorY,__zero_reg__
	ret
	.size	cursor_up_n, .-cursor_up_n
	.section	.text.cursor_left_n,"ax",@progbits
.global	cursor_left_n
	.type	cursor_left_n, @function
cursor_left_n:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r25,cursorX
	mov r18,r25
	sub r18,r24
	mov r24,r18
.L59:
	cpse r25,r24
	rjmp .L60
	sts cursorX,r25
	ret
.L60:
	tst r25
	breq .L63
	subi r25,lo8(-(-1))
	rjmp .L59
.L63:
	sts cursorX,__zero_reg__
	ret
	.size	cursor_left_n, .-cursor_left_n
	.section	.text.cursor_right_n,"ax",@progbits
.global	cursor_right_n
	.type	cursor_right_n, @function
cursor_right_n:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r25,cursorX
	add r24,r25
	cpi r24,lo8(80)
	brlo .L67
	ldi r24,lo8(79)
.L67:
	sts cursorX,r24
	ret
	.size	cursor_right_n, .-cursor_right_n
	.section	.text.cursor_goto,"ax",@progbits
.global	cursor_goto
	.type	cursor_goto, @function
cursor_goto:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	subi r24,lo8(-(-1))
	sts cursorX,r24
	subi r22,lo8(-(-1))
	sts cursorY,r22
	cpi r24,lo8(81)
	brlo .L69
	ldi r24,lo8(79)
	sts cursorX,r24
.L69:
	cpi r22,lo8(41)
	brlo .L68
	ldi r24,lo8(39)
	sts cursorY,r24
.L68:
	ret
	.size	cursor_goto, .-cursor_goto
	.section	.text.cursor_home,"ax",@progbits
.global	cursor_home
	.type	cursor_home, @function
cursor_home:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts cursorX,__zero_reg__
	sts cursorY,__zero_reg__
	ret
	.size	cursor_home, .-cursor_home
	.section	.text.carriage_return,"ax",@progbits
.global	carriage_return
	.type	carriage_return, @function
carriage_return:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts cursorX,__zero_reg__
	ret
	.size	carriage_return, .-carriage_return
	.section	.text.linefeed,"ax",@progbits
.global	linefeed
	.type	linefeed, @function
linefeed:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,cursorY
	subi r24,lo8(-(1))
	cpi r24,lo8(40)
	breq .L73
	sts cursorY,r24
.L73:
	ret
	.size	linefeed, .-linefeed
	.section	.text.drawchar,"ax",@progbits
.global	drawchar
	.type	drawchar, @function
drawchar:
	push r16
	push r17
	push r28
	push r29
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 5 */
.L__stack_usage = 5
	lds r25,cursorX
	cpi r25,lo8(80)
	brne .L79
	lds r25,auto_wrap
	tst r25
	breq .L80
	sts cursorX,__zero_reg__
	std Y+1,r24
	call linefeed
	ldd r24,Y+1
	rjmp .L79
.L80:
	ldi r25,lo8(79)
	sts cursorX,r25
.L79:
	lds r18,cursorX
	lds r16,cursorY
	ldi r25,lo8(6)
	mul r16,r25
	movw r16,r0
	clr __zero_reg__
	ldi r25,lo8(4)
	mul r18,r25
	movw r18,r0
	clr __zero_reg__
	lds r20,bgcolor
	lds r21,bgcolor+1
	lds r22,fgcolor
	lds r23,fgcolor+1
	call drawchar_mini
	lds r24,cursorX
	subi r24,lo8(-(1))
	cpi r24,lo8(81)
	brlo .L83
	ldi r24,lo8(80)
.L83:
	sts cursorX,r24
/* epilogue start */
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	drawchar, .-drawchar
	.section	.text.rx_char,"ax",@progbits
.global	rx_char
	.type	rx_char, @function
rx_char:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	lds r24,mode
	tst r24
	breq .L86
	cpi r24,lo8(2)
	brne .L84
	mov r24,r28
	call VT220_process
	rjmp .L90
.L86:
	mov r24,r28
	call VT52_process
.L90:
	tst r24
	breq .L84
	mov r24,r28
/* epilogue start */
	pop r28
	jmp drawchar
.L84:
/* epilogue start */
	pop r28
	ret
	.size	rx_char, .-rx_char
	.section	.text.reverse_linefeed,"ax",@progbits
.global	reverse_linefeed
	.type	reverse_linefeed, @function
reverse_linefeed:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,cursorY
	tst r24
	breq .L91
	subi r24,lo8(-(-1))
	sts cursorY,r24
.L91:
	ret
	.size	reverse_linefeed, .-reverse_linefeed
	.section	.text.erase_cursor_to_eol,"ax",@progbits
.global	erase_cursor_to_eol
	.type	erase_cursor_to_eol, @function
erase_cursor_to_eol:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	lds r24,cursorX
	ldi r18,lo8(4)
	mul r24,r18
	movw r24,r0
	clr __zero_reg__
	lds r22,cursorY
	lds r16,bgcolor
	lds r17,bgcolor+1
	ldi r20,lo8(64)
	ldi r21,lo8(1)
	sub r20,r24
	sbc r21,r25
	ldi r18,lo8(6)
	mul r22,r18
	movw r22,r0
	clr __zero_reg__
	ldi r18,lo8(6)
	ldi r19,0
	call ILI9340_fillRect
/* epilogue start */
	pop r17
	pop r16
	ret
	.size	erase_cursor_to_eol, .-erase_cursor_to_eol
	.section	.text.erase_cursor_to_end,"ax",@progbits
.global	erase_cursor_to_end
	.type	erase_cursor_to_end, @function
erase_cursor_to_end:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	call erase_cursor_to_eol
	lds r24,cursorY
	cpi r24,lo8(39)
	breq .L97
	ldi r25,0
	adiw r24,1
	ldi r18,lo8(6)
	mul r18,r24
	movw r22,r0
	mul r18,r25
	add r23,r0
	clr __zero_reg__
	lds r16,bgcolor
	lds r17,bgcolor+1
	ldi r18,lo8(-16)
	ldi r19,0
	sub r18,r22
	sbc r19,r23
	ldi r20,lo8(64)
	ldi r21,lo8(1)
	ldi r24,0
	ldi r25,0
	call ILI9340_fillRect
.L97:
/* epilogue start */
	pop r17
	pop r16
	ret
	.size	erase_cursor_to_end, .-erase_cursor_to_end
	.section	.text.erase_line,"ax",@progbits
.global	erase_line
	.type	erase_line, @function
erase_line:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	lds r16,bgcolor
	lds r17,bgcolor+1
	ldi r25,lo8(6)
	mul r24,r25
	movw r22,r0
	clr __zero_reg__
	ldi r18,lo8(6)
	ldi r19,0
	ldi r20,lo8(64)
	ldi r21,lo8(1)
	ldi r24,0
	ldi r25,0
	call ILI9340_fillRect
/* epilogue start */
	pop r17
	pop r16
	ret
	.size	erase_line, .-erase_line
	.section	.text.erase_cursor_line,"ax",@progbits
.global	erase_cursor_line
	.type	erase_cursor_line, @function
erase_cursor_line:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,cursorX
	jmp erase_line
	.size	erase_cursor_line, .-erase_cursor_line
	.section	.text.erase_cursor_to_bol,"ax",@progbits
.global	erase_cursor_to_bol
	.type	erase_cursor_to_bol, @function
erase_cursor_to_bol:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	lds r20,cursorX
	lds r22,cursorY
	lds r16,bgcolor
	lds r17,bgcolor+1
	ldi r24,lo8(4)
	mul r20,r24
	movw r20,r0
	clr __zero_reg__
	ldi r24,lo8(6)
	mul r22,r24
	movw r22,r0
	clr __zero_reg__
	ldi r18,lo8(6)
	ldi r19,0
	ldi r24,0
	ldi r25,0
	call ILI9340_fillRect
/* epilogue start */
	pop r17
	pop r16
	ret
	.size	erase_cursor_to_bol, .-erase_cursor_to_bol
	.section	.text.erase_cursor_to_begin,"ax",@progbits
.global	erase_cursor_to_begin
	.type	erase_cursor_to_begin, @function
erase_cursor_to_begin:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	call erase_cursor_to_bol
	lds r24,cursorY
	tst r24
	breq .L105
	lds r16,bgcolor
	lds r17,bgcolor+1
	ldi r25,0
	sbiw r24,1
	ldi r20,lo8(6)
	mul r20,r24
	movw r18,r0
	mul r20,r25
	add r19,r0
	clr __zero_reg__
	ldi r20,lo8(64)
	ldi r21,lo8(1)
	ldi r22,0
	ldi r23,0
	ldi r24,0
	ldi r25,0
	call ILI9340_fillRect
.L105:
/* epilogue start */
	pop r17
	pop r16
	ret
	.size	erase_cursor_to_begin, .-erase_cursor_to_begin
	.section	.text.erase_screen,"ax",@progbits
.global	erase_screen
	.type	erase_screen, @function
erase_screen:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,bgcolor
	lds r25,bgcolor+1
	jmp ILI9340_fillScreen
	.size	erase_screen, .-erase_screen
	.section	.text.erase_characters,"ax",@progbits
.global	erase_characters
	.type	erase_characters, @function
erase_characters:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	lds r30,cursorX
	ldi r18,lo8(4)
	mul r30,r18
	movw r30,r0
	clr __zero_reg__
	lds r22,cursorY
	ldi r25,lo8(6)
	mul r22,r25
	movw r22,r0
	clr __zero_reg__
	ldi r18,lo8(4)
	mul r24,r18
	movw r20,r0
	clr __zero_reg__
	movw r24,r20
	add r24,r30
	adc r25,r31
	cpi r24,65
	sbci r25,1
	brlo .L112
	ldi r20,lo8(64)
	ldi r21,lo8(1)
	sub r20,r30
	sbc r21,r31
.L112:
	lds r16,bgcolor
	lds r17,bgcolor+1
	ldi r18,lo8(6)
	ldi r19,0
	movw r24,r30
	call ILI9340_fillRect
/* epilogue start */
	pop r17
	pop r16
	ret
	.size	erase_characters, .-erase_characters
	.section	.text.scroll_up,"ax",@progbits
.global	scroll_up
	.type	scroll_up, @function
scroll_up:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	scroll_up, .-scroll_up
	.section	.text.scroll_down,"ax",@progbits
.global	scroll_down
	.type	scroll_down, @function
scroll_down:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	scroll_down, .-scroll_down
	.section	.text.tx_dec,"ax",@progbits
.global	tx_dec
	.type	tx_dec, @function
tx_dec:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	rcall .
	rcall .
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 5 */
/* stack size = 13 */
.L__stack_usage = 13
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	ldi r18,lo8(5)
	movw r30,r16
	0:
	st Z+,__zero_reg__
	dec r18
	brne 0b
	ldi r22,lo8(16)
	ldi r23,lo8(39)
	call __udivmodhi4
	movw r12,r22
	std Y+1,r22
	ldi r22,lo8(-24)
	ldi r23,lo8(3)
	call __udivmodhi4
	movw r14,r22
	std Y+2,r22
	ldi r22,lo8(100)
	ldi r23,0
	call __udivmodhi4
	movw r30,r22
	std Y+3,r22
	ldi r22,lo8(10)
	ldi r23,0
	call __udivmodhi4
	std Y+4,r22
	std Y+5,r24
	or r12,r13
	brne .L118
	or r14,r15
	brne .L119
	or r30,r31
	brne .L120
	or r22,r23
	breq .L121
	ldi r24,lo8(3)
	rjmp .L117
.L118:
	ldi r24,0
	rjmp .L117
.L119:
	ldi r24,lo8(1)
	rjmp .L117
.L120:
	ldi r24,lo8(2)
	rjmp .L117
.L121:
	ldi r24,lo8(4)
.L117:
	clr r15
	inc r15
	add r15,r24
	movw r30,r16
	add r30,r24
	adc r31,__zero_reg__
	ld r24,Z
	subi r24,lo8(-(48))
	call tx_char
	mov r24,r15
	cpi r24,lo8(5)
	brne .L117
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	tx_dec, .-tx_dec
	.section	.text.tx_str,"ax",@progbits
.global	tx_str
	.type	tx_str, @function
tx_str:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r30,r24
.L125:
/* #APP */
 ;  319 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/vt.c" 1
	lpm r24, Z
	
 ;  0 "" 2
/* #NOAPP */
	movw r28,r30
	adiw r28,1
	tst r24
	breq .L123
	call tx_char
	movw r30,r28
	rjmp .L125
.L123:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	tx_str, .-tx_str
.global	colors
	.section	.progmem.data.colors,"a",@progbits
	.type	colors, @object
	.size	colors, 32
colors:
	.word	0
	.word	-14336
	.word	1632
	.word	-12704
	.word	29
	.word	-14311
	.word	1657
	.word	-23276
	.word	6371
	.word	-2048
	.word	2016
	.word	-32
	.word	23295
	.word	-2017
	.word	2047
	.word	-1
	.section	.bss.tabstops,"aw",@nobits
	.type	tabstops, @object
	.size	tabstops, 80
tabstops:
	.zero	80
.global	auto_wrap
	.section	.data.auto_wrap,"aw",@progbits
	.type	auto_wrap, @object
	.size	auto_wrap, 1
auto_wrap:
	.byte	1
.global	bgcolor
	.section	.bss.bgcolor,"aw",@nobits
	.type	bgcolor, @object
	.size	bgcolor, 2
bgcolor:
	.zero	2
.global	fgcolor
	.section	.data.fgcolor,"aw",@progbits
	.type	fgcolor, @object
	.size	fgcolor, 2
fgcolor:
	.word	-1
.global	cursorY
	.section	.bss.cursorY,"aw",@nobits
	.type	cursorY, @object
	.size	cursorY, 1
cursorY:
	.zero	1
.global	cursorX
	.section	.bss.cursorX,"aw",@nobits
	.type	cursorX, @object
	.size	cursorX, 1
cursorX:
	.zero	1
.global	mode
	.section	.data.mode,"aw",@progbits
	.type	mode, @object
	.size	mode, 1
mode:
	.byte	2
	.ident	"GCC: (GNU) 4.9.2"
.global __do_copy_data
.global __do_clear_bss
