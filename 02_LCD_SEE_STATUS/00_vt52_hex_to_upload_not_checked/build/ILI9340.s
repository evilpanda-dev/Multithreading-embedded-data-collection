	.file	"ILI9340.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.text.spiwrite_with_abandon,"ax",@progbits
	.type	spiwrite_with_abandon, @function
spiwrite_with_abandon:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	out 0x2e,r24
/* #APP */
 ;  55 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  55 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  55 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  55 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  55 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  55 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  55 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  55 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  55 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  55 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  55 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	ret
	.size	spiwrite_with_abandon, .-spiwrite_with_abandon
	.section	.text.spiwrite,"ax",@progbits
	.type	spiwrite, @function
spiwrite:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	out 0x2e,r24
/* #APP */
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  67 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	ret
	.size	spiwrite, .-spiwrite
	.section	.text.ILI9340_writecommand,"ax",@progbits
.global	ILI9340_writecommand
	.type	ILI9340_writecommand, @function
ILI9340_writecommand:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cbi 0x5,1
	cbi 0x5,5
	cbi 0x5,2
	call spiwrite
	sbi 0x5,2
	ret
	.size	ILI9340_writecommand, .-ILI9340_writecommand
	.section	.text.ILI9340_writedata,"ax",@progbits
.global	ILI9340_writedata
	.type	ILI9340_writedata, @function
ILI9340_writedata:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbi 0x5,1
	cbi 0x5,5
	cbi 0x5,2
	call spiwrite
	sbi 0x5,2
	ret
	.size	ILI9340_writedata, .-ILI9340_writedata
	.section	.text.ILI9340_commandList,"ax",@progbits
.global	ILI9340_commandList
	.type	ILI9340_commandList, @function
ILI9340_commandList:
	push r12
	push r13
	push r14
	push r15
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	movw r28,r24
	adiw r28,1
	movw r30,r24
/* #APP */
 ;  97 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	lpm r17, Z
	
 ;  0 "" 2
/* #NOAPP */
.L6:
	tst r17
	breq .L11
	movw r30,r28
/* #APP */
 ;  99 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	lpm r24, Z
	
 ;  0 "" 2
/* #NOAPP */
	call ILI9340_writecommand
	movw r12,r28
	ldi r31,2
	add r12,r31
	adc r13,__zero_reg__
	movw r30,r28
	adiw r30,1
/* #APP */
 ;  100 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	lpm r28, Z
	
 ;  0 "" 2
/* #NOAPP */
	movw r14,r12
	mov r29,r28
	add r29,r12
.L7:
	cp r29,r14
	breq .L12
	movw r30,r14
/* #APP */
 ;  106 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	lpm r24, Z
	
 ;  0 "" 2
/* #NOAPP */
	call ILI9340_writedata
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
	rjmp .L7
.L12:
	movw r24,r12
	add r24,r28
	adc r25,__zero_reg__
	movw r28,r24
	subi r17,lo8(-(-1))
	rjmp .L6
.L11:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	ILI9340_commandList, .-ILI9340_commandList
	.section	.text.ILI9340_init,"ax",@progbits
.global	ILI9340_init
	.type	ILI9340_init, @function
ILI9340_init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbi 0x4,0
	cbi 0x5,0
	sbi 0x4,1
	sbi 0x4,2
	call SPI_init
	ldi r24,lo8(4)
	call SPI_setClockDivider
	ldi r24,lo8(1)
	call SPI_setBitOrder
	ldi r24,0
	call SPI_setDataMode
	sbi 0x5,0
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	cbi 0x5,0
	ldi r25,lo8(63999)
	ldi r18,hi8(63999)
	ldi r24,hlo8(63999)
1:	subi r25,1
	sbci r18,0
	sbci r24,0
	brne 1b
	rjmp .
	nop
	sbi 0x5,0
	ldi r25,lo8(479999)
	ldi r18,hi8(479999)
	ldi r24,hlo8(479999)
