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
	br i1 %u1, label %LU2, label %LU3
LU2:
	br label %LU0
LU3:
	br label %LU4
LU0:
	ret void
LU4:
	%u2 = call i8* @malloc()
	%u3 = bitcast i8* %u2 to %struct.foo*
	store %struct.foo* %u3, %struct.foo** %unused
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
<<<<<<< HEAD
	%u6 = load i32* %x
	%u7 = load i32* %y
	%u8 = add i32 %u6, %u7
	store i32 %u8, i32* %_retval_
	br label %LU5
LU5:
	%u9 = load i32* %_retval_
	ret i32 %u9
=======
	%u7 = load i32* %x
	%u8 = load i32* %y
	%u9 = add i32 %u7, %u8
	store i32 %u9, i32* %_retval_
	br label %LU5
LU5:
	%u10 = load i32* %_retval_
	ret i32 %u10
>>>>>>> 3dfdf054401d1786cce1803d2175e91778c54b9b
}

define void @domath(i32 %_P_num)
{
LU8:
	%math1 = alloca %struct.foo*
	%math2 = alloca %struct.foo*
	%tmp = alloca i32
	%num = alloca i32
	store i32 %_P_num, i32* %num
<<<<<<< HEAD
	%u10 = call i8* @malloc()
	%u11 = bitcast i8* %u10 to %struct.foo*
	store %struct.foo* %u11, %struct.foo** %math1
	%u12 = call i8* @malloc()
	%u13 = bitcast i8* %u12 to %struct.simple*
	%u14 = load %struct.foo** %math1
	%u15 = getelementptr %struct.foo* %u14, i1 0, i32 0
	store %struct.simple* %u13, %struct.simple** %u16
	%u17 = call i8* @malloc()
	%u18 = bitcast i8* %u17 to %struct.foo*
	store %struct.foo* %u18, %struct.foo** %math2
	%u19 = call i8* @malloc()
	%u20 = bitcast i8* %u19 to %struct.simple*
	%u21 = load %struct.foo** %math2
	%u22 = getelementptr %struct.foo* %u21, i1 0, i32 0
	store %struct.simple* %u20, %struct.simple** %u23
	%u24 = load i32* %num
	%u25 = load %struct.foo** %math1
	%u26 = getelementptr %struct.foo* %u25, i1 0, i32 0
	store i32 %u24, i32* %u27
	%u28 = load %struct.foo** %math2
	%u29 = getelementptr %struct.foo* %u28, i1 0, i32 0
	store i32 3, i32* %u30
	%u31 = load %struct.foo** %math1
	%u32 = getelementptr %struct.foo* %u31, i1 0, i32 0
	%u33 = load i32* %u32
	%u34 = load %struct.foo** %math1
	%u35 = getelementptr %struct.foo* %u34, i1 0, i32 0
	%u36 = load %struct.simple** %u35
	%u37 = getelementptr %struct.simple* %u36, i1 0, i32 0
	store i32 %u33, i32* %u38
	%u39 = load %struct.foo** %math2
	%u40 = getelementptr %struct.foo* %u39, i1 0, i32 0
	%u41 = load i32* %u40
	%u42 = load %struct.foo** %math2
	%u43 = getelementptr %struct.foo* %u42, i1 0, i32 0
	%u44 = load %struct.simple** %u43
	%u45 = getelementptr %struct.simple* %u44, i1 0, i32 0
	store i32 %u41, i32* %u46
	%u47 = load i32* %num
	%u48 = icmp sgt i32 %u47, 0
	br i1 %u48, label %LU9, label %LU10
LU9:
	%u49 = load %struct.foo** %math1
	%u50 = getelementptr %struct.foo* %u49, i1 0, i32 0
	%u51 = load i32* %u50
	%u52 = load %struct.foo** %math2
	%u53 = getelementptr %struct.foo* %u52, i1 0, i32 0
	%u54 = load i32* %u53
	%u55 = mul i32 %u51, %u54
	store i32 %u55, i32* %tmp
	%u56 = load i32* %tmp
	%u57 = load %struct.foo** %math1
	%u58 = getelementptr %struct.foo* %u57, i1 0, i32 0
	%u59 = load %struct.simple** %u58
	%u60 = getelementptr %struct.simple* %u59, i1 0, i32 0
	%u61 = load i32* %u60
	%u62 = mul i32 %u56, %u61
	%u63 = load %struct.foo** %math2
	%u64 = getelementptr %struct.foo* %u63, i1 0, i32 0
	%u65 = load i32* %u64
	%u66 = sdiv i32 %u62, %u65
	store i32 %u66, i32* %tmp
	%u68 = load %struct.foo** %math2
	%u69 = getelementptr %struct.foo* %u68, i1 0, i32 0
	%u70 = load %struct.simple** %u69
	%u71 = getelementptr %struct.simple* %u70, i1 0, i32 0
	%u72 = load i32* %u71
	%u73 = load %struct.foo** %math1
	%u74 = getelementptr %struct.foo* %u73, i1 0, i32 0
	%u75 = load i32* %u74
	%u67 = call i32 @add(i32 %u72, i32 %u75)
	store i32 %u67, i32* %tmp
	%u76 = load %struct.foo** %math2
	%u77 = getelementptr %struct.foo* %u76, i1 0, i32 0
	%u78 = load i32* %u77
	%u79 = load %struct.foo** %math1
	%u80 = getelementptr %struct.foo* %u79, i1 0, i32 0
	%u81 = load i32* %u80
	%u82 = sub i32 %u78, %u81
	store i32 %u82, i32* %tmp
	%u83 = load i32* %num
	%u84 = sub i32 %u83, 1
	store i32 %u84, i32* %num
	%u85 = load i32* %num
	%u86 = icmp sgt i32 %u85, 0
	br i1 %u86, label %LU9, label %LU10
LU10:
	%u87 = load %struct.foo** %math1
	call void @free(%struct.foo* %u87)
	%u88 = load %struct.foo** %math2
	call void @free(%struct.foo* %u88)
=======
	%u11 = call i8* @malloc()
	%u12 = bitcast i8* %u11 to %struct.foo
	store i32 %u12, %struct.foo* %math1
	%u13 = call i8* @malloc()
	%u14 = bitcast i8* %u13 to %struct.simple
	%u15 = load %struct.foo* %math1
	%u16 = getelementptr %struct.foo* %u15, i1 0, i32 0
	%u17 = load %struct.simple* %u16
	store i32 %u14, %struct.simple* %u17
	%u18 = call i8* @malloc()
	%u19 = bitcast i8* %u18 to %struct.foo
	store i32 %u19, %struct.foo* %math2
	%u20 = call i8* @malloc()
	%u21 = bitcast i8* %u20 to %struct.simple
	%u22 = load %struct.foo* %math2
	%u23 = getelementptr %struct.foo* %u22, i1 0, i32 0
	%u24 = load %struct.simple* %u23
	store i32 %u21, %struct.simple* %u24
	%u25 = load i32* %num
	%u26 = load %struct.foo* %math1
	%u27 = getelementptr %struct.foo* %u26, i1 0, i32 0
	%u28 = load i32* %u27
	store i32 %u25, i32* %u28
	%u29 = load %struct.foo* %math2
	%u30 = getelementptr %struct.foo* %u29, i1 0, i32 0
	%u31 = load i32* %u30
	store i32 3, i32* %u31
	%u32 = load %struct.foo* %math1
	%u33 = getelementptr %struct.foo* %u32, i1 0, i32 0
	%u34 = load i32* %u33
	%u35 = load %struct.foo* %math1
	%u36 = getelementptr %struct.foo* %u35, i1 0, i32 0
	%u37 = load %struct.simple* %u36
	%u38 = getelementptr %struct.simple* %u37, i1 0, i32 0
	%u39 = load i32* %u38
	store i32 %u34, i32* %u39
	%u40 = load %struct.foo* %math2
	%u41 = getelementptr %struct.foo* %u40, i1 0, i32 0
	%u42 = load i32* %u41
	%u43 = load %struct.foo* %math2
	%u44 = getelementptr %struct.foo* %u43, i1 0, i32 0
	%u45 = load %struct.simple* %u44
	%u46 = getelementptr %struct.simple* %u45, i1 0, i32 0
	%u47 = load i32* %u46
	store i32 %u42, i32* %u47
	%u48 = load i32* %num
	%u49 = icmp sgt i32 %u48, 0
	br i1 %u49, label %LU9, label %LU10
LU9:
	%u50 = load %struct.foo* %math1
	%u51 = getelementptr %struct.foo* %u50, i1 0, i32 0
	%u52 = load i32* %u51
	%u53 = load %struct.foo* %math2
	%u54 = getelementptr %struct.foo* %u53, i1 0, i32 0
	%u55 = load i32* %u54
	%u56 = mul i32 %u52, %u55
	store i32 %u56, i32* %tmp
	%u57 = load i32* %tmp
	%u58 = load %struct.foo* %math1
	%u59 = getelementptr %struct.foo* %u58, i1 0, i32 0
	%u60 = load %struct.simple* %u59
	%u61 = getelementptr %struct.simple* %u60, i1 0, i32 0
	%u62 = load i32* %u61
	%u63 = mul i32 %u57, %u62
	%u64 = load %struct.foo* %math2
	%u65 = getelementptr %struct.foo* %u64, i1 0, i32 0
	%u66 = load i32* %u65
	%u67 = sdiv i32 %u63, %u66
	store i32 %u67, i32* %tmp
	%u69 = load %struct.foo* %math2
	%u70 = getelementptr %struct.foo* %u69, i1 0, i32 0
	%u71 = load %struct.simple* %u70
	%u72 = getelementptr %struct.simple* %u71, i1 0, i32 0
	%u73 = load i32* %u72
	%u74 = load %struct.foo* %math1
	%u75 = getelementptr %struct.foo* %u74, i1 0, i32 0
	%u76 = load i32* %u75
	%u68 = call i32 @add(i32 %u73, i32 %u76)
	store i32 %u68, i32* %tmp
	%u77 = load %struct.foo* %math2
	%u78 = getelementptr %struct.foo* %u77, i1 0, i32 0
	%u79 = load i32* %u78
	%u80 = load %struct.foo* %math1
	%u81 = getelementptr %struct.foo* %u80, i1 0, i32 0
	%u82 = load i32* %u81
	%u83 = sub i32 %u79, %u82
	store i32 %u83, i32* %tmp
	%u84 = load i32* %num
	%u85 = sub i32 %u84, 1
	store i32 %u85, i32* %num
	%u86 = load i32* %num
	%u87 = icmp sgt i32 %u86, 0
	br i1 %u87, label %LU9, label %LU10
LU10:
	%u88 = load %struct.foo* %math1
	call void @free(%struct.foo %u88)
	%u89 = load %struct.foo* %math2
	call void @free(%struct.foo %u89)
>>>>>>> 3dfdf054401d1786cce1803d2175e91778c54b9b
	br label %LU7
LU7:
	ret void
}

