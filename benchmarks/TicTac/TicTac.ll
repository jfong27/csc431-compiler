target triple="i686"
%struct.gameBoard = type {i32, i32, i32, i32, i32, i32, i32, i32, i32}


define void @cleanBoard(%struct.gameBoard* %_P_board)
{
LU1:
	%board = alloca %struct.gameBoard*
	store %struct.gameBoard* %_P_board, %struct.gameBoard** %board
	%u0 = load %struct.gameBoard** %board
	%u1 = getelementptr %struct.gameBoard* %u0, i1 0, i32 0
	store i32 0, i32* %u1
	%u2 = load %struct.gameBoard** %board
	%u3 = getelementptr %struct.gameBoard* %u2, i1 0, i32 1
	store i32 0, i32* %u3
	%u4 = load %struct.gameBoard** %board
	%u5 = getelementptr %struct.gameBoard* %u4, i1 0, i32 2
	store i32 0, i32* %u5
	%u6 = load %struct.gameBoard** %board
	%u7 = getelementptr %struct.gameBoard* %u6, i1 0, i32 3
	store i32 0, i32* %u7
	%u8 = load %struct.gameBoard** %board
	%u9 = getelementptr %struct.gameBoard* %u8, i1 0, i32 4
	store i32 0, i32* %u9
	%u10 = load %struct.gameBoard** %board
	%u11 = getelementptr %struct.gameBoard* %u10, i1 0, i32 5
	store i32 0, i32* %u11
	%u12 = load %struct.gameBoard** %board
	%u13 = getelementptr %struct.gameBoard* %u12, i1 0, i32 6
	store i32 0, i32* %u13
	%u14 = load %struct.gameBoard** %board
	%u15 = getelementptr %struct.gameBoard* %u14, i1 0, i32 7
	store i32 0, i32* %u15
	%u16 = load %struct.gameBoard** %board
	%u17 = getelementptr %struct.gameBoard* %u16, i1 0, i32 8
	store i32 0, i32* %u17
	br label %LU0
LU0:
	ret void
}

define void @printBoard(%struct.gameBoard* %_P_board)
{
LU3:
	%board = alloca %struct.gameBoard*
	store %struct.gameBoard* %_P_board, %struct.gameBoard** %board
	%u18 = load %struct.gameBoard** %board
	%u19 = getelementptr %struct.gameBoard* %u18, i1 0, i32 0
	%u20 = load i32* %u19
	call void @printf_int(i32 %u20)
	%u21 = load %struct.gameBoard** %board
	%u22 = getelementptr %struct.gameBoard* %u21, i1 0, i32 1
	%u23 = load i32* %u22
	call void @printf_int(i32 %u23)
	%u24 = load %struct.gameBoard** %board
	%u25 = getelementptr %struct.gameBoard* %u24, i1 0, i32 2
	%u26 = load i32* %u25
	call void @printf_newline(i32 %u26)
	%u27 = load %struct.gameBoard** %board
	%u28 = getelementptr %struct.gameBoard* %u27, i1 0, i32 3
	%u29 = load i32* %u28
	call void @printf_int(i32 %u29)
	%u30 = load %struct.gameBoard** %board
	%u31 = getelementptr %struct.gameBoard* %u30, i1 0, i32 4
	%u32 = load i32* %u31
	call void @printf_int(i32 %u32)
	%u33 = load %struct.gameBoard** %board
	%u34 = getelementptr %struct.gameBoard* %u33, i1 0, i32 5
	%u35 = load i32* %u34
	call void @printf_newline(i32 %u35)
	%u36 = load %struct.gameBoard** %board
	%u37 = getelementptr %struct.gameBoard* %u36, i1 0, i32 6
	%u38 = load i32* %u37
	call void @printf_int(i32 %u38)
	%u39 = load %struct.gameBoard** %board
	%u40 = getelementptr %struct.gameBoard* %u39, i1 0, i32 7
	%u41 = load i32* %u40
	call void @printf_int(i32 %u41)
	%u42 = load %struct.gameBoard** %board
	%u43 = getelementptr %struct.gameBoard* %u42, i1 0, i32 8
	%u44 = load i32* %u43
	call void @printf_newline(i32 %u44)
	br label %LU2
LU2:
	ret void
}

