	.file	"vt220.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.text.VT220_clear_parameters,"ax",@progbits
	.type	VT220_clear_parameters, @function
VT220_clear_parameters:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r30,lo8(parameters)
	ldi r31,hi8(parameters)
.L2:
	st Z+,__zero_reg__
	st Z+,__zero_reg__
	ldi r24,hi8(parameters+16)
	cpi r30,lo8(parameters+16)
	cpc r31,r24
	brne .L2
	sts parameter_id,__zero_reg__
	ldi r24,lo8(2)
	sts state,r24
	ret
	.size	VT220_clear_parameters, .-VT220_clear_parameters
	.section	.text.set_gx_mode,"ax",@progbits
	.type	set_gx_mode, @function
set_gx_mode:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	lds r18,gx_flags
	sbrc r18,0
	rjmp .L9
	ldi r24,0
	rjmp .L6
.L9:
	ldi r24,lo8(8)
.L6:
	lds r25,gx_color
	mov r28,r25
	swap r28
	andi r28,lo8(7)
	add r28,r24
	andi r25,lo8(7)
	mov r29,r24
	add r29,r25
	mov r17,r18
	andi r17,lo8(8)
	sbrc r18,3
	rjmp .L10
	mov r24,r28
	rjmp .L7
.L10:
	mov r24,r29
.L7:
	call get_color
	sts fgcolor+1,r25
	sts fgcolor,r24
	cpse r17,__zero_reg__
	rjmp .L11
	mov r24,r29
	rjmp .L8
.L11:
	mov r24,r28
.L8:
	call get_color
	sts bgcolor+1,r25
	sts bgcolor,r24
/* epilogue start */
	pop r29
	pop r28
	pop r17
	ret
	.size	set_gx_mode, .-set_gx_mode
	.section	.text.tx_csi,"ax",@progbits
	.type	tx_csi, @function
tx_csi:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,flags
	sbrs r24,0
	rjmp .L13
	ldi r24,lo8(27)
	call tx_char
	ldi r24,lo8(91)
	rjmp .L14
.L13:
	ldi r24,lo8(-101)
.L14:
	jmp tx_char
	.size	tx_csi, .-tx_csi
	.section	.text.VT220_reset,"ax",@progbits
.global	VT220_reset
	.type	VT220_reset, @function
VT220_reset:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(112)
	sts gx_color,r24
	sts gx_flags,__zero_reg__
	sts gx_color_stored,r24
	sts gx_flags_stored,__zero_reg__
	sts cursorX_stored,__zero_reg__
	sts cursorY_stored,__zero_reg__
	ldi r24,lo8(1)
	sts auto_wrap_stored,r24
	sts flags,r24
	sts auto_wrap,r24
	call set_gx_mode
	call cursor_home
	jmp erase_screen
	.size	VT220_reset, .-VT220_reset
	.section	.text.VT220_process,"ax",@progbits
.global	VT220_process
	.type	VT220_process, @function
VT220_process:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	lds r25,flags
	lds r18,state
	mov r28,r25
	andi r28,lo8(2)
	sbrs r25,1
	rjmp .L17
	mov r28,r18
	cpi r18,lo8(1)
	breq .L19
	brlo .L20
	cpi r18,lo8(6)
	brne .+2
	rjmp .L21
	cpi r18,lo8(7)
	brne .+2
	rjmp .L22
	rjmp .L161
.L20:
	cpi r24,lo8(10)
	brne .+2
	rjmp .L64
	brge .L25
	cpi r24,lo8(7)
	brne .+2
	rjmp .L18
	cpi r24,lo8(9)
	brne .+2
	rjmp .L56
	rjmp .L161
.L25:
	cpi r24,lo8(13)
	breq .L27
	cpi r24,lo8(27)
	brne .+2
	rjmp .L76
	rjmp .L161
.L27:
	call carriage_return
	rjmp .L18
.L19:
	cpi r24,lo8(68)
	breq .L30
	brge .L31
	cpi r24,lo8(60)
	brne .+2
	rjmp .L32
	brge .L33
	cpi r24,lo8(24)
	brne .+2
	rjmp .L45
	cpi r24,lo8(26)
	breq .L45
	rjmp .L159
