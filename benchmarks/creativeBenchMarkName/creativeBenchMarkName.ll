target triple="i686"
%struct.node = type {i32, %struct.node*}


define %struct.node* @buildList()
{
LU1:
	%_retval_ = alloca %struct.node*
	%input = alloca i32
	%i = alloca i32
	%n0 = alloca %struct.node*
	%n1 = alloca %struct.node*
	%n2 = alloca %struct.node*
	%n3 = alloca %struct.node*
	%n4 = alloca %struct.node*
	%n5 = alloca %struct.node*
	%u0 = call i8* @malloc(i32 8)
	%u1 = bitcast i8* %u0 to %struct.node*
	store %struct.node* %u1, %struct.node** %n0
	%u2 = call i8* @malloc(i32 8)
	%u3 = bitcast i8* %u2 to %struct.node*
	store %struct.node* %u3, %struct.node** %n1
	%u4 = call i8* @malloc(i32 8)
	%u5 = bitcast i8* %u4 to %struct.node*
	store %struct.node* %u5, %struct.node** %n2
	%u6 = call i8* @malloc(i32 8)
	%u7 = bitcast i8* %u6 to %struct.node*
	store %struct.node* %u7, %struct.node** %n3
	%u8 = call i8* @malloc(i32 8)
	%u9 = bitcast i8* %u8 to %struct.node*
	store %struct.node* %u9, %struct.node** %n4
	%u10 = call i8* @malloc(i32 8)
	%u11 = bitcast i8* %u10 to %struct.node*
	store %struct.node* %u11, %struct.node** %n5
	%u12 = call i32 @read()
	%u13 = load %struct.node** %n0
	%u14 = getelementptr %struct.node* %u13, i1 0, i32 0
	store i32 %u12, i32* %u14
	%u15 = call i32 @read()
	%u16 = load %struct.node** %n1
	%u17 = getelementptr %struct.node* %u16, i1 0, i32 0
	store i32 %u15, i32* %u17
	%u18 = call i32 @read()
	%u19 = load %struct.node** %n2
	%u20 = getelementptr %struct.node* %u19, i1 0, i32 0
	store i32 %u18, i32* %u20
	%u21 = call i32 @read()
	%u22 = load %struct.node** %n3
	%u23 = getelementptr %struct.node* %u22, i1 0, i32 0
	store i32 %u21, i32* %u23
	%u24 = call i32 @read()
	%u25 = load %struct.node** %n4
	%u26 = getelementptr %struct.node* %u25, i1 0, i32 0
	store i32 %u24, i32* %u26
	%u27 = call i32 @read()
	%u28 = load %struct.node** %n5
	%u29 = getelementptr %struct.node* %u28, i1 0, i32 0
	store i32 %u27, i32* %u29
	%u30 = load %struct.node** %n1
	%u31 = load %struct.node** %n0
	%u32 = getelementptr %struct.node* %u31, i1 0, i32 1
	store %struct.node* %u30, %struct.node** %u32
	%u33 = load %struct.node** %n2
	%u34 = load %struct.node** %n1
	%u35 = getelementptr %struct.node* %u34, i1 0, i32 1
	store %struct.node* %u33, %struct.node** %u35
	%u36 = load %struct.node** %n3
	%u37 = load %struct.node** %n2
	%u38 = getelementptr %struct.node* %u37, i1 0, i32 1
	store %struct.node* %u36, %struct.node** %u38
	%u39 = load %struct.node** %n4
	%u40 = load %struct.node** %n3
	%u41 = getelementptr %struct.node* %u40, i1 0, i32 1
	store %struct.node* %u39, %struct.node** %u41
	%u42 = load %struct.node** %n5
	%u43 = load %struct.node** %n4
	%u44 = getelementptr %struct.node* %u43, i1 0, i32 1
	store %struct.node* %u42, %struct.node** %u44
	%u45 = load %struct.node** %n5
	%u46 = getelementptr %struct.node* %u45, i1 0, i32 1
	store %struct.node* null, %struct.node** %u46
	%u47 = load %struct.node** %n0
	store %struct.node* %u47, %struct.node** %_retval_
	br label %LU0
LU0:
	%u48 = load %struct.node** %_retval_
	ret %struct.node* %u48
}

