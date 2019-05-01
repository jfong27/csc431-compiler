target triple="i686"


define void @main()
{
LU1:
	%x = alloca i32
	%y = alloca i32
	store i32 1, i32* %x
	store i32 1, i32* %y
	%u0 = load i32* %x
	%u1 = load i32* %y
	%u2 = icmp eq i32 %u0, %u1
	%u3 = zext i1 %u2 to i32
	%u4 = xor i32 1, %u3
	%u5 = trunc i32 %u4 to i1
	br i1 %u5, label %LU2, label %LU3
LU2:
	call void @printf_newline(i32 0)
	br label %LU4
LU3:
	call void @printf_newline(i32 1)
	br label %LU4
LU4:
	br label %LU0
LU0:
	ret void
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
