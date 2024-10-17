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
	.file	"player.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #2
	mov	lr, #5
	mov	r2, #0
	mov	r1, #30
	ldr	r3, .L4
	ldr	r0, .L4+4
	str	lr, [r3, #4]
	str	ip, [r3, #8]
	ldr	lr, .L4+8
	ldr	ip, .L4+12
	str	r0, [r3]
	ldr	r0, .L4+16
	str	r2, [lr]
	str	r1, [r3, #12]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [ip]
	str	r2, [r0]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	rooms+60
	.word	heartFrameCount
	.word	heartFrame
	.word	keysHave
	.size	initPlayer, .-initPlayer
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Next has enemy: %d\000"
	.text
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L69
	ldr	r3, [r2]
	cmp	r3, #9
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	beq	.L7
	add	r3, r3, #1
	str	r3, [r2]
.L8:
	ldr	r4, .L69+4
	ldr	r6, .L69+8
	ldr	r1, [r4, #8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r6
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L11
	ldr	r3, .L69+12
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L11
	mov	r3, #1
	ldr	r7, .L69+16
	ldr	r5, .L69+20
	str	r3, [r7]
	ldrh	r3, [r5]
	tst	r3, #64
	bne	.L62
.L13:
	tst	r3, #16
	beq	.L17
	ldr	r2, .L69+24
	ldrh	r2, [r2]
	ands	r2, r2, #16
	beq	.L63
.L17:
	tst	r3, #32
	beq	.L21
	ldr	r3, .L69+24
	ldrh	r3, [r3]
	tst	r3, #32
	beq	.L64
.L21:
	ldr	r3, [r4, #20]
	cmp	r3, #29
	bgt	.L25
	sub	r3, r3, #1
	cmp	r3, #0
	movne	r2, #31
	moveq	r1, #30
	str	r3, [r4, #20]
	ldreq	r2, .L69+28
	ldrne	r3, .L69+32
	ldreq	r3, .L69+32
	streq	r1, [r4, #20]
	strh	r2, [r3, #2]	@ movhi
.L25:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L65
	ldr	r2, [r4, #12]
	cmp	r2, #29
	ble	.L66
	ldr	r2, .L69+24
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L67
	ldrh	r1, [r5]
	tst	r1, #1
	str	r3, [r4, #16]
	beq	.L6
	ands	r5, r2, #1
	bne	.L6
	ldr	r1, [r4, #8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r6
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L6
	ldr	r1, [r4, #8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r6
	ldr	r1, [r0, #44]
	ldr	r2, [r1, #28]
	ldr	r3, [r4, #12]
	sub	r2, r2, #1
	sub	r3, r3, #1
	str	r2, [r1, #28]
	ldr	r0, [r4]
	ldr	r1, [r4, #8]
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r6
	ldr	r3, [r0, #44]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bge	.L6
	ldr	r1, [r4, #8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r6
	str	r5, [r0, #48]
	b	.L6
.L11:
	mov	r3, #0
	ldr	r7, .L69+16
	ldr	r5, .L69+20
	str	r3, [r7]
	ldrh	r3, [r5]
	tst	r3, #64
	beq	.L13
.L62:
	ldr	r2, .L69+24
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L13
	ldr	r1, [r4, #8]
	ldr	r0, [r4]
	ldr	r8, .L69+36
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L14
.L60:
	ldrh	r3, [r5]
	b	.L13
.L64:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	sub	r3, r3, #1
	moveq	r3, #3
	str	r3, [r4, #8]
	b	.L21
.L63:
	ldr	r1, [r4, #8]
	cmp	r1, #3
	addne	r2, r1, #1
	str	r2, [r4, #8]
	b	.L17
.L66:
	subs	r2, r2, #1
	moveq	r3, #30
	strne	r2, [r4, #12]
	streq	r3, [r4, #12]
.L6:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L7:
	mov	r0, #0
	ldr	r1, .L69+40
	ldr	r3, [r1]
	add	r3, r3, #1
	cmp	r3, #3
	movgt	r3, r0
	str	r0, [r2]
	str	r3, [r1]
	b	.L8
.L65:
	ldrh	r3, [r5]
	tst	r3, #1
	beq	.L6
	ldr	r3, .L69+24
	ldrh	r7, [r3]
	ands	r7, r7, #1
	bne	.L6
	mvn	r9, #0
	ldr	r5, [r4]
	ldr	r8, .L69+36
	b	.L36
.L33:
	mov	r0, r5
	ldr	r1, [r4, #8]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L68
.L35:
	mov	r0, r5
	ldr	r1, [r4, #8]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L6
.L36:
	mov	r0, r5
	ldr	r1, [r4, #8]
	mov	lr, pc
	bx	r6
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L33
	ldr	r1, [r4, #8]
	mov	r0, r5
	mov	lr, pc
	bx	r6
	ldr	r3, [r0, #44]
	ldr	r1, [r4, #8]
	str	r9, [r3, #28]
	mov	r0, r5
	mov	lr, pc
	bx	r6
	ldr	r3, [r0, #44]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bge	.L33
	mov	r0, r5
	ldr	r1, [r4, #8]
	mov	lr, pc
	bx	r6
	str	r7, [r0, #48]
	b	.L33
.L68:
	mov	r0, r5
	ldr	r1, [r4, #8]
	mov	lr, pc
	bx	r6
	mov	r5, r0
	b	.L35
.L67:
	ldr	r1, [r4, #8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r6
	ldr	r3, .L69+44
	ldr	r1, [r0, #48]
	ldr	r0, .L69+48
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r3, [r4, #16]
	b	.L6
.L14:
	ldr	r1, [r4, #8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r6
	ldr	r3, [r7]
	ldr	r2, [r0, #48]
	orrs	r3, r2, r3
	bne	.L60
	ldr	r1, [r4, #8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r6
	ldrh	r3, [r5]
	str	r0, [r4]
	b	.L13
.L70:
	.align	2
.L69:
	.word	heartFrameCount
	.word	player
	.word	nextRoom
	.word	keysHave
	.word	lockIsNext
	.word	oldButtons
	.word	buttons
	.word	9086
	.word	83886592
	.word	hasRoom
	.word	heartFrame
	.word	mgba_printf
	.word	.LC0
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L83
	mov	r3, #512
	mov	r1, r2
	push	{r4, lr}
	ldr	r4, .L83+4
	ldr	ip, [r4, #4]
	strh	r3, [r1], #8	@ movhi
	cmp	ip, #0
	strh	r3, [r1]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	strh	r3, [r2, #24]	@ movhi
	strh	r3, [r2, #32]	@ movhi
	ble	.L72
	mov	r3, #168
	mov	lr, #8
	ldr	r1, .L83+8
	ldr	r0, [r1]
	lsl	r0, r0, #5
	add	ip, ip, #21
	add	r0, r0, #31
	lsl	ip, ip, #19
	lsl	r0, r0, #22
	lsr	ip, ip, #16
	lsr	r0, r0, #22
.L73:
	add	r1, r3, #8
	strh	r3, [r2, #2]	@ movhi
	lsl	r3, r1, #16
	lsr	r3, r3, #16
	cmp	ip, r3
	strh	lr, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	add	r2, r2, #8
	bne	.L73
.L72:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L80
	ldr	r3, [r4, #12]
	cmp	r3, #29
	ble	.L81
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L82
	ldr	r3, .L83+12
	ldr	lr, .L83+16
	ldr	r2, .L83+20
	ldr	ip, .L83+24
	ldr	r0, .L83+28
	ldr	r1, .L83+32
	strh	lr, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	pop	{r4, lr}
	bx	lr
.L81:
	mov	ip, #122
	mov	r2, #512
	ldr	r3, .L83+12
	ldr	r0, .L83+36
	ldr	r1, .L83+40
	strh	ip, [r3, #12]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	strh	r2, [r3]	@ movhi
	pop	{r4, lr}
	bx	lr
.L80:
	mov	r0, #208
	ldr	r3, .L83+12
	ldr	r1, .L83+20
	ldr	r2, .L83+44
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L82:
	mov	ip, #512
	ldr	r3, .L83+12
	ldr	r0, .L83+20
	ldr	r1, .L83+44
	ldr	r2, .L83+24
	strh	ip, [r3, #8]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L84:
	.align	2
.L83:
	.word	shadowOAM+800
	.word	player
	.word	heartFrame
	.word	shadowOAM
	.word	-16354
	.word	-32664
	.word	309
	.word	-16264
	.word	314
	.word	-32656
	.word	-16304
	.word	-16314
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	nearEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	nearEnemy, %function
nearEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L118
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L86
	ldr	r2, [r3]
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L116
.L86:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L88
	ldr	r2, [r3, #4]
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L116
.L88:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L89
	ldr	r2, [r3, #8]
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L116
.L89:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L90
	ldr	r3, [r3, #12]
	ldr	r2, [r3, #48]
	cmp	r2, #0
	bne	.L117
.L90:
	mov	r2, #0
	ldr	r3, .L118+4
	mov	r0, r3
	str	r2, [r3, #12]
	bx	lr
.L116:
	ldr	r0, [r2, #44]
	bx	lr
.L117:
	ldr	r0, [r3, #44]
	bx	lr
.L119:
	.align	2
.L118:
	.word	player
	.word	noEnemy
	.size	nearEnemy, .-nearEnemy
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, lr}
	ldr	r3, .L130
	add	r2, r3, #320
.L121:
	str	r1, [r3, #16]
	add	r3, r3, #32
	cmp	r3, r2
	bne	.L121
	bl	nearEnemy
	ldr	r3, [r0, #12]
	cmp	r3, #0
	mov	r4, r0
	beq	.L120
	ldr	r3, [r0]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0]
	blt	.L128
.L120:
	pop	{r4, lr}
	bx	lr
.L128:
	mov	r2, #20
	ldr	r3, [r0, #4]
	add	r3, r3, #1
	cmp	r3, #3
	stm	r0, {r2, r3}
	beq	.L129
.L125:
	ldr	r2, [r4, #8]
	cmp	r2, r3
	movlt	r3, #0
	strlt	r3, [r4, #4]
	pop	{r4, lr}
	bx	lr
.L129:
	ldr	ip, .L130+4
	ldr	r2, [ip, #16]
	cmp	r2, #0
	bne	.L125
	ldr	r0, [ip, #4]
	ldr	r3, [ip, #20]
	ldr	r1, .L130+8
	sub	r0, r0, #1
	sub	r3, r3, #1
	str	r0, [ip, #4]
	str	r3, [ip, #20]
	ldr	r1, [r1]
	ldr	r3, .L130+12
	ldr	r0, .L130+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	b	.L125
.L131:
	.align	2
.L130:
	.word	enemies
	.word	player
	.word	ouch_length
	.word	playSoundB
	.word	ouch_data
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	updateKeys
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateKeys, %function
updateKeys:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L140
	ldr	r1, [r3]
	ldr	r0, [r1, #52]
	ldr	r3, .L140+4
	cmp	r0, #0
	str	r2, [r3, #4]
	str	r2, [r3, #20]
	bxeq	lr
	ldr	r3, [r1, #56]
	ldr	r2, [r3]
	cmp	r2, #0
	bxeq	lr
	mov	r0, #0
	ldr	r1, .L140+8
	ldr	r2, [r1]
	add	r2, r2, #1
	str	r2, [r1]
	str	r0, [r3]
	bx	lr
.L141:
	.align	2
.L140:
	.word	player
	.word	keys
	.word	keysHave
	.size	updateKeys, .-updateKeys
	.align	2
	.global	drawLocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLocks, %function
drawLocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L147
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r1, #512
	movne	ip, #260
	ldr	r3, [r3, #16]
	ldrne	r2, .L147+4
	ldreq	r2, .L147+4
	ldrne	r0, .L147+8
	ldrne	r1, .L147+12
	strhne	r0, [r2]	@ movhi
	strhne	r1, [r2, #2]	@ movhi
	strheq	r1, [r2]	@ movhi
	strhne	ip, [r2, #4]	@ movhi
	cmp	r3, #0
	moveq	r2, #512
	movne	r0, #260
	ldrne	r3, .L147+16
	ldreq	r3, .L147+16
	ldrne	r1, .L147+8
	ldrne	r2, .L147+20
	strheq	r2, [r3]	@ movhi
	strhne	r0, [r3, #4]	@ movhi
	strhne	r1, [r3]	@ movhi
	strhne	r2, [r3, #2]	@ movhi
	bx	lr
.L148:
	.align	2
.L147:
	.word	keys
	.word	shadowOAM+400
	.word	-32704
	.word	-32708
	.word	shadowOAM+408
	.word	-32684
	.size	drawLocks, .-drawLocks
	.align	2
	.global	hideLocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideLocks, %function
hideLocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #512
	ldr	r3, .L150
	add	r1, r3, #400
	add	r3, r3, #408
	strh	r2, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L151:
	.align	2
.L150:
	.word	shadowOAM
	.size	hideLocks, .-hideLocks
	.comm	noEnemy,32,4
	.comm	player,28,4
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
