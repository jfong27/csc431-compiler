target triple="i686"
%struct.A = type {i32, i32, i32, %struct.A*}
%struct.B = type {%struct.A*}

@i = common global i32 null, align 4
@j = common global i32 null, align 4
@k = common global i32 null, align 4
@b = common global %struct.B* null, align 4
@bb = common global %struct.B* null, align 4
@bbb = common global %struct.B* null, align 4
@bob = common global i32 null, align 4

define %struct.A @f(i32 %_P_i, %struct.B %_P_j)
{
LU1:
	%_retval_ = alloca %struct.A
	%l = alloca i32
	%k = alloca i32
	%i = alloca i32
	store i32 %_P_i, i32* %i
	%j = alloca %struct.B
	store %struct.B %_P_j, %struct.B* %j
	%u0 = load %struct.B* %b
	%u1 = getelementptr %struct.B* %u0, i1 0, i32 0
	%u2 = load %struct.A* %u1
	%u3 = getelementptr %struct.A* %u2, i1 0, i32 0
	%u4 = load %struct.A* %u3
	%u5 = getelementptr %struct.A* %u4, i1 0, i32 0
	%u6 = load %struct.A* %u5
	%u7 = getelementptr %struct.A* %u6, i1 0, i32 0
	%u8 = load %struct.A* %u7
	store %struct.A %u8, %struct.A* %_retval_
	br label %LU0
LU0:
	%u9 = load %struct.A* %_retval_
	ret %struct.A %u9
}

define i32 @foo(i32 %_P_n)
{
LU3:
	%_retval_ = alloca i32
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%u10 = load i32* %n
	%u11 = icmp slt i32 %u10, 0
	br i1 %u11, label %LU4, label %LU5
LU4:
	store i32 1, i32* %_retval_
	br label %LU2
LU5:
	%u12 = load i32* %n
	%u14 = load i32* %n
	%u15 = sub i32 %u14, 1
	%u13 = call i32 @foo(i32 %u15)
	%u16 = mul i32 %u12, %u13
	store i32 %u16, i32* %_retval_
	br label %LU2
LU2:
	%u17 = load i32* %_retval_
	ret i32 %u17
LU6:
	br label %LU2
}

define i32 @g(i32 %_P_i, %struct.B %_P_j)
{
LU8:
	%_retval_ = alloca i32
	%g = alloca i32
	%m = alloca i32
	%k = alloca i32
	%i = alloca i32
	store i32 %_P_i, i32* %i
	%j = alloca %struct.B
	store %struct.B %_P_j, %struct.B* %j
	store i32 3, i32* %_retval_
	br label %LU7
LU7:
	%u18 = load i32* %_retval_
	ret i32 %u18
}

define i32 @main()
{
LU10:
	%_retval_ = alloca i32
	%a = alloca %struct.A
	%i = alloca i32
	%j = alloca i32
	%k = alloca i32
	%b = alloca i1
	%h = alloca i32
	%u19 = mul i32 2, -1
	%u20 = mul i32 %u19, -1
	store i32 %u20, i32* %i
	%u21 = load i32* %i
	%u22 = call i32 @g(i32 1, i32 -1)
	%u23 = icmp slt i32 %u21, %u22
	br i1 %u23, label %LU11, label %LU12
LU11:
	call void @printf_int(i32 1)
	br label %LU13
LU12:
	br label %LU13
LU13:
	%u24 = load i32* %i
	%u25 = call i32 @g(i32 1, i32 -1)
	%u26 = icmp sgt i32 %u24, %u25
	br i1 %u26, label %LU14, label %LU15
LU14:
	call void @printf_int(i32 1)
	br label %LU16
LU15:
	call void @printf_newline(i32 3)
	br label %LU16
LU16:
	br i1 true, label %LU17, label %LU18
LU17:
	call void @printf_int(i32 7)
	br i1 true, label %LU17, label %LU18
LU18:
	%u29 = call i8* @malloc()
	%u30 = bitcast i8* %u29 to %struct.B
	%u28 = call i32 @g(i32 1, i32 %u30)
	%u31 = call i8* @malloc()
	%u32 = bitcast i8* %u31 to %struct.B
	%u27 = call %struct.A @f(i32 %u28, i32 %u32)
	%u34 = call i8* @malloc()
	%u35 = bitcast i8* %u34 to %struct.B
	%u33 = call %struct.A @f(i32 2, i32 %u35)
	%u36 = getelementptr %struct.A* %u33, i1 0, i32 0
	%u37 = load i32* %u36
	call void @printf_newline(i32 %u37)
	%u38 = call i32 @foo(i32 2)
	call void @printf_newline(i32 %u38)
	store i32 0, i32* %_retval_
	br label %LU9
LU9:
	%u39 = load i32* %_retval_
	ret i32 %u39
}

declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare i32 @read()
