target triple="i686"

@global1 = common global i32 0, align 4
@global2 = common global i32 0, align 4
@global3 = common global i32 0, align 4

define i32 @constantFolding()
{
LU1:
	%_retval_ = alloca i32
	%a = alloca i32
	%u0 = mul i32 8, 9
	%u1 = sdiv i32 %u0, 4
	%u2 = add i32 %u1, 2
	%u3 = mul i32 5, 8
	%u4 = sub i32 %u2, %u3
	%u5 = add i32 %u4, 9
	%u6 = sub i32 %u5, 12
	%u7 = add i32 %u6, 6
	%u8 = sub i32 %u7, 9
	%u9 = sub i32 %u8, 18
	%u10 = mul i32 23, 3
	%u11 = sdiv i32 %u10, 23
	%u12 = mul i32 %u11, 90
	%u13 = add i32 %u9, %u12
	store i32 %u13, i32* %a
	%u14 = load i32* %a
	store i32 %u14, i32* %_retval_
	br label %LU0
LU0:
	%u15 = load i32* %_retval_
	ret i32 %u15
}

define i32 @constantPropagation()
{
LU3:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%f = alloca i32
	%g = alloca i32
	%h = alloca i32
	%i = alloca i32
	%j = alloca i32
	%k = alloca i32
	%l = alloca i32
	%m = alloca i32
	%n = alloca i32
	%o = alloca i32
	%p = alloca i32
	%q = alloca i32
	%r = alloca i32
	%s = alloca i32
	%t = alloca i32
	%u = alloca i32
	%v = alloca i32
	%w = alloca i32
	%x = alloca i32
	%y = alloca i32
	%z = alloca i32
	store i32 4, i32* %a
	store i32 7, i32* %b
	store i32 8, i32* %c
	store i32 5, i32* %d
	store i32 11, i32* %e
	store i32 21, i32* %f
	%u16 = load i32* %a
	%u17 = load i32* %b
	%u18 = add i32 %u16, %u17
	store i32 %u18, i32* %g
	%u19 = load i32* %c
	%u20 = load i32* %d
	%u21 = add i32 %u19, %u20
	store i32 %u21, i32* %h
	%u22 = load i32* %e
	%u23 = load i32* %f
	%u24 = add i32 %u22, %u23
	store i32 %u24, i32* %i
	%u25 = load i32* %g
	%u26 = load i32* %h
	%u27 = add i32 %u25, %u26
	store i32 %u27, i32* %j
	%u28 = load i32* %i
	%u29 = load i32* %j
	%u30 = mul i32 %u28, %u29
	store i32 %u30, i32* %k
	%u31 = load i32* %e
	%u32 = load i32* %h
	%u33 = load i32* %i
	%u34 = mul i32 %u32, %u33
	%u35 = add i32 %u31, %u34
	%u36 = load i32* %k
	%u37 = sub i32 %u35, %u36
	store i32 %u37, i32* %l
	%u38 = load i32* %h
	%u39 = load i32* %i
	%u40 = load i32* %j
	%u41 = mul i32 %u39, %u40
	%u42 = sub i32 %u38, %u41
	%u43 = load i32* %k
	%u44 = load i32* %l
	%u45 = sdiv i32 %u43, %u44
	%u46 = add i32 %u42, %u45
	store i32 %u46, i32* %m
	%u47 = load i32* %e
	%u48 = load i32* %f
	%u49 = add i32 %u47, %u48
	%u50 = load i32* %g
	%u51 = add i32 %u49, %u50
	%u52 = load i32* %h
	%u53 = add i32 %u51, %u52
	%u54 = load i32* %i
	%u55 = add i32 %u53, %u54
	%u56 = load i32* %j
	%u57 = sub i32 %u55, %u56
	store i32 %u57, i32* %n
	%u58 = load i32* %n
	%u59 = load i32* %m
	%u60 = sub i32 %u58, %u59
	%u61 = load i32* %h
	%u62 = add i32 %u60, %u61
	%u63 = load i32* %a
	%u64 = sub i32 %u62, %u63
	%u65 = load i32* %b
	%u66 = sub i32 %u64, %u65
	store i32 %u66, i32* %o
	%u67 = load i32* %k
	%u68 = load i32* %l
	%u69 = add i32 %u67, %u68
	%u70 = load i32* %g
	%u71 = sub i32 %u69, %u70
	%u72 = load i32* %h
	%u73 = sub i32 %u71, %u72
	store i32 %u73, i32* %p
	%u74 = load i32* %b
	%u75 = load i32* %a
	%u76 = sub i32 %u74, %u75
	%u77 = load i32* %d
	%u78 = mul i32 %u76, %u77
	%u79 = load i32* %i
	%u80 = sub i32 %u78, %u79
	store i32 %u80, i32* %q
	%u81 = load i32* %l
	%u82 = load i32* %c
	%u83 = mul i32 %u81, %u82
	%u84 = load i32* %d
	%u85 = mul i32 %u83, %u84
	%u86 = load i32* %o
	%u87 = add i32 %u85, %u86
	store i32 %u87, i32* %r
	%u88 = load i32* %b
	%u89 = load i32* %a
	%u90 = mul i32 %u88, %u89
	%u91 = load i32* %c
	%u92 = mul i32 %u90, %u91
	%u93 = load i32* %e
	%u94 = sdiv i32 %u92, %u93
	%u95 = load i32* %o
	%u96 = sub i32 %u94, %u95
	store i32 %u96, i32* %s
	%u97 = load i32* %i
	%u98 = load i32* %k
	%u99 = add i32 %u97, %u98
	%u100 = load i32* %c
	%u101 = add i32 %u99, %u100
	%u102 = load i32* %p
	%u103 = sub i32 %u101, %u102
	store i32 %u103, i32* %t
	%u104 = load i32* %n
	%u105 = load i32* %o
	%u106 = add i32 %u104, %u105
	%u107 = load i32* %f
	%u108 = load i32* %a
	%u109 = mul i32 %u107, %u108
	%u110 = sub i32 %u106, %u109
	store i32 %u110, i32* %u
	%u111 = load i32* %a
	%u112 = load i32* %b
	%u113 = mul i32 %u111, %u112
	%u114 = load i32* %k
	%u115 = sub i32 %u113, %u114
	%u116 = load i32* %l
	%u117 = sub i32 %u115, %u116
	store i32 %u117, i32* %v
	%u118 = load i32* %v
	%u119 = load i32* %s
	%u120 = sub i32 %u118, %u119
	%u121 = load i32* %r
	%u122 = load i32* %d
	%u123 = mul i32 %u121, %u122
	%u124 = sub i32 %u120, %u123
	store i32 %u124, i32* %w
	%u125 = load i32* %o
	%u126 = load i32* %w
	%u127 = sub i32 %u125, %u126
	%u128 = load i32* %v
	%u129 = sub i32 %u127, %u128
	%u130 = load i32* %n
	%u131 = sub i32 %u129, %u130
	store i32 %u131, i32* %x
	%u132 = load i32* %p
	%u133 = load i32* %x
	%u134 = mul i32 %u132, %u133
	%u135 = load i32* %t
	%u136 = add i32 %u134, %u135
	%u137 = load i32* %w
	%u138 = sub i32 %u136, %u137
	store i32 %u138, i32* %y
	%u139 = load i32* %w
	%u140 = load i32* %x
	%u141 = sub i32 %u139, %u140
	%u142 = load i32* %y
	%u143 = add i32 %u141, %u142
	%u144 = load i32* %k
	%u145 = add i32 %u143, %u144
	store i32 %u145, i32* %z
	%u146 = load i32* %z
	store i32 %u146, i32* %_retval_
	br label %LU2
LU2:
	%u147 = load i32* %_retval_
	ret i32 %u147
}

