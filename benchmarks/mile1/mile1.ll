target triple="i686"
%struct.Power = type {i32, i32}


define i32 @calcPower(i32 %_P_base, i32 %_P_exp)
{
LU1:
	%_retval_ = alloca i32
	%result = alloca i32
	%base = alloca i32
	store i32 %_P_base, i32* %base
	%exp = alloca i32
	store i32 %_P_exp, i32* %exp
	store i32 1, i32* %result
	%u0 = load i32* %exp
	%u1 = icmp sgt i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %LU2, label %LU3
LU2:
	%u4 = load i32* %result
	%u5 = load i32* %base
	%u6 = mul i32 %u4, %u5
	store i32 %u6, i32* %result
	%u7 = load i32* %exp
	%u8 = sub i32 %u7, 1
	store i32 %u8, i32* %exp
	%u9 = load i32* %exp
	%u10 = icmp sgt i32 %u9, 0
	%u11 = zext i1 %u10 to i32
	%u12 = trunc i32 %u11 to i1
	br i1 %u12, label %LU2, label %LU3
LU3:
	%u13 = load i32* %result
	store i32 %u13, i32* %_retval_
	br label %LU0
LU0:
	%u14 = load i32* %_retval_
	ret i32 %u14
}

define i32 @main()
{
LU5:
	%_retval_ = alloca i32
	%power = alloca %struct.Power*
	%input = alloca i32
	%result = alloca i32
	%exp = alloca i32
	%i = alloca i32
	store i32 0, i32* %result
	%u15 = call i8* @malloc(i32 8)
	%u16 = bitcast i8* %u15 to %struct.Power*
	store %struct.Power* %u16, %struct.Power** %power
	%u17 = call i32 @read()
	store i32 %u17, i32* %input
	%u18 = load i32* %input
	%u19 = load %struct.Power** %power
	%u20 = getelementptr %struct.Power* %u19, i1 0, i32 0
	store i32 %u18, i32* %u20
	%u21 = call i32 @read()
	store i32 %u21, i32* %input
	%u22 = load i32* %input
	%u23 = icmp slt i32 %u22, 0
	%u24 = zext i1 %u23 to i32
	%u25 = trunc i32 %u24 to i1
	br i1 %u25, label %LU6, label %LU7
LU6:
	%u26 = mul i32 1, -1
	store i32 %u26, i32* %_retval_
	br label %LU4
LU7:
	br label %LU8
LU4:
	%u48 = load i32* %_retval_
	ret i32 %u48
LU8:
	%u27 = load i32* %input
	%u28 = load %struct.Power** %power
	%u29 = getelementptr %struct.Power* %u28, i1 0, i32 1
	store i32 %u27, i32* %u29
	store i32 0, i32* %i
	%u30 = load i32* %i
	%u31 = icmp slt i32 %u30, 1000000
	%u32 = zext i1 %u31 to i32
	%u33 = trunc i32 %u32 to i1
	br i1 %u33, label %LU9, label %LU10
LU9:
	%u34 = load i32* %i
	%u35 = add i32 %u34, 1
	store i32 %u35, i32* %i
	%u37 = load %struct.Power** %power
	%u38 = getelementptr %struct.Power* %u37, i1 0, i32 0
	%u39 = load i32* %u38
	%u40 = load %struct.Power** %power
	%u41 = getelementptr %struct.Power* %u40, i1 0, i32 1
	%u42 = load i32* %u41
	%u36 = call i32 @calcPower(i32 %u39, i32 %u42)
	store i32 %u36, i32* %result
	%u43 = load i32* %i
	%u44 = icmp slt i32 %u43, 1000000
	%u45 = zext i1 %u44 to i32
	%u46 = trunc i32 %u45 to i1
	br i1 %u46, label %LU9, label %LU10
LU10:
	%u47 = load i32* %result
	call void @printf_newline(i32 %u47)
	store i32 1, i32* %_retval_
	br label %LU4
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
