target triple="i686"
%struct.node = type {i32, %struct.node*}
%struct.tnode = type {i32, %struct.tnode*, %struct.tnode*}
%struct.i = type {i32}
%struct.myCopy = type {i32}

@a = common global i32 0, align 4
@b = common global i32 0, align 4
@i = common global %struct.i* null, align 4

define %struct.node* @concatLists(%struct.node* %first, %struct.node* %second)
{
LU1:
	%u0 = icmp eq %struct.node* %first, null
	%u1 = zext i1 %u0 to i32
	%u2 = trunc i32 %u1 to i1
	br i1 %u2, label %LU2, label %LU3
LU2:
	br label %LU0
LU3:
	br label %LU4
LU0:
	ret %struct.node* %second
LU4:
	%u3 = phi %struct.node* 
	%u4 = getelementptr %struct.node* %u3, i1 0, i32 1
	%u5 = load %struct.node** %u4
	%u6 = icmp ne %struct.node* %u5, null
	%u7 = zext i1 %u6 to i32
	%u8 = trunc i32 %u7 to i1
	br i1 %u8, label %LU5, label %LU6
LU5:
	%u9 = phi %struct.node* 
	%u10 = getelementptr %struct.node* %u9, i1 0, i32 1
	%u11 = load %struct.node** %u10
	%u12 = load %struct.node** %temp
	%u13 = getelementptr %struct.node* %u12, i1 0, i32 1
	%u14 = load %struct.node** %u13
	%u15 = icmp ne %struct.node* %u14, null
	%u16 = zext i1 %u15 to i32
	%u17 = trunc i32 %u16 to i1
	br i1 %u17, label %LU5, label %LU6
LU6:
	%u18 = phi %struct.node* 
	%u19 = phi %struct.node* 
	%u21 = phi %struct.node* 
	%u20 = getelementptr %struct.node* %u19, i1 0, i32 1
	br label %LU0
}

define %struct.node* @add(%struct.node* %list, i32 %toAdd)
{
LU8:
	%u22 = call i8* @malloc(i32 8)
	%u23 = bitcast i8* %u22 to %struct.node*
	%u24 = getelementptr %struct.node* %u23, i1 0, i32 0
	%u25 = getelementptr %struct.node* %u23, i1 0, i32 1
	br label %LU7
LU7:
	ret %struct.node* %u23
}

define i32 @size(%struct.node* %list)
{
LU10:
	%u26 = icmp eq %struct.node* %list, null
	%u27 = zext i1 %u26 to i32
	%u28 = trunc i32 %u27 to i1
	br i1 %u28, label %LU11, label %LU12
LU11:
	br label %LU9
LU12:
	br label %LU13
LU9:
	ret i32 0
LU13:
	%u30 = phi %struct.node* 
	%u31 = getelementptr %struct.node* %u30, i1 0, i32 1
	%u32 = load %struct.node** %u31
	%u29 = call i32 @size(%struct.node* %u32)
	%u33 = add i32 1, %u29
	br label %LU9
}

define i32 @get(%struct.node* %list, i32 %index)
{
LU15:
	%u34 = icmp eq i32 %index, 0
	%u35 = zext i1 %u34 to i32
	%u36 = trunc i32 %u35 to i1
	br i1 %u36, label %LU16, label %LU17
LU16:
	%u37 = getelementptr %struct.node* %list, i1 0, i32 0
	%u38 = load i32* %u37
	br label %LU14
LU17:
	br label %LU18
LU14:
	ret i32 %u38
LU18:
	%u40 = phi %struct.node* 
	%u43 = phi i32 
	%u41 = getelementptr %struct.node* %u40, i1 0, i32 1
	%u42 = load %struct.node** %u41
	%u44 = sub i32 %u43, 1
	%u39 = call i32 @get(%struct.node* %u42, i32 %u44)
	br label %LU14
}