define i32 @deadCodeElimination()
{
LU5:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	store i32 4, i32* %a
	store i32 5, i32* %a
	store i32 7, i32* %a
	store i32 8, i32* %a
	store i32 6, i32* %b
	store i32 9, i32* %b
	store i32 12, i32* %b
	store i32 8, i32* %b
	store i32 10, i32* %c
	store i32 13, i32* %c
	store i32 9, i32* %c
	store i32 45, i32* %d
	store i32 12, i32* %d
	store i32 3, i32* %d
	store i32 23, i32* %e
	store i32 10, i32* %e
	store i32 11, i32* @global1
	store i32 5, i32* @global1
	store i32 9, i32* @global1
	%u148 = load i32* %a
	%u149 = load i32* %b
	%u150 = add i32 %u148, %u149
	%u151 = load i32* %c
	%u152 = add i32 %u150, %u151
	%u153 = load i32* %d
	%u154 = add i32 %u152, %u153
	%u155 = load i32* %e
	%u156 = add i32 %u154, %u155
	store i32 %u156, i32* %_retval_
	br label %LU4
LU4:
	%u157 = load i32* %_retval_
	ret i32 %u157
}

define i32 @sum(i32 %_P_number)
{
LU7:
	%_retval_ = alloca i32
	%total = alloca i32
	%number = alloca i32
	store i32 %_P_number, i32* %number
	store i32 0, i32* %total
	%u158 = load i32* %number
	%u159 = icmp sgt i32 %u158, 0
	%u160 = zext i1 %u159 to i32
	%u161 = trunc i32 %u160 to i1
	br i1 %u161, label %LU8, label %LU9
LU8:
	%u162 = load i32* %total
	%u163 = load i32* %number
	%u164 = add i32 %u162, %u163
	store i32 %u164, i32* %total
	%u165 = load i32* %number
	%u166 = sub i32 %u165, 1
	store i32 %u166, i32* %number
	%u167 = load i32* %number
	%u168 = icmp sgt i32 %u167, 0
	%u169 = zext i1 %u168 to i32
	%u170 = trunc i32 %u169 to i1
	br i1 %u170, label %LU8, label %LU9
LU9:
	%u171 = load i32* %total
	store i32 %u171, i32* %_retval_
	br label %LU6
LU6:
	%u172 = load i32* %_retval_
	ret i32 %u172
}

define i32 @doesntModifyGlobals()
{
LU11:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	store i32 1, i32* %a
	store i32 2, i32* %b
	%u173 = load i32* %a
	%u174 = load i32* %b
	%u175 = add i32 %u173, %u174
	store i32 %u175, i32* %_retval_
	br label %LU10
LU10:
	%u176 = load i32* %_retval_
	ret i32 %u176
}

