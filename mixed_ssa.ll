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
	%u3 = call i8* @malloc(i32 12)
	%u4 = bitcast i8* %u3 to %struct.foo*
	%u5 = sub i32 %num, 1
	call void @tailrecursive(i32 %u5)
	br label %LU0
LU0:
	ret void
}

define i32 @add(i32 %x, i32 %y)
{
LU5:
	%u6 = add i32 %x, %y
	br label %LU4
LU4:
	%_retval_0 = phi i32 [%u6, %LU5], [%_retval_0, %LU4] 
	ret i32 %_retval_0
}

define void @domath(i32 %num)
{
LU7:
	%u7 = call i8* @malloc(i32 12)
	%u8 = bitcast i8* %u7 to %struct.foo*
	%u9 = call i8* @malloc(i32 4)
	%u10 = bitcast i8* %u9 to %struct.simple*
	%u11 = getelementptr %struct.foo* %u8, i1 0, i32 2
	store %struct.simple* %u10, %struct.simple** %u11
	%u13 = call i8* @malloc(i32 12)
	%u14 = bitcast i8* %u13 to %struct.foo*
	%u15 = call i8* @malloc(i32 4)
	%u16 = bitcast i8* %u15 to %struct.simple*
	%u17 = getelementptr %struct.foo* %u14, i1 0, i32 2
	store %struct.simple* %u16, %struct.simple** %u17
	%u19 = getelementptr %struct.foo* %u8, i1 0, i32 0
	store i32 %num, i32* %u19
	%u21 = getelementptr %struct.foo* %u14, i1 0, i32 0
	store i32 3, i32* %u21
	%u23 = getelementptr %struct.foo* %u8, i1 0, i32 0
	%u24 = load i32* %u23
	%u25 = getelementptr %struct.foo* %u8, i1 0, i32 2
	%u26 = load %struct.simple** %u25
	%u27 = getelementptr %struct.simple* %u26, i1 0, i32 0
	store i32 %u24, i32* %u27
	%u29 = getelementptr %struct.foo* %u14, i1 0, i32 0
	%u30 = load i32* %u29
	%u31 = getelementptr %struct.foo* %u14, i1 0, i32 2
	%u32 = load %struct.simple** %u31
	%u33 = getelementptr %struct.simple* %u32, i1 0, i32 0
	store i32 %u30, i32* %u33
	%u35 = icmp sgt i32 %num, 0
	%u36 = zext i1 %u35 to i32
	%u37 = trunc i32 %u36 to i1
	br i1 %u37, label %LU8, label %LU9
LU8:
	%math10 = phi %struct.foo* [%u8, %LU7], [%math10, %LU8] 
	%tmp0 = phi i32 [%u62, %LU8] 
	%math20 = phi %struct.foo* [%u14, %LU7], [%math20, %LU8] 
	%num0 = phi i32 [%num, %LU7], [%u63, %LU8] 
	%u38 = getelementptr %struct.foo* %math10, i1 0, i32 0
	%u39 = load i32* %u38
	%u40 = getelementptr %struct.foo* %math20, i1 0, i32 0
	%u41 = load i32* %u40
	%u42 = mul i32 %u39, %u41
	%u43 = getelementptr %struct.foo* %math10, i1 0, i32 2
	%u44 = load %struct.simple** %u43
	%u45 = getelementptr %struct.simple* %u44, i1 0, i32 0
	%u46 = load i32* %u45
	%u47 = mul i32 %u42, %u46
	%u48 = getelementptr %struct.foo* %math20, i1 0, i32 0
	%u49 = load i32* %u48
	%u50 = sdiv i32 %u47, %u49
	%u52 = getelementptr %struct.foo* %math20, i1 0, i32 2
	%u53 = load %struct.simple** %u52
	%u54 = getelementptr %struct.simple* %u53, i1 0, i32 0
	%u55 = load i32* %u54
	%u56 = getelementptr %struct.foo* %math10, i1 0, i32 0
	%u57 = load i32* %u56
	%u51 = call i32 @add(i32 %u55, i32 %u57)
	%u58 = getelementptr %struct.foo* %math20, i1 0, i32 0
	%u59 = load i32* %u58
	%u60 = getelementptr %struct.foo* %math10, i1 0, i32 0
	%u61 = load i32* %u60
	%u62 = sub i32 %u59, %u61
	%u63 = sub i32 %num0, 1
	%u64 = icmp sgt i32 %u63, 0
	%u65 = zext i1 %u64 to i32
	%u66 = trunc i32 %u65 to i1
	br i1 %u66, label %LU8, label %LU9
LU9:
	%math11 = phi %struct.foo* [%u8, %LU7], [%math10, %LU8] 
	%math21 = phi %struct.foo* [%u14, %LU7], [%math20, %LU8] 
	%u67 = bitcast %struct.foo* %math11 to i8*
	call void @free(i8* %u67)
	%u68 = bitcast %struct.foo* %math21 to i8*
	call void @free(i8* %u68)
	br label %LU6
LU6:
	ret void
}

