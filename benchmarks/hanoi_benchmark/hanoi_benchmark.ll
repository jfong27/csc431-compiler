target triple="i686"
%struct.plate = type {i32, %struct.plate*}

@peg1 = common global %struct.plate* null, align 4
@peg2 = common global %struct.plate* null, align 4
@peg3 = common global %struct.plate* null, align 4
@numMoves = common global i32 0, align 4

define void @move(i32 %_P_from, i32 %_P_to)
{
LU1:
	%plateToMove = alloca %struct.plate*
	%from = alloca i32
	store i32 %_P_from, i32* %from
	%to = alloca i32
	store i32 %_P_to, i32* %to
	%u0 = load i32* %from
	%u1 = icmp eq i32 %u0, 1
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %LU2, label %LU3
LU2:
	%u4 = load %struct.plate** @peg1
	store %struct.plate* %u4, %struct.plate** %plateToMove
	%u5 = load %struct.plate** @peg1
	%u6 = getelementptr %struct.plate* %u5, i1 0, i32 1
	%u7 = load %struct.plate** %u6
	store %struct.plate* %u7, %struct.plate** @peg1
	br label %LU4
LU3:
	%u8 = load i32* %from
	%u9 = icmp eq i32 %u8, 2
	%u10 = zext i1 %u9 to i32
	%u11 = trunc i32 %u10 to i1
	br i1 %u11, label %LU5, label %LU6
LU4:
	%u20 = load i32* %to
	%u21 = icmp eq i32 %u20, 1
	%u22 = zext i1 %u21 to i32
	%u23 = trunc i32 %u22 to i1
	br i1 %u23, label %LU8, label %LU9
LU8:
	%u24 = load %struct.plate** @peg1
	%u25 = load %struct.plate** %plateToMove
	%u26 = getelementptr %struct.plate* %u25, i1 0, i32 1
	store %struct.plate* %u24, %struct.plate** %u26
	%u27 = load %struct.plate** %plateToMove
	store %struct.plate* %u27, %struct.plate** @peg1
	br label %LU10
LU9:
	%u28 = load i32* %to
	%u29 = icmp eq i32 %u28, 2
	%u30 = zext i1 %u29 to i32
	%u31 = trunc i32 %u30 to i1
	br i1 %u31, label %LU11, label %LU12
LU10:
	%u40 = load i32* @numMoves
	%u41 = add i32 %u40, 1
	store i32 %u41, i32* @numMoves
	br label %LU0
LU0:
	ret void
LU11:
	%u32 = load %struct.plate** @peg2
	%u33 = load %struct.plate** %plateToMove
	%u34 = getelementptr %struct.plate* %u33, i1 0, i32 1
	store %struct.plate* %u32, %struct.plate** %u34
	%u35 = load %struct.plate** %plateToMove
	store %struct.plate* %u35, %struct.plate** @peg2
	br label %LU13
LU12:
	%u36 = load %struct.plate** @peg3
	%u37 = load %struct.plate** %plateToMove
	%u38 = getelementptr %struct.plate* %u37, i1 0, i32 1
	store %struct.plate* %u36, %struct.plate** %u38
	%u39 = load %struct.plate** %plateToMove
	store %struct.plate* %u39, %struct.plate** @peg3
	br label %LU13
LU13:
	br label %LU10
LU5:
	%u12 = load %struct.plate** @peg2
	store %struct.plate* %u12, %struct.plate** %plateToMove
	%u13 = load %struct.plate** @peg2
	%u14 = getelementptr %struct.plate* %u13, i1 0, i32 1
	%u15 = load %struct.plate** %u14
	store %struct.plate* %u15, %struct.plate** @peg2
	br label %LU7
LU6:
	%u16 = load %struct.plate** @peg3
	store %struct.plate* %u16, %struct.plate** %plateToMove
	%u17 = load %struct.plate** @peg3
	%u18 = getelementptr %struct.plate* %u17, i1 0, i32 1
	%u19 = load %struct.plate** %u18
	store %struct.plate* %u19, %struct.plate** @peg3
	br label %LU7
LU7:
	br label %LU4
}

define void @hanoi(i32 %_P_n, i32 %_P_from, i32 %_P_to, i32 %_P_other)
{
LU15:
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%from = alloca i32
	store i32 %_P_from, i32* %from
	%to = alloca i32
	store i32 %_P_to, i32* %to
	%other = alloca i32
	store i32 %_P_other, i32* %other
	%u42 = load i32* %n
	%u43 = icmp eq i32 %u42, 1
	%u44 = zext i1 %u43 to i32
	%u45 = trunc i32 %u44 to i1
	br i1 %u45, label %LU16, label %LU17
LU16:
	%u46 = load i32* %from
	%u47 = load i32* %to
	call void @move(i32 %u46, i32 %u47)
	br label %LU18
LU17:
	%u48 = load i32* %n
	%u49 = sub i32 %u48, 1
	%u50 = load i32* %from
	%u51 = load i32* %other
	%u52 = load i32* %to
	call void @hanoi(i32 %u49, i32 %u50, i32 %u51, i32 %u52)
	%u53 = load i32* %from
	%u54 = load i32* %to
	call void @move(i32 %u53, i32 %u54)
	%u55 = load i32* %n
	%u56 = sub i32 %u55, 1
	%u57 = load i32* %other
	%u58 = load i32* %to
	%u59 = load i32* %from
	call void @hanoi(i32 %u56, i32 %u57, i32 %u58, i32 %u59)
	br label %LU18
LU18:
	br label %LU14
LU14:
	ret void
}

