//
//  glm-to-swift.h
//  swift3D
//
//  Created by Adrian Krupa on 01.11.2015.
//  Copyright © 2015 Adrian Krupa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <simd/simd.h>

@interface glm_to_swift : NSObject

+ (BOOL) fractFloat: (float) f withFractedFloat: (float) fractedF;
+ (BOOL) fractDouble: (double) f withFractedDouble: (double) fractedF;

+ (BOOL) roundFloat2: (vector_float2) v withRoundedFloat2: (vector_float2) roundedV;
+ (BOOL) roundFloat3: (vector_float3) v withRoundedFloat3: (vector_float3) roundedV;
+ (BOOL) roundFloat4: (vector_float4) v withRoundedFloat4: (vector_float4) roundedV;
+ (BOOL) roundDouble2: (vector_double2) v withRoundedDouble2: (vector_double2) roundedV;
+ (BOOL) roundDouble3: (vector_double3) v withRoundedDouble3: (vector_double3) roundedV;
+ (BOOL) roundDouble4: (vector_double4) v withRoundedDouble4: (vector_double4) roundedV;

+ (BOOL) roundEvenFloat: (float) f withRoundedFloat: (float) roundedF;
+ (BOOL) roundEvenFloat2: (vector_float2) f withRoundedFloat2: (vector_float2) roundedF;
+ (BOOL) roundEvenFloat3: (vector_float3) f withRoundedFloat3: (vector_float3) roundedF;
+ (BOOL) roundEvenFloat4: (vector_float4) f withRoundedFloat4: (vector_float4) roundedF;
+ (BOOL) roundEvenDouble: (double) f withRoundedDouble: (double) roundedF;
+ (BOOL) roundEvenDouble2: (vector_double2) f withRoundedDouble2: (vector_double2) roundedF;
+ (BOOL) roundEvenDouble3: (vector_double3) f withRoundedDouble3: (vector_double3) roundedF;
+ (BOOL) roundEvenDouble4: (vector_double4) f withRoundedDouble4: (vector_double4) roundedF;

+ (BOOL) modFloatX: (float) x andFloatY: (float) y withModdedFloat:(float) moddedF;
+ (BOOL) modFloat2X: (vector_float2) x andFloatY: (float) y withModdedFloat:(vector_float2) moddedF;
+ (BOOL) modFloat3X: (vector_float3) x andFloatY: (float) y withModdedFloat:(vector_float3) moddedF;
+ (BOOL) modFloat4X: (vector_float4) x andFloatY: (float) y withModdedFloat:(vector_float4) moddedF;
+ (BOOL) modFloat2X: (vector_float2) x andFloat2Y: (vector_float2) y withModdedFloat2:(vector_float2) moddedF;
+ (BOOL) modFloat3X: (vector_float3) x andFloat3Y: (vector_float3) y withModdedFloat3:(vector_float3) moddedF;
+ (BOOL) modFloat4X: (vector_float4) x andFloat4Y: (vector_float4) y withModdedFloat4:(vector_float4) moddedF;

+ (BOOL) modDoubleX: (double) x andDoubleY: (double) y withModdedDouble:(double) moddedF;
+ (BOOL) modDouble2X: (vector_double2) x andDoubleY: (double) y withModdedDouble:(vector_double2) moddedF;
+ (BOOL) modDouble3X: (vector_double3) x andDoubleY: (double) y withModdedDouble:(vector_double3) moddedF;
+ (BOOL) modDouble4X: (vector_double4) x andDoubleY: (double) y withModdedDouble:(vector_double4) moddedF;
+ (BOOL) modDouble2X: (vector_double2) x andDouble2Y: (vector_double2) y withModdedDouble2:(vector_double2) moddedF;
+ (BOOL) modDouble3X: (vector_double3) x andDouble3Y: (vector_double3) y withModdedDouble3:(vector_double3) moddedF;
+ (BOOL) modDouble4X: (vector_double4) x andDouble4Y: (vector_double4) y withModdedDouble4:(vector_double4) moddedF;


+ (BOOL) modfFloat: (float) f withIntegerPart: (float) integerPart andFractionalType: (float) fractionalType;
+ (BOOL) modfFloat2: (vector_float2) f withInteger2Part: (vector_float2) integerPart andFractional2Type: (vector_float2) fractionalType;
+ (BOOL) modfFloat3: (vector_float3) f withInteger3Part: (vector_float3) integerPart andFractional3Type: (vector_float3) fractionalType;
+ (BOOL) modfFloat4: (vector_float4) f withInteger4Part: (vector_float4) integerPart andFractional4Type: (vector_float4) fractionalType;

