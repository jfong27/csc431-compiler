target triple="i686"


define void @foo(i32 %num)
{
LU1:
	%u0 = icmp sgt i32 %num, 0
	%u1 = zext i1 %u0 to i32
	%u2 = trunc i32 %u1 to i1
	br i1 %u2, label %LU2, label %LU3
LU2:
	%tmp0 = phi i32 [null, LU1] [1, LU2] [1, LU2] [%tmp0, LU3] [null, LU1] [1, LU2] [1, LU2] [%tmp0, LU3] 
	%num0 = phi i32 [%num, LU1] [%u3, LU2] [%u3, LU2] [%num0, LU3] [%num, LU1] [%u3, LU2] [%u3, LU2] [%num0, LU3] 
	%u3 = sub i32 %num0, 1
	%u4 = load i32* %num
	%u5 = icmp sgt i32 %u4, 0
	%u6 = zext i1 %u5 to i32
	%u7 = trunc i32 %u6 to i1
	br i1 %u7, label %LU2, label %LU3
LU3:
	%tmp0 = phi i32 [null, LU1] [1, LU2] 
	%num0 = phi i32 [%num, LU1] [%u3, LU2] 
	br label %LU0
LU0:
	ret void
}

define void @main()
{
LU5:
	br label %LU4
LU4:
	ret void
}

declare i8* @malloc(i32)
declare void @printf_int(i32 %x)
declare void @printf_newline(i32 %x)
declare void @free(i8* %x)
declare i32 @read()
