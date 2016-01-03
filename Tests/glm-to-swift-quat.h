//
//  glm-to-swift-quat.h
//  swift3D
//
//  Created by Adrian Krupa on 02.01.2016.
//  Copyright © 2016 Adrian Krupa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <simd/simd.h>

@interface glm_to_swift_quat : NSObject

+(BOOL) quatInitWithResult:(vector_float4) result;
+(BOOL) quatInitWithValuesW:(float) w ValueX:(float) x ValueY:(float) y ValueZ:(float) z AndResult:(vector_float4) result;
+(BOOL) quatInitWithQuatWithInitValuesW:(float) w ValueX:(float) x ValueY:(float) y ValueZ:(float) z andResult:(vector_float4) result;
+(BOOL) quatInitWithFloat:(float) s andVec3:(vector_float3) v andResult:(vector_float4) result;
+(BOOL) quatInitWithAngle:(float)angle andAxis:(vector_float3)axis andResult:(vector_float4) result;
+(BOOL) quatInitWithEulerAngles:(vector_float3) angles andResult:(vector_float4) result;
+(BOOL) quatInitWithNormalizedAxis:(vector_float3) axis1 withAxis:(vector_float3) axis2 andResult:(vector_float4) result;
+(BOOL) quatInitWithMat3x3:(matrix_float3x3) mat andResult:(vector_float4) result;
+(BOOL) quatInitWithMat4x4:(matrix_float4x4) mat andResult:(vector_float4) result;

+(BOOL) quatPlus:(vector_float4)v andResult:(vector_float4) result;
+(BOOL) quatMinus:(vector_float4)v andResult:(vector_float4) result;
+(BOOL) quatAddition:(vector_float4)v1 withQuat:(vector_float4)v2 andResult:(vector_float4) result;
+(BOOL) quatMultiplication:(vector_float4)v1 withQuat:(vector_float4)v2 andResult:(vector_float4) result;
+(BOOL) quatMultiplication:(vector_float4)v1 withScalar:(float)f andResult:(vector_float4) result;
+(BOOL) quatMultiplication_2:(vector_float4)v1 withScalar:(float)f andResult:(vector_float4) result;
+(BOOL) quatMultiplication:(vector_float4)v1 withVec3:(vector_float3)v2 andResult:(vector_float3) result;
+(BOOL) quatMultiplication_2:(vector_float4)v1 withVec3:(vector_float3)v2 andResult:(vector_float3) result;
+(BOOL) quatMultiplication:(vector_float4)v1 withVec4:(vector_float4)v2 andResult:(vector_float4) result;
+(BOOL) quatMultiplication_2:(vector_float4)v1 withVec4:(vector_float4)v2 andResult:(vector_float4) result;
+(BOOL) quatDivision:(vector_float4)v1 withScalar:(float)f andResult:(vector_float4) result;

+(BOOL) quatDot:(vector_float4)v1 withQuat:(vector_float4)v2 andResult:(float) result;
+(BOOL) quatLength:(vector_float4)v andResult:(float) result;
+(BOOL) quatInverse:(vector_float4)v andResult:(vector_float4) result;
+(BOOL) quatNormalization:(vector_float4) source andResult:(vector_float4) result;
+(BOOL) quatConjugate:(vector_float4) source andResult:(vector_float4) result;

+(BOOL) quatMix:(vector_float4)q1 with:(vector_float4)q2 at:(float)t andResult:(vector_float4) result;
+(BOOL) quatLerp:(vector_float4)q1 with:(vector_float4)q2 at:(float)t andResult:(vector_float4) result;
+(BOOL) quatSlerp:(vector_float4)q1 with:(vector_float4)q2 at:(float)t andResult:(vector_float4) result;

+(BOOL) quatRotate:(vector_float4)q withAngle:(float)angle withAxis:(vector_float3)axis andResult:(vector_float4) result;
+(BOOL) quatEulerAngles:(vector_float4)q withResult:(vector_float3) result;

+(BOOL) quatFloat3x3Cast:(vector_float4)q withResult:(matrix_float3x3) result;
+(BOOL) quatFloat4x4Cast:(vector_float4)q withResult:(matrix_float4x4) result;

+(BOOL) quatAngle:(vector_float4)q withResult:(float) result;
+(BOOL) quatAxis:(vector_float4)q withResult:(vector_float3) result;



