target triple="i686"
%struct.IntHolder = type {i32}

@interval = common global i32 0, align 4
@end = common global i32 0, align 4

define i32 @multBy4xTimes(%struct.IntHolder* %_P_num, i32 %_P_timesLeft)
{
LU1:
	%_retval_ = alloca i32
	%num = alloca %struct.IntHolder*
	store %struct.IntHolder* %_P_num, %struct.IntHolder** %num
	%timesLeft = alloca i32
	store i32 %_P_timesLeft, i32* %timesLeft
	%u0 = load i32* %timesLeft
	%u1 = icmp sle i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %LU2, label %LU3
LU2:
	%u4 = load %struct.IntHolder** %num
	%u5 = getelementptr %struct.IntHolder* %u4, i1 0, i32 0
	%u6 = load i32* %u5
	store i32 %u6, i32* %_retval_
	br label %LU0
LU3:
	br label %LU4
LU0:
	%u20 = load i32* %_retval_
	ret i32 %u20
LU4:
	%u7 = load %struct.IntHolder** %num
	%u8 = getelementptr %struct.IntHolder* %u7, i1 0, i32 0
	%u9 = load i32* %u8
	%u10 = mul i32 4, %u9
	%u11 = load %struct.IntHolder** %num
	%u12 = getelementptr %struct.IntHolder* %u11, i1 0, i32 0
	store i32 %u10, i32* %u12
	%u14 = load %struct.IntHolder** %num
	%u15 = load i32* %timesLeft
	%u16 = sub i32 %u15, 1
	%u13 = call i32 @multBy4xTimes(%struct.IntHolder* %u14, i32 %u16)
	%u17 = load %struct.IntHolder** %num
	%u18 = getelementptr %struct.IntHolder* %u17, i1 0, i32 0
	%u19 = load i32* %u18
	store i32 %u19, i32* %_retval_
	br label %LU0
}

define void @divideBy8(%struct.IntHolder* %_P_num)
{
LU6:
	%num = alloca %struct.IntHolder*
	store %struct.IntHolder* %_P_num, %struct.IntHolder** %num
	%u21 = load %struct.IntHolder** %num
	%u22 = getelementptr %struct.IntHolder* %u21, i1 0, i32 0
	%u23 = load i32* %u22
	%u24 = sdiv i32 %u23, 2
	%u25 = load %struct.IntHolder** %num
	%u26 = getelementptr %struct.IntHolder* %u25, i1 0, i32 0
	store i32 %u24, i32* %u26
	%u27 = load %struct.IntHolder** %num
	%u28 = getelementptr %struct.IntHolder* %u27, i1 0, i32 0
	%u29 = load i32* %u28
	%u30 = sdiv i32 %u29, 2
	%u31 = load %struct.IntHolder** %num
	%u32 = getelementptr %struct.IntHolder* %u31, i1 0, i32 0
	store i32 %u30, i32* %u32
	%u33 = load %struct.IntHolder** %num
	%u34 = getelementptr %struct.IntHolder* %u33, i1 0, i32 0
	%u35 = load i32* %u34
	%u36 = sdiv i32 %u35, 2
	%u37 = load %struct.IntHolder** %num
	%u38 = getelementptr %struct.IntHolder* %u37, i1 0, i32 0
	store i32 %u36, i32* %u38
	br label %LU5
LU5:
	ret void
}

