	.file	"gx.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.text.GX_drawCircleHelper,"ax",@progbits
	.type	GX_drawCircleHelper, @function
GX_drawCircleHelper:
	push r2
	push r3
	push r4
	push r5
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 18 */
.L__stack_usage = 18
	movw r12,r24
	movw r10,r22
	ldi r24,lo8(1)
	ldi r25,0
	movw r8,r24
	sub r8,r20
	sbc r9,r21
	clr r6
	clr r7
	sub r6,r20
	sbc r7,r21
	lsl r6
	rol r7
	movw r28,r20
	mov r14,__zero_reg__
	mov r15,__zero_reg__
	mov r24,r18
	andi r24,lo8(4)
	mov r5,r24
	mov r24,r18
	andi r24,lo8(2)
	mov r4,r24
	mov r24,r18
	andi r24,lo8(8)
	mov r3,r24
	andi r18,lo8(1)
	mov r2,r18
.L2:
	cp r14,r28
	cpc r15,r29
	brlt .+2
	rjmp .L22
	sbrc r9,7
	rjmp .L3
	sbiw r28,1
	ldi r24,2
	add r6,r24
	adc r7,__zero_reg__
	add r8,r6
	adc r9,r7
.L3:
	ldi r24,-1
	sub r14,r24
	sbc r15,r24
	movw r24,r14
	lsl r24
	rol r25
	adiw r24,1
	add r8,r24
	adc r9,r25
	tst r5
	breq .L4
	movw r20,r16
	movw r22,r28
	add r22,r10
	adc r23,r11
	movw r24,r14
	add r24,r12
	adc r25,r13
	call ILI9340_drawPixel
	movw r20,r16
	movw r22,r14
	add r22,r10
	adc r23,r11
	movw r24,r28
	add r24,r12
	adc r25,r13
	call ILI9340_drawPixel
.L4:
	tst r4
	breq .L5
	movw r20,r16
	movw r22,r10
	sub r22,r28
	sbc r23,r29
	movw r24,r14
	add r24,r12
	adc r25,r13
	call ILI9340_drawPixel
	movw r20,r16
	movw r22,r10
	sub r22,r14
	sbc r23,r15
	movw r24,r28
	add r24,r12
	adc r25,r13
	call ILI9340_drawPixel
.L5:
	tst r3
	breq .L6
	movw r20,r16
	movw r22,r14
	add r22,r10
	adc r23,r11
	movw r24,r12
	sub r24,r28
	sbc r25,r29
	call ILI9340_drawPixel
	movw r20,r16
	movw r22,r28
	add r22,r10
	adc r23,r11
	movw r24,r12
	sub r24,r14
	sbc r25,r15
	call ILI9340_drawPixel
.L6:
	tst r2
	brne .+2
	rjmp .L2
	movw r20,r16
	movw r22,r10
	sub r22,r14
	sbc r23,r15
	movw r24,r12
	sub r24,r28
	sbc r25,r29
	call ILI9340_drawPixel
	movw r20,r16
	movw r22,r10
	sub r22,r28
	sbc r23,r29
	movw r24,r12
	sub r24,r14
	sbc r25,r15
	call ILI9340_drawPixel
	rjmp .L2
.L22:
/* epilogue start */
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
	pop r5
	pop r4
	pop r3
	pop r2
	ret
	.size	GX_drawCircleHelper, .-GX_drawCircleHelper
	.section	.text.GX_fillCircleHelper,"ax",@progbits
	.type	GX_fillCircleHelper, @function
GX_fillCircleHelper:
	push r2
	push r3
	push r4
	push r5
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
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 22 */
.L__stack_usage = 22
	movw r12,r24
	movw r10,r22
	movw r6,r16
	ldi r24,lo8(1)
	ldi r25,0
	movw r8,r24
	sub r8,r20
	sbc r9,r21
	clr r2
	clr r3
	sub r2,r20
	sbc r3,r21
	lsl r2
	rol r3
	std Y+4,r21
	std Y+3,r20
	movw r4,r16
	ldi r16,lo8(1)
	ldi r17,0
	mov r19,r18
	andi r19,lo8(1)
	std Y+1,r19
	andi r18,lo8(2)
	std Y+2,r18
