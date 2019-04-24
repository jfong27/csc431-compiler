target triple="i686"
%struct.Brent = type {i32}


define void @main()
{
LU1:
	%_retval_ = alloca i1
	%b = alloca %struct.Brent
	%c = alloca i32
	%u0 = call i32 @read()
	store i32 %u0, i32* %c
	%u1 = load i32* %c
	call void @printf_newline(i32 %u1)
	call void @printf_int(i32 3)
	call void @printf_int(i32 4)
	call void @printf_newline(i32 6)
	br label %LU0
LU0:
	ret void
}

declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare i32 @read()