define void @printMoveBoard()
{
LU5:
	call void @printf_newline(i32 123)
	call void @printf_newline(i32 456)
	call void @printf_newline(i32 789)
	br label %LU4
LU4:
	ret void
}

define void @placePiece(%struct.gameBoard* %_P_board, i32 %_P_turn, i32 %_P_placement)
{
LU7:
	%board = alloca %struct.gameBoard*
	store %struct.gameBoard* %_P_board, %struct.gameBoard** %board
	%turn = alloca i32
	store i32 %_P_turn, i32* %turn
	%placement = alloca i32
	store i32 %_P_placement, i32* %placement
	%u45 = load i32* %placement
	%u46 = icmp eq i32 %u45, 1
	%u47 = zext i1 %u46 to i32
	%u48 = trunc i32 %u47 to i1
	br i1 %u48, label %LU8, label %LU9
LU8:
	%u49 = load i32* %turn
	%u50 = load %struct.gameBoard** %board
	%u51 = getelementptr %struct.gameBoard* %u50, i1 0, i32 0
	store i32 %u49, i32* %u51
	br label %LU10
LU9:
	%u52 = load i32* %placement
	%u53 = icmp eq i32 %u52, 2
	%u54 = zext i1 %u53 to i32
	%u55 = trunc i32 %u54 to i1
	br i1 %u55, label %LU11, label %LU12
LU10:
	br label %LU6
LU6:
	ret void
LU11:
	%u56 = load i32* %turn
	%u57 = load %struct.gameBoard** %board
	%u58 = getelementptr %struct.gameBoard* %u57, i1 0, i32 1
	store i32 %u56, i32* %u58
	br label %LU13
LU12:
	%u59 = load i32* %placement
	%u60 = icmp eq i32 %u59, 3
	%u61 = zext i1 %u60 to i32
	%u62 = trunc i32 %u61 to i1
	br i1 %u62, label %LU14, label %LU15
LU13:
	br label %LU10
LU14:
	%u63 = load i32* %turn
	%u64 = load %struct.gameBoard** %board
	%u65 = getelementptr %struct.gameBoard* %u64, i1 0, i32 2
	store i32 %u63, i32* %u65
	br label %LU16
LU15:
	%u66 = load i32* %placement
	%u67 = icmp eq i32 %u66, 4
	%u68 = zext i1 %u67 to i32
	%u69 = trunc i32 %u68 to i1
	br i1 %u69, label %LU17, label %LU18
LU16:
	br label %LU13
LU17:
	%u70 = load i32* %turn
	%u71 = load %struct.gameBoard** %board
	%u72 = getelementptr %struct.gameBoard* %u71, i1 0, i32 3
	store i32 %u70, i32* %u72
	br label %LU19
LU18:
	%u73 = load i32* %placement
	%u74 = icmp eq i32 %u73, 5
	%u75 = zext i1 %u74 to i32
	%u76 = trunc i32 %u75 to i1
	br i1 %u76, label %LU20, label %LU21
LU19:
	br label %LU16
LU20:
	%u77 = load i32* %turn
	%u78 = load %struct.gameBoard** %board
	%u79 = getelementptr %struct.gameBoard* %u78, i1 0, i32 4
	store i32 %u77, i32* %u79
	br label %LU22
LU21:
	%u80 = load i32* %placement
	%u81 = icmp eq i32 %u80, 6
	%u82 = zext i1 %u81 to i32
	%u83 = trunc i32 %u82 to i1
	br i1 %u83, label %LU23, label %LU24
LU22:
	br label %LU19
LU23:
	%u84 = load i32* %turn
	%u85 = load %struct.gameBoard** %board
	%u86 = getelementptr %struct.gameBoard* %u85, i1 0, i32 5
	store i32 %u84, i32* %u86
	br label %LU25
LU24:
	%u87 = load i32* %placement
	%u88 = icmp eq i32 %u87, 7
	%u89 = zext i1 %u88 to i32
	%u90 = trunc i32 %u89 to i1
	br i1 %u90, label %LU26, label %LU27
LU25:
	br label %LU22
LU26:
	%u91 = load i32* %turn
	%u92 = load %struct.gameBoard** %board
	%u93 = getelementptr %struct.gameBoard* %u92, i1 0, i32 6
	store i32 %u91, i32* %u93
	br label %LU28
LU27:
	%u94 = load i32* %placement
	%u95 = icmp eq i32 %u94, 8
	%u96 = zext i1 %u95 to i32
	%u97 = trunc i32 %u96 to i1
	br i1 %u97, label %LU29, label %LU30
LU28:
	br label %LU25
LU29:
	%u98 = load i32* %turn
	%u99 = load %struct.gameBoard** %board
	%u100 = getelementptr %struct.gameBoard* %u99, i1 0, i32 7
	store i32 %u98, i32* %u100
	br label %LU31
LU30:
	%u101 = load i32* %placement
	%u102 = icmp eq i32 %u101, 9
	%u103 = zext i1 %u102 to i32
	%u104 = trunc i32 %u103 to i1
	br i1 %u104, label %LU32, label %LU33
LU31:
	br label %LU28
LU32:
	%u105 = load i32* %turn
	%u106 = load %struct.gameBoard** %board
	%u107 = getelementptr %struct.gameBoard* %u106, i1 0, i32 8
	store i32 %u105, i32* %u107
	br label %LU34
LU33:
	br label %LU34
LU34:
	br label %LU31
}

