	.align 2
	.global wait
wait:
i32 %_P_waitTime)
{
LU1:
	%_retval_ = alloca i32
	%waitTime = alloca i32
	store i32 %_P_waitTime, i32* %waitTime
	%u0 = load i32* %waitTime
	%u1 = icmp sgt i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %LU2, label %LU3
LU2:
	%u4 = load i32* %waitTime
	%u5 = sub i32 %u4, 1
	store i32 %u5, i32* %waitTime
	%u6 = load i32* %waitTime
	%u7 = icmp sgt i32 %u6, 0
	%u8 = zext i1 %u7 to i32
	%u9 = trunc i32 %u8 to i1
	br i1 %u9, label %LU2, label %LU3
LU3:
	store i32 0, i32* %_retval_
	br label %LU0
LU0:
	%u10 = load i32* %_retval_
	ret i32 %u10
}

	.align 2
	.global power
power:
i32 %_P_base, i32 %_P_exponent)
{
LU5:
	%_retval_ = alloca i32
	%product = alloca i32
	%base = alloca i32
	store i32 %_P_base, i32* %base
	%exponent = alloca i32
	store i32 %_P_exponent, i32* %exponent
	store i32 1, i32* %product
	%u11 = load i32* %exponent
	%u12 = icmp sgt i32 %u11, 0
	%u13 = zext i1 %u12 to i32
	%u14 = trunc i32 %u13 to i1
	br i1 %u14, label %LU6, label %LU7
LU6:
	%u15 = load i32* %product
	%u16 = load i32* %base
	%u17 = mul i32 %u15, %u16
	store i32 %u17, i32* %product
	%u18 = load i32* %exponent
	%u19 = sub i32 %u18, 1
	store i32 %u19, i32* %exponent
	%u20 = load i32* %exponent
	%u21 = icmp sgt i32 %u20, 0
	%u22 = zext i1 %u21 to i32
	%u23 = trunc i32 %u22 to i1
	br i1 %u23, label %LU6, label %LU7
LU7:
	%u24 = load i32* %product
	store i32 %u24, i32* %_retval_
	br label %LU4
LU4:
	%u25 = load i32* %_retval_
	ret i32 %u25
}

	.align 2
	.global recursiveDecimalSum
recursiveDecimalSum:
i32 %_P_binaryNum, i32 %_P_decimalSum, i32 %_P_recursiveDepth)
{
LU9:
	%_retval_ = alloca i32
	%tempNum = alloca i32
	%base = alloca i32
	%remainder = alloca i32
	%binaryNum = alloca i32
	store i32 %_P_binaryNum, i32* %binaryNum
	%decimalSum = alloca i32
	store i32 %_P_decimalSum, i32* %decimalSum
	%recursiveDepth = alloca i32
	store i32 %_P_recursiveDepth, i32* %recursiveDepth
	%u26 = load i32* %binaryNum
	%u27 = icmp sgt i32 %u26, 0
	%u28 = zext i1 %u27 to i32
	%u29 = trunc i32 %u28 to i1
	br i1 %u29, label %LU10, label %LU11
LU10:
	store i32 2, i32* %base
	%u30 = load i32* %binaryNum
	%u31 = sdiv i32 %u30, 10
	store i32 %u31, i32* %tempNum
	%u32 = load i32* %tempNum
	%u33 = mul i32 %u32, 10
	store i32 %u33, i32* %tempNum
	%u34 = load i32* %binaryNum
	%u35 = load i32* %tempNum
	%u36 = sub i32 %u34, %u35
	store i32 %u36, i32* %tempNum
	%u37 = load i32* %tempNum
	%u38 = icmp eq i32 %u37, 1
	%u39 = zext i1 %u38 to i32
	%u40 = trunc i32 %u39 to i1
	br i1 %u40, label %LU13, label %LU14
LU11:
	br label %LU12
LU13:
	%u41 = load i32* %decimalSum
	%u43 = load i32* %base
	%u44 = load i32* %recursiveDepth
	%u42 = call i32 @power(i32 %u43, i32 %u44)
	%u45 = add i32 %u41, %u42
	store i32 %u45, i32* %decimalSum
	br label %LU15
LU14:
	br label %LU15
LU15:
	%u47 = load i32* %binaryNum
	%u48 = sdiv i32 %u47, 10
	%u49 = load i32* %decimalSum
	%u50 = load i32* %recursiveDepth
	%u51 = add i32 %u50, 1
	%u46 = call i32 @recursiveDecimalSum(i32 %u48, i32 %u49, i32 %u51)
	store i32 %u46, i32* %_retval_
	br label %LU8
LU8:
	%u53 = load i32* %_retval_
	ret i32 %u53
LU12:
	%u52 = load i32* %decimalSum
	store i32 %u52, i32* %_retval_
	br label %LU8
}

	.align 2
	.global convertToDecimal
convertToDecimal:
i32 %_P_binaryNum)
{
LU17:
	%_retval_ = alloca i32
	%recursiveDepth = alloca i32
	%decimalSum = alloca i32
	%binaryNum = alloca i32
	store i32 %_P_binaryNum, i32* %binaryNum
	store i32 0, i32* %recursiveDepth
	store i32 0, i32* %decimalSum
	%u55 = load i32* %binaryNum
	%u56 = load i32* %decimalSum
	%u57 = load i32* %recursiveDepth
	%u54 = call i32 @recursiveDecimalSum(i32 %u55, i32 %u56, i32 %u57)
	store i32 %u54, i32* %_retval_
	br label %LU16
LU16:
	%u58 = load i32* %_retval_
	ret i32 %u58
}

	.align 2
	.global main
main:
)
{
LU19:
	%_retval_ = alloca i32
	%number = alloca i32
	%waitTime = alloca i32
	%u59 = call i32 @read()
	store i32 %u59, i32* %number
	%u61 = load i32* %number
	%u60 = call i32 @convertToDecimal(i32 %u61)
	store i32 %u60, i32* %number
	%u62 = load i32* %number
	%u63 = load i32* %number
	%u64 = mul i32 %u62, %u63
	store i32 %u64, i32* %waitTime
	%u65 = load i32* %waitTime
	%u66 = icmp sgt i32 %u65, 0
	%u67 = zext i1 %u66 to i32
	%u68 = trunc i32 %u67 to i1
	br i1 %u68, label %LU20, label %LU21
LU20:
	%u70 = load i32* %waitTime
	%u69 = call i32 @wait(i32 %u70)
	%u71 = load i32* %waitTime
	%u72 = sub i32 %u71, 1
	store i32 %u72, i32* %waitTime
	%u73 = load i32* %waitTime
	%u74 = icmp sgt i32 %u73, 0
	%u75 = zext i1 %u74 to i32
	%u76 = trunc i32 %u75 to i1
	br i1 %u76, label %LU20, label %LU21
LU21:
	%u77 = load i32* %number
	call void @printf_newline(i32 %u77)
	store i32 0, i32* %_retval_
	br label %LU18
LU18:
	%u78 = load i32* %_retval_
	ret i32 %u78
}