1:	subi r25,1
	sbci r18,0
	sbci r24,0
	brne 1b
	rjmp .
	nop
	ldi r24,lo8(init_sequence)
	ldi r25,hi8(init_sequence)
	call ILI9340_commandList
	ldi r25,lo8(383999)
	ldi r18,hi8(383999)
	ldi r24,hlo8(383999)
1:	subi r25,1
	sbci r18,0
	sbci r24,0
	brne 1b
	rjmp .
	nop
	ldi r24,lo8(41)
	call ILI9340_writecommand
	ldi r24,lo8(44)
	jmp ILI9340_writecommand
	.size	ILI9340_init, .-ILI9340_init
	.section	.text.ILI9340_setAddrWindow,"ax",@progbits
.global	ILI9340_setAddrWindow
	.type	ILI9340_setAddrWindow, @function
ILI9340_setAddrWindow:
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,7
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 7 */
/* stack size = 10 */
.L__stack_usage = 10
	mov r17,r24
	ldi r24,lo8(42)
	std Y+7,r18
	std Y+6,r19
	std Y+3,r20
	std Y+2,r21
	std Y+5,r22
	std Y+4,r23
	std Y+1,r25
	call ILI9340_writecommand
	ldd r25,Y+1
	mov r24,r25
	call ILI9340_writedata
	mov r24,r17
	call ILI9340_writedata
	ldd r21,Y+2
	mov r24,r21
	call ILI9340_writedata
	ldd r20,Y+3
	mov r24,r20
	call ILI9340_writedata
	ldi r24,lo8(43)
	call ILI9340_writecommand
	ldd r23,Y+4
	mov r24,r23
	call ILI9340_writedata
	ldd r22,Y+5
	mov r24,r22
	call ILI9340_writedata
	ldd r19,Y+6
	mov r24,r19
	call ILI9340_writedata
	ldd r18,Y+7
	mov r24,r18
/* epilogue start */
	adiw r28,7
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	jmp ILI9340_writedata
	.size	ILI9340_setAddrWindow, .-ILI9340_setAddrWindow
	.section	.text.ILI9340_pushColor,"ax",@progbits
.global	ILI9340_pushColor
	.type	ILI9340_pushColor, @function
ILI9340_pushColor:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	sbi 0x5,1
	cbi 0x5,2
	mov r24,r25
	call spiwrite
	mov r24,r28
	call spiwrite_with_abandon
	sbi 0x5,2
/* epilogue start */
	pop r28
	ret
	.size	ILI9340_pushColor, .-ILI9340_pushColor
	.section	.text.ILI9340_drawPixel,"ax",@progbits
.global	ILI9340_drawPixel
	.type	ILI9340_drawPixel, @function
ILI9340_drawPixel:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r20
	movw r18,r22
	movw r20,r24
	call ILI9340_setAddrWindow
	ldi r24,lo8(44)
	call ILI9340_writecommand
	sbi 0x5,1
	cbi 0x5,2
	mov r24,r29
	call spiwrite
	mov r24,r28
	call spiwrite_with_abandon
	sbi 0x5,2
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	ILI9340_drawPixel, .-ILI9340_drawPixel
	.section	.text.ILI9340_begin,"ax",@progbits
.global	ILI9340_begin
	.type	ILI9340_begin, @function
ILI9340_begin:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r22
	sbiw r30,1
	movw r26,r30
	add r26,r18
	adc r27,__zero_reg__
	movw r18,r26
	movw r30,r24
	sbiw r30,1
	movw r26,r30
	add r26,r20
	adc r27,__zero_reg__
	movw r20,r26
	call ILI9340_setAddrWindow
	ldi r24,lo8(44)
	call ILI9340_writecommand
	sbi 0x5,1
	cbi 0x5,2
	ret
	.size	ILI9340_begin, .-ILI9340_begin
	.section	.text.ILI9340_end,"ax",@progbits
