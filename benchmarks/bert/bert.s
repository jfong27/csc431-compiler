	.align 2
	.global concatLists
concatLists:
%struct.node* %_P_first, %struct.node* %_P_second)
{
LU1:
	%_retval_ = alloca %struct.node*
	%temp = alloca %struct.node*
	%first = alloca %struct.node*
	store %struct.node* %_P_first, %struct.node** %first
	%second = alloca %struct.node*
	store %struct.node* %_P_second, %struct.node** %second
	%u0 = load %struct.node** %first
	store %struct.node* %u0, %struct.node** %temp
	%u1 = load %struct.node** %first
	%u2 = icmp eq %struct.node* %u1, null
	%u3 = zext i1 %u2 to i32
	%u4 = trunc i32 %u3 to i1
	br i1 %u4, label %LU2, label %LU3
LU2:
	%u5 = load %struct.node** %second
	store %struct.node* %u5, %struct.node** %_retval_
	br label %LU0
LU3:
	br label %LU4
LU0:
	%u25 = load %struct.node** %_retval_
	ret %struct.node* %u25
LU4:
	%u6 = load %struct.node** %temp
	%u7 = getelementptr %struct.node* %u6, i1 0, i32 1
	%u8 = load %struct.node** %u7
	%u9 = icmp ne %struct.node* %u8, null
	%u10 = zext i1 %u9 to i32
	%u11 = trunc i32 %u10 to i1
	br i1 %u11, label %LU5, label %LU6
LU5:
	%u12 = load %struct.node** %temp
	%u13 = getelementptr %struct.node* %u12, i1 0, i32 1
	%u14 = load %struct.node** %u13
	store %struct.node* %u14, %struct.node** %temp
	%u15 = load %struct.node** %temp
	%u16 = getelementptr %struct.node* %u15, i1 0, i32 1
	%u17 = load %struct.node** %u16
	%u18 = icmp ne %struct.node* %u17, null
	%u19 = zext i1 %u18 to i32
	%u20 = trunc i32 %u19 to i1
	br i1 %u20, label %LU5, label %LU6
LU6:
	%u21 = load %struct.node** %second
	%u22 = load %struct.node** %temp
	%u23 = getelementptr %struct.node* %u22, i1 0, i32 1
	store %struct.node* %u21, %struct.node** %u23
	%u24 = load %struct.node** %first
	store %struct.node* %u24, %struct.node** %_retval_
	br label %LU0
}

	.align 2
	.global add
add:
%struct.node* %_P_list, i32 %_P_toAdd)
{
LU8:
	%_retval_ = alloca %struct.node*
	%newNode = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%toAdd = alloca i32
	store i32 %_P_toAdd, i32* %toAdd
	%u26 = call i8* @malloc(i32 8)
	%u27 = bitcast i8* %u26 to %struct.node*
	store %struct.node* %u27, %struct.node** %newNode
	%u28 = load i32* %toAdd
	%u29 = load %struct.node** %newNode
	%u30 = getelementptr %struct.node* %u29, i1 0, i32 0
	store i32 %u28, i32* %u30
	%u31 = load %struct.node** %list
	%u32 = load %struct.node** %newNode
	%u33 = getelementptr %struct.node* %u32, i1 0, i32 1
	store %struct.node* %u31, %struct.node** %u33
	%u34 = load %struct.node** %newNode
	store %struct.node* %u34, %struct.node** %_retval_
	br label %LU7
LU7:
	%u35 = load %struct.node** %_retval_
	ret %struct.node* %u35
}

	.align 2
	.global size
size:
%struct.node* %_P_list)
{
LU10:
	%_retval_ = alloca i32
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%u36 = load %struct.node** %list
	%u37 = icmp eq %struct.node* %u36, null
	%u38 = zext i1 %u37 to i32
	%u39 = trunc i32 %u38 to i1
	br i1 %u39, label %LU11, label %LU12
LU11:
	store i32 0, i32* %_retval_
	br label %LU9
LU12:
	br label %LU13
LU9:
	%u45 = load i32* %_retval_
	ret i32 %u45
LU13:
	%u41 = load %struct.node** %list
	%u42 = getelementptr %struct.node* %u41, i1 0, i32 1
	%u43 = load %struct.node** %u42
	%u40 = call i32 @size(%struct.node* %u43)
	%u44 = add i32 1, %u40
	store i32 %u44, i32* %_retval_
	br label %LU9
}

	.align 2
	.global get