define i32 @multiple(%struct.node* %_P_list)
{
LU3:
	%_retval_ = alloca i32
	%i = alloca i32
	%product = alloca i32
	%cur = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	store i32 0, i32* %i
	%u49 = load %struct.node** %list
	store %struct.node* %u49, %struct.node** %cur
	%u50 = load %struct.node** %cur
	%u51 = getelementptr %struct.node* %u50, i1 0, i32 0
	%u52 = load i32* %u51
	store i32 %u52, i32* %product
	%u53 = load %struct.node** %cur
	%u54 = getelementptr %struct.node* %u53, i1 0, i32 1
	%u55 = load %struct.node** %u54
	store %struct.node* %u55, %struct.node** %cur
	%u56 = load i32* %i
	%u57 = icmp slt i32 %u56, 5
	%u58 = zext i1 %u57 to i32
	%u59 = trunc i32 %u58 to i1
	br i1 %u59, label %LU4, label %LU5
LU4:
	%u60 = load i32* %product
	%u61 = load %struct.node** %cur
	%u62 = getelementptr %struct.node* %u61, i1 0, i32 0
	%u63 = load i32* %u62
	%u64 = mul i32 %u60, %u63
	store i32 %u64, i32* %product
	%u65 = load %struct.node** %cur
	%u66 = getelementptr %struct.node* %u65, i1 0, i32 1
	%u67 = load %struct.node** %u66
	store %struct.node* %u67, %struct.node** %cur
	%u68 = load i32* %product
	call void @printf_newline(i32 %u68)
	%u69 = load i32* %i
	%u70 = add i32 %u69, 1
	store i32 %u70, i32* %i
	%u71 = load i32* %i
	%u72 = icmp slt i32 %u71, 5
	%u73 = zext i1 %u72 to i32
	%u74 = trunc i32 %u73 to i1
	br i1 %u74, label %LU4, label %LU5
LU5:
	%u75 = load i32* %product
	store i32 %u75, i32* %_retval_
	br label %LU2
LU2:
	%u76 = load i32* %_retval_
	ret i32 %u76
}

define i32 @add(%struct.node* %_P_list)
{
LU7:
	%_retval_ = alloca i32
	%i = alloca i32
	%sum = alloca i32
	%cur = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	store i32 0, i32* %i
	%u77 = load %struct.node** %list
	store %struct.node* %u77, %struct.node** %cur
	%u78 = load %struct.node** %cur
	%u79 = getelementptr %struct.node* %u78, i1 0, i32 0
	%u80 = load i32* %u79
	store i32 %u80, i32* %sum
	%u81 = load %struct.node** %cur
	%u82 = getelementptr %struct.node* %u81, i1 0, i32 1
	%u83 = load %struct.node** %u82
	store %struct.node* %u83, %struct.node** %cur
	%u84 = load i32* %i
	%u85 = icmp slt i32 %u84, 5
	%u86 = zext i1 %u85 to i32
	%u87 = trunc i32 %u86 to i1
	br i1 %u87, label %LU8, label %LU9
LU8:
	%u88 = load i32* %sum
	%u89 = load %struct.node** %cur
	%u90 = getelementptr %struct.node* %u89, i1 0, i32 0
	%u91 = load i32* %u90
	%u92 = add i32 %u88, %u91
	store i32 %u92, i32* %sum
	%u93 = load %struct.node** %cur
	%u94 = getelementptr %struct.node* %u93, i1 0, i32 1
	%u95 = load %struct.node** %u94
	store %struct.node* %u95, %struct.node** %cur
	%u96 = load i32* %sum
	call void @printf_newline(i32 %u96)
	%u97 = load i32* %i
	%u98 = add i32 %u97, 1
	store i32 %u98, i32* %i
	%u99 = load i32* %i
	%u100 = icmp slt i32 %u99, 5
	%u101 = zext i1 %u100 to i32
	%u102 = trunc i32 %u101 to i1
	br i1 %u102, label %LU8, label %LU9
LU9:
	%u103 = load i32* %sum
	store i32 %u103, i32* %_retval_
	br label %LU6
LU6:
	%u104 = load i32* %_retval_
	ret i32 %u104
}