define void @objinstantiation(i32 %num)
{
LU11:
	%u69 = icmp sgt i32 %num, 0
	%u70 = zext i1 %u69 to i32
	%u71 = trunc i32 %u70 to i1
	br i1 %u71, label %LU12, label %LU13
LU12:
	%tmp0 = phi %struct.foo* [%u73, %LU12] 
	%num0 = phi i32 [%num, %LU11], [%u75, %LU12] 
	%u72 = call i8* @malloc(i32 12)
	%u73 = bitcast i8* %u72 to %struct.foo*
	%u74 = bitcast %struct.foo* %u73 to i8*
	call void @free(i8* %u74)
	%u75 = sub i32 %num0, 1
	%u76 = icmp sgt i32 %u75, 0
	%u77 = zext i1 %u76 to i32
	%u78 = trunc i32 %u77 to i1
	br i1 %u78, label %LU12, label %LU13
LU13:
	br label %LU10
LU10:
	ret void
}

define i32 @ackermann(i32 %m, i32 %n)
{
LU15:
	%u79 = icmp eq i32 %m, 0
	%u80 = zext i1 %u79 to i32
	%u81 = trunc i32 %u80 to i1
	br i1 %u81, label %LU16, label %LU17
LU16:
	%u82 = add i32 %n, 1
	br label %LU14
LU17:
	%u83 = icmp eq i32 %n, 0
	%u84 = zext i1 %u83 to i32
	%u85 = trunc i32 %u84 to i1
	br i1 %u85, label %LU18, label %LU19
LU14:
	%_retval_0 = phi i32 [%u82, %LU16], [%u86, %LU18], [%u88, %LU19] 
	ret i32 %_retval_0
LU18:
	%u87 = sub i32 %m, 1
	%u86 = call i32 @ackermann(i32 %u87, i32 1)
	br label %LU14
LU19:
	%u89 = sub i32 %m, 1
	%u91 = sub i32 %n, 1
	%u90 = call i32 @ackermann(i32 %m, i32 %u91)
	%u88 = call i32 @ackermann(i32 %u89, i32 %u90)
	br label %LU14
}

define i32 @main()
{
LU22:
	%u92 = call i32 @read()
	%u93 = call i32 @read()
	%u94 = call i32 @read()
	%u95 = call i32 @read()
	%u96 = call i32 @read()
	call void @tailrecursive(i32 %u92)
	call void @printf_newline(i32 %u92)
	call void @domath(i32 %u93)
	call void @printf_newline(i32 %u93)
	call void @objinstantiation(i32 %u94)
	call void @printf_newline(i32 %u94)
	%u97 = call i32 @ackermann(i32 %u95, i32 %u96)
	call void @printf_newline(i32 %u97)
	br label %LU21
LU21:
	%_retval_0 = phi i32 [0, %LU22], [%_retval_0, %LU21] 
	ret i32 %_retval_0
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
