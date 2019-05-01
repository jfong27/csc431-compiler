target triple="i686"


define i32 @sum(i32 %a, i32 %b)
{
LU1:
	%u0 = add i32 %a, %b
	br label %LU0
LU0:
	ret i32 %u0
}

define i32 @fact(i32 %n)
{
LU3:
	%u1 = icmp eq i32 %n, 1
	%u2 = zext i1 %u1 to i32
	%u3 = icmp eq i32 %n, 0
	%u4 = zext i1 %u3 to i32
	%u5 = or i32 %u2, %u4
	%u6 = trunc i32 %u5 to i1
	br i1 %u6, label %LU4, label %LU5
LU4:
	br label %LU2
LU5:
	br label %LU6
LU2:
	ret i32 1
LU6:
	%u7 = phi i32 
	%u13 = phi i32 
	%u8 = icmp sle i32 %u7, 1
	%u9 = zext i1 %u8 to i32
	%u10 = trunc i32 %u9 to i1
	br i1 %u10, label %LU7, label %LU8
LU9:
	%u15 = phi i32 
	%u17 = phi i32 
	%u18 = sub i32 %u17, 1
	%u16 = call i32 @fact(i32 %u18)
	%u19 = mul i32 %u15, %u16
	br label %LU2
LU7:
	%u12 = mul i32 1, -1
	%u14 = mul i32 %u12, %u13
	%u11 = call i32 @fact(i32 %u14)
	br label %LU2
LU8:
	br label %LU9
}

define i32 @main()
{
LU11:
	%u20 = mul i32 1, -1
	%u21 = icmp ne i32 0, %u20
	%u22 = zext i1 %u21 to i32
	%u23 = trunc i32 %u22 to i1
	br i1 %u23, label %LU12, label %LU13
LU12:
	%u24 = call i32 @read()
	%u25 = call i32 @read()
	%u26 = call i32 @fact(i32 %u24)
	%u27 = call i32 @fact(i32 %u25)
	%u28 = call i32 @sum(i32 %u26, i32 %u27)
	call void @printf_newline(i32 %u28)
	%u29 = call i32 @read()
	%u30 = load i32* %flag
	%u31 = mul i32 1, -1
	%u32 = icmp ne i32 %u30, %u31
	%u33 = zext i1 %u32 to i32
	%u34 = trunc i32 %u33 to i1
	br i1 %u34, label %LU12, label %LU13
LU13:
	br label %LU10
LU10:
	ret i32 0
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