define %struct.node* @pop(%struct.node* %list)
{
LU20:
	%u45 = getelementptr %struct.node* %list, i1 0, i32 1
	%u46 = load %struct.node** %u45
	br label %LU19
LU19:
	ret %struct.node* %u46
}

define void @printList(%struct.node* %list)
{
LU22:
	%u47 = icmp ne %struct.node* %list, null
	%u48 = zext i1 %u47 to i32
	%u49 = trunc i32 %u48 to i1
	br i1 %u49, label %LU23, label %LU24
LU23:
	%u50 = getelementptr %struct.node* %list, i1 0, i32 0
	%u51 = load i32* %u50
	call void @printf_newline(i32 %u51)
	%u52 = getelementptr %struct.node* %list, i1 0, i32 1
	%u53 = load %struct.node** %u52
	call void @printList(%struct.node* %u53)
	br label %LU25
LU24:
	br label %LU25
LU25:
	br label %LU21
LU21:
	ret void
}

define void @treeprint(%struct.tnode* %root)
{
LU27:
	%u54 = icmp ne %struct.tnode* %root, null
	%u55 = zext i1 %u54 to i32
	%u56 = trunc i32 %u55 to i1
	br i1 %u56, label %LU28, label %LU29
LU28:
	%u57 = getelementptr %struct.tnode* %root, i1 0, i32 1
	%u58 = load %struct.tnode** %u57
	call void @treeprint(%struct.tnode* %u58)
	%u59 = getelementptr %struct.tnode* %root, i1 0, i32 0
	%u60 = load i32* %u59
	call void @printf_newline(i32 %u60)
	%u61 = getelementptr %struct.tnode* %root, i1 0, i32 2
	%u62 = load %struct.tnode** %u61
	call void @treeprint(%struct.tnode* %u62)
	br label %LU30
LU29:
	br label %LU30
LU30:
	br label %LU26
LU26:
	ret void
}

define void @freeList(%struct.node* %list)
{
LU32:
	%u63 = icmp ne %struct.node* %list, null
	%u64 = zext i1 %u63 to i32
	%u65 = trunc i32 %u64 to i1
	br i1 %u65, label %LU33, label %LU34
LU33:
	%u66 = getelementptr %struct.node* %list, i1 0, i32 1
	%u67 = load %struct.node** %u66
	call void @freeList(%struct.node* %u67)
	br label %LU35
LU34:
	br label %LU35
LU35:
	br label %LU31
LU31:
	ret void
}

define void @freeTree(%struct.tnode* %root)
{
LU37:
	%u68 = load %struct.tnode** %root
	%u69 = icmp eq %struct.tnode* %u68, null
	%u70 = zext i1 %u69 to i32
	Test instruction: How to do NOT? UnaryExpr
	%u72 = trunc i32 %u71 to i1
	br i1 %u72, label %LU38, label %LU39
LU38:
	%u73 = getelementptr %struct.tnode* %root, i1 0, i32 1
	%u74 = load %struct.tnode** %u73
	call void @freeTree(%struct.tnode* %u74)
	%u75 = getelementptr %struct.tnode* %root, i1 0, i32 2
	%u76 = load %struct.tnode** %u75
	call void @freeTree(%struct.tnode* %u76)
	br label %LU40
LU39:
	br label %LU40
LU40:
	br label %LU36
LU36:
	ret void
}