define i32 @interProceduralOptimization()
{
LU13:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 1, i32* @global1
	store i32 0, i32* @global2
	store i32 0, i32* @global3
	%u177 = call i32 @sum(i32 100)
	store i32 %u177, i32* %a
	%u178 = load i32* @global1
	%u179 = icmp eq i32 %u178, 1
	%u180 = zext i1 %u179 to i32
	%u181 = trunc i32 %u180 to i1
	br i1 %u181, label %LU14, label %LU15
LU14:
	%u182 = call i32 @sum(i32 10000)
	store i32 %u182, i32* %a
	br label %LU16
LU15:
	%u183 = load i32* @global2
	%u184 = icmp eq i32 %u183, 2
	%u185 = zext i1 %u184 to i32
	%u186 = trunc i32 %u185 to i1
	br i1 %u186, label %LU17, label %LU18
LU16:
	%u193 = load i32* %a
	store i32 %u193, i32* %_retval_
	br label %LU12
LU12:
	%u194 = load i32* %_retval_
	ret i32 %u194
LU17:
	%u187 = call i32 @sum(i32 20000)
	store i32 %u187, i32* %a
	br label %LU19
LU18:
	br label %LU19
LU19:
	%u188 = load i32* @global3
	%u189 = icmp eq i32 %u188, 3
	%u190 = zext i1 %u189 to i32
	%u191 = trunc i32 %u190 to i1
	br i1 %u191, label %LU20, label %LU21
LU20:
	%u192 = call i32 @sum(i32 30000)
	store i32 %u192, i32* %a
	br label %LU22
LU21:
	br label %LU22
LU22:
	br label %LU16
}