+ (BOOL) modfDouble: (double) f withIntegerPart: (double) integerPart andFractionalType: (double) fractionalType;
+ (BOOL) modfDouble2: (vector_double2) f withInteger2Part: (vector_double2) integerPart andFractional2Type: (vector_double2) fractionalType;
+ (BOOL) modfDouble3: (vector_double3) f withInteger3Part: (vector_double3) integerPart andFractional3Type: (vector_double3) fractionalType;
+ (BOOL) modfDouble4: (vector_double4) f withInteger4Part: (vector_double4) integerPart andFractional4Type: (vector_double4) fractionalType;

+ (BOOL) smooothstepFloat: (float) f withEdge0: (float) edge0 andWithEdge1: (float) edge1 withSmoothsteppedFloat: (float) smoothsteppedFloat;
+ (BOOL) smooothstepDouble: (double) f withEdge0: (double) edge0 andWithEdge1: (double) edge1 withSmoothsteppedDouble: (double) smoothsteppedDouble;

+ (BOOL) fmaFloat2a: (vector_float2) a andFloat2b: (vector_float2) b andFloat2c: (vector_float2) c withResultFloat2: (vector_float2) result;
+ (BOOL) fmaFloat3a: (vector_float3) a andFloat3b: (vector_float3) b andFloat3c: (vector_float3) c withResultFloat3: (vector_float3) result;
+ (BOOL) fmaFloat4a: (vector_float4) a andFloat4b: (vector_float4) b andFloat4c: (vector_float4) c withResultFloat4: (vector_float4) result;
+ (BOOL) fmaDouble2a: (vector_double2) a andDouble2b: (vector_double2) b andDouble2c: (vector_double2) c withResultDouble2: (vector_double2) result;
+ (BOOL) fmaDouble3a: (vector_double3) a andDouble3b: (vector_double3) b andDouble3c: (vector_double3) c withResultDouble3: (vector_double3) result;
+ (BOOL) fmaDouble4a: (vector_double4) a andDouble4b: (vector_double4) b andDouble4c: (vector_double4) c withResultDouble4: (vector_double4) result;

+ (BOOL) frexp: (vector_float2) value withValFloat2:(vector_float2) val andExponent2: (vector_int2) exp;
+ (BOOL) frexp: (vector_float3) value withValFloat3:(vector_float3) val andExponent3: (vector_int3) exp;
+ (BOOL) frexp: (vector_float4) value withValFloat4:(vector_float4) val andExponent4: (vector_int4) exp;
+ (BOOL) frexp: (vector_double2) value withValDouble2:(vector_double2) val andExponent2: (vector_int2) exp;
+ (BOOL) frexp: (vector_double3) value withValDouble3:(vector_double3) val andExponent3: (vector_int3) exp;
+ (BOOL) frexp: (vector_double4) value withValDouble4:(vector_double4) val andExponent4: (vector_int4) exp;

+(BOOL) pow:(vector_float2) base withPowerFloat2:(vector_float2) exp andResult:(vector_float2) result;
+(BOOL) pow:(vector_float3) base withPowerFloat3:(vector_float3) exp andResult:(vector_float3) result;
+(BOOL) pow:(vector_float4) base withPowerFloat4:(vector_float4) exp andResult:(vector_float4) result;
+(BOOL) pow:(vector_double2) base withPowerDouble2:(vector_double2) exp andResult:(vector_double2) result;
+(BOOL) pow:(vector_double3) base withPowerDouble3:(vector_double3) exp andResult:(vector_double3) result;
+(BOOL) pow:(vector_double4) base withPowerDouble4:(vector_double4) exp andResult:(vector_double4) result;

+(BOOL) expFloat2:(vector_float2) x andResult:(vector_float2) result;
+(BOOL) expFloat3:(vector_float3) x andResult:(vector_float3) result;
+(BOOL) expFloat4:(vector_float4) x andResult:(vector_float4) result;
+(BOOL) expDouble2:(vector_double2) x andResult:(vector_double2) result;
+(BOOL) expDouble3:(vector_double3) x andResult:(vector_double3) result;
+(BOOL) expDouble4:(vector_double4) x andResult:(vector_double4) result;

+(BOOL) logFloat2:(vector_float2) x andResult:(vector_float2) result;
+(BOOL) logFloat3:(vector_float3) x andResult:(vector_float3) result;
+(BOOL) logFloat4:(vector_float4) x andResult:(vector_float4) result;
+(BOOL) logDouble2:(vector_double2) x andResult:(vector_double2) result;
+(BOOL) logDouble3:(vector_double3) x andResult:(vector_double3) result;
+(BOOL) logDouble4:(vector_double4) x andResult:(vector_double4) result;