define %struct.node* @postOrder(%struct.tnode* %root)
{
LU42:
	%u77 = icmp ne %struct.tnode* %root, null
	%u78 = zext i1 %u77 to i32
	%u79 = trunc i32 %u78 to i1
	br i1 %u79, label %LU43, label %LU44
LU43:
	%u80 = call i8* @malloc(i32 8)
	%u81 = bitcast i8* %u80 to %struct.node*
	%u82 = getelementptr %struct.tnode* %root, i1 0, i32 0
	%u83 = load i32* %u82
	%u84 = getelementptr %struct.node* %u81, i1 0, i32 0
	%u85 = getelementptr %struct.node* %u81, i1 0, i32 1
	%u89 = getelementptr %struct.tnode* %root, i1 0, i32 1
	%u90 = load %struct.tnode** %u89
	%u88 = call %struct.node* @postOrder(%struct.tnode* %u90)
	%u92 = getelementptr %struct.tnode* %root, i1 0, i32 2
	%u93 = load %struct.tnode** %u92
	%u91 = call %struct.node* @postOrder(%struct.tnode* %u93)
	%u87 = call %struct.node* @concatLists(%struct.node* %u88, %struct.node* %u91)
	%u86 = call %struct.node* @concatLists(%struct.node* %u87, %struct.node* %u81)
	br label %LU41
LU44:
	br label %LU45
LU41:
	ret %struct.node* %u86
LU45:
	br label %LU41
}

define %struct.tnode* @treeadd(%struct.tnode* %root, i32 %toAdd)
{
LU47:
	%u94 = icmp eq %struct.tnode* %root, null
	%u95 = zext i1 %u94 to i32
	%u96 = trunc i32 %u95 to i1
	br i1 %u96, label %LU48, label %LU49
LU48:
	%u97 = call i8* @malloc(i32 12)
	%u98 = bitcast i8* %u97 to %struct.tnode*
	%u99 = getelementptr %struct.tnode* %u98, i1 0, i32 0
	%u100 = getelementptr %struct.tnode* %u98, i1 0, i32 1
	%u101 = getelementptr %struct.tnode* %u98, i1 0, i32 2
	br label %LU46
LU49:
	br label %LU50
LU46:
	ret %struct.tnode* %u98
LU50:
	%u102 = phi i32 
	%u103 = phi %struct.tnode* 
	%u110 = phi %struct.tnode* 
	%u113 = phi i32 
	%u114 = phi %struct.tnode* 
	%u117 = phi %struct.tnode* 
	%u120 = phi i32 
	%u121 = phi %struct.tnode* 
	%u104 = getelementptr %struct.tnode* %u103, i1 0, i32 0
	%u105 = load i32* %u104
	%u106 = icmp slt i32 %u102, %u105
	%u107 = zext i1 %u106 to i32
	%u108 = trunc i32 %u107 to i1
	br i1 %u108, label %LU51, label %LU52
LU51:
	%u111 = getelementptr %struct.tnode* %u110, i1 0, i32 1
	%u112 = load %struct.tnode** %u111
	%u109 = call %struct.tnode* @treeadd(%struct.tnode* %u112, i32 %u113)
	%u115 = getelementptr %struct.tnode* %u114, i1 0, i32 1
	br label %LU53
LU52:
	%u118 = getelementptr %struct.tnode* %u117, i1 0, i32 2
	%u119 = load %struct.tnode** %u118
	%u116 = call %struct.tnode* @treeadd(%struct.tnode* %u119, i32 %u120)
	%u122 = getelementptr %struct.tnode* %u121, i1 0, i32 2
	br label %LU53
LU53:
	%u123 = phi %struct.tnode* 
	br label %LU46
}