.L33:
	cpi r24,lo8(66)
	breq .L35
	brge .L36
	cpi r24,lo8(65)
	breq .+2
	rjmp .L159
	call cursor_up
	rjmp .L45
.L31:
	cpi r24,lo8(74)
	breq .L38
	brge .L39
	cpi r24,lo8(72)
	breq .L40
	cpi r24,lo8(73)
	breq .+2
	rjmp .L159
	call reverse_linefeed
	rjmp .L45
.L39:
	cpi r24,lo8(89)
	breq .L42
	cpi r24,lo8(90)
	breq .L43
	cpi r24,lo8(75)
	breq .+2
	rjmp .L159
	call erase_cursor_to_eol
	rjmp .L45
.L35:
	call cursor_down
	rjmp .L45
.L36:
	call cursor_right
	rjmp .L45
.L30:
	call cursor_left
	rjmp .L45
.L40:
	call cursor_home
	rjmp .L45
.L38:
	call erase_cursor_to_end
	rjmp .L45
.L42:
	ldi r24,lo8(6)
	sts state,r24
	sts px,__zero_reg__
	sts py,__zero_reg__
	rjmp .L227
.L43:
	ldi r24,lo8(75)
	call tx_char
	rjmp .L45
.L32:
	andi r25,lo8(-3)
	sts flags,r25
.L45:
	sts state,__zero_reg__
	rjmp .L227
.L21:
	cpi r24,lo8(32)
	brlt .L45
	ldi r25,lo8(7)
	sts state,r25
	subi r24,lo8(-(-31))
	sts py,r24
	rjmp .L227
.L22:
	sts state,__zero_reg__
	cpi r24,lo8(32)
	brge .+2
	rjmp .L227
	subi r24,lo8(-(-31))
	sts px,r24
	lds r22,py
	ldi r23,0
	ldi r25,0
	call cursor_goto
	rjmp .L227
.L17:
	cpi r18,lo8(2)
	brne .+2
	rjmp .L47
	brsh .L48
	tst r18
	breq .L49
	cpi r18,lo8(1)
	brne .+2
	rjmp .L50
	rjmp .L18
.L48:
	cpi r18,lo8(4)
	brne .+2
	rjmp .L159
	brsh .+2
	rjmp .L52
	cpi r18,lo8(5)
	brne .+2
	rjmp .L53
	rjmp .L18
.L49:
	cpi r24,lo8(27)
	breq .L54
	brsh .L55
	cpi r24,lo8(9)
	breq .L56
	brsh .L57
	cpi r24,lo8(7)
	breq .L227
	brsh .L59
	tst r24
	breq .L227
	rjmp .L161
.L57:
	cpi r24,lo8(13)
	brlo .L64
	cpi r24,lo8(13)
	breq .L230
	rjmp .L161
.L55:
	cpi r24,lo8(-120)
	breq .L62
	brsh .L63
	cpi r24,lo8(-124)
	breq .L64
	cpi r24,lo8(-123)
	breq .L65
	cpi r24,lo8(127)
	breq .+2
	rjmp .L161
	rjmp .L227
.L63:
	cpi r24,lo8(-112)
	breq .L227
	cpi r24,lo8(-101)
	breq .L66
	cpi r24,lo8(-115)
	breq .+2
	rjmp .L161
	call reverse_linefeed
	rjmp .L227
.L59:
	call cursor_left
	rjmp .L227
.L56:
	call cursor_tabstop
	rjmp .L18
.L54:
	call VT220_clear_parameters
	rjmp .L76
.L64:
	call linefeed
	rjmp .L18
.L65:
	call linefeed
.L230:
	call carriage_return
	rjmp .L227
.L62:
	call set_tabstop
	rjmp .L18
.L66:
	call VT220_clear_parameters
	ldi r24,lo8(2)
	sts state,r24
.L227:
	ldi r28,0
	rjmp .L18
