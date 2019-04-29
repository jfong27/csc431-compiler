target triple="i686"
%struct.simple = type {i32}
%struct.foo = type {i32, i32, %struct.simple*}

@globalfoo = common global %struct.foo* null, align 4

define void @tailrecursive(i32 %_P_num)
{
LU1:
	%unused = alloca %struct.foo*
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%u0 = load i32* %num
	%u1 = icmp sle i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %LU2, label %LU3
LU2:
	br label %LU0
LU3:
	br label %LU4
LU0:
	ret void
LU4:
	%u4 = call i8* @malloc(i32 12)
	%u5 = bitcast i8* %u4 to %struct.foo*
	store %struct.foo* %u5, %struct.foo** %unused
	%u6 = load i32* %num
	%u7 = sub i32 %u6, 1
	call void @tailrecursive(i32 %u7)
	br label %LU0
}

define i32 @add(i32 %_P_x, i32 %_P_y)
{
LU6:
	%_retval_ = alloca i32
	%x = alloca i32
	store i32 %_P_x, i32* %x
	%y = alloca i32
	store i32 %_P_y, i32* %y
	%u8 = load i32* %x
	%u9 = load i32* %y
	%u10 = add i32 %u8, %u9
	store i32 %u10, i32* %_retval_
	br label %LU5
LU5:
	%u11 = load i32* %_retval_
	ret i32 %u11
}

define void @domath(i32 %_P_num)
{
LU8:
	%math1 = alloca %struct.foo*
	%math2 = alloca %struct.foo*
	%tmp = alloca i32
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%u12 = call i8* @malloc(i32 12)
	%u13 = bitcast i8* %u12 to %struct.foo*
	store %struct.foo* %u13, %struct.foo** %math1
	%u14 = call i8* @malloc(i32 4)
	%u15 = bitcast i8* %u14 to %struct.simple*
	%u16 = load %struct.foo** %math1
	%u17 = getelementptr %struct.foo* %u16, i1 0, i32 2
	store %struct.simple* %u15, %struct.simple** %u17
	%u18 = call i8* @malloc(i32 12)
	%u19 = bitcast i8* %u18 to %struct.foo*
	store %struct.foo* %u19, %struct.foo** %math2
	%u20 = call i8* @malloc(i32 4)
	%u21 = bitcast i8* %u20 to %struct.simple*
	%u22 = load %struct.foo** %math2
	%u23 = getelementptr %struct.foo* %u22, i1 0, i32 2
	store %struct.simple* %u21, %struct.simple** %u23
	%u24 = load i32* %num
	%u25 = load %struct.foo** %math1
	%u26 = getelementptr %struct.foo* %u25, i1 0, i32 0
	store i32 %u24, i32* %u26
	%u27 = load %struct.foo** %math2
	%u28 = getelementptr %struct.foo* %u27, i1 0, i32 0
	store i32 3, i32* %u28
	%u29 = load %struct.foo** %math1
	%u30 = getelementptr %struct.foo* %u29, i1 0, i32 0
	%u31 = load i32* %u30
	%u32 = load %struct.foo** %math1
	%u33 = getelementptr %struct.foo* %u32, i1 0, i32 2
	%u34 = load %struct.simple** %u33
	%u35 = getelementptr %struct.simple* %u34, i1 0, i32 0
	store i32 %u31, i32* %u35
	%u36 = load %struct.foo** %math2
	%u37 = getelementptr %struct.foo* %u36, i1 0, i32 0
	%u38 = load i32* %u37
	%u39 = load %struct.foo** %math2
	%u40 = getelementptr %struct.foo* %u39, i1 0, i32 2
	%u41 = load %struct.simple** %u40
	%u42 = getelementptr %struct.simple* %u41, i1 0, i32 0
	store i32 %u38, i32* %u42
	%u43 = load i32* %num
	%u44 = icmp sgt i32 %u43, 0
	%u45 = zext i1 %u44 to i32
	%u46 = trunc i32 %u45 to i1
	br i1 %u46, label %LU9, label %LU10
LU9:
	%u47 = load %struct.foo** %math1
	%u48 = getelementptr %struct.foo* %u47, i1 0, i32 0
	%u49 = load i32* %u48
	%u50 = load %struct.foo** %math2
	%u51 = getelementptr %struct.foo* %u50, i1 0, i32 0
	%u52 = load i32* %u51
	%u53 = mul i32 %u49, %u52
	store i32 %u53, i32* %tmp
	%u54 = load i32* %tmp
	%u55 = load %struct.foo** %math1
	%u56 = getelementptr %struct.foo* %u55, i1 0, i32 2
	%u57 = load %struct.simple** %u56
	%u58 = getelementptr %struct.simple* %u57, i1 0, i32 0
	%u59 = load i32* %u58
	%u60 = mul i32 %u54, %u59
	%u61 = load %struct.foo** %math2
	%u62 = getelementptr %struct.foo* %u61, i1 0, i32 0
	%u63 = load i32* %u62
	%u64 = sdiv i32 %u60, %u63
	store i32 %u64, i32* %tmp
	%u66 = load %struct.foo** %math2
	%u67 = getelementptr %struct.foo* %u66, i1 0, i32 2
	%u68 = load %struct.simple** %u67
	%u69 = getelementptr %struct.simple* %u68, i1 0, i32 0
	%u70 = load i32* %u69
	%u71 = load %struct.foo** %math1
	%u72 = getelementptr %struct.foo* %u71, i1 0, i32 0
	%u73 = load i32* %u72
	%u65 = call i32 @add(i32 %u70, i32 %u73)
	store i32 %u65, i32* %tmp
	%u74 = load %struct.foo** %math2
	%u75 = getelementptr %struct.foo* %u74, i1 0, i32 0
	%u76 = load i32* %u75
	%u77 = load %struct.foo** %math1
	%u78 = getelementptr %struct.foo* %u77, i1 0, i32 0
	%u79 = load i32* %u78
	%u80 = sub i32 %u76, %u79
	store i32 %u80, i32* %tmp
	%u81 = load i32* %num
	%u82 = sub i32 %u81, 1
	store i32 %u82, i32* %num
	%u83 = load i32* %num
	%u84 = icmp sgt i32 %u83, 0
	%u85 = zext i1 %u84 to i32
	%u86 = trunc i32 %u85 to i1
	br i1 %u86, label %LU9, label %LU10
LU10:
	%u87 = load %struct.foo** %math1
	%u88 = bitcast %struct.foo* %u87 to i8*
	call void @free(i8* %u88)
	%u89 = load %struct.foo** %math2
	%u90 = bitcast %struct.foo* %u89 to i8*
	call void @free(i8* %u90)
	br label %LU7
LU7:
	ret void
}