.global	ILI9340_end
	.type	ILI9340_end, @function
ILI9340_end:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbi 0x5,2
	ret
	.size	ILI9340_end, .-ILI9340_end
	.section	.text.ILI9340_pixel,"ax",@progbits
.global	ILI9340_pixel
	.type	ILI9340_pixel, @function
ILI9340_pixel:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	mov r24,r25
	call spiwrite
	mov r24,r28
/* epilogue start */
	pop r28
	jmp spiwrite_with_abandon
	.size	ILI9340_pixel, .-ILI9340_pixel
	.section	.text.ILI9340_drawVLine,"ax",@progbits
.global	ILI9340_drawVLine
	.type	ILI9340_drawVLine, @function
ILI9340_drawVLine:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	lds r30,__width
	lds r31,__width+1
	cp r24,r30
	cpc r25,r31
	brsh .L20
	lds r26,__height
	lds r27,__height+1
	cp r22,r26
	cpc r23,r27
	brsh .L20
	movw r30,r22
	sbiw r30,1
	movw r28,r20
	add r28,r30
	adc r29,r31
	cp r28,r26
	cpc r29,r27
	brsh .L22
	movw r28,r20
	rjmp .L23
.L22:
	movw r28,r26
	sub r28,r22
	sbc r29,r23
.L23:
	cp __zero_reg__,r28
	cpc __zero_reg__,r29
	brlt .L24
	ldi r28,lo8(1)
	ldi r29,0
.L24:
	mov r16,r19
	mov r17,r18
	movw r18,r28
	add r18,r30
	adc r19,r31
	movw r20,r24
	call ILI9340_setAddrWindow
	ldi r24,lo8(44)
	call ILI9340_writecommand
	sbi 0x5,1
	cbi 0x5,2
.L25:
	sbiw r28,1
	brcs .L27
	mov r24,r16
	call spiwrite
	mov r24,r17
	call spiwrite
	rjmp .L25
.L27:
	sbi 0x5,2
.L20:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	ILI9340_drawVLine, .-ILI9340_drawVLine
	.section	.text.ILI9340_drawHLine,"ax",@progbits
.global	ILI9340_drawHLine
	.type	ILI9340_drawHLine, @function
ILI9340_drawHLine:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	lds r26,__width
	lds r27,__width+1
	cp r24,r26
	cpc r25,r27
	brsh .L28
	lds r30,__height
	lds r31,__height+1
	cp r22,r30
	cpc r23,r31
	brsh .L28
	movw r30,r24
	sbiw r30,1
	movw r28,r20
	add r28,r30
	adc r29,r31
	cp r28,r26
	cpc r29,r27
	brsh .L30
	movw r28,r20
	rjmp .L31
.L30:
	movw r28,r26
	sub r28,r24
	sbc r29,r25
.L31:
	cp __zero_reg__,r28
	cpc __zero_reg__,r29
	brlt .L32
	ldi r28,lo8(1)
	ldi r29,0
.L32:
	mov r16,r19
	mov r17,r18
	movw r20,r28
	add r20,r30
	adc r21,r31
	movw r18,r22
	call ILI9340_setAddrWindow
	ldi r24,lo8(44)
	call ILI9340_writecommand
	sbi 0x5,1
	cbi 0x5,2
.L33:
	sbiw r28,1
	brcs .L35
	mov r24,r16
	call spiwrite
	mov r24,r17
	call spiwrite
	rjmp .L33
.L35:
	sbi 0x5,2
.L28:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	ILI9340_drawHLine, .-ILI9340_drawHLine
	.section	.text.ILI9340_fillRect,"ax",@progbits
.global	ILI9340_fillRect
	.type	ILI9340_fillRect, @function