.L24:
	movw r24,r16
	sbiw r24,1
	ldd r18,Y+3
	ldd r19,Y+4
	cp r24,r18
	cpc r25,r19
	brlt .+2
	rjmp .L35
	sbrc r9,7
	rjmp .L25
	ldd r24,Y+3
	ldd r25,Y+4
	sbiw r24,1
	std Y+4,r25
	std Y+3,r24
	ldi r25,2
	add r2,r25
	adc r3,__zero_reg__
	add r8,r2
	adc r9,r3
.L25:
	movw r24,r16
	lsl r24
	rol r25
	adiw r24,1
	add r8,r24
	adc r9,r25
	ldd r30,Y+1
	tst r30
	breq .L26
	ldd r20,Y+3
	ldd r21,Y+4
	lsl r20
	rol r21
	subi r20,-1
	sbci r21,-1
	add r20,r6
	adc r21,r7
	movw r18,r14
	movw r22,r10
	ldd r24,Y+3
	ldd r25,Y+4
	sub r22,r24
	sbc r23,r25
	movw r24,r16
	add r24,r12
	adc r25,r13
	call ILI9340_drawVLine
	movw r18,r14
	movw r20,r4
	subi r20,-3
	sbci r21,-1
	movw r22,r10
	sub r22,r16
	sbc r23,r17
	ldd r24,Y+3
	ldd r25,Y+4
	add r24,r12
	adc r25,r13
	call ILI9340_drawVLine
.L26:
	ldd r25,Y+2
	tst r25
	breq .L27
	ldd r20,Y+3
	ldd r21,Y+4
	lsl r20
	rol r21
	subi r20,-1
	sbci r21,-1
	add r20,r6
	adc r21,r7
	movw r18,r14
	movw r22,r10
	ldd r30,Y+3
	ldd r31,Y+4
	sub r22,r30
	sbc r23,r31
	movw r24,r12
	sub r24,r16
	sbc r25,r17
	call ILI9340_drawVLine
	movw r18,r14
	movw r20,r4
	subi r20,-3
	sbci r21,-1
	movw r22,r10
	sub r22,r16
	sbc r23,r17
	movw r24,r12
	ldd r30,Y+3
	ldd r31,Y+4
	sub r24,r30
	sbc r25,r31
	call ILI9340_drawVLine
.L27:
	subi r16,-1
	sbci r17,-1
	ldi r31,2
	add r4,r31
	adc r5,__zero_reg__
	rjmp .L24
.L35:
/* epilogue start */
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
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
	.size	GX_fillCircleHelper, .-GX_fillCircleHelper
	.section	.text.GX_init,"ax",@progbits
.global	GX_init
	.type	GX_init, @function
GX_init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp ILI9340_init
	.size	GX_init, .-GX_init
	.section	.text.GX_drawCircle,"ax",@progbits
.global	GX_drawCircle
	.type	GX_drawCircle, @function
GX_drawCircle:
	push r2
	push r3
	push r4
	push r5
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
	rcall .
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 24 */
.L__stack_usage = 24
	movw r14,r24
	movw r12,r22
	movw r16,r18
	ldi r24,lo8(1)
	ldi r25,0
	movw r8,r24
	sub r8,r20
	sbc r9,r21
	clr r18
	clr r19
	sub r18,r20
	sbc r19,r21
	movw r24,r18
	lsl r24
	rol r25
	std Y+2,r25
	std Y+1,r24
	std Y+6,r21
	std Y+5,r20
	movw r22,r20
	add r22,r12
	adc r23,r13
	movw r20,r16
	movw r24,r14
	call ILI9340_drawPixel
	movw r22,r12
	ldd r18,Y+5
	ldd r19,Y+6
	sub r22,r18
	sbc r23,r19
	movw r20,r16
	movw r24,r14
	call ILI9340_drawPixel
	movw r20,r16
	movw r22,r12
	ldd r24,Y+5
	ldd r25,Y+6
	add r24,r14
	adc r25,r15
	call ILI9340_drawPixel
	movw r20,r16
	movw r22,r12
	movw r24,r14
	ldd r18,Y+5
	ldd r19,Y+6
	sub r24,r18
	sbc r25,r19
	call ILI9340_drawPixel
	mov r10,__zero_reg__
	mov r11,__zero_reg__
	ldi r18,lo8(1)
	ldi r19,0