.L50:
	cpi r24,lo8(69)
	brne .+2
	rjmp .L68
	brsh .L69
	cpi r24,lo8(26)
	brne .+2
	rjmp .L159
	brsh .L71
	cpi r24,lo8(8)
	brne .+2
	rjmp .L72
	cpi r24,lo8(24)
	brne .+2
	rjmp .L159
	cpi r24,lo8(7)
	breq .+2
	rjmp .L18
	lds r24,gx_color
	sts gx_color_stored,r24
	lds r24,gx_flags
	sts gx_flags_stored,r24
	lds r24,cursorX
	sts cursorX_stored,r24
	lds r24,cursorY
	sts cursorY_stored,r24
	lds r24,auto_wrap
	sts auto_wrap_stored,r24
	rjmp .L159
.L71:
	cpi r24,lo8(35)
	brne .+2
	rjmp .L74
	cpi r24,lo8(68)
	breq .L75
	cpi r24,lo8(27)
	brne .+2
	rjmp .L76
	rjmp .L18
.L69:
	cpi r24,lo8(80)
	brsh .L77
	cpi r24,lo8(78)
	brsh .L75
	cpi r24,lo8(72)
	breq .L78
	cpi r24,lo8(77)
	breq .+2
	rjmp .L18
	call reverse_linefeed
	rjmp .L159
.L77:
	cpi r24,lo8(90)
	brne .+2
	rjmp .L98
	brsh .L81
	cpi r24,lo8(80)
	breq .+2
	rjmp .L18
	ldi r24,lo8(5)
	rjmp .L228
.L81:
	cpi r24,lo8(91)
	breq .L83
	cpi r24,lo8(99)
	breq .+2
	rjmp .L18
	call VT220_reset
	rjmp .L159
.L83:
	ldi r24,lo8(2)
	rjmp .L228
.L75:
	call linefeed
	rjmp .L159
.L72:
	lds r24,gx_color_stored
	sts gx_color,r24
	lds r24,gx_flags_stored
	sts gx_flags,r24
	lds r24,cursorX_stored
	sts cursorX,r24
	lds r24,cursorY_stored
	sts cursorY,r24
	lds r24,auto_wrap_stored
	rjmp .L231
.L68:
	call linefeed
	call carriage_return
	rjmp .L159
.L78:
	call set_tabstop
	rjmp .L159
.L74:
	ldi r24,lo8(4)
	rjmp .L228
.L47:
	mov r18,r24
	ldi r19,0
	movw r20,r18
	subi r20,48
	sbc r21,__zero_reg__
	cpi r20,10
	cpc r21,__zero_reg__
	brsh .+2
	rjmp .L229
	cpi r24,lo8(68)
	brne .+2
	rjmp .L87
	brsh .L88
	cpi r24,lo8(59)
	brne .+2
	rjmp .L89
	brsh .L90
.L234:
	cpi r24,lo8(26)
	brne .+2
	rjmp .L159
	cpi r24,lo8(27)
	breq .+2
	rjmp .L159
.L76:
	ldi r24,lo8(1)
.L228:
	sts state,r24
	rjmp .L18
.L90:
	cpi r24,lo8(65)
	brne .+2
	rjmp .L93
	brsh .L94
	cpi r24,lo8(63)
	breq .+2
	rjmp .L159
	ldi r24,lo8(3)
	rjmp .L228
.L94:
	cpi r24,lo8(66)
	brne .+2
	rjmp .L96
	cpi r24,lo8(67)
	brne .+2
	rjmp .L97
	rjmp .L159
.L88:
	cpi r24,lo8(99)
	brne .+2
	rjmp .L98
	brsh .L99
	cpi r24,lo8(74)
	brne .+2
	rjmp .L100
	brsh .L101
	cpi r24,lo8(72)
	brne .+2
	rjmp .L102
	rjmp .L159
.L101:
	cpi r24,lo8(75)
	brne .+2
	rjmp .L103
	cpi r24,lo8(88)
	brne .+2
	rjmp .L104
	rjmp .L159
.L99:
	cpi r24,lo8(103)
	brne .+2
	rjmp .L105
	brsh .L106
	cpi r24,lo8(102)
	brne .+2
	rjmp .L102
	rjmp .L159
.L106:
	cpi r24,lo8(109)
	brne .+2
	rjmp .L107
	cpi r24,lo8(110)
	brne .+2
	rjmp .L108
	rjmp .L159
.L53:
	mov r18,r24
	ldi r19,0
	movw r20,r18
	subi r20,48
	sbc r21,__zero_reg__
	cpi r20,10
	cpc r21,__zero_reg__
	brsh .+2
	rjmp .L229
	cpi r24,lo8(59)
	breq .+2
	rjmp .L156
