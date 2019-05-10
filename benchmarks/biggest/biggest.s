	.align 2
	.global getIntList
getIntList:
)
{
LU1:
	%_retval_ = alloca %struct.IntList*
	%list = alloca %struct.IntList*
	%next = alloca i32
	%u0 = call i8* @malloc(i32 8)
	%u1 = bitcast i8* %u0 to %struct.IntList*
	store %struct.IntList* %u1, %struct.IntList** %list
	%u2 = call i32 @read()
	store i32 %u2, i32* %next
	%u3 = load i32* %next
	%u4 = mul i32 1, -1
	%u5 = icmp eq i32 %u3, %u4
	%u6 = zext i1 %u5 to i32
	%u7 = trunc i32 %u6 to i1
	br i1 %u7, label %LU2, label %LU3
LU2:
	%u8 = load i32* %next
	%u9 = load %struct.IntList** %list
	%u10 = getelementptr %struct.IntList* %u9, i1 0, i32 0
	store i32 %u8, i32* %u10
	%u11 = load %struct.IntList** %list
	%u12 = getelementptr %struct.IntList* %u11, i1 0, i32 1
	store %struct.IntList* null, %struct.IntList** %u12
	%u13 = load %struct.IntList** %list
	store %struct.IntList* %u13, %struct.IntList** %_retval_
	br label %LU0
LU3:
	%u14 = load i32* %next
	%u15 = load %struct.IntList** %list
	%u16 = getelementptr %struct.IntList* %u15, i1 0, i32 0
	store i32 %u14, i32* %u16
	%u17 = call %struct.IntList* @getIntList()
	%u18 = load %struct.IntList** %list
	%u19 = getelementptr %struct.IntList* %u18, i1 0, i32 1
	store %struct.IntList* %u17, %struct.IntList** %u19
	%u20 = load %struct.IntList** %list
	store %struct.IntList* %u20, %struct.IntList** %_retval_
	br label %LU0
LU0:
	%u21 = load %struct.IntList** %_retval_
	ret %struct.IntList* %u21
LU4:
	br label %LU0
}

	.align 2
	.global biggest
biggest:
i32 %_P_num1, i32 %_P_num2)
{
LU6:
	%_retval_ = alloca i32
	%num1 = alloca i32
	store i32 %_P_num1, i32* %num1
	%num2 = alloca i32
	store i32 %_P_num2, i32* %num2
	%u22 = load i32* %num1
	%u23 = load i32* %num2
	%u24 = icmp sgt i32 %u22, %u23
	%u25 = zext i1 %u24 to i32
	%u26 = trunc i32 %u25 to i1
	br i1 %u26, label %LU7, label %LU8
LU7:
	%u27 = load i32* %num1
	store i32 %u27, i32* %_retval_
	br label %LU5
LU8:
	%u28 = load i32* %num2
	store i32 %u28, i32* %_retval_
	br label %LU5
LU5:
	%u29 = load i32* %_retval_
	ret i32 %u29
LU9:
	br label %LU5
}

	.align 2
	.global biggestInList
biggestInList:
%struct.IntList* %_P_list)
{
LU11:
	%_retval_ = alloca i32
	%big = alloca i32
	%list = alloca %struct.IntList*
	store %struct.IntList* %_P_list, %struct.IntList** %list
	%u30 = load %struct.IntList** %list
	%u31 = getelementptr %struct.IntList* %u30, i1 0, i32 0
	%u32 = load i32* %u31
	store i32 %u32, i32* %big
	%u33 = load %struct.IntList** %list
	%u34 = getelementptr %struct.IntList* %u33, i1 0, i32 1
	%u35 = load %struct.IntList** %u34
	%u36 = icmp ne %struct.IntList* %u35, null
	%u37 = zext i1 %u36 to i32
	%u38 = trunc i32 %u37 to i1
	br i1 %u38, label %LU12, label %LU13
LU12:
	%u40 = load i32* %big
	%u41 = load %struct.IntList** %list
	%u42 = getelementptr %struct.IntList* %u41, i1 0, i32 0
	%u43 = load i32* %u42
	%u39 = call i32 @biggest(i32 %u40, i32 %u43)
	store i32 %u39, i32* %big
	%u44 = load %struct.IntList** %list
	%u45 = getelementptr %struct.IntList* %u44, i1 0, i32 1
	%u46 = load %struct.IntList** %u45
	store %struct.IntList* %u46, %struct.IntList** %list
	%u47 = load %struct.IntList** %list
	%u48 = getelementptr %struct.IntList* %u47, i1 0, i32 1
	%u49 = load %struct.IntList** %u48
	%u50 = icmp ne %struct.IntList* %u49, null
	%u51 = zext i1 %u50 to i32
	%u52 = trunc i32 %u51 to i1
	br i1 %u52, label %LU12, label %LU13
LU13:
	%u53 = load i32* %big
	store i32 %u53, i32* %_retval_
	br label %LU10
LU10:
	%u54 = load i32* %_retval_
	ret i32 %u54
}

	.align 2
	.global main
main:
)
{
LU15:
	%_retval_ = alloca i32
	%list = alloca %struct.IntList*
	%u55 = call %struct.IntList* @getIntList()
	store %struct.IntList* %u55, %struct.IntList** %list
	%u57 = load %struct.IntList** %list
	%u56 = call i32 @biggestInList(%struct.IntList* %u57)
	call void @printf_newline(i32 %u56)
	store i32 0, i32* %_retval_
	br label %LU14
LU14:
	%u58 = load i32* %_retval_
	ret i32 %u58
}

