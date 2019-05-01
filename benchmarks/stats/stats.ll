target triple="i686"
%struct.linkedNums = type {i32, %struct.linkedNums*}


define %struct.linkedNums* @getRands(i32 %_P_seed, i32 %_P_num)
{
LU1:
	%_retval_ = alloca %struct.linkedNums*
	%cur = alloca i32
	%prev = alloca i32
	%curNode = alloca %struct.linkedNums*
	%prevNode = alloca %struct.linkedNums*
	%seed = alloca i32
	store i32 %_P_seed, i32* %seed
	%num = alloca i32
	store i32 %_P_num, i32* %num
	store %struct.linkedNums* null, %struct.linkedNums** %curNode
	%u0 = load i32* %seed
	%u1 = load i32* %seed
	%u2 = mul i32 %u0, %u1
	store i32 %u2, i32* %cur
	%u3 = call i8* @malloc(i32 8)
	%u4 = bitcast i8* %u3 to %struct.linkedNums*
	store %struct.linkedNums* %u4, %struct.linkedNums** %prevNode
	%u5 = load i32* %cur
	%u6 = load %struct.linkedNums** %prevNode
	%u7 = getelementptr %struct.linkedNums* %u6, i1 0, i32 0
	store i32 %u5, i32* %u7
	%u8 = load %struct.linkedNums** %prevNode
	%u9 = getelementptr %struct.linkedNums* %u8, i1 0, i32 1
	store %struct.linkedNums* null, %struct.linkedNums** %u9
	%u10 = load i32* %num
	%u11 = sub i32 %u10, 1
	store i32 %u11, i32* %num
	%u12 = load i32* %cur
	store i32 %u12, i32* %prev
	%u13 = load i32* %num
	%u14 = icmp sgt i32 %u13, 0
	%u15 = zext i1 %u14 to i32
	%u16 = trunc i32 %u15 to i1
	br i1 %u16, label %LU2, label %LU3
LU2:
	%u17 = load i32* %prev
	%u18 = load i32* %prev
	%u19 = mul i32 %u17, %u18
	%u20 = load i32* %seed
	%u21 = sdiv i32 %u19, %u20
	%u22 = load i32* %seed
	%u23 = sdiv i32 %u22, 2
	%u24 = mul i32 %u21, %u23
	%u25 = add i32 %u24, 1
	store i32 %u25, i32* %cur
	%u26 = call i8* @malloc(i32 8)
	%u27 = bitcast i8* %u26 to %struct.linkedNums*
	store %struct.linkedNums* %u27, %struct.linkedNums** %curNode
	%u28 = load i32* %cur
	%u29 = load %struct.linkedNums** %curNode
	%u30 = getelementptr %struct.linkedNums* %u29, i1 0, i32 0
	store i32 %u28, i32* %u30
	%u31 = load %struct.linkedNums** %prevNode
	%u32 = load %struct.linkedNums** %curNode
	%u33 = getelementptr %struct.linkedNums* %u32, i1 0, i32 1
	store %struct.linkedNums* %u31, %struct.linkedNums** %u33
	%u34 = load %struct.linkedNums** %curNode
	store %struct.linkedNums* %u34, %struct.linkedNums** %prevNode
	%u35 = load i32* %num
	%u36 = sub i32 %u35, 1
	store i32 %u36, i32* %num
	%u37 = load i32* %cur
	store i32 %u37, i32* %prev
	%u38 = load i32* %num
	%u39 = icmp sgt i32 %u38, 0
	%u40 = zext i1 %u39 to i32
	%u41 = trunc i32 %u40 to i1
	br i1 %u41, label %LU2, label %LU3
LU3:
	%u42 = load %struct.linkedNums** %curNode
	store %struct.linkedNums* %u42, %struct.linkedNums** %_retval_
	br label %LU0
LU0:
	%u43 = load %struct.linkedNums** %_retval_
	ret %struct.linkedNums* %u43
}