define i32 @recurseList(%struct.node* %_P_list)
{
LU11:
	%_retval_ = alloca i32
	%list = alloca %struct.node*
	store %struct.node* %_P_list, %struct.node** %list
	%u105 = load %struct.node** %list
	%u106 = getelementptr %struct.node* %u105, i1 0, i32 1
	%u107 = load %struct.node** %u106
	%u108 = icmp eq %struct.node* %u107, null
	%u109 = zext i1 %u108 to i32
	%u110 = trunc i32 %u109 to i1
	br i1 %u110, label %LU12, label %LU13
LU12:
	%u111 = load %struct.node** %list
	%u112 = getelementptr %struct.node* %u111, i1 0, i32 0
	%u113 = load i32* %u112
	store i32 %u113, i32* %_retval_
	br label %LU10
LU13:
	%u114 = load %struct.node** %list
	%u115 = getelementptr %struct.node* %u114, i1 0, i32 0
	%u116 = load i32* %u115
	%u118 = load %struct.node** %list
	%u119 = getelementptr %struct.node* %u118, i1 0, i32 1
	%u120 = load %struct.node** %u119
	%u117 = call i32 @recurseList(%struct.node* %u120)
	%u121 = mul i32 %u116, %u117
	store i32 %u121, i32* %_retval_
	br label %LU10
LU10:
	%u122 = load i32* %_retval_
	ret i32 %u122
LU14:
	br label %LU10
}

define i32 @main()
{
LU16:
	%_retval_ = alloca i32
	%list = alloca %struct.node*
	%product = alloca i32
	%sum = alloca i32
	%result = alloca i32
	%bigProduct = alloca i32
	%i = alloca i32
	store i32 0, i32* %i
	store i32 0, i32* %bigProduct
	%u123 = call %struct.node* @buildList()
	store %struct.node* %u123, %struct.node** %list
	%u125 = load %struct.node** %list
	%u124 = call i32 @multiple(%struct.node* %u125)
	store i32 %u124, i32* %product
	%u127 = load %struct.node** %list
	%u126 = call i32 @add(%struct.node* %u127)
	store i32 %u126, i32* %sum
	%u128 = load i32* %product
	%u129 = load i32* %sum
	%u130 = sdiv i32 %u129, 2
	%u131 = sub i32 %u128, %u130
	store i32 %u131, i32* %result
	%u132 = load i32* %i
	%u133 = icmp slt i32 %u132, 2
	%u134 = zext i1 %u133 to i32
	%u135 = trunc i32 %u134 to i1
	br i1 %u135, label %LU17, label %LU18
LU17:
	%u136 = load i32* %bigProduct
	%u138 = load %struct.node** %list
	%u137 = call i32 @recurseList(%struct.node* %u138)
	%u139 = add i32 %u136, %u137
	store i32 %u139, i32* %bigProduct
	%u140 = load i32* %i
	%u141 = add i32 %u140, 1
	store i32 %u141, i32* %i
	%u142 = load i32* %i
	%u143 = icmp slt i32 %u142, 2
	%u144 = zext i1 %u143 to i32
	%u145 = trunc i32 %u144 to i1
	br i1 %u145, label %LU17, label %LU18
LU18:
	%u146 = load i32* %bigProduct
	call void @printf_newline(i32 %u146)
	%u147 = load i32* %bigProduct
	%u148 = icmp ne i32 %u147, 0
	%u149 = zext i1 %u148 to i32
	%u150 = trunc i32 %u149 to i1
	br i1 %u150, label %LU19, label %LU20
LU19:
	%u151 = load i32* %bigProduct
	%u152 = sub i32 %u151, 1
	store i32 %u152, i32* %bigProduct
	%u153 = load i32* %bigProduct
	%u154 = icmp ne i32 %u153, 0
	%u155 = zext i1 %u154 to i32
	%u156 = trunc i32 %u155 to i1
	br i1 %u156, label %LU19, label %LU20
LU20:
	%u157 = load i32* %result
	call void @printf_newline(i32 %u157)
	%u158 = load i32* %bigProduct
	call void @printf_newline(i32 %u158)
	store i32 0, i32* %_retval_
	br label %LU15
LU15:
	%u159 = load i32* %_retval_
	ret i32 %u159
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
