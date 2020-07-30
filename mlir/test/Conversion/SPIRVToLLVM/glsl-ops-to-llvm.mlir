// RUN: mlir-opt -convert-spirv-to-llvm %s | FileCheck %s

//===----------------------------------------------------------------------===//
// spv.GLSL.Ceil
//===----------------------------------------------------------------------===//

// CHECK-LABEL: @ceil
func @ceil(%arg0: f32, %arg1: vector<3xf16>) {
	// CHECK: "llvm.intr.ceil"(%{{.*}}) : (!llvm.float) -> !llvm.float
	%0 = spv.GLSL.Ceil %arg0 : f32
	// CHECK: "llvm.intr.ceil"(%{{.*}}) : (!llvm<"<3 x half>">) -> !llvm<"<3 x half>">
	%1 = spv.GLSL.Ceil %arg1 : vector<3xf16>
	return
}

//===----------------------------------------------------------------------===//
// spv.GLSL.Cos
//===----------------------------------------------------------------------===//

// CHECK-LABEL: @cos
func @cos(%arg0: f32, %arg1: vector<3xf16>) {
	// CHECK: "llvm.intr.cos"(%{{.*}}) : (!llvm.float) -> !llvm.float
	%0 = spv.GLSL.Cos %arg0 : f32
	// CHECK: "llvm.intr.cos"(%{{.*}}) : (!llvm<"<3 x half>">) -> !llvm<"<3 x half>">
	%1 = spv.GLSL.Cos %arg1 : vector<3xf16>
	return
}

//===----------------------------------------------------------------------===//
// spv.GLSL.Exp
//===----------------------------------------------------------------------===//

// CHECK-LABEL: @exp
func @exp(%arg0: f32, %arg1: vector<3xf16>) {
	// CHECK: "llvm.intr.exp"(%{{.*}}) : (!llvm.float) -> !llvm.float
	%0 = spv.GLSL.Exp %arg0 : f32
	// CHECK: "llvm.intr.exp"(%{{.*}}) : (!llvm<"<3 x half>">) -> !llvm<"<3 x half>">
	%1 = spv.GLSL.Exp %arg1 : vector<3xf16>
	return
}

//===----------------------------------------------------------------------===//
// spv.GLSL.FAbs
//===----------------------------------------------------------------------===//

// CHECK-LABEL: @fabs
func @fabs(%arg0: f32, %arg1: vector<3xf16>) {
	// CHECK: "llvm.intr.fabs"(%{{.*}}) : (!llvm.float) -> !llvm.float
	%0 = spv.GLSL.FAbs %arg0 : f32
	// CHECK: "llvm.intr.fabs"(%{{.*}}) : (!llvm<"<3 x half>">) -> !llvm<"<3 x half>">
	%1 = spv.GLSL.FAbs %arg1 : vector<3xf16>
	return
}

//===----------------------------------------------------------------------===//
// spv.GLSL.Log
//===----------------------------------------------------------------------===//

// CHECK-LABEL: @log
func @log(%arg0: f32, %arg1: vector<3xf16>) {
	// CHECK: "llvm.intr.log"(%{{.*}}) : (!llvm.float) -> !llvm.float
	%0 = spv.GLSL.Log %arg0 : f32
	// CHECK: "llvm.intr.log"(%{{.*}}) : (!llvm<"<3 x half>">) -> !llvm<"<3 x half>">
	%1 = spv.GLSL.Log %arg1 : vector<3xf16>
	return
}

//===----------------------------------------------------------------------===//
// spv.GLSL.Sin
//===----------------------------------------------------------------------===//

// CHECK-LABEL: @sin
func @sin(%arg0: f32, %arg1: vector<3xf16>) {
	// CHECK: "llvm.intr.sin"(%{{.*}}) : (!llvm.float) -> !llvm.float
	%0 = spv.GLSL.Sin %arg0 : f32
	// CHECK: "llvm.intr.sin"(%{{.*}}) : (!llvm<"<3 x half>">) -> !llvm<"<3 x half>">
	%1 = spv.GLSL.Sin %arg1 : vector<3xf16>
	return
}

//===----------------------------------------------------------------------===//
// spv.GLSL.Sqrt
//===----------------------------------------------------------------------===//

// CHECK-LABEL: @sqrt
func @sqrt(%arg0: f32, %arg1: vector<3xf16>) {
	// CHECK: "llvm.intr.sqrt"(%{{.*}}) : (!llvm.float) -> !llvm.float
	%0 = spv.GLSL.Sqrt %arg0 : f32
	// CHECK: "llvm.intr.sqrt"(%{{.*}}) : (!llvm<"<3 x half>">) -> !llvm<"<3 x half>">
	%1 = spv.GLSL.Sqrt %arg1 : vector<3xf16>
	return
}

//===----------------------------------------------------------------------===//
// spv.GLSL.Tan
//===----------------------------------------------------------------------===//

// CHECK-LABEL: @tan
func @tan(%arg0: f32) {
	// CHECK: %[[SIN:.*]] = "llvm.intr.sin"(%{{.*}}) : (!llvm.float) -> !llvm.float
  // CHECK: %[[COS:.*]] = "llvm.intr.cos"(%{{.*}}) : (!llvm.float) -> !llvm.float
	// CHECK: llvm.fdiv %[[SIN]], %[[COS]] : !llvm.float
	%0 = spv.GLSL.Tan %arg0 : f32
	return
}

//===----------------------------------------------------------------------===//
// spv.GLSL.Tanh
//===----------------------------------------------------------------------===//

// CHECK-LABEL: @tanh
func @tanh(%arg0: f32) {
	// CHECK: %[[TWO:.*]] = llvm.mlir.constant(2.000000e+00 : f32) : !llvm.float
  // CHECK: %[[X2:.*]] = llvm.fmul %[[TWO]], %{{.*}} : !llvm.float
  // CHECK: %[[EXP:.*]] = "llvm.intr.exp"(%[[X2]]) : (!llvm.float) -> !llvm.float
  // CHECK: %[[ONE:.*]] = llvm.mlir.constant(1.000000e+00 : f32) : !llvm.float
  // CHECK: %[[T0:.*]] = llvm.fsub %[[EXP]], %[[ONE]] : !llvm.float
  // CHECK: %[[T1:.*]] = llvm.fadd %[[EXP]], %[[ONE]] : !llvm.float
  // CHECK: llvm.fdiv %[[T0]], %[[T1]] : !llvm.float
	%0 = spv.GLSL.Tanh %arg0 : f32
	return
}

//===----------------------------------------------------------------------===//
// spv.GLSL.InverseSqrt
//===----------------------------------------------------------------------===//

// CHECK-LABEL: @inverse_sqrt
func @inverse_sqrt(%arg0: f32) {
	// CHECK: %[[ONE:.*]] = llvm.mlir.constant(1.000000e+00 : f32) : !llvm.float
  // CHECK: %[[SQRT:.*]] = "llvm.intr.sqrt"(%{{.*}}) : (!llvm.float) -> !llvm.float
	// CHECK: llvm.fdiv %[[ONE]], %[[SQRT]] : !llvm.float
	%0 = spv.GLSL.InverseSqrt %arg0 : f32
	return
}