+(BOOL) quatInitWithResultDouble:(vector_double4) result;
+(BOOL) quatInitWithValuesWDouble:(double) w ValueX:(double) x ValueY:(double) y ValueZ:(double) z AndResult:(vector_double4) result;
+(BOOL) quatInitWithQuatWithInitValuesWDouble:(double) w ValueX:(double) x ValueY:(double) y ValueZ:(double) z andResult:(vector_double4) result;
+(BOOL) quatInitWithDouble:(double)s andVec3:(vector_double3)v andResult:(vector_double4) result;
+(BOOL) quatInitWithAngleDouble:(double)angle andAxis:(vector_double3)axis andResult:(vector_double4) result;
+(BOOL) quatInitWithEulerAnglesDouble:(vector_double3) angles andResult:(vector_double4) result;
+(BOOL) quatInitWithNormalizedAxisDouble:(vector_double3) axis1 withAxis:(vector_double3) axis2 andResult:(vector_double4) result;
+(BOOL) quatInitWithMat3x3Double:(matrix_double3x3) mat andResult:(vector_double4) result;
+(BOOL) quatInitWithMat4x4Double:(matrix_double4x4) mat andResult:(vector_double4) result;

+(BOOL) quatPlusDouble:(vector_double4)v andResult:(vector_double4) result;
+(BOOL) quatMinusDouble:(vector_double4)v andResult:(vector_double4) result;
+(BOOL) quatAdditionDouble:(vector_double4)v1 withQuat:(vector_double4)v2 andResult:(vector_double4) result;
+(BOOL) quatMultiplicationDouble:(vector_double4)v1 withQuat:(vector_double4)v2 andResult:(vector_double4) result;
+(BOOL) quatMultiplicationDouble:(vector_double4)v1 withScalar:(double)f andResult:(vector_double4) result;
+(BOOL) quatMultiplication_2Double:(vector_double4)v1 withScalar:(double)f andResult:(vector_double4) result;
+(BOOL) quatMultiplicationDouble:(vector_double4)v1 withVec3:(vector_double3)v2 andResult:(vector_double3) result;
+(BOOL) quatMultiplication_2Double:(vector_double4)v1 withVec3:(vector_double3)v2 andResult:(vector_double3) result;
+(BOOL) quatMultiplicationDouble:(vector_double4)v1 withVec4:(vector_double4)v2 andResult:(vector_double4) result;
+(BOOL) quatMultiplication_2Double:(vector_double4)v1 withVec4:(vector_double4)v2 andResult:(vector_double4) result;
+(BOOL) quatDivisionDouble:(vector_double4)v1 withScalar:(double)f andResult:(vector_double4) result;

+(BOOL) quatDotDouble:(vector_double4)v1 withQuat:(vector_double4)v2 andResult:(double) result;
+(BOOL) quatLengthDouble:(vector_double4)v andResult:(double) result;
+(BOOL) quatInverseDouble:(vector_double4)v andResult:(vector_double4) result;
+(BOOL) quatNormalizationDouble:(vector_double4) source andResult:(vector_double4) result;
+(BOOL) quatConjugateDouble:(vector_double4) source andResult:(vector_double4) result;

+(BOOL) quatMixDouble:(vector_double4)q1 with:(vector_double4)q2 at:(double)t andResult:(vector_double4) result;
+(BOOL) quatLerpDouble:(vector_double4)q1 with:(vector_double4)q2 at:(double)t andResult:(vector_double4) result;
+(BOOL) quatSlerpDouble:(vector_double4)q1 with:(vector_double4)q2 at:(double)t andResult:(vector_double4) result;

+(BOOL) quatRotateDouble:(vector_double4)q withAngle:(double)angle withAxis:(vector_double3)axis andResult:(vector_double4) result;
+(BOOL) quatEulerAnglesDouble:(vector_double4)q withResult:(vector_double3) result;

+(BOOL) quatdouble3x3CastDouble:(vector_double4)q withResult:(matrix_double3x3) result;
+(BOOL) quatdouble4x4CastDouble:(vector_double4)q withResult:(matrix_double4x4) result;

+(BOOL) quatAngleDouble:(vector_double4)q withResult:(double) result;
+(BOOL) quatAxisDouble:(vector_double4)q withResult:(vector_double3) result;

@end