define %struct.node* @quickSort(%struct.node* %list)
{
LU55:
	%u124 = call i32 @size(%struct.node* %list)
	%u125 = icmp sle i32 %u124, 1
	%u126 = zext i1 %u125 to i32
	%u127 = trunc i32 %u126 to i1
	br i1 %u127, label %LU56, label %LU57
LU56:
	br label %LU54
LU57:
	br label %LU58
LU54:
	ret %struct.node* %list
LU58:
	%u129 = phi %struct.node* 
	%u131 = phi %struct.node* 
	%u133 = phi %struct.node* 
	%u137 = phi %struct.node* 
	%u128 = call i32 @get(%struct.node* %u129, i32 0)
	%u132 = call i32 @size(%struct.node* %u133)
	%u134 = sub i32 %u132, 1
	%u130 = call i32 @get(%struct.node* %u131, i32 %u134)
	%u135 = add i32 %u128, %u130
	%u136 = sdiv i32 %u135, 2
	%u138 = icmp ne %struct.node* %u137, null
	%u139 = zext i1 %u138 to i32
	%u140 = trunc i32 %u139 to i1
	br i1 %u140, label %LU59, label %LU60
LU59:
	%u142 = phi %struct.node* 
	%u143 = phi i32 
	%u144 = phi i32 
	%u149 = phi %struct.node* 
	%u151 = phi %struct.node* 
	%u152 = phi i32 
	%u154 = phi %struct.node* 
	%u156 = phi %struct.node* 
	%u157 = phi i32 
	%u141 = call i32 @get(%struct.node* %u142, i32 %u143)
	%u145 = icmp sgt i32 %u141, %u144
	%u146 = zext i1 %u145 to i32
	%u147 = trunc i32 %u146 to i1
	br i1 %u147, label %LU61, label %LU62
LU60:
	%u167 = phi %struct.node* 
	%u170 = phi %struct.node* 
	%u172 = phi %struct.node* 
	call void @freeList(%struct.node* %u167)
	%u169 = call %struct.node* @quickSort(%struct.node* %u170)
	%u171 = call %struct.node* @quickSort(%struct.node* %u172)
	%u168 = call %struct.node* @concatLists(%struct.node* %u169, %struct.node* %u171)
	br label %LU54
LU61:
	%u150 = call i32 @get(%struct.node* %u151, i32 %u152)
	%u148 = call %struct.node* @add(%struct.node* %u149, i32 %u150)
	br label %LU63
LU62:
	%u155 = call i32 @get(%struct.node* %u156, i32 %u157)
	%u153 = call %struct.node* @add(%struct.node* %u154, i32 %u155)
	br label %LU63
LU63:
	%u158 = phi %struct.node* 
	%u161 = phi i32 
	%u159 = getelementptr %struct.node* %u158, i1 0, i32 1
	%u160 = load %struct.node** %u159
	%u162 = add i32 %u161, 1
	%u163 = load %struct.node** %temp
	%u164 = icmp ne %struct.node* %u163, null
	%u165 = zext i1 %u164 to i32
	%u166 = trunc i32 %u165 to i1
	br i1 %u166, label %LU59, label %LU60
}

define %struct.node* @quickSortMain(%struct.node* %list)
{
LU65:
	call void @printList(%struct.node* %list)
	%u173 = mul i32 999, -1
	call void @printf_newline(i32 %u173)
	call void @printList(%struct.node* %list)
	%u174 = mul i32 999, -1
	call void @printf_newline(i32 %u174)
	call void @printList(%struct.node* %list)
	%u175 = mul i32 999, -1
	call void @printf_newline(i32 %u175)
	br label %LU64
LU64:
	ret null null
}

define i32 @treesearch(%struct.tnode* %root, i32 %target)
{
LU67:
	%u176 = mul i32 1, -1
	call void @printf_newline(i32 %u176)
	%u177 = icmp ne %struct.tnode* %root, null
	%u178 = zext i1 %u177 to i32
	%u179 = trunc i32 %u178 to i1
	br i1 %u179, label %LU68, label %LU69
LU68:
	%u180 = getelementptr %struct.tnode* %root, i1 0, i32 0
	%u181 = load i32* %u180
	%u182 = icmp eq i32 %u181, %target
	%u183 = zext i1 %u182 to i32
	%u184 = trunc i32 %u183 to i1
	br i1 %u184, label %LU71, label %LU72
LU69:
	br label %LU70
LU71:
	br label %LU66
LU72:
	br label %LU73
LU66:
	ret i32 1
LU73:
	%u186 = phi %struct.tnode* 
	%u189 = phi i32 
	%u187 = getelementptr %struct.tnode* %u186, i1 0, i32 1
	%u188 = load %struct.tnode** %u187
	%u185 = call i32 @treesearch(%struct.tnode* %u188, i32 %u189)
	%u190 = icmp eq i32 %u185, 1
	%u191 = zext i1 %u190 to i32
	%u192 = trunc i32 %u191 to i1
	br i1 %u192, label %LU74, label %LU75
LU76:
	%u194 = phi %struct.tnode* 
	%u197 = phi i32 
	%u195 = getelementptr %struct.tnode* %u194, i1 0, i32 2
	%u196 = load %struct.tnode** %u195
	%u193 = call i32 @treesearch(%struct.tnode* %u196, i32 %u197)
	%u198 = icmp eq i32 %u193, 1
	%u199 = zext i1 %u198 to i32
	%u200 = trunc i32 %u199 to i1
	br i1 %u200, label %LU77, label %LU78
LU79:
	br label %LU70
LU74:
	br label %LU66
LU75:
	br label %LU76
LU77:
	br label %LU66
LU78:
	br label %LU66
LU70:
	br label %LU66
}

