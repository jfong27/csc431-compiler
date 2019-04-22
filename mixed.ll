target triple="i686"
%struct.simple = type {i32}
%struct.foo = type {i32, i32, %struct.simple*}

@globalfoo = common global %struct.foo* null, align 4

define void @tailrecursive(i32 %num)
LU1:
	%_retval_ = alloca i1
	%unused = alloca %struct.foo
	%_P_num = alloca i32
	store i32 %num, i32* %_P_num
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
	%u3 = bitcast i8* %u2 to %struct.foo
	store i32 %u3, %struct.foo* %unused
	%u5 = load i32* %num
	%u6 = sub i32 %u5, 1
	%u4 = call void @tailrecursive(i32 %u6)
}

define i32 @add(i32 %x, i32 %y)
LU6:
	%_retval_ = alloca i32
	%_P_x = alloca i32
	store i32 %x, i32* %_P_x
	%_P_y = alloca i32
	store i32 %y, i32* %_P_y
	%u7 = load i32* %x
	%u8 = load i32* %y
	%u9 = add i32 %u7, %u8
	br label %LU5
LU5:
	ret i32 %u9
}

define void @domath(i32 %num)
LU8:
	%_retval_ = alloca i1
	%math1 = alloca %struct.foo
	%math2 = alloca %struct.foo
	%tmp = alloca i32
	%_P_num = alloca i32
	store i32 %num, i32* %_P_num
	%u10 = call i8* @malloc()
	%u11 = bitcast i8* %u10 to %struct.foo
	store i32 %u11, %struct.foo* %math1
	%u12 = call i8* @malloc()
	%u13 = bitcast i8* %u12 to %struct.simple
	%u14 = load %struct.foo* %math1
	%u15 = getelementptr %struct.foo* %u14, i1 0, i32 0
	%u16 = load %struct.simple* %u15
	store i32 %u13, %struct.simple* %u16
	%u17 = call i8* @malloc()
	%u18 = bitcast i8* %u17 to %struct.foo
	store i32 %u18, %struct.foo* %math2
	%u19 = call i8* @malloc()
	%u20 = bitcast i8* %u19 to %struct.simple
	%u21 = load %struct.foo* %math2
	%u22 = getelementptr %struct.foo* %u21, i1 0, i32 0
	%u23 = load %struct.simple* %u22
	store i32 %u20, %struct.simple* %u23
	%u24 = load i32* %num
	%u25 = load %struct.foo* %math1
	%u26 = getelementptr %struct.foo* %u25, i1 0, i32 0
	%u27 = load i32* %u26
	store i32 %u24, i32* %u27
	%u28 = load %struct.foo* %math2
	%u29 = getelementptr %struct.foo* %u28, i1 0, i32 0
	%u30 = load i32* %u29
	store i32 3, i32* %u30
	%u31 = load %struct.foo* %math1
	%u32 = getelementptr %struct.foo* %u31, i1 0, i32 0
	%u33 = load i32* %u32
	%u34 = load %struct.foo* %math1
	%u35 = getelementptr %struct.foo* %u34, i1 0, i32 0
	%u36 = load %struct.simple* %u35
	%u37 = getelementptr %struct.simple* %u36, i1 0, i32 0
	%u38 = load i32* %u37
	store i32 %u33, i32* %u38
	%u39 = load %struct.foo* %math2
	%u40 = getelementptr %struct.foo* %u39, i1 0, i32 0
	%u41 = load i32* %u40
	%u42 = load %struct.foo* %math2
	%u43 = getelementptr %struct.foo* %u42, i1 0, i32 0
	%u44 = load %struct.simple* %u43
	%u45 = getelementptr %struct.simple* %u44, i1 0, i32 0
	%u46 = load i32* %u45
	store i32 %u41, i32* %u46
	%u47 = load %struct.foo* %math1
	%u48 = getelementptr %struct.foo* %u47, i1 0, i32 0
	%u49 = load i32* %u48
	%u50 = load %struct.foo* %math2
	%u51 = getelementptr %struct.foo* %u50, i1 0, i32 0
	%u52 = load i32* %u51
	%u53 = mul i32 %u49, %u52
	store i32 %u53, i32* %tmp
	%u54 = load i32* %tmp
	%u55 = load %struct.foo* %math1
	%u56 = getelementptr %struct.foo* %u55, i1 0, i32 0
	%u57 = load %struct.simple* %u56
	%u58 = getelementptr %struct.simple* %u57, i1 0, i32 0
	%u59 = load i32* %u58
	%u60 = mul i32 %u54, %u59
	%u61 = load %struct.foo* %math2
	%u62 = getelementptr %struct.foo* %u61, i1 0, i32 0
	%u63 = load i32* %u62
	%u64 = sdiv i32 %u60, %u63
	store i32 %u64, i32* %tmp
	%u66 = load %struct.foo* %math2
	%u67 = getelementptr %struct.foo* %u66, i1 0, i32 0
	%u68 = load %struct.simple* %u67
	%u69 = getelementptr %struct.simple* %u68, i1 0, i32 0
	%u70 = load i32* %u69
	%u71 = load %struct.foo* %math1
	%u72 = getelementptr %struct.foo* %u71, i1 0, i32 0
	%u73 = load i32* %u72
	%u65 = call i32 @add(i32 %u70, i32 %u73)
	store i32 %u65, i32* %tmp
	%u74 = load %struct.foo* %math2
	%u75 = getelementptr %struct.foo* %u74, i1 0, i32 0
	%u76 = load i32* %u75
	%u77 = load %struct.foo* %math1
	%u78 = getelementptr %struct.foo* %u77, i1 0, i32 0
	%u79 = load i32* %u78
	%u80 = sub i32 %u76, %u79
	store i32 %u80, i32* %tmp
	%u81 = load i32* %num
	%u82 = sub i32 %u81, 1
	store i32 %u82, i32* %num