define void @objinstantiation(i32 %_P_num)
{
LU12:
<<<<<<< HEAD
	%tmp = alloca %struct.foo*
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%u89 = load i32* %num
	%u90 = icmp sgt i32 %u89, 0
	br i1 %u90, label %LU13, label %LU14
LU13:
	%u91 = call i8* @malloc()
	%u92 = bitcast i8* %u91 to %struct.foo*
	store %struct.foo* %u92, %struct.foo** %tmp
	%u93 = load %struct.foo** %tmp
	call void @free(%struct.foo* %u93)
	%u94 = load i32* %num
	%u95 = sub i32 %u94, 1
	store i32 %u95, i32* %num
	%u96 = load i32* %num
	%u97 = icmp sgt i32 %u96, 0
	br i1 %u97, label %LU13, label %LU14
=======
	%_retval_ = alloca i1
	%tmp = alloca %struct.foo
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%u90 = load i32* %num
	%u91 = icmp sgt i32 %u90, 0
	br i1 %u91, label %LU13, label %LU14
LU13:
	%u92 = call i8* @malloc()
	%u93 = bitcast i8* %u92 to %struct.foo
	store i32 %u93, %struct.foo* %tmp
	%u94 = load %struct.foo* %tmp
	call void @free(%struct.foo %u94)
	%u95 = load i32* %num
	%u96 = sub i32 %u95, 1
	store i32 %u96, i32* %num
	%u97 = load i32* %num
	%u98 = icmp sgt i32 %u97, 0
	br i1 %u98, label %LU13, label %LU14
>>>>>>> 3dfdf054401d1786cce1803d2175e91778c54b9b
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
<<<<<<< HEAD
	%u98 = load i32* %m
	%u99 = icmp eq i32 %u98, 0
	br i1 %u99, label %LU17, label %LU18
LU17:
	%u100 = load i32* %n
	%u101 = add i32 %u100, 1
	store i32 %u101, i32* %_retval_
=======
	%u99 = load i32* %m
	%u100 = icmp eq i32 %u99, 0
	br i1 %u100, label %LU17, label %LU18
LU17:
	%u101 = load i32* %n
	%u102 = add i32 %u101, 1
	store i32 %u102, i32* %_retval_
>>>>>>> 3dfdf054401d1786cce1803d2175e91778c54b9b
	br label %LU15
LU18:
	br label %LU19
LU15:
<<<<<<< HEAD
	%u114 = load i32* %_retval_
	ret i32 %u114
LU19:
	%u102 = load i32* %n
	%u103 = icmp eq i32 %u102, 0
	br i1 %u103, label %LU20, label %LU21
LU22:
	br label %LU15
LU20:
	%u105 = load i32* %m
	%u106 = sub i32 %u105, 1
	%u104 = call i32 @ackermann(i32 %u106, i32 1)
	store i32 %u104, i32* %_retval_
	br label %LU15
LU21:
	%u108 = load i32* %m
	%u109 = sub i32 %u108, 1
	%u111 = load i32* %m
	%u112 = load i32* %n
	%u113 = sub i32 %u112, 1
	%u110 = call i32 @ackermann(i32 %u111, i32 %u113)
	%u107 = call i32 @ackermann(i32 %u109, i32 %u110)
	store i32 %u107, i32* %_retval_
=======
	%u115 = load i32* %_retval_
	ret i32 %u115
LU19:
	%u103 = load i32* %n
	%u104 = icmp eq i32 %u103, 0
	br i1 %u104, label %LU20, label %LU21
LU22:
	br label %LU15
LU20:
	%u106 = load i32* %m
	%u107 = sub i32 %u106, 1
	%u105 = call i32 @ackermann(i32 %u107, i32 1)
	store i32 %u105, i32* %_retval_
	br label %LU15
LU21:
	%u109 = load i32* %m
	%u110 = sub i32 %u109, 1
	%u112 = load i32* %m
	%u113 = load i32* %n
	%u114 = sub i32 %u113, 1
	%u111 = call i32 @ackermann(i32 %u112, i32 %u114)
	%u108 = call i32 @ackermann(i32 %u110, i32 %u111)
	store i32 %u108, i32* %_retval_
>>>>>>> 3dfdf054401d1786cce1803d2175e91778c54b9b
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
<<<<<<< HEAD
	%u115 = call i32 @read()
	store i32 %u115, i32* %a
	%u116 = call i32 @read()
	store i32 %u116, i32* %b
	%u117 = call i32 @read()
	store i32 %u117, i32* %c
	%u118 = call i32 @read()
	store i32 %u118, i32* %d
	%u119 = call i32 @read()
	store i32 %u119, i32* %e
	%u120 = load i32* %a
	call void @tailrecursive(i32 %u120)
	%u121 = load i32* %a
	call void @printf_newline(i32 %u121)
	%u122 = load i32* %b
	call void @domath(i32 %u122)
	%u123 = load i32* %b
	call void @printf_newline(i32 %u123)
	%u124 = load i32* %c
	call void @objinstantiation(i32 %u124)
	%u125 = load i32* %c
	call void @printf_newline(i32 %u125)
	%u127 = load i32* %d
	%u128 = load i32* %e
	%u126 = call i32 @ackermann(i32 %u127, i32 %u128)
	call void @printf_newline(i32 %u126)
	store i32 0, i32* %_retval_
	br label %LU23
LU23:
	%u129 = load i32* %_retval_
	ret i32 %u129
=======
	%u116 = call i32 @read()
	store i32 %u116, i32* %a
	%u117 = call i32 @read()
	store i32 %u117, i32* %b
	%u118 = call i32 @read()
	store i32 %u118, i32* %c
	%u119 = call i32 @read()
	store i32 %u119, i32* %d
	%u120 = call i32 @read()
	store i32 %u120, i32* %e
	%u122 = load i32* %a
	%u121 = call void @tailrecursive(i32 %u122)
	%u123 = load i32* %a
	call void @printf_newline(i32 %u123)
	%u125 = load i32* %b
	%u124 = call void @domath(i32 %u125)
	%u126 = load i32* %b
	call void @printf_newline(i32 %u126)
	%u128 = load i32* %c
	%u127 = call void @objinstantiation(i32 %u128)
	%u129 = load i32* %c
	call void @printf_newline(i32 %u129)
	%u131 = load i32* %d
	%u132 = load i32* %e
	%u130 = call i32 @ackermann(i32 %u131, i32 %u132)
	call void @printf_newline(i32 %u130)
	store i32 0, i32* %_retval_
	br label %LU23
LU23:
	%u133 = load i32* %_retval_
	ret i32 %u133
>>>>>>> 3dfdf054401d1786cce1803d2175e91778c54b9b
}

declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare i32 @read()
