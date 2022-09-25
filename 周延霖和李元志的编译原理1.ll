; ModuleID = 'test.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@globalX = common global i32 0, align 4
; @globalX = common global float 0.000000e+00, align 4
@globalY = common global float 0.000000e+00, align 4
; @globalZ = common global 0, align 4
@globalArr = common global [3 x i32] zeroinitializer, align 4
@globalPoint = common global i32* null, align 8

; Function Attrs: nounwind uwtable
define void @emptyFunction() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
; define void @emptyFunction(i32 %a) #0 {
;   ret void
; }

; Function Attrs: nounwind uwtable
define void @setValue() #0 {
  store i32 0, i32* @globalX, align 4
  store float 0.000000e+00, float* @globalY, align 4
  store i32 0, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @globalArr, i64 0, i64 0), align 4
  store i32* null, i32** @globalPoint, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @Distance(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp sgt i32 %3, %4
  br i1 %5, label %6, label %10

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %1, align 4
  %8 = load i32, i32* %2, align 4
  %9 = sub nsw i32 %7, %8
  store i32 %9, i32* %res, align 4
  br label %14

; <label>:10                                      ; preds = %0
  %11 = load i32, i32* %2, align 4
  %12 = load i32, i32* %1, align 4
  %13 = sub nsw i32 %11, %12
  store i32 %13, i32* %res, align 4
  br label %14

; <label>:14                                      ; preds = %10, %6
  %15 = load i32, i32* %res, align 4
;  store i32 %c, i32* %16, align 4
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca float, align 4
  %d = alloca float, align 4
  %i = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 1, i32* %a, align 4
  store i32 5, i32* %b, align 4
  store float 9.000000e+00, float* %c, align 4
  store float 1.000000e+01, float* %d, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %22, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %24

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %a, align 4
  %7 = load i32, i32* %b, align 4
  %8 = add nsw i32 %6, %7
  store i32 %8, i32* %a, align 4
  %9 = load float, float* %c, align 4
  %10 = load float, float* %d, align 4
  %11 = fmul float %9, %10
  store float %11, float* %c, align 4
  %12 = load i32, i32* %a, align 4
  %13 = load i32, i32* %b, align 4
  %14 = sub nsw i32 %12, %13
  store i32 %14, i32* %a, align 4
  %15 = load float, float* %c, align 4
  %16 = load float, float* %d, align 4
  %17 = fdiv float %15, %16
  store float %17, float* %c, align 4
  %18 = load i32, i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  %20 = load i32, i32* %a, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %5
  br label %2

; <label>:23                                      ; preds = %5
  br label %24

; <label>:24                                      ; preds = %23, %2
  %25 = load i32, i32* %a, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %30

; <label>:27                                      ; preds = %24
  %28 = load i32, i32* %a, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %a, align 4
  br label %33

; <label>:30                                      ; preds = %24
  %31 = load i32, i32* %a, align 4
  %32 = sub nsw i32 %31, 1
  store i32 %32, i32* %a, align 4
  br label %33

; <label>:33                                      ; preds = %30, %27
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 1)
  %35 = load i32, i32* %a, align 4
  %36 = load i32, i32* %b, align 4
  %37 = call i32 @Distance(i32 %35, i32 %36)
  store i32 %37, i32* %res, align 4
  ret i32 0
}

declare i32 @printf(i8*, ...) #1
declare i32 @sum(i32 %a, i32 %b) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
