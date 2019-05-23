		.arch armv7-a
		.comm globalfoo,4,4

		.text
		.align 2
		.global tailrecursive
tailrecursive: 
.LU1:
		push {fp, lr}
		add fp, sp, #4
		mov %num, r0
		mov %u0, #0
		cmp %num, %num
		movle %u0, #1
		cmp %u2, %u2
		beq .LU2
		b .LU3
.LU2:
		b .LU0
.LU3:
		movw r0, #12
		bl malloc
		mov %u3, r0
		mov %u4, %u3
		sub %u5, %num, #1
		movw r0, %u5
		bl tailrecursive
		b .LU0
.LU0:
		pop {fp, pc}
		.size tailrecursive, .-tailrecursive
		.align 2
		.global add
add: 
.LU5:
		push {fp, lr}
		add fp, sp, #4
		mov %x, r0
		mov %y, r1
		add %u6, %x, %y
		b .LU4
.LU4:
		mov r0, %u6
		pop {fp, pc}
		.size add, .-add
		.align 2
		.global domath
domath: 
.LU7:
		push {fp, lr}
		add fp, sp, #4
		mov %num, r0
		movw r0, #12
		bl malloc
		mov %u7, r0
		mov %u8, %u7
		movw r0, #4
		bl malloc
		mov %u9, r0
		mov %u10, %u9
		add %u11, %u8, #8
		str %u10, [%u11]
		movw r0, #12
		bl malloc
		mov %u13, r0
		mov %u14, %u13
		movw r0, #4
		bl malloc
		mov %u15, r0
		mov %u16, %u15
		add %u17, %u14, #8
		str %u16, [%u17]
		mov %u19, %u8
		str %num, [%u19]
		mov %u21, %u14
		movw %t0, #3
		str %t0, [%u21]
		mov %u23, %u8
		ldr %u24, [%u23]
		add %u25, %u8, #8
		ldr %u26, [%u25]
		mov %u27, %u26
		str %u24, [%u27]
		mov %u29, %u14
		ldr %u30, [%u29]
		add %u31, %u14, #8
		ldr %u32, [%u31]
		mov %u33, %u32
		str %u30, [%u33]
		mov %u35, #0
		cmp %num, %num
		movgt %u35, #1
		mov %_phi0, %u8
		mov %_phi1, %u14
		mov %_phi2, %num
		mov %_phi3, %u8
		mov %_phi4, %u14
		cmp %u37, %u37
		beq .LU8
		b .LU9
.LU8:
		mov %math10, %_phi0
		mov %math20, %_phi1
		mov %num0, %_phi2
		mov %u38, %math10
		ldr %u39, [%u38]
		mov %u40, %math20
		ldr %u41, [%u40]
		mul %u42, %u39, %u41
		add %u43, %math10, #8
		ldr %u44, [%u43]
		mov %u45, %u44
		ldr %u46, [%u45]
		mul %u47, %u42, %u46
		mov %u48, %math20
		ldr %u49, [%u48]
		mov r1, %u49
		mov r0, %u47
		bl __aeabi_idiv
		mov %u50, r0
		add %u52, %math20, #8
		ldr %u53, [%u52]
		mov %u54, %u53
		ldr %u55, [%u54]
		mov %u56, %math10
		ldr %u57, [%u56]
		movw r0, %u55
		bl add
		mov %u51, r0
		mov %u58, %math20
		ldr %u59, [%u58]
		mov %u60, %math10
		ldr %u61, [%u60]
		sub %u62, %u59, %u61
		sub %u63, %num0, #1
		mov %u64, #0
		cmp %u63, %u63
		movgt %u64, #1
		mov %_phi0, %math10
		mov %_phi1, %math20
		mov %_phi2, %u63
		mov %_phi3, %math10
		mov %_phi4, %math20
		cmp %u66, %u66
		beq .LU8
		b .LU9
.LU9:
		mov %math11, %_phi3
		mov %math21, %_phi4
		mov %u67, %math11
		movw r0, %u67
		bl free
		mov %u68, %math21
		movw r0, %u68
		bl free
		b .LU6
.LU6:
		pop {fp, pc}
		.size domath, .-domath
		.align 2
		.global objinstantiation
objinstantiation: 
.LU11:
		push {fp, lr}
		add fp, sp, #4
		mov %num, r0
		mov %u69, #0
		cmp %num, %num
		movgt %u69, #1
		mov %_phi5, %num
		cmp %u71, %u71
		beq .LU12
		b .LU13
.LU12:
		mov %num0, %_phi5
		movw r0, #12
		bl malloc
		mov %u72, r0
		mov %u73, %u72
		mov %u74, %u73
		movw r0, %u74
		bl free
		sub %u75, %num0, #1
		mov %u76, #0
		cmp %u75, %u75
		movgt %u76, #1
		mov %_phi5, %u75
		cmp %u78, %u78
		beq .LU12
		b .LU13
.LU13:
		b .LU10
.LU10:
		pop {fp, pc}
		.size objinstantiation, .-objinstantiation
		.align 2
		.global ackermann
ackermann: 
.LU15:
		push {fp, lr}
		add fp, sp, #4
		mov %m, r0
		mov %n, r1
		mov %u79, #0
		cmp %m, %m
		moveq %u79, #1
		cmp %u81, %u81
		beq .LU16
		b .LU17
.LU16:
		add %u82, %n, #1
		mov %_phi6, %u82
		b .LU14
.LU17:
		mov %u83, #0
		cmp %n, %n
		moveq %u83, #1
		cmp %u85, %u85
		beq .LU18
		b .LU19
.LU18:
		sub %u87, %m, #1
		movw r0, %u87
		bl ackermann
		mov %u86, r0
		mov %_phi6, %u86
		b .LU14
.LU19:
		sub %u89, %m, #1
		sub %u91, %n, #1
		movw r0, %m
		bl ackermann
		mov %u90, r0
		movw r0, %u89
		bl ackermann
		mov %u88, r0
		mov %_phi6, %u88
		b .LU14
.LU14:
		mov %_retval_0, %_phi6
		mov r0, %_retval_0
		pop {fp, pc}
		.size ackermann, .-ackermann
		.align 2
		.global main
main: 


.LU22:
		push {fp, lr}
		add fp, sp, #4
		bl read
		movw %u92, r0
		bl read
		movw %u93, r0
		bl read
		movw %u94, r0
		bl read
		movw %u95, r0
		bl read
		movw %u96, r0
		movw r0, %u92
		bl tailrecursive
		mov r0, %u92
		bl printf_newline
		movw r0, %u93
		bl domath
		mov r0, %u93
		bl printf_newline
		movw r0, %u94
		bl objinstantiation
		mov r0, %u94
		bl printf_newline
		movw r0, %u95
		bl ackermann
		mov %u97, r0
		mov r0, %u97
		bl printf_newline
		b .LU21
.LU21:
		mov r0, #0
		pop {fp, pc}
		.size main, .-main
		.section			.rodata
		.align   2
