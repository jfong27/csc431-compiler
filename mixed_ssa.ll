target triple="i686"
%struct.simple = type {i32}
%struct.foo = type {i32, i32, %struct.simple*}

@globalfoo = common global %struct.foo* null, align 4

define void @tailrecursive(i32 %num)
{
LU1:
	%u0 = icmp sle i32 %num, 0
	%u1 = zext i1 %u0 to i32
	%u2 = trunc i32 %u1 to i1
	br i1 %u2, label %LU2, label %LU3
LU2:
	br label %LU0
LU3:
	br label %LU4
LU0:
	ret void
LU4:
	%u5 = phi i32 
	%u3 = call i8* @malloc(i32 12)
	%u4 = bitcast i8* %u3 to %struct.foo*
	%u6 = sub i32 %u5, 1
	call void @tailrecursive(i32 %u6)
	br label %LU0
}

define i32 @add(i32 %x, i32 %y)
{
LU6:
	%u7 = add i32 %x, %y
	br label %LU5
LU5:
	ret i32 %u7
}

define void @domath(i32 %num)
{
LU8:
	%u8 = call i8* @malloc(i32 12)
	%u9 = bitcast i8* %u8 to %struct.foo*
	%u10 = call i8* @malloc(i32 4)
	%u11 = bitcast i8* %u10 to %struct.simple*
	%u12 = getelementptr %struct.foo* %u9, i1 0, i32 2
	%u13 = call i8* @malloc(i32 12)
	%u14 = bitcast i8* %u13 to %struct.foo*
	%u15 = call i8* @malloc(i32 4)
	%u16 = bitcast i8* %u15 to %struct.simple*
	%u17 = getelementptr %struct.foo* %u14, i1 0, i32 2
	%u18 = getelementptr %struct.foo* %u9, i1 0, i32 0
	%u19 = getelementptr %struct.foo* %u14, i1 0, i32 0
	%u20 = getelementptr %struct.foo* %u9, i1 0, i32 0
	%u21 = load i32* %u20
	%u22 = getelementptr %struct.foo* %u9, i1 0, i32 2
	%u23 = load %struct.simple** %u22
	%u24 = getelementptr %struct.simple* %u23, i1 0, i32 0
	%u25 = getelementptr %struct.foo* %u14, i1 0, i32 0
	%u26 = load i32* %u25
	%u27 = getelementptr %struct.foo* %u14, i1 0, i32 2
	%u28 = load %struct.simple** %u27
	%u29 = getelementptr %struct.simple* %u28, i1 0, i32 0
	%u30 = icmp sgt i32 %num, 0
	%u31 = zext i1 %u30 to i32
	%u32 = trunc i32 %u31 to i1
	br i1 %u32, label %LU9, label %LU10
LU9:
	%u33 = load %struct.foo** %math1
	%u34 = getelementptr %struct.foo* %u33, i1 0, i32 0
	%u35 = load i32* %u34
	%u36 = load %struct.foo** %math2
	%u37 = getelementptr %struct.foo* %u36, i1 0, i32 0
	%u38 = load i32* %u37
	%u39 = mul i32 %u35, %u38
	store i32 %u39, i32* %tmp
	%u40 = load i32* %tmp
	%u41 = load %struct.foo** %math1
	%u42 = getelementptr %struct.foo* %u41, i1 0, i32 2
	%u43 = load %struct.simple** %u42
	%u44 = getelementptr %struct.simple* %u43, i1 0, i32 0
	%u45 = load i32* %u44
	%u46 = mul i32 %u40, %u45
	%u47 = load %struct.foo** %math2
	%u48 = getelementptr %struct.foo* %u47, i1 0, i32 0
	%u49 = load i32* %u48
	%u50 = sdiv i32 %u46, %u49
	store i32 %u50, i32* %tmp
	%u52 = load %struct.foo** %math2
	%u53 = getelementptr %struct.foo* %u52, i1 0, i32 2
	%u54 = load %struct.simple** %u53
	%u55 = getelementptr %struct.simple* %u54, i1 0, i32 0
	%u56 = load i32* %u55
	%u57 = load %struct.foo** %math1
	%u58 = getelementptr %struct.foo* %u57, i1 0, i32 0
	%u59 = load i32* %u58
	%u51 = call i32 @add(i32 %u56, i32 %u59)
	store i32 %u51, i32* %tmp
	%u60 = load %struct.foo** %math2
	%u61 = getelementptr %struct.foo* %u60, i1 0, i32 0
	%u62 = load i32* %u61
	%u63 = load %struct.foo** %math1
	%u64 = getelementptr %struct.foo* %u63, i1 0, i32 0
	%u65 = load i32* %u64
	%u66 = sub i32 %u62, %u65
	store i32 %u66, i32* %tmp
	%u67 = load i32* %num
	%u68 = sub i32 %u67, 1
	store i32 %u68, i32* %num
	%u69 = load i32* %num
	%u70 = icmp sgt i32 %u69, 0
	%u71 = zext i1 %u70 to i32
	%u72 = trunc i32 %u71 to i1
	br i1 %u72, label %LU9, label %LU10
LU10:
	br label %LU7
LU7:
	ret void
}