+(BOOL) exp2Float2:(vector_float2) x andResult:(vector_float2) result;
+(BOOL) exp2Float3:(vector_float3) x andResult:(vector_float3) result;
+(BOOL) exp2Float4:(vector_float4) x andResult:(vector_float4) result;
+(BOOL) exp2Double2:(vector_double2) x andResult:(vector_double2) result;
+(BOOL) exp2Double3:(vector_double3) x andResult:(vector_double3) result;
+(BOOL) exp2Double4:(vector_double4) x andResult:(vector_double4) result;

+(BOOL) log2Float2:(vector_float2) x andResult:(vector_float2) result;
+(BOOL) log2Float3:(vector_float3) x andResult:(vector_float3) result;
+(BOOL) log2Float4:(vector_float4) x andResult:(vector_float4) result;
+(BOOL) log2Double2:(vector_double2) x andResult:(vector_double2) result;
+(BOOL) log2Double3:(vector_double3) x andResult:(vector_double3) result;
+(BOOL) log2Double4:(vector_double4) x andResult:(vector_double4) result;

+(BOOL) sqrtFloat2:(vector_float2) x andResult:(vector_float2) result;
+(BOOL) sqrtFloat3:(vector_float3) x andResult:(vector_float3) result;
+(BOOL) sqrtFloat4:(vector_float4) x andResult:(vector_float4) result;
+(BOOL) sqrtDouble2:(vector_double2) x andResult:(vector_double2) result;
+(BOOL) sqrtDouble3:(vector_double3) x andResult:(vector_double3) result;
+(BOOL) sqrtDouble4:(vector_double4) x andResult:(vector_double4) result;

+(BOOL) inversesqrtFloat2:(vector_float2) x andResult:(vector_float2) result;
+(BOOL) inversesqrtFloat3:(vector_float3) x andResult:(vector_float3) result;
+(BOOL) inversesqrtFloat4:(vector_float4) x andResult:(vector_float4) result;
+(BOOL) inversesqrtDouble2:(vector_double2) x andResult:(vector_double2) result;
+(BOOL) inversesqrtDouble3:(vector_double3) x andResult:(vector_double3) result;
+(BOOL) inversesqrtDouble4:(vector_double4) x andResult:(vector_double4) result;

+(BOOL) faceforward:(vector_float2) N withI:(vector_float2) i withNref:(vector_float2) nRef andResultFloat2:(vector_float2) result;
+(BOOL) faceforward:(vector_float3) N withI:(vector_float3) i withNref:(vector_float3) nRef andResultFloat3:(vector_float3) result;
+(BOOL) faceforward:(vector_float4) N withI:(vector_float4) i withNref:(vector_float4) nRef andResultFloat4:(vector_float4) result;
+(BOOL) faceforward:(vector_double2) N withI:(vector_double2) i withNref:(vector_double2) nRef andResultDouble2:(vector_double2) result;
+(BOOL) faceforward:(vector_double3) N withI:(vector_double3) i withNref:(vector_double3) nRef andResultDouble3:(vector_double3) result;
+(BOOL) faceforward:(vector_double4) N withI:(vector_double4) i withNref:(vector_double4) nRef andResultDouble4:(vector_double4) result;

+(BOOL) determinant:(matrix_float2x2) M andResultFloat2x2:(float) result;
+(BOOL) determinant:(matrix_float3x3) M andResultFloat3x3:(float) result;
+(BOOL) determinant:(matrix_float4x4) M andResultFloat4x4:(float) result;
+(BOOL) determinant:(matrix_double2x2) M andResultDouble2x2:(double) result;
+(BOOL) determinant:(matrix_double3x3) M andResultDouble3x3:(double) result;
+(BOOL) determinant:(matrix_double4x4) M andResultDouble4x4:(double) result;

+(BOOL) radiansFromDegrees:(float) degrees floatWithResult:(float) result;
+(BOOL) radiansFromDegrees:(vector_float2) degrees float2WithResult:(vector_float2) result;
+(BOOL) radiansFromDegrees:(vector_float3) degrees float3WithResult:(vector_float3) result;
+(BOOL) radiansFromDegrees:(vector_float4) degrees float4WithResult:(vector_float4) result;
+(BOOL) radiansFromDegrees:(double) degrees doubleWithResult:(double) result;
+(BOOL) radiansFromDegrees:(vector_double2) degrees double2WithResult:(vector_double2) result;
+(BOOL) radiansFromDegrees:(vector_double3) degrees double3WithResult:(vector_double3) result;
+(BOOL) radiansFromDegrees:(vector_double4) degrees double4WithResult:(vector_double4) result;

