target triple="i686"
%struct.simple = type {i32}
%struct.foo = type {i32, i32, %struct.simple*}

@globalfoo = common global %struct.foo* null, align 4

define void @tailrecursive(i32 %_P_num)
{
LU1:
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
	%u4 = load i32* %num
	%u5 = sub i32 %u4, 1
	call void @tailrecursive(i32 %u5)
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
	%u6 = load i32* %x
	%u7 = load i32* %y
	%u8 = add i32 %u6, %u7
	store i32 %u8, i32* %_retval_
	br label %LU5
LU5:
	%u9 = load i32* %_retval_
	ret i32 %u9
}

define void @domath(i32 %_P_num)
{
LU8:
	%math1 = alloca %struct.foo*
	%math2 = alloca %struct.foo*
	%tmp = alloca i32
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%u10 = call i8* @malloc(i32 12)
	%u11 = bitcast i8* %u10 to %struct.foo*
	store %struct.foo* %u11, %struct.foo** %math1
	%u12 = call i8* @malloc(i32 4)
	%u13 = bitcast i8* %u12 to %struct.simple*
	%u14 = load %struct.foo** %math1
	%u15 = getelementptr %struct.foo* %u14, i1 0, i32 2
	store %struct.simple* %u13, %struct.simple** %u15
	%u16 = call i8* @malloc(i32 12)
	%u17 = bitcast i8* %u16 to %struct.foo*
	store %struct.foo* %u17, %struct.foo** %math2
	%u18 = call i8* @malloc(i32 4)
	%u19 = bitcast i8* %u18 to %struct.simple*
	%u20 = load %struct.foo** %math2
	%u21 = getelementptr %struct.foo* %u20, i1 0, i32 2
	store %struct.simple* %u19, %struct.simple** %u21
	%u22 = load i32* %num
	%u23 = load %struct.foo** %math1
	%u24 = getelementptr %struct.foo* %u23, i1 0, i32 0
	store i32 %u22, i32* %u24
	%u25 = load %struct.foo** %math2
	%u26 = getelementptr %struct.foo* %u25, i1 0, i32 0
	store i32 3, i32* %u26
	%u27 = load %struct.foo** %math1
	%u28 = getelementptr %struct.foo* %u27, i1 0, i32 0
	%u29 = load i32* %u28
	%u30 = load %struct.foo** %math1
	%u31 = getelementptr %struct.foo* %u30, i1 0, i32 2
	%u32 = load %struct.simple** %u31
	%u33 = getelementptr %struct.simple* %u32, i1 0, i32 0
	store i32 %u29, i32* %u33
	%u34 = load %struct.foo** %math2
	%u35 = getelementptr %struct.foo* %u34, i1 0, i32 0
	%u36 = load i32* %u35
	%u37 = load %struct.foo** %math2
	%u38 = getelementptr %struct.foo* %u37, i1 0, i32 2
	%u39 = load %struct.simple** %u38
	%u40 = getelementptr %struct.simple* %u39, i1 0, i32 0
	store i32 %u36, i32* %u40
	%u41 = load i32* %num
	%u42 = icmp sgt i32 %u41, 0
	%u43 = zext i1 %u42 to i32
	%u44 = trunc i32 %u43 to i1
	br i1 %u44, label %LU9, label %LU10
LU9:
	%u45 = load %struct.foo** %math1
	%u46 = getelementptr %struct.foo* %u45, i1 0, i32 0
	%u47 = load i32* %u46
	%u48 = load %struct.foo** %math2
	%u49 = getelementptr %struct.foo* %u48, i1 0, i32 0
	%u50 = load i32* %u49
	%u51 = mul i32 %u47, %u50
	store i32 %u51, i32* %tmp
	%u52 = load i32* %tmp
	%u53 = load %struct.foo** %math1
	%u54 = getelementptr %struct.foo* %u53, i1 0, i32 2
	%u55 = load %struct.simple** %u54
	%u56 = getelementptr %struct.simple* %u55, i1 0, i32 0
	%u57 = load i32* %u56
	%u58 = mul i32 %u52, %u57
	%u59 = load %struct.foo** %math2
	%u60 = getelementptr %struct.foo* %u59, i1 0, i32 0
	%u61 = load i32* %u60
	%u62 = sdiv i32 %u58, %u61
	store i32 %u62, i32* %tmp
	%u64 = load %struct.foo** %math2
	%u65 = getelementptr %struct.foo* %u64, i1 0, i32 2
	%u66 = load %struct.simple** %u65
	%u67 = getelementptr %struct.simple* %u66, i1 0, i32 0
	%u68 = load i32* %u67
	%u69 = load %struct.foo** %math1
	%u70 = getelementptr %struct.foo* %u69, i1 0, i32 0
	%u71 = load i32* %u70
	%u63 = call i32 @add(i32 %u68, i32 %u71)
	store i32 %u63, i32* %tmp
	%u72 = load %struct.foo** %math2
	%u73 = getelementptr %struct.foo* %u72, i1 0, i32 0
	%u74 = load i32* %u73
	%u75 = load %struct.foo** %math1
	%u76 = getelementptr %struct.foo* %u75, i1 0, i32 0
	%u77 = load i32* %u76
	%u78 = sub i32 %u74, %u77
	store i32 %u78, i32* %tmp
	%u79 = load i32* %num
	%u80 = sub i32 %u79, 1
	store i32 %u80, i32* %num
	%u81 = load i32* %num
	%u82 = icmp sgt i32 %u81, 0
	%u83 = zext i1 %u82 to i32
	%u84 = trunc i32 %u83 to i1
	br i1 %u84, label %LU9, label %LU10
LU10:
	%u85 = load %struct.foo** %math1
	%u86 = bitcast %struct.foo* %u85 to i8*
	call void @free(i8* %u86)
	%u87 = load %struct.foo** %math2
	%u88 = bitcast %struct.foo* %u87 to i8*
	call void @free(i8* %u88)
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
	%u89 = load i32* %num
	%u90 = icmp sgt i32 %u89, 0
	%u91 = zext i1 %u90 to i32
	%u92 = trunc i32 %u91 to i1
	br i1 %u92, label %LU13, label %LU14
LU13:
	%u93 = call i8* @malloc(i32 12)
	%u94 = bitcast i8* %u93 to %struct.foo*
	store %struct.foo* %u94, %struct.foo** %tmp
	%u95 = load %struct.foo** %tmp
	%u96 = bitcast %struct.foo* %u95 to i8*
	call void @free(i8* %u96)
	%u97 = load i32* %num
	%u98 = sub i32 %u97, 1
	store i32 %u98, i32* %num
	%u99 = load i32* %num
	%u100 = icmp sgt i32 %u99, 0
	%u101 = zext i1 %u100 to i32
	%u102 = trunc i32 %u101 to i1
	br i1 %u102, label %LU13, label %LU14
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
	%u103 = load i32* %m
	%u104 = icmp eq i32 %u103, 0
	%u105 = zext i1 %u104 to i32
	%u106 = trunc i32 %u105 to i1
	br i1 %u106, label %LU17, label %LU18
LU17:
	%u107 = load i32* %n
	%u108 = add i32 %u107, 1
	store i32 %u108, i32* %_retval_
	br label %LU15
LU18:
	br label %LU19
LU15:
	%u123 = load i32* %_retval_
	ret i32 %u123
LU19:
	%u109 = load i32* %n
	%u110 = icmp eq i32 %u109, 0
	%u111 = zext i1 %u110 to i32
	%u112 = trunc i32 %u111 to i1
	br i1 %u112, label %LU20, label %LU21
LU22:
	br label %LU15
LU20:
	%u114 = load i32* %m
	%u115 = sub i32 %u114, 1
	%u113 = call i32 @ackermann(i32 %u115, i32 1)
	store i32 %u113, i32* %_retval_
	br label %LU15
LU21:
	%u117 = load i32* %m
	%u118 = sub i32 %u117, 1
	%u120 = load i32* %m
	%u121 = load i32* %n
	%u122 = sub i32 %u121, 1
	%u119 = call i32 @ackermann(i32 %u120, i32 %u122)
	%u116 = call i32 @ackermann(i32 %u118, i32 %u119)
	store i32 %u116, i32* %_retval_
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
	%u124 = call i32 @read()
	store i32 %u124, i32* %a
	%u125 = call i32 @read()
	store i32 %u125, i32* %b
	%u126 = call i32 @read()
	store i32 %u126, i32* %c
	%u127 = call i32 @read()
	store i32 %u127, i32* %d
	%u128 = call i32 @read()
	store i32 %u128, i32* %e
	%u129 = load i32* %a
	call void @tailrecursive(i32 %u129)
	%u130 = load i32* %a
	call void @printf_newline(i32 %u130)
	%u131 = load i32* %b
	call void @domath(i32 %u131)
	%u132 = load i32* %b
	call void @printf_newline(i32 %u132)
	%u133 = load i32* %c
	call void @objinstantiation(i32 %u133)
	%u134 = load i32* %c
	call void @printf_newline(i32 %u134)
	%u136 = load i32* %d
	%u137 = load i32* %e
	%u135 = call i32 @ackermann(i32 %u136, i32 %u137)
	call void @printf_newline(i32 %u135)
	store i32 0, i32* %_retval_
	br label %LU23
LU23:
	%u138 = load i32* %_retval_
	ret i32 %u138
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