define i32 @commonSubexpressionElimination()
{
LU24:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%f = alloca i32
	%g = alloca i32
	%h = alloca i32
	%i = alloca i32
	%j = alloca i32
	%k = alloca i32
	%l = alloca i32
	%m = alloca i32
	%n = alloca i32
	%o = alloca i32
	%p = alloca i32
	%q = alloca i32
	%r = alloca i32
	%s = alloca i32
	%t = alloca i32
	%u = alloca i32
	%v = alloca i32
	%w = alloca i32
	%x = alloca i32
	%y = alloca i32
	%z = alloca i32
	store i32 11, i32* %a
	store i32 22, i32* %b
	store i32 33, i32* %c
	store i32 44, i32* %d
	store i32 55, i32* %e
	store i32 66, i32* %f
	store i32 77, i32* %g
	%u195 = load i32* %a
	%u196 = load i32* %b
	%u197 = mul i32 %u195, %u196
	store i32 %u197, i32* %h
	%u198 = load i32* %c
	%u199 = load i32* %d
	%u200 = sdiv i32 %u198, %u199
	store i32 %u200, i32* %i
	%u201 = load i32* %e
	%u202 = load i32* %f
	%u203 = mul i32 %u201, %u202
	store i32 %u203, i32* %j
	%u204 = load i32* %a
	%u205 = load i32* %b
	%u206 = mul i32 %u204, %u205
	%u207 = load i32* %c
	%u208 = load i32* %d
	%u209 = sdiv i32 %u207, %u208
	%u210 = add i32 %u206, %u209
	%u211 = load i32* %e
	%u212 = load i32* %f
	%u213 = mul i32 %u211, %u212
	%u214 = sub i32 %u210, %u213
	%u215 = load i32* %g
	%u216 = add i32 %u214, %u215
	store i32 %u216, i32* %k
	%u217 = load i32* %a
	%u218 = load i32* %b
	%u219 = mul i32 %u217, %u218
	%u220 = load i32* %c
	%u221 = load i32* %d
	%u222 = sdiv i32 %u220, %u221
	%u223 = add i32 %u219, %u222
	%u224 = load i32* %e
	%u225 = load i32* %f
	%u226 = mul i32 %u224, %u225
	%u227 = sub i32 %u223, %u226
	%u228 = load i32* %g
	%u229 = add i32 %u227, %u228
	store i32 %u229, i32* %l
	%u230 = load i32* %a
	%u231 = load i32* %b
	%u232 = mul i32 %u230, %u231
	%u233 = load i32* %c
	%u234 = load i32* %d
	%u235 = sdiv i32 %u233, %u234
	%u236 = add i32 %u232, %u235
	%u237 = load i32* %e
	%u238 = load i32* %f
	%u239 = mul i32 %u237, %u238
	%u240 = sub i32 %u236, %u239
	%u241 = load i32* %g
	%u242 = add i32 %u240, %u241
	store i32 %u242, i32* %m
	%u243 = load i32* %a
	%u244 = load i32* %b
	%u245 = mul i32 %u243, %u244
	%u246 = load i32* %c
	%u247 = load i32* %d
	%u248 = sdiv i32 %u246, %u247
	%u249 = add i32 %u245, %u248
	%u250 = load i32* %e
	%u251 = load i32* %f
	%u252 = mul i32 %u250, %u251
	%u253 = sub i32 %u249, %u252
	%u254 = load i32* %g
	%u255 = add i32 %u253, %u254
	store i32 %u255, i32* %n
	%u256 = load i32* %a
	%u257 = load i32* %b
	%u258 = mul i32 %u256, %u257
	%u259 = load i32* %c
	%u260 = load i32* %d
	%u261 = sdiv i32 %u259, %u260
	%u262 = add i32 %u258, %u261
	%u263 = load i32* %e
	%u264 = load i32* %f
	%u265 = mul i32 %u263, %u264
	%u266 = sub i32 %u262, %u265
	%u267 = load i32* %g
	%u268 = add i32 %u266, %u267
	store i32 %u268, i32* %o
	%u269 = load i32* %a
	%u270 = load i32* %b
	%u271 = mul i32 %u269, %u270
	%u272 = load i32* %c
	%u273 = load i32* %d
	%u274 = sdiv i32 %u272, %u273
	%u275 = add i32 %u271, %u274
	%u276 = load i32* %e
	%u277 = load i32* %f
	%u278 = mul i32 %u276, %u277
	%u279 = sub i32 %u275, %u278
	%u280 = load i32* %g
	%u281 = add i32 %u279, %u280
	store i32 %u281, i32* %p
	%u282 = load i32* %a
	%u283 = load i32* %b
	%u284 = mul i32 %u282, %u283
	%u285 = load i32* %c
	%u286 = load i32* %d
	%u287 = sdiv i32 %u285, %u286
	%u288 = add i32 %u284, %u287
	%u289 = load i32* %e
	%u290 = load i32* %f
	%u291 = mul i32 %u289, %u290
	%u292 = sub i32 %u288, %u291
	%u293 = load i32* %g
	%u294 = add i32 %u292, %u293
	store i32 %u294, i32* %q
	%u295 = load i32* %a
	%u296 = load i32* %b
	%u297 = mul i32 %u295, %u296
	%u298 = load i32* %c
	%u299 = load i32* %d
	%u300 = sdiv i32 %u298, %u299
	%u301 = add i32 %u297, %u300
	%u302 = load i32* %e
	%u303 = load i32* %f
	%u304 = mul i32 %u302, %u303
	%u305 = sub i32 %u301, %u304
	%u306 = load i32* %g
	%u307 = add i32 %u305, %u306
	store i32 %u307, i32* %r
	%u308 = load i32* %a
	%u309 = load i32* %b
	%u310 = mul i32 %u308, %u309
	%u311 = load i32* %c
	%u312 = load i32* %d
	%u313 = sdiv i32 %u311, %u312
	%u314 = add i32 %u310, %u313
	%u315 = load i32* %e
	%u316 = load i32* %f
	%u317 = mul i32 %u315, %u316
	%u318 = sub i32 %u314, %u317
	%u319 = load i32* %g
	%u320 = add i32 %u318, %u319
	store i32 %u320, i32* %s
	%u321 = load i32* %a
	%u322 = load i32* %b
	%u323 = mul i32 %u321, %u322
	%u324 = load i32* %c
	%u325 = load i32* %d
	%u326 = sdiv i32 %u324, %u325
	%u327 = add i32 %u323, %u326
	%u328 = load i32* %e
	%u329 = load i32* %f
	%u330 = mul i32 %u328, %u329
	%u331 = sub i32 %u327, %u330
	%u332 = load i32* %g
	%u333 = add i32 %u331, %u332
	store i32 %u333, i32* %t
	%u334 = load i32* %a
	%u335 = load i32* %b
	%u336 = mul i32 %u334, %u335
	%u337 = load i32* %c
	%u338 = load i32* %d
	%u339 = sdiv i32 %u337, %u338
	%u340 = add i32 %u336, %u339
	%u341 = load i32* %e
	%u342 = load i32* %f
	%u343 = mul i32 %u341, %u342
	%u344 = sub i32 %u340, %u343
	%u345 = load i32* %g
	%u346 = add i32 %u344, %u345
	store i32 %u346, i32* %u
	%u347 = load i32* %b
	%u348 = load i32* %a
	%u349 = mul i32 %u347, %u348
	%u350 = load i32* %c
	%u351 = load i32* %d
	%u352 = sdiv i32 %u350, %u351
	%u353 = add i32 %u349, %u352
	%u354 = load i32* %e
	%u355 = load i32* %f
	%u356 = mul i32 %u354, %u355
	%u357 = sub i32 %u353, %u356
	%u358 = load i32* %g
	%u359 = add i32 %u357, %u358
	store i32 %u359, i32* %v
	%u360 = load i32* %a
	%u361 = load i32* %b
	%u362 = mul i32 %u360, %u361
	%u363 = load i32* %c
	%u364 = load i32* %d
	%u365 = sdiv i32 %u363, %u364
	%u366 = add i32 %u362, %u365
	%u367 = load i32* %f
	%u368 = load i32* %e
	%u369 = mul i32 %u367, %u368
	%u370 = sub i32 %u366, %u369
	%u371 = load i32* %g
	%u372 = add i32 %u370, %u371
	store i32 %u372, i32* %w
	%u373 = load i32* %g
	%u374 = load i32* %a
	%u375 = load i32* %b
	%u376 = mul i32 %u374, %u375
	%u377 = add i32 %u373, %u376
	%u378 = load i32* %c
	%u379 = load i32* %d
	%u380 = sdiv i32 %u378, %u379
	%u381 = add i32 %u377, %u380
	%u382 = load i32* %e
	%u383 = load i32* %f
	%u384 = mul i32 %u382, %u383
	%u385 = sub i32 %u381, %u384
	store i32 %u385, i32* %x
	%u386 = load i32* %a
	%u387 = load i32* %b
	%u388 = mul i32 %u386, %u387
	%u389 = load i32* %c
	%u390 = load i32* %d
	%u391 = sdiv i32 %u389, %u390
	%u392 = add i32 %u388, %u391
	%u393 = load i32* %e
	%u394 = load i32* %f
	%u395 = mul i32 %u393, %u394
	%u396 = sub i32 %u392, %u395
	%u397 = load i32* %g
	%u398 = add i32 %u396, %u397
	store i32 %u398, i32* %y
	%u399 = load i32* %c
	%u400 = load i32* %d
	%u401 = sdiv i32 %u399, %u400
	%u402 = load i32* %a
	%u403 = load i32* %b
	%u404 = mul i32 %u402, %u403
	%u405 = add i32 %u401, %u404
	%u406 = load i32* %e
	%u407 = load i32* %f
	%u408 = mul i32 %u406, %u407
	%u409 = sub i32 %u405, %u408
	%u410 = load i32* %g
	%u411 = add i32 %u409, %u410
	store i32 %u411, i32* %z
	%u412 = load i32* %a
	%u413 = load i32* %b
	%u414 = add i32 %u412, %u413
	%u415 = load i32* %c
	%u416 = add i32 %u414, %u415
	%u417 = load i32* %d
	%u418 = add i32 %u416, %u417
	%u419 = load i32* %e
	%u420 = add i32 %u418, %u419
	%u421 = load i32* %f
	%u422 = add i32 %u420, %u421
	%u423 = load i32* %g
	%u424 = add i32 %u422, %u423
	%u425 = load i32* %h
	%u426 = add i32 %u424, %u425
	%u427 = load i32* %i
	%u428 = add i32 %u426, %u427
	%u429 = load i32* %j
	%u430 = add i32 %u428, %u429
	%u431 = load i32* %k
	%u432 = add i32 %u430, %u431
	%u433 = load i32* %l
	%u434 = add i32 %u432, %u433
	%u435 = load i32* %m
	%u436 = add i32 %u434, %u435
	%u437 = load i32* %n
	%u438 = add i32 %u436, %u437
	%u439 = load i32* %o
	%u440 = add i32 %u438, %u439
	%u441 = load i32* %p
	%u442 = add i32 %u440, %u441
	%u443 = load i32* %q
	%u444 = add i32 %u442, %u443
	%u445 = load i32* %r
	%u446 = add i32 %u444, %u445
	%u447 = load i32* %s
	%u448 = add i32 %u446, %u447
	%u449 = load i32* %t
	%u450 = add i32 %u448, %u449
	%u451 = load i32* %u
	%u452 = add i32 %u450, %u451
	%u453 = load i32* %v
	%u454 = add i32 %u452, %u453
	%u455 = load i32* %w
	%u456 = add i32 %u454, %u455
	%u457 = load i32* %x
	%u458 = add i32 %u456, %u457
	%u459 = load i32* %y
	%u460 = add i32 %u458, %u459
	%u461 = load i32* %z
	%u462 = add i32 %u460, %u461
	store i32 %u462, i32* %_retval_
	br label %LU23
LU23:
	%u463 = load i32* %_retval_
	ret i32 %u463
}