.L89:
	lds r24,parameter_id
	subi r24,lo8(-(1))
	sts parameter_id,r24
	cpi r24,lo8(8)
	brsh .+2
	rjmp .L227
	sts parameter_id,__zero_reg__
	rjmp .L18
.L93:
	lds r24,parameters
	lds r25,parameters+1
	sbiw r24,0
	brne .L110
	ldi r24,lo8(1)
	ldi r25,0
.L110:
	call cursor_up_n
	rjmp .L159
.L96:
	lds r24,parameters
	lds r25,parameters+1
	sbiw r24,0
	brne .L111
	ldi r24,lo8(1)
	ldi r25,0
.L111:
	call cursor_down_n
	rjmp .L159
.L97:
	lds r24,parameters
	lds r25,parameters+1
	sbiw r24,0
	brne .L112
	ldi r24,lo8(1)
	ldi r25,0
.L112:
	call cursor_right_n
	rjmp .L159
.L87:
	lds r24,parameters
	lds r25,parameters+1
	sbiw r24,0
	brne .L113
	ldi r24,lo8(1)
	ldi r25,0
.L113:
	call cursor_left_n
	rjmp .L159
.L102:
	lds r22,parameters
	lds r23,parameters+1
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L114
	ldi r22,lo8(1)
	ldi r23,0
.L114:
	lds r24,parameters+2
	lds r25,parameters+2+1
	sbiw r24,0
	brne .L115
	ldi r24,lo8(1)
	ldi r25,0
.L115:
	call cursor_goto
	rjmp .L159
.L105:
	lds r24,parameters
	lds r25,parameters+1
	sbiw r24,0
	brne .L116
	call clear_tabstop
	rjmp .L159
.L116:
	sbiw r24,3
	breq .+2
	rjmp .L159
	call clear_all_tabstops
	rjmp .L159
.L107:
	lds r24,parameter_id
	subi r24,lo8(-(1))
	cpi r24,lo8(8)
	breq .L118
	sts parameter_id,r24
.L118:
	ldi r29,0
	ldi r17,lo8(112)
.L119:
	lds r24,parameter_id
	cp r29,r24
	brlo .+2
	rjmp .L159
	mov r30,r29
	ldi r31,0
	lsl r30
	rol r31
	subi r30,lo8(-(parameters))
	sbci r31,hi8(-(parameters))
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	cpi r30,28
	cpc r31,__zero_reg__
	brsh .L120
	subi r30,lo8(-(gs(.L122)))
	sbci r31,hi8(-(gs(.L122)))
	jmp __tablejump2__
	.section	.progmem.gcc_sw_table.VT220_process,"a",@progbits
	.p2align	1
.L122:
	.word gs(.L121)
	.word gs(.L123)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L124)
	.word gs(.L125)
	.word gs(.L120)
	.word gs(.L126)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L120)
	.word gs(.L127)
	.word gs(.L120)
	.word gs(.L128)
	.word gs(.L129)
	.word gs(.L120)
	.word gs(.L130)
	.section	.text.VT220_process
.L121:
	sts gx_flags,__zero_reg__
	sts gx_color,r17
	rjmp .L120
.L123:
	lds r24,gx_flags
	ori r24,lo8(1)
	rjmp .L223
.L124:
	lds r24,gx_flags
	ori r24,lo8(2)
	rjmp .L223
.L125:
	lds r24,gx_flags
	ori r24,lo8(4)
	rjmp .L223
.L126:
	lds r24,gx_flags
	ori r24,lo8(8)
	rjmp .L223
.L127:
	lds r24,gx_flags
	andi r24,lo8(-2)
	rjmp .L223
.L128:
	lds r24,gx_flags
	andi r24,lo8(-3)
	rjmp .L223
.L129:
	lds r24,gx_flags
	andi r24,lo8(-5)
	rjmp .L223
.L130:
	lds r24,gx_flags
	andi r24,lo8(-9)
.L223:
	sts gx_flags,r24
.L120:
	call set_gx_mode
	subi r29,lo8(-(1))
	rjmp .L119
