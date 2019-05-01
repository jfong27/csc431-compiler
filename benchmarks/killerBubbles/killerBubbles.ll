target triple="i686"
%struct.Node = type {i32, %struct.Node*, %struct.Node*}

@swapped = common global i32 0, align 4

define i32 @compare(%struct.Node* %_P_a, %struct.Node* %_P_b)
{
LU1:
	%_retval_ = alloca i32
	%a = alloca %struct.Node*
	store %struct.Node* %_P_a, %struct.Node** %a
	%b = alloca %struct.Node*
	store %struct.Node* %_P_b, %struct.Node** %b
	%u0 = load %struct.Node** %a
	%u1 = getelementptr %struct.Node* %u0, i1 0, i32 0
	%u2 = load i32* %u1
	%u3 = load %struct.Node** %b
	%u4 = getelementptr %struct.Node* %u3, i1 0, i32 0
	%u5 = load i32* %u4
	%u6 = sub i32 %u2, %u5
	store i32 %u6, i32* %_retval_
	br label %LU0
LU0:
	%u7 = load i32* %_retval_
	ret i32 %u7
}

define void @deathSort(%struct.Node* %_P_head)
{
LU3:
	%swapped = alloca i32
	%swap = alloca i32
	%currNode = alloca %struct.Node*
	%head = alloca %struct.Node*
	store %struct.Node* %_P_head, %struct.Node** %head
	store i32 1, i32* %swapped
	%u8 = load i32* %swapped
	%u9 = icmp eq i32 %u8, 1
	%u10 = zext i1 %u9 to i32
	%u11 = trunc i32 %u10 to i1
	br i1 %u11, label %LU4, label %LU5
LU4:
	store i32 0, i32* %swapped
	%u12 = load %struct.Node** %head
	store %struct.Node* %u12, %struct.Node** %currNode
	%u13 = load %struct.Node** %currNode
	%u14 = getelementptr %struct.Node* %u13, i1 0, i32 2
	%u15 = load %struct.Node** %u14
	%u16 = load %struct.Node** %head
	%u17 = icmp ne %struct.Node* %u15, %u16
	%u18 = zext i1 %u17 to i32
	%u19 = trunc i32 %u18 to i1
	br i1 %u19, label %LU6, label %LU7
LU5:
	br label %LU2
LU6:
	%u21 = load %struct.Node** %currNode
	%u22 = load %struct.Node** %currNode
	%u23 = getelementptr %struct.Node* %u22, i1 0, i32 2
	%u24 = load %struct.Node** %u23
	%u20 = call i32 @compare(%struct.Node* %u21, %struct.Node* %u24)
	%u25 = icmp sgt i32 %u20, 0
	%u26 = zext i1 %u25 to i32
	%u27 = trunc i32 %u26 to i1
	br i1 %u27, label %LU8, label %LU9
LU7:
	%u53 = load i32* %swapped
	%u54 = icmp eq i32 %u53, 1
	%u55 = zext i1 %u54 to i32
	%u56 = trunc i32 %u55 to i1
	br i1 %u56, label %LU4, label %LU5
LU8:
	%u28 = load %struct.Node** %currNode
	%u29 = getelementptr %struct.Node* %u28, i1 0, i32 0
	%u30 = load i32* %u29
	store i32 %u30, i32* %swap
	%u31 = load %struct.Node** %currNode
	%u32 = getelementptr %struct.Node* %u31, i1 0, i32 2
	%u33 = load %struct.Node** %u32
	%u34 = getelementptr %struct.Node* %u33, i1 0, i32 0
	%u35 = load i32* %u34
	%u36 = load %struct.Node** %currNode
	%u37 = getelementptr %struct.Node* %u36, i1 0, i32 0
	store i32 %u35, i32* %u37
	%u38 = load i32* %swap
	%u39 = load %struct.Node** %currNode
	%u40 = getelementptr %struct.Node* %u39, i1 0, i32 2
	%u41 = load %struct.Node** %u40
	%u42 = getelementptr %struct.Node* %u41, i1 0, i32 0
	store i32 %u38, i32* %u42
	store i32 1, i32* %swapped
	br label %LU10
LU9:
	br label %LU10
LU10:
	%u43 = load %struct.Node** %currNode
	%u44 = getelementptr %struct.Node* %u43, i1 0, i32 2
	%u45 = load %struct.Node** %u44
	store %struct.Node* %u45, %struct.Node** %currNode
	%u46 = load %struct.Node** %currNode
	%u47 = getelementptr %struct.Node* %u46, i1 0, i32 2
	%u48 = load %struct.Node** %u47
	%u49 = load %struct.Node** %head
	%u50 = icmp ne %struct.Node* %u48, %u49
	%u51 = zext i1 %u50 to i32
	%u52 = trunc i32 %u51 to i1
	br i1 %u52, label %LU6, label %LU7
LU2:
	ret void
}

