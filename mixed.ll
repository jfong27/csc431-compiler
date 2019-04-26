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
	store %struct.simple* %u15, %struct.simple** %u18
	%u19 = call i8* @malloc(i32 12)
	%u20 = bitcast i8* %u19 to %struct.foo*
	store %struct.foo* %u20, %struct.foo** %math2
	%u21 = call i8* @malloc(i32 4)
	%u22 = bitcast i8* %u21 to %struct.simple*
	%u23 = load %struct.foo** %math2
	%u24 = getelementptr %struct.foo* %u23, i1 0, i32 2
	store %struct.simple* %u22, %struct.simple** %u25
	%u26 = load i32* %num
	%u27 = load %struct.foo** %math1
	%u28 = getelementptr %struct.foo* %u27, i1 0, i32 0
	store i32 %u26, i32* %u29
	%u30 = load %struct.foo** %math2
	%u31 = getelementptr %struct.foo* %u30, i1 0, i32 0
	store i32 3, i32* %u32
	%u33 = load %struct.foo** %math1
	%u34 = getelementptr %struct.foo* %u33, i1 0, i32 0
	%u35 = load i32* %u34
	%u36 = load %struct.foo** %math1
	%u37 = getelementptr %struct.foo* %u36, i1 0, i32 0
	%u38 = load %struct.simple** %u37
	%u39 = getelementptr %struct.simple* %u38, i1 0, i32 0
	store i32 %u35, i32* %u40
	%u41 = load %struct.foo** %math2
	%u42 = getelementptr %struct.foo* %u41, i1 0, i32 0
	%u43 = load i32* %u42
	%u44 = load %struct.foo** %math2
	%u45 = getelementptr %struct.foo* %u44, i1 0, i32 0
	%u46 = load %struct.simple** %u45
	%u47 = getelementptr %struct.simple* %u46, i1 0, i32 0
	store i32 %u43, i32* %u48
	%u49 = load i32* %num
	%u50 = icmp sgt i32 %u49, 0
	%u51 = zext i1 %u50 to i32
	br i1 %u51, label %LU9, label %LU10
LU9:
	%u52 = load %struct.foo** %math1
	%u53 = getelementptr %struct.foo* %u52, i1 0, i32 0
	%u54 = load i32* %u53
	%u55 = load %struct.foo** %math2
	%u56 = getelementptr %struct.foo* %u55, i1 0, i32 0
	%u57 = load i32* %u56
	%u58 = mul i32 %u54, %u57
	store i32 %u58, i32* %tmp
	%u59 = load i32* %tmp
	%u60 = load %struct.foo** %math1
	%u61 = getelementptr %struct.foo* %u60, i1 0, i32 0
	%u62 = load %struct.simple** %u61
	%u63 = getelementptr %struct.simple* %u62, i1 0, i32 0
	%u64 = load i32* %u63
	%u65 = mul i32 %u59, %u64
	%u66 = load %struct.foo** %math2
	%u67 = getelementptr %struct.foo* %u66, i1 0, i32 0
	%u68 = load i32* %u67
	%u69 = sdiv i32 %u65, %u68
	store i32 %u69, i32* %tmp
	%u71 = load %struct.foo** %math2
	%u72 = getelementptr %struct.foo* %u71, i1 0, i32 0
	%u73 = load %struct.simple** %u72
	%u74 = getelementptr %struct.simple* %u73, i1 0, i32 0
	%u75 = load i32* %u74
	%u76 = load %struct.foo** %math1
	%u77 = getelementptr %struct.foo* %u76, i1 0, i32 0
	%u78 = load i32* %u77
	%u70 = call i32 @add(i32 %u75, i32 %u78)
	store i32 %u70, i32* %tmp
	%u79 = load %struct.foo** %math2
	%u80 = getelementptr %struct.foo* %u79, i1 0, i32 0
	%u81 = load i32* %u80
	%u82 = load %struct.foo** %math1
	%u83 = getelementptr %struct.foo* %u82, i1 0, i32 0
	%u84 = load i32* %u83
	%u85 = sub i32 %u81, %u84
	store i32 %u85, i32* %tmp
	%u86 = load i32* %num
	%u87 = sub i32 %u86, 1
	store i32 %u87, i32* %num
	%u88 = load i32* %num
	%u89 = icmp sgt i32 %u88, 0
	%u90 = zext i1 %u89 to i32
	br i1 %u90, label %LU9, label %LU10