.L38:
	ldd r24,Y+5
	ldd r25,Y+6
	cp r10,r24
	cpc r11,r25
	brlt .+2
	rjmp .L41
	sbrc r9,7
	rjmp .L39
	ldd r24,Y+5
	ldd r25,Y+6
	sbiw r24,1
	std Y+6,r25
	std Y+5,r24
	ldd r24,Y+1
	ldd r25,Y+2
	adiw r24,2
	std Y+2,r25
	std Y+1,r24
	add r8,r24
	adc r9,r25
.L39:
	ldi r25,-1
	sub r10,r25
	sbc r11,r25
	subi r18,-2
	sbci r19,-1
	add r8,r18
	adc r9,r19
	movw r4,r10
	add r4,r14
	adc r5,r15
	movw r20,r16
	ldd r6,Y+5
	ldd r7,Y+6
	add r6,r12
	adc r7,r13
	movw r22,r6
	movw r24,r4
	std Y+3,r18
	std Y+4,r19
	call ILI9340_drawPixel
	movw r2,r14
	sub r2,r10
	sbc r3,r11
	movw r20,r16
	movw r22,r6
	movw r24,r2
	call ILI9340_drawPixel
	movw r20,r16
	movw r6,r12
	ldd r24,Y+5
	ldd r25,Y+6
	sub r6,r24
	sbc r7,r25
	movw r22,r6
	movw r24,r4
	call ILI9340_drawPixel
	movw r20,r16
	movw r22,r6
	movw r24,r2
	call ILI9340_drawPixel
	movw r6,r10
	add r6,r12
	adc r7,r13
	movw r20,r16
	movw r22,r6
	ldd r4,Y+5
	ldd r5,Y+6
	add r4,r14
	adc r5,r15
	movw r24,r4
	call ILI9340_drawPixel
	movw r20,r16
	movw r22,r6
	movw r2,r14
	ldd r24,Y+5
	ldd r25,Y+6
	sub r2,r24
	sbc r3,r25
	movw r24,r2
	call ILI9340_drawPixel
	movw r6,r12
	sub r6,r10
	sbc r7,r11
	movw r20,r16
	movw r22,r6
	movw r24,r4
	call ILI9340_drawPixel
	movw r20,r16
	movw r22,r6
	movw r24,r2
	call ILI9340_drawPixel
	ldd r19,Y+4
	ldd r18,Y+3
	rjmp .L38
.L41:
/* epilogue start */
	adiw r28,6
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
	pop r5
	pop r4
	pop r3
	pop r2
	ret
	.size	GX_drawCircle, .-GX_drawCircle
	.section	.text.GX_fillCircle,"ax",@progbits
.global	GX_fillCircle
	.type	GX_fillCircle, @function
GX_fillCircle:
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 10 */
.L__stack_usage = 10
	movw r12,r24
	movw r10,r22
	movw r28,r20
	movw r14,r18
	lsl r20
	rol r21
	subi r20,-1
	sbci r21,-1
	sub r22,r28
	sbc r23,r29
	movw r24,r12
	call ILI9340_drawVLine
	ldi r16,0
	ldi r17,0
	ldi r18,lo8(3)
	movw r20,r28
	movw r22,r10
	movw r24,r12
	call GX_fillCircleHelper
/* epilogue start */
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
	ret
	.size	GX_fillCircle, .-GX_fillCircle
	.section	.text.GX_drawLine,"ax",@progbits
