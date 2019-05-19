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
		cmp %num, #0
		movle %u0, #1
		cmp %u2, #1
		beq .LU2
		b .LU3
.LU2:
		b .LU0
.LU3:
		movw r0, #12
		bl malloc
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
		mov %r0, %_retval_0
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
		movw r0, #4
		bl malloc
		add %u11, %u8, 8
		movw r0, #12
		bl malloc
		movw r0, #4
		bl malloc
		add %u17, %u14, 8
		add %u19, %u8, 0
		add %u21, %u14, 0
		add %u23, %u8, 0
		add %u25, %u8, 8
		add %u27, %u26, 0
		add %u29, %u14, 0
		add %u31, %u14, 8
		add %u33, %u32, 0
		mov %u35, #0
		cmp %num, #0
		movgt %u35, #1
		cmp %u37, #1
		beq .LU8
		b .LU9
.LU8:
		add %u38, %math10, 0
		add %u40, %math20, 0
		mul %u42, %u39, %u41
		add %u43, %math10, 8
		add %u45, %u44, 0
		mul %u47, %u42, %u46
		add %u48, %math20, 0
		sdiv %u50, %u47, %u49
		add %u52, %math20, 8
		add %u54, %u53, 0
		add %u56, %math10, 0
		movw r0, %u55
		bl add
		add %u58, %math20, 0
		add %u60, %math10, 0
		sub %u62, %u59, %u61
		sub %u63, %num0, #1
		mov %u64, #0
		cmp %u63, #0
		movgt %u64, #1
		cmp %u66, #1
		beq .LU8
		b .LU9
.LU9:
		movw r0, %u67
		bl free
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
		cmp %num, #0
		movgt %u69, #1
		cmp %u71, #1
		beq .LU12
		b .LU13
.LU12:
		movw r0, #12
		bl malloc
		movw r0, %u74
		bl free
		sub %u75, %num0, #1
		mov %u76, #0
		cmp %u75, #0
		movgt %u76, #1
		cmp %u78, #1
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
		cmp %m, #0
		moveq %u79, #1
		cmp %u81, #1
		beq .LU16
		b .LU17
.LU16:
		add %u82, %n, #1
		b .LU14
.LU17:
		mov %u83, #0
		cmp %n, #0
		moveq %u83, #1
		cmp %u85, #1
		beq .LU18
		b .LU19
.LU14:
		mov %r0, %_retval_0
.LU18:
		sub %u87, %m, #1
		movw r0, %u87
		bl ackermann
		b .LU14
.LU19:
		sub %u89, %m, #1
		sub %u91, %n, #1
		movw r0, %m
		bl ackermann
		movw r0, %u89
		bl ackermann
		b .LU14
		.size ackermann, .-ackermann
		.align 2
		.global main
main: 


.LU22:
		push {fp, lr}
		add fp, sp, #4
		movw r0, #0
		movw r0, #0
		movw r0, #0
		movw r0, #0
		movw r0, #0
		movw r0, %u92
		bl tailrecursive
		movw r0, %u93
		bl domath
		movw r0, %u94
		bl objinstantiation
		movw r0, %u95
		bl ackermann
		b .LU21
.LU21:
		mov %r0, %_retval_0
		.size main, .-main