.L104:
	lds r24,parameters
	lds r25,parameters+1
	sbiw r24,0
	brne .L133
	ldi r24,lo8(1)
	ldi r25,0
.L133:
	call erase_characters
	rjmp .L159
.L103:
	lds r24,parameters
	lds r25,parameters+1
	sbiw r24,0
	brne .L134
	call erase_cursor_to_eol
	rjmp .L159
.L134:
	cpi r24,1
	cpc r25,__zero_reg__
	brne .L135
	call erase_cursor_to_bol
	rjmp .L159
.L135:
	sbiw r24,2
	breq .+2
	rjmp .L159
	call erase_cursor_line
	rjmp .L159
.L100:
	lds r24,parameters
	lds r25,parameters+1
	sbiw r24,0
	brne .L136
	call erase_cursor_to_end
	rjmp .L159
.L136:
	cpi r24,1
	cpc r25,__zero_reg__
	brne .L137
	call erase_cursor_to_begin
	rjmp .L159
.L137:
	sbiw r24,2
	breq .+2
	rjmp .L159
	call erase_screen
	rjmp .L159
.L98:
	call tx_csi
	ldi r24,lo8(primary_da_vt220)
	ldi r25,hi8(primary_da_vt220)
	rjmp .L226
.L108:
	lds r24,parameters
	lds r25,parameters+1
	cpi r24,5
	cpc r25,__zero_reg__
	breq .L138
	sbiw r24,6
	breq .+2
	rjmp .L159
	call tx_csi
	lds r24,cursorY
	ldi r25,0
	adiw r24,1
	call tx_dec
	ldi r24,lo8(59)
	call tx_char
	lds r24,cursorX
	ldi r25,0
	adiw r24,1
	call tx_dec
	ldi r24,lo8(82)
	call tx_char
	rjmp .L159
.L138:
	call tx_csi
	ldi r24,lo8(dsr_response)
	ldi r25,hi8(dsr_response)
	rjmp .L226
.L52:
	mov r18,r24
	ldi r19,0
	movw r20,r18
	subi r20,48
	sbc r21,__zero_reg__
	cpi r20,10
	cpc r21,__zero_reg__
	brsh .L140
	lds r20,parameters
	lds r21,parameters+1
	ldi r22,lo8(10)
	mul r22,r20
	movw r24,r0
	mul r22,r21
	add r25,r0
	clr __zero_reg__
	sbiw r24,48
	add r18,r24
	adc r19,r25
	sts parameters+1,r19
	sts parameters,r18
	rjmp .L18
.L140:
	cpi r24,lo8(76)
	brsh .L142
	cpi r24,lo8(74)
	brsh .+2
	rjmp .L234
	rjmp .L143
.L142:
	cpi r24,lo8(108)
	breq .L146
	cpi r24,lo8(110)
	breq .L143
	cpi r24,lo8(104)
	breq .+2
	rjmp .L159
	lds r24,parameters
	lds r25,parameters+1
	cpi r24,5
	cpc r25,__zero_reg__
	breq .L148
	sbiw r24,7
	breq .+2
	rjmp .L159
	ldi r24,lo8(1)
	rjmp .L231
.L148:
	lds r24,gx_flags
	ori r24,lo8(8)
	rjmp .L225
.L231:
	sts auto_wrap,r24
	rjmp .L159
.L146:
	lds r18,parameters
	lds r19,parameters+1
	cpi r18,5
	cpc r19,__zero_reg__
	breq .L150
	cpi r18,7
	cpc r19,__zero_reg__
	breq .L151
	cpi r18,2
	cpc r19,__zero_reg__
	breq .+2
	rjmp .L159
	ori r25,lo8(2)
	sts flags,r25
	rjmp .L159
.L150:
	lds r24,gx_flags
	andi r24,lo8(-9)
.L225:
	sts gx_flags,r24
	call set_gx_mode
	rjmp .L159
.L151:
	sts auto_wrap,__zero_reg__
	rjmp .L159
.L143:
	lds r24,parameters
	lds r25,parameters+1
	cpi r24,15
	cpc r25,__zero_reg__
	breq .L153
	sbiw r24,26
	brne .L159
	call tx_csi
	ldi r24,lo8(dsr_keyboard_language)
	ldi r25,hi8(dsr_keyboard_language)
	rjmp .L226