ILI9340_fillRect:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 8 */
.L__stack_usage = 8
	movw r12,r20
	movw r28,r18
	movw r18,r22
	subi r18,1
	sbc r19,__zero_reg__
	add r18,r28
	adc r19,r29
	movw r30,r24
	sbiw r30,1
	movw r20,r30
	add r20,r12
	adc r21,r13
	call ILI9340_setAddrWindow
	ldi r24,lo8(44)
	call ILI9340_writecommand
	sbi 0x5,1
	cbi 0x5,2
.L37:
	cp __zero_reg__,r28
	cpc __zero_reg__,r29
	brge .L39
	movw r14,r12
.L40:
	cp __zero_reg__,r14
	cpc __zero_reg__,r15
	brge .L41
	mov r24,r17
	call spiwrite
	out 0x2e,r16
/* #APP */
 ;  61 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  61 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  61 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  61 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  61 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  61 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
 ;  61 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/ILI9340.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	ldi r24,1
	sub r14,r24
	sbc r15,__zero_reg__
	rjmp .L40
.L41:
	sbiw r28,1
	rjmp .L37
.L39:
	sbi 0x5,2
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	ILI9340_fillRect, .-ILI9340_fillRect
	.section	.text.ILI9340_fillScreen,"ax",@progbits
.global	ILI9340_fillScreen
	.type	ILI9340_fillScreen, @function
ILI9340_fillScreen:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	lds r18,__height
	lds r19,__height+1
	lds r20,__width
	lds r21,__width+1
	movw r16,r24
	ldi r22,0
	ldi r23,0
	ldi r24,0
	ldi r25,0
	call ILI9340_fillRect
/* epilogue start */
	pop r17
	pop r16
	ret
	.size	ILI9340_fillScreen, .-ILI9340_fillScreen
	.section	.text.ILI9340_color565,"ax",@progbits
.global	ILI9340_color565
	.type	ILI9340_color565, @function
ILI9340_color565:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	andi r22,lo8(-4)
	ldi r18,lo8(8)
	mul r22,r18
	movw r22,r0
	clr __zero_reg__
	lsr r20
	lsr r20
	lsr r20
	or r22,r20
	andi r24,lo8(-8)
	movw r18,r22
	or r19,r24
	movw r24,r18
	ret
	.size	ILI9340_color565, .-ILI9340_color565
	.section	.text.ILI9340_setRotation,"ax",@progbits
.global	ILI9340_setRotation
	.type	ILI9340_setRotation, @function
ILI9340_setRotation:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	ldi r24,lo8(54)
	call ILI9340_writecommand
	mov r24,r28
	andi r24,lo8(3)
	cpi r24,lo8(2)
	breq .L46
	cpi r24,lo8(3)
	breq .L47
	cpi r24,lo8(1)
	breq .L48
	ldi r24,lo8(72)
	rjmp .L52
.L48:
	ldi r24,lo8(40)
	rjmp .L50
.L46:
	ldi r24,lo8(-120)
.L52:
	call ILI9340_writedata
	ldi r24,lo8(-16)
	ldi r25,0
	sts __width+1,r25
	sts __width,r24
	ldi r24,lo8(64)
	ldi r25,lo8(1)
	rjmp .L51
.L47:
	ldi r24,lo8(-24)
.L50:
	call ILI9340_writedata
	ldi r24,lo8(64)
	ldi r25,lo8(1)
	sts __width+1,r25
	sts __width,r24
	ldi r24,lo8(-16)
	ldi r25,0
.L51:
	sts __height+1,r25
	sts __height,r24
/* epilogue start */
	pop r28
	ret
	.size	ILI9340_setRotation, .-ILI9340_setRotation
	.section	.text.ILI9340_invertDisplay,"ax",@progbits
.global	ILI9340_invertDisplay
	.type	ILI9340_invertDisplay, @function
ILI9340_invertDisplay:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpse r24,__zero_reg__
	rjmp .L55
	ldi r24,lo8(32)
	rjmp .L54
.L55:
	ldi r24,lo8(33)
