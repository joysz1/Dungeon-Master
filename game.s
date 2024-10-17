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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	initRooms
	.word	initPlayer
	.word	initEnemies
	.word	initKeys
	.word	secretFound
	.size	initGame, .-initGame
	.align	2
	.global	drawStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStart, %function
drawStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	lr, #384
	mov	r0, #232
	mov	r2, #392
	mov	r5, #388
	mov	r4, #148
	mov	ip, #704
	mov	r1, #708
	ldr	r3, .L8
	strh	lr, [r3, #4]	@ movhi
	ldr	lr, .L8+4
	strh	r0, [r3, #18]	@ movhi
	strh	lr, [r3, #2]	@ movhi
	ldr	r0, .L8+8
	add	lr, lr, #32
	strh	r2, [r3, #20]	@ movhi
	ldr	r2, .L8+12
	strh	lr, [r3, #10]	@ movhi
	sub	lr, lr, #196
	strh	r5, [r3, #12]	@ movhi
	strh	r4, [r3, #16]	@ movhi
	strh	lr, [r3, #26]	@ movhi
	strh	ip, [r3, #28]	@ movhi
	strh	r0, [r3, #34]	@ movhi
	strh	r1, [r3, #36]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #24]	@ movhi
	strh	r2, [r3, #32]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	shadowOAM
	.word	16552
	.word	16420
	.word	16532
	.size	drawStart, .-drawStart
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L20
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+12
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L11
	ldr	r3, .L20+16
	ldr	r2, [r3]
.L12:
	ldr	r2, [r2, #36]
	cmp	r2, #0
	movne	r1, #1
	ldr	r3, [r3, #4]
	ldrne	r2, .L20+20
	strne	r1, [r2]
	cmp	r3, #0
	moveq	r2, #1
	ldreq	r3, .L20+24
	pop	{r4, lr}
	streq	r2, [r3]
	bx	lr
.L11:
	ldr	r3, .L20+28
	ldrh	r2, [r3]
	ldr	r3, .L20+16
	tst	r2, #4
	ldr	r2, [r3]
	bne	.L12
	ldr	r1, .L20+32
	cmp	r2, r1
	bne	.L12
	ldr	r1, [r3, #8]
	cmp	r1, #3
	bne	.L12
	ldr	r1, .L20+36
	ldr	r0, [r1]
	cmp	r0, #0
	movne	r1, #1
	strne	r1, [r3, #24]
	bne	.L12
	mov	lr, #840
	mov	r4, #776
	mov	ip, #1
	ldr	r0, .L20+40
	strh	lr, [r0, #64]	@ movhi
	sub	lr, lr, #67
	strh	lr, [r0, #-6]	@ movhi
	add	lr, lr, #50593792
	strh	r4, [r0]	@ movhi
	add	lr, lr, #196608
	ldr	r0, .L20+44
	add	lr, lr, #1
	str	lr, [r0, #2640]
	add	lr, lr, #4194304
	add	lr, lr, #64
	str	lr, [r0, #2704]
	add	r0, r0, #2688
	ldr	lr, .L20+48
	add	r0, r0, #12
	strh	lr, [r0, #2]	@ movhi
	str	ip, [r1]
	b	.L12
.L21:
	.align	2
.L20:
	.word	updatePlayer
	.word	updateEnemies
	.word	updateKeys
	.word	oldButtons
	.word	player
	.word	hasWon
	.word	hasLost
	.word	buttons
	.word	rooms+60
	.word	secretFound
	.word	100706900
	.word	100704256
	.word	837
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+4
	mov	r1, #0
	ldr	r2, [r3, #8]
	ldr	r0, [r3]
	ldr	r3, .L24+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+20
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L24+24
	ldrh	r1, [r2]
	ldr	r2, .L24+28
	strh	r1, [r3, #16]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L24+32
	strh	r1, [r3, #18]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L24+36
	strh	r1, [r3, #20]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L24+40
	strh	r1, [r3, #22]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L24+44
	strh	r1, [r3, #24]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L24+48
	strh	r1, [r3, #26]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L24+52
	ldrh	r2, [r2]
	strh	r1, [r3, #28]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #30]	@ movhi
	bx	lr
.L25:
	.align	2
.L24:
	.word	hideLocks
	.word	player
	.word	drawRoom
	.word	drawPlayer
	.word	drawEnemies
	.word	drawKeys
	.word	hOffZero
	.word	vOffZero
	.word	hOffOne
	.word	vOffOne
	.word	hOffTwo
	.word	vOffTwo
	.word	hOffThree
	.word	vOffThree
	.size	drawGame, .-drawGame
	.align	2
	.global	drawOver
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawOver, %function
drawOver:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #708
	mov	lr, #704
	ldr	r3, .L28
	ldr	r2, .L28+4
	ldr	ip, .L28+8
	ldr	r0, .L28+12
	strh	lr, [r3, #28]	@ movhi
	strh	ip, [r3, #26]	@ movhi
	strh	r0, [r3, #34]	@ movhi
	strh	r1, [r3, #36]	@ movhi
	strh	r2, [r3, #24]	@ movhi
	strh	r2, [r3, #32]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L29:
	.align	2
.L28:
	.word	shadowOAM
	.word	16532
	.word	16388
	.word	16420
	.size	drawOver, .-drawOver
	.align	2
	.global	drawInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawInstructions, %function
drawInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #120
	mov	r2, #484
	mov	ip, #552
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #108
	mov	r5, #556
	mov	r4, #32
	mov	lr, #40
	mov	fp, #16
	mov	r10, #448
	mov	r9, #100
	mov	r8, #576
	mov	r7, #24
	mov	r1, #548
	ldr	r3, .L32
	strh	r0, [r3, #80]	@ movhi
	add	r0, r0, #189
	strh	r2, [r3, #20]	@ movhi
	strh	r0, [r3, #44]	@ movhi
	strh	r2, [r3, #28]	@ movhi
	ldr	r0, .L32+4
	sub	r2, r2, #61
	strh	ip, [r3, #68]	@ movhi
	strh	r2, [r3, #60]	@ movhi
	ldr	ip, .L32+8
	ldr	r2, .L32+12
	strh	r0, [r3, #58]	@ movhi
	add	r0, r0, #36
	strh	ip, [r3, #42]	@ movhi
	strh	r0, [r3, #66]	@ movhi
	ldr	ip, .L32+16
	ldr	r0, .L32+20
	strh	r2, [r3, #72]	@ movhi
	ldr	r2, .L32+24
	strh	r6, [r3, #24]	@ movhi
	strh	r5, [r3, #52]	@ movhi
	ldr	r6, .L32+28
	ldr	r5, .L32+32
	strh	r4, [r3, #56]	@ movhi
	strh	lr, [r3, #64]	@ movhi
	ldr	r4, .L32+36
	ldr	lr, .L32+40
	strh	ip, [r3, #48]	@ movhi
	strh	r0, [r3, #76]	@ movhi
	ldr	ip, .L32+44
	ldr	r0, .L32+48
	strh	r2, [r3, #82]	@ movhi
	ldr	r2, .L32+52
	strh	fp, [r3]	@ movhi
	strh	r10, [r3, #4]	@ movhi
	strh	r9, [r3, #8]	@ movhi
	strh	r8, [r3, #12]	@ movhi
	strh	r7, [r3, #16]	@ movhi
	strh	r6, [r3, #32]	@ movhi
	strh	r5, [r3, #34]	@ movhi
	strh	r4, [r3, #36]	@ movhi
	strh	lr, [r3, #40]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	ip, [r3, #10]	@ movhi
	strh	r0, [r3, #18]	@ movhi
	strh	r0, [r3, #26]	@ movhi
	strh	r2, [r3, #50]	@ movhi
	strh	r2, [r3, #74]	@ movhi
	strh	r1, [r3, #84]	@ movhi
	mov	r1, #704	@ movhi
	strh	r1, [r3, #92]	@ movhi
	mov	r1, #708	@ movhi
	ldr	r2, .L32+56
	ldr	ip, .L32+60
	sub	r0, r0, #24
	strh	ip, [r3, #90]	@ movhi
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #88]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	shadowOAM
	.word	-32636
	.word	-16306
	.word	16464
	.word	16394
	.word	427
	.word	-32616
	.word	-32758
	.word	-16314
	.word	314
	.word	-32668
	.word	-32744
	.word	16444
	.word	-16240
	.word	16532
	.word	16388
	.size	drawInstructions, .-drawInstructions
	.align	2
	.global	resetMapExtra
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetMapExtra, %function
resetMapExtra:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	ip, .L35
	ldr	r0, .L35+4
	ldr	r1, .L35+8
	ldr	r2, .L35+12
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L36:
	.align	2
.L35:
	.word	mapOneExtra
	.word	mapTwoExtra
	.word	mapThreeExtra
	.word	mapFourExtra
	.size	resetMapExtra, .-resetMapExtra
	.align	2
	.global	setupSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L38
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L39:
	.align	2
.L38:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #910163968
	mov	r5, r1
	mov	r6, r0
	mov	r7, r2
	mov	r1, r0
	ldr	r2, .L42+8
	mov	r0, #1
	ldr	r4, .L42+12
	mov	lr, pc
	bx	r4
	mov	r8, #0
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L42+16
	ldr	r3, .L42+20
	strh	r8, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #8]
	str	r6, [r4]
	ldr	r3, .L42+24
	str	r7, [r4, #12]
	mov	lr, pc
	bx	r3
	ldr	r5, .L42+28
	adr	r3, .L42
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L42+32
	ldr	r3, .L42+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L42+40
	mov	lr, pc
	bx	r3
	str	r8, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L43:
	.align	3
.L42:
	.word	1443109011
	.word	1078844686
	.word	67109024
	.word	DMANow
	.word	soundA
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #910163968
	mov	r5, r1
	mov	r6, r0
	mov	r7, r2
	mov	r1, r0
	ldr	r2, .L46+8
	mov	r0, #2
	ldr	r4, .L46+12
	mov	lr, pc
	bx	r4
	mov	r8, #0
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L46+16
	ldr	r3, .L46+20
	strh	r8, [r3, #6]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #8]
	str	r6, [r4]
	ldr	r3, .L46+24
	str	r7, [r4, #12]
	mov	lr, pc
	bx	r3
	ldr	r5, .L46+28
	adr	r3, .L46
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L46+32
	ldr	r3, .L46+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L46+40
	mov	lr, pc
	bx	r3
	str	r8, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L47:
	.align	3
.L46:
	.word	1443109011
	.word	1078844686
	.word	67109028
	.word	DMANow
	.word	soundB
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	pauseSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSounds, %function
pauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L49
	ldr	r0, .L49+4
	ldr	r1, .L49+8
	str	r3, [r0, #8]
	str	r3, [r1, #8]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	strh	r3, [r2, #10]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	bx	lr
.L50:
	.align	2
.L49:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSounds, .-pauseSounds
	.align	2
	.global	unpauseSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSounds, %function
unpauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #128
	mov	r2, #1
	mov	ip, #195
	mov	r0, #196
	str	lr, [sp, #-4]!
	ldr	r3, .L53
	ldr	lr, .L53+4
	strh	r1, [r3, #2]	@ movhi
	str	r2, [lr, #8]
	ldr	lr, .L53+8
	strh	r1, [r3, #6]	@ movhi
	str	r2, [lr, #8]
	strh	ip, [r3, #10]	@ movhi
	ldr	lr, [sp], #4
	strh	r0, [r3, #14]	@ movhi
	bx	lr
.L54:
	.align	2
.L53:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSounds, .-unpauseSounds
	.align	2
	.global	stopSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSounds, %function
stopSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L56
	ldr	ip, .L56+4
	strh	r3, [r2, #2]	@ movhi
	ldr	r0, .L56+8
	strh	r3, [r2, #6]	@ movhi
	ldr	r1, .L56+12
	ldr	r2, [ip]
	str	r3, [r0, #8]
	str	r3, [r2, #20]
	str	r3, [r1, #8]
	str	r3, [r2, #32]
	bx	lr
.L57:
	.align	2
.L56:
	.word	67109120
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSounds, .-stopSounds
	.align	2
	.global	revealSecret
	.syntax unified
	.arm
	.fpu softvfp
	.type	revealSecret, %function
revealSecret:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #776
	str	lr, [sp, #-4]!
	mov	lr, #840
	mov	r1, #1
	ldr	r3, .L60
	ldr	ip, .L60+4
	add	r2, r3, #588
	strh	ip, [r2, #2]	@ movhi
	add	r2, r3, #596
	strh	r0, [r2]	@ movhi
	add	ip, ip, #64
	add	r0, r3, #652
	strh	ip, [r0, #2]	@ movhi
	add	r3, r3, #660
	add	ip, ip, #67108864
	strh	lr, [r3]	@ movhi
	ldr	r2, .L60+8
	ldr	r0, .L60+12
	ldr	r3, .L60+16
	sub	ip, ip, #16318464
	sub	ip, ip, #63
	str	ip, [r2, #2640]
	str	r0, [r2, #2704]
	ldr	lr, [sp], #4
	str	r1, [r3]
	bx	lr
.L61:
	.align	2
.L60:
	.word	100706304
	.word	773
	.word	100704256
	.word	54985542
	.word	secretFound
	.size	revealSecret, .-revealSecret
	.comm	secretFound,4,4
	.comm	hasLost,4,4
	.comm	hasWon,4,4
	.comm	songs,12,4
	.comm	lockIsNext,4,4
	.comm	keysHave,4,4
	.comm	heartFrame,4,4
	.comm	heartFrameCount,4,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	mapFourExtra,4,4
	.comm	mapThreeExtra,4,4
	.comm	mapTwoExtra,4,4
	.comm	mapOneExtra,4,4
	.comm	keys,32,4
	.comm	enemies,320,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