define void @objinstantiation(i32 %_P_num)
{
LU12:
	%tmp = alloca %struct.foo*
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%u91 = load i32* %num
	%u92 = icmp sgt i32 %u91, 0
	%u93 = zext i1 %u92 to i32
	%u94 = trunc i32 %u93 to i1
	br i1 %u94, label %LU13, label %LU14
LU13:
	%u95 = call i8* @malloc(i32 12)
	%u96 = bitcast i8* %u95 to %struct.foo*
	store %struct.foo* %u96, %struct.foo** %tmp
	%u97 = load %struct.foo** %tmp
	%u98 = bitcast %struct.foo* %u97 to i8*
	call void @free(i8* %u98)
	%u99 = load i32* %num
	%u100 = sub i32 %u99, 1
	store i32 %u100, i32* %num
	%u101 = load i32* %num
	%u102 = icmp sgt i32 %u101, 0
	%u103 = zext i1 %u102 to i32
	%u104 = trunc i32 %u103 to i1
	br i1 %u104, label %LU13, label %LU14
LU14:
	br label %LU11
LU11:
	ret void
}

define i32 @ackermann(i32 %_P_m, i32 %_P_n)
{
LU16:
	%_retval_ = alloca i32
	%m = alloca i32
	store i32 %_P_m, i32* %m
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%u105 = load i32* %m
	%u106 = icmp eq i32 %u105, 0
	%u107 = zext i1 %u106 to i32
	%u108 = trunc i32 %u107 to i1
	br i1 %u108, label %LU17, label %LU18
LU17:
	%u109 = load i32* %n
	%u110 = add i32 %u109, 1
	store i32 %u110, i32* %_retval_
	br label %LU15
LU18:
	br label %LU19
LU15:
	%u125 = load i32* %_retval_
	ret i32 %u125
LU19:
	%u111 = load i32* %n
	%u112 = icmp eq i32 %u111, 0
	%u113 = zext i1 %u112 to i32
	%u114 = trunc i32 %u113 to i1
	br i1 %u114, label %LU20, label %LU21
LU22:
	br label %LU15
LU20:
	%u116 = load i32* %m
	%u117 = sub i32 %u116, 1
	%u115 = call i32 @ackermann(i32 %u117, i32 1)
	store i32 %u115, i32* %_retval_
	br label %LU15
LU21:
	%u119 = load i32* %m
	%u120 = sub i32 %u119, 1
	%u122 = load i32* %m
	%u123 = load i32* %n
	%u124 = sub i32 %u123, 1
	%u121 = call i32 @ackermann(i32 %u122, i32 %u124)
	%u118 = call i32 @ackermann(i32 %u120, i32 %u121)
	store i32 %u118, i32* %_retval_
	br label %LU15
}

define i32 @main()
{
LU24:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%u126 = call i32 @read()
	store i32 %u126, i32* %a
	%u127 = call i32 @read()
	store i32 %u127, i32* %b
	%u128 = call i32 @read()
	store i32 %u128, i32* %c
	%u129 = call i32 @read()
	store i32 %u129, i32* %d
	%u130 = call i32 @read()
	store i32 %u130, i32* %e
	%u131 = load i32* %a
	call void @tailrecursive(i32 %u131)
	%u132 = load i32* %a
	call void @printf_newline(i32 %u132)
	%u133 = load i32* %b
	call void @domath(i32 %u133)
	%u134 = load i32* %b
	call void @printf_newline(i32 %u134)
	%u135 = load i32* %c
	call void @objinstantiation(i32 %u135)
	%u136 = load i32* %c
	call void @printf_newline(i32 %u136)
	%u138 = load i32* %d
	%u139 = load i32* %e
	%u137 = call i32 @ackermann(i32 %u138, i32 %u139)
	call void @printf_newline(i32 %u137)
	store i32 0, i32* %_retval_
	br label %LU23
LU23:
	%u140 = load i32* %_retval_
	ret i32 %u140
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