define i32 @checkWinner(%struct.gameBoard* %_P_board)
{
LU36:
	%_retval_ = alloca i32
	%board = alloca %struct.gameBoard*
	store %struct.gameBoard* %_P_board, %struct.gameBoard** %board
	%u108 = load %struct.gameBoard** %board
	%u109 = getelementptr %struct.gameBoard* %u108, i1 0, i32 0
	%u110 = load i32* %u109
	%u111 = icmp eq i32 %u110, 1
	%u112 = zext i1 %u111 to i32
	%u113 = trunc i32 %u112 to i1
	br i1 %u113, label %LU37, label %LU38
LU37:
	%u114 = load %struct.gameBoard** %board
	%u115 = getelementptr %struct.gameBoard* %u114, i1 0, i32 1
	%u116 = load i32* %u115
	%u117 = icmp eq i32 %u116, 1
	%u118 = zext i1 %u117 to i32
	%u119 = trunc i32 %u118 to i1
	br i1 %u119, label %LU40, label %LU41
LU38:
	br label %LU39
LU40:
	%u120 = load %struct.gameBoard** %board
	%u121 = getelementptr %struct.gameBoard* %u120, i1 0, i32 2
	%u122 = load i32* %u121
	%u123 = icmp eq i32 %u122, 1
	%u124 = zext i1 %u123 to i32
	%u125 = trunc i32 %u124 to i1
	br i1 %u125, label %LU43, label %LU44
LU41:
	br label %LU42
LU43:
	store i32 0, i32* %_retval_
	br label %LU35
LU44:
	br label %LU45
LU35:
	%u325 = load i32* %_retval_
	ret i32 %u325
LU45:
	br label %LU42
LU54:
	br label %LU51
LU63:
	br label %LU60
LU72:
	br label %LU69
LU81:
	br label %LU78
LU90:
	br label %LU87
LU99:
	br label %LU96
LU108:
	br label %LU105
LU117:
	br label %LU114
LU126:
	br label %LU123
LU135:
	br label %LU132
LU144:
	br label %LU141
LU42:
	br label %LU39
LU39:
	%u126 = load %struct.gameBoard** %board
	%u127 = getelementptr %struct.gameBoard* %u126, i1 0, i32 0
	%u128 = load i32* %u127
	%u129 = icmp eq i32 %u128, 2
	%u130 = zext i1 %u129 to i32
	%u131 = trunc i32 %u130 to i1
	br i1 %u131, label %LU46, label %LU47
LU46:
	%u132 = load %struct.gameBoard** %board
	%u133 = getelementptr %struct.gameBoard* %u132, i1 0, i32 1
	%u134 = load i32* %u133
	%u135 = icmp eq i32 %u134, 2
	%u136 = zext i1 %u135 to i32
	%u137 = trunc i32 %u136 to i1
	br i1 %u137, label %LU49, label %LU50
LU47:
	br label %LU48
LU49:
	%u138 = load %struct.gameBoard** %board
	%u139 = getelementptr %struct.gameBoard* %u138, i1 0, i32 2
	%u140 = load i32* %u139
	%u141 = icmp eq i32 %u140, 2
	%u142 = zext i1 %u141 to i32
	%u143 = trunc i32 %u142 to i1
	br i1 %u143, label %LU52, label %LU53
LU50:
	br label %LU51
LU52:
	store i32 1, i32* %_retval_
	br label %LU35
LU53:
	br label %LU54
LU51:
	br label %LU48
LU48:
	%u144 = load %struct.gameBoard** %board
	%u145 = getelementptr %struct.gameBoard* %u144, i1 0, i32 3
	%u146 = load i32* %u145
	%u147 = icmp eq i32 %u146, 1
	%u148 = zext i1 %u147 to i32
	%u149 = trunc i32 %u148 to i1
	br i1 %u149, label %LU55, label %LU56
LU55:
	%u150 = load %struct.gameBoard** %board
	%u151 = getelementptr %struct.gameBoard* %u150, i1 0, i32 4
	%u152 = load i32* %u151
	%u153 = icmp eq i32 %u152, 1
	%u154 = zext i1 %u153 to i32
	%u155 = trunc i32 %u154 to i1
	br i1 %u155, label %LU58, label %LU59
LU56:
	br label %LU57
LU58:
	%u156 = load %struct.gameBoard** %board
	%u157 = getelementptr %struct.gameBoard* %u156, i1 0, i32 5
	%u158 = load i32* %u157
	%u159 = icmp eq i32 %u158, 1
	%u160 = zext i1 %u159 to i32
	%u161 = trunc i32 %u160 to i1
	br i1 %u161, label %LU61, label %LU62
LU59:
	br label %LU60
LU61:
	store i32 0, i32* %_retval_
	br label %LU35
LU62:
	br label %LU63
LU60:
	br label %LU57
LU57:
	%u162 = load %struct.gameBoard** %board
	%u163 = getelementptr %struct.gameBoard* %u162, i1 0, i32 3
	%u164 = load i32* %u163
	%u165 = icmp eq i32 %u164, 2
	%u166 = zext i1 %u165 to i32
	%u167 = trunc i32 %u166 to i1
	br i1 %u167, label %LU64, label %LU65
LU64:
	%u168 = load %struct.gameBoard** %board
	%u169 = getelementptr %struct.gameBoard* %u168, i1 0, i32 4
	%u170 = load i32* %u169
	%u171 = icmp eq i32 %u170, 2
	%u172 = zext i1 %u171 to i32
	%u173 = trunc i32 %u172 to i1
	br i1 %u173, label %LU67, label %LU68
LU65:
	br label %LU66
LU67:
	%u174 = load %struct.gameBoard** %board
	%u175 = getelementptr %struct.gameBoard* %u174, i1 0, i32 5
	%u176 = load i32* %u175
	%u177 = icmp eq i32 %u176, 2
	%u178 = zext i1 %u177 to i32
	%u179 = trunc i32 %u178 to i1
	br i1 %u179, label %LU70, label %LU71
LU68:
	br label %LU69
LU70:
	store i32 1, i32* %_retval_
	br label %LU35
LU71:
	br label %LU72
LU69:
	br label %LU66
LU66:
	%u180 = load %struct.gameBoard** %board
	%u181 = getelementptr %struct.gameBoard* %u180, i1 0, i32 6
	%u182 = load i32* %u181
	%u183 = icmp eq i32 %u182, 1
	%u184 = zext i1 %u183 to i32
	%u185 = trunc i32 %u184 to i1
	br i1 %u185, label %LU73, label %LU74
LU73:
	%u186 = load %struct.gameBoard** %board
	%u187 = getelementptr %struct.gameBoard* %u186, i1 0, i32 7
	%u188 = load i32* %u187
	%u189 = icmp eq i32 %u188, 1
	%u190 = zext i1 %u189 to i32
	%u191 = trunc i32 %u190 to i1
	br i1 %u191, label %LU76, label %LU77
LU74:
	br label %LU75
LU76:
	%u192 = load %struct.gameBoard** %board
	%u193 = getelementptr %struct.gameBoard* %u192, i1 0, i32 8
	%u194 = load i32* %u193
	%u195 = icmp eq i32 %u194, 1
	%u196 = zext i1 %u195 to i32
	%u197 = trunc i32 %u196 to i1
	br i1 %u197, label %LU79, label %LU80
LU77:
	br label %LU78
LU79:
	store i32 0, i32* %_retval_
	br label %LU35
LU80:
	br label %LU81
LU78:
	br label %LU75
LU75:
	%u198 = load %struct.gameBoard** %board
	%u199 = getelementptr %struct.gameBoard* %u198, i1 0, i32 6
	%u200 = load i32* %u199
	%u201 = icmp eq i32 %u200, 2
	%u202 = zext i1 %u201 to i32
	%u203 = trunc i32 %u202 to i1
	br i1 %u203, label %LU82, label %LU83
LU82:
	%u204 = load %struct.gameBoard** %board
	%u205 = getelementptr %struct.gameBoard* %u204, i1 0, i32 7
	%u206 = load i32* %u205
	%u207 = icmp eq i32 %u206, 2
	%u208 = zext i1 %u207 to i32
	%u209 = trunc i32 %u208 to i1
	br i1 %u209, label %LU85, label %LU86
LU83:
	br label %LU84
LU85:
	%u210 = load %struct.gameBoard** %board
	%u211 = getelementptr %struct.gameBoard* %u210, i1 0, i32 8
	%u212 = load i32* %u211
	%u213 = icmp eq i32 %u212, 2
	%u214 = zext i1 %u213 to i32
	%u215 = trunc i32 %u214 to i1
	br i1 %u215, label %LU88, label %LU89
LU86:
	br label %LU87
LU88:
	store i32 1, i32* %_retval_
	br label %LU35
LU89:
	br label %LU90
LU87:
	br label %LU84
LU84:
	%u216 = load %struct.gameBoard** %board
	%u217 = getelementptr %struct.gameBoard* %u216, i1 0, i32 0
	%u218 = load i32* %u217
	%u219 = icmp eq i32 %u218, 1
	%u220 = zext i1 %u219 to i32
	%u221 = trunc i32 %u220 to i1
	br i1 %u221, label %LU91, label %LU92
LU91:
	%u222 = load %struct.gameBoard** %board
	%u223 = getelementptr %struct.gameBoard* %u222, i1 0, i32 3
	%u224 = load i32* %u223
	%u225 = icmp eq i32 %u224, 1
	%u226 = zext i1 %u225 to i32
	%u227 = trunc i32 %u226 to i1
	br i1 %u227, label %LU94, label %LU95
LU92:
	br label %LU93
LU94:
	%u228 = load %struct.gameBoard** %board
	%u229 = getelementptr %struct.gameBoard* %u228, i1 0, i32 6
	%u230 = load i32* %u229
	%u231 = icmp eq i32 %u230, 1
	%u232 = zext i1 %u231 to i32
	%u233 = trunc i32 %u232 to i1
	br i1 %u233, label %LU97, label %LU98
LU95:
	br label %LU96
LU97:
	store i32 0, i32* %_retval_
	br label %LU35
LU98:
	br label %LU99
LU96:
	br label %LU93
LU93:
	%u234 = load %struct.gameBoard** %board
	%u235 = getelementptr %struct.gameBoard* %u234, i1 0, i32 0
	%u236 = load i32* %u235
	%u237 = icmp eq i32 %u236, 2
	%u238 = zext i1 %u237 to i32
	%u239 = trunc i32 %u238 to i1
	br i1 %u239, label %LU100, label %LU101
LU100:
	%u240 = load %struct.gameBoard** %board
	%u241 = getelementptr %struct.gameBoard* %u240, i1 0, i32 3
	%u242 = load i32* %u241
	%u243 = icmp eq i32 %u242, 2
	%u244 = zext i1 %u243 to i32
	%u245 = trunc i32 %u244 to i1
	br i1 %u245, label %LU103, label %LU104
LU101:
	br label %LU102
LU103:
	%u246 = load %struct.gameBoard** %board
	%u247 = getelementptr %struct.gameBoard* %u246, i1 0, i32 6
	%u248 = load i32* %u247
	%u249 = icmp eq i32 %u248, 2
	%u250 = zext i1 %u249 to i32
	%u251 = trunc i32 %u250 to i1
	br i1 %u251, label %LU106, label %LU107
LU104:
	br label %LU105
LU106:
	store i32 1, i32* %_retval_
	br label %LU35
LU107:
	br label %LU108
LU105:
	br label %LU102
LU102:
	%u252 = load %struct.gameBoard** %board
	%u253 = getelementptr %struct.gameBoard* %u252, i1 0, i32 1
	%u254 = load i32* %u253
	%u255 = icmp eq i32 %u254, 1
	%u256 = zext i1 %u255 to i32
	%u257 = trunc i32 %u256 to i1
	br i1 %u257, label %LU109, label %LU110
LU109:
	%u258 = load %struct.gameBoard** %board
	%u259 = getelementptr %struct.gameBoard* %u258, i1 0, i32 4
	%u260 = load i32* %u259
	%u261 = icmp eq i32 %u260, 1
	%u262 = zext i1 %u261 to i32
	%u263 = trunc i32 %u262 to i1
	br i1 %u263, label %LU112, label %LU113
LU110:
	br label %LU111
LU112:
	%u264 = load %struct.gameBoard** %board
	%u265 = getelementptr %struct.gameBoard* %u264, i1 0, i32 7
	%u266 = load i32* %u265
	%u267 = icmp eq i32 %u266, 1
	%u268 = zext i1 %u267 to i32
	%u269 = trunc i32 %u268 to i1
	br i1 %u269, label %LU115, label %LU116
LU113:
	br label %LU114
LU115:
	store i32 0, i32* %_retval_
	br label %LU35
LU116:
	br label %LU117
LU114:
	br label %LU111
LU111:
	%u270 = load %struct.gameBoard** %board
	%u271 = getelementptr %struct.gameBoard* %u270, i1 0, i32 1
	%u272 = load i32* %u271
	%u273 = icmp eq i32 %u272, 2
	%u274 = zext i1 %u273 to i32
	%u275 = trunc i32 %u274 to i1
	br i1 %u275, label %LU118, label %LU119
LU118:
	%u276 = load %struct.gameBoard** %board
	%u277 = getelementptr %struct.gameBoard* %u276, i1 0, i32 4
	%u278 = load i32* %u277
	%u279 = icmp eq i32 %u278, 2
	%u280 = zext i1 %u279 to i32
	%u281 = trunc i32 %u280 to i1
	br i1 %u281, label %LU121, label %LU122
LU119:
	br label %LU120
LU121:
	%u282 = load %struct.gameBoard** %board
	%u283 = getelementptr %struct.gameBoard* %u282, i1 0, i32 7
	%u284 = load i32* %u283
	%u285 = icmp eq i32 %u284, 2
	%u286 = zext i1 %u285 to i32
	%u287 = trunc i32 %u286 to i1
	br i1 %u287, label %LU124, label %LU125
LU122:
	br label %LU123
LU124:
	store i32 1, i32* %_retval_
	br label %LU35
LU125:
	br label %LU126
LU123:
	br label %LU120
LU120:
	%u288 = load %struct.gameBoard** %board
	%u289 = getelementptr %struct.gameBoard* %u288, i1 0, i32 2
	%u290 = load i32* %u289
	%u291 = icmp eq i32 %u290, 1
	%u292 = zext i1 %u291 to i32
	%u293 = trunc i32 %u292 to i1
	br i1 %u293, label %LU127, label %LU128
LU127:
	%u294 = load %struct.gameBoard** %board
	%u295 = getelementptr %struct.gameBoard* %u294, i1 0, i32 5
	%u296 = load i32* %u295
	%u297 = icmp eq i32 %u296, 1
	%u298 = zext i1 %u297 to i32
	%u299 = trunc i32 %u298 to i1
	br i1 %u299, label %LU130, label %LU131
LU128:
	br label %LU129
LU130:
	%u300 = load %struct.gameBoard** %board
	%u301 = getelementptr %struct.gameBoard* %u300, i1 0, i32 8
	%u302 = load i32* %u301
	%u303 = icmp eq i32 %u302, 1
	%u304 = zext i1 %u303 to i32
	%u305 = trunc i32 %u304 to i1
	br i1 %u305, label %LU133, label %LU134
LU131:
	br label %LU132
LU133:
	store i32 0, i32* %_retval_
	br label %LU35
LU134:
	br label %LU135
LU132:
	br label %LU129
LU129:
	%u306 = load %struct.gameBoard** %board
	%u307 = getelementptr %struct.gameBoard* %u306, i1 0, i32 2
	%u308 = load i32* %u307
	%u309 = icmp eq i32 %u308, 2
	%u310 = zext i1 %u309 to i32
	%u311 = trunc i32 %u310 to i1
	br i1 %u311, label %LU136, label %LU137
LU136:
	%u312 = load %struct.gameBoard** %board
	%u313 = getelementptr %struct.gameBoard* %u312, i1 0, i32 5
	%u314 = load i32* %u313
	%u315 = icmp eq i32 %u314, 2
	%u316 = zext i1 %u315 to i32
	%u317 = trunc i32 %u316 to i1
	br i1 %u317, label %LU139, label %LU140
LU137:
	br label %LU138
LU139:
	%u318 = load %struct.gameBoard** %board
	%u319 = getelementptr %struct.gameBoard* %u318, i1 0, i32 8
	%u320 = load i32* %u319
	%u321 = icmp eq i32 %u320, 2
	%u322 = zext i1 %u321 to i32
	%u323 = trunc i32 %u322 to i1
	br i1 %u323, label %LU142, label %LU143
LU140:
	br label %LU141
LU142:
	store i32 1, i32* %_retval_
	br label %LU35
LU143:
	br label %LU144
LU141:
	br label %LU138
LU138:
	%u324 = mul i32 1, -1
	store i32 %u324, i32* %_retval_
	br label %LU35
}

