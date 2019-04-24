target triple="i686"


define void @main()
{
LU1:
	%_retval_ = alloca i1
	%c = alloca i32
	store i32 3, i32* %c
	%u0 = load i32* %c
	%u1 = icmp slt i32 %u0, 4
	%u2 = zext i1 %u1 to i32
	%u3 = load i32* %c
	%u4 = icmp sgt i32 %u3, 2
	%u5 = zext i1 %u4 to i32
	%u6 = and i32 %u2, %u5
	%u7 = load i32* %c
	%u8 = icmp eq i32 %u7, 3
	%u9 = zext i1 %u8 to i32
	%u10 = and i32 %u6, %u9
	%u11 = trunc i32 %u10 to i1
	br i1 %u11, label %LU2, label %LU3
LU2:
	%u12 = load i32* %c
	call void @printf_newline(i32 %u12)
	br label %LU4
LU3:
	br label %LU4
LU4:
	br label %LU0
LU0:
	ret void
}

declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare i32 @read()
