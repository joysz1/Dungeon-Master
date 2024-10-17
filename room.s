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
	.file	"room.c"
	.text
	.align	2
	.global	initRooms
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRooms, %function
initRooms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	ldr	r3, .L4
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r1, .L4+4
	add	r7, r3, #120
	add	ip, r3, #180
	add	r9, r3, #300
	add	r8, r3, #1488
	add	r5, r3, #240
	add	r8, r8, #12
	str	r7, [r3, #60]
	str	r7, [r3, #188]
	str	ip, [r3, #120]
	add	r7, r3, #360
	str	ip, [r3, #248]
	str	r9, [r3, #252]
	add	ip, r3, #420
	str	r9, [r3, #364]
	add	r6, r3, #2880
	add	r9, r3, #1440
	add	lr, r3, #60
	str	r6, [r3, #68]
	str	r1, [r3, #284]
	str	lr, [r3, #128]
	str	r5, [r3, #180]
	str	r5, [r3, #304]
	str	r8, [r3, #244]
	str	r7, [r3, #312]
	str	r7, [r3, #420]
	str	ip, [r3, #368]
	str	r2, [r3, #76]
	str	r2, [r3, #84]
	str	r2, [r3, #144]
	str	r2, [r3, #136]
	str	r2, [r3, #204]
	str	r2, [r3, #196]
	str	r2, [r3, #264]
	str	r2, [r3, #268]
	str	r2, [r3, #260]
	str	r2, [r3, #288]
	str	r2, [r3, #320]
	str	r2, [r3, #328]
	str	r2, [r3, #380]
	str	r2, [r3, #384]
	str	r2, [r3, #376]
	str	r2, [r3, #436]
	str	r9, [r3, #360]
	str	ip, [r3, #484]
	add	ip, r3, #480
	str	ip, [r3, #432]
	str	ip, [r3, #544]
	add	ip, r3, #540
	str	ip, [r3, #492]
	str	ip, [r3, #604]
	add	ip, r3, #600
	str	ip, [r3, #552]
	str	ip, [r3, #668]
	add	ip, r3, #660
	str	ip, [r3, #600]
	str	ip, [r3, #728]
	add	ip, r3, #720
	add	lr, r1, #128
	str	ip, [r3, #660]
	str	ip, [r3, #784]
	add	r0, r3, #1072
	add	ip, r3, #780
	ldr	r10, .L4+8
	str	lr, [r3, #704]
	str	ip, [r3, #732]
	add	lr, r3, #840
	str	ip, [r3, #848]
	add	r0, r0, #8
	add	ip, r3, #900
	add	fp, r3, #1136
	add	fp, fp, #4
	str	lr, [r3, #780]
	str	r2, [r3, #448]
	str	r2, [r3, #500]
	str	r2, [r3, #508]
	str	r2, [r3, #560]
	str	r2, [r3, #568]
	str	r2, [r3, #620]
	str	r2, [r3, #616]
	str	r2, [r3, #684]
	str	r2, [r3, #676]
	str	r2, [r3, #708]
	str	r2, [r3, #744]
	str	r2, [r3, #748]
	str	r2, [r3, #800]
	str	r2, [r3, #796]
	str	r2, [r3, #864]
	str	r2, [r3, #856]
	str	r2, [r3, #924]
	add	r4, r3, #2928
	str	ip, [r3, #840]
	add	r6, r3, #2992
	str	lr, [r3, #908]
	str	r0, [r3, #1020]
	str	ip, [r3, #964]
	str	ip, [r3, #1152]
	add	r0, r3, #1312
	add	ip, r1, #96
	add	lr, r3, #1248
	add	r4, r4, #12
	add	r6, r6, #8
	add	r0, r0, #8
	add	lr, lr, #12
	str	ip, [r3, #1064]
	str	fp, [r3, #904]
	add	ip, r3, #960
	str	fp, [r3, #1208]
	str	r10, [r3, #1136]
	add	fp, r3, #1020
	add	r10, r3, #1200
	str	ip, [r3, #912]
	str	ip, [r3, #1024]
	str	fp, [r3, #972]
	str	fp, [r3, #1088]
	str	r10, [r3, #1140]
	str	r4, [r3, #1204]
	str	r6, [r3, #1260]
	str	r0, [r3, #1268]
	str	r2, [r3, #928]
	str	r2, [r3, #920]
	str	r2, [r3, #980]
	str	r2, [r3, #988]
	str	r2, [r3, #1040]
	str	r2, [r3, #1036]
	str	r2, [r3, #1068]
	str	r2, [r3, #1104]
	str	r2, [r3, #1132]
	str	r2, [r3, #1168]
	str	r2, [r3, #1156]
	str	r2, [r3, #1224]
	str	r2, [r3, #1220]
	str	r2, [r3, #1276]
	str	r2, [r3, #1284]
	str	r2, [r3, #1336]
	str	lr, [r3, #1320]
	str	r5, [r3, #1512]
	add	r5, r1, #32
	str	r5, [r3, #1484]
	add	r5, r1, #224
	str	r8, [r3, #1568]
	str	r0, [r3, #1392]
	str	r5, [r3, #1724]
	add	ip, r3, #1376
	add	r8, r3, #1552
	add	r0, r3, #1616
	add	fp, r3, #2272
	add	r5, r3, #1728
	add	r0, r0, #4
	add	ip, ip, #4
	add	r8, r8, #8
	add	fp, fp, #8
	add	r5, r5, #12
	str	r7, [r3, #1448]
	add	r7, r3, #1680
	str	r9, [r3, #1388]
	str	r7, [r3, #1624]
	str	ip, [r3, #1324]
	str	ip, [r3, #1440]
	str	r8, [r3, #1500]
	str	r8, [r3, #1632]
	str	r0, [r3, #1564]
	str	r0, [r3, #1692]
	str	fp, [r3, #1620]
	str	r2, [r3, #1340]
	str	r2, [r3, #1408]
	str	r2, [r3, #1404]
	str	r2, [r3, #1456]
	str	r2, [r3, #1464]
	str	r2, [r3, #1488]
	str	r2, [r3, #1528]
	str	r2, [r3, #1516]
	str	r2, [r3, #1584]
	str	r2, [r3, #1580]
	str	r2, [r3, #1648]
	str	r2, [r3, #1640]
	str	r2, [r3, #1636]
	str	r2, [r3, #1708]
	str	r2, [r3, #1704]
	str	r2, [r3, #1728]
	str	r2, [r3, #1756]
	str	r5, [r3, #1688]
	str	r7, [r3, #1740]
	mov	r7, #0
	str	r5, [r3, #1812]
	add	r9, r3, #1792
	add	r5, r3, #1856
	add	r9, r9, #8
	add	r5, r5, #4
	str	r9, [r3, #1744]
	str	r9, [r3, #1872]
	str	r5, [r3, #1804]
	str	r5, [r3, #1928]
	add	r9, r3, #2096
	add	r5, r3, #1920
	add	r9, r9, #4
	str	r7, [r3, #2148]
	str	r5, [r3, #1860]
	str	r5, [r3, #1988]
	add	r8, r3, #1968
	add	r7, r3, #2032
	add	r5, r3, #2208
	add	r8, r8, #12
	add	r7, r7, #8
	add	r5, r5, #12
	str	r9, [r3, #2040]
	str	r9, [r3, #2164]
	add	r9, r3, #2160
	str	r8, [r3, #1920]
	str	r8, [r3, #2044]
	str	r7, [r3, #1992]
	str	r7, [r3, #2108]
	str	r9, [r3, #2112]
	str	r2, [r3, #1760]
	str	r2, [r3, #1828]
	str	r2, [r3, #1820]
	str	r2, [r3, #1888]
	str	r2, [r3, #1876]
	str	r2, [r3, #1944]
	str	r2, [r3, #1936]
	str	r2, [r3, #2004]
	str	r2, [r3, #2008]
	str	r2, [r3, #2060]
	str	r2, [r3, #2056]
	str	r2, [r3, #2124]
	str	r2, [r3, #2128]
	str	r2, [r3, #2180]
	str	r2, [r3, #2188]
	str	r2, [r3, #2176]
	add	r8, r3, #2448
	str	r5, [r3, #2172]
	str	r9, [r3, #2224]
	str	r9, [r3, #2348]
	add	r9, r1, #192
	add	r8, r8, #12
	str	r5, [r3, #2280]
	str	r9, [r3, #2264]
	add	ip, r3, #2336
	add	r9, r1, #256
	add	r7, r3, #2512
	add	r5, r3, #2576
	add	ip, ip, #4
	add	r7, r7, #8
	add	r5, r5, #4
	str	r9, [r3, #2564]
	str	r8, [r3, #2400]
	add	r9, r3, #2400
	str	r8, [r3, #2532]
	add	r8, r3, #2640
	str	ip, [r3, #2160]
	str	fp, [r3, #2228]
	str	r0, [r3, #2288]
	str	ip, [r3, #2408]
	str	r9, [r3, #2340]
	str	r9, [r3, #2468]
	str	r7, [r3, #2464]
	str	r7, [r3, #2588]
	str	r5, [r3, #2520]
	str	r2, [r3, #2240]
	str	r2, [r3, #2244]
	str	r2, [r3, #2268]
	str	r2, [r3, #2296]
	str	r2, [r3, #2304]
	str	r2, [r3, #2364]
	str	r2, [r3, #2356]
	str	r2, [r3, #2424]
	str	r2, [r3, #2416]
	str	r2, [r3, #2484]
	str	r2, [r3, #2480]
	str	r2, [r3, #2548]
	str	r2, [r3, #2536]
	str	r2, [r3, #2568]
	str	r2, [r3, #2604]
	str	r2, [r3, #2596]
	add	fp, r3, #2816
	str	r8, [r3, #2580]
	add	ip, r3, #2688
	str	r4, [r3, #3012]
	add	r0, r3, #2752
	ldr	r4, .L4+12
	add	r7, r1, #288
	str	r6, [r3, #2944]
	str	lr, [r3, #3008]
	add	r6, r1, #160
	add	fp, fp, #4
	add	ip, ip, #12
	add	r0, r0, #8
	sub	lr, lr, #1200
	add	r1, r1, #64
	str	r5, [r3, #2648]
	str	r8, [r3, #2704]
	str	r4, [r3, #2876]
	str	lr, [r3, #2880]
	str	r10, [r3, #2952]
	str	r7, [r3, #2684]
	str	fp, [r3, #2768]
	str	r6, [r3, #2804]
	str	r2, [r3, #2664]
	str	r2, [r3, #2668]
	str	r2, [r3, #2688]
	str	r2, [r3, #2720]
	str	r2, [r3, #2728]
	str	r2, [r3, #2780]
	str	r2, [r3, #2784]
	str	r2, [r3, #2808]
	str	r2, [r3, #2836]
	str	r2, [r3, #2872]
	str	r2, [r3, #2896]
	str	r2, [r3, #2916]
	str	r2, [r3, #2968]
	str	r2, [r3, #2960]
	str	r2, [r3, #2988]
	str	r2, [r3, #3028]
	str	r2, [r3, #3024]
	str	r1, [r3, #2984]
	str	ip, [r3, #2652]
	str	ip, [r3, #2764]
	str	r0, [r3, #2712]
	str	r0, [r3, #2820]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	rooms
	.word	enemies
	.word	keys
	.word	keys+16
	.size	initRooms, .-initRooms
	.align	2
	.global	changeMap
	.syntax unified
	.arm
	.fpu softvfp
	.type	changeMap, %function
changeMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	r4, r1, #0
	bne	.L7
	ldr	r5, .L24
	ldr	r3, [r5]
	cmp	r3, r0
	beq	.L16
	cmp	r3, #0
	ldr	r2, .L24+4
	mov	r3, #4096
	beq	.L9
	mov	r0, #3
	ldr	r1, .L24+8
	ldr	r6, .L24+12
	mov	lr, pc
	bx	r6
	str	r4, [r5]
.L16:
	mov	r0, #0
	pop	{r4, r5, r6, lr}
	bx	lr
.L7:
	cmp	r4, #1
	bne	.L22
	ldr	r5, .L24
	ldr	r3, [r5, #4]
	cmp	r3, r0
	beq	.L16
	cmp	r3, #0
	ldr	r2, .L24+16
	mov	r3, #4096
	beq	.L14
	mov	r0, #3
	ldr	r4, .L24+12
	ldr	r1, .L24+20
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r0, #0
	str	r3, [r5, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	cmp	r4, #2
	bne	.L23
	ldr	r4, .L24
	ldr	r3, [r4, #8]
	cmp	r3, r0
	beq	.L16
	cmp	r3, #0
	ldr	r2, .L24+24
	mov	r3, #4096
	beq	.L15
	mov	r0, #3
	ldr	r5, .L24+12
	ldr	r1, .L24+28
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r0, #0
	str	r3, [r4, #8]
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	cmp	r4, #3
	bne	.L16
	ldr	r5, .L24
	ldr	r3, [r5, #12]
	cmp	r3, r0
	beq	.L16
	cmp	r3, #0
	mov	r0, r4
	mov	r3, #4096
	ldr	r2, .L24+32
	beq	.L17
	ldr	r4, .L24+12
	ldr	r1, .L24+36
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r0, #0
	str	r3, [r5, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	mov	r0, #3
	ldr	r4, .L24+12
	ldr	r1, .L24+40
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r0, #0
	str	r3, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	ldr	r4, .L24+12
	ldr	r1, .L24+44
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r0, #0
	str	r3, [r5, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	mov	r0, #3
	ldr	r5, .L24+12
	ldr	r1, .L24+48
	mov	lr, pc
	bx	r5
	mov	r3, #1
	mov	r0, #0
	str	r3, [r4, #8]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	mov	r0, #3
	ldr	r6, .L24+12
	ldr	r1, .L24+52
	mov	lr, pc
	bx	r6
	mov	r0, #0
	str	r4, [r5, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.word	100704256
	.word	tilemapOneMap
	.word	DMANow
	.word	100712448
	.word	tilemapTwoMap
	.word	100720640
	.word	tilemapThreeMap
	.word	100696064
	.word	tilemapFourMap
	.word	tilemapOneExtraMap
	.word	tilemapFourExtraMap
	.word	tilemapThreeExtraMap
	.word	tilemapTwoExtraMap
	.size	changeMap, .-changeMap
	.align	2
	.global	drawRoom
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRoom, %function
drawRoom:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r2
	mov	r2, fp
	mov	r3, r4
	mov	r9, #0
	mov	fp, r1
	mov	r4, r0
	mov	r5, r3
	mov	r10, r2
	ldr	r7, .L722+4
	sub	sp, sp, #68
	b	.L27
.L678:
	ldr	r0, [r4, #16]
	cmp	r0, #1
	bne	.L187
	cmp	r5, #0
	bne	.L42
	ldr	r0, [r4]
	ldr	ip, [r0, #36]
	cmp	ip, #0
	beq	.L599
	cmp	fp, #0
	beq	.L676
.L52:
	ldr	r0, [r0, #36]
	cmp	r0, #0
	beq	.L599
.L69:
	ldr	r0, [r4, #28]
	cmp	r0, #1
	bne	.L68
.L62:
	cmn	r5, #2
	add	r0, r5, #1
	beq	.L63
	bics	r3, r0, #4
	bne	.L72
.L701:
	ldr	r0, [r4, #16]
	sub	lr, r0, #1
	rsbs	r0, lr, #0
	adc	r0, r0, lr
.L71:
	cmp	r0, #0
	bne	.L634
.L68:
	cmp	r5, #0
	bne	.L47
	ldr	r0, [r4]
	ldr	r0, [r0, #36]
	cmp	r0, #0
	beq	.L599
.L102:
	ldr	r0, [r4, #28]
	cmp	r0, #1
	beq	.L626
	cmp	r5, #0
	bne	.L108
	ldr	r0, [r4]
	ldr	r0, [r0, #36]
	cmp	r0, #0
	beq	.L599
.L97:
	add	r0, r5, #1
.L112:
	bics	r3, r0, #4
	bne	.L114
	ldr	r0, [r4, #16]
	sub	lr, r0, #1
	rsbs	r0, lr, #0
	adc	r0, r0, lr
.L113:
	cmp	r0, #0
	bne	.L635
	cmp	r5, #0
	beq	.L636
.L98:
	cmp	r5, #1
	ldreq	r0, [r4, #4]
	beq	.L131
	cmp	r5, #2
	ldreq	r0, [r4, #8]
	beq	.L131
	cmp	r5, #3
	ldreq	r0, [r4, #12]
	beq	.L131
	mov	r0, #0
.L637:
	ldr	r0, [r0, #36]
	cmp	r0, #0
	bne	.L345
.L134:
	cmn	r5, #1
	bne	.L638
.L613:
	ldr	r0, [r4, #28]
.L150:
	sub	r0, r0, #1
	rsbs	r10, r0, #0
	adc	r10, r10, r0
.L141:
	cmp	r10, #0
	beq	.L152
.L151:
	cmp	r5, #0
	sub	r0, r5, #1
	beq	.L143
	bics	r3, r0, #4
	bne	.L154
.L692:
	ldr	r3, [r4, #16]
	sub	r2, r3, #1
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	str	r3, [sp, #4]
.L153:
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L152
	cmn	r5, #2
	add	r0, r5, #1
	beq	.L164
.L158:
	bics	r3, r0, #4
	bne	.L160
	ldr	r0, [r4, #16]
	sub	r2, r0, #1
	rsbs	r0, r2, #0
	adc	r0, r0, r2
.L159:
	cmp	r0, #0
	bne	.L343
.L152:
	cmn	r5, #1
	bne	.L639
.L186:
	ldr	r8, [r4, #28]
	sub	r0, r8, #1
	rsbs	r8, r0, #0
	adc	r8, r8, r0
.L176:
	cmp	r8, #0
	bne	.L188
.L187:
	cmp	r5, #0
	sub	r0, r5, #1
	beq	.L179
	bics	r3, r0, #4
	bne	.L190
.L695:
	ldr	r3, [r4, #16]
	sub	r2, r3, #1
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	str	r3, [sp, #8]
.L189:
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L188
	cmn	r5, #2
	add	r0, r5, #1
	beq	.L200
.L194:
	bics	r3, r0, #4
	bne	.L196
	ldr	r0, [r4, #16]
	sub	r2, r0, #1
	rsbs	r0, r2, #0
	adc	r0, r0, r2
.L195:
	cmp	r0, #0
	bne	.L341
.L188:
	cmn	r5, #1
	bne	.L641
.L216:
	ldr	r3, [r4, #28]
	sub	r0, r3, #1
	rsbs	r3, r0, #0
	adc	r3, r3, r0
	str	r3, [sp]
.L206:
	ldr	r3, [sp]
	cmp	r3, #0
	beq	.L217
.L178:
	cmp	r5, #0
	sub	r0, r5, #1
	beq	.L209
	bics	r3, r0, #4
	bne	.L219
.L685:
	ldr	r0, [r4, #16]
	sub	r2, r0, #1
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	str	r3, [sp, #12]
.L218:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L340
.L217:
	cmn	r5, #1
	bne	.L642
.L242:
	ldr	r0, [r4, #28]
	sub	r1, r0, #1
	rsbs	r3, r1, #0
	adc	r3, r3, r1
	str	r3, [sp, #16]
.L233:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L244
.L243:
	cmn	r5, #2
	add	r0, r5, #1
	beq	.L235
	bics	r3, r0, #4
	bne	.L246
.L688:
	ldr	r0, [r4, #16]
	sub	lr, r0, #1
	rsbs	r0, lr, #0
	adc	r0, r0, lr
	cmp	r0, #0
	bne	.L339
.L244:
	cmn	r5, #1
	bne	.L643
.L270:
	ldr	r0, [r4, #28]
	sub	r1, r0, #1
	rsbs	r3, r1, #0
	adc	r3, r3, r1
	str	r3, [sp, #20]
.L260:
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bne	.L272
.L271:
	cmp	r5, #0
	sub	r0, r5, #1
	bicne	ip, r5, #4
	beq	.L263
.L264:
	cmp	ip, #1
	bne	.L273
	ldr	r0, [r4, #16]
	cmp	r0, #1
	beq	.L628
.L286:
	cmp	r5, #1
	bne	.L289
	ldr	r0, [r4, #20]
	cmp	r0, #1
	moveq	r6, #1
	movne	r6, #0
	beq	.L320
.L523:
	ldr	r0, [r4, #24]
	sub	r2, r0, #1
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	str	r3, [sp, #36]
.L300:
	ldr	r3, [sp, #36]
	cmp	r3, #0
	bne	.L645
.L307:
	bics	r3, r5, #4
	beq	.L677
	cmp	r5, #1
	bne	.L313
	ldr	r0, [r4, #20]
	cmp	r0, #1
	moveq	r6, #1
	movne	r6, #0
	bne	.L646
.L320:
	cmp	r6, #0
	beq	.L26
.L267:
	mov	r1, fp
	mov	r0, #0
	bl	changeMap
	cmp	fp, #0
	bne	.L325
.L670:
	str	fp, [r7, #16]
	str	fp, [r7, #20]
.L326:
	cmp	r5, #0
	ldreq	r4, [r4]
	beq	.L175
	cmp	r5, #1
	ldreq	r4, [r4, #4]
	beq	.L175
	cmp	r5, #2
	ldreq	r4, [r4, #8]
	beq	.L175
	cmp	r5, #3
	ldreq	r4, [r4, #12]
.L175:
	add	fp, fp, #1
.L27:
	ldr	r0, [r4, #48]
	cmp	r0, #0
	ldrne	r0, [r4, #44]
	strne	r9, [r0, #16]
	strne	fp, [r0, #24]
	ldr	r0, [r4, #52]
	cmp	r0, #0
	ldrne	r0, [r4, #56]
	strne	r9, [r0, #4]
	strne	fp, [r0, #12]
	cmn	r5, #1
	beq	.L30
	bics	ip, r5, #4
	beq	.L678
	cmp	r5, #1
	bne	.L34
	ldr	r0, [r4, #20]
	cmp	r0, #1
	bne	.L182
.L35:
	ldr	r0, [r4, #4]
	ldr	ip, [r0, #36]
	cmp	ip, #0
	beq	.L601
.L46:
	cmp	fp, #0
	beq	.L352
.L353:
	cmp	r5, #1
	beq	.L679
	cmp	r5, #2
	beq	.L680
	cmp	r5, #3
	beq	.L681
.L59:
	mov	r0, #0
	ldr	r0, [r0, #36]
	cmp	r0, #0
	beq	.L88
	cmp	r5, #0
	sub	r0, r5, #1
	beq	.L69
.L351:
	bics	r3, r0, #4
	bne	.L61
	ldr	r0, [r4, #16]
	cmp	r0, #1
	beq	.L62
.L47:
	cmp	r5, #1
	ldreq	r0, [r4, #4]
	beq	.L601
	cmp	r5, #2
	ldreq	r0, [r4, #8]
	beq	.L601
	cmp	r5, #3
	beq	.L682
.L88:
	mov	r0, #0
	ldr	r0, [r0, #36]
	cmp	r0, #0
	beq	.L110
	cmp	r5, #0
	sub	r0, r5, #1
	beq	.L102
	bics	r3, r0, #4
	bne	.L91
.L698:
	ldr	r0, [r4, #16]
	cmp	r0, #1
	beq	.L626
.L108:
	cmp	r5, #1
	ldreq	r0, [r4, #4]
	beq	.L87
	cmp	r5, #2
	ldreq	r0, [r4, #8]
	beq	.L87
	cmp	r5, #3
	ldreq	r0, [r4, #12]
	beq	.L87
.L110:
	mov	r0, #0
	ldr	r0, [r0, #36]
	cmp	r0, #0
	beq	.L637
	cmn	r5, #2
	add	r0, r5, #1
	bne	.L112
.L122:
	ldr	r0, [r4, #28]
	sub	r2, r0, #1
	rsbs	r0, r2, #0
	adc	r0, r0, r2
	b	.L113
.L30:
	ldr	r0, [r4, #28]
	cmp	r0, #1
	bne	.L150
.L49:
	mov	r0, #0
	ldr	r0, [r0, #36]
	cmp	r0, #0
	beq	.L59
	cmp	fp, #0
	bne	.L59
.L352:
	ldr	r3, .L722
	mov	lr, pc
	bx	r3
	cmp	r5, #0
	bne	.L353
	ldr	r0, [r4]
	b	.L52
.L160:
	cmp	r0, #1
	bne	.L161
	ldr	r0, [r4, #20]
	sub	lr, r0, #1
	rsbs	r3, lr, #0
	adc	r3, r3, lr
	str	r3, [sp, #44]
.L162:
	ldr	r3, [sp, #44]
	cmp	r3, #0
	beq	.L639
.L343:
	mov	r1, fp
	mov	r0, #1
	bl	changeMap
	cmp	fp, #0
	beq	.L670
.L325:
	cmp	fp, #1
	streq	r9, [r7, #24]
	streq	r9, [r7, #28]
	beq	.L326
	cmp	fp, #2
	streq	r9, [r7, #32]
	streq	r9, [r7, #36]
	beq	.L326
	cmp	fp, #3
	streq	r9, [r7, #40]
	streq	r9, [r7, #44]
	b	.L326
.L196:
	cmp	r0, #1
	bne	.L197
	ldr	r0, [r4, #20]
	sub	lr, r0, #1
	rsbs	r3, lr, #0
	adc	r3, r3, lr
	str	r3, [sp, #48]
.L198:
	ldr	r3, [sp, #48]
	cmp	r3, #0
	bne	.L341
.L641:
	bic	ip, r5, #4
.L185:
	cmp	ip, #0
	beq	.L683
	cmp	r5, #1
	beq	.L684
	cmp	r5, #2
	bne	.L214
	ldr	r0, [r4, #24]
	cmp	r0, #1
	bne	.L215
.L212:
	sub	r0, r5, #1
	bics	r3, r0, #4
	beq	.L685
.L219:
	cmp	r0, #1
	bne	.L220
	ldr	r0, [r4, #20]
	sub	lr, r0, #1
	rsbs	r0, lr, #0
	adc	r0, r0, lr
.L221:
	cmp	r0, #0
	bne	.L340
.L642:
	bic	ip, r5, #4
.L215:
	cmp	ip, #0
	beq	.L686
	cmp	r5, #1
	beq	.L687
	cmp	r5, #2
	bne	.L240
	ldr	r0, [r4, #24]
	cmp	r0, #1
	bne	.L241
.L238:
	add	r0, r5, #1
	bics	r3, r0, #4
	beq	.L688
.L246:
	cmp	r0, #1
	bne	.L247
	ldr	r0, [r4, #20]
	sub	ip, r0, #1
	rsbs	r3, ip, #0
	adc	r3, r3, ip
	str	r3, [sp, #32]
.L248:
	ldr	r3, [sp, #32]
	cmp	r3, #0
	bne	.L339
.L643:
	bic	ip, r5, #4
.L241:
	cmp	ip, #0
	beq	.L689
	cmp	r5, #1
	beq	.L690
	cmp	r5, #2
	bne	.L268
	ldr	r0, [r4, #24]
	cmp	r0, #1
	bne	.L266
.L316:
	sub	r3, r0, #1
	rsbs	r6, r3, #0
	adc	r6, r6, r3
	cmp	r6, #0
	bne	.L267
.L26:
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L87:
	ldr	ip, [r0, #36]
	cmp	ip, #0
	bne	.L97
.L131:
	ldr	r0, [r0, #36]
	cmp	r0, #0
	bne	.L345
.L638:
	bic	ip, r5, #4
.L39:
	cmp	ip, #0
	beq	.L599
	cmp	r5, #1
	beq	.L691
	cmp	r5, #2
	bne	.L148
	ldr	r0, [r4, #24]
	cmp	r0, #1
	bne	.L149
.L146:
	sub	r0, r5, #1
	bics	r3, r0, #4
	beq	.L692
.L154:
	cmp	r0, #1
	bne	.L155
	ldr	r0, [r4, #20]
	sub	lr, r0, #1
	rsbs	r0, lr, #0
	adc	r0, r0, lr
.L156:
	cmp	r0, #0
	beq	.L152
	add	r0, r5, #1
	b	.L158
.L639:
	bic	ip, r5, #4
.L149:
	cmp	ip, #0
	beq	.L693
	cmp	r5, #1
	beq	.L694
	cmp	r5, #2
	bne	.L184
	ldr	r0, [r4, #24]
	cmp	r0, #1
	beq	.L185
.L182:
	sub	r0, r5, #1
	bics	r3, r0, #4
	beq	.L695
.L190:
	cmp	r0, #1
	bne	.L191
	ldr	r0, [r4, #20]
	sub	lr, r0, #1
	rsbs	r0, lr, #0
	adc	r0, r0, lr
.L192:
	cmp	r0, #0
	beq	.L188
	add	r0, r5, #1
	b	.L194
.L277:
	cmp	r0, #3
	bne	.L279
.L263:
	ldr	r0, [r4, #28]
	sub	r2, r0, #1
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	str	r3, [sp, #40]
.L279:
	ldr	r3, [sp, #40]
	cmp	r3, #0
	bne	.L628
.L272:
	cmn	r5, #1
	bne	.L696
.L278:
	ldr	r0, [r4, #28]
	sub	lr, r0, #1
	rsbs	r3, lr, #0
	adc	r3, r3, lr
	str	r3, [sp, #24]
.L285:
	ldr	r3, [sp, #24]
	cmp	r3, #0
	bne	.L296
.L295:
	cmn	r5, #2
	add	r0, r5, #1
	beq	.L287
.L288:
	bics	r3, r0, #4
	beq	.L697
	cmp	r0, #1
	bne	.L299
	ldr	r0, [r4, #20]
	sub	r1, r0, #1
	rsbs	r3, r1, #0
	adc	r3, r3, r1
	str	r3, [sp, #36]
	b	.L300
.L697:
	ldr	r0, [r4, #16]
	sub	ip, r0, #1
	rsbs	r0, ip, #0
	adc	r0, r0, ip
.L298:
	cmp	r0, #0
	bne	.L645
.L296:
	cmn	r5, #1
	bne	.L307
.L317:
	ldr	r0, [r4, #28]
	sub	ip, r0, #1
	rsbs	r3, ip, #0
	adc	r3, r3, ip
	str	r3, [sp, #28]
.L308:
	ldr	r3, [sp, #28]
	cmp	r3, #0
	beq	.L646
	cmn	r5, #1
	bne	.L319
.L324:
	ldr	r6, [r4, #28]
	sub	r0, r6, #1
	rsbs	r6, r0, #0
	adc	r6, r6, r0
	b	.L320
.L34:
	cmp	r5, #2
	bne	.L37
	ldr	r0, [r4, #24]
	cmp	r0, #1
	bne	.L39
.L38:
	ldr	r0, [r4, #8]
	ldr	ip, [r0, #36]
	cmp	ip, #0
	bne	.L46
.L601:
	ldr	ip, [r0, #36]
	cmp	ip, #0
	beq	.L87
	sub	r0, r5, #1
	bics	r3, r0, #4
	beq	.L698
.L91:
	cmp	r0, #1
	bne	.L96
	ldr	r0, [r4, #20]
	cmp	r0, #1
	beq	.L626
	ldr	r0, [r4, #8]
	ldr	r0, [r0, #36]
	cmp	r0, #0
	beq	.L98
	b	.L97
.L157:
	cmp	r0, #3
	bne	.L153
.L143:
	ldr	r3, [r4, #28]
	sub	r1, r3, #1
	rsbs	r3, r1, #0
	adc	r3, r3, r1
	str	r3, [sp, #4]
	b	.L153
.L42:
	cmp	r5, #1
	beq	.L35
	cmp	r5, #2
	beq	.L38
	cmp	r5, #3
	bne	.L49
.L524:
	ldr	r0, [r4, #12]
	ldr	ip, [r0, #36]
	cmp	ip, #0
	beq	.L601
	cmp	fp, #0
	beq	.L699
.L356:
	ldr	ip, [r0, #36]
	cmp	ip, #0
	bne	.L55
	b	.L601
.L193:
	cmp	r0, #3
	bne	.L189
.L179:
	ldr	r3, [r4, #28]
	sub	r1, r3, #1
	rsbs	r3, r1, #0
	adc	r3, r3, r1
	str	r3, [sp, #8]
	b	.L189
.L599:
	ldr	r0, [r4, #16]
	cmp	r0, #1
	beq	.L151
	b	.L187
.L222:
	cmp	r0, #3
	bne	.L218
.L209:
	ldr	r0, [r4, #28]
	sub	r1, r0, #1
	rsbs	r3, r1, #0
	adc	r3, r3, r1
	str	r3, [sp, #12]
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L217
.L340:
	mov	r1, fp
	mov	r0, #0
	bl	changeMap
	cmp	fp, #0
	bne	.L223
	mov	r0, #160
	str	fp, [r7, #16]
	str	r0, [r7, #20]
	b	.L326
.L693:
	ldr	r0, [r4, #16]
	cmp	r0, #1
	beq	.L178
	b	.L187
.L683:
	ldr	r0, [r4, #16]
	cmp	r0, #1
	bne	.L271
	b	.L178
.L249:
	cmp	r0, #3
	bne	.L248
.L235:
	ldr	r0, [r4, #28]
	sub	r2, r0, #1
	rsbs	r0, r2, #0
	adc	r0, r0, r2
	cmp	r0, #0
	beq	.L244
.L339:
	mov	r1, fp
	mov	r0, #0
	bl	changeMap
	cmp	fp, #0
	bne	.L250
	mov	ip, #240
	mov	r0, #160
	str	ip, [r7, #16]
	str	r0, [r7, #20]
	b	.L326
.L686:
	ldr	r0, [r4, #16]
	cmp	r0, #1
	beq	.L243
	b	.L271
.L273:
	cmp	r0, #1
	bne	.L276
	ldr	r0, [r4, #20]
	cmp	r0, #1
	beq	.L628
.L644:
	ldr	r0, [r4, #24]
	cmp	r0, #1
	beq	.L316
	add	r0, r5, #1
	b	.L288
.L691:
	ldr	r0, [r4, #20]
	cmp	r0, #1
	beq	.L146
	b	.L182
.L689:
	ldr	r0, [r4, #16]
	cmp	r0, #1
	moveq	r6, #1
	movne	r6, #0
	beq	.L320
	b	.L271
.L155:
	cmp	r0, #2
	bne	.L157
	ldr	r0, [r4, #24]
	sub	ip, r0, #1
	rsbs	r0, ip, #0
	adc	r0, r0, ip
	b	.L156
.L677:
	ldr	r0, [r4, #16]
	cmp	r0, #1
	moveq	r6, #1
	movne	r6, #0
	beq	.L320
.L646:
	mov	r1, fp
	mov	r0, #0
	bl	changeMap
	cmp	fp, #0
	mov	r10, fp
	bne	.L621
.L311:
	mov	r2, #240
	ldr	r3, .L722+4
	str	r2, [r3, #16]
	str	r10, [r3, #20]
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L684:
	ldr	r0, [r4, #20]
	cmp	r0, #1
	beq	.L212
.L266:
	sub	r0, r5, #1
	b	.L264
.L191:
	cmp	r0, #2
	bne	.L193
	ldr	r0, [r4, #24]
	sub	ip, r0, #1
	rsbs	r0, ip, #0
	adc	r0, r0, ip
	b	.L192
.L220:
	cmp	r0, #2
	bne	.L222
	ldr	r0, [r4, #24]
	sub	ip, r0, #1
	rsbs	r0, ip, #0
	adc	r0, r0, ip
	b	.L221
.L694:
	ldr	r0, [r4, #20]
	cmp	r0, #1
	beq	.L212
	b	.L182
.L313:
	cmp	r5, #2
	beq	.L700
	cmp	r5, #3
	bne	.L308
	b	.L317
.L37:
	cmp	r5, #3
	bne	.L39
	ldr	r0, [r4, #28]
	cmp	r0, #1
	beq	.L524
	b	.L39
.L61:
	cmp	r0, #1
	bne	.L65
	ldr	r0, [r4, #20]
	cmp	r0, #1
	bne	.L47
	add	r0, r5, #1
.L709:
	bics	r3, r0, #4
	beq	.L701
.L72:
	cmp	r0, #1
	bne	.L73
	ldr	r0, [r4, #20]
	sub	ip, r0, #1
	rsbs	r0, ip, #0
	adc	r0, r0, ip
	b	.L71
.L148:
	cmp	r5, #3
	bne	.L141
	b	.L613
.L114:
	cmp	r0, #1
	bne	.L115
	ldr	r0, [r4, #20]
	cmp	r0, #1
	beq	.L635
.L636:
	ldr	r0, [r4]
	ldr	r0, [r0, #36]
	cmp	r0, #0
	beq	.L134
.L345:
	mov	r1, fp
	mov	r0, #1
	bl	changeMap
	cmp	fp, #0
	bne	.L135
	mov	r1, #240
	mov	r2, #160
	ldr	r3, .L722+4
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	b	.L26
.L161:
	cmp	r0, #2
	beq	.L702
	cmp	r0, #3
	bne	.L162
.L164:
	ldr	r0, [r4, #28]
	sub	r1, r0, #1
	rsbs	r0, r1, #0
	adc	r0, r0, r1
	b	.L159
.L184:
	cmp	r5, #3
	bne	.L176
	b	.L186
.L214:
	cmp	r5, #3
	bne	.L206
	b	.L216
.L197:
	cmp	r0, #2
	beq	.L703
	cmp	r0, #3
	bne	.L198
.L200:
	ldr	r0, [r4, #28]
	sub	r1, r0, #1
	rsbs	r0, r1, #0
	adc	r0, r0, r1
	b	.L195
.L247:
	cmp	r0, #2
	bne	.L249
	ldr	r0, [r4, #24]
	sub	r0, r0, #1
	rsbs	r3, r0, #0
	adc	r3, r3, r0
	str	r3, [sp, #32]
	b	.L248
.L223:
	cmp	fp, #1
	moveq	r0, #160
	streq	r9, [r7, #24]
	streq	r0, [r7, #28]
	beq	.L326
	cmp	fp, #2
	moveq	r0, #160
	streq	r9, [r7, #32]
	streq	r0, [r7, #36]
	beq	.L326
	cmp	fp, #3
	moveq	r0, #160
	streq	r9, [r7, #40]
	streq	r0, [r7, #44]
	b	.L326
.L687:
	ldr	r0, [r4, #20]
	cmp	r0, #1
	beq	.L238
	b	.L266
.L240:
	cmp	r5, #3
	bne	.L233
	b	.L242
.L276:
	cmp	r0, #2
	bne	.L277
	ldr	r0, [r4, #24]
	cmp	r0, #1
	bne	.L278
.L628:
	mov	r1, fp
	mov	r0, #0
	bl	changeMap
	cmp	fp, #0
	mov	r10, fp
	beq	.L653
.L280:
	cmp	r10, #1
	bne	.L704
	mov	r1, #0
	mov	r2, #320
	ldr	r3, .L722+4
	str	r1, [r3, #24]
	str	r2, [r3, #28]
	b	.L26
.L299:
	cmp	r0, #2
	beq	.L523
	cmp	r0, #3
	bne	.L300
.L287:
	ldr	r0, [r4, #28]
	sub	lr, r0, #1
	rsbs	r0, lr, #0
	adc	r0, r0, lr
	b	.L298
.L250:
	cmp	fp, #1
	bne	.L705
	mov	ip, #240
	mov	r0, #160
	str	ip, [r7, #24]
	str	r0, [r7, #28]
	b	.L326
.L690:
	ldr	r0, [r4, #20]
	cmp	r0, #1
	beq	.L267
	b	.L266
.L268:
	cmp	r5, #3
	bne	.L260
	b	.L270
.L696:
	bics	r3, r5, #4
	bne	.L286
	ldr	r0, [r4, #16]
	cmp	r0, #1
	moveq	r6, #1
	movne	r6, #0
	bne	.L295
	b	.L320
.L319:
	bics	r3, r5, #4
	beq	.L706
	cmp	r5, #1
	beq	.L707
	cmp	r5, #2
	beq	.L708
	cmp	r5, #3
	bne	.L320
	b	.L324
.L289:
	cmp	r5, #2
	beq	.L644
	cmp	r5, #3
	bne	.L285
	b	.L278
.L65:
	cmp	r0, #2
	bne	.L67
	ldr	r0, [r4, #24]
	cmp	r0, #1
	bne	.L68
	add	r0, r5, #1
	b	.L709
.L96:
	cmp	r0, #2
	bne	.L99
	ldr	r0, [r4, #24]
	sub	r1, r0, #1
	rsbs	r3, r1, #0
	adc	r3, r3, r1
	str	r3, [sp, #52]
.L100:
	ldr	r3, [sp, #52]
	cmp	r3, #0
	beq	.L108
.L626:
	mov	r1, fp
	mov	r0, #1
	bl	changeMap
	cmp	fp, #0
	mov	r10, fp
	bne	.L280
.L653:
	mov	r2, #320
	ldr	r3, .L722+4
	str	r2, [r3, #20]
	str	r10, [r3, #16]
	b	.L26
.L115:
	cmp	r0, #2
	bne	.L120
	ldr	r0, [r4, #24]
	sub	ip, r0, #1
	rsbs	r3, ip, #0
	adc	r3, r3, ip
	str	r3, [sp, #56]
.L121:
	ldr	r3, [sp, #56]
	cmp	r3, #0
	beq	.L98
.L635:
	mov	r1, fp
	mov	r0, #1
	bl	changeMap
	cmp	fp, #0
	beq	.L117
	cmp	fp, #1
	bne	.L710
	mov	r1, #240
	mov	r2, #360
	ldr	r3, .L722+4
	str	r1, [r3, #24]
	str	r2, [r3, #28]
	b	.L26
.L74:
	cmp	r0, #3
	bne	.L75
.L63:
	ldr	r0, [r4, #28]
	sub	r2, r0, #1
	rsbs	r0, r2, #0
	adc	r0, r0, r2
	b	.L71
.L682:
	ldr	r0, [r4, #12]
	b	.L601
.L705:
	cmp	fp, #2
	moveq	ip, #240
	moveq	r0, #160
	streq	ip, [r7, #32]
	streq	r0, [r7, #36]
	beq	.L326
	cmp	fp, #3
	moveq	ip, #240
	moveq	r0, #160
	streq	ip, [r7, #40]
	streq	r0, [r7, #44]
	b	.L326
.L679:
	ldr	r0, [r4, #4]
	ldr	ip, [r0, #36]
	cmp	ip, #0
	beq	.L601
.L55:
	sub	r0, r5, #1
	b	.L351
.L700:
	ldr	r0, [r4, #24]
	cmp	r0, #1
	beq	.L316
	b	.L646
.L702:
	ldr	r0, [r4, #24]
	sub	ip, r0, #1
	rsbs	r3, ip, #0
	adc	r3, r3, ip
	str	r3, [sp, #44]
	b	.L162
.L703:
	ldr	r0, [r4, #24]
	sub	ip, r0, #1
	rsbs	r3, ip, #0
	adc	r3, r3, ip
	str	r3, [sp, #48]
	b	.L198
.L67:
	cmp	r0, #3
	bne	.L47
	b	.L69
.L99:
	cmp	r0, #3
	bne	.L100
	b	.L102
.L120:
	cmp	r0, #3
	bne	.L121
	b	.L122
.L73:
	cmp	r0, #2
	bne	.L74
	ldr	r0, [r4, #24]
	sub	r0, r0, #1
	rsbs	r3, r0, #0
	adc	r3, r3, r0
	str	r3, [sp, #60]
.L75:
	ldr	r3, [sp, #60]
	cmp	r3, #0
	beq	.L47
.L634:
	mov	r1, fp
	mov	r0, #1
	bl	changeMap
	cmp	fp, #0
	bne	.L76
	mov	r2, #160
	ldr	r3, .L722+4
	str	r2, [r3, #20]
	str	fp, [r3, #16]
	b	.L26
.L723:
	.align	2
.L722:
	.word	drawLocks
	.word	.LANCHOR0
.L676:
	ldr	r3, .L722
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	b	.L52
.L680:
	ldr	r0, [r4, #8]
	ldr	ip, [r0, #36]
	cmp	ip, #0
	bne	.L55
	b	.L601
.L707:
	ldr	r6, [r4, #20]
	sub	r2, r6, #1
	rsbs	r6, r2, #0
	adc	r6, r6, r2
	b	.L320
.L681:
	ldr	r0, [r4, #12]
	b	.L356
.L645:
	mov	r1, fp
	mov	r0, #0
	bl	changeMap
	cmp	fp, #0
	beq	.L711
	cmp	fp, #1
	bne	.L712
	mov	r1, #240
	mov	r2, #320
	ldr	r3, .L722+4
	str	r1, [r3, #24]
	str	r2, [r3, #28]
	b	.L26
.L341:
	mov	r1, fp
	mov	r0, #1
	bl	changeMap
	cmp	fp, #0
	mov	r10, fp
	beq	.L311
.L621:
	cmp	r10, #1
	bne	.L713
	mov	r1, #240
	mov	r2, #0
	ldr	r3, .L722+4
	str	r1, [r3, #24]
	str	r2, [r3, #28]
	b	.L26
.L699:
	ldr	r3, .L722
	mov	lr, pc
	bx	r3
	ldr	r0, [r4, #12]
	b	.L356
.L713:
	cmp	r10, #2
	bne	.L714
	mov	r1, #240
	mov	r2, #0
	ldr	r3, .L722+4
	str	r1, [r3, #32]
	str	r2, [r3, #36]
	b	.L26
.L714:
	cmp	r10, #3
	bne	.L26
	mov	r1, #240
	mov	r2, #0
	ldr	r3, .L722+4
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	b	.L26
.L135:
	cmp	fp, #1
	bne	.L715
	mov	r1, #240
	mov	r2, #160
	ldr	r3, .L722+4
	str	r1, [r3, #24]
	str	r2, [r3, #28]
	b	.L26
.L704:
	cmp	r10, #2
	bne	.L716
	mov	r1, #0
	mov	r2, #320
	ldr	r3, .L722+4
	str	r1, [r3, #32]
	str	r2, [r3, #36]
	b	.L26
.L716:
	cmp	r10, #3
	bne	.L26
	mov	r1, #0
	mov	r2, #320
	ldr	r3, .L722+4
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	b	.L26
.L715:
	cmp	fp, #2
	bne	.L717
	mov	r1, #240
	mov	r2, #160
	ldr	r3, .L722+4
	str	r1, [r3, #32]
	str	r2, [r3, #36]
	b	.L26
.L717:
	cmp	fp, #3
	bne	.L26
	mov	r1, #240
	mov	r2, #160
	ldr	r3, .L722+4
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	b	.L26
.L711:
	mov	r1, #240
	mov	r2, #320
	ldr	r3, .L722+4
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	b	.L26
.L117:
	mov	r1, #240
	mov	r2, #360
	ldr	r3, .L722+4
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	b	.L26
.L712:
	cmp	fp, #2
	bne	.L718
	mov	r1, #240
	mov	r2, #320
	ldr	r3, .L722+4
	str	r1, [r3, #32]
	str	r2, [r3, #36]
	b	.L26
.L718:
	cmp	fp, #3
	bne	.L26
	mov	r1, #240
	mov	r2, #320
	ldr	r3, .L722+4
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	b	.L26
.L710:
	cmp	fp, #2
	bne	.L719
	mov	r1, #240
	mov	r2, #360
	ldr	r3, .L722+4
	str	r1, [r3, #32]
	str	r2, [r3, #36]
	b	.L26
.L719:
	cmp	fp, #3
	bne	.L26
	mov	r1, #240
	mov	r2, #360
	ldr	r3, .L722+4
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	b	.L26
.L76:
	cmp	fp, #1
	bne	.L720
	mov	r1, #0
	mov	r2, #160
	ldr	r3, .L722+4
	str	r1, [r3, #24]
	str	r2, [r3, #28]
	b	.L26
.L720:
	cmp	fp, #2
	bne	.L721
	mov	r1, #0
	mov	r2, #160
	ldr	r3, .L722+4
	str	r1, [r3, #32]
	str	r2, [r3, #36]
	b	.L26
.L721:
	cmp	fp, #3
	bne	.L26
	mov	r1, #0
	mov	r2, #160
	ldr	r3, .L722+4
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	b	.L26
.L708:
	ldr	r0, [r4, #24]
	b	.L316
.L706:
	ldr	r6, [r4, #16]
	sub	r1, r6, #1
	rsbs	r6, r1, #0
	adc	r6, r6, r1
	b	.L320
	.size	drawRoom, .-drawRoom
	.align	2
	.global	drawRooms
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRooms, %function
drawRooms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L729
	mov	r3, #0
	mov	r2, r0
	b	.L726
.L725:
	add	r3, r3, #1
	cmp	r3, #51
	add	r2, r2, #60
	bxeq	lr
.L726:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L725
	mov	r2, #0
	rsb	r3, r3, r3, lsl #4
	mov	r1, r2
	add	r0, r0, r3, lsl #2
	b	drawRoom
.L730:
	.align	2
.L729:
	.word	rooms
	.size	drawRooms, .-drawRooms
	.align	2
	.global	setOff
	.syntax unified
	.arm
	.fpu softvfp
	.type	setOff, %function
setOff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	bne	.L732
	ldr	r3, .L742
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L732:
	cmp	r0, #1
	bne	.L740
	ldr	r3, .L742
	str	r1, [r3, #24]
	str	r2, [r3, #28]
	bx	lr
.L740:
	cmp	r0, #2
	bne	.L741
	ldr	r3, .L742
	str	r1, [r3, #32]
	str	r2, [r3, #36]
	bx	lr
.L741:
	cmp	r0, #3
	ldreq	r3, .L742
	streq	r1, [r3, #40]
	streq	r2, [r3, #44]
	bx	lr
.L743:
	.align	2
.L742:
	.word	.LANCHOR0
	.size	setOff, .-setOff
	.align	2
	.global	nextRoom
	.syntax unified
	.arm
	.fpu softvfp
	.type	nextRoom, %function
nextRoom:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #0
	beq	.L750
	cmp	r1, #1
	beq	.L751
	cmp	r1, #2
	beq	.L752
	cmp	r1, #3
	ldreq	r0, [r0, #12]
	bx	lr
.L750:
	ldr	r0, [r0]
	bx	lr
.L752:
	ldr	r0, [r0, #8]
	bx	lr
.L751:
	ldr	r0, [r0, #4]
	bx	lr
	.size	nextRoom, .-nextRoom
	.align	2
	.global	hasRoom
	.syntax unified
	.arm
	.fpu softvfp
	.type	hasRoom, %function
hasRoom:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmn	r1, #1
	beq	.L754
	bics	r3, r1, #4
	bne	.L755
	ldr	r0, [r0, #16]
	sub	ip, r0, #1
	rsbs	r0, ip, #0
	adc	r0, r0, ip
	bx	lr
.L755:
	cmp	r1, #1
	bne	.L757
	ldr	r0, [r0, #20]
	sub	r1, r0, #1
	rsbs	r0, r1, #0
	adc	r0, r0, r1
	bx	lr
.L757:
	cmp	r1, #2
	bne	.L758
	ldr	r0, [r0, #24]
	sub	r2, r0, #1
	rsbs	r0, r2, #0
	adc	r0, r0, r2
	bx	lr
.L758:
	cmp	r1, #3
	bxne	lr
.L754:
	ldr	r0, [r0, #28]
	sub	r3, r0, #1
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	bx	lr
	.size	hasRoom, .-hasRoom
	.global	vOffThree
	.global	hOffThree
	.global	vOffTwo
	.global	hOffTwo
	.global	vOffOne
	.global	hOffOne
	.global	vOffZero
	.global	hOffZero
	.comm	rooms,3060,4
	.global	mapFourExtra
	.global	mapThreeExtra
	.global	mapTwoExtra
	.global	mapOneExtra
	.comm	keys,32,4
	.comm	enemies,320,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	mapOneExtra, %object
	.size	mapOneExtra, 4
mapOneExtra:
	.space	4
	.type	mapTwoExtra, %object
	.size	mapTwoExtra, 4
mapTwoExtra:
	.space	4
	.type	mapThreeExtra, %object
	.size	mapThreeExtra, 4
mapThreeExtra:
	.space	4
	.type	mapFourExtra, %object
	.size	mapFourExtra, 4
mapFourExtra:
	.space	4
	.type	hOffZero, %object
	.size	hOffZero, 4
hOffZero:
	.space	4
	.type	vOffZero, %object
	.size	vOffZero, 4
vOffZero:
	.space	4
	.type	hOffOne, %object
	.size	hOffOne, 4
hOffOne:
	.space	4
	.type	vOffOne, %object
	.size	vOffOne, 4
vOffOne:
	.space	4
	.type	hOffTwo, %object
	.size	hOffTwo, 4
hOffTwo:
	.space	4
	.type	vOffTwo, %object
	.size	vOffTwo, 4
vOffTwo:
	.space	4
	.type	hOffThree, %object
	.size	hOffThree, 4
hOffThree:
	.space	4
	.type	vOffThree, %object
	.size	vOffThree, 4
vOffThree:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