define void @objinstantiation(i32 %num)
{
LU12:
	%u73 = icmp sgt i32 %num, 0
	%u74 = zext i1 %u73 to i32
	%u75 = trunc i32 %u74 to i1
	br i1 %u75, label %LU13, label %LU14
LU13:
	%u76 = call i8* @malloc(i32 12)
	%u77 = bitcast i8* %u76 to %struct.foo*
	store %struct.foo* %u77, %struct.foo** %tmp
	%u78 = load %struct.foo** %tmp
	%u79 = bitcast %struct.foo* %u78 to i8*
	call void @free(i8* %u79)
	%u80 = load i32* %num
	%u81 = sub i32 %u80, 1
	store i32 %u81, i32* %num
	%u82 = load i32* %num
	%u83 = icmp sgt i32 %u82, 0
	%u84 = zext i1 %u83 to i32
	%u85 = trunc i32 %u84 to i1
	br i1 %u85, label %LU13, label %LU14
LU14:
	br label %LU11
LU11:
	ret void
}

define i32 @ackermann(i32 %m, i32 %n)
{
LU16:
	%u86 = icmp eq i32 %m, 0
	%u87 = zext i1 %u86 to i32
	%u88 = trunc i32 %u87 to i1
	br i1 %u88, label %LU17, label %LU18
LU17:
	%u89 = add i32 null, 1
	br label %LU15
LU18:
	br label %LU19
LU15:
	ret i32 %u89
LU19:
	%u90 = phi i32 
	%u95 = phi i32 
	%u98 = phi i32 
	%u101 = phi i32 
	%u102 = phi i32 
	%u91 = icmp eq i32 %u90, 0
	%u92 = zext i1 %u91 to i32
	%u93 = trunc i32 %u92 to i1
	br i1 %u93, label %LU20, label %LU21
LU22:
	br label %LU15
LU20:
	%u96 = sub i32 %u95, 1
	%u94 = call i32 @ackermann(i32 %u96, i32 1)
	br label %LU15
LU21:
	%u99 = sub i32 %u98, 1
	%u103 = sub i32 %u102, 1
	%u100 = call i32 @ackermann(i32 %u101, i32 %u103)
	%u97 = call i32 @ackermann(i32 %u99, i32 %u100)
	br label %LU15
}

define i32 @main()
{
LU24:
	%u104 = call i32 @read()
	%u105 = call i32 @read()
	%u106 = call i32 @read()
	%u107 = call i32 @read()
	%u108 = call i32 @read()
	call void @tailrecursive(i32 %u104)
	call void @printf_newline(i32 %u104)
	call void @domath(i32 %u105)
	call void @printf_newline(i32 %u105)
	call void @objinstantiation(i32 %u106)
	call void @printf_newline(i32 %u106)
	%u109 = call i32 @ackermann(i32 %u107, i32 %u108)
	call void @printf_newline(i32 %u109)
	br label %LU23
LU23:
	ret i32 0
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
