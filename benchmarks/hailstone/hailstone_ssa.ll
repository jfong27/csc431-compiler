target triple="i686"


define i32 @mod(i32 %a, i32 %b)
{
LU1:
	%u0 = sdiv i32 %a, %b
	%u1 = mul i32 %u0, %b
	%u2 = sub i32 %a, %u1
	br label %LU0
LU0:
	ret i32 %u2
}

define void @hailstone(i32 %n)
{
LU3:
	%u3 = trunc i32 1 to i1
	br i1 %u3, label %LU4, label %LU5
LU4:
	%u4 = phi i32 
	%u6 = phi i32 
	%u10 = phi i32 
	%u13 = phi i32 
	call void @printf_int(i32 %u4)
	%u5 = call i32 @mod(i32 %u6, i32 2)
	%u7 = icmp eq i32 %u5, 1
	%u8 = zext i1 %u7 to i32
	%u9 = trunc i32 %u8 to i1
	br i1 %u9, label %LU6, label %LU7
LU5:
	br label %LU2
LU6:
	%u11 = mul i32 3, %u10
	%u12 = add i32 %u11, 1
	br label %LU8
LU7:
	%u14 = sdiv i32 %u13, 2
	br label %LU8
LU8:
	%u15 = phi i32 
	%u19 = phi i32 
	%u16 = icmp sle i32 %u15, 1
	%u17 = zext i1 %u16 to i32
	%u18 = trunc i32 %u17 to i1
	br i1 %u18, label %LU9, label %LU10
LU9:
	call void @printf_newline(i32 %u19)
	br label %LU2
LU10:
	br label %LU11
LU2:
	ret void
LU11:
	%u20 = trunc i32 1 to i1
	br i1 %u20, label %LU4, label %LU5
}

define i32 @main()
{
LU13:
	%u21 = call i32 @read()
	call void @hailstone(i32 %u21)
	br label %LU12
LU12:
	ret i32 0
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