.L54:
	jmp ILI9340_writecommand
	.size	ILI9340_invertDisplay, .-ILI9340_invertDisplay
	.section	.text.ILI9340_scrollingDefinition,"ax",@progbits
.global	ILI9340_scrollingDefinition
	.type	ILI9340_scrollingDefinition, @function
ILI9340_scrollingDefinition:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r14,r24
	movw r16,r22
	lds r28,__height
	lds r29,__height+1
	sub r28,r24
	sbc r29,r25
	sub r28,r22
	sbc r29,r23
	ldi r24,lo8(51)
	call ILI9340_writecommand
	mov r24,r15
	call ILI9340_writedata
	mov r24,r14
	call ILI9340_writedata
	mov r24,r29
	call ILI9340_writedata
	mov r24,r28
	call ILI9340_writedata
	mov r24,r17
	call ILI9340_writedata
	mov r24,r16
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	jmp ILI9340_writedata
	.size	ILI9340_scrollingDefinition, .-ILI9340_scrollingDefinition
	.section	.text.ILI9340_scrollPosition,"ax",@progbits
.global	ILI9340_scrollPosition
	.type	ILI9340_scrollPosition, @function
ILI9340_scrollPosition:
	push r17
	push r28
	push r29
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 4 */
.L__stack_usage = 4
	mov r17,r24
	ldi r24,lo8(55)
	std Y+1,r25
	call ILI9340_writecommand
	ldd r25,Y+1
	mov r24,r25
	call ILI9340_writedata
	mov r24,r17
/* epilogue start */
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	jmp ILI9340_writedata
	.size	ILI9340_scrollPosition, .-ILI9340_scrollPosition
	.section	.text.ILI9340_width,"ax",@progbits
.global	ILI9340_width
	.type	ILI9340_width, @function
ILI9340_width:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,__width
	lds r25,__width+1
	ret
	.size	ILI9340_width, .-ILI9340_width
	.section	.text.ILI9340_height,"ax",@progbits
.global	ILI9340_height
	.type	ILI9340_height, @function
ILI9340_height:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,__height
	lds r25,__height+1
	ret
	.size	ILI9340_height, .-ILI9340_height
	.section	.text.spiread,"ax",@progbits
.global	spiread
	.type	spiread, @function
spiread:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	out 0x2e,__zero_reg__
.L61:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L61
	in r24,0x2e
	ret
	.size	spiread, .-spiread
	.section	.text.ILI9340_readdata,"ax",@progbits
.global	ILI9340_readdata
	.type	ILI9340_readdata, @function
ILI9340_readdata:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbi 0x5,1
	cbi 0x5,2
	call spiread
	sbi 0x5,2
	ret
	.size	ILI9340_readdata, .-ILI9340_readdata
	.section	.text.ILI9340_scroll_up,"ax",@progbits
.global	ILI9340_scroll_up
	.type	ILI9340_scroll_up, @function
ILI9340_scroll_up:
	push r6
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,-128
	sbci r29,2
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 640 */
/* stack size = 654 */
.L__stack_usage = 654
	movw r12,r24
	movw r16,r22
	lds r10,__width
	lds r11,__width+1
	lsl r10
	rol r11
	lds r14,__height
	lds r15,__height+1
	ldi r24,1
	sub r14,r24
	sbc r15,__zero_reg__
	movw r30,r28
	adiw r30,1
	movw r8,r30
.L65:
	lds r20,__width
	lds r21,__width+1
	cp r14,r12
	cpc r15,r13
	brsh .+2
	rjmp .L71
	subi r20,1
	sbc r21,__zero_reg__
	movw r18,r14
	movw r22,r14
	ldi r24,0
	ldi r25,0
	call ILI9340_setAddrWindow
	ldi r24,lo8(46)
	call ILI9340_writecommand
	sbi 0x5,1
	cbi 0x5,2
	movw r6,r8
