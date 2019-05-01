target triple="i686"
%struct.thing = type {i32, i32, %struct.thing*}

@gi1 = common global i32 0, align 4
@gb1 = common global i32 0, align 4
@gs1 = common global %struct.thing* null, align 4
@counter = common global i32 0, align 4

define void @printgroup(i32 %_P_groupnum)
{
LU1:
	%groupnum = alloca i32
	store i32 %_P_groupnum, i32* %groupnum
	call void @printf_int(i32 1)
	call void @printf_int(i32 0)
	call void @printf_int(i32 1)
	call void @printf_int(i32 0)
	call void @printf_int(i32 1)
	call void @printf_int(i32 0)
	%u0 = load i32* %groupnum
	call void @printf_newline(i32 %u0)
	br label %LU0
LU0:
	ret void
}

define i32 @setcounter(i32 %_P_val)
{
LU3:
	%_retval_ = alloca i32
	%val = alloca i32
	store i32 %_P_val, i32* %val
	%u1 = load i32* %val
	store i32 %u1, i32* @counter
	store i32 1, i32* %_retval_
	br label %LU2
LU2:
	%u2 = load i32* %_retval_
	ret i32 %u2
}

define void @takealltypes(i32 %_P_i, i32 %_P_b, %struct.thing* %_P_s)
{
LU5:
	%i = alloca i32
	store i32 %_P_i, i32* %i
	%b = alloca i32
	store i32 %_P_b, i32* %b
	%s = alloca %struct.thing*
	store %struct.thing* %_P_s, %struct.thing** %s
	%u3 = load i32* %i
	%u4 = icmp eq i32 %u3, 3
	%u5 = zext i1 %u4 to i32
	%u6 = trunc i32 %u5 to i1
	br i1 %u6, label %LU6, label %LU7
LU6:
	call void @printf_newline(i32 1)
	br label %LU8
LU7:
	call void @printf_newline(i32 0)
	br label %LU8
LU8:
	%u7 = load i32* %b
	%u8 = trunc i32 %u7 to i1
	br i1 %u8, label %LU9, label %LU10
LU9:
	call void @printf_newline(i32 1)
	br label %LU11
LU10:
	call void @printf_newline(i32 0)
	br label %LU11
LU11:
	%u9 = load %struct.thing** %s
	%u10 = getelementptr %struct.thing* %u9, i1 0, i32 1
	%u11 = load i32* %u10
	%u12 = trunc i32 %u11 to i1
	br i1 %u12, label %LU12, label %LU13
LU12:
	call void @printf_newline(i32 1)
	br label %LU14
LU13:
	call void @printf_newline(i32 0)
	br label %LU14
LU14:
	br label %LU4
LU4:
	ret void
}

define void @tonofargs(i32 %_P_a1, i32 %_P_a2, i32 %_P_a3, i32 %_P_a4, i32 %_P_a5, i32 %_P_a6, i32 %_P_a7, i32 %_P_a8)
{
LU16:
	%a1 = alloca i32
	store i32 %_P_a1, i32* %a1
	%a2 = alloca i32
	store i32 %_P_a2, i32* %a2
	%a3 = alloca i32
	store i32 %_P_a3, i32* %a3
	%a4 = alloca i32
	store i32 %_P_a4, i32* %a4
	%a5 = alloca i32
	store i32 %_P_a5, i32* %a5
	%a6 = alloca i32
	store i32 %_P_a6, i32* %a6
	%a7 = alloca i32
	store i32 %_P_a7, i32* %a7
	%a8 = alloca i32
	store i32 %_P_a8, i32* %a8
	%u13 = load i32* %a5
	%u14 = icmp eq i32 %u13, 5
	%u15 = zext i1 %u14 to i32
	%u16 = trunc i32 %u15 to i1
	br i1 %u16, label %LU17, label %LU18
LU17:
	call void @printf_newline(i32 1)
	br label %LU19
LU18:
	call void @printf_int(i32 0)
	%u17 = load i32* %a5
	call void @printf_newline(i32 %u17)
	br label %LU19
LU19:
	%u18 = load i32* %a6
	%u19 = icmp eq i32 %u18, 6
	%u20 = zext i1 %u19 to i32
	%u21 = trunc i32 %u20 to i1
	br i1 %u21, label %LU20, label %LU21
LU20:
	call void @printf_newline(i32 1)
	br label %LU22
LU21:
	call void @printf_int(i32 0)
	%u22 = load i32* %a6
	call void @printf_newline(i32 %u22)
	br label %LU22
LU22:
	%u23 = load i32* %a7
	%u24 = icmp eq i32 %u23, 7
	%u25 = zext i1 %u24 to i32
	%u26 = trunc i32 %u25 to i1
	br i1 %u26, label %LU23, label %LU24
LU23:
	call void @printf_newline(i32 1)
	br label %LU25
LU24:
	call void @printf_int(i32 0)
	%u27 = load i32* %a7
	call void @printf_newline(i32 %u27)
	br label %LU25
LU25:
	%u28 = load i32* %a8
	%u29 = icmp eq i32 %u28, 8
	%u30 = zext i1 %u29 to i32
	%u31 = trunc i32 %u30 to i1
	br i1 %u31, label %LU26, label %LU27
LU26:
	call void @printf_newline(i32 1)
	br label %LU28
LU27:
	call void @printf_int(i32 0)
	%u32 = load i32* %a8
	call void @printf_newline(i32 %u32)
	br label %LU28
LU28:
	br label %LU15
LU15:
	ret void
}

