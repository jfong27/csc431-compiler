target triple="i686"


define i32 @sum(i32 %a, i32 %b)
{
LU1:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 %_P_a, i32* %a
	%b = alloca i32
	store i32 %_P_b, i32* %b
	%u0 = load i32* %a
	%u1 = load i32* %b
	%u2 = add i32 %u0, %u1
	store i32 %u2, i32* %_retval_
	br label %LU0
LU0:
	%u3 = load i32* %_retval_
	ret i32 %u3
}

define i32 @fact(i32 %n)
{
LU3:
	%_retval_ = alloca i32
	%t = alloca i32
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%u4 = load i32* %n
	%u5 = icmp eq i32 %u4, 1
	%u6 = zext i1 %u5 to i32
	%u7 = load i32* %n
	%u8 = icmp eq i32 %u7, 0
	%u9 = zext i1 %u8 to i32
	%u10 = or i32 %u6, %u9
	%u11 = trunc i32 %u10 to i1
	br i1 %u11, label %LU4, label %LU5
LU4:
	store i32 1, i32* %_retval_
	br label %LU2
LU5:
	br label %LU6
LU2:
	%u26 = load i32* %_retval_
	ret i32 %u26
LU6:
	%u12 = load i32* %n
	%u13 = icmp sle i32 %u12, 1
	%u14 = zext i1 %u13 to i32
	%u15 = trunc i32 %u14 to i1
	br i1 %u15, label %LU7, label %LU8
LU9:
	%u20 = load i32* %n
	%u22 = load i32* %n
	%u23 = sub i32 %u22, 1
	%u21 = call i32 @fact(i32 %u23)
	%u24 = mul i32 %u20, %u21
	store i32 %u24, i32* %t
	%u25 = load i32* %t
	store i32 %u25, i32* %_retval_
	br label %LU2
LU7:
	%u17 = mul i32 1, -1
	%u18 = load i32* %n
	%u19 = mul i32 %u17, %u18
	%u16 = call i32 @fact(i32 %u19)
	store i32 %u16, i32* %_retval_
	br label %LU2
LU8:
	br label %LU9
}

define i32 @main()
{
LU11:
	%_retval_ = alloca i32
	%num1 = alloca i32
	%num2 = alloca i32
	%flag = alloca i32
	store i32 0, i32* %flag
	%u27 = load i32* %flag
	%u28 = mul i32 1, -1
	%u29 = icmp ne i32 %u27, %u28
	%u30 = zext i1 %u29 to i32
	%u31 = trunc i32 %u30 to i1
	br i1 %u31, label %LU12, label %LU13
LU12:
	%u32 = call i32 @read()
	store i32 %u32, i32* %num1
	%u33 = call i32 @read()
	store i32 %u33, i32* %num2
	%u35 = load i32* %num1
	%u34 = call i32 @fact(i32 %u35)
	store i32 %u34, i32* %num1
	%u37 = load i32* %num2
	%u36 = call i32 @fact(i32 %u37)
	store i32 %u36, i32* %num2
	%u39 = load i32* %num1
	%u40 = load i32* %num2
	%u38 = call i32 @sum(i32 %u39, i32 %u40)
	call void @printf_newline(i32 %u38)
	%u41 = call i32 @read()
	store i32 %u41, i32* %flag
	%u42 = load i32* %flag
	%u43 = mul i32 1, -1
	%u44 = icmp ne i32 %u42, %u43
	%u45 = zext i1 %u44 to i32
	%u46 = trunc i32 %u45 to i1
	br i1 %u46, label %LU12, label %LU13
LU13:
	store i32 0, i32* %_retval_
	br label %LU10
LU10:
	%u47 = load i32* %_retval_
	ret i32 %u47
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
