target triple="i686"


define i32 @foo(i32 %_P_i)
{
LU1:
	%_retval_ = alloca i32
	%i = alloca i32
	store i32 %_P_i, i32* %i
	store i32 2, i32* %_retval_
	br label %LU0
LU0:
	%u0 = load i32* %_retval_
	ret i32 %u0
}

define i32 @bar(i32 %_P_i)
{
LU3:
	%_retval_ = alloca i32
	%i = alloca i32
	store i32 %_P_i, i32* %i
	%u1 = load i32* %i
	%u2 = icmp sgt i32 %u1, 0
	br i1 %u2, label %LU4, label %LU5
LU4:
	%u3 = load i32* %i
	store i32 %u3, i32* %_retval_
	br label %LU2
LU5:
	%u4 = load i32* %i
	%u5 = icmp slt i32 %u4, 0
	br i1 %u5, label %LU7, label %LU8
LU2:
	%u7 = load i32* %_retval_
	ret i32 %u7
LU9:
	br label %LU6
LU6:
	br label %LU2
LU7:
	%u6 = mul i32 1, -1
	store i32 %u6, i32* %_retval_
	br label %LU2
LU8:
	store i32 0, i32* %_retval_
	br label %LU2
}

define void @main()
{
LU11:
	%_retval_ = alloca i1
	%u8 = call i32 @bar(i32 2)
	call void @printf_newline(i32 %u8)
	br label %LU10
LU10:
	ret void
}

declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare i32 @read()
