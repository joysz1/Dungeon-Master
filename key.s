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
	.file	"key.c"
	.text
	.align	2
	.global	initKeys
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initKeys, %function
initKeys:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	mov	r1, #40
	ldr	r3, .L3
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #24]
	bx	lr
.L4:
	.align	2
.L3:
	.word	keys
	.size	initKeys, .-initKeys
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"drawing key\000"
	.text
	.align	2
	.global	drawKeys
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawKeys, %function
drawKeys:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	ldr	r4, .L20
	ldr	r6, .L20+4
	ldr	r8, .L20+8
	ldr	r7, .L20+12
.L13:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ldr	r3, [r4]
	bne	.L6
	cmp	r3, #0
	bne	.L7
	ldr	r2, [r4, #8]
.L8:
	lsl	r3, r5, #2
	add	r3, r5, r3
	lsl	r3, r3, #2
	add	r3, r3, #180
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	mov	r0, #184
	add	r2, r2, r5
	add	r1, r6, r2, lsl #3
	strh	r3, [r1, #2]	@ movhi
	ldr	r3, .L20+16
	lsl	r2, r2, #3
	strh	r0, [r1, #4]	@ movhi
	strh	r3, [r6, r2]	@ movhi
.L10:
	cmp	r5, #1
	add	r4, r4, #16
	bne	.L14
.L17:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L6:
	cmp	r3, #0
	movne	r3, #512
	ldr	r2, [r4, #8]
	addne	r2, r6, r2, lsl #3
	strhne	r3, [r2, #8]	@ movhi
	beq	.L8
	cmp	r5, #1
	add	r4, r4, #16
	beq	.L17
.L14:
	mov	r5, #1
	b	.L13
.L7:
	mov	r0, r8
	mov	lr, pc
	bx	r7
	ldr	r3, [r4, #12]
	cmp	r3, #1
	beq	.L18
	cmp	r3, #2
	beq	.L19
	cmp	r3, #3
	bne	.L10
	mov	r1, #72
	mov	r2, #246
	ldr	r3, [r4, #8]
	ldr	ip, .L20+20
	add	r3, r5, r3
	lsl	r0, r3, #3
	add	r3, r6, r3, lsl #3
	strh	ip, [r6, r0]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L10
.L19:
	mov	r1, #183
	ldr	r3, [r4, #8]
	ldr	r0, .L20+20
	add	r3, r5, r3
	lsl	r2, r3, #3
	strh	r0, [r6, r2]	@ movhi
	ldr	r2, .L20+24
	add	r3, r6, r3, lsl #3
	strh	r1, [r3, #4]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	b	.L10
.L18:
	mov	r1, #184
	ldr	r3, [r4, #8]
	ldr	r0, .L20+28
	add	r3, r5, r3
	lsl	r2, r3, #3
	strh	r0, [r6, r2]	@ movhi
	ldr	r2, .L20+32
	add	r3, r6, r3, lsl #3
	strh	r1, [r3, #4]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	b	.L10
.L21:
	.align	2
.L20:
	.word	keys
	.word	shadowOAM
	.word	.LC0
	.word	mgba_printf
	.word	-32708
	.word	-32696
	.word	16448
	.word	-32704
	.word	-32720
	.size	drawKeys, .-drawKeys
	.comm	keys,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
