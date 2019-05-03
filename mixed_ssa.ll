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
	%num0 = phi i32 
	%unused0 = phi %struct.foo* 
	ret void
LU4:
	%num0 = phi i32 [%num0, LU0] [%num, LU3] 
	%unused0 = phi %struct.foo* [%unused0, LU0] [null, LU3] 
	%u3 = call i8* @malloc(i32 12)
	%u4 = bitcast i8* %u3 to %struct.foo*
	%u5 = sub i32 %num0, 1
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
	%u7 = call i8* @malloc(i32 12)
	%u8 = bitcast i8* %u7 to %struct.foo*
	%u9 = call i8* @malloc(i32 4)
	%u10 = bitcast i8* %u9 to %struct.simple*
	%u11 = getelementptr %struct.foo* %u8, i1 0, i32 2
	%u12 = call i8* @malloc(i32 12)
	%u13 = bitcast i8* %u12 to %struct.foo*
	%u14 = call i8* @malloc(i32 4)
	%u15 = bitcast i8* %u14 to %struct.simple*
	%u16 = getelementptr %struct.foo* %u13, i1 0, i32 2
	%u17 = getelementptr %struct.foo* %u8, i1 0, i32 0
	%u18 = getelementptr %struct.foo* %u13, i1 0, i32 0
	%u19 = getelementptr %struct.foo* %u8, i1 0, i32 0
	%u20 = load i32* %u19
	%u21 = getelementptr %struct.foo* %u8, i1 0, i32 2
	%u22 = load %struct.simple** %u21
	%u23 = getelementptr %struct.simple* %u22, i1 0, i32 0
	%u24 = getelementptr %struct.foo* %u13, i1 0, i32 0
	%u25 = load i32* %u24
	%u26 = getelementptr %struct.foo* %u13, i1 0, i32 2
	%u27 = load %struct.simple** %u26
	%u28 = getelementptr %struct.simple* %u27, i1 0, i32 0
	%u29 = icmp sgt i32 %num, 0
	%u30 = zext i1 %u29 to i32
	%u31 = trunc i32 %u30 to i1
	br i1 %u31, label %LU9, label %LU10
LU9:
	%math10 = phi %struct.foo* [%u8, LU8] [%math10, LU9] [%u8, LU8] [%math10, LU9] 
	%tmp0 = phi i32 [null, LU8] [%u56, LU9] [null, LU8] [%u56, LU9] 
	%math20 = phi %struct.foo* [%u13, LU8] [%math20, LU9] [%u13, LU8] [%math20, LU9] 
	%num0 = phi i32 [%num, LU8] [%u57, LU9] [%num, LU8] [%u57, LU9] 
	%u32 = getelementptr %struct.foo* %math10, i1 0, i32 0
	%u33 = load i32* %u32
	%u34 = getelementptr %struct.foo* %math20, i1 0, i32 0
	%u35 = load i32* %u34
	%u36 = mul i32 %u33, %u35
	%u37 = getelementptr %struct.foo* %math10, i1 0, i32 2
	%u38 = load %struct.simple** %u37
	%u39 = getelementptr %struct.simple* %u38, i1 0, i32 0
	%u40 = load i32* %u39
	%u41 = mul i32 %u36, %u40
	%u42 = getelementptr %struct.foo* %math20, i1 0, i32 0
	%u43 = load i32* %u42
	%u44 = sdiv i32 %u41, %u43
	%u46 = getelementptr %struct.foo* %math20, i1 0, i32 2
	%u47 = load %struct.simple** %u46
	%u48 = getelementptr %struct.simple* %u47, i1 0, i32 0
	%u49 = load i32* %u48
	%u50 = getelementptr %struct.foo* %math10, i1 0, i32 0
	%u51 = load i32* %u50
	%u45 = call i32 @add(i32 %u49, i32 %u51)
	%u52 = getelementptr %struct.foo* %math20, i1 0, i32 0
	%u53 = load i32* %u52
	%u54 = getelementptr %struct.foo* %math10, i1 0, i32 0
	%u55 = load i32* %u54
	%u56 = sub i32 %u53, %u55
	%u57 = sub i32 %num0, 1
	%u58 = load i32* %num
	%u59 = icmp sgt i32 %u58, 0
	%u60 = zext i1 %u59 to i32
	%u61 = trunc i32 %u60 to i1
	br i1 %u61, label %LU9, label %LU10
LU10:
	br label %LU7
LU7:
	ret void
}

define void @objinstantiation(i32 %num)
{
LU12:
	%u62 = icmp sgt i32 %num, 0
	%u63 = zext i1 %u62 to i32
	%u64 = trunc i32 %u63 to i1
	br i1 %u64, label %LU13, label %LU14
LU13:
	%tmp0 = phi %struct.foo* [null, LU12] [%u66, LU13] [null, LU12] [%u66, LU13] 
	%num0 = phi i32 [%num, LU12] [%u67, LU13] [%num, LU12] [%u67, LU13] 
	%u65 = call i8* @malloc(i32 12)
	%u66 = bitcast i8* %u65 to %struct.foo*
	%u67 = sub i32 %num0, 1
	%u68 = load i32* %num
	%u69 = icmp sgt i32 %u68, 0
	%u70 = zext i1 %u69 to i32
	%u71 = trunc i32 %u70 to i1
	br i1 %u71, label %LU13, label %LU14
LU14:
	br label %LU11
LU11:
	ret void
}

define i32 @ackermann(i32 %m, i32 %n)
{
LU16:
	%u72 = icmp eq i32 %m, 0
	%u73 = zext i1 %u72 to i32
	%u74 = trunc i32 %u73 to i1
	br i1 %u74, label %LU17, label %LU18
LU17:
	%u75 = add i32 %n, 1
	br label %LU15
LU18:
	br label %LU19
LU15:
	%m0 = phi i32 
	%n0 = phi i32 
	ret i32 %u75
LU19:
	%m0 = phi i32 [%m0, LU15] [%m, LU18] 
	%n0 = phi i32 [%n0, LU15] [%n, LU18] 
	%u76 = icmp eq i32 %n0, 0
	%u77 = zext i1 %u76 to i32
	%u78 = trunc i32 %u77 to i1
	br i1 %u78, label %LU20, label %LU21
LU22:
	br label %LU15
LU20:
	%u80 = sub i32 %m0, 1
	%u79 = call i32 @ackermann(i32 %u80, i32 1)
	br label %LU15
LU21:
	%u82 = sub i32 %m0, 1
	%u84 = sub i32 %n0, 1
	%u83 = call i32 @ackermann(i32 %m0, i32 %u84)
	%u81 = call i32 @ackermann(i32 %u82, i32 %u83)
	br label %LU15
}

define i32 @main()
{
LU24:
	%u85 = call i32 @read()
	%u86 = call i32 @read()
	%u87 = call i32 @read()
	%u88 = call i32 @read()
	%u89 = call i32 @read()
	call void @tailrecursive(i32 %u85)
	call void @printf_newline(i32 %u85)
	call void @domath(i32 %u86)
	call void @printf_newline(i32 %u86)
	call void @objinstantiation(i32 %u87)
	call void @printf_newline(i32 %u87)
	%u90 = call i32 @ackermann(i32 %u88, i32 %u89)
	call void @printf_newline(i32 %u90)
	br label %LU23
LU23:
	ret i32 0
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
