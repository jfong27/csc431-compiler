target triple="i686"


define i32 @mod(i32 %_P_a, i32 %_P_b)
{
LU1:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 %_P_a, i32* %a
	%b = alloca i32
	store i32 %_P_b, i32* %b
	%u0 = load i32* %a
	%u1 = load i32* %a
	%u2 = load i32* %b
	%u3 = sdiv i32 %u1, %u2
	%u4 = load i32* %b
	%u5 = mul i32 %u3, %u4
	%u6 = sub i32 %u0, %u5
	store i32 %u6, i32* %_retval_
	br label %LU0
LU0:
	%u7 = load i32* %_retval_
	ret i32 %u7
}

define void @hailstone(i32 %_P_n)
{
LU3:
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%u8 = trunc i32 1 to i1
	br i1 %u8, label %LU4, label %LU5
LU4:
	%u9 = load i32* %n
	call void @printf_int(i32 %u9)
	%u11 = load i32* %n
	%u10 = call i32 @mod(i32 %u11, i32 2)
	%u12 = icmp eq i32 %u10, 1
	%u13 = zext i1 %u12 to i32
	%u14 = trunc i32 %u13 to i1
	br i1 %u14, label %LU6, label %LU7
LU5:
	br label %LU2
LU6:
	%u15 = load i32* %n
	%u16 = mul i32 3, %u15
	%u17 = add i32 %u16, 1
	store i32 %u17, i32* %n
	br label %LU8
LU7:
	%u18 = load i32* %n
	%u19 = sdiv i32 %u18, 2
	store i32 %u19, i32* %n
	br label %LU8
LU8:
	%u20 = load i32* %n
	%u21 = icmp sle i32 %u20, 1
	%u22 = zext i1 %u21 to i32
	%u23 = trunc i32 %u22 to i1
	br i1 %u23, label %LU9, label %LU10
LU9:
	%u24 = load i32* %n
	call void @printf_newline(i32 %u24)
	br label %LU2
LU10:
	br label %LU11
LU2:
	ret void
LU11:
	%u25 = trunc i32 1 to i1
	br i1 %u25, label %LU4, label %LU5
}

define i32 @main()
{
LU13:
	%_retval_ = alloca i32
	%num = alloca i32
	%u26 = call i32 @read()
	store i32 %u26, i32* %num
	%u27 = load i32* %num
	call void @hailstone(i32 %u27)
	store i32 0, i32* %_retval_
	br label %LU12
LU12:
	%u28 = load i32* %_retval_
	ret i32 %u28
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