define i32 @hoisting()
{
LU26:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%f = alloca i32
	%g = alloca i32
	%h = alloca i32
	%i = alloca i32
	store i32 1, i32* %a
	store i32 2, i32* %b
	store i32 3, i32* %c
	store i32 4, i32* %d
	store i32 0, i32* %i
	%u464 = load i32* %i
	%u465 = icmp slt i32 %u464, 1000000
	%u466 = zext i1 %u465 to i32
	%u467 = trunc i32 %u466 to i1
	br i1 %u467, label %LU27, label %LU28
LU27:
	store i32 5, i32* %e
	%u468 = load i32* %a
	%u469 = load i32* %b
	%u470 = add i32 %u468, %u469
	%u471 = load i32* %c
	%u472 = add i32 %u470, %u471
	store i32 %u472, i32* %g
	%u473 = load i32* %c
	%u474 = load i32* %d
	%u475 = add i32 %u473, %u474
	%u476 = load i32* %g
	%u477 = add i32 %u475, %u476
	store i32 %u477, i32* %h
	%u478 = load i32* %i
	%u479 = add i32 %u478, 1
	store i32 %u479, i32* %i
	%u480 = load i32* %i
	%u481 = icmp slt i32 %u480, 1000000
	%u482 = zext i1 %u481 to i32
	%u483 = trunc i32 %u482 to i1
	br i1 %u483, label %LU27, label %LU28
LU28:
	%u484 = load i32* %b
	store i32 %u484, i32* %_retval_
	br label %LU25
LU25:
	%u485 = load i32* %_retval_
	ret i32 %u485
}