define i32 @calcMean(%struct.linkedNums* %_P_nums)
{
LU5:
	%_retval_ = alloca i32
	%sum = alloca i32
	%num = alloca i32
	%mean = alloca i32
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %_P_nums, %struct.linkedNums** %nums
	store i32 0, i32* %sum
	store i32 0, i32* %num
	store i32 0, i32* %mean
	%u44 = load %struct.linkedNums** %nums
	%u45 = icmp ne %struct.linkedNums* %u44, null
	%u46 = zext i1 %u45 to i32
	%u47 = trunc i32 %u46 to i1
	br i1 %u47, label %LU6, label %LU7
LU6:
	%u48 = load i32* %num
	%u49 = add i32 %u48, 1
	store i32 %u49, i32* %num
	%u50 = load i32* %sum
	%u51 = load %struct.linkedNums** %nums
	%u52 = getelementptr %struct.linkedNums* %u51, i1 0, i32 0
	%u53 = load i32* %u52
	%u54 = add i32 %u50, %u53
	store i32 %u54, i32* %sum
	%u55 = load %struct.linkedNums** %nums
	%u56 = getelementptr %struct.linkedNums* %u55, i1 0, i32 1
	%u57 = load %struct.linkedNums** %u56
	store %struct.linkedNums* %u57, %struct.linkedNums** %nums
	%u58 = load %struct.linkedNums** %nums
	%u59 = icmp ne %struct.linkedNums* %u58, null
	%u60 = zext i1 %u59 to i32
	%u61 = trunc i32 %u60 to i1
	br i1 %u61, label %LU6, label %LU7
LU7:
	%u62 = load i32* %num
	%u63 = icmp ne i32 %u62, 0
	%u64 = zext i1 %u63 to i32
	%u65 = trunc i32 %u64 to i1
	br i1 %u65, label %LU8, label %LU9
LU8:
	%u66 = load i32* %sum
	%u67 = load i32* %num
	%u68 = sdiv i32 %u66, %u67
	store i32 %u68, i32* %mean
	br label %LU10
LU9:
	br label %LU10
LU10:
	%u69 = load i32* %mean
	store i32 %u69, i32* %_retval_
	br label %LU4
LU4:
	%u70 = load i32* %_retval_
	ret i32 %u70
}

define i32 @approxSqrt(i32 %_P_num)
{
LU12:
	%_retval_ = alloca i32
	%guess = alloca i32
	%result = alloca i32
	%prev = alloca i32
	%num = alloca i32
	store i32 %_P_num, i32* %num
	store i32 1, i32* %guess
	%u71 = load i32* %guess
	store i32 %u71, i32* %prev
	store i32 0, i32* %result
	%u72 = load i32* %result
	%u73 = load i32* %num
	%u74 = icmp slt i32 %u72, %u73
	%u75 = zext i1 %u74 to i32
	%u76 = trunc i32 %u75 to i1
	br i1 %u76, label %LU13, label %LU14
LU13:
	%u77 = load i32* %guess
	%u78 = load i32* %guess
	%u79 = mul i32 %u77, %u78
	store i32 %u79, i32* %result
	%u80 = load i32* %guess
	store i32 %u80, i32* %prev
	%u81 = load i32* %guess
	%u82 = add i32 %u81, 1
	store i32 %u82, i32* %guess
	%u83 = load i32* %result
	%u84 = load i32* %num
	%u85 = icmp slt i32 %u83, %u84
	%u86 = zext i1 %u85 to i32
	%u87 = trunc i32 %u86 to i1
	br i1 %u87, label %LU13, label %LU14
LU14:
	%u88 = load i32* %prev
	store i32 %u88, i32* %_retval_
	br label %LU11
LU11:
	%u89 = load i32* %_retval_
	ret i32 %u89
}

define void @approxSqrtAll(%struct.linkedNums* %_P_nums)
{
LU16:
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %_P_nums, %struct.linkedNums** %nums
	%u90 = load %struct.linkedNums** %nums
	%u91 = icmp ne %struct.linkedNums* %u90, null
	%u92 = zext i1 %u91 to i32
	%u93 = trunc i32 %u92 to i1
	br i1 %u93, label %LU17, label %LU18
LU17:
	%u95 = load %struct.linkedNums** %nums
	%u96 = getelementptr %struct.linkedNums* %u95, i1 0, i32 0
	%u97 = load i32* %u96
	%u94 = call i32 @approxSqrt(i32 %u97)
	call void @printf_newline(i32 %u94)
	%u98 = load %struct.linkedNums** %nums
	%u99 = getelementptr %struct.linkedNums* %u98, i1 0, i32 1
	%u100 = load %struct.linkedNums** %u99
	store %struct.linkedNums* %u100, %struct.linkedNums** %nums
	%u101 = load %struct.linkedNums** %nums
	%u102 = icmp ne %struct.linkedNums* %u101, null
	%u103 = zext i1 %u102 to i32
	%u104 = trunc i32 %u103 to i1
	br i1 %u104, label %LU17, label %LU18
LU18:
	br label %LU15
LU15:
	ret void
}