.L153:
	call tx_csi
	ldi r24,lo8(dsr_no_printer)
	ldi r25,hi8(dsr_no_printer)
.L226:
	call tx_str
	rjmp .L159
.L229:
	lds r30,parameter_id
	ldi r31,0
	lsl r30
	rol r31
	subi r30,lo8(-(parameters))
	sbci r31,hi8(-(parameters))
	ld r20,Z
	ldd r21,Z+1
	ldi r22,lo8(10)
	mul r22,r20
	movw r24,r0
	mul r22,r21
	add r25,r0
	clr __zero_reg__
	add r24,r18
	adc r25,r19
	sbiw r24,48
	std Z+1,r25
	st Z,r24
	rjmp .L18
.L156:
	cpi r24,lo8(28)
	brsh .L158
	cpi r24,lo8(26)
	brsh .L159
	cpi r24,lo8(24)
	breq .L159
	rjmp .L18
.L158:
	cpi r24,lo8(-100)
	brne .L18
.L159:
	sts state,__zero_reg__
	rjmp .L18
.L161:
	ldi r28,lo8(1)
.L18:
	mov r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	ret
	.size	VT220_process, .-VT220_process
	.section	.bss.py,"aw",@nobits
	.type	py, @object
	.size	py, 1
py:
	.zero	1
	.section	.bss.px,"aw",@nobits
	.type	px, @object
	.size	px, 1
px:
	.zero	1
	.section	.data.flags,"aw",@progbits
	.type	flags, @object
	.size	flags, 1
flags:
	.byte	1
	.section	.data.auto_wrap_stored,"aw",@progbits
	.type	auto_wrap_stored, @object
	.size	auto_wrap_stored, 1
auto_wrap_stored:
	.byte	1
	.section	.bss.cursorY_stored,"aw",@nobits
	.type	cursorY_stored, @object
	.size	cursorY_stored, 1
cursorY_stored:
	.zero	1
	.section	.bss.cursorX_stored,"aw",@nobits
	.type	cursorX_stored, @object
	.size	cursorX_stored, 1
cursorX_stored:
	.zero	1
	.section	.bss.gx_flags_stored,"aw",@nobits
	.type	gx_flags_stored, @object
	.size	gx_flags_stored, 1
gx_flags_stored:
	.zero	1
	.section	.data.gx_color_stored,"aw",@progbits
	.type	gx_color_stored, @object
	.size	gx_color_stored, 1
gx_color_stored:
	.byte	112
	.section	.bss.gx_flags,"aw",@nobits
	.type	gx_flags, @object
	.size	gx_flags, 1
gx_flags:
	.zero	1
	.section	.data.gx_color,"aw",@progbits
	.type	gx_color, @object
	.size	gx_color, 1
gx_color:
	.byte	112
	.section	.bss.parameter_id,"aw",@nobits
	.type	parameter_id, @object
	.size	parameter_id, 1
parameter_id:
	.zero	1
	.section	.bss.parameters,"aw",@nobits
	.type	parameters, @object
	.size	parameters, 16
parameters:
	.zero	16
	.section	.bss.state,"aw",@nobits
	.type	state, @object
	.size	state, 1
state:
	.zero	1
	.section	.progmem.data.dsr_keyboard_language,"a",@progbits
	.type	dsr_keyboard_language, @object
	.size	dsr_keyboard_language, 7
dsr_keyboard_language:
	.string	"?27;0n"
	.section	.progmem.data.dsr_no_printer,"a",@progbits
	.type	dsr_no_printer, @object
	.size	dsr_no_printer, 5
dsr_no_printer:
	.string	"?13n"
	.section	.progmem.data.dsr_response,"a",@progbits
	.type	dsr_response, @object
	.size	dsr_response, 3
dsr_response:
	.string	"0n"
	.section	.progmem.data.primary_da_vt220,"a",@progbits
	.type	primary_da_vt220, @object
	.size	primary_da_vt220, 17
primary_da_vt220:
	.string	"?62;1;2;6;7;8;9c"
	.ident	"GCC: (GNU) 4.9.2"
.global __do_copy_data
.global __do_clear_bss
