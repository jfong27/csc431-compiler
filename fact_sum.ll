target triple="i686"


define i32 @sum(i32 %_P_a, i32 %_P_b)
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

define i32 @fact(i32 %_P_n)
{
LU3:
	%_retval_ = alloca i32
	%t = alloca i32
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%u4 = load i32* %n
	%u5 = icmp eq i32 %u4, 1
	%u6 = load i32* %n
	%u7 = icmp eq i32 %u6, 0
	%u8 = or i32 %u5, %u7
	br i1 %u8, label %LU4, label %LU5
LU4:
	store i32 1, i32* %_retval_
	br label %LU2
LU5:
	br label %LU6
LU2:
	%u21 = load i32* %_retval_
	ret i32 %u21
LU6:
	%u9 = load i32* %n
	%u10 = icmp sle i32 %u9, 1
	br i1 %u10, label %LU7, label %LU8
LU9:
	%u15 = load i32* %n
	%u17 = load i32* %n
	%u18 = sub i32 %u17, 1
	%u16 = call i32 @fact(i32 %u18)
	%u19 = mul i32 %u15, %u16
	store i32 %u19, i32* %t
	%u20 = load i32* %t
	store i32 %u20, i32* %_retval_
	br label %LU2
LU7:
	%u12 = mul i32 1, -1
	%u13 = load i32* %n
	%u14 = mul i32 %u12, %u13
	%u11 = call i32 @fact(i32 %u14)
	store i32 %u11, i32* %_retval_
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
	%u22 = load i32* %flag
	%u23 = mul i32 1, -1
	%u24 = icmp ne i32 %u22, %u23
	br i1 %u24, label %LU12, label %LU13
LU12:
	%u25 = call i32 @read()
	store i32 %u25, i32* %num1
	%u26 = call i32 @read()
	store i32 %u26, i32* %num2
	%u28 = load i32* %num1
	%u27 = call i32 @fact(i32 %u28)
	store i32 %u27, i32* %num1
	%u30 = load i32* %num2
	%u29 = call i32 @fact(i32 %u30)
	store i32 %u29, i32* %num2
	%u32 = load i32* %num1
	%u33 = load i32* %num2
	%u31 = call i32 @sum(i32 %u32, i32 %u33)
	call void @printf_newline(i32 %u31)
	%u34 = call i32 @read()
	store i32 %u34, i32* %flag
	%u35 = load i32* %flag
	%u36 = mul i32 1, -1
	%u37 = icmp ne i32 %u35, %u36
	br i1 %u37, label %LU12, label %LU13
LU13:
	store i32 0, i32* %_retval_
	br label %LU10
LU10:
	%u38 = load i32* %_retval_
	ret i32 %u38
}

declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare i32 @read()