define i32 @doubleIf()
{
LU30:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	store i32 1, i32* %a
	store i32 2, i32* %b
	store i32 3, i32* %c
	store i32 0, i32* %d
	%u486 = load i32* %a
	%u487 = icmp eq i32 %u486, 1
	%u488 = zext i1 %u487 to i32
	%u489 = trunc i32 %u488 to i1
	br i1 %u489, label %LU31, label %LU32
LU31:
	store i32 20, i32* %b
	%u490 = load i32* %a
	%u491 = icmp eq i32 %u490, 1
	%u492 = zext i1 %u491 to i32
	%u493 = trunc i32 %u492 to i1
	br i1 %u493, label %LU34, label %LU35
LU32:
	br label %LU33
LU34:
	store i32 200, i32* %b
	store i32 300, i32* %c
	br label %LU36
LU35:
	store i32 1, i32* %a
	store i32 2, i32* %b
	store i32 3, i32* %c
	br label %LU36
LU36:
	store i32 50, i32* %d
	br label %LU33
LU33:
	%u494 = load i32* %d
	store i32 %u494, i32* %_retval_
	br label %LU29
LU29:
	%u495 = load i32* %_retval_
	ret i32 %u495
}

define i32 @integerDivide()
{
LU38:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 3000, i32* %a
	%u496 = load i32* %a
	%u497 = sdiv i32 %u496, 2
	store i32 %u497, i32* %a
	%u498 = load i32* %a
	%u499 = mul i32 %u498, 4
	store i32 %u499, i32* %a
	%u500 = load i32* %a
	%u501 = sdiv i32 %u500, 8
	store i32 %u501, i32* %a
	%u502 = load i32* %a
	%u503 = sdiv i32 %u502, 16
	store i32 %u503, i32* %a
	%u504 = load i32* %a
	%u505 = mul i32 %u504, 32
	store i32 %u505, i32* %a
	%u506 = load i32* %a
	%u507 = sdiv i32 %u506, 64
	store i32 %u507, i32* %a
	%u508 = load i32* %a
	%u509 = mul i32 %u508, 128
	store i32 %u509, i32* %a
	%u510 = load i32* %a
	%u511 = sdiv i32 %u510, 4
	store i32 %u511, i32* %a
	%u512 = load i32* %a
	store i32 %u512, i32* %_retval_
	br label %LU37
LU37:
	%u513 = load i32* %_retval_
	ret i32 %u513
}

define i32 @association()
{
LU40:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 10, i32* %a
	%u514 = load i32* %a
	%u515 = mul i32 %u514, 2
	store i32 %u515, i32* %a
	%u516 = load i32* %a
	%u517 = sdiv i32 %u516, 2
	store i32 %u517, i32* %a
	%u518 = load i32* %a
	%u519 = mul i32 3, %u518
	store i32 %u519, i32* %a
	%u520 = load i32* %a
	%u521 = sdiv i32 %u520, 3
	store i32 %u521, i32* %a
	%u522 = load i32* %a
	%u523 = mul i32 %u522, 4
	store i32 %u523, i32* %a
	%u524 = load i32* %a
	%u525 = sdiv i32 %u524, 4
	store i32 %u525, i32* %a
	%u526 = load i32* %a
	%u527 = add i32 %u526, 4
	store i32 %u527, i32* %a
	%u528 = load i32* %a
	%u529 = sub i32 %u528, 4
	store i32 %u529, i32* %a
	%u530 = load i32* %a
	%u531 = mul i32 %u530, 50
	store i32 %u531, i32* %a
	%u532 = load i32* %a
	%u533 = sdiv i32 %u532, 50
	store i32 %u533, i32* %a
	%u534 = load i32* %a
	store i32 %u534, i32* %_retval_
	br label %LU39
LU39:
	%u535 = load i32* %_retval_
	ret i32 %u535
}

define i32 @tailRecursionHelper(i32 %_P_value, i32 %_P_sum)
{
LU42:
	%_retval_ = alloca i32
	%value = alloca i32
	store i32 %_P_value, i32* %value
	%sum = alloca i32
	store i32 %_P_sum, i32* %sum
	%u536 = load i32* %value
	%u537 = icmp eq i32 %u536, 0
	%u538 = zext i1 %u537 to i32
	%u539 = trunc i32 %u538 to i1
	br i1 %u539, label %LU43, label %LU44
LU43:
	%u540 = load i32* %sum
	store i32 %u540, i32* %_retval_
	br label %LU41
LU44:
	%u542 = load i32* %value
	%u543 = sub i32 %u542, 1
	%u544 = load i32* %sum
	%u545 = load i32* %value
	%u546 = add i32 %u544, %u545
	%u541 = call i32 @tailRecursionHelper(i32 %u543, i32 %u546)
	store i32 %u541, i32* %_retval_
	br label %LU41
LU41:
	%u547 = load i32* %_retval_
	ret i32 %u547
LU45:
	br label %LU41
}

define i32 @tailRecursion(i32 %_P_value)
{
LU47:
	%_retval_ = alloca i32
	%value = alloca i32
	store i32 %_P_value, i32* %value
	%u549 = load i32* %value
	%u548 = call i32 @tailRecursionHelper(i32 %u549, i32 0)
	store i32 %u548, i32* %_retval_
	br label %LU46
LU46:
	%u550 = load i32* %_retval_
	ret i32 %u550
}

