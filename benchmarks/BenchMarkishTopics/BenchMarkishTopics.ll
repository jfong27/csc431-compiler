target triple="i686"
%struct.intList = type {i32, %struct.intList*}

@intList = common global i32 0, align 4

define i32 @length(%struct.intList* %_P_list)
{
LU1:
	%_retval_ = alloca i32
	%list = alloca %struct.intList*
	store %struct.intList* %_P_list, %struct.intList** %list
	%u0 = load %struct.intList** %list
	%u1 = icmp eq %struct.intList* %u0, null
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %LU2, label %LU3
LU2:
	store i32 0, i32* %_retval_
	br label %LU0
LU3:
	br label %LU4
LU0:
	%u9 = load i32* %_retval_
	ret i32 %u9
LU4:
	%u5 = load %struct.intList** %list
	%u6 = getelementptr %struct.intList* %u5, i1 0, i32 1
	%u7 = load %struct.intList** %u6
	%u4 = call i32 @length(%struct.intList* %u7)
	%u8 = add i32 1, %u4
	store i32 %u8, i32* %_retval_
	br label %LU0
}

define %struct.intList* @addToFront(%struct.intList* %_P_list, i32 %_P_element)
{
LU6:
	%_retval_ = alloca %struct.intList*
	%front = alloca %struct.intList*
	%list = alloca %struct.intList*
	store %struct.intList* %_P_list, %struct.intList** %list
	%element = alloca i32
	store i32 %_P_element, i32* %element
	%u10 = load %struct.intList** %list
	%u11 = icmp eq %struct.intList* %u10, null
	%u12 = zext i1 %u11 to i32
	%u13 = trunc i32 %u12 to i1
	br i1 %u13, label %LU7, label %LU8
LU7:
	%u14 = call i8* @malloc(i32 8)
	%u15 = bitcast i8* %u14 to %struct.intList*
	store %struct.intList* %u15, %struct.intList** %list
	%u16 = load i32* %element
	%u17 = load %struct.intList** %list
	%u18 = getelementptr %struct.intList* %u17, i1 0, i32 0
	store i32 %u16, i32* %u18
	%u19 = load %struct.intList** %list
	%u20 = getelementptr %struct.intList* %u19, i1 0, i32 1
	store %struct.intList* null, %struct.intList** %u20
	%u21 = load %struct.intList** %list
	store %struct.intList* %u21, %struct.intList** %_retval_
	br label %LU5
LU8:
	br label %LU9
LU5:
	%u31 = load %struct.intList** %_retval_
	ret %struct.intList* %u31
LU9:
	%u22 = call i8* @malloc(i32 8)
	%u23 = bitcast i8* %u22 to %struct.intList*
	store %struct.intList* %u23, %struct.intList** %front
	%u24 = load i32* %element
	%u25 = load %struct.intList** %front
	%u26 = getelementptr %struct.intList* %u25, i1 0, i32 0
	store i32 %u24, i32* %u26
	%u27 = load %struct.intList** %list
	%u28 = load %struct.intList** %front
	%u29 = getelementptr %struct.intList* %u28, i1 0, i32 1
	store %struct.intList* %u27, %struct.intList** %u29
	%u30 = load %struct.intList** %front
	store %struct.intList* %u30, %struct.intList** %_retval_
	br label %LU5
}

define %struct.intList* @deleteFirst(%struct.intList* %_P_list)
{
LU11:
	%_retval_ = alloca %struct.intList*
	%first = alloca %struct.intList*
	%list = alloca %struct.intList*
	store %struct.intList* %_P_list, %struct.intList** %list
	%u32 = load %struct.intList** %list
	%u33 = icmp eq %struct.intList* %u32, null
	%u34 = zext i1 %u33 to i32
	%u35 = trunc i32 %u34 to i1
	br i1 %u35, label %LU12, label %LU13
LU12:
	store %struct.intList* null, %struct.intList** %_retval_
	br label %LU10
LU13:
	br label %LU14
LU10:
	%u43 = load %struct.intList** %_retval_
	ret %struct.intList* %u43
LU14:
	%u36 = load %struct.intList** %list
	store %struct.intList* %u36, %struct.intList** %first
	%u37 = load %struct.intList** %list
	%u38 = getelementptr %struct.intList* %u37, i1 0, i32 1
	%u39 = load %struct.intList** %u38
	store %struct.intList* %u39, %struct.intList** %list
	%u40 = load %struct.intList** %first
	%u41 = bitcast %struct.intList* %u40 to i8*
	call void @free(i8* %u41)
	%u42 = load %struct.intList** %list
	store %struct.intList* %u42, %struct.intList** %_retval_
	br label %LU10
}

define i32 @main()
{
LU16:
	%_retval_ = alloca i32
	%list = alloca %struct.intList*
	%sum = alloca i32
	%u44 = call i32 @read()
	store i32 %u44, i32* @intList
	store i32 0, i32* %sum
	store %struct.intList* null, %struct.intList** %list
	%u45 = load i32* @intList
	%u46 = icmp sgt i32 %u45, 0
	%u47 = zext i1 %u46 to i32
	%u48 = trunc i32 %u47 to i1
	br i1 %u48, label %LU17, label %LU18
LU17:
	%u50 = load %struct.intList** %list
	%u51 = load i32* @intList
	%u49 = call %struct.intList* @addToFront(%struct.intList* %u50, i32 %u51)
	store %struct.intList* %u49, %struct.intList** %list
	%u52 = load %struct.intList** %list
	%u53 = getelementptr %struct.intList* %u52, i1 0, i32 0
	%u54 = load i32* %u53
	call void @printf_int(i32 %u54)
	%u55 = load i32* @intList
	%u56 = sub i32 %u55, 1
	store i32 %u56, i32* @intList
	%u57 = load i32* @intList
	%u58 = icmp sgt i32 %u57, 0
	%u59 = zext i1 %u58 to i32
	%u60 = trunc i32 %u59 to i1
	br i1 %u60, label %LU17, label %LU18
LU18:
	%u62 = load %struct.intList** %list
	%u61 = call i32 @length(%struct.intList* %u62)
	call void @printf_int(i32 %u61)
	%u64 = load %struct.intList** %list
	%u63 = call i32 @length(%struct.intList* %u64)
	%u65 = icmp sgt i32 %u63, 0
	%u66 = zext i1 %u65 to i32
	%u67 = trunc i32 %u66 to i1
	br i1 %u67, label %LU19, label %LU20
LU19:
	%u68 = load i32* %sum
	%u69 = load %struct.intList** %list
	%u70 = getelementptr %struct.intList* %u69, i1 0, i32 0
	%u71 = load i32* %u70
	%u72 = add i32 %u68, %u71
	store i32 %u72, i32* %sum
	%u74 = load %struct.intList** %list
	%u73 = call i32 @length(%struct.intList* %u74)
	call void @printf_int(i32 %u73)
	%u76 = load %struct.intList** %list
	%u75 = call %struct.intList* @deleteFirst(%struct.intList* %u76)
	store %struct.intList* %u75, %struct.intList** %list
	%u78 = load %struct.intList** %list
	%u77 = call i32 @length(%struct.intList* %u78)
	%u79 = icmp sgt i32 %u77, 0
	%u80 = zext i1 %u79 to i32
	%u81 = trunc i32 %u80 to i1
	br i1 %u81, label %LU19, label %LU20
LU20:
	%u82 = load i32* %sum
	call void @printf_newline(i32 %u82)
	store i32 0, i32* %_retval_
	br label %LU15
LU15:
	%u83 = load i32* %_retval_
	ret i32 %u83
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