get:
%struct.node* %_P_list, i32 %_P_index)
{
LU15:
	%_retval_ = alloca i32
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%index = alloca i32
	store i32 %_P_index, i32* %index
	%u46 = load i32* %index
	%u47 = icmp eq i32 %u46, 0
	%u48 = zext i1 %u47 to i32
	%u49 = trunc i32 %u48 to i1
	br i1 %u49, label %LU16, label %LU17
LU16:
	%u50 = load %struct.node** %list
	%u51 = getelementptr %struct.node* %u50, i1 0, i32 0
	%u52 = load i32* %u51
	store i32 %u52, i32* %_retval_
	br label %LU14
LU17:
	br label %LU18
LU14:
	%u59 = load i32* %_retval_
	ret i32 %u59
LU18:
	%u54 = load %struct.node** %list
	%u55 = getelementptr %struct.node* %u54, i1 0, i32 1
	%u56 = load %struct.node** %u55
	%u57 = load i32* %index
	%u58 = sub i32 %u57, 1
	%u53 = call i32 @get(%struct.node* %u56, i32 %u58)
	store i32 %u53, i32* %_retval_
	br label %LU14
}

	.align 2
	.global pop
pop:
%struct.node* %_P_list)
{
LU20:
	%_retval_ = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%u60 = load %struct.node** %list
	%u61 = getelementptr %struct.node* %u60, i1 0, i32 1
	%u62 = load %struct.node** %u61
	store %struct.node* %u62, %struct.node** %list
	%u63 = load %struct.node** %list
	store %struct.node* %u63, %struct.node** %_retval_
	br label %LU19
LU19:
	%u64 = load %struct.node** %_retval_
	ret %struct.node* %u64
}

	.align 2
	.global printList
printList:
%struct.node* %_P_list)
{
LU22:
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%u65 = load %struct.node** %list
	%u66 = icmp ne %struct.node* %u65, null
	%u67 = zext i1 %u66 to i32
	%u68 = trunc i32 %u67 to i1
	br i1 %u68, label %LU23, label %LU24
LU23:
	%u69 = load %struct.node** %list
	%u70 = getelementptr %struct.node* %u69, i1 0, i32 0
	%u71 = load i32* %u70
	call void @printf_newline(i32 %u71)
	%u72 = load %struct.node** %list
	%u73 = getelementptr %struct.node* %u72, i1 0, i32 1
	%u74 = load %struct.node** %u73
	call void @printList(%struct.node* %u74)
	br label %LU25
LU24:
	br label %LU25
LU25:
	br label %LU21
LU21:
	ret void
}

	.align 2
	.global treeprint
treeprint:
%struct.tnode* %_P_root)
{
LU27:
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%u75 = load %struct.tnode** %root
	%u76 = icmp ne %struct.tnode* %u75, null
	%u77 = zext i1 %u76 to i32
	%u78 = trunc i32 %u77 to i1
	br i1 %u78, label %LU28, label %LU29
LU28:
	%u79 = load %struct.tnode** %root
	%u80 = getelementptr %struct.tnode* %u79, i1 0, i32 1
	%u81 = load %struct.tnode** %u80
	call void @treeprint(%struct.tnode* %u81)
	%u82 = load %struct.tnode** %root
	%u83 = getelementptr %struct.tnode* %u82, i1 0, i32 0
	%u84 = load i32* %u83
	call void @printf_newline(i32 %u84)
	%u85 = load %struct.tnode** %root
	%u86 = getelementptr %struct.tnode* %u85, i1 0, i32 2
	%u87 = load %struct.tnode** %u86
	call void @treeprint(%struct.tnode* %u87)
	br label %LU30
LU29:
	br label %LU30
LU30:
	br label %LU26
LU26:
	ret void
}

	.align 2
	.global freeList
freeList:
%struct.node* %_P_list)
{
LU32:
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%u88 = load %struct.node** %list
	%u89 = icmp ne %struct.node* %u88, null
	%u90 = zext i1 %u89 to i32
	%u91 = trunc i32 %u90 to i1
	br i1 %u91, label %LU33, label %LU34
LU33:
	%u92 = load %struct.node** %list
	%u93 = getelementptr %struct.node* %u92, i1 0, i32 1
	%u94 = load %struct.node** %u93
	call void @freeList(%struct.node* %u94)
	%u95 = load %struct.node** %list
	%u96 = bitcast %struct.node* %u95 to i8*
	call void @free(i8* %u96)
	br label %LU35
LU34:
	br label %LU35
LU35:
	br label %LU31
LU31:
	ret void
}

	.align 2
	.global freeTree
freeTree:
%struct.tnode* %_P_root)
{
LU37:
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%u97 = load %struct.tnode** %root
	%u98 = icmp eq %struct.tnode* %u97, null
	%u99 = zext i1 %u98 to i32
	%u100 = xor i32 1, %u99
	%u101 = trunc i32 %u100 to i1
	br i1 %u101, label %LU38, label %LU39
LU38:
	%u102 = load %struct.tnode** %root
	%u103 = getelementptr %struct.tnode* %u102, i1 0, i32 1
	%u104 = load %struct.tnode** %u103
	call void @freeTree(%struct.tnode* %u104)
	%u105 = load %struct.tnode** %root
	%u106 = getelementptr %struct.tnode* %u105, i1 0, i32 2
	%u107 = load %struct.tnode** %u106
	call void @freeTree(%struct.tnode* %u107)
	%u108 = load %struct.tnode** %root
	%u109 = bitcast %struct.tnode* %u108 to i8*
	call void @free(i8* %u109)
	br label %LU40
LU39:
	br label %LU40
LU40:
	br label %LU36
LU36:
	ret void
}

	.align 2
	.global postOrder