.global	GX_drawLine
	.type	GX_drawLine, @function
GX_drawLine:
	push r3
	push r4
	push r5
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 17 */
.L__stack_usage = 17
	movw r4,r16
	movw r26,r18
	sub r26,r22
	sbc r27,r23
	sbrs r27,7
	rjmp .L44
	neg r27
	neg r26
	sbc r27,__zero_reg__
.L44:
	movw r30,r20
	sub r30,r24
	sbc r31,r25
	sbrs r31,7
	rjmp .L45
	neg r31
	neg r30
	sbc r31,__zero_reg__
.L45:
	clr r3
	inc r3
	cp r30,r26
	cpc r31,r27
	brlt .L59
	mov r3,__zero_reg__
	movw r30,r18
	movw r16,r20
	movw r14,r22
	movw r28,r24
	rjmp .L47
.L59:
	sts tmpu16+1,r21
	sts tmpu16,r20
	movw r30,r20
	movw r16,r18
	movw r14,r24
	movw r28,r22
.L47:
	cp r16,r28
	cpc r17,r29
	brsh .L48
	sts tmpu16+1,r15
	sts tmpu16,r14
	mov r25,r14
	mov r24,r15
	movw r14,r30
	mov r30,r25
	mov r31,r24
	mov r25,r28
	mov r24,r29
	movw r28,r16
	mov r16,r25
	mov r17,r24
.L48:
	movw r12,r16
	sub r12,r28
	sbc r13,r29
	movw r10,r30
	sub r10,r14
	sbc r11,r15
	sbrs r11,7
	rjmp .L49
	neg r11
	neg r10
	sbc r11,__zero_reg__
.L49:
	movw r6,r12
	sbrs r13,7
	rjmp .L50
	ldi r24,-1
	sub r6,r24
	sbc r7,r24
.L50:
	asr r7
	ror r6
	cp r14,r30
	cpc r15,r31
	brlo .L58
	clr r8
	dec r8
	mov r9,r8
	rjmp .L52
.L58:
	clr r8
	inc r8
	mov r9,__zero_reg__
	rjmp .L52
.L56:
	movw r20,r4
	tst r3
	breq .L53
	movw r22,r28
	movw r24,r14
.L60:
	call ILI9340_drawPixel
	sub r6,r10
	sbc r7,r11
	sbrs r7,7
	rjmp .L55
	add r14,r8
	adc r15,r9
	add r6,r12
	adc r7,r13
.L55:
	adiw r28,1
.L52:
	cp r16,r28
	cpc r17,r29
	brsh .L56
	rjmp .L61
.L53:
	movw r22,r14
	movw r24,r28
	rjmp .L60
.L61:
/* epilogue start */
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
	pop r5
	pop r4
	pop r3
	ret
	.size	GX_drawLine, .-GX_drawLine
	.section	.text.GX_drawRect,"ax",@progbits
.global	GX_drawRect
	.type	GX_drawRect, @function
GX_drawRect:
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 10 */
.L__stack_usage = 10
	movw r14,r24
	movw r12,r22
	movw r28,r20
	movw r10,r18
	movw r18,r16
	call ILI9340_drawHLine
	movw r22,r10
	subi r22,1
	sbc r23,__zero_reg__
	add r22,r12
	adc r23,r13
	movw r18,r16
	movw r20,r28
	movw r24,r14
	call ILI9340_drawHLine
	movw r18,r16
	movw r20,r10
	movw r22,r12
	movw r24,r14
	call ILI9340_drawVLine
	movw r24,r28
	sbiw r24,1
	movw r18,r16
	movw r20,r10
	movw r22,r12
	add r24,r14
	adc r25,r15
/* epilogue start */
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
	jmp ILI9340_drawVLine
	.size	GX_drawRect, .-GX_drawRect
	.section	.text.GX_drawRoundRect,"ax",@progbits
.global	GX_drawRoundRect
	.type	GX_drawRoundRect, @function
