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
	%u5 = sub i32 %num, 1
	call void @tailrecursive(i32 %u5)
	br label %LU0
}

define i32 @add(i32 %x, i32 %y)
{
LU6:
	%u6 = add i32 %x, %y
	br label %LU5
LU5:
	ret i32 %u6
}

define void @domath(i32 %num)
{
LU8:
	%u11 = getelementptr %struct.foo* %math1, i1 0, i32 2
	%u16 = getelementptr %struct.foo* %math2, i1 0, i32 2
	%u17 = getelementptr %struct.foo* %math1, i1 0, i32 0
	%u18 = getelementptr %struct.foo* %math2, i1 0, i32 0
	%u19 = getelementptr %struct.foo* %math1, i1 0, i32 0
	%u20 = load i32* %u19
	%u21 = getelementptr %struct.foo* %math1, i1 0, i32 2
	%u22 = load %struct.simple** %u21
	%u23 = getelementptr %struct.simple* %u22, i1 0, i32 0
	%u24 = getelementptr %struct.foo* %math2, i1 0, i32 0
	%u25 = load i32* %u24
	%u26 = getelementptr %struct.foo* %math2, i1 0, i32 2
	%u27 = load %struct.simple** %u26
	%u28 = getelementptr %struct.simple* %u27, i1 0, i32 0
	%u29 = icmp sgt i32 %num, 0
	%u30 = zext i1 %u29 to i32
	%u31 = trunc i32 %u30 to i1
	br i1 %u31, label %LU9, label %LU10
LU9:
	%u32 = load %struct.foo** %math1
	%u33 = getelementptr %struct.foo* %u32, i1 0, i32 0
	%u34 = load i32* %u33
	%u35 = load %struct.foo** %math2
	%u36 = getelementptr %struct.foo* %u35, i1 0, i32 0
	%u37 = load i32* %u36
	%u38 = mul i32 %u34, %u37
	store i32 %u38, i32* %tmp
	%u39 = load i32* %tmp
	%u40 = load %struct.foo** %math1
	%u41 = getelementptr %struct.foo* %u40, i1 0, i32 2
	%u42 = load %struct.simple** %u41
	%u43 = getelementptr %struct.simple* %u42, i1 0, i32 0
	%u44 = load i32* %u43
	%u45 = mul i32 %u39, %u44
	%u46 = load %struct.foo** %math2
	%u47 = getelementptr %struct.foo* %u46, i1 0, i32 0
	%u48 = load i32* %u47
	%u49 = sdiv i32 %u45, %u48
	store i32 %u49, i32* %tmp
	%u51 = load %struct.foo** %math2
	%u52 = getelementptr %struct.foo* %u51, i1 0, i32 2
	%u53 = load %struct.simple** %u52
	%u54 = getelementptr %struct.simple* %u53, i1 0, i32 0
	%u55 = load i32* %u54
	%u56 = load %struct.foo** %math1
	%u57 = getelementptr %struct.foo* %u56, i1 0, i32 0
	%u58 = load i32* %u57
	%u50 = call i32 @add(i32 %u55, i32 %u58)
	store i32 %u50, i32* %tmp
	%u59 = load %struct.foo** %math2
	%u60 = getelementptr %struct.foo* %u59, i1 0, i32 0
	%u61 = load i32* %u60
	%u62 = load %struct.foo** %math1
	%u63 = getelementptr %struct.foo* %u62, i1 0, i32 0
	%u64 = load i32* %u63
	%u65 = sub i32 %u61, %u64
	store i32 %u65, i32* %tmp
	%u66 = load i32* %num
	%u67 = sub i32 %u66, 1
	store i32 %u67, i32* %num
	%u68 = load i32* %num
	%u69 = icmp sgt i32 %u68, 0
	%u70 = zext i1 %u69 to i32
	%u71 = trunc i32 %u70 to i1
	br i1 %u71, label %LU9, label %LU10
LU10:
	br label %LU7
LU7:
}

define void @objinstantiation(i32 %num)
{
LU12:
	%u72 = icmp sgt i32 %num, 0
	%u73 = zext i1 %u72 to i32
	%u74 = trunc i32 %u73 to i1
	br i1 %u74, label %LU13, label %LU14
LU13:
	%u75 = call i8* @malloc(i32 12)
	%u76 = bitcast i8* %u75 to %struct.foo*
	store %struct.foo* %u76, %struct.foo** %tmp
	%u77 = load %struct.foo** %tmp
	%u78 = bitcast %struct.foo* %u77 to i8*
	call void @free(i8* %u78)
	%u79 = load i32* %num
	%u80 = sub i32 %u79, 1
	store i32 %u80, i32* %num
	%u81 = load i32* %num
	%u82 = icmp sgt i32 %u81, 0
	%u83 = zext i1 %u82 to i32
	%u84 = trunc i32 %u83 to i1
	br i1 %u84, label %LU13, label %LU14
LU14:
	br label %LU11
LU11:
}

define i32 @ackermann(i32 %m, i32 %n)
{
LU16:
	%u85 = icmp eq i32 %m, 0
	%u86 = zext i1 %u85 to i32
	%u87 = trunc i32 %u86 to i1
	br i1 %u87, label %LU17, label %LU18
LU17:
	%u88 = add i32 %n, 1
	br label %LU15
LU18:
	br label %LU19
LU15:
	ret i32 %u88
LU19:
	%u89 = icmp eq i32 %n, 0
	%u90 = zext i1 %u89 to i32
	%u91 = trunc i32 %u90 to i1
	br i1 %u91, label %LU20, label %LU21
LU22:
	br label %LU15
LU20:
	%u93 = sub i32 %m, 1
	%u92 = call i32 @ackermann(i32 %u93, i32 1)
	br label %LU15
LU21:
	%u95 = sub i32 %m, 1
	%u97 = sub i32 %n, 1
	%u96 = call i32 @ackermann(i32 %m, i32 %u97)
	%u94 = call i32 @ackermann(i32 %u95, i32 %u96)
	br label %LU15
}

define i32 @main()
{
LU24:
	%u98 = call i32 @read()
	%u99 = call i32 @read()
	%u100 = call i32 @read()
	%u101 = call i32 @read()
	%u102 = call i32 @read()
	call void @tailrecursive(i32 %a)
	call void @printf_newline(i32 %a)
	call void @domath(i32 %b)
	call void @printf_newline(i32 %b)
	call void @objinstantiation(i32 %c)
	call void @printf_newline(i32 %c)
	%u103 = call i32 @ackermann(i32 %d, i32 %e)
	call void @printf_newline(i32 %u103)
	br label %LU23
LU23:
	ret i32 0
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
