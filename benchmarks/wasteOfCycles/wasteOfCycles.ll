target triple="i686"


define i32 @function(i32 %_P_n)
{
LU1:
	%_retval_ = alloca i32
	%i = alloca i32
	%j = alloca i32
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%u0 = load i32* %n
	%u1 = icmp sle i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %LU2, label %LU3
LU2:
	store i32 0, i32* %_retval_
	br label %LU0
LU3:
	br label %LU4
LU0:
	%u27 = load i32* %_retval_
	ret i32 %u27
LU4:
	store i32 0, i32* %i
	%u4 = load i32* %i
	%u5 = load i32* %n
	%u6 = load i32* %n
	%u7 = mul i32 %u5, %u6
	%u8 = icmp slt i32 %u4, %u7
	%u9 = zext i1 %u8 to i32
	%u10 = trunc i32 %u9 to i1
	br i1 %u10, label %LU5, label %LU6
LU5:
	%u11 = load i32* %i
	%u12 = load i32* %n
	%u13 = add i32 %u11, %u12
	store i32 %u13, i32* %j
	%u14 = load i32* %j
	call void @printf_int(i32 %u14)
	%u15 = load i32* %i
	%u16 = add i32 %u15, 1
	store i32 %u16, i32* %i
	%u17 = load i32* %i
	%u18 = load i32* %n
	%u19 = load i32* %n
	%u20 = mul i32 %u18, %u19
	%u21 = icmp slt i32 %u17, %u20
	%u22 = zext i1 %u21 to i32
	%u23 = trunc i32 %u22 to i1
	br i1 %u23, label %LU5, label %LU6
LU6:
	%u25 = load i32* %n
	%u26 = sub i32 %u25, 1
	%u24 = call i32 @function(i32 %u26)
	store i32 %u24, i32* %_retval_
	br label %LU0
}

define i32 @main()
{
LU8:
	%_retval_ = alloca i32
	%num = alloca i32
	%u28 = call i32 @read()
	store i32 %u28, i32* %num
	%u30 = load i32* %num
	%u29 = call i32 @function(i32 %u30)
	call void @printf_newline(i32 0)
	store i32 0, i32* %_retval_
	br label %LU7
LU7:
	%u31 = load i32* %_retval_
	ret i32 %u31
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