GX_drawRoundRect:
	push r2
	push r3
	push r4
	push r5
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
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 22 */
.L__stack_usage = 22
	std Y+4,r25
	std Y+3,r24
	movw r10,r22
	movw r4,r20
	movw r6,r18
	movw r12,r16
	movw r2,r16
	lsl r2
	rol r3
	movw r16,r20
	sub r16,r2
	sbc r17,r3
	movw r8,r24
	add r8,r12
	adc r9,r13
	movw r18,r14
	movw r20,r16
	movw r24,r8
	call ILI9340_drawHLine
	movw r24,r6
	sbiw r24,1
	movw r18,r24
	add r18,r10
	adc r19,r11
	std Y+2,r19
	std Y+1,r18
	movw r18,r14
	movw r20,r16
	ldd r22,Y+1
	ldd r23,Y+2
	movw r24,r8
	call ILI9340_drawHLine
	sub r6,r2
	sbc r7,r3
	add r10,r12
	adc r11,r13
	movw r18,r14
	movw r20,r6
	movw r22,r10
	ldd r24,Y+3
	ldd r25,Y+4
	call ILI9340_drawVLine
	ldd r24,Y+3
	ldd r25,Y+4
	sbiw r24,1
	add r4,r24
	adc r5,r25
	movw r18,r14
	movw r20,r6
	movw r22,r10
	movw r24,r4
	call ILI9340_drawVLine
	movw r16,r14
	ldi r18,lo8(1)
	movw r20,r12
	movw r22,r10
	movw r24,r8
	call GX_drawCircleHelper
	sub r4,r12
	sbc r5,r13
	ldi r18,lo8(2)
	movw r20,r12
	movw r22,r10
	movw r24,r4
	call GX_drawCircleHelper
	ldd r10,Y+1
	ldd r11,Y+2
	sub r10,r12
	sbc r11,r13
	ldi r18,lo8(4)
	movw r20,r12
	movw r22,r10
	movw r24,r4
	call GX_drawCircleHelper
	ldi r18,lo8(8)
	movw r20,r12
	movw r22,r10
	movw r24,r8
	call GX_drawCircleHelper
/* epilogue start */
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
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
	.size	GX_drawRoundRect, .-GX_drawRoundRect
	.section	.text.GX_fillRoundRect,"ax",@progbits
.global	GX_fillRoundRect
	.type	GX_fillRoundRect, @function
GX_fillRoundRect:
	push r2
	push r3
	push r4
	push r5
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 18 */
.L__stack_usage = 18
	movw r4,r24
	movw r10,r22
	movw r2,r20
	movw r28,r18
	movw r12,r16
	movw r8,r14
	movw r14,r16
	lsl r14
	rol r15
	movw r6,r16
	add r6,r4
	adc r7,r5
	sub r20,r14
	sbc r21,r15
	movw r16,r8
	movw r24,r6
	call ILI9340_fillRect
	sbiw r28,1
	sub r28,r14
	sbc r29,r15
	add r10,r12
	adc r11,r13
	movw r24,r4
	sbiw r24,1
	add r24,r2
	adc r25,r3
	movw r14,r8
	movw r16,r28
	ldi r18,lo8(1)
	movw r20,r12
	movw r22,r10
	sub r24,r12
	sbc r25,r13
	call GX_fillCircleHelper
	ldi r18,lo8(2)
	movw r20,r12
	movw r22,r10
	movw r24,r6
	call GX_fillCircleHelper
/* epilogue start */
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
	pop r5
	pop r4
	pop r3
	pop r2
	ret
	.size	GX_fillRoundRect, .-GX_fillRoundRect
	.section	.text.GX_drawTriangle,"ax",@progbits
.global	GX_drawTriangle
	.type	GX_drawTriangle, @function
