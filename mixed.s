		.arch armv7-a
		.comm globalfoo,4,4

		.text
		.align 2
		.global tailrecursive
tailrecursive: 
.LU1:
		push {fp, lr}
		add fp, sp, #4
		mov %u1, #0
		cmp %u0, 0
		movle %u1, #1
		cmp %u3, 1
		beq .LU2
		b .LU3
.LU2:
		b .LU0
.LU3:
		b .LU4
.LU0:
		pop {fp, pc}
.LU4:
		mov %r0, #12
		b .malloc
		mov %u4, %r0
		sub %u7, %u6, 1
		mov %r0, %u7
		b .tailrecursive
		NULL RESULT ARM MOVE
		b .LU0
		.size tailrecursive, .-tailrecursive
		.align 2
		.global add
add: 
.LU6:
		push {fp, lr}
		add fp, sp, #4
		add %u10, %u8, %u9
		b .LU5
.LU5:
		mov %r0, %u11
		.size add, .-add
		.align 2
		.global domath
domath: 
.LU8:
		push {fp, lr}
		add fp, sp, #4
		mov %r0, #12
		b .malloc
		mov %u12, %r0
		mov %r0, #4
		b .malloc
		mov %u14, %r0
		add %u17, %u16, 8
		mov %r0, #12
		b .malloc
		mov %u18, %r0
		mov %r0, #4
		b .malloc
		mov %u20, %r0
		add %u23, %u22, 8
		add %u26, %u25, 0
		add %u28, %u27, 0
		add %u30, %u29, 0
		add %u33, %u32, 8
		add %u35, %u34, 0
		add %u37, %u36, 0
		add %u40, %u39, 8
		add %u42, %u41, 0
		mov %u44, #0
		cmp %u43, 0
		movgt %u44, #1
		cmp %u46, 1
		beq .LU9
		b .LU10
.LU9:
		add %u48, %u47, 0
		add %u51, %u50, 0
		mul %u53, %u49, %u52
		add %u56, %u55, 8
		add %u58, %u57, 0
		mul %u60, %u54, %u59
		add %u62, %u61, 0
		sdiv %u64, %u60, %u63
		add %u67, %u66, 8
		add %u69, %u68, 0
		add %u72, %u71, 0
		mov %r0, %u70
		b .add
		mov %u65, %r0
		add %u75, %u74, 0
		add %u78, %u77, 0
		sub %u80, %u76, %u79
		sub %u82, %u81, 1
		mov %u84, #0
		cmp %u83, 0
		movgt %u84, #1
		cmp %u86, 1
		beq .LU9
		b .LU10
.LU10:
		mov %r0, %u88
		b .free
		NULL RESULT ARM MOVE
		mov %r0, %u90
		b .free
		NULL RESULT ARM MOVE
		b .LU7
.LU7:
		pop {fp, pc}
		.size domath, .-domath
		.align 2
		.global objinstantiation
objinstantiation: 
.LU12:
		push {fp, lr}
		add fp, sp, #4
		mov %u92, #0
		cmp %u91, 0
		movgt %u92, #1
		cmp %u94, 1
		beq .LU13
		b .LU14
.LU13:
		mov %r0, #12
		b .malloc
		mov %u95, %r0
		mov %r0, %u98
		b .free
		NULL RESULT ARM MOVE
		sub %u100, %u99, 1
		mov %u102, #0
		cmp %u101, 0
		movgt %u102, #1
		cmp %u104, 1
		beq .LU13
		b .LU14
.LU14:
		b .LU11
.LU11:
		pop {fp, pc}
		.size objinstantiation, .-objinstantiation
		.align 2
		.global ackermann
ackermann: 
.LU16:
		push {fp, lr}
		add fp, sp, #4
		mov %u106, #0
		cmp %u105, 0
		moveq %u106, #1
		cmp %u108, 1
		beq .LU17
		b .LU18
.LU17:
		add %u110, %u109, 1
		b .LU15
.LU18:
		b .LU19
.LU15:
		mov %r0, %u125
.LU19:
		mov %u112, #0
		cmp %u111, 0
		moveq %u112, #1
		cmp %u114, 1
		beq .LU20
		b .LU21
.LU22:
		b .LU15
.LU20:
		sub %u117, %u116, 1
		mov %r0, %u117
		b .ackermann
		mov %u115, %r0
		b .LU15
.LU21:
		sub %u120, %u119, 1
		sub %u124, %u123, 1
		mov %r0, %u122
		b .ackermann
		mov %u121, %r0
		mov %r0, %u120
		b .ackermann
		mov %u118, %r0
		b .LU15
		.size ackermann, .-ackermann
		.align 2
		.global main
main: 


.LU24:
		push {fp, lr}
		add fp, sp, #4
		movw r, #
		movw r, #
		movw r, #
		movw r, #
		movw r, #
		mov %r0, %u131
		b .tailrecursive
		NULL RESULT ARM MOVE
		mov %r0, %u133
		b .domath
		NULL RESULT ARM MOVE
		mov %r0, %u135
		b .objinstantiation
		NULL RESULT ARM MOVE
		mov %r0, %u138
		b .ackermann
		mov %u137, %r0
		b .LU23
.LU23:
		mov %r0, %u140
		.size main, .-main