postOrder:
%struct.tnode* %_P_root)
{
LU42:
	%_retval_ = alloca %struct.node*
	%temp = alloca %struct.node*
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%u110 = load %struct.tnode** %root
	%u111 = icmp ne %struct.tnode* %u110, null
	%u112 = zext i1 %u111 to i32
	%u113 = trunc i32 %u112 to i1
	br i1 %u113, label %LU43, label %LU44
LU43:
	%u114 = call i8* @malloc(i32 8)
	%u115 = bitcast i8* %u114 to %struct.node*
	store %struct.node* %u115, %struct.node** %temp
	%u116 = load %struct.tnode** %root
	%u117 = getelementptr %struct.tnode* %u116, i1 0, i32 0
	%u118 = load i32* %u117
	%u119 = load %struct.node** %temp
	%u120 = getelementptr %struct.node* %u119, i1 0, i32 0
	store i32 %u118, i32* %u120
	%u121 = load %struct.node** %temp
	%u122 = getelementptr %struct.node* %u121, i1 0, i32 1
	store %struct.node* null, %struct.node** %u122
	%u126 = load %struct.tnode** %root
	%u127 = getelementptr %struct.tnode* %u126, i1 0, i32 1
	%u128 = load %struct.tnode** %u127
	%u125 = call %struct.node* @postOrder(%struct.tnode* %u128)
	%u130 = load %struct.tnode** %root
	%u131 = getelementptr %struct.tnode* %u130, i1 0, i32 2
	%u132 = load %struct.tnode** %u131
	%u129 = call %struct.node* @postOrder(%struct.tnode* %u132)
	%u124 = call %struct.node* @concatLists(%struct.node* %u125, %struct.node* %u129)
	%u133 = load %struct.node** %temp
	%u123 = call %struct.node* @concatLists(%struct.node* %u124, %struct.node* %u133)
	store %struct.node* %u123, %struct.node** %_retval_
	br label %LU41
LU44:
	br label %LU45
LU41:
	%u134 = load %struct.node** %_retval_
	ret %struct.node* %u134
LU45:
	store %struct.node* null, %struct.node** %_retval_
	br label %LU41
}

	.align 2
	.global treeadd
treeadd:
%struct.tnode* %_P_root, i32 %_P_toAdd)
{
LU47:
	%_retval_ = alloca %struct.tnode*
	%temp = alloca %struct.tnode*
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%toAdd = alloca i32
	store i32 %_P_toAdd, i32* %toAdd
	%u135 = load %struct.tnode** %root
	%u136 = icmp eq %struct.tnode* %u135, null
	%u137 = zext i1 %u136 to i32
	%u138 = trunc i32 %u137 to i1
	br i1 %u138, label %LU48, label %LU49
LU48:
	%u139 = call i8* @malloc(i32 12)
	%u140 = bitcast i8* %u139 to %struct.tnode*
	store %struct.tnode* %u140, %struct.tnode** %temp
	%u141 = load i32* %toAdd
	%u142 = load %struct.tnode** %temp
	%u143 = getelementptr %struct.tnode* %u142, i1 0, i32 0
	store i32 %u141, i32* %u143
	%u144 = load %struct.tnode** %temp
	%u145 = getelementptr %struct.tnode* %u144, i1 0, i32 1
	store %struct.tnode* null, %struct.tnode** %u145
	%u146 = load %struct.tnode** %temp
	%u147 = getelementptr %struct.tnode* %u146, i1 0, i32 2
	store %struct.tnode* null, %struct.tnode** %u147
	%u148 = load %struct.tnode** %temp
	store %struct.tnode* %u148, %struct.tnode** %_retval_
	br label %LU46
LU49:
	br label %LU50
LU46:
	%u171 = load %struct.tnode** %_retval_
	ret %struct.tnode* %u171
LU50:
	%u149 = load i32* %toAdd
	%u150 = load %struct.tnode** %root
	%u151 = getelementptr %struct.tnode* %u150, i1 0, i32 0
	%u152 = load i32* %u151
	%u153 = icmp slt i32 %u149, %u152
	%u154 = zext i1 %u153 to i32
	%u155 = trunc i32 %u154 to i1
	br i1 %u155, label %LU51, label %LU52
LU51:
	%u157 = load %struct.tnode** %root
	%u158 = getelementptr %struct.tnode* %u157, i1 0, i32 1
	%u159 = load %struct.tnode** %u158
	%u160 = load i32* %toAdd
	%u156 = call %struct.tnode* @treeadd(%struct.tnode* %u159, i32 %u160)
	%u161 = load %struct.tnode** %root
	%u162 = getelementptr %struct.tnode* %u161, i1 0, i32 1
	store %struct.tnode* %u156, %struct.tnode** %u162
	br label %LU53
LU52:
	%u164 = load %struct.tnode** %root
	%u165 = getelementptr %struct.tnode* %u164, i1 0, i32 2
	%u166 = load %struct.tnode** %u165
	%u167 = load i32* %toAdd
	%u163 = call %struct.tnode* @treeadd(%struct.tnode* %u166, i32 %u167)
	%u168 = load %struct.tnode** %root
	%u169 = getelementptr %struct.tnode* %u168, i1 0, i32 2
	store %struct.tnode* %u163, %struct.tnode** %u169
	br label %LU53
LU53:
	%u170 = load %struct.tnode** %root
	store %struct.tnode* %u170, %struct.tnode** %_retval_
	br label %LU46
}

	.align 2
	.global quickSort