GX_drawTriangle:
	push r4
	push r5
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 16 */
.L__stack_usage = 16
	movw r28,r24
	movw r10,r22
	movw r8,r20
	movw r6,r18
	movw r4,r16
	movw r16,r12
	call GX_drawLine
	movw r18,r14
	movw r20,r4
	movw r22,r6
	movw r24,r8
	call GX_drawLine
	movw r18,r10
	movw r20,r28
	movw r22,r14
	movw r24,r4
	call GX_drawLine
/* epilogue start */
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
	pop r5
	pop r4
	ret
	.size	GX_drawTriangle, .-GX_drawTriangle
	.section	.text.GX_fillTriangle,"ax",@progbits
.global	GX_fillTriangle
	.type	GX_fillTriangle, @function
GX_fillTriangle:
	push r2
	push r3
	push r4
	push r5
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
	sbiw r28,16
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 16 */
/* stack size = 34 */
.L__stack_usage = 34
	mov r31,r24
	mov r30,r25
	movw r8,r18
	movw r18,r12
	cp r8,r22
	cpc r9,r23
	brsh .L67
	sts tmpu16,r24
	sts tmpu16+1,r25
	cp r14,r22
	cpc r15,r23
	brsh .L83
	movw r12,r22
	std Y+15,r20
	std Y+16,r21
	rjmp .L82
.L67:
	cp r14,r8
	cpc r15,r9
	brlo .+2
	rjmp .L87
	movw r12,r8
	movw r24,r20
	movw r8,r22
	std Y+15,r31
	std Y+16,r30
.L82:
	sts tmpu16+1,r25
	sts tmpu16,r24
	movw r10,r16
	rjmp .L68
.L83:
	std Y+15,r20
	std Y+16,r21
	movw r12,r14
	movw r24,r16
	movw r14,r22
	mov r10,r31
	mov r11,r30
.L68:
	cp r14,r8
	cpc r15,r9
	brsh .L69
	ldd r20,Y+15
	ldd r21,Y+16
	sts tmpu16+1,r21
	sts tmpu16,r20
	mov r21,r8
	mov r20,r9
	movw r8,r14
	mov r14,r21
	mov r15,r20
	ldd r21,Y+15
	ldd r20,Y+16
	std Y+16,r11
	std Y+15,r10
	mov r10,r21
	mov r11,r20
.L69:
	cp r8,r12
	cpc r9,r13
	brne .L70
	ldd r22,Y+15
	ldd r23,Y+16
	cp r10,r22
	cpc r11,r23
	brlo .L71
	mov r21,r10
	mov r20,r11
	movw r10,r22
	std Y+15,r21
	std Y+16,r20
.L71:
	cp r24,r10
	cpc r25,r11
	brlo .L73
	ldd r26,Y+15
	ldd r27,Y+16
	cp r26,r24
	cpc r27,r25
	brsh .L74
	std Y+16,r25
	std Y+15,r24
.L74:
	movw r24,r10
.L73:
	ldd r20,Y+15
	ldd r21,Y+16
	subi r20,-1
	sbci r21,-1
	sub r20,r24
	sbc r21,r25
	movw r22,r8
/* epilogue start */
	adiw r28,16
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
	pop r5
	pop r4
	pop r3
	pop r2
	jmp ILI9340_drawHLine
.L70:
	movw r30,r10
	ldd r20,Y+15
	ldd r21,Y+16
	sub r30,r20
	sbc r31,r21
	std Y+10,r31
	std Y+9,r30
	movw r22,r14
	sub r22,r8
	sbc r23,r9
	std Y+12,r23
	std Y+11,r22
	movw r6,r24
	sub r6,r20
	sbc r7,r21
	movw r26,r12
	sub r26,r8
	sbc r27,r9
	std Y+4,r27
	std Y+3,r26
	movw r30,r24
	sub r30,r10
	sbc r31,r11
	std Y+6,r31
	std Y+5,r30
	movw r20,r12
	sub r20,r14
	sbc r21,r15
	std Y+14,r21
	std Y+13,r20
	cp r14,r12
	cpc r15,r13
	breq .L84
	movw r22,r14
	subi r22,1
	sbc r23,__zero_reg__
	std Y+2,r23
	std Y+1,r22
	rjmp .L75
