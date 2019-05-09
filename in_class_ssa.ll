target triple="i686"
%struct.A = type {i32, i32}


define i32 @f(i32 %x, i32 %y)
{
LU1:
	%u0 = icmp sge i32 %x, %y
	%u1 = zext i1 %u0 to i32
	%u2 = trunc i32 %u1 to i1
	br i1 %u2, label %LU2, label %LU3
LU2:
	br label %LU0
LU3:
	%u3 = icmp sgt i32 %x, %y
	%u4 = zext i1 %u3 to i32
	%u5 = trunc i32 %u4 to i1
	br i1 %u5, label %LU4, label %LU5
LU0:
	%_retval_0 = phi i32 [0, %LU2], [%sum1, %LU5], [%_retval_0, %LU0] 
	ret i32 %_retval_0
LU4:
	%x0 = phi i32 [%x, %LU3] 
	%y0 = phi i32 [%y, %LU3] 
	%sum0 = phi i32 [0, %LU3] 
	%u6 = sdiv i32 %x0, 2
	%u7 = mul i32 %u6, 2
	%u8 = icmp eq i32 %u7, %x0
	%u9 = zext i1 %u8 to i32
	%u10 = trunc i32 %u9 to i1
	br i1 %u10, label %LU6, label %LU7
LU5:
	%sum1 = phi i32 [0, %LU3], [%sum2, %LU7] 
	br label %LU0
LU6:
	%u11 = add i32 %sum0, 1
	br label %LU7
LU7:
	%sum2 = phi i32 [%sum0, %LU4]
	%u12 = add i32 %x0, 1
	%u13 = icmp sgt i32 %u12, %y0
	%u14 = zext i1 %u13 to i32
	%u15 = trunc i32 %u14 to i1
	br i1 %u15, label %LU4, label %LU5
}

define i32 @main()
{
LU9:
	br label %LU8
LU8:
	%_retval_0 = phi i32 [0, %LU9]
	ret i32 %_retval_0
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