define %struct.node* @inOrder(%struct.tnode* %root)
{
LU81:
	%u201 = icmp ne %struct.tnode* %root, null
	%u202 = zext i1 %u201 to i32
	%u203 = trunc i32 %u202 to i1
	br i1 %u203, label %LU82, label %LU83
LU82:
	%u204 = call i8* @malloc(i32 8)
	%u205 = bitcast i8* %u204 to %struct.node*
	%u206 = getelementptr %struct.tnode* %root, i1 0, i32 0
	%u207 = load i32* %u206
	%u208 = getelementptr %struct.node* %u205, i1 0, i32 0
	%u209 = getelementptr %struct.node* %u205, i1 0, i32 1
	%u212 = getelementptr %struct.tnode* %root, i1 0, i32 1
	%u213 = load %struct.tnode** %u212
	%u211 = call %struct.node* @inOrder(%struct.tnode* %u213)
	%u216 = getelementptr %struct.tnode* %root, i1 0, i32 2
	%u217 = load %struct.tnode** %u216
	%u215 = call %struct.node* @inOrder(%struct.tnode* %u217)
	%u214 = call %struct.node* @concatLists(%struct.node* %u205, %struct.node* %u215)
	%u210 = call %struct.node* @concatLists(%struct.node* %u211, %struct.node* %u214)
	br label %LU80
LU83:
	br label %LU80
LU80:
	ret %struct.node* %u210
LU84:
	br label %LU80
}

define i32 @bintreesearch(%struct.tnode* %root, i32 %target)
{
LU86:
	%u218 = mul i32 1, -1
	call void @printf_newline(i32 %u218)
	%u219 = icmp ne %struct.tnode* %root, null
	%u220 = zext i1 %u219 to i32
	%u221 = trunc i32 %u220 to i1
	br i1 %u221, label %LU87, label %LU88
LU87:
	%u222 = getelementptr %struct.tnode* %root, i1 0, i32 0
	%u223 = load i32* %u222
	%u224 = icmp eq i32 %u223, %target
	%u225 = zext i1 %u224 to i32
	%u226 = trunc i32 %u225 to i1
	br i1 %u226, label %LU90, label %LU91
LU88:
	br label %LU89
LU90:
	br label %LU85
LU91:
	br label %LU92
LU85:
	ret i32 1
LU92:
	%u227 = phi i32 
	%u228 = phi %struct.tnode* 
	%u235 = phi %struct.tnode* 
	%u238 = phi i32 
	%u240 = phi %struct.tnode* 
	%u243 = phi i32 
	%u229 = getelementptr %struct.tnode* %u228, i1 0, i32 0
	%u230 = load i32* %u229
	%u231 = icmp slt i32 %u227, %u230
	%u232 = zext i1 %u231 to i32
	%u233 = trunc i32 %u232 to i1
	br i1 %u233, label %LU93, label %LU94
LU95:
	br label %LU89
LU93:
	%u236 = getelementptr %struct.tnode* %u235, i1 0, i32 1
	%u237 = load %struct.tnode** %u236
	%u234 = call i32 @bintreesearch(%struct.tnode* %u237, i32 %u238)
	br label %LU85
LU94:
	%u241 = getelementptr %struct.tnode* %u240, i1 0, i32 2
	%u242 = load %struct.tnode** %u241
	%u239 = call i32 @bintreesearch(%struct.tnode* %u242, i32 %u243)
	br label %LU85
LU89:
	br label %LU85
}

