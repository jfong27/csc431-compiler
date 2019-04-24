target triple="i686"
%struct.Brent = type {i32}


define void @main()
{
LU1:
	%_retval_ = alloca i1
	%b = alloca %struct.Brent
	%u0 = icmp slt i32 4, 4
	br i1 %u0, label %LU2, label %LU3
LU2:
	%u1 = icmp slt i32 3, 4
	br i1 %u1, label %LU5, label %LU6
LU3:
	call void @printf_newline(i32 4)
	br label %LU4
LU5:
	%u2 = icmp slt i32 4, 4
	br i1 %u2, label %LU8, label %LU9
LU6:
	call void @printf_newline(i32 3)
	br label %LU7
LU8:
	call void @printf_newline(i32 1)
	br label %LU10
LU9:
	call void @printf_newline(i32 2)
	br label %LU10
LU10:
	br label %LU7
LU7:
	br label %LU4
LU4:
	br label %LU0
LU0:
	ret void
}

declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare i32 @read()
