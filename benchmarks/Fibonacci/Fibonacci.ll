target triple="i686"


define i32 @computeFib(i32 %_P_input)
{
LU1:
	%_retval_ = alloca i32
	%input = alloca i32
	store i32 %_P_input, i32* %input
	%u0 = load i32* %input
	%u1 = icmp eq i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %LU2, label %LU3
LU2:
	store i32 0, i32* %_retval_
	br label %LU0
LU3:
	%u4 = load i32* %input
	%u5 = icmp sle i32 %u4, 2
	%u6 = zext i1 %u5 to i32
	%u7 = trunc i32 %u6 to i1
	br i1 %u7, label %LU5, label %LU6
LU0:
	%u15 = load i32* %_retval_
	ret i32 %u15
LU7:
	br label %LU4
LU4:
	br label %LU0
LU5:
	store i32 1, i32* %_retval_
	br label %LU0
LU6:
	%u9 = load i32* %input
	%u10 = sub i32 %u9, 1
	%u8 = call i32 @computeFib(i32 %u10)
	%u12 = load i32* %input
	%u13 = sub i32 %u12, 2
	%u11 = call i32 @computeFib(i32 %u13)
	%u14 = add i32 %u8, %u11
	store i32 %u14, i32* %_retval_
	br label %LU0
}

define i32 @main()
{
LU9:
	%_retval_ = alloca i32
	%input = alloca i32
	%u16 = call i32 @read()
	store i32 %u16, i32* %input
	%u18 = load i32* %input
	%u17 = call i32 @computeFib(i32 %u18)
	call void @printf_newline(i32 %u17)
	store i32 0, i32* %_retval_
	br label %LU8
LU8:
	%u19 = load i32* %_retval_
	ret i32 %u19
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