define void @printEVILList(%struct.Node* %_P_head)
{
LU12:
	%currNode = alloca %struct.Node*
	%toFree = alloca %struct.Node*
	%head = alloca %struct.Node*
	store %struct.Node* %_P_head, %struct.Node** %head
	%u57 = load %struct.Node** %head
	%u58 = getelementptr %struct.Node* %u57, i1 0, i32 2
	%u59 = load %struct.Node** %u58
	store %struct.Node* %u59, %struct.Node** %currNode
	%u60 = load %struct.Node** %head
	%u61 = getelementptr %struct.Node* %u60, i1 0, i32 0
	%u62 = load i32* %u61
	call void @printf_newline(i32 %u62)
	%u63 = load %struct.Node** %head
	%u64 = bitcast %struct.Node* %u63 to i8*
	call void @free(i8* %u64)
	%u65 = load %struct.Node** %currNode
	%u66 = load %struct.Node** %head
	%u67 = icmp ne %struct.Node* %u65, %u66
	%u68 = zext i1 %u67 to i32
	%u69 = trunc i32 %u68 to i1
	br i1 %u69, label %LU13, label %LU14
LU13:
	%u70 = load %struct.Node** %currNode
	store %struct.Node* %u70, %struct.Node** %toFree
	%u71 = load %struct.Node** %currNode
	%u72 = getelementptr %struct.Node* %u71, i1 0, i32 0
	%u73 = load i32* %u72
	call void @printf_newline(i32 %u73)
	%u74 = load %struct.Node** %currNode
	%u75 = getelementptr %struct.Node* %u74, i1 0, i32 2
	%u76 = load %struct.Node** %u75
	store %struct.Node* %u76, %struct.Node** %currNode
	%u77 = load %struct.Node** %toFree
	%u78 = bitcast %struct.Node* %u77 to i8*
	call void @free(i8* %u78)
	%u79 = load %struct.Node** %currNode
	%u80 = load %struct.Node** %head
	%u81 = icmp ne %struct.Node* %u79, %u80
	%u82 = zext i1 %u81 to i32
	%u83 = trunc i32 %u82 to i1
	br i1 %u83, label %LU13, label %LU14
LU14:
	br label %LU11
LU11:
	ret void
}

define i32 @main()
{
LU16:
	%_retval_ = alloca i32
	%numNodes = alloca i32
	%counter = alloca i32
	%currNode = alloca %struct.Node*
	%head = alloca %struct.Node*
	%previous = alloca %struct.Node*
	store i32 666, i32* @swapped
	%u84 = call i32 @read()
	store i32 %u84, i32* %numNodes
	%u85 = load i32* %numNodes
	%u86 = icmp sle i32 %u85, 0
	%u87 = zext i1 %u86 to i32
	%u88 = trunc i32 %u87 to i1
	br i1 %u88, label %LU17, label %LU18
LU17:
	%u89 = mul i32 1, -1
	call void @printf_newline(i32 %u89)
	%u90 = mul i32 1, -1
	store i32 %u90, i32* %_retval_
	br label %LU15
LU18:
	br label %LU19
LU15:
	%u135 = load i32* %_retval_
	ret i32 %u135
LU19:
	%u91 = load i32* %numNodes
	%u92 = mul i32 %u91, 1000
	store i32 %u92, i32* %numNodes
	%u93 = load i32* %numNodes
	store i32 %u93, i32* %counter
	%u94 = call i8* @malloc(i32 12)
	%u95 = bitcast i8* %u94 to %struct.Node*
	store %struct.Node* %u95, %struct.Node** %head
	%u96 = load i32* %counter
	%u97 = load %struct.Node** %head
	%u98 = getelementptr %struct.Node* %u97, i1 0, i32 0
	store i32 %u96, i32* %u98
	%u99 = load %struct.Node** %head
	%u100 = load %struct.Node** %head
	%u101 = getelementptr %struct.Node* %u100, i1 0, i32 1
	store %struct.Node* %u99, %struct.Node** %u101
	%u102 = load %struct.Node** %head
	%u103 = load %struct.Node** %head
	%u104 = getelementptr %struct.Node* %u103, i1 0, i32 2
	store %struct.Node* %u102, %struct.Node** %u104
	%u105 = load i32* %counter
	%u106 = sub i32 %u105, 1
	store i32 %u106, i32* %counter
	%u107 = load %struct.Node** %head
	store %struct.Node* %u107, %struct.Node** %previous
	%u108 = load i32* %counter
	%u109 = icmp sgt i32 %u108, 0
	%u110 = zext i1 %u109 to i32
	%u111 = trunc i32 %u110 to i1
	br i1 %u111, label %LU20, label %LU21
LU20:
	%u112 = call i8* @malloc(i32 12)
	%u113 = bitcast i8* %u112 to %struct.Node*
	store %struct.Node* %u113, %struct.Node** %currNode
	%u114 = load i32* %counter
	%u115 = load %struct.Node** %currNode
	%u116 = getelementptr %struct.Node* %u115, i1 0, i32 0
	store i32 %u114, i32* %u116
	%u117 = load %struct.Node** %previous
	%u118 = load %struct.Node** %currNode
	%u119 = getelementptr %struct.Node* %u118, i1 0, i32 1
	store %struct.Node* %u117, %struct.Node** %u119
	%u120 = load %struct.Node** %head
	%u121 = load %struct.Node** %currNode
	%u122 = getelementptr %struct.Node* %u121, i1 0, i32 2
	store %struct.Node* %u120, %struct.Node** %u122
	%u123 = load %struct.Node** %currNode
	%u124 = load %struct.Node** %previous
	%u125 = getelementptr %struct.Node* %u124, i1 0, i32 2
	store %struct.Node* %u123, %struct.Node** %u125
	%u126 = load %struct.Node** %currNode
	store %struct.Node* %u126, %struct.Node** %previous
	%u127 = load i32* %counter
	%u128 = sub i32 %u127, 1
	store i32 %u128, i32* %counter
	%u129 = load i32* %counter
	%u130 = icmp sgt i32 %u129, 0
	%u131 = zext i1 %u130 to i32
	%u132 = trunc i32 %u131 to i1
	br i1 %u132, label %LU20, label %LU21
LU21:
	%u133 = load %struct.Node** %head
	call void @deathSort(%struct.Node* %u133)
	%u134 = load %struct.Node** %head
	call void @printEVILList(%struct.Node* %u134)
	store i32 0, i32* %_retval_
	br label %LU15
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