define void @printPeg(%struct.plate* %_P_peg)
{
LU20:
	%aPlate = alloca %struct.plate*
	%peg = alloca %struct.plate*
	store %struct.plate* %_P_peg, %struct.plate** %peg
	%u60 = load %struct.plate** %peg
	store %struct.plate* %u60, %struct.plate** %aPlate
	%u61 = load %struct.plate** %aPlate
	%u62 = icmp ne %struct.plate* %u61, null
	%u63 = zext i1 %u62 to i32
	%u64 = trunc i32 %u63 to i1
	br i1 %u64, label %LU21, label %LU22
LU21:
	%u65 = load %struct.plate** %aPlate
	%u66 = getelementptr %struct.plate* %u65, i1 0, i32 0
	%u67 = load i32* %u66
	call void @printf_newline(i32 %u67)
	%u68 = load %struct.plate** %aPlate
	%u69 = getelementptr %struct.plate* %u68, i1 0, i32 1
	%u70 = load %struct.plate** %u69
	store %struct.plate* %u70, %struct.plate** %aPlate
	%u71 = load %struct.plate** %aPlate
	%u72 = icmp ne %struct.plate* %u71, null
	%u73 = zext i1 %u72 to i32
	%u74 = trunc i32 %u73 to i1
	br i1 %u74, label %LU21, label %LU22
LU22:
	br label %LU19
LU19:
	ret void
}

define i32 @main()
{
LU24:
	%_retval_ = alloca i32
	%count = alloca i32
	%numPlates = alloca i32
	%aPlate = alloca %struct.plate*
	store %struct.plate* null, %struct.plate** @peg1
	store %struct.plate* null, %struct.plate** @peg2
	store %struct.plate* null, %struct.plate** @peg3
	store i32 0, i32* @numMoves
	%u75 = call i32 @read()
	store i32 %u75, i32* %numPlates
	%u76 = load i32* %numPlates
	%u77 = icmp sge i32 %u76, 1
	%u78 = zext i1 %u77 to i32
	%u79 = trunc i32 %u78 to i1
	br i1 %u79, label %LU25, label %LU26
LU25:
	%u80 = load i32* %numPlates
	store i32 %u80, i32* %count
	%u81 = load i32* %count
	%u82 = icmp ne i32 %u81, 0
	%u83 = zext i1 %u82 to i32
	%u84 = trunc i32 %u83 to i1
	br i1 %u84, label %LU28, label %LU29
LU26:
	br label %LU27
LU28:
	%u85 = call i8* @malloc(i32 8)
	%u86 = bitcast i8* %u85 to %struct.plate*
	store %struct.plate* %u86, %struct.plate** %aPlate
	%u87 = load i32* %count
	%u88 = load %struct.plate** %aPlate
	%u89 = getelementptr %struct.plate* %u88, i1 0, i32 0
	store i32 %u87, i32* %u89
	%u90 = load %struct.plate** @peg1
	%u91 = load %struct.plate** %aPlate
	%u92 = getelementptr %struct.plate* %u91, i1 0, i32 1
	store %struct.plate* %u90, %struct.plate** %u92
	%u93 = load %struct.plate** %aPlate
	store %struct.plate* %u93, %struct.plate** @peg1
	%u94 = load i32* %count
	%u95 = sub i32 %u94, 1
	store i32 %u95, i32* %count
	%u96 = load i32* %count
	%u97 = icmp ne i32 %u96, 0
	%u98 = zext i1 %u97 to i32
	%u99 = trunc i32 %u98 to i1
	br i1 %u99, label %LU28, label %LU29
LU29:
	call void @printf_newline(i32 1)
	%u100 = load %struct.plate** @peg1
	call void @printPeg(%struct.plate* %u100)
	call void @printf_newline(i32 2)
	%u101 = load %struct.plate** @peg2
	call void @printPeg(%struct.plate* %u101)
	call void @printf_newline(i32 3)
	%u102 = load %struct.plate** @peg3
	call void @printPeg(%struct.plate* %u102)
	%u103 = load i32* %numPlates
	call void @hanoi(i32 %u103, i32 1, i32 3, i32 2)
	call void @printf_newline(i32 1)
	%u104 = load %struct.plate** @peg1
	call void @printPeg(%struct.plate* %u104)
	call void @printf_newline(i32 2)
	%u105 = load %struct.plate** @peg2
	call void @printPeg(%struct.plate* %u105)
	call void @printf_newline(i32 3)
	%u106 = load %struct.plate** @peg3
	call void @printPeg(%struct.plate* %u106)
	%u107 = load i32* @numMoves
	call void @printf_newline(i32 %u107)
	%u108 = load %struct.plate** @peg3
	%u109 = icmp ne %struct.plate* %u108, null
	%u110 = zext i1 %u109 to i32
	%u111 = trunc i32 %u110 to i1
	br i1 %u111, label %LU30, label %LU31
LU30:
	%u112 = load %struct.plate** @peg3
	store %struct.plate* %u112, %struct.plate** %aPlate
	%u113 = load %struct.plate** @peg3
	%u114 = getelementptr %struct.plate* %u113, i1 0, i32 1
	%u115 = load %struct.plate** %u114
	store %struct.plate* %u115, %struct.plate** @peg3
	%u116 = load %struct.plate** %aPlate
	%u117 = bitcast %struct.plate* %u116 to i8*
	call void @free(i8* %u117)
	%u118 = load %struct.plate** @peg3
	%u119 = icmp ne %struct.plate* %u118, null
	%u120 = zext i1 %u119 to i32
	%u121 = trunc i32 %u120 to i1
	br i1 %u121, label %LU30, label %LU31
LU31:
	br label %LU27
LU27:
	store i32 0, i32* %_retval_
	br label %LU23
LU23:
	%u122 = load i32* %_retval_
	ret i32 %u122
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
