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
	br label %LU0
}

declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare i32 @read()