define %struct.tnode* @buildTree(%struct.node* %list)
{
LU97:
	%u244 = call i32 @size(%struct.node* %list)
	%u245 = icmp slt i32 0, %u244
	%u246 = zext i1 %u245 to i32
	%u247 = trunc i32 %u246 to i1
	br i1 %u247, label %LU98, label %LU99
LU98:
	%u249 = phi %struct.tnode* 
	%u251 = phi %struct.node* 
	%u252 = phi i32 
	%u253 = phi i32 
	%u250 = call i32 @get(%struct.node* %u251, i32 %u252)
	%u248 = call %struct.tnode* @treeadd(%struct.tnode* %u249, i32 %u250)
	%u254 = add i32 %u253, 1
	%u255 = load i32* %i
	%u257 = load %struct.node** %list
	%u256 = call i32 @size(%struct.node* %u257)
	%u258 = icmp slt i32 %u255, %u256
	%u259 = zext i1 %u258 to i32
	%u260 = trunc i32 %u259 to i1
	br i1 %u260, label %LU98, label %LU99
LU99:
	%u261 = phi %struct.tnode* 
	br label %LU96
LU96:
	ret %struct.tnode* %u261
}

define void @treeMain(%struct.node* %list)
{
LU101:
	%u262 = call %struct.tnode* @buildTree(%struct.node* %list)
	call void @treeprint(%struct.tnode* %u262)
	%u263 = mul i32 999, -1
	call void @printf_newline(i32 %u263)
	%u264 = call %struct.node* @inOrder(%struct.tnode* %u262)
	call void @printList(%struct.node* %u264)
	%u265 = mul i32 999, -1
	call void @printf_newline(i32 %u265)
	call void @freeList(%struct.node* %u264)
	%u266 = call %struct.node* @postOrder(%struct.tnode* %u262)
	call void @printList(%struct.node* %u266)
	%u267 = mul i32 999, -1
	call void @printf_newline(i32 %u267)
	call void @freeList(%struct.node* %u266)
	%u268 = call i32 @treesearch(%struct.tnode* %u262, i32 0)
	call void @printf_newline(i32 %u268)
	%u269 = mul i32 999, -1
	call void @printf_newline(i32 %u269)
	%u270 = call i32 @treesearch(%struct.tnode* %u262, i32 10)
	call void @printf_newline(i32 %u270)
	%u271 = mul i32 999, -1
	call void @printf_newline(i32 %u271)
	%u273 = mul i32 2, -1
	%u272 = call i32 @treesearch(%struct.tnode* %u262, i32 %u273)
	call void @printf_newline(i32 %u272)
	%u274 = mul i32 999, -1
	call void @printf_newline(i32 %u274)
	%u275 = call i32 @treesearch(%struct.tnode* %u262, i32 2)
	call void @printf_newline(i32 %u275)
	%u276 = mul i32 999, -1
	call void @printf_newline(i32 %u276)
	%u277 = call i32 @treesearch(%struct.tnode* %u262, i32 3)
	call void @printf_newline(i32 %u277)
	%u278 = mul i32 999, -1
	call void @printf_newline(i32 %u278)
	%u279 = call i32 @treesearch(%struct.tnode* %u262, i32 9)
	call void @printf_newline(i32 %u279)
	%u280 = mul i32 999, -1
	call void @printf_newline(i32 %u280)
	%u281 = call i32 @treesearch(%struct.tnode* %u262, i32 1)
	call void @printf_newline(i32 %u281)
	%u282 = mul i32 999, -1
	call void @printf_newline(i32 %u282)
	%u283 = call i32 @bintreesearch(%struct.tnode* %u262, i32 0)
	call void @printf_newline(i32 %u283)
	%u284 = mul i32 999, -1
	call void @printf_newline(i32 %u284)
	%u285 = call i32 @bintreesearch(%struct.tnode* %u262, i32 10)
	call void @printf_newline(i32 %u285)
	%u286 = mul i32 999, -1
	call void @printf_newline(i32 %u286)
	%u288 = mul i32 2, -1
	%u287 = call i32 @bintreesearch(%struct.tnode* %u262, i32 %u288)
	call void @printf_newline(i32 %u287)
	%u289 = mul i32 999, -1
	call void @printf_newline(i32 %u289)
	%u290 = call i32 @bintreesearch(%struct.tnode* %u262, i32 2)
	call void @printf_newline(i32 %u290)
	%u291 = mul i32 999, -1
	call void @printf_newline(i32 %u291)
	%u292 = call i32 @bintreesearch(%struct.tnode* %u262, i32 3)
	call void @printf_newline(i32 %u292)
	%u293 = mul i32 999, -1
	call void @printf_newline(i32 %u293)
	%u294 = call i32 @bintreesearch(%struct.tnode* %u262, i32 9)
	call void @printf_newline(i32 %u294)
	%u295 = mul i32 999, -1
	call void @printf_newline(i32 %u295)
	%u296 = call i32 @bintreesearch(%struct.tnode* %u262, i32 1)
	call void @printf_newline(i32 %u296)
	%u297 = mul i32 999, -1
	call void @printf_newline(i32 %u297)
	call void @freeTree(%struct.tnode* %u262)
	br label %LU100
LU100:
	ret void
}