join0:
	%u83 = load %struct.foo* %math1
	call void @free(%struct.foo %u83)
	%u84 = load %struct.foo* %math2
	call void @free(%struct.foo %u84)
}

define void @objinstantiation(i32 %num)
LU10:
	%_retval_ = alloca i1
	%tmp = alloca %struct.foo
	%_P_num = alloca i32
	store i32 %num, i32* %_P_num
	%u85 = call i8* @malloc()
	%u86 = bitcast i8* %u85 to %struct.foo
	store i32 %u86, %struct.foo* %tmp
	%u87 = load %struct.foo* %tmp
	call void @free(%struct.foo %u87)
	%u88 = load i32* %num
	%u89 = sub i32 %u88, 1
	store i32 %u89, i32* %num
join1:
}

define i32 @ackermann(i32 %m, i32 %n)
LU12:
	%_retval_ = alloca i32
	%_P_m = alloca i32
	store i32 %m, i32* %_P_m
	%_P_n = alloca i32
	store i32 %n, i32* %_P_n
	%u90 = load i32* %m
	%u91 = icmp eq i32 %u90, 0
	br i1 %u91, label %LU13, label %LU14
LU13:
	%u92 = load i32* %n
	%u93 = add i32 %u92, 1
	br label %LU11
LU14:
	br label %LU15
LU11:
	ret i32 %u93
LU15:
	%u94 = load i32* %n
	%u95 = icmp eq i32 %u94, 0
	br i1 %u95, label %LU16, label %LU17
LU18:
LU16:
	%u97 = load i32* %m
	%u98 = sub i32 %u97, 1
	%u96 = call i32 @ackermann(i32 %u98, i32 1)
	br label %LU11
LU17:
	%u100 = load i32* %m
	%u101 = sub i32 %u100, 1
	%u103 = load i32* %m
	%u104 = load i32* %n
	%u105 = sub i32 %u104, 1
	%u102 = call i32 @ackermann(i32 %u103, i32 %u105)
	%u99 = call i32 @ackermann(i32 %u101, i32 %u102)
	br label %LU11
}

define i32 @main()
LU20:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	Test instruction: READ
	store i32 %READ EXPR, i32* %a
	Test instruction: READ
	store i32 %READ EXPR, i32* %b
	Test instruction: READ
	store i32 %READ EXPR, i32* %c
	Test instruction: READ
	store i32 %READ EXPR, i32* %d
	Test instruction: READ
	store i32 %READ EXPR, i32* %e
	%u107 = load i32* %a
	%u106 = call void @tailrecursive(i32 %u107)
	%u108 = load i32* %a
	Test instruction: PRINT LN
	%u110 = load i32* %b
	%u109 = call void @domath(i32 %u110)
	%u111 = load i32* %b
	Test instruction: PRINT LN
	%u113 = load i32* %c
	%u112 = call void @objinstantiation(i32 %u113)
	%u114 = load i32* %c
	Test instruction: PRINT LN
	%u116 = load i32* %d
	%u117 = load i32* %e
	%u115 = call i32 @ackermann(i32 %u116, i32 %u117)
	Test instruction: PRINT LN
	br label %LU19
LU19:
	ret i32 0
}