.L84:
	std Y+2,r15
	std Y+1,r14
.L75:
	std Y+8,r19
	std Y+7,r18
	movw r16,r8
	mov r4,__zero_reg__
	mov r5,__zero_reg__
	mov r2,__zero_reg__
	mov r3,__zero_reg__
.L76:
	ldd r30,Y+1
	ldd r31,Y+2
	cp r30,r16
	cpc r31,r17
	brlo .L88
	movw r24,r2
	ldd r22,Y+11
	ldd r23,Y+12
	call __divmodhi4
	ldd r30,Y+15
	ldd r31,Y+16
	add r30,r22
	adc r31,r23
	movw r24,r4
	ldd r22,Y+3
	ldd r23,Y+4
	call __divmodhi4
	ldd r24,Y+15
	ldd r25,Y+16
	add r22,r24
	adc r23,r25
	ldd r26,Y+9
	ldd r27,Y+10
	add r2,r26
	adc r3,r27
	add r4,r6
	adc r5,r7
	cp r22,r30
	cpc r23,r31
	brsh .L77
	sts tmpu16+1,r31
	sts tmpu16,r30
	mov r25,r30
	mov r24,r31
	movw r30,r22
	mov r22,r25
	mov r23,r24
.L77:
	subi r22,-1
	sbci r23,-1
	movw r20,r22
	sub r20,r30
	sbc r21,r31
	ldd r18,Y+7
	ldd r19,Y+8
	movw r22,r16
	movw r24,r30
	call ILI9340_drawHLine
	subi r16,-1
	sbci r17,-1
	rjmp .L76
.L88:
	movw r24,r16
	sub r24,r14
	sbc r25,r15
	ldd r18,Y+5
	ldd r19,Y+6
	mul r24,r18
	movw r14,r0
	mul r24,r19
	add r15,r0
	mul r25,r18
	add r15,r0
	clr r1
	movw r24,r16
	sub r24,r8
	sbc r25,r9
	mul r24,r6
	movw r8,r0
	mul r24,r7
	add r9,r0
	mul r25,r6
	add r9,r0
	clr r1
.L79:
	cp r12,r16
	cpc r13,r17
	brlo .L89
	movw r24,r14
	ldd r22,Y+13
	ldd r23,Y+14
	call __divmodhi4
	movw r30,r22
	add r30,r10
	adc r31,r11
	movw r24,r8
	ldd r22,Y+3
	ldd r23,Y+4
	call __divmodhi4
	ldd r20,Y+15
	ldd r21,Y+16
	add r22,r20
	adc r23,r21
	ldd r24,Y+5
	ldd r25,Y+6
	add r14,r24
	adc r15,r25
	add r8,r6
	adc r9,r7
	cp r22,r30
	cpc r23,r31
	brsh .L80
	sts tmpu16+1,r31
	sts tmpu16,r30
	mov r25,r30
	mov r24,r31
	movw r30,r22
	mov r22,r25
	mov r23,r24
.L80:
	subi r22,-1
	sbci r23,-1
	movw r20,r22
	sub r20,r30
	sbc r21,r31
	ldd r18,Y+7
	ldd r19,Y+8
	movw r22,r16
	movw r24,r30
	call ILI9340_drawHLine
	subi r16,-1
	sbci r17,-1
	rjmp .L79
.L87:
	movw r12,r14
	movw r24,r16
	movw r14,r8
	movw r10,r20
	movw r8,r22
	std Y+15,r31
	std Y+16,r30
	rjmp .L69
.L89:
/* epilogue start */
	adiw r28,16
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
	pop r5
	pop r4
	pop r3
	pop r2
	ret
	.size	GX_fillTriangle, .-GX_fillTriangle
	.section	.bss.tmpu16,"aw",@nobits
	.type	tmpu16, @object
	.size	tmpu16, 2
tmpu16:
	.zero	2
	.ident	"GCC: (GNU) 4.9.2"
.global __do_clear_bss
