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
	.file	"enemy.c"
	.text
	.align	2
	.global	initEnemies
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #20
	push	{r4, lr}
	mov	r1, #1
	mov	r4, r2
	mov	lr, #0
	mov	ip, #3
	mov	r0, #9
	ldr	r3, .L6
.L2:
	str	r2, [r3, #20]
	add	r2, r2, #1
	cmp	r2, #30
	stm	r3, {r4, lr}
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	ip, [r3, #8]
	str	r0, [r3, #28]
	add	r3, r3, #32
	bne	.L2
	pop	{r4, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	enemies
	.size	initEnemies, .-initEnemies
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, #512
	mov	r9, #74
	mov	r6, #256
	ldr	r3, .L19
	ldr	r1, .L19+4
	ldr	r8, .L19+8
	ldr	r7, .L19+12
	ldr	lr, .L19+16
	ldr	r5, .L19+20
	ldr	r4, .L19+24
	add	r0, r3, #320
.L13:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L9
	ldr	r2, [r3, #24]
	cmp	r2, #0
	blt	.L9
	ldr	r2, [r3, #20]
	cmp	r2, #1
	beq	.L16
	cmp	r2, #2
	beq	.L17
	cmp	r2, #3
	bne	.L11
	ldr	r2, [r3, #16]
	lsl	r10, r2, #3
	add	r2, r1, r2, lsl #3
	strh	r8, [r1, r10]	@ movhi
	strh	r9, [r2, #2]	@ movhi
	strh	r7, [r2, #4]	@ movhi
.L11:
	add	r3, r3, #32
	cmp	r3, r0
	bne	.L13
.L18:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L9:
	ldr	r2, [r3, #16]
	add	r3, r3, #32
	lsl	r2, r2, #3
	cmp	r3, r0
	strh	ip, [r1, r2]	@ movhi
	bne	.L13
	b	.L18
.L16:
	ldr	r2, [r3]
	ldr	r10, [r3, #16]
	lsl	r2, r2, #2
	add	r3, r3, #32
	add	fp, r1, r10, lsl #3
	and	r2, r2, #1020
	lsl	r10, r10, #3
	cmp	r3, r0
	strh	r2, [fp, #4]	@ movhi
	strh	r4, [fp, #2]	@ movhi
	strh	r5, [r1, r10]	@ movhi
	bne	.L13
	b	.L18
.L17:
	ldr	r2, [r3, #16]
	add	r3, r3, #32
	lsl	r10, r2, #3
	cmp	r3, r0
	add	r2, r1, r2, lsl #3
	strh	lr, [r1, r10]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	r6, [r2, #4]	@ movhi
	bne	.L13
	b	.L18
.L20:
	.align	2
.L19:
	.word	enemies+4
	.word	shadowOAM
	.word	-32690
	.word	258
	.word	-32696
	.word	-32704
	.word	-16316
	.size	drawEnemies, .-drawEnemies
	.comm	enemies,320,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
