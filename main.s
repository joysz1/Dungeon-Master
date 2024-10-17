	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L23
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L23+4
	ldr	r1, [r3, #8]
	cmp	r1, r2
	beq	.L5
	add	r0, r3, #16
	ldm	r0, {r0, r1}
	add	r1, r1, #1
	cmp	r1, r0
	str	r1, [r3, #20]
	blt	.L5
	ldr	r1, [r3, #12]
	cmp	r1, r2
	ldreq	r2, .L23+8
	ldreq	r0, .L23+12
	ldreq	r2, [r2]
	strheq	r1, [r0, #2]	@ movhi
	strne	r2, [r3, #20]
	streq	r1, [r3, #8]
	streq	r1, [r2, #20]
.L5:
	ldr	r3, .L23+16
	ldr	r2, [r3, #8]
	cmp	r2, #0
	bne	.L22
.L3:
	ldr	r3, .L23
	ldrh	r3, [r3, #2]
	tst	r3, #32
	beq	.L10
	ldr	r0, .L23+20
	ldr	r3, [r0]
	ldr	r1, .L23+24
	add	r3, r3, #1
	smull	r2, r1, r3, r1
	asr	r2, r3, #31
	add	r1, r1, r3
	rsb	r2, r2, r1, asr #5
	rsb	r2, r2, r2, lsl #4
	sub	r3, r3, r2, lsl #2
	str	r3, [r0]
.L10:
	ldr	r3, .L23
	ldrh	r3, [r3, #2]
	tst	r3, #64
	beq	.L11
	ldr	r0, .L23+28
	ldr	r2, [r0]
	ldr	r3, .L23+32
	add	r2, r2, #1
	smull	ip, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #2
	str	r3, [r0]
.L11:
	mov	r1, #1
	ldr	r3, .L23
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L22:
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L3
	ldr	r2, [r3, #12]
	cmp	r2, #0
	movne	r2, #0
	ldreq	r1, .L23+8
	ldreq	r0, .L23+12
	ldreq	r1, [r1]
	strheq	r2, [r0, #6]	@ movhi
	strne	r2, [r3, #20]
	streq	r2, [r3, #8]
	streq	r2, [r1, #32]
	b	.L3
.L24:
	.align	2
.L23:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.word	second
	.word	-2004318071
	.word	minute
	.word	1374389535
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #65536
	ldr	r4, .L27
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L27+4
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L27+12
	ldr	r5, .L27+16
	ldr	r1, [r2]
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L27+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L27+24
	ldr	r1, .L27+28
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L27+32
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L27+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r1, r5
	mov	r3, #4096
	ldr	r2, .L27+40
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r6, #0
	mov	r1, #240
	mov	r2, #160
	mov	r3, #320
	strh	r3, [r5, #18]	@ movhi
	strh	r1, [r5, #16]	@ movhi
	ldr	r3, .L27+44
	strh	r6, [r5, #22]	@ movhi
	strh	r6, [r5, #20]	@ movhi
	strh	r2, [r5, #26]	@ movhi
	strh	r6, [r5, #24]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+48
	mov	lr, pc
	bx	r3
	mov	r2, #8
	mov	ip, #97
	mov	r0, #1
	strh	r2, [r5, #4]	@ movhi
	ldr	r1, .L27+52
	ldr	r2, .L27+56
	ldr	r3, .L27+60
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	str	r1, [r2, #4092]
	ldr	r3, .L27+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+68
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L27+72
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+76
	str	r6, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	DMANow
	.word	tilesetTiles
	.word	tilesetPal
	.word	.LANCHOR0
	.word	tilemapMenuMap
	.word	83886592
	.word	100728832
	.word	spritesheetTiles
	.word	100704256
	.word	100712448
	.word	100720640
	.word	initGame
	.word	setupSounds
	.word	interruptHandler
	.word	50360320
	.word	67109376
	.word	initSound
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L31
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	lr, #7936
	mov	ip, #54272
	mov	r0, #55296
	mov	r1, #56320
	mov	r2, #53248
	strh	lr, [r3]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	pop	{r4, lr}
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	b	goToStart
.L32:
	.align	2
.L31:
	.word	mgba_open
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #0
	mov	r2, #320
	push	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	strh	r1, [r3, #16]	@ movhi
	ldr	r2, .L35
	mov	lr, pc
	bx	r2
	ldr	r4, .L35+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L35+8
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L35+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L36:
	.align	2
.L35:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L44+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L44+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L44+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L37
	ldr	r3, .L44+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L43
.L37:
	pop	{r4, lr}
	bx	lr
.L43:
	pop	{r4, lr}
	b	goToStart
.L45:
	.align	2
.L44:
	.word	waitForVBlank
	.word	drawInstructions
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #4096
	ldr	r4, .L48
	mov	r0, #3
	ldr	r2, .L48+4
	ldr	r1, .L48+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L48+12
	ldr	r1, .L48+16
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L48+20
	ldr	r1, .L48+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L48+28
	ldr	r1, .L48+32
	mov	r3, #4096
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+44
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L48+48
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L48+52
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
	.word	DMANow
	.word	100704256
	.word	tilemapOneMap
	.word	100712448
	.word	tilemapTwoMap
	.word	100720640
	.word	tilemapThreeMap
	.word	100696064
	.word	tilemapFourMap
	.word	resetMapExtra
	.word	unpauseSounds
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	lr, #67108864
	ldr	r3, .L62
	ldm	r3, {r1, r2}
	add	r2, r2, #2
	add	r1, r1, #1
	lsl	r0, r2, #16
	lsl	ip, r1, #16
	lsr	ip, ip, #16
	lsr	r0, r0, #16
	str	r1, [r3]
	strh	ip, [lr, #24]	@ movhi
	ldr	r1, .L62+4
	strh	r0, [lr, #20]	@ movhi
	ldr	r4, .L62+8
	str	r2, [r3, #4]
	mov	lr, pc
	bx	r1
	ldr	r3, .L62+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L62+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L62+20
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L51
	ldr	r2, .L62+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L60
.L51:
	tst	r3, #4
	beq	.L50
	ldr	r3, .L62+24
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L61
.L50:
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L60:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L51
.L63:
	.align	2
.L62:
	.word	.LANCHOR1
	.word	waitForVBlank
	.word	oldButtons
	.word	drawStart
	.word	DMANow
	.word	shadowOAM
	.word	buttons
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L66
	mov	r3, #4096
	ldr	r2, .L66+4
	ldr	r1, .L66+8
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r3, #67108864
	ldr	r1, .L66+12
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L66+16
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L66+20
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L66+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L67:
	.align	2
.L66:
	.word	DMANow
	.word	100704256
	.word	tilemapMenuTwoMap
	.word	pauseSounds
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L75
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
	ldr	r3, .L75+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L74
.L68:
	pop	{r4, lr}
	bx	lr
.L74:
	pop	{r4, lr}
	b	goToGame
.L76:
	.align	2
.L75:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	ip, .L79
	mov	r0, #3
	ldr	r4, .L79+4
	mov	r3, #4096
	ldr	r2, .L79+8
	ldr	r1, .L79+12
	str	r5, [ip, #8]
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #240
	strh	r5, [r3, #18]	@ movhi
	ldr	r2, .L79+16
	strh	r1, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L79+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L79+24
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L79+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L80:
	.align	2
.L79:
	.word	.LANCHOR1
	.word	DMANow
	.word	100704256
	.word	tilemapMenuTwoMap
	.word	stopSounds
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L88
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L88+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L88+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L88+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L81
	ldr	r3, .L88+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L87
.L81:
	pop	{r4, lr}
	bx	lr
.L87:
	pop	{r4, lr}
	b	goToStart
.L89:
	.align	2
.L88:
	.word	waitForVBlank
	.word	drawOver
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	ip, .L92
	mov	r0, #3
	ldr	r4, .L92+4
	mov	r3, #4096
	ldr	r2, .L92+8
	ldr	r1, .L92+12
	str	r5, [ip, #12]
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #160
	ldr	r2, .L92+16
	strh	r1, [r3, #18]	@ movhi
	strh	r5, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L92+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L92+24
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L92+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L93:
	.align	2
.L92:
	.word	.LANCHOR1
	.word	DMANow
	.word	100704256
	.word	tilemapMenuTwoMap
	.word	stopSounds
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L108
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L108+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L108+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L108+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L95
	ldr	r3, .L108+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L105
.L95:
	ldr	r4, .L108+32
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L106
.L96:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	bne	.L107
	pop	{r4, lr}
	bx	lr
.L107:
	pop	{r4, lr}
	b	goToLose
.L106:
	bl	goToWin
	b	.L96
.L105:
	bl	goToPause
	b	.L95
.L109:
	.align	2
.L108:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	DMANow
	.word	shadowOAM
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR1
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L122
	mov	lr, pc
	bx	r3
	ldr	r6, .L122+4
	ldr	r8, .L122+8
	ldr	r5, .L122+12
	ldr	fp, .L122+16
	ldr	r10, .L122+20
	ldr	r9, .L122+24
	ldr	r7, .L122+28
	ldr	r4, .L122+32
.L111:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L112:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L112
.L114:
	.word	.L118
	.word	.L117
	.word	.L116
	.word	.L115
	.word	.L113
	.word	.L113
.L113:
	mov	lr, pc
	bx	r7
	b	.L111
.L115:
	ldr	r3, .L122+36
	mov	lr, pc
	bx	r3
	b	.L111
.L116:
	mov	lr, pc
	bx	r9
	b	.L111
.L117:
	mov	lr, pc
	bx	r10
	b	.L111
.L118:
	mov	lr, pc
	bx	fp
	b	.L111
.L123:
	.align	2
.L122:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	instructions
	.word	lose
	.word	67109120
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	lose
	.size	win, .-win
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #97
	str	lr, [sp, #-4]!
	mov	r0, #67108864
	mov	lr, #1
	mov	ip, #8
	ldr	r3, .L127
	ldr	r2, .L127+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L127+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L128:
	.align	2
.L127:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.global	spritesheetPalCopy
	.global	hasLost
	.global	hasWon
	.global	vOff3
	.global	BG1hOff
	.global	BG2hOff
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	shadowOAM,1024,4
	.comm	state,4,4
	.comm	keys,32,4
	.comm	songs,12,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	secretFound,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	spritesheetPalCopy, %object
	.size	spritesheetPalCopy, 4
spritesheetPalCopy:
	.word	spritesheetPal
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	BG2hOff, %object
	.size	BG2hOff, 4
BG2hOff:
	.space	4
	.type	BG1hOff, %object
	.size	BG1hOff, 4
BG1hOff:
	.space	4
	.type	hasLost, %object
	.size	hasLost, 4
hasLost:
	.space	4
	.type	hasWon, %object
	.size	hasWon, 4
hasWon:
	.space	4
	.type	vOff3, %object
	.size	vOff3, 4
vOff3:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