quickSort:
%struct.node* %_P_list)
{
LU55:
	%_retval_ = alloca %struct.node*
	%pivot = alloca i32
	%i = alloca i32
	%less = alloca %struct.node*
	%greater = alloca %struct.node*
	%temp = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	store %struct.node* null, %struct.node** %less
	store %struct.node* null, %struct.node** %greater
	%u173 = load %struct.node** %list
	%u172 = call i32 @size(%struct.node* %u173)
	%u174 = icmp sle i32 %u172, 1
	%u175 = zext i1 %u174 to i32
	%u176 = trunc i32 %u175 to i1
	br i1 %u176, label %LU56, label %LU57
LU56:
	%u177 = load %struct.node** %list
	store %struct.node* %u177, %struct.node** %_retval_
	br label %LU54
LU57:
	br label %LU58
LU54:
	%u224 = load %struct.node** %_retval_
	ret %struct.node* %u224
LU58:
	%u179 = load %struct.node** %list
	%u178 = call i32 @get(%struct.node* %u179, i32 0)
	%u181 = load %struct.node** %list
	%u183 = load %struct.node** %list
	%u182 = call i32 @size(%struct.node* %u183)
	%u184 = sub i32 %u182, 1
	%u180 = call i32 @get(%struct.node* %u181, i32 %u184)
	%u185 = add i32 %u178, %u180
	%u186 = sdiv i32 %u185, 2
	store i32 %u186, i32* %pivot
	%u187 = load %struct.node** %list
	store %struct.node* %u187, %struct.node** %temp
	store i32 0, i32* %i
	%u188 = load %struct.node** %temp
	%u189 = icmp ne %struct.node* %u188, null
	%u190 = zext i1 %u189 to i32
	%u191 = trunc i32 %u190 to i1
	br i1 %u191, label %LU59, label %LU60
LU59:
	%u193 = load %struct.node** %list
	%u194 = load i32* %i
	%u192 = call i32 @get(%struct.node* %u193, i32 %u194)
	%u195 = load i32* %pivot
	%u196 = icmp sgt i32 %u192, %u195
	%u197 = zext i1 %u196 to i32
	%u198 = trunc i32 %u197 to i1
	br i1 %u198, label %LU61, label %LU62
LU60:
	%u218 = load %struct.node** %list
	call void @freeList(%struct.node* %u218)
	%u221 = load %struct.node** %less
	%u220 = call %struct.node* @quickSort(%struct.node* %u221)
	%u223 = load %struct.node** %greater
	%u222 = call %struct.node* @quickSort(%struct.node* %u223)
	%u219 = call %struct.node* @concatLists(%struct.node* %u220, %struct.node* %u222)
	store %struct.node* %u219, %struct.node** %_retval_
	br label %LU54
LU61:
	%u200 = load %struct.node** %greater
	%u202 = load %struct.node** %list
	%u203 = load i32* %i
	%u201 = call i32 @get(%struct.node* %u202, i32 %u203)
	%u199 = call %struct.node* @add(%struct.node* %u200, i32 %u201)
	store %struct.node* %u199, %struct.node** %greater
	br label %LU63
LU62:
	%u205 = load %struct.node** %less
	%u207 = load %struct.node** %list
	%u208 = load i32* %i
	%u206 = call i32 @get(%struct.node* %u207, i32 %u208)
	%u204 = call %struct.node* @add(%struct.node* %u205, i32 %u206)
	store %struct.node* %u204, %struct.node** %less
	br label %LU63
LU63:
	%u209 = load %struct.node** %temp
	%u210 = getelementptr %struct.node* %u209, i1 0, i32 1
	%u211 = load %struct.node** %u210
	store %struct.node* %u211, %struct.node** %temp
	%u212 = load i32* %i
	%u213 = add i32 %u212, 1
	store i32 %u213, i32* %i
	%u214 = load %struct.node** %temp
	%u215 = icmp ne %struct.node* %u214, null
	%u216 = zext i1 %u215 to i32
	%u217 = trunc i32 %u216 to i1
	br i1 %u217, label %LU59, label %LU60
}

	.align 2
	.global quickSortMain