LU10:
	%u91 = load %struct.foo** %math1
	call void @free(%struct.foo* %u91)
	%u92 = load %struct.foo** %math2
	call void @free(%struct.foo* %u92)
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
	%u93 = load i32* %num
	%u94 = icmp sgt i32 %u93, 0
	%u95 = zext i1 %u94 to i32
	br i1 %u95, label %LU13, label %LU14
LU13:
	%u96 = call i8* @malloc(i32 12)
	%u97 = bitcast i8* %u96 to %struct.foo*
	store %struct.foo* %u97, %struct.foo** %tmp
	%u98 = load %struct.foo** %tmp
	call void @free(%struct.foo* %u98)
	%u99 = load i32* %num
	%u100 = sub i32 %u99, 1
	store i32 %u100, i32* %num
	%u101 = load i32* %num
	%u102 = icmp sgt i32 %u101, 0
	%u103 = zext i1 %u102 to i32
	br i1 %u103, label %LU13, label %LU14
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
	%u104 = load i32* %m
	%u105 = icmp eq i32 %u104, 0
	%u106 = zext i1 %u105 to i32
	%u107 = trunc i32 %u106 to i1
	br i1 %u107, label %LU17, label %LU18
LU17:
	%u108 = load i32* %n
	%u109 = add i32 %u108, 1
	store i32 %u109, i32* %_retval_
	br label %LU15
LU18:
	br label %LU19
LU15:
	%u124 = load i32* %_retval_
	ret i32 %u124
LU19:
	%u110 = load i32* %n
	%u111 = icmp eq i32 %u110, 0
	%u112 = zext i1 %u111 to i32
	%u113 = trunc i32 %u112 to i1
	br i1 %u113, label %LU20, label %LU21
LU22:
	br label %LU15
LU20:
	%u115 = load i32* %m
	%u116 = sub i32 %u115, 1
	%u114 = call i32 @ackermann(i32 %u116, i32 1)
	store i32 %u114, i32* %_retval_
	br label %LU15
LU21:
	%u118 = load i32* %m
	%u119 = sub i32 %u118, 1
	%u121 = load i32* %m
	%u122 = load i32* %n
	%u123 = sub i32 %u122, 1
	%u120 = call i32 @ackermann(i32 %u121, i32 %u123)
	%u117 = call i32 @ackermann(i32 %u119, i32 %u120)
	store i32 %u117, i32* %_retval_
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
	%u125 = call i32 @read()
	store i32 %u125, i32* %a
	%u126 = call i32 @read()
	store i32 %u126, i32* %b
	%u127 = call i32 @read()
	store i32 %u127, i32* %c
	%u128 = call i32 @read()
	store i32 %u128, i32* %d
	%u129 = call i32 @read()
	store i32 %u129, i32* %e
	%u130 = load i32* %a
	call void @tailrecursive(i32 %u130)
	%u131 = load i32* %a
	call void @printf_newline(i32 %u131)
	%u132 = load i32* %b
	call void @domath(i32 %u132)
	%u133 = load i32* %b
	call void @printf_newline(i32 %u133)
	%u134 = load i32* %c
	call void @objinstantiation(i32 %u134)
	%u135 = load i32* %c
	call void @printf_newline(i32 %u135)
	%u137 = load i32* %d
	%u138 = load i32* %e
	%u136 = call i32 @ackermann(i32 %u137, i32 %u138)
	call void @printf_newline(i32 %u136)
	store i32 0, i32* %_retval_
	br label %LU23
LU23:
	%u139 = load i32* %_retval_
	ret i32 %u139
}

declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare i32 @read()
