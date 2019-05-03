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
	br label %LU4
LU0:
	%x0 = phi i32 
	%y0 = phi i32 
	ret i32 0
LU4:
	%x0 = phi i32 [%x0, LU0] [%x, LU3] 
	%y0 = phi i32 [%y0, LU0] [%y, LU3] 
	%u3 = icmp sgt i32 %x0, %y0
	%u4 = zext i1 %u3 to i32
	%u5 = trunc i32 %u4 to i1
	br i1 %u5, label %LU5, label %LU6
LU5:
	%x0 = phi i32 
	%sum0 = phi i32 
	%u6 = sdiv i32 %x0, 2
	%u7 = mul i32 %u6, 2
	%u8 = icmp eq i32 %u7, %x0
	%u9 = zext i1 %u8 to i32
	%u10 = trunc i32 %u9 to i1
	br i1 %u10, label %LU7, label %LU8
LU6:
	%sum0 = phi i32 
	br label %LU0
LU7:
	%u11 = add i32 %sum0, 1
	br label %LU9
LU8:
	br label %LU9
LU9:
	%x0 = phi i32 [%x0, LU7] [%x0, LU8] 
	%u12 = add i32 %x0, 1
	%u13 = load i32* %x
	%u14 = load i32* %y
	%u15 = icmp sgt i32 %u13, %u14
	%u16 = zext i1 %u15 to i32
	%u17 = trunc i32 %u16 to i1
	br i1 %u17, label %LU5, label %LU6
}

define i32 @main()
{
LU11:
	br label %LU10
LU10:
	ret i32 0
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