quickSortMain:
%struct.node* %_P_list)
{
LU65:
	%_retval_ = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%u225 = load %struct.node** %list
	call void @printList(%struct.node* %u225)
	%u226 = mul i32 999, -1
	call void @printf_newline(i32 %u226)
	%u227 = load %struct.node** %list
	call void @printList(%struct.node* %u227)
	%u228 = mul i32 999, -1
	call void @printf_newline(i32 %u228)
	%u229 = load %struct.node** %list
	call void @printList(%struct.node* %u229)
	%u230 = mul i32 999, -1
	call void @printf_newline(i32 %u230)
	store %struct.node* null, %struct.node** %_retval_
	br label %LU64
LU64:
	%u231 = load %struct.node** %_retval_
	ret %struct.node* %u231
}

	.align 2
	.global treesearch
treesearch:
%struct.tnode* %_P_root, i32 %_P_target)
{
LU67:
	%_retval_ = alloca i32
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%target = alloca i32
	store i32 %_P_target, i32* %target
	%u232 = mul i32 1, -1
	call void @printf_newline(i32 %u232)
	%u233 = load %struct.tnode** %root
	%u234 = icmp ne %struct.tnode* %u233, null
	%u235 = zext i1 %u234 to i32
	%u236 = trunc i32 %u235 to i1
	br i1 %u236, label %LU68, label %LU69
LU68:
	%u237 = load %struct.tnode** %root
	%u238 = getelementptr %struct.tnode* %u237, i1 0, i32 0
	%u239 = load i32* %u238
	%u240 = load i32* %target
	%u241 = icmp eq i32 %u239, %u240
	%u242 = zext i1 %u241 to i32
	%u243 = trunc i32 %u242 to i1
	br i1 %u243, label %LU71, label %LU72
LU69:
	br label %LU70
LU71:
	store i32 1, i32* %_retval_
	br label %LU66
LU72:
	br label %LU73
LU66:
	%u260 = load i32* %_retval_
	ret i32 %u260
LU73:
	%u245 = load %struct.tnode** %root
	%u246 = getelementptr %struct.tnode* %u245, i1 0, i32 1
	%u247 = load %struct.tnode** %u246
	%u248 = load i32* %target
	%u244 = call i32 @treesearch(%struct.tnode* %u247, i32 %u248)
	%u249 = icmp eq i32 %u244, 1
	%u250 = zext i1 %u249 to i32
	%u251 = trunc i32 %u250 to i1
	br i1 %u251, label %LU74, label %LU75
LU76:
	%u253 = load %struct.tnode** %root
	%u254 = getelementptr %struct.tnode* %u253, i1 0, i32 2
	%u255 = load %struct.tnode** %u254
	%u256 = load i32* %target
	%u252 = call i32 @treesearch(%struct.tnode* %u255, i32 %u256)
	%u257 = icmp eq i32 %u252, 1
	%u258 = zext i1 %u257 to i32
	%u259 = trunc i32 %u258 to i1
	br i1 %u259, label %LU77, label %LU78
LU79:
	br label %LU70
LU74:
	store i32 1, i32* %_retval_
	br label %LU66
LU75:
	br label %LU76
LU77:
	store i32 1, i32* %_retval_
	br label %LU66
LU78:
	store i32 0, i32* %_retval_
	br label %LU66
LU70:
	store i32 0, i32* %_retval_
	br label %LU66
}

	.align 2
	.global inOrder
inOrder:
%struct.tnode* %_P_root)
{
LU81:
	%_retval_ = alloca %struct.node*
	%temp = alloca %struct.node*
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%u261 = load %struct.tnode** %root
	%u262 = icmp ne %struct.tnode* %u261, null
	%u263 = zext i1 %u262 to i32
	%u264 = trunc i32 %u263 to i1
	br i1 %u264, label %LU82, label %LU83
LU82:
	%u265 = call i8* @malloc(i32 8)
	%u266 = bitcast i8* %u265 to %struct.node*
	store %struct.node* %u266, %struct.node** %temp
	%u267 = load %struct.tnode** %root
	%u268 = getelementptr %struct.tnode* %u267, i1 0, i32 0
	%u269 = load i32* %u268
	%u270 = load %struct.node** %temp
	%u271 = getelementptr %struct.node* %u270, i1 0, i32 0
	store i32 %u269, i32* %u271
	%u272 = load %struct.node** %temp
	%u273 = getelementptr %struct.node* %u272, i1 0, i32 1
	store %struct.node* null, %struct.node** %u273
	%u276 = load %struct.tnode** %root
	%u277 = getelementptr %struct.tnode* %u276, i1 0, i32 1
	%u278 = load %struct.tnode** %u277
	%u275 = call %struct.node* @inOrder(%struct.tnode* %u278)
	%u280 = load %struct.node** %temp
	%u282 = load %struct.tnode** %root
	%u283 = getelementptr %struct.tnode* %u282, i1 0, i32 2
	%u284 = load %struct.tnode** %u283
	%u281 = call %struct.node* @inOrder(%struct.tnode* %u284)
	%u279 = call %struct.node* @concatLists(%struct.node* %u280, %struct.node* %u281)
	%u274 = call %struct.node* @concatLists(%struct.node* %u275, %struct.node* %u279)
	store %struct.node* %u274, %struct.node** %_retval_
	br label %LU80
LU83:
	store %struct.node* null, %struct.node** %_retval_
	br label %LU80
LU80:
	%u285 = load %struct.node** %_retval_
	ret %struct.node* %u285
LU84:
	br label %LU80
}

	.align 2
	.global bintreesearch
