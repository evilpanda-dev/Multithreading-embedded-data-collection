	.file	"spi.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.text.SPI_init,"ax",@progbits
.global	SPI_init
	.type	SPI_init, @function
SPI_init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbi 0x5,2
	in r24,0x4
	ori r24,lo8(44)
	out 0x4,r24
	in r24,0x2c
	ori r24,lo8(80)
	out 0x2c,r24
	ret
	.size	SPI_init, .-SPI_init
	.section	.text.SPI_cleanup,"ax",@progbits
.global	SPI_cleanup
	.type	SPI_cleanup, @function
SPI_cleanup:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r24,0x2c
	andi r24,lo8(-65)
	out 0x2c,r24
	ret
	.size	SPI_cleanup, .-SPI_cleanup
	.section	.text.SPI_setBitOrder,"ax",@progbits
.global	SPI_setBitOrder
	.type	SPI_setBitOrder, @function
SPI_setBitOrder:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpse r24,__zero_reg__
	rjmp .L4
	in r24,0x2c
	ori r24,lo8(32)
	rjmp .L6
.L4:
	in r24,0x2c
	andi r24,lo8(-33)
.L6:
	out 0x2c,r24
	ret
	.size	SPI_setBitOrder, .-SPI_setBitOrder
	.section	.text.SPI_setDataMode,"ax",@progbits
.global	SPI_setDataMode
	.type	SPI_setDataMode, @function
SPI_setDataMode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r25,0x2c
	andi r25,lo8(-13)
	or r24,r25
	out 0x2c,r24
	ret
	.size	SPI_setDataMode, .-SPI_setDataMode
	.section	.text.SPI_setClockDivider,"ax",@progbits
.global	SPI_setClockDivider
	.type	SPI_setClockDivider, @function
SPI_setClockDivider:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r25,0x2c
	mov r18,r24
	andi r18,lo8(3)
	andi r25,lo8(-4)
	or r25,r18
	out 0x2c,r25
	in r25,0x2d
	bst r24,2
	clr r24
	bld r24,0
	andi r25,lo8(-2)
	or r24,r25
	out 0x2d,r24
	ret
	.size	SPI_setClockDivider, .-SPI_setClockDivider
	.section	.text.SPI_transfer,"ax",@progbits
.global	SPI_transfer
	.type	SPI_transfer, @function
SPI_transfer:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	out 0x2e,r24
.L11:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L11
/* epilogue start */
	ret
	.size	SPI_transfer, .-SPI_transfer
	.ident	"GCC: (GNU) 4.9.2"
