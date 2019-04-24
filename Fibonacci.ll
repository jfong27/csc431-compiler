target triple="i686"


define i32 @computeFib(i32 %_P_input)
{
LU1:
	%_retval_ = alloca i32
	%input = alloca i32
	store i32 %_P_input, i32* %input
	%u0 = load i32* %input
	%u1 = icmp eq i32 %u0, 0
	br i1 %u1, label %then2, label %else3
then2:
	store i32 0, i32* %_retval_
	br label %LU0
else3:
	%u2 = load i32* %input
	%u3 = icmp sle i32 %u2, 2
	br i1 %u3, label %then5, label %else6
LU0:
	%u11 = load i32* %_retval_
	ret i32 %u11
join7:
	br label %join4
join4:
	br label %LU0
then5:
	store i32 1, i32* %_retval_
	br label %LU0
else6:
	%u5 = load i32* %input
	%u6 = sub i32 %u5, 1
	%u4 = call i32 @computeFib(i32 %u6)
	%u8 = load i32* %input
	%u9 = sub i32 %u8, 2
	%u7 = call i32 @computeFib(i32 %u9)
	%u10 = add i32 %u4, %u7
	store i32 %u10, i32* %_retval_
	br label %LU0
}

define i32 @main()
{
LU9:
	%_retval_ = alloca i32
	%input = alloca i32
	%u12 = call i32 @read()
	store i32 %u12, i32* %input
	%u14 = load i32* %input
	%u13 = call i32 @computeFib(i32 %u14)
	call void @printf_newline(i32 %u13)
	store i32 0, i32* %_retval_
	br label %LU8
LU8:
	%u15 = load i32* %_retval_
	ret i32 %u15
}

declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare i32 @read()