bintreesearch:
%struct.tnode* %_P_root, i32 %_P_target)
{
LU86:
	%_retval_ = alloca i32
	%root = alloca %struct.tnode*
	store %struct.tnode* %_P_root, %struct.tnode** %root
	%target = alloca i32
	store i32 %_P_target, i32* %target
	%u286 = mul i32 1, -1
	call void @printf_newline(i32 %u286)
	%u287 = load %struct.tnode** %root
	%u288 = icmp ne %struct.tnode* %u287, null
	%u289 = zext i1 %u288 to i32
	%u290 = trunc i32 %u289 to i1
	br i1 %u290, label %LU87, label %LU88
LU87:
	%u291 = load %struct.tnode** %root
	%u292 = getelementptr %struct.tnode* %u291, i1 0, i32 0
	%u293 = load i32* %u292
	%u294 = load i32* %target
	%u295 = icmp eq i32 %u293, %u294
	%u296 = zext i1 %u295 to i32
	%u297 = trunc i32 %u296 to i1
	br i1 %u297, label %LU90, label %LU91
LU88:
	br label %LU89
LU90:
	store i32 1, i32* %_retval_
	br label %LU85
LU91:
	br label %LU92
LU85:
	%u315 = load i32* %_retval_
	ret i32 %u315
LU92:
	%u298 = load i32* %target
	%u299 = load %struct.tnode** %root
	%u300 = getelementptr %struct.tnode* %u299, i1 0, i32 0
	%u301 = load i32* %u300
	%u302 = icmp slt i32 %u298, %u301
	%u303 = zext i1 %u302 to i32
	%u304 = trunc i32 %u303 to i1
	br i1 %u304, label %LU93, label %LU94
LU95:
	br label %LU89
LU93:
	%u306 = load %struct.tnode** %root
	%u307 = getelementptr %struct.tnode* %u306, i1 0, i32 1
	%u308 = load %struct.tnode** %u307
	%u309 = load i32* %target
	%u305 = call i32 @bintreesearch(%struct.tnode* %u308, i32 %u309)
	store i32 %u305, i32* %_retval_
	br label %LU85
LU94:
	%u311 = load %struct.tnode** %root
	%u312 = getelementptr %struct.tnode* %u311, i1 0, i32 2
	%u313 = load %struct.tnode** %u312
	%u314 = load i32* %target
	%u310 = call i32 @bintreesearch(%struct.tnode* %u313, i32 %u314)
	store i32 %u310, i32* %_retval_
	br label %LU85
LU89:
	store i32 0, i32* %_retval_
	br label %LU85
}

	.align 2
	.global buildTree
buildTree:
%struct.node* %_P_list)
{
LU97:
	%_retval_ = alloca %struct.tnode*
	%i = alloca i32
	%root = alloca %struct.tnode*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	store %struct.tnode* null, %struct.tnode** %root
	store i32 0, i32* %i
	%u316 = load i32* %i
	%u318 = load %struct.node** %list
	%u317 = call i32 @size(%struct.node* %u318)
	%u319 = icmp slt i32 %u316, %u317
	%u320 = zext i1 %u319 to i32
	%u321 = trunc i32 %u320 to i1
	br i1 %u321, label %LU98, label %LU99
LU98:
	%u323 = load %struct.tnode** %root
	%u325 = load %struct.node** %list
	%u326 = load i32* %i
	%u324 = call i32 @get(%struct.node* %u325, i32 %u326)
	%u322 = call %struct.tnode* @treeadd(%struct.tnode* %u323, i32 %u324)
	store %struct.tnode* %u322, %struct.tnode** %root
	%u327 = load i32* %i
	%u328 = add i32 %u327, 1
	store i32 %u328, i32* %i
	%u329 = load i32* %i
	%u331 = load %struct.node** %list
	%u330 = call i32 @size(%struct.node* %u331)
	%u332 = icmp slt i32 %u329, %u330
	%u333 = zext i1 %u332 to i32
	%u334 = trunc i32 %u333 to i1
	br i1 %u334, label %LU98, label %LU99
LU99:
	%u335 = load %struct.tnode** %root
	store %struct.tnode* %u335, %struct.tnode** %_retval_
	br label %LU96
LU96:
	%u336 = load %struct.tnode** %_retval_
	ret %struct.tnode* %u336
}

	.align 2
	.global treeMain