define i32 @unswitching()
{
LU49:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	store i32 1, i32* %a
	store i32 2, i32* %b
	%u551 = load i32* %a
	%u552 = icmp slt i32 %u551, 1000000
	%u553 = zext i1 %u552 to i32
	%u554 = trunc i32 %u553 to i1
	br i1 %u554, label %LU50, label %LU51
LU50:
	%u555 = load i32* %b
	%u556 = icmp eq i32 %u555, 2
	%u557 = zext i1 %u556 to i32
	%u558 = trunc i32 %u557 to i1
	br i1 %u558, label %LU52, label %LU53
LU51:
	%u567 = load i32* %a
	store i32 %u567, i32* %_retval_
	br label %LU48
LU52:
	%u559 = load i32* %a
	%u560 = add i32 %u559, 1
	store i32 %u560, i32* %a
	br label %LU54
LU53:
	%u561 = load i32* %a
	%u562 = add i32 %u561, 2
	store i32 %u562, i32* %a
	br label %LU54
LU54:
	%u563 = load i32* %a
	%u564 = icmp slt i32 %u563, 1000000
	%u565 = zext i1 %u564 to i32
	%u566 = trunc i32 %u565 to i1
	br i1 %u566, label %LU50, label %LU51
LU48:
	%u568 = load i32* %_retval_
	ret i32 %u568
}

define i32 @randomCalculation(i32 %_P_number)
{
LU56:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%i = alloca i32
	%sum = alloca i32
	%number = alloca i32
	store i32 %_P_number, i32* %number
	store i32 0, i32* %i
	store i32 0, i32* %sum
	%u569 = load i32* %i
	%u570 = load i32* %number
	%u571 = icmp slt i32 %u569, %u570
	%u572 = zext i1 %u571 to i32
	%u573 = trunc i32 %u572 to i1
	br i1 %u573, label %LU57, label %LU58
LU57:
	store i32 4, i32* %a
	store i32 7, i32* %b
	store i32 8, i32* %c
	%u574 = load i32* %a
	%u575 = load i32* %b
	%u576 = add i32 %u574, %u575
	store i32 %u576, i32* %d
	%u577 = load i32* %d
	%u578 = load i32* %c
	%u579 = add i32 %u577, %u578
	store i32 %u579, i32* %e
	%u580 = load i32* %sum
	%u581 = load i32* %e
	%u582 = add i32 %u580, %u581
	store i32 %u582, i32* %sum
	%u583 = load i32* %i
	%u584 = mul i32 %u583, 2
	store i32 %u584, i32* %i
	%u585 = load i32* %i
	%u586 = sdiv i32 %u585, 2
	store i32 %u586, i32* %i
	%u587 = load i32* %i
	%u588 = mul i32 3, %u587
	store i32 %u588, i32* %i
	%u589 = load i32* %i
	%u590 = sdiv i32 %u589, 3
	store i32 %u590, i32* %i
	%u591 = load i32* %i
	%u592 = mul i32 %u591, 4
	store i32 %u592, i32* %i
	%u593 = load i32* %i
	%u594 = sdiv i32 %u593, 4
	store i32 %u594, i32* %i
	%u595 = load i32* %i
	%u596 = add i32 %u595, 1
	store i32 %u596, i32* %i
	%u597 = load i32* %i
	%u598 = load i32* %number
	%u599 = icmp slt i32 %u597, %u598
	%u600 = zext i1 %u599 to i32
	%u601 = trunc i32 %u600 to i1
	br i1 %u601, label %LU57, label %LU58
LU58:
	%u602 = load i32* %sum
	store i32 %u602, i32* %_retval_
	br label %LU55
LU55:
	%u603 = load i32* %_retval_
	ret i32 %u603
}

define i32 @iterativeFibonacci(i32 %_P_number)
{
LU60:
	%_retval_ = alloca i32
	%previous = alloca i32
	%result = alloca i32
	%count = alloca i32
	%i = alloca i32
	%sum = alloca i32
	%number = alloca i32
	store i32 %_P_number, i32* %number
	%u604 = mul i32 1, -1
	store i32 %u604, i32* %previous
	store i32 1, i32* %result
	store i32 0, i32* %i
	%u605 = load i32* %i
	%u606 = load i32* %number
	%u607 = icmp slt i32 %u605, %u606
	%u608 = zext i1 %u607 to i32
	%u609 = trunc i32 %u608 to i1
	br i1 %u609, label %LU61, label %LU62
LU61:
	%u610 = load i32* %result
	%u611 = load i32* %previous
	%u612 = add i32 %u610, %u611
	store i32 %u612, i32* %sum
	%u613 = load i32* %result
	store i32 %u613, i32* %previous
	%u614 = load i32* %sum
	store i32 %u614, i32* %result
	%u615 = load i32* %i
	%u616 = add i32 %u615, 1
	store i32 %u616, i32* %i
	%u617 = load i32* %i
	%u618 = load i32* %number
	%u619 = icmp slt i32 %u617, %u618
	%u620 = zext i1 %u619 to i32
	%u621 = trunc i32 %u620 to i1
	br i1 %u621, label %LU61, label %LU62
LU62:
	%u622 = load i32* %result
	store i32 %u622, i32* %_retval_
	br label %LU59
LU59:
	%u623 = load i32* %_retval_
	ret i32 %u623
}