define i32 @main()
{
LU146:
	%_retval_ = alloca i32
	%turn = alloca i32
	%space1 = alloca i32
	%space2 = alloca i32
	%winner = alloca i32
	%i = alloca i32
	%board = alloca %struct.gameBoard*
	store i32 0, i32* %i
	store i32 0, i32* %turn
	store i32 0, i32* %space1
	store i32 0, i32* %space2
	%u326 = mul i32 1, -1
	store i32 %u326, i32* %winner
	%u327 = call i8* @malloc(i32 36)
	%u328 = bitcast i8* %u327 to %struct.gameBoard*
	store %struct.gameBoard* %u328, %struct.gameBoard** %board
	%u329 = load %struct.gameBoard** %board
	call void @cleanBoard(%struct.gameBoard* %u329)
	%u330 = load i32* %winner
	%u331 = icmp slt i32 %u330, 0
	%u332 = zext i1 %u331 to i32
	%u333 = load i32* %i
	%u334 = icmp ne i32 %u333, 8
	%u335 = zext i1 %u334 to i32
	%u336 = and i32 %u332, %u335
	%u337 = trunc i32 %u336 to i1
	br i1 %u337, label %LU147, label %LU148
LU147:
	%u338 = load %struct.gameBoard** %board
	call void @printBoard(%struct.gameBoard* %u338)
	%u339 = load i32* %turn
	%u340 = icmp eq i32 %u339, 0
	%u341 = zext i1 %u340 to i32
	%u342 = trunc i32 %u341 to i1
	br i1 %u342, label %LU149, label %LU150
LU148:
	%u365 = load i32* %winner
	%u366 = add i32 %u365, 1
	call void @printf_newline(i32 %u366)
	store i32 0, i32* %_retval_
	br label %LU145
LU149:
	%u343 = load i32* %turn
	%u344 = add i32 %u343, 1
	store i32 %u344, i32* %turn
	%u345 = call i32 @read()
	store i32 %u345, i32* %space1
	%u346 = load %struct.gameBoard** %board
	%u347 = load i32* %space1
	call void @placePiece(%struct.gameBoard* %u346, i32 1, i32 %u347)
	br label %LU151
LU150:
	%u348 = load i32* %turn
	%u349 = sub i32 %u348, 1
	store i32 %u349, i32* %turn
	%u350 = call i32 @read()
	store i32 %u350, i32* %space2
	%u351 = load %struct.gameBoard** %board
	%u352 = load i32* %space2
	call void @placePiece(%struct.gameBoard* %u351, i32 2, i32 %u352)
	br label %LU151
LU151:
	%u354 = load %struct.gameBoard** %board
	%u353 = call i32 @checkWinner(%struct.gameBoard* %u354)
	store i32 %u353, i32* %winner
	%u355 = load i32* %i
	%u356 = add i32 %u355, 1
	store i32 %u356, i32* %i
	%u357 = load i32* %winner
	%u358 = icmp slt i32 %u357, 0
	%u359 = zext i1 %u358 to i32
	%u360 = load i32* %i
	%u361 = icmp ne i32 %u360, 8
	%u362 = zext i1 %u361 to i32
	%u363 = and i32 %u359, %u362
	%u364 = trunc i32 %u363 to i1
	br i1 %u364, label %LU147, label %LU148
LU145:
	%u367 = load i32* %_retval_
	ret i32 %u367
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