treeMain:
%struct.node* %_P_list)
{
LU101:
	%root = alloca %struct.tnode*
	%inList = alloca %struct.node*
	%postList = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%u338 = load %struct.node** %list
	%u337 = call %struct.tnode* @buildTree(%struct.node* %u338)
	store %struct.tnode* %u337, %struct.tnode** %root
	%u339 = load %struct.tnode** %root
	call void @treeprint(%struct.tnode* %u339)
	%u340 = mul i32 999, -1
	call void @printf_newline(i32 %u340)
	%u342 = load %struct.tnode** %root
	%u341 = call %struct.node* @inOrder(%struct.tnode* %u342)
	store %struct.node* %u341, %struct.node** %inList
	%u343 = load %struct.node** %inList
	call void @printList(%struct.node* %u343)
	%u344 = mul i32 999, -1
	call void @printf_newline(i32 %u344)
	%u345 = load %struct.node** %inList
	call void @freeList(%struct.node* %u345)
	%u347 = load %struct.tnode** %root
	%u346 = call %struct.node* @postOrder(%struct.tnode* %u347)
	store %struct.node* %u346, %struct.node** %postList
	%u348 = load %struct.node** %postList
	call void @printList(%struct.node* %u348)
	%u349 = mul i32 999, -1
	call void @printf_newline(i32 %u349)
	%u350 = load %struct.node** %postList
	call void @freeList(%struct.node* %u350)
	%u352 = load %struct.tnode** %root
	%u351 = call i32 @treesearch(%struct.tnode* %u352, i32 0)
	call void @printf_newline(i32 %u351)
	%u353 = mul i32 999, -1
	call void @printf_newline(i32 %u353)
	%u355 = load %struct.tnode** %root
	%u354 = call i32 @treesearch(%struct.tnode* %u355, i32 10)
	call void @printf_newline(i32 %u354)
	%u356 = mul i32 999, -1
	call void @printf_newline(i32 %u356)
	%u358 = load %struct.tnode** %root
	%u359 = mul i32 2, -1
	%u357 = call i32 @treesearch(%struct.tnode* %u358, i32 %u359)
	call void @printf_newline(i32 %u357)
	%u360 = mul i32 999, -1
	call void @printf_newline(i32 %u360)
	%u362 = load %struct.tnode** %root
	%u361 = call i32 @treesearch(%struct.tnode* %u362, i32 2)
	call void @printf_newline(i32 %u361)
	%u363 = mul i32 999, -1
	call void @printf_newline(i32 %u363)
	%u365 = load %struct.tnode** %root
	%u364 = call i32 @treesearch(%struct.tnode* %u365, i32 3)
	call void @printf_newline(i32 %u364)
	%u366 = mul i32 999, -1
	call void @printf_newline(i32 %u366)
	%u368 = load %struct.tnode** %root
	%u367 = call i32 @treesearch(%struct.tnode* %u368, i32 9)
	call void @printf_newline(i32 %u367)
	%u369 = mul i32 999, -1
	call void @printf_newline(i32 %u369)
	%u371 = load %struct.tnode** %root
	%u370 = call i32 @treesearch(%struct.tnode* %u371, i32 1)
	call void @printf_newline(i32 %u370)
	%u372 = mul i32 999, -1
	call void @printf_newline(i32 %u372)
	%u374 = load %struct.tnode** %root
	%u373 = call i32 @bintreesearch(%struct.tnode* %u374, i32 0)
	call void @printf_newline(i32 %u373)
	%u375 = mul i32 999, -1
	call void @printf_newline(i32 %u375)
	%u377 = load %struct.tnode** %root
	%u376 = call i32 @bintreesearch(%struct.tnode* %u377, i32 10)
	call void @printf_newline(i32 %u376)
	%u378 = mul i32 999, -1
	call void @printf_newline(i32 %u378)
	%u380 = load %struct.tnode** %root
	%u381 = mul i32 2, -1
	%u379 = call i32 @bintreesearch(%struct.tnode* %u380, i32 %u381)
	call void @printf_newline(i32 %u379)
	%u382 = mul i32 999, -1
	call void @printf_newline(i32 %u382)
	%u384 = load %struct.tnode** %root
	%u383 = call i32 @bintreesearch(%struct.tnode* %u384, i32 2)
	call void @printf_newline(i32 %u383)
	%u385 = mul i32 999, -1
	call void @printf_newline(i32 %u385)
	%u387 = load %struct.tnode** %root
	%u386 = call i32 @bintreesearch(%struct.tnode* %u387, i32 3)
	call void @printf_newline(i32 %u386)
	%u388 = mul i32 999, -1
	call void @printf_newline(i32 %u388)
	%u390 = load %struct.tnode** %root
	%u389 = call i32 @bintreesearch(%struct.tnode* %u390, i32 9)
	call void @printf_newline(i32 %u389)
	%u391 = mul i32 999, -1
	call void @printf_newline(i32 %u391)
	%u393 = load %struct.tnode** %root
	%u392 = call i32 @bintreesearch(%struct.tnode* %u393, i32 1)
	call void @printf_newline(i32 %u392)
	%u394 = mul i32 999, -1
	call void @printf_newline(i32 %u394)
	%u395 = load %struct.tnode** %root
	call void @freeTree(%struct.tnode* %u395)
	br label %LU100
LU100:
	ret void
}

	.align 2
	.global myCopy
