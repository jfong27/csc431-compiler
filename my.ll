target triple="i686"
%struct.Brent = type {i32}


define void @main()
{
LU1:
	%_retval_ = alloca i1
	%b = alloca %struct.Brent
	%u0 = icmp slt i32 3, 4
	br i1 %u0, label %then2, label %else3
then2:
	%u1 = icmp slt i32 4, 3
	br i1 %u1, label %then5, label %else6
else3:
	call void @printf_newline(i32 4)
	br label %join4
then5:
	%u2 = icmp slt i32 3, 4
	%u3 = icmp slt i32 3, 5
	%u4 = and i32 %u2, %u3
	br i1 %u4, label %then8, label %else9
else6:
	call void @printf_newline(i32 3)
	br label %join7
then8:
	call void @printf_newline(i32 1)
	br label %join10
else9:
	call void @printf_newline(i32 2)
	br label %join10
join10:
	br label %join7
join7:
	br label %join4
join4:
	br label %LU0
LU0:
	ret void
}

declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare i32 @read()
