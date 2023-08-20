	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.text.tx_char,"ax",@progbits
.global	tx_char
	.type	tx_char, @function
tx_char:
	push r28
	push r29
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 3 */
.L__stack_usage = 3
	std Y+1,r24
	ldi r22,lo8(1)
	movw r24,r28
	adiw r24,1
	call USART_send
/* epilogue start */
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.size	tx_char, .-tx_char
	.section	.text.init_pins,"ax",@progbits
.global	init_pins
	.type	init_pins, @function
init_pins:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r24,0xa
	ori r24,lo8(120)
	out 0xa,r24
	cbi 0xa,7
	in r24,0x7
	andi r24,lo8(-4)
	out 0x7,r24
	ret
	.size	init_pins, .-init_pins
	.section	.text.sequence,"ax",@progbits
.global	sequence
	.type	sequence, @function
sequence:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r30,r24
.L5:
/* #APP */
 ;  51 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/main.c" 1
	lpm r24, Z
	
 ;  0 "" 2
/* #NOAPP */
	movw r28,r30
	adiw r28,1
	tst r24
	breq .L3
	call rx_char
	movw r30,r28
	rjmp .L5
.L3:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	sequence, .-sequence
	.section	.text.read_buttons,"ax",@progbits
.global	read_buttons
	.type	read_buttons, @function
read_buttons:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,buttons
	sts buttons_old,r24
	sts buttons,__zero_reg__
	sbic 0x9,7
	rjmp .L8
	ldi r24,lo8(1)
	sts buttons,r24
.L8:
	sbic 0x6,0
	rjmp .L9
	lds r24,buttons
	ori r24,lo8(2)
	sts buttons,r24
.L9:
	sbic 0x6,1
	rjmp .L7
	lds r24,buttons
	ori r24,lo8(4)
	sts buttons,r24
.L7:
	ret
	.size	read_buttons, .-read_buttons
	.section	.text.startup.main,"ax",@progbits
.global	main
	.type	main, @function
main:
	push r28
	push r29
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 3 */
.L__stack_usage = 3
	call init_pins
	in r24,0xb
	andi r24,lo8(-89)
	out 0xb,r24
	ldi r22,lo8(6)
	ldi r24,lo8(-49)
	ldi r25,0
	call USART_init
/* #APP */
 ;  77 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/main.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	call GX_init
	ldi r24,0
	ldi r25,0
	call ILI9340_fillScreen
	call VT_init
	ldi r24,lo8(1)
	call ILI9340_setRotation
	sbi 0xb,5
	in r24,0xb
	ori r24,lo8(80)
	out 0xb,r24
	ldi r24,lo8(welcome_text)
	ldi r25,hi8(welcome_text)
	call sequence
	ldi r18,lo8(6399999)
	ldi r24,hi8(6399999)
	ldi r25,hlo8(6399999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
	ldi r24,lo8(reset)
	ldi r25,hi8(reset)
	call sequence
	in r24,0xb
	ori r24,lo8(88)
	out 0xb,r24
	ldi r17,lo8(2)
.L12:
	call read_buttons
	movw r24,r28
	adiw r24,1
	call USART_readByte
	tst r24
	breq .L13
	cbi 0xb,6
	ldd r24,Y+1
	call rx_char
	sbi 0xb,6
.L13:
	lds r24,buttons
	sbrs r24,0
	rjmp .L14
	lds r24,buttons_old
	sbrs r24,0
	call VT_reset
.L14:
	lds r24,buttons
	sbrs r24,1
	rjmp .L15
	lds r24,buttons_old
	sbrc r24,1
	rjmp .L15
	sts mode,__zero_reg__
	call VT_reset
.L15:
	lds r24,buttons
	sbrs r24,2
	rjmp .L16
	lds r24,buttons_old
	sbrc r24,2
	rjmp .L16
	sts mode,r17
	call VT_reset
.L16:
	lds r24,mode
	cpi r24,lo8(2)
	brne .L17
	cbi 0xb,4
	rjmp .L12
.L17:
	sbi 0xb,4
	rjmp .L12
	.size	main, .-main
.global	reset
	.section	.progmem.data.reset,"a",@progbits
	.type	reset, @object
	.size	reset, 7
reset:
	.string	"\033[H\033[J"
.global	welcome_text
	.section	.progmem.data.welcome_text,"a",@progbits
	.type	welcome_text, @object
	.size	welcome_text, 20
welcome_text:
	.string	"VT220 Emulator v1.0"
	.section	.bss.buttons,"aw",@nobits
	.type	buttons, @object
	.size	buttons, 1
buttons:
	.zero	1
	.section	.bss.buttons_old,"aw",@nobits
	.type	buttons_old, @object
	.size	buttons_old, 1
buttons_old:
	.zero	1
	.ident	"GCC: (GNU) 4.9.2"
.global __do_clear_bss