myCopy:
%struct.node* %_P_src)
{
LU103:
	%_retval_ = alloca %struct.node*
	%src = alloca %struct.node*
	store %struct.node* %_P_src, %struct.node** %src
	%u396 = load %struct.node** %src
	%u397 = icmp eq %struct.node* %u396, null
	%u398 = zext i1 %u397 to i32
	%u399 = trunc i32 %u398 to i1
	br i1 %u399, label %LU104, label %LU105
LU104:
	store %struct.node* null, %struct.node** %_retval_
	br label %LU102
LU105:
	br label %LU106
LU102:
	%u409 = load %struct.node** %_retval_
	ret %struct.node* %u409
LU106:
	%u402 = load %struct.node** %src
	%u403 = getelementptr %struct.node* %u402, i1 0, i32 0
	%u404 = load i32* %u403
	%u401 = call %struct.node* @add(%struct.node*null, i32 %u404)
	%u406 = load %struct.node** %src
	%u407 = getelementptr %struct.node* %u406, i1 0, i32 1
	%u408 = load %struct.node** %u407
	%u405 = call %struct.node* @myCopy(%struct.node* %u408)
	%u400 = call %struct.node* @concatLists(%struct.node* %u401, %struct.node* %u405)
	store %struct.node* %u400, %struct.node** %_retval_
	br label %LU102
}

	.align 2
	.global main
main:
)
{
LU108:
	%_retval_ = alloca i32
	%i = alloca i32
	%element = alloca i32
	%myList = alloca %struct.node*
	%copyList1 = alloca %struct.node*
	%copyList2 = alloca %struct.node*
	%sortedList = alloca %struct.node*
	store %struct.node* null, %struct.node** %myList
	store %struct.node* null, %struct.node** %copyList1
	store %struct.node* null, %struct.node** %copyList2
	store i32 0, i32* %i
	%u410 = load i32* %i
	%u411 = icmp slt i32 %u410, 10
	%u412 = zext i1 %u411 to i32
	%u413 = trunc i32 %u412 to i1
	br i1 %u413, label %LU109, label %LU110
LU109:
	%u414 = call i32 @read()
	store i32 %u414, i32* %element
	%u416 = load %struct.node** %myList
	%u417 = load i32* %element
	%u415 = call %struct.node* @add(%struct.node* %u416, i32 %u417)
	store %struct.node* %u415, %struct.node** %myList
	%u419 = load %struct.node** %myList
	%u418 = call %struct.node* @myCopy(%struct.node* %u419)
	store %struct.node* %u418, %struct.node** %copyList1
	%u421 = load %struct.node** %myList
	%u420 = call %struct.node* @myCopy(%struct.node* %u421)
	store %struct.node* %u420, %struct.node** %copyList2
	%u423 = load %struct.node** %copyList1
	%u422 = call %struct.node* @quickSortMain(%struct.node* %u423)
	store %struct.node* %u422, %struct.node** %sortedList
	%u424 = load %struct.node** %sortedList
	call void @freeList(%struct.node* %u424)
	%u425 = load %struct.node** %copyList2
	call void @treeMain(%struct.node* %u425)
	%u426 = load i32* %i
	%u427 = add i32 %u426, 1
	store i32 %u427, i32* %i
	%u428 = load i32* %i
	%u429 = icmp slt i32 %u428, 10
	%u430 = zext i1 %u429 to i32
	%u431 = trunc i32 %u430 to i1
	br i1 %u431, label %LU109, label %LU110
LU110:
	%u432 = load %struct.node** %myList
	call void @freeList(%struct.node* %u432)
	%u433 = load %struct.node** %copyList1
	call void @freeList(%struct.node* %u433)
	%u434 = load %struct.node** %copyList2
	call void @freeList(%struct.node* %u434)
	store i32 0, i32* %_retval_
	br label %LU107
LU107:
	%u435 = load i32* %_retval_
	ret i32 %u435
}

