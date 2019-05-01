target triple="i686"


define i32 @isqrt(i32 %_P_a)
{
LU1:
	%_retval_ = alloca i32
	%square = alloca i32
	%delta = alloca i32
	%a = alloca i32
	store i32 %_P_a, i32* %a
	store i32 1, i32* %square
	store i32 3, i32* %delta
	%u0 = load i32* %square
	%u1 = load i32* %a
	%u2 = icmp sle i32 %u0, %u1
	%u3 = zext i1 %u2 to i32
	%u4 = trunc i32 %u3 to i1
	br i1 %u4, label %LU2, label %LU3
LU2:
	%u5 = load i32* %square
	%u6 = load i32* %delta
	%u7 = add i32 %u5, %u6
	store i32 %u7, i32* %square
	%u8 = load i32* %delta
	%u9 = add i32 %u8, 2
	store i32 %u9, i32* %delta
	%u10 = load i32* %square
	%u11 = load i32* %a
	%u12 = icmp sle i32 %u10, %u11
	%u13 = zext i1 %u12 to i32
	%u14 = trunc i32 %u13 to i1
	br i1 %u14, label %LU2, label %LU3
LU3:
	%u15 = load i32* %delta
	%u16 = sdiv i32 %u15, 2
	%u17 = sub i32 %u16, 1
	store i32 %u17, i32* %_retval_
	br label %LU0
LU0:
	%u18 = load i32* %_retval_
	ret i32 %u18
}

define i32 @prime(i32 %_P_a)
{
LU5:
	%_retval_ = alloca i32
	%max = alloca i32
	%divisor = alloca i32
	%remainder = alloca i32
	%a = alloca i32
	store i32 %_P_a, i32* %a
	%u19 = load i32* %a
	%u20 = icmp slt i32 %u19, 2
	%u21 = zext i1 %u20 to i32
	%u22 = trunc i32 %u21 to i1
	br i1 %u22, label %LU6, label %LU7
LU6:
	store i32 0, i32* %_retval_
	br label %LU4
LU7:
	%u24 = load i32* %a
	%u23 = call i32 @isqrt(i32 %u24)
	store i32 %u23, i32* %max
	store i32 2, i32* %divisor
	%u25 = load i32* %divisor
	%u26 = load i32* %max
	%u27 = icmp sle i32 %u25, %u26
	%u28 = zext i1 %u27 to i32
	%u29 = trunc i32 %u28 to i1
	br i1 %u29, label %LU9, label %LU10
LU4:
	%u48 = load i32* %_retval_
	ret i32 %u48
LU13:
	%u41 = load i32* %divisor
	%u42 = add i32 %u41, 1
	store i32 %u42, i32* %divisor
	%u43 = load i32* %divisor
	%u44 = load i32* %max
	%u45 = icmp sle i32 %u43, %u44
	%u46 = zext i1 %u45 to i32
	%u47 = trunc i32 %u46 to i1
	br i1 %u47, label %LU9, label %LU10
LU8:
	br label %LU4
LU10:
	store i32 1, i32* %_retval_
	br label %LU4
LU9:
	%u30 = load i32* %a
	%u31 = load i32* %a
	%u32 = load i32* %divisor
	%u33 = sdiv i32 %u31, %u32
	%u34 = load i32* %divisor
	%u35 = mul i32 %u33, %u34
	%u36 = sub i32 %u30, %u35
	store i32 %u36, i32* %remainder
	%u37 = load i32* %remainder
	%u38 = icmp eq i32 %u37, 0
	%u39 = zext i1 %u38 to i32
	%u40 = trunc i32 %u39 to i1
	br i1 %u40, label %LU11, label %LU12
LU11:
	store i32 0, i32* %_retval_
	br label %LU4
LU12:
	br label %LU13
}

define i32 @main()
{
LU15:
	%_retval_ = alloca i32
	%limit = alloca i32
	%a = alloca i32
	%u49 = call i32 @read()
	store i32 %u49, i32* %limit
	store i32 0, i32* %a
	%u50 = load i32* %a
	%u51 = load i32* %limit
	%u52 = icmp sle i32 %u50, %u51
	%u53 = zext i1 %u52 to i32
	%u54 = trunc i32 %u53 to i1
	br i1 %u54, label %LU16, label %LU17
LU16:
	%u56 = load i32* %a
	%u55 = call i32 @prime(i32 %u56)
	%u57 = trunc i32 %u55 to i1
	br i1 %u57, label %LU18, label %LU19
LU17:
	store i32 0, i32* %_retval_
	br label %LU14
LU18:
	%u58 = load i32* %a
	call void @printf_newline(i32 %u58)
	br label %LU20
LU19:
	br label %LU20
LU20:
	%u59 = load i32* %a
	%u60 = add i32 %u59, 1
	store i32 %u60, i32* %a
	%u61 = load i32* %a
	%u62 = load i32* %limit
	%u63 = icmp sle i32 %u61, %u62
	%u64 = zext i1 %u63 to i32
	%u65 = trunc i32 %u64 to i1
	br i1 %u65, label %LU16, label %LU17
LU14:
	%u66 = load i32* %_retval_
	ret i32 %u66
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
