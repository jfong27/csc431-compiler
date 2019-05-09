target triple="i686"


define i32 @computeFib(i32 %input)
{
LU1:
	%u0 = icmp eq i32 %input, 0
	%u1 = zext i1 %u0 to i32
	%u2 = trunc i32 %u1 to i1
	br i1 %u2, label %LU2, label %LU3
LU2:
	br label %LU0
LU3:
	%u3 = icmp sle i32 %input, 2
	%u4 = zext i1 %u3 to i32
	%u5 = trunc i32 %u4 to i1
	br i1 %u5, label %LU5, label %LU6
LU0:
	%_retval_0 = phi i32 [0, %LU2], [1, %LU5], [%u10, %LU6] 
	ret i32 %_retval_0
LU5:
	br label %LU0
LU6:
	%u7 = sub i32 %input, 1
	%u6 = call i32 @computeFib(i32 %u7)
	%u9 = sub i32 %input, 2
	%u8 = call i32 @computeFib(i32 %u9)
	%u10 = add i32 %u6, %u8
	br label %LU0
}

define i32 @main()
{
LU9:
	%u11 = call i32 @read()
	%u12 = call i32 @computeFib(i32 %u11)
	call void @printf_newline(i32 %u12)
	br label %LU8
LU8:
	%_retval_0 = phi i32 [0, %LU9], [%_retval_0, %LU8] 
	ret i32 %_retval_0
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