define i32 @main()
{
LU8:
	%_retval_ = alloca i32
	%start = alloca i32
	%countOuter = alloca i32
	%countInner = alloca i32
	%calc = alloca i32
	%tempAnswer = alloca i32
	%tempInterval = alloca i32
	%x = alloca %struct.IntHolder*
	%uselessVar = alloca i32
	%uselessVar2 = alloca i32
	%u39 = call i8* @malloc(i32 4)
	%u40 = bitcast i8* %u39 to %struct.IntHolder*
	store %struct.IntHolder* %u40, %struct.IntHolder** %x
	store i32 1000000, i32* @end
	%u41 = call i32 @read()
	store i32 %u41, i32* %start
	%u42 = call i32 @read()
	store i32 %u42, i32* @interval
	%u43 = load i32* %start
	call void @printf_newline(i32 %u43)
	%u44 = load i32* @interval
	call void @printf_newline(i32 %u44)
	store i32 0, i32* %countOuter
	store i32 0, i32* %countInner
	store i32 0, i32* %calc
	%u45 = load i32* %countOuter
	%u46 = icmp slt i32 %u45, 50
	%u47 = zext i1 %u46 to i32
	%u48 = trunc i32 %u47 to i1
	br i1 %u48, label %LU9, label %LU10
LU9:
	store i32 0, i32* %countInner
	%u49 = load i32* %countInner
	%u50 = load i32* @end
	%u51 = icmp sle i32 %u49, %u50
	%u52 = zext i1 %u51 to i32
	%u53 = trunc i32 %u52 to i1
	br i1 %u53, label %LU11, label %LU12
LU10:
	%u98 = load i32* %countInner
	call void @printf_newline(i32 %u98)
	%u99 = load i32* %calc
	call void @printf_newline(i32 %u99)
	store i32 0, i32* %_retval_
	br label %LU7
LU11:
	%u54 = mul i32 1, 2
	%u55 = mul i32 %u54, 3
	%u56 = mul i32 %u55, 4
	%u57 = mul i32 %u56, 5
	%u58 = mul i32 %u57, 6
	%u59 = mul i32 %u58, 7
	%u60 = mul i32 %u59, 8
	%u61 = mul i32 %u60, 9
	%u62 = mul i32 %u61, 10
	%u63 = mul i32 %u62, 11
	store i32 %u63, i32* %calc
	%u64 = load i32* %countInner
	%u65 = add i32 %u64, 1
	store i32 %u65, i32* %countInner
	%u66 = load i32* %countInner
	%u67 = load %struct.IntHolder** %x
	%u68 = getelementptr %struct.IntHolder* %u67, i1 0, i32 0
	store i32 %u66, i32* %u68
	%u69 = load %struct.IntHolder** %x
	%u70 = getelementptr %struct.IntHolder* %u69, i1 0, i32 0
	%u71 = load i32* %u70
	store i32 %u71, i32* %tempAnswer
	%u73 = load %struct.IntHolder** %x
	%u72 = call i32 @multBy4xTimes(%struct.IntHolder* %u73, i32 2)
	%u74 = load %struct.IntHolder** %x
	call void @divideBy8(%struct.IntHolder* %u74)
	%u75 = load i32* @interval
	%u76 = sub i32 %u75, 1
	store i32 %u76, i32* %tempInterval
	%u77 = load i32* %tempInterval
	%u78 = icmp sle i32 %u77, 0
	%u79 = zext i1 %u78 to i32
	store i32 %u79, i32* %uselessVar
	%u80 = load i32* %tempInterval
	%u81 = icmp sle i32 %u80, 0
	%u82 = zext i1 %u81 to i32
	%u83 = trunc i32 %u82 to i1
	br i1 %u83, label %LU13, label %LU14
LU12:
	%u92 = load i32* %countOuter
	%u93 = add i32 %u92, 1
	store i32 %u93, i32* %countOuter
	%u94 = load i32* %countOuter
	%u95 = icmp slt i32 %u94, 50
	%u96 = zext i1 %u95 to i32
	%u97 = trunc i32 %u96 to i1
	br i1 %u97, label %LU9, label %LU10
LU13:
	store i32 1, i32* %tempInterval
	br label %LU15
LU14:
	br label %LU15
LU15:
	%u84 = load i32* %countInner
	%u85 = load i32* %tempInterval
	%u86 = add i32 %u84, %u85
	store i32 %u86, i32* %countInner
	%u87 = load i32* %countInner
	%u88 = load i32* @end
	%u89 = icmp sle i32 %u87, %u88
	%u90 = zext i1 %u89 to i32
	%u91 = trunc i32 %u90 to i1
	br i1 %u91, label %LU11, label %LU12
LU7:
	%u100 = load i32* %_retval_
	ret i32 %u100
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
