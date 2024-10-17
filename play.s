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
	.file	"play.c"
	.text
	.align	2
	.global	playSong
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSong, %function
playSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L7
	add	r0, r0, r0, lsl #1
	add	r0, r3, r0, lsl #2
	ldr	r1, [r0, #4]
	mov	r2, #1
	push	{r4, lr}
	ldr	r0, [r0, #8]
	ldr	r3, .L7+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	ip, #49152
	mvn	r0, #59
	ldr	r1, .L7+8
	ldr	r3, .L7+12
	str	r2, [r1]
	ldr	lr, .L7+16
	ldr	r1, .L7+20
	str	r2, [lr]
	strh	r2, [r3, #10]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	ldr	r2, [r1]
	cmp	r2, #0
	strh	r0, [r3, #12]	@ movhi
	bne	.L6
	mov	r1, #195
	mov	r2, #196
	strh	r1, [r3, #10]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #14]	@ movhi
	bx	lr
.L6:
	ldr	r3, .L7+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	songs
	.word	playSoundA
	.word	titlePosition
	.word	67109120
	.word	frame
	.word	paused
	.word	pauseSounds
	.size	playSong, .-playSong
	.align	2
	.global	initSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSound, %function
initSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	ldr	r3, .L13
	add	r1, r3, #40
.L10:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L10
	mov	r1, #1
	ldr	r3, .L13+4
	ldr	r0, .L13+8
	ldr	lr, [r3]
	ldr	r0, [r0]
	ldr	r3, .L13+12
	ldr	ip, .L13+16
	str	lr, [r3]
	ldr	r4, .L13+20
	str	r0, [r3, #4]
	ldr	lr, .L13+24
	ldr	r0, .L13+28
	str	ip, [r3, #8]
	ldr	ip, .L13+32
	ldr	r3, .L13+36
	str	r1, [r4]
	str	r1, [r0, #12]
	str	r2, [lr]
	mov	r0, #0
	pop	{r4, lr}
	str	r2, [ip]
	str	r2, [r3, #12]
	b	playSong
.L14:
	.align	2
.L13:
	.word	intensity-4
	.word	psychorus_sampleRate
	.word	psychorus_length
	.word	songs
	.word	psychorus_data
	.word	paused
	.word	shuffle
	.word	soundA
	.word	currentSong
	.word	soundB
	.size	initSound, .-initSound
	.comm	titlePosition,4,4
	.comm	screenTitle,4,4
	.comm	currentSong,4,4
	.comm	progress,4,4
	.comm	frame,4,4
	.comm	second,4,4
	.comm	minute,4,4
	.comm	shuffle,4,4
	.comm	paused,4,4
	.comm	intensity,40,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,12,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