+(BOOL) degreesFromRadians:(float) degrees floatWithResult:(float) result;
+(BOOL) degreesFromRadians:(vector_float2) degrees float2WithResult:(vector_float2) result;
+(BOOL) degreesFromRadians:(vector_float3) degrees float3WithResult:(vector_float3) result;
+(BOOL) degreesFromRadians:(vector_float4) degrees float4WithResult:(vector_float4) result;
+(BOOL) degreesFromRadians:(double) degrees doubleWithResult:(double) result;
+(BOOL) degreesFromRadians:(vector_double2) degrees double2WithResult:(vector_double2) result;
+(BOOL) degreesFromRadians:(vector_double3) degrees double3WithResult:(vector_double3) result;
+(BOOL) degreesFromRadians:(vector_double4) degrees double4WithResult:(vector_double4) result;

+(BOOL) translateFloat:(matrix_float4x4) m withVector:(vector_float3) v withResult:(matrix_float4x4) result;
+(BOOL) translateDouble:(matrix_double4x4) m withVector:(vector_double3) v withResult:(matrix_double4x4) result;

+(BOOL) rotateFloat:(matrix_float4x4)m withAngle:(float) angle withAxis:(vector_float3) axis andResult:(matrix_float4x4) result;
+(BOOL) rotateDouble:(matrix_double4x4)m withAngle:(double) angle withAxis:(vector_double3) axis andResult:(matrix_double4x4) result;

+(BOOL) scaleFloat:(matrix_float4x4)m withVector:(vector_float3) v andResult:(matrix_float4x4) result;
+(BOOL) scaleDouble:(matrix_double4x4)m withVector:(vector_double3) v andResult:(matrix_double4x4) result;

+(BOOL) orthoFloat:(float)left withRight:(float)right withBottom:(float)bottom withTop:(float)top withZNear:(float)zNear withZFar:(float)zFar andResult:(matrix_float4x4) result;
+(BOOL) orthoFloat:(float)left withRight:(float)right withBottom:(float)bottom withTop:(float)top andResult:(matrix_float4x4) result;
+(BOOL) orthoDouble:(double)left withRight:(double)right withBottom:(double)bottom withTop:(double)top withZNear:(double)zNear withZFar:(double)zFar andResult:(matrix_double4x4) result;
+(BOOL) orthoDouble:(double)left withRight:(double)right withBottom:(double)bottom withTop:(double)top andResult:(matrix_double4x4) result;

+(BOOL) frustumFloat:(float)left withRight:(float)right withBottom:(float)bottom withTop:(float)top withNear:(float)near withFar:(float)far andResult:(matrix_float4x4) result;
+(BOOL) frustumDouble:(double)left withRight:(double)right withBottom:(double)bottom withTop:(double)top withNear:(double)near withFar:(double)far andResult:(matrix_double4x4) result;

+(BOOL) perspectiveFloat:(float)fovy withAspect:(float)aspect withZNear:(float)zNear withZFar:(float) zFar andResult:(matrix_float4x4) result;
+(BOOL) perspectiveDouble:(double)fovy withAspect:(double)aspect withZNear:(double)zNear withZFar:(double) zFar andResult:(matrix_double4x4) result;

+(BOOL) perspectiveFovFloat:(float)fovy withWidth:(float)width withHeight:(float)height withZNear:(float)zNear withZFar:(float) zFar andResult:(matrix_float4x4) result;
+(BOOL) perspectiveFovDouble:(double)fovy withWidth:(double)width withHeight:(double)height withZNear:(double)zNear withZFar:(double) zFar andResult:(matrix_double4x4) result;

+(BOOL) infinitePerspectiveFloat:(float)fovy withAspect:(float)aspect withZNear:(float)zNear andResult:(matrix_float4x4) result;
+(BOOL) infinitePerspectiveDouble:(double)fovy withAspect:(double)aspect withZNear:(double)zNear andResult:(matrix_double4x4) result;

+(BOOL) lookAtFloat:(vector_float3) eye withCenter:(vector_float3) center withUp:(vector_float3) up andResult:(matrix_float4x4) result;
+(BOOL) lookAtDouble:(vector_double3) eye withCenter:(vector_double3) center withUp:(vector_double3) up andResult:(matrix_double4x4) result;

@end