.L66:
	movw r24,r6
	sub r24,r8
	sbc r25,r9
	cp r24,r10
	cpc r25,r11
	brsh .L72
	call spiread
	movw r30,r6
	st Z,r24
	call spiread
	movw r30,r6
	std Z+1,r24
	ldi r31,2
	add r6,r31
	adc r7,__zero_reg__
	rjmp .L66
.L72:
	sbi 0x5,2
	lds r20,__width
	lds r21,__width+1
	subi r20,1
	sbc r21,__zero_reg__
	movw r22,r14
	sub r22,r12
	sbc r23,r13
	movw r18,r22
	ldi r24,0
	ldi r25,0
	call ILI9340_setAddrWindow
	ldi r24,lo8(44)
	call ILI9340_writecommand
	sbi 0x5,1
	cbi 0x5,2
	movw r6,r8
.L68:
	movw r24,r6
	sub r24,r8
	sbc r25,r9
	cp r24,r10
	cpc r25,r11
	brsh .L73
	movw r30,r6
	ld r24,Z+
	movw r6,r30
	call spiwrite_with_abandon
	rjmp .L68
.L73:
	sbi 0x5,2
	ldi r31,1
	sub r14,r31
	sbc r15,__zero_reg__
	rjmp .L65
.L71:
	lds r22,__height
	lds r23,__height+1
	sub r22,r12
	sbc r23,r13
	movw r18,r12
	ldi r24,0
	ldi r25,0
	call ILI9340_fillRect
/* epilogue start */
	subi r28,-128
	sbci r29,-3
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	ret
	.size	ILI9340_scroll_up, .-ILI9340_scroll_up
	.section	.progmem.data.init_sequence,"a",@progbits
	.type	init_sequence, @object
	.size	init_sequence, 101
init_sequence:
	.byte	19
	.byte	-53
	.byte	5
	.byte	57
	.byte	44
	.byte	0
	.byte	52
	.byte	2
	.byte	-49
	.byte	3
	.byte	0
	.byte	-63
	.byte	48
	.byte	-24
	.byte	3
	.byte	-123
	.byte	0
	.byte	120
	.byte	-22
	.byte	2
	.byte	0
	.byte	0
	.byte	-19
	.byte	4
	.byte	100
	.byte	3
	.byte	18
	.byte	-127
	.byte	-9
	.byte	1
	.byte	32
	.byte	-64
	.byte	1
	.byte	35
	.byte	-63
	.byte	1
	.byte	16
	.byte	-59
	.byte	2
	.byte	62
	.byte	40
	.byte	-57
	.byte	1
	.byte	-122
	.byte	54
	.byte	1
	.byte	-56
	.byte	58
	.byte	1
	.byte	85
	.byte	-79
	.byte	2
	.byte	0
	.byte	24
	.byte	-74
	.byte	3
	.byte	8
	.byte	-126
	.byte	39
	.byte	-14
	.byte	1
	.byte	0
	.byte	38
	.byte	1
	.byte	1
	.byte	-32
	.byte	15
	.byte	15
	.byte	49
	.byte	43
	.byte	12
	.byte	14
	.byte	8
	.byte	78
	.byte	-15
	.byte	55
	.byte	7
	.byte	16
	.byte	3
	.byte	14
	.byte	9
	.byte	0
	.byte	-31
	.byte	15
	.byte	0
	.byte	14
	.byte	20
	.byte	3
	.byte	17
	.byte	7
	.byte	49
	.byte	-63
	.byte	72
	.byte	8
	.byte	15
	.byte	12
	.byte	49
	.byte	54
	.byte	15
	.byte	17
	.byte	0
	.section	.data.__height,"aw",@progbits
	.type	__height, @object
	.size	__height, 2
__height:
	.word	320
	.section	.data.__width,"aw",@progbits
	.type	__width, @object
	.size	__width, 2
__width:
	.word	240
	.ident	"GCC: (GNU) 4.9.2"
.global __do_copy_data
