target triple="i686"

@GLOBAL = common global i32 0, align 4
@count = common global i32 0, align 4

define i32 @fun2(i32 %_P_x, i32 %_P_y)
{
LU1:
	%_retval_ = alloca i32
	%x = alloca i32
	store i32 %_P_x, i32* %x
	%y = alloca i32
	store i32 %_P_y, i32* %y
	%u0 = load i32* %x
	%u1 = icmp eq i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %LU2, label %LU3
LU2:
	%u4 = load i32* %y
	store i32 %u4, i32* %_retval_
	br label %LU0
LU3:
	%u6 = load i32* %x
	%u7 = sub i32 %u6, 1
	%u8 = load i32* %y
	%u5 = call i32 @fun2(i32 %u7, i32 %u8)
	store i32 %u5, i32* %_retval_
	br label %LU0
LU0:
	%u9 = load i32* %_retval_
	ret i32 %u9
LU4:
	br label %LU0
}

define i32 @fun1(i32 %_P_x, i32 %_P_y, i32 %_P_z)
{
LU6:
	%_retval_ = alloca i32
	%retVal = alloca i32
	%x = alloca i32
	store i32 %_P_x, i32* %x
	%y = alloca i32
	store i32 %_P_y, i32* %y
	%z = alloca i32
	store i32 %_P_z, i32* %z
	%u10 = add i32 5, 6
	%u11 = load i32* %x
	%u12 = mul i32 %u11, 2
	%u13 = sub i32 %u10, %u12
	%u14 = load i32* %y
	%u15 = sdiv i32 4, %u14
	%u16 = add i32 %u13, %u15
	%u17 = load i32* %z
	%u18 = add i32 %u16, %u17
	store i32 %u18, i32* %retVal
	%u19 = load i32* %retVal
	%u20 = load i32* %y
	%u21 = icmp sgt i32 %u19, %u20
	%u22 = zext i1 %u21 to i32
	%u23 = trunc i32 %u22 to i1
	br i1 %u23, label %LU7, label %LU8
LU7:
	%u25 = load i32* %retVal
	%u26 = load i32* %x
	%u24 = call i32 @fun2(i32 %u25, i32 %u26)
	store i32 %u24, i32* %_retval_
	br label %LU5
LU8:
	%u27 = icmp slt i32 5, 6
	%u28 = zext i1 %u27 to i32
	%u29 = load i32* %retVal
	%u30 = load i32* %y
	%u31 = icmp sle i32 %u29, %u30
	%u32 = zext i1 %u31 to i32
	%u33 = and i32 %u28, %u32
	%u34 = trunc i32 %u33 to i1
	br i1 %u34, label %LU10, label %LU11
LU5:
	%u39 = load i32* %_retval_
	ret i32 %u39
LU12:
	br label %LU9
LU9:
	%u38 = load i32* %retVal
	store i32 %u38, i32* %_retval_
	br label %LU5
LU10:
	%u36 = load i32* %retVal
	%u37 = load i32* %y
	%u35 = call i32 @fun2(i32 %u36, i32 %u37)
	store i32 %u35, i32* %_retval_
	br label %LU5
LU11:
	br label %LU12
}

define i32 @main()
{
LU14:
	%_retval_ = alloca i32
	%i = alloca i32
	store i32 0, i32* %i
	%u40 = call i32 @read()
	store i32 %u40, i32* %i
	%u41 = load i32* %i
	%u42 = icmp slt i32 %u41, 10000
	%u43 = zext i1 %u42 to i32
	%u44 = trunc i32 %u43 to i1
	br i1 %u44, label %LU15, label %LU16
LU15:
	%u46 = load i32* %i
	%u45 = call i32 @fun1(i32 3, i32 %u46, i32 5)
	call void @printf_newline(i32 %u45)
	%u47 = load i32* %i
	%u48 = add i32 %u47, 1
	store i32 %u48, i32* %i
	%u49 = load i32* %i
	%u50 = icmp slt i32 %u49, 10000
	%u51 = zext i1 %u50 to i32
	%u52 = trunc i32 %u51 to i1
	br i1 %u52, label %LU15, label %LU16
LU16:
	store i32 0, i32* %_retval_
	br label %LU13
LU13:
	%u53 = load i32* %_retval_
	ret i32 %u53
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