define i32 @recursiveFibonacci(i32 %_P_number)
{
LU64:
	%_retval_ = alloca i32
	%number = alloca i32
	store i32 %_P_number, i32* %number
	%u624 = load i32* %number
	%u625 = icmp sle i32 %u624, 0
	%u626 = zext i1 %u625 to i32
	%u627 = load i32* %number
	%u628 = icmp eq i32 %u627, 1
	%u629 = zext i1 %u628 to i32
	%u630 = or i32 %u626, %u629
	%u631 = trunc i32 %u630 to i1
	br i1 %u631, label %LU65, label %LU66
LU65:
	%u632 = load i32* %number
	store i32 %u632, i32* %_retval_
	br label %LU63
LU66:
	%u634 = load i32* %number
	%u635 = sub i32 %u634, 1
	%u633 = call i32 @recursiveFibonacci(i32 %u635)
	%u637 = load i32* %number
	%u638 = sub i32 %u637, 2
	%u636 = call i32 @recursiveFibonacci(i32 %u638)
	%u639 = add i32 %u633, %u636
	store i32 %u639, i32* %_retval_
	br label %LU63
LU63:
	%u640 = load i32* %_retval_
	ret i32 %u640
LU67:
	br label %LU63
}

define i32 @main()
{
LU69:
	%_retval_ = alloca i32
	%input = alloca i32
	%result = alloca i32
	%i = alloca i32
	%u641 = call i32 @read()
	store i32 %u641, i32* %input
	store i32 1, i32* %i
	%u642 = load i32* %i
	%u643 = load i32* %input
	%u644 = icmp slt i32 %u642, %u643
	%u645 = zext i1 %u644 to i32
	%u646 = trunc i32 %u645 to i1
	br i1 %u646, label %LU70, label %LU71
LU70:
	%u647 = call i32 @constantFolding()
	store i32 %u647, i32* %result
	%u648 = load i32* %result
	call void @printf_newline(i32 %u648)
	%u649 = call i32 @constantPropagation()
	store i32 %u649, i32* %result
	%u650 = load i32* %result
	call void @printf_newline(i32 %u650)
	%u651 = call i32 @deadCodeElimination()
	store i32 %u651, i32* %result
	%u652 = load i32* %result
	call void @printf_newline(i32 %u652)
	%u653 = call i32 @interProceduralOptimization()
	store i32 %u653, i32* %result
	%u654 = load i32* %result
	call void @printf_newline(i32 %u654)
	%u655 = call i32 @commonSubexpressionElimination()
	store i32 %u655, i32* %result
	%u656 = load i32* %result
	call void @printf_newline(i32 %u656)
	%u657 = call i32 @hoisting()
	store i32 %u657, i32* %result
	%u658 = load i32* %result
	call void @printf_newline(i32 %u658)
	%u659 = call i32 @doubleIf()
	store i32 %u659, i32* %result
	%u660 = load i32* %result
	call void @printf_newline(i32 %u660)
	%u661 = call i32 @integerDivide()
	store i32 %u661, i32* %result
	%u662 = load i32* %result
	call void @printf_newline(i32 %u662)
	%u663 = call i32 @association()
	store i32 %u663, i32* %result
	%u664 = load i32* %result
	call void @printf_newline(i32 %u664)
	%u666 = load i32* %input
	%u667 = sdiv i32 %u666, 1000
	%u665 = call i32 @tailRecursion(i32 %u667)
	store i32 %u665, i32* %result
	%u668 = load i32* %result
	call void @printf_newline(i32 %u668)
	%u669 = call i32 @unswitching()
	store i32 %u669, i32* %result
	%u670 = load i32* %result
	call void @printf_newline(i32 %u670)
	%u672 = load i32* %input
	%u671 = call i32 @randomCalculation(i32 %u672)
	store i32 %u671, i32* %result
	%u673 = load i32* %result
	call void @printf_newline(i32 %u673)
	%u675 = load i32* %input
	%u676 = sdiv i32 %u675, 5
	%u674 = call i32 @iterativeFibonacci(i32 %u676)
	store i32 %u674, i32* %result
	%u677 = load i32* %result
	call void @printf_newline(i32 %u677)
	%u679 = load i32* %input
	%u680 = sdiv i32 %u679, 1000
	%u678 = call i32 @recursiveFibonacci(i32 %u680)
	store i32 %u678, i32* %result
	%u681 = load i32* %result
	call void @printf_newline(i32 %u681)
	%u682 = load i32* %i
	%u683 = add i32 %u682, 1
	store i32 %u683, i32* %i
	%u684 = load i32* %i
	%u685 = load i32* %input
	%u686 = icmp slt i32 %u684, %u685
	%u687 = zext i1 %u686 to i32
	%u688 = trunc i32 %u687 to i1
	br i1 %u688, label %LU70, label %LU71
LU71:
	call void @printf_newline(i32 9999)
	store i32 0, i32* %_retval_
	br label %LU68
LU68:
	%u689 = load i32* %_retval_
	ret i32 %u689
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