define i32 @returnint(i32 %_P_ret)
{
LU30:
	%_retval_ = alloca i32
	%ret = alloca i32
	store i32 %_P_ret, i32* %ret
	%u33 = load i32* %ret
	store i32 %u33, i32* %_retval_
	br label %LU29
LU29:
	%u34 = load i32* %_retval_
	ret i32 %u34
}

define i32 @returnbool(i32 %_P_ret)
{
LU32:
	%_retval_ = alloca i32
	%ret = alloca i32
	store i32 %_P_ret, i32* %ret
	%u35 = load i32* %ret
	store i32 %u35, i32* %_retval_
	br label %LU31
LU31:
	%u36 = load i32* %_retval_
	ret i32 %u36
}

define %struct.thing* @returnstruct(%struct.thing* %_P_ret)
{
LU34:
	%_retval_ = alloca %struct.thing*
	%ret = alloca %struct.thing*
	store %struct.thing* %_P_ret, %struct.thing** %ret
	%u37 = load %struct.thing** %ret
	store %struct.thing* %u37, %struct.thing** %_retval_
	br label %LU33
LU33:
	%u38 = load %struct.thing** %_retval_
	ret %struct.thing* %u38
}

define i32 @main()
{
LU36:
	%_retval_ = alloca i32
	%b1 = alloca i32
	%b2 = alloca i32
	%i1 = alloca i32
	%i2 = alloca i32
	%i3 = alloca i32
	%s1 = alloca %struct.thing*
	%s2 = alloca %struct.thing*
	store i32 0, i32* @counter
	call void @printgroup(i32 1)
	store i32 0, i32* %b1
	store i32 0, i32* %b2
	%u39 = load i32* %b1
	%u40 = load i32* %b2
	%u41 = and i32 %u39, %u40
	%u42 = trunc i32 %u41 to i1
	br i1 %u42, label %LU37, label %LU38
LU37:
	call void @printf_newline(i32 0)
	br label %LU39
LU38:
	call void @printf_newline(i32 1)
	br label %LU39
LU39:
	store i32 1, i32* %b1
	store i32 0, i32* %b2
	%u43 = load i32* %b1
	%u44 = load i32* %b2
	%u45 = and i32 %u43, %u44
	%u46 = trunc i32 %u45 to i1
	br i1 %u46, label %LU40, label %LU41
LU40:
	call void @printf_newline(i32 0)
	br label %LU42
LU41:
	call void @printf_newline(i32 1)
	br label %LU42
LU42:
	store i32 0, i32* %b1
	store i32 1, i32* %b2
	%u47 = load i32* %b1
	%u48 = load i32* %b2
	%u49 = and i32 %u47, %u48
	%u50 = trunc i32 %u49 to i1
	br i1 %u50, label %LU43, label %LU44
LU43:
	call void @printf_newline(i32 0)
	br label %LU45
LU44:
	call void @printf_newline(i32 1)
	br label %LU45
LU45:
	store i32 1, i32* %b1
	store i32 1, i32* %b2
	%u51 = load i32* %b1
	%u52 = load i32* %b2
	%u53 = and i32 %u51, %u52
	%u54 = trunc i32 %u53 to i1
	br i1 %u54, label %LU46, label %LU47
LU46:
	call void @printf_newline(i32 1)
	br label %LU48
LU47:
	call void @printf_newline(i32 0)
	br label %LU48
LU48:
	store i32 0, i32* @counter
	call void @printgroup(i32 2)
	store i32 1, i32* %b1
	store i32 1, i32* %b2
	%u55 = load i32* %b1
	%u56 = load i32* %b2
	%u57 = or i32 %u55, %u56
	%u58 = trunc i32 %u57 to i1
	br i1 %u58, label %LU49, label %LU50
LU49:
	call void @printf_newline(i32 1)
	br label %LU51
LU50:
	call void @printf_newline(i32 0)
	br label %LU51
LU51:
	store i32 1, i32* %b1
	store i32 0, i32* %b2
	%u59 = load i32* %b1
	%u60 = load i32* %b2
	%u61 = or i32 %u59, %u60
	%u62 = trunc i32 %u61 to i1
	br i1 %u62, label %LU52, label %LU53
LU52:
	call void @printf_newline(i32 1)
	br label %LU54
LU53:
	call void @printf_newline(i32 0)
	br label %LU54
LU54:
	store i32 0, i32* %b1
	store i32 1, i32* %b2
	%u63 = load i32* %b1
	%u64 = load i32* %b2
	%u65 = or i32 %u63, %u64
	%u66 = trunc i32 %u65 to i1
	br i1 %u66, label %LU55, label %LU56
LU55:
	call void @printf_newline(i32 1)
	br label %LU57
LU56:
	call void @printf_newline(i32 0)
	br label %LU57
LU57:
	store i32 0, i32* %b1
	store i32 0, i32* %b2
	%u67 = load i32* %b1
	%u68 = load i32* %b2
	%u69 = or i32 %u67, %u68
	%u70 = trunc i32 %u69 to i1
	br i1 %u70, label %LU58, label %LU59
LU58:
	call void @printf_newline(i32 0)
	br label %LU60
LU59:
	call void @printf_newline(i32 1)
	br label %LU60
LU60:
	call void @printgroup(i32 3)
	%u71 = icmp sgt i32 42, 1
	%u72 = zext i1 %u71 to i32
	%u73 = trunc i32 %u72 to i1
	br i1 %u73, label %LU61, label %LU62
LU61:
	call void @printf_newline(i32 1)
	br label %LU63
LU62:
	call void @printf_newline(i32 0)
	br label %LU63
LU63:
	%u74 = icmp sge i32 42, 1
	%u75 = zext i1 %u74 to i32
	%u76 = trunc i32 %u75 to i1
	br i1 %u76, label %LU64, label %LU65
LU64:
	call void @printf_newline(i32 1)
	br label %LU66
LU65:
	call void @printf_newline(i32 0)
	br label %LU66
LU66:
	%u77 = icmp slt i32 42, 1
	%u78 = zext i1 %u77 to i32
	%u79 = trunc i32 %u78 to i1
	br i1 %u79, label %LU67, label %LU68
LU67:
	call void @printf_newline(i32 0)
	br label %LU69
LU68:
	call void @printf_newline(i32 1)
	br label %LU69
LU69:
	%u80 = icmp sle i32 42, 1
	%u81 = zext i1 %u80 to i32
	%u82 = trunc i32 %u81 to i1
	br i1 %u82, label %LU70, label %LU71
LU70:
	call void @printf_newline(i32 0)
	br label %LU72
LU71:
	call void @printf_newline(i32 1)
	br label %LU72
LU72:
	%u83 = icmp eq i32 42, 1
	%u84 = zext i1 %u83 to i32
	%u85 = trunc i32 %u84 to i1
	br i1 %u85, label %LU73, label %LU74
LU73:
	call void @printf_newline(i32 0)
	br label %LU75
LU74:
	call void @printf_newline(i32 1)
	br label %LU75
LU75:
	%u86 = icmp ne i32 42, 1
	%u87 = zext i1 %u86 to i32
	%u88 = trunc i32 %u87 to i1
	br i1 %u88, label %LU76, label %LU77
LU76:
	call void @printf_newline(i32 1)
	br label %LU78
LU77:
	call void @printf_newline(i32 0)
	br label %LU78
LU78:
	%u89 = trunc i32 1 to i1
	br i1 %u89, label %LU79, label %LU80
LU79:
	call void @printf_newline(i32 1)
	br label %LU81
LU80:
	call void @printf_newline(i32 0)
	br label %LU81
LU81:
	%u90 = xor i32 1, 1
	%u91 = trunc i32 %u90 to i1
	br i1 %u91, label %LU82, label %LU83
LU82:
	call void @printf_newline(i32 0)
	br label %LU84
LU83:
	call void @printf_newline(i32 1)
	br label %LU84
LU84:
	%u92 = trunc i32 0 to i1
	br i1 %u92, label %LU85, label %LU86
LU85:
	call void @printf_newline(i32 0)
	br label %LU87
LU86:
	call void @printf_newline(i32 1)
	br label %LU87
LU87:
	%u93 = xor i32 1, 0
	%u94 = trunc i32 %u93 to i1
	br i1 %u94, label %LU88, label %LU89
LU88:
	call void @printf_newline(i32 1)
	br label %LU90
LU89:
	call void @printf_newline(i32 0)
	br label %LU90
LU90:
	%u95 = xor i32 1, 0
	%u96 = trunc i32 %u95 to i1
	br i1 %u96, label %LU91, label %LU92
LU91:
	call void @printf_newline(i32 1)
	br label %LU93
LU92:
	call void @printf_newline(i32 0)
	br label %LU93
LU93:
	call void @printgroup(i32 4)
	%u97 = add i32 2, 3
	%u98 = icmp eq i32 %u97, 5
	%u99 = zext i1 %u98 to i32
	%u100 = trunc i32 %u99 to i1
	br i1 %u100, label %LU94, label %LU95
LU94:
	call void @printf_newline(i32 1)
	br label %LU96
LU95:
	call void @printf_int(i32 0)
	%u101 = add i32 2, 3
	call void @printf_newline(i32 %u101)
	br label %LU96
LU96:
	%u102 = mul i32 2, 3
	%u103 = icmp eq i32 %u102, 6
	%u104 = zext i1 %u103 to i32
	%u105 = trunc i32 %u104 to i1
	br i1 %u105, label %LU97, label %LU98
LU97:
	call void @printf_newline(i32 1)
	br label %LU99
LU98:
	call void @printf_int(i32 0)
	%u106 = mul i32 2, 3
	call void @printf_newline(i32 %u106)
	br label %LU99
LU99:
	%u107 = sub i32 3, 2
	%u108 = icmp eq i32 %u107, 1
	%u109 = zext i1 %u108 to i32
	%u110 = trunc i32 %u109 to i1
	br i1 %u110, label %LU100, label %LU101
LU100:
	call void @printf_newline(i32 1)
	br label %LU102
LU101:
	call void @printf_int(i32 0)
	%u111 = sub i32 3, 2
	call void @printf_newline(i32 %u111)
	br label %LU102
LU102:
	%u112 = sdiv i32 6, 3
	%u113 = icmp eq i32 %u112, 2
	%u114 = zext i1 %u113 to i32
	%u115 = trunc i32 %u114 to i1
	br i1 %u115, label %LU103, label %LU104
LU103:
	call void @printf_newline(i32 1)
	br label %LU105
LU104:
	call void @printf_int(i32 0)
	%u116 = sdiv i32 6, 3
	call void @printf_newline(i32 %u116)
	br label %LU105
LU105:
	%u117 = mul i32 6, -1
	%u118 = icmp slt i32 %u117, 0
	%u119 = zext i1 %u118 to i32
	%u120 = trunc i32 %u119 to i1
	br i1 %u120, label %LU106, label %LU107
LU106:
	call void @printf_newline(i32 1)
	br label %LU108
LU107:
	call void @printf_newline(i32 0)
	br label %LU108
LU108:
	call void @printgroup(i32 5)
	store i32 42, i32* %i1
	%u121 = load i32* %i1
	%u122 = icmp eq i32 %u121, 42
	%u123 = zext i1 %u122 to i32
	%u124 = trunc i32 %u123 to i1
	br i1 %u124, label %LU109, label %LU110
LU109:
	call void @printf_newline(i32 1)
	br label %LU111
LU110:
	call void @printf_newline(i32 0)
	br label %LU111
LU111:
	store i32 3, i32* %i1
	store i32 2, i32* %i2
	%u125 = load i32* %i1
	%u126 = load i32* %i2
	%u127 = add i32 %u125, %u126
	store i32 %u127, i32* %i3
	%u128 = load i32* %i3
	%u129 = icmp eq i32 %u128, 5
	%u130 = zext i1 %u129 to i32
	%u131 = trunc i32 %u130 to i1
	br i1 %u131, label %LU112, label %LU113
LU112:
	call void @printf_newline(i32 1)
	br label %LU114
LU113:
	call void @printf_newline(i32 0)
	br label %LU114
LU114:
	store i32 1, i32* %b1
	%u132 = load i32* %b1
	%u133 = trunc i32 %u132 to i1
	br i1 %u133, label %LU115, label %LU116
LU115:
	call void @printf_newline(i32 1)
	br label %LU117
LU116:
	call void @printf_newline(i32 0)
	br label %LU117
LU117:
	%u134 = load i32* %b1
	%u135 = xor i32 1, %u134
	%u136 = trunc i32 %u135 to i1
	br i1 %u136, label %LU118, label %LU119
LU118:
	call void @printf_newline(i32 0)
	br label %LU120
LU119:
	call void @printf_newline(i32 1)
	br label %LU120
LU120:
	store i32 0, i32* %b1
	%u137 = load i32* %b1
	%u138 = trunc i32 %u137 to i1
	br i1 %u138, label %LU121, label %LU122
LU121:
	call void @printf_newline(i32 0)
	br label %LU123
LU122:
	call void @printf_newline(i32 1)
	br label %LU123
LU123:
	%u139 = load i32* %b1
	%u140 = xor i32 1, %u139
	%u141 = trunc i32 %u140 to i1
	br i1 %u141, label %LU124, label %LU125
LU124:
	call void @printf_newline(i32 1)
	br label %LU126
LU125:
	call void @printf_newline(i32 0)
	br label %LU126
LU126:
	%u142 = load i32* %b1
	%u143 = trunc i32 %u142 to i1
	br i1 %u143, label %LU127, label %LU128
LU127:
	call void @printf_newline(i32 0)
	br label %LU129
LU128:
	call void @printf_newline(i32 1)
	br label %LU129
LU129:
	call void @printgroup(i32 6)
	store i32 0, i32* %i1
	%u144 = load i32* %i1
	%u145 = icmp slt i32 %u144, 5
	%u146 = zext i1 %u145 to i32
	%u147 = trunc i32 %u146 to i1
	br i1 %u147, label %LU130, label %LU131
LU130:
	%u148 = load i32* %i1
	%u149 = icmp sge i32 %u148, 5
	%u150 = zext i1 %u149 to i32
	%u151 = trunc i32 %u150 to i1
	br i1 %u151, label %LU132, label %LU133
LU131:
	%u158 = load i32* %i1
	%u159 = icmp eq i32 %u158, 5
	%u160 = zext i1 %u159 to i32
	%u161 = trunc i32 %u160 to i1
	br i1 %u161, label %LU135, label %LU136
LU132:
	call void @printf_newline(i32 0)
	br label %LU134
LU133:
	br label %LU134
LU134:
	%u152 = load i32* %i1
	%u153 = add i32 %u152, 5
	store i32 %u153, i32* %i1
	%u154 = load i32* %i1
	%u155 = icmp slt i32 %u154, 5
	%u156 = zext i1 %u155 to i32
	%u157 = trunc i32 %u156 to i1
	br i1 %u157, label %LU130, label %LU131
LU135:
	call void @printf_newline(i32 1)
	br label %LU137
LU136:
	call void @printf_int(i32 0)
	%u162 = load i32* %i1
	call void @printf_newline(i32 %u162)
	br label %LU137
LU137:
	call void @printgroup(i32 7)
	%u163 = call i8* @malloc(i32 12)
	%u164 = bitcast i8* %u163 to %struct.thing*
	store %struct.thing* %u164, %struct.thing** %s1
	%u165 = load %struct.thing** %s1
	%u166 = getelementptr %struct.thing* %u165, i1 0, i32 0
	store i32 42, i32* %u166
	%u167 = load %struct.thing** %s1
	%u168 = getelementptr %struct.thing* %u167, i1 0, i32 1
	store i32 1, i32* %u168
	%u169 = load %struct.thing** %s1
	%u170 = getelementptr %struct.thing* %u169, i1 0, i32 0
	%u171 = load i32* %u170
	%u172 = icmp eq i32 %u171, 42
	%u173 = zext i1 %u172 to i32
	%u174 = trunc i32 %u173 to i1
	br i1 %u174, label %LU138, label %LU139
LU138:
	call void @printf_newline(i32 1)
	br label %LU140
LU139:
	call void @printf_int(i32 0)
	%u175 = load %struct.thing** %s1
	%u176 = getelementptr %struct.thing* %u175, i1 0, i32 0
	%u177 = load i32* %u176
	call void @printf_newline(i32 %u177)
	br label %LU140
LU140:
	%u178 = load %struct.thing** %s1
	%u179 = getelementptr %struct.thing* %u178, i1 0, i32 1
	%u180 = load i32* %u179
	%u181 = trunc i32 %u180 to i1
	br i1 %u181, label %LU141, label %LU142
LU141:
	call void @printf_newline(i32 1)
	br label %LU143
LU142:
	call void @printf_newline(i32 0)
	br label %LU143
LU143:
	%u182 = call i8* @malloc(i32 12)
	%u183 = bitcast i8* %u182 to %struct.thing*
	%u184 = load %struct.thing** %s1
	%u185 = getelementptr %struct.thing* %u184, i1 0, i32 2
	store %struct.thing* %u183, %struct.thing** %u185
	%u186 = load %struct.thing** %s1
	%u187 = getelementptr %struct.thing* %u186, i1 0, i32 2
	%u188 = load %struct.thing** %u187
	%u189 = getelementptr %struct.thing* %u188, i1 0, i32 0
	store i32 13, i32* %u189
	%u190 = load %struct.thing** %s1
	%u191 = getelementptr %struct.thing* %u190, i1 0, i32 2
	%u192 = load %struct.thing** %u191
	%u193 = getelementptr %struct.thing* %u192, i1 0, i32 1
	store i32 0, i32* %u193
	%u194 = load %struct.thing** %s1
	%u195 = getelementptr %struct.thing* %u194, i1 0, i32 2
	%u196 = load %struct.thing** %u195
	%u197 = getelementptr %struct.thing* %u196, i1 0, i32 0
	%u198 = load i32* %u197
	%u199 = icmp eq i32 %u198, 13
	%u200 = zext i1 %u199 to i32
	%u201 = trunc i32 %u200 to i1
	br i1 %u201, label %LU144, label %LU145
LU144:
	call void @printf_newline(i32 1)
	br label %LU146
LU145:
	call void @printf_int(i32 0)
	%u202 = load %struct.thing** %s1
	%u203 = getelementptr %struct.thing* %u202, i1 0, i32 2
	%u204 = load %struct.thing** %u203
	%u205 = getelementptr %struct.thing* %u204, i1 0, i32 0
	%u206 = load i32* %u205
	call void @printf_newline(i32 %u206)
	br label %LU146
LU146:
	%u207 = load %struct.thing** %s1
	%u208 = getelementptr %struct.thing* %u207, i1 0, i32 2
	%u209 = load %struct.thing** %u208
	%u210 = getelementptr %struct.thing* %u209, i1 0, i32 1
	%u211 = load i32* %u210
	%u212 = xor i32 1, %u211
	%u213 = trunc i32 %u212 to i1
	br i1 %u213, label %LU147, label %LU148
LU147:
	call void @printf_newline(i32 1)
	br label %LU149
LU148:
	call void @printf_newline(i32 0)
	br label %LU149
LU149:
	%u214 = load %struct.thing** %s1
	%u215 = load %struct.thing** %s1
	%u216 = icmp eq %struct.thing* %u214, %u215
	%u217 = zext i1 %u216 to i32
	%u218 = trunc i32 %u217 to i1
	br i1 %u218, label %LU150, label %LU151
LU150:
	call void @printf_newline(i32 1)
	br label %LU152
LU151:
	call void @printf_newline(i32 0)
	br label %LU152
LU152:
	%u219 = load %struct.thing** %s1
	%u220 = load %struct.thing** %s1
	%u221 = getelementptr %struct.thing* %u220, i1 0, i32 2
	%u222 = load %struct.thing** %u221
	%u223 = icmp ne %struct.thing* %u219, %u222
	%u224 = zext i1 %u223 to i32
	%u225 = trunc i32 %u224 to i1
	br i1 %u225, label %LU153, label %LU154
LU153:
	call void @printf_newline(i32 1)
	br label %LU155
LU154:
	call void @printf_newline(i32 0)
	br label %LU155
LU155:
	%u226 = load %struct.thing** %s1
	%u227 = getelementptr %struct.thing* %u226, i1 0, i32 2
	%u228 = load %struct.thing** %u227
	%u229 = bitcast %struct.thing* %u228 to i8*
	call void @free(i8* %u229)
	%u230 = load %struct.thing** %s1
	%u231 = bitcast %struct.thing* %u230 to i8*
	call void @free(i8* %u231)
	call void @printgroup(i32 8)
	store i32 7, i32* @gi1
	%u232 = load i32* @gi1
	%u233 = icmp eq i32 %u232, 7
	%u234 = zext i1 %u233 to i32
	%u235 = trunc i32 %u234 to i1
	br i1 %u235, label %LU156, label %LU157
LU156:
	call void @printf_newline(i32 1)
	br label %LU158
LU157:
	call void @printf_int(i32 0)
	%u236 = load i32* @gi1
	call void @printf_newline(i32 %u236)
	br label %LU158
LU158:
	store i32 1, i32* @gb1
	%u237 = load i32* @gb1
	%u238 = trunc i32 %u237 to i1
	br i1 %u238, label %LU159, label %LU160
LU159:
	call void @printf_newline(i32 1)
	br label %LU161
LU160:
	call void @printf_newline(i32 0)
	br label %LU161
LU161:
	%u239 = call i8* @malloc(i32 12)
	%u240 = bitcast i8* %u239 to %struct.thing*
	store %struct.thing* %u240, %struct.thing** @gs1
	%u241 = load %struct.thing** @gs1
	%u242 = getelementptr %struct.thing* %u241, i1 0, i32 0
	store i32 34, i32* %u242
	%u243 = load %struct.thing** @gs1
	%u244 = getelementptr %struct.thing* %u243, i1 0, i32 1
	store i32 0, i32* %u244
	%u245 = load %struct.thing** @gs1
	%u246 = getelementptr %struct.thing* %u245, i1 0, i32 0
	%u247 = load i32* %u246
	%u248 = icmp eq i32 %u247, 34
	%u249 = zext i1 %u248 to i32
	%u250 = trunc i32 %u249 to i1
	br i1 %u250, label %LU162, label %LU163
LU162:
	call void @printf_newline(i32 1)
	br label %LU164
LU163:
	call void @printf_int(i32 0)
	%u251 = load %struct.thing** @gs1
	%u252 = getelementptr %struct.thing* %u251, i1 0, i32 0
	%u253 = load i32* %u252
	call void @printf_newline(i32 %u253)
	br label %LU164
LU164:
	%u254 = load %struct.thing** @gs1
	%u255 = getelementptr %struct.thing* %u254, i1 0, i32 1
	%u256 = load i32* %u255
	%u257 = xor i32 1, %u256
	%u258 = trunc i32 %u257 to i1
	br i1 %u258, label %LU165, label %LU166
LU165:
	call void @printf_newline(i32 1)
	br label %LU167
LU166:
	call void @printf_newline(i32 0)
	br label %LU167
LU167:
	%u259 = call i8* @malloc(i32 12)
	%u260 = bitcast i8* %u259 to %struct.thing*
	%u261 = load %struct.thing** @gs1
	%u262 = getelementptr %struct.thing* %u261, i1 0, i32 2
	store %struct.thing* %u260, %struct.thing** %u262
	%u263 = load %struct.thing** @gs1
	%u264 = getelementptr %struct.thing* %u263, i1 0, i32 2
	%u265 = load %struct.thing** %u264
	%u266 = getelementptr %struct.thing* %u265, i1 0, i32 0
	store i32 16, i32* %u266
	%u267 = load %struct.thing** @gs1
	%u268 = getelementptr %struct.thing* %u267, i1 0, i32 2
	%u269 = load %struct.thing** %u268
	%u270 = getelementptr %struct.thing* %u269, i1 0, i32 1
	store i32 1, i32* %u270
	%u271 = load %struct.thing** @gs1
	%u272 = getelementptr %struct.thing* %u271, i1 0, i32 2
	%u273 = load %struct.thing** %u272
	%u274 = getelementptr %struct.thing* %u273, i1 0, i32 0
	%u275 = load i32* %u274
	%u276 = icmp eq i32 %u275, 16
	%u277 = zext i1 %u276 to i32
	%u278 = trunc i32 %u277 to i1
	br i1 %u278, label %LU168, label %LU169
LU168:
	call void @printf_newline(i32 1)
	br label %LU170
LU169:
	call void @printf_int(i32 0)
	%u279 = load %struct.thing** @gs1
	%u280 = getelementptr %struct.thing* %u279, i1 0, i32 2
	%u281 = load %struct.thing** %u280
	%u282 = getelementptr %struct.thing* %u281, i1 0, i32 0
	%u283 = load i32* %u282
	call void @printf_newline(i32 %u283)
	br label %LU170
LU170:
	%u284 = load %struct.thing** @gs1
	%u285 = getelementptr %struct.thing* %u284, i1 0, i32 2
	%u286 = load %struct.thing** %u285
	%u287 = getelementptr %struct.thing* %u286, i1 0, i32 1
	%u288 = load i32* %u287
	%u289 = trunc i32 %u288 to i1
	br i1 %u289, label %LU171, label %LU172
LU171:
	call void @printf_newline(i32 1)
	br label %LU173
LU172:
	call void @printf_newline(i32 0)
	br label %LU173
LU173:
	%u290 = load %struct.thing** @gs1
	%u291 = getelementptr %struct.thing* %u290, i1 0, i32 2
	%u292 = load %struct.thing** %u291
	%u293 = bitcast %struct.thing* %u292 to i8*
	call void @free(i8* %u293)
	%u294 = load %struct.thing** @gs1
	%u295 = bitcast %struct.thing* %u294 to i8*
	call void @free(i8* %u295)
	call void @printgroup(i32 9)
	%u296 = call i8* @malloc(i32 12)
	%u297 = bitcast i8* %u296 to %struct.thing*
	store %struct.thing* %u297, %struct.thing** %s1
	%u298 = load %struct.thing** %s1
	%u299 = getelementptr %struct.thing* %u298, i1 0, i32 1
	store i32 1, i32* %u299
	%u300 = load %struct.thing** %s1
	call void @takealltypes(i32 3, i32 1, %struct.thing* %u300)
	call void @printf_newline(i32 2)
	call void @tonofargs(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8)
	call void @printf_newline(i32 3)
	%u301 = call i32 @returnint(i32 3)
	store i32 %u301, i32* %i1
	%u302 = load i32* %i1
	%u303 = icmp eq i32 %u302, 3
	%u304 = zext i1 %u303 to i32
	%u305 = trunc i32 %u304 to i1
	br i1 %u305, label %LU174, label %LU175
LU174:
	call void @printf_newline(i32 1)
	br label %LU176
LU175:
	call void @printf_int(i32 0)
	%u306 = load i32* %i1
	call void @printf_newline(i32 %u306)
	br label %LU176
LU176:
	%u307 = call i32 @returnbool(i32 1)
	store i32 %u307, i32* %b1
	%u308 = load i32* %b1
	%u309 = trunc i32 %u308 to i1
	br i1 %u309, label %LU177, label %LU178
LU177:
	call void @printf_newline(i32 1)
	br label %LU179
LU178:
	call void @printf_newline(i32 0)
	br label %LU179
LU179:
	%u310 = call i8* @malloc(i32 12)
	%u311 = bitcast i8* %u310 to %struct.thing*
	store %struct.thing* %u311, %struct.thing** %s1
	%u313 = load %struct.thing** %s1
	%u312 = call %struct.thing* @returnstruct(%struct.thing* %u313)
	store %struct.thing* %u312, %struct.thing** %s2
	%u314 = load %struct.thing** %s1
	%u315 = load %struct.thing** %s2
	%u316 = icmp eq %struct.thing* %u314, %u315
	%u317 = zext i1 %u316 to i32
	%u318 = trunc i32 %u317 to i1
	br i1 %u318, label %LU180, label %LU181
LU180:
	call void @printf_newline(i32 1)
	br label %LU182
LU181:
	call void @printf_newline(i32 0)
	br label %LU182
LU182:
	call void @printgroup(i32 10)
	store i32 0, i32* %_retval_
	br label %LU35
LU35:
	%u319 = load i32* %_retval_
	ret i32 %u319
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
