	.file	"usart.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.text.USART_init,"ax",@progbits
.global	USART_init
	.type	USART_init, @function
USART_init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts 197,r25
	sts 196,r24
	ldi r30,lo8(-64)
	ldi r31,0
	ld r24,Z
	ori r24,lo8(2)
	st Z,r24
	ldi r26,lo8(-63)
	ldi r27,0
	ld r24,X
	ori r24,lo8(-104)
	st X,r24
	ld r24,X
	andi r24,lo8(-101)
	st X,r24
	ld r24,Z
	andi r24,lo8(-2)
	st Z,r24
	sts 194,r22
	sts tx_write,__zero_reg__
	sts tx_read,__zero_reg__
	sts rx_write,__zero_reg__
	sts rx_read,__zero_reg__
	sts paused,__zero_reg__
	ret
	.size	USART_init, .-USART_init
	.section	.text.USART_available,"ax",@progbits
.global	USART_available
	.type	USART_available, @function
USART_available:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,rx_write
	lds r25,rx_read
	sub r24,r25
	andi r24,lo8(63)
	ret
	.size	USART_available, .-USART_available
	.section	.text.USART_receive,"ax",@progbits
.global	USART_receive
	.type	USART_receive, @function
USART_receive:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L4:
	lds r24,192
	sbrs r24,7
	rjmp .L4
	lds r24,198
	ret
	.size	USART_receive, .-USART_receive
	.section	.text.USART_free,"ax",@progbits
.global	USART_free
	.type	USART_free, @function
USART_free:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r25,rx_write
	lds r24,rx_read
	cp r25,r24
	brlo .L8
	subi r24,lo8(-(62))
	rjmp .L10
.L8:
	subi r24,lo8(-(-1))
.L10:
	sub r24,r25
	ret
	.size	USART_free, .-USART_free
	.section	.text.USART_canRead,"ax",@progbits
.global	USART_canRead
	.type	USART_canRead, @function
USART_canRead:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	lds r18,rx_read
	lds r25,rx_write
	cpse r18,r25
	rjmp .L12
	ldi r24,0
.L12:
	ret
	.size	USART_canRead, .-USART_canRead
	.section	.text.USART_read,"ax",@progbits
.global	USART_read
	.type	USART_read, @function
USART_read:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r18,rx_read
	lds r20,rx_write
	mov r19,r24
	movw r30,r24
.L14:
	mov r24,r30
	sub r24,r19
	cp r24,r22
	brsh .L19
	cp r18,r20
	breq .L19
	mov r26,r18
	ldi r27,0
	subi r26,lo8(-(rxbuffer))
	sbci r27,hi8(-(rxbuffer))
	ld r24,X
	st Z+,r24
	subi r18,lo8(-(1))
	andi r18,lo8(63)
	rjmp .L14
.L19:
	sts rx_read,r18
	ret
	.size	USART_read, .-USART_read
	.section	.text.USART_readByte,"ax",@progbits
.global	USART_readByte
	.type	USART_readByte, @function
USART_readByte:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	lds r25,rx_read
	lds r24,rx_write
	cp r25,r24
	breq .L22
	mov r30,r25
	ldi r31,0
	subi r30,lo8(-(rxbuffer))
	sbci r31,hi8(-(rxbuffer))
	ld r24,Z
	st X,r24
	subi r25,lo8(-(1))
	andi r25,lo8(63)
	sts rx_read,r25
	ldi r24,lo8(1)
	ret
.L22:
	ldi r24,0
	ret
	.size	USART_readByte, .-USART_readByte
	.section	.text.USART_send,"ax",@progbits
.global	USART_send
	.type	USART_send, @function
USART_send:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r20,__SREG__
/* #APP */
 ;  130 "/media/sf_EFFORT/02a_ODROID_SHOW2_VT100_01_USER_02_KERNEL_VBOX/03_CODE/ODROID_XU4/vt-master/usart.c" 1
	cli
 ;  0 "" 2
/* #NOAPP */
	lds r19,tx_write
	lds r18,tx_read
	cp r19,r18
	brlo .L24
	subi r18,lo8(-(63))
	rjmp .L30
.L24:
	subi r18,lo8(-(-1))
.L30:
	sub r18,r19
	cp r18,r22
	brlo .L26
	mov r18,r24
	movw r30,r24
	rjmp .L27
.L26:
	out __SREG__,r20
	ldi r24,0
	ret
.L27:
	mov r24,r30
	sub r24,r18
	cp r24,r22
	brsh .L31
	ld r24,Z+
	mov r26,r19
	ldi r27,0
	subi r26,lo8(-(txbuffer))
	sbci r27,hi8(-(txbuffer))
	st X,r24
	subi r19,lo8(-(1))
	andi r19,lo8(63)
	rjmp .L27
.L31:
	sts tx_write,r19
	lds r24,193
	ori r24,lo8(32)
	sts 193,r24
	out __SREG__,r20
	ldi r24,lo8(1)
	ret
	.size	USART_send, .-USART_send
	.section	.text.__vector_19,"ax",@progbits
.global	__vector_19
	.type	__vector_19, @function
__vector_19:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r24
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	lds r30,tx_read
	lds r24,tx_write
	cpse r30,r24
	rjmp .L33
	lds r24,193
	andi r24,lo8(-33)
	sts 193,r24
	rjmp .L32
.L33:
	ldi r24,lo8(1)
	add r24,r30
	sts tx_read,r24
	ldi r31,0
	subi r30,lo8(-(txbuffer))
	sbci r31,hi8(-(txbuffer))
	ld r24,Z
	sts 198,r24
	lds r24,tx_read
	andi r24,lo8(63)
	sts tx_read,r24
.L32:
/* epilogue start */
	pop r31
	pop r30
	pop r24
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.size	__vector_19, .-__vector_19
	.section	.text.__vector_18,"ax",@progbits
.global	__vector_18
	.type	__vector_18, @function
__vector_18:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r24
	push r25
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	lds r30,rx_write
	ldi r24,lo8(1)
	add r24,r30
	sts rx_write,r24
	lds r25,198
	ldi r31,0
	subi r30,lo8(-(rxbuffer))
	sbci r31,hi8(-(rxbuffer))
	st Z,r25
	andi r24,lo8(63)
	sts rx_write,r24
/* epilogue start */
	pop r31
	pop r30
	pop r25
	pop r24
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.size	__vector_18, .-__vector_18
	.section	.bss.paused,"aw",@nobits
	.type	paused, @object
	.size	paused, 1
paused:
	.zero	1
	.section	.bss.rxbuffer,"aw",@nobits
	.type	rxbuffer, @object
	.size	rxbuffer, 64
rxbuffer:
	.zero	64
	.section	.bss.txbuffer,"aw",@nobits
	.type	txbuffer, @object
	.size	txbuffer, 64
txbuffer:
	.zero	64
	.section	.bss.rx_write,"aw",@nobits
	.type	rx_write, @object
	.size	rx_write, 1
rx_write:
	.zero	1
	.section	.bss.rx_read,"aw",@nobits
	.type	rx_read, @object
	.size	rx_read, 1
rx_read:
	.zero	1
	.section	.bss.tx_write,"aw",@nobits
	.type	tx_write, @object
	.size	tx_write, 1
tx_write:
	.zero	1
	.section	.bss.tx_read,"aw",@nobits
	.type	tx_read, @object
	.size	tx_read, 1
tx_read:
	.zero	1
	.ident	"GCC: (GNU) 4.9.2"
.global __do_clear_bss
