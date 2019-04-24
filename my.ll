target triple="i686"


define void @main()
{
LU1:
	%_retval_ = alloca i1
	%c = alloca i32
	store i32 3, i32* %c
	%u0 = load i32* %c
	%u1 = icmp sge i32 %u0, 0
	br i1 %u1, label %LU2, label %LU3
LU2:
	%u2 = load i32* %c
	call void @printf_newline(i32 %u2)
	%u3 = load i32* %c
	%u4 = sub i32 %u3, 1
	store i32 %u4, i32* %c
	%u5 = load i32* %c
	%u6 = icmp sge i32 %u5, 0
	br i1 %u6, label %LU2, label %LU3
LU3:
	br label %LU0
LU0:
	ret void
}

declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare i32 @read()