define void @range(%struct.linkedNums* %_P_nums)
{
LU20:
	%min = alloca i32
	%max = alloca i32
	%first = alloca i32
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %_P_nums, %struct.linkedNums** %nums
	store i32 0, i32* %min
	store i32 0, i32* %max
	store i32 1, i32* %first
	%u105 = load %struct.linkedNums** %nums
	%u106 = icmp ne %struct.linkedNums* %u105, null
	%u107 = zext i1 %u106 to i32
	%u108 = trunc i32 %u107 to i1
	br i1 %u108, label %LU21, label %LU22
LU21:
	%u109 = load i32* %first
	%u110 = trunc i32 %u109 to i1
	br i1 %u110, label %LU23, label %LU24
LU22:
	%u144 = load i32* %min
	call void @printf_newline(i32 %u144)
	%u145 = load i32* %max
	call void @printf_newline(i32 %u145)
	br label %LU19
LU23:
	%u111 = load %struct.linkedNums** %nums
	%u112 = getelementptr %struct.linkedNums* %u111, i1 0, i32 0
	%u113 = load i32* %u112
	store i32 %u113, i32* %min
	%u114 = load %struct.linkedNums** %nums
	%u115 = getelementptr %struct.linkedNums* %u114, i1 0, i32 0
	%u116 = load i32* %u115
	store i32 %u116, i32* %max
	store i32 0, i32* %first
	br label %LU25
LU24:
	%u117 = load %struct.linkedNums** %nums
	%u118 = getelementptr %struct.linkedNums* %u117, i1 0, i32 0
	%u119 = load i32* %u118
	%u120 = load i32* %min
	%u121 = icmp slt i32 %u119, %u120
	%u122 = zext i1 %u121 to i32
	%u123 = trunc i32 %u122 to i1
	br i1 %u123, label %LU26, label %LU27
LU25:
	%u137 = load %struct.linkedNums** %nums
	%u138 = getelementptr %struct.linkedNums* %u137, i1 0, i32 1
	%u139 = load %struct.linkedNums** %u138
	store %struct.linkedNums* %u139, %struct.linkedNums** %nums
	%u140 = load %struct.linkedNums** %nums
	%u141 = icmp ne %struct.linkedNums* %u140, null
	%u142 = zext i1 %u141 to i32
	%u143 = trunc i32 %u142 to i1
	br i1 %u143, label %LU21, label %LU22
LU19:
	ret void
LU26:
	%u124 = load %struct.linkedNums** %nums
	%u125 = getelementptr %struct.linkedNums* %u124, i1 0, i32 0
	%u126 = load i32* %u125
	store i32 %u126, i32* %min
	br label %LU28
LU27:
	%u127 = load %struct.linkedNums** %nums
	%u128 = getelementptr %struct.linkedNums* %u127, i1 0, i32 0
	%u129 = load i32* %u128
	%u130 = load i32* %max
	%u131 = icmp sgt i32 %u129, %u130
	%u132 = zext i1 %u131 to i32
	%u133 = trunc i32 %u132 to i1
	br i1 %u133, label %LU29, label %LU30
LU28:
	br label %LU25
LU29:
	%u134 = load %struct.linkedNums** %nums
	%u135 = getelementptr %struct.linkedNums* %u134, i1 0, i32 0
	%u136 = load i32* %u135
	store i32 %u136, i32* %max
	br label %LU31
LU30:
	br label %LU31
LU31:
	br label %LU28
}

define i32 @main()
{
LU33:
	%_retval_ = alloca i32
	%seed = alloca i32
	%num = alloca i32
	%mean = alloca i32
	%nums = alloca %struct.linkedNums*
	%u146 = call i32 @read()
	store i32 %u146, i32* %seed
	%u147 = call i32 @read()
	store i32 %u147, i32* %num
	%u149 = load i32* %seed
	%u150 = load i32* %num
	%u148 = call %struct.linkedNums* @getRands(i32 %u149, i32 %u150)
	store %struct.linkedNums* %u148, %struct.linkedNums** %nums
	%u152 = load %struct.linkedNums** %nums
	%u151 = call i32 @calcMean(%struct.linkedNums* %u152)
	store i32 %u151, i32* %mean
	%u153 = load i32* %mean
	call void @printf_newline(i32 %u153)
	%u154 = load %struct.linkedNums** %nums
	call void @range(%struct.linkedNums* %u154)
	%u155 = load %struct.linkedNums** %nums
	call void @approxSqrtAll(%struct.linkedNums* %u155)
	store i32 0, i32* %_retval_
	br label %LU32
LU32:
	%u156 = load i32* %_retval_
	ret i32 %u156
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