define %struct.node* @myCopy(%struct.node* %src)
{
LU103:
	%u298 = icmp eq %struct.node* %src, null
	%u299 = zext i1 %u298 to i32
	%u300 = trunc i32 %u299 to i1
	br i1 %u300, label %LU104, label %LU105
LU104:
	br label %LU102
LU105:
	br label %LU106
LU102:
	ret null null
LU106:
	%u303 = phi %struct.node* 
	%u307 = phi %struct.node* 
	%u304 = getelementptr %struct.node* %u303, i1 0, i32 0
	%u305 = load i32* %u304
	%u302 = call %struct.node* @add(null null, i32 %u305)
	%u308 = getelementptr %struct.node* %u307, i1 0, i32 1
	%u309 = load %struct.node** %u308
	%u306 = call %struct.node* @myCopy(%struct.node* %u309)
	%u301 = call %struct.node* @concatLists(%struct.node* %u302, %struct.node* %u306)
	br label %LU102
}

define i32 @main()
{
LU108:
	%u310 = icmp slt i32 0, 10
	%u311 = zext i1 %u310 to i32
	%u312 = trunc i32 %u311 to i1
	br i1 %u312, label %LU109, label %LU110
LU109:
	%u315 = phi %struct.node* 
	%u319 = phi i32 
	%u313 = call i32 @read()
	%u314 = call %struct.node* @add(%struct.node* %u315, i32 %u313)
	%u316 = call %struct.node* @myCopy(%struct.node* %u314)
	%u317 = call %struct.node* @myCopy(%struct.node* %u314)
	%u318 = call %struct.node* @quickSortMain(%struct.node* %u316)
	call void @freeList(%struct.node* %u318)
	call void @treeMain(%struct.node* %u317)
	%u320 = add i32 %u319, 1
	%u321 = load i32* %i
	%u322 = icmp slt i32 %u321, 10
	%u323 = zext i1 %u322 to i32
	%u324 = trunc i32 %u323 to i1
	br i1 %u324, label %LU109, label %LU110
LU110:
	%u325 = phi %struct.node* 
	%u326 = phi %struct.node* 
	%u327 = phi %struct.node* 
	call void @freeList(%struct.node* %u325)
	call void @freeList(%struct.node* %u326)
	call void @freeList(%struct.node* %u327)
	br label %LU107
LU107:
	ret i32 0
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
