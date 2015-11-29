//
//  glm-to-swift.m
//  swift3D
//
//  Created by Adrian Krupa on 01.11.2015.
//  Copyright © 2015 Adrian Krupa. All rights reserved.
//

#include <algorithm>

#import "glm-to-swift.h"
#import "glm/glm.hpp"
#import "glm/gtc/epsilon.hpp"
#import "glm/gtc/matrix_transform.hpp"

#pragma mark Helper functions

template <class t, class u>
t castVector(u vec, int indexI) {
    t retVec;
    for (int i=0; i<indexI; i++) {
        retVec[i] = vec[i];
    }
    return retVec;
}

template <class t, class u>
t castMatrix(u vec, int indexI, int indexJ) {
    t retMat;
    for (int i=0; i<indexI; i++) {
        for (int j=0; j<indexJ; j++) {
            retMat[i][j] = vec.columns[i][j];
        }
    }
   return retMat;
}

template <class t, class u>
t castMatrix(u vec, int indexI) {
    return castMatrix<t>(vec, indexI, indexI);
}

template <class T>
BOOL isEqual(const T& v1, const T& v2, float eps) {
    auto r = glm::epsilonEqual(v1, v2, eps);
    for (int i=0; i<glm::detail::component_count(r); i++) {
        if (!r[i]) {
            return false;
        }
    }
    return true;
}

template <class T>
BOOL isEqual(const T& v1, const T& v2, double eps) {
    auto r = glm::epsilonEqual(v1, v2, eps);
    for (int i=0; i<glm::detail::component_count(r); i++) {
        if (!r[i]) {
            return false;
        }
    }
    return true;
}

template <class T>
BOOL isEqualMatrix(const T& v1, const T& v2, float eps) {
    auto v = glm::detail::component_count(v1);
    for (int j=0; j<v; j++) {
        auto r = glm::epsilonEqual(v1[j], v2[j], eps);
        for (int i=0; i<glm::detail::component_count(r); i++) {
            if (!r[i]) {
                return false;
            }
        }
    }
    return true;
}

template <class T>
BOOL isEqualMatrix(const T& v1, const T& v2, double eps) {
    auto v = glm::detail::component_count(v1);
    for (int j=0; j<v; j++) {
        auto r = glm::epsilonEqual(v1[j], v2[j], eps);
        for (int i=0; i<glm::detail::component_count(r); i++) {
            if (!r[i]) {
                return false;
            }
        }
    }
    return true;
}

BOOL isEqual(const float& v1, const float& v2, float eps) {
    return glm::epsilonEqual(v1, v2, eps);
}

BOOL isEqual(const double& v1, const double& v2, double eps) {
    return glm::epsilonEqual(v1, v2, eps);
}

#pragma mark -

@implementation glm_to_swift

#pragma mark - Fract

+ (BOOL) fractFloat: (float) f withFractedFloat: (float) fractedF {
    return isEqual(glm::fract(f), fractedF, 0.00000001f);
}

+ (BOOL) fractDouble: (double) f withFractedDouble: (double) fractedF {
    return isEqual(glm::fract(f), fractedF, 0.00000001);
}

+ (BOOL) roundFloat2: (vector_float2) v withRoundedFloat2: (vector_float2) roundedV {
    glm::vec2 glmV = castVector<glm::vec2>(v, 2);
    glm::vec2 glmRoundedV = castVector<glm::vec2>(roundedV, 2);
    return isEqual(glm::round(glmV), glmRoundedV, 0.00000001f);
}

+ (BOOL) roundFloat3: (vector_float3) v withRoundedFloat3: (vector_float3) roundedV {
    glm::vec3 glmV = castVector<glm::vec3>(v, 3);
    glm::vec3 glmRoundedV = castVector<glm::vec3>(roundedV, 3);
    return isEqual(glm::round(glmV), glmRoundedV, 0.00000001f);
}

+ (BOOL) roundFloat4: (vector_float4) v withRoundedFloat4: (vector_float4) roundedV {
    glm::vec4 glmV = castVector<glm::vec4>(v, 4);
    glm::vec4 glmRoundedV = castVector<glm::vec4>(roundedV, 4);
    return isEqual(glm::round(glmV), glmRoundedV, 0.00000001f);
}

+ (BOOL) roundDouble2: (vector_double2) v withRoundedDouble2: (vector_double2) roundedV {
    glm::dvec2 glmV = castVector<glm::dvec2>(v, 2);
    glm::dvec2 glmRoundedV = castVector<glm::dvec2>(roundedV, 2);
    return isEqual(glm::round(glmV), glmRoundedV, 0.00000001);
}

+ (BOOL) roundDouble3: (vector_double3) v withRoundedDouble3: (vector_double3) roundedV {
    glm::dvec3 glmV = castVector<glm::dvec3>(v, 3);
    glm::dvec3 glmRoundedV = castVector<glm::dvec3>(roundedV, 3);
    return isEqual(glm::round(glmV), glmRoundedV, 0.00000001);
}

+ (BOOL) roundDouble4: (vector_double4) v withRoundedDouble4: (vector_double4) roundedV {
    glm::dvec4 glmV = castVector<glm::dvec4>(v, 4);
    glm::dvec4 glmRoundedV = castVector<glm::dvec4>(roundedV, 4);
    return isEqual(glm::round(glmV), glmRoundedV, 0.00000001);
}

#pragma mark - Round even

+ (BOOL) roundEvenFloat: (float) f withRoundedFloat: (float) roundedF {
    return isEqual(glm::roundEven(f), roundedF, 0.00000001f);
}

+ (BOOL) roundEvenFloat2: (vector_float2) f withRoundedFloat2: (vector_float2) roundedF {
    glm::vec2 glmV = castVector<glm::vec2>(f, 2);
    glm::vec2 glmRoundedV = castVector<glm::vec2>(roundedF, 2);
    return isEqual(glm::roundEven(glmV), glmRoundedV, 0.00000001f);
}

+ (BOOL) roundEvenFloat3: (vector_float3) f withRoundedFloat3: (vector_float3) roundedF {
    glm::vec3 glmV = castVector<glm::vec3>(f, 3);
    glm::vec3 glmRoundedV = castVector<glm::vec3>(roundedF, 3);
    return isEqual(glm::roundEven(glmV), glmRoundedV, 0.00000001f);
}

+ (BOOL) roundEvenFloat4: (vector_float4) f withRoundedFloat4: (vector_float4) roundedF {
    glm::vec4 glmV = castVector<glm::vec4>(f, 4);
    glm::vec4 glmRoundedV = castVector<glm::vec4>(roundedF, 4);
    return isEqual(glm::roundEven(glmV), glmRoundedV, 0.00000001f);
}

+ (BOOL) roundEvenDouble: (double) f withRoundedDouble: (double) roundedF {
    return isEqual(glm::roundEven(f), roundedF, 0.00000001);
}

+ (BOOL) roundEvenDouble2: (vector_double2) f withRoundedDouble2: (vector_double2) roundedF {
    glm::dvec2 glmV = castVector<glm::dvec2>(f, 2);
    glm::dvec2 glmRoundedV = castVector<glm::dvec2>(roundedF, 2);
    return isEqual(glm::roundEven(glmV), glmRoundedV, 0.00000001);
}

+ (BOOL) roundEvenDouble3: (vector_double3) f withRoundedDouble3: (vector_double3) roundedF {
    glm::dvec3 glmV = castVector<glm::dvec3>(f, 3);
    glm::dvec3 glmRoundedV = castVector<glm::dvec3>(roundedF, 3);
    return isEqual(glm::roundEven(glmV), glmRoundedV, 0.00000001);
}

+ (BOOL) roundEvenDouble4: (vector_double4) f withRoundedDouble4: (vector_double4) roundedF {
    glm::dvec4 glmV = castVector<glm::dvec4>(f, 4);
    glm::dvec4 glmRoundedV = castVector<glm::dvec4>(roundedF, 4);
    return isEqual(glm::roundEven(glmV), glmRoundedV, 0.00000001);
}

#pragma mark - Mod

+ (BOOL) modFloatX: (float) x andFloatY: (float) y withModdedFloat:(float) moddedF {
    return isEqual(glm::mod(x, y), moddedF, 0.00000001f);
}

+ (BOOL) modFloat2X: (vector_float2) x andFloatY: (float) y withModdedFloat:(vector_float2) moddedF {
    glm::vec2 glmX = castVector<glm::vec2>(x, 2);
    glm::vec2 glmModdedF = castVector<glm::vec2>(moddedF, 2);
    return isEqual(glm::mod(glmX, y), glmModdedF, 0.00000001f);
}

+ (BOOL) modFloat3X: (vector_float3) x andFloatY: (float) y withModdedFloat:(vector_float3) moddedF {
    glm::vec3 glmX = castVector<glm::vec3>(x, 3);
    glm::vec3 glmModdedF = castVector<glm::vec3>(moddedF, 3);
    return isEqual(glm::mod(glmX, y), glmModdedF, 0.00000001f);
}

+ (BOOL) modFloat4X: (vector_float4) x andFloatY: (float) y withModdedFloat:(vector_float4) moddedF {
    glm::vec4 glmX = castVector<glm::vec4>(x, 4);
    glm::vec4 glmModdedF = castVector<glm::vec4>(moddedF, 4);
    return isEqual(glm::mod(glmX, y), glmModdedF, 0.00000001f);
}

+ (BOOL) modFloat2X: (vector_float2) x andFloat2Y: (vector_float2) y withModdedFloat2:(vector_float2) moddedF {
    glm::vec2 glmX = castVector<glm::vec2>(x, 2);
    glm::vec2 glmY = castVector<glm::vec2>(y, 2);
    glm::vec2 glmModdedF = castVector<glm::vec2>(moddedF, 2);
    return isEqual(glm::mod(glmX, glmY), glmModdedF, 0.00000001f);
}

+ (BOOL) modFloat3X: (vector_float3) x andFloat3Y: (vector_float3) y withModdedFloat3:(vector_float3) moddedF {
    glm::vec3 glmX = castVector<glm::vec3>(x, 3);
    glm::vec3 glmY = castVector<glm::vec3>(y, 3);
    glm::vec3 glmModdedF = castVector<glm::vec3>(moddedF, 3);
    return isEqual(glm::mod(glmX, glmY), glmModdedF, 0.00000001f);
}

+ (BOOL) modFloat4X: (vector_float4) x andFloat4Y: (vector_float4) y withModdedFloat4:(vector_float4) moddedF {
    glm::vec4 glmX = castVector<glm::vec4>(x, 4);
    glm::vec4 glmY = castVector<glm::vec4>(y, 4);
    glm::vec4 glmModdedF = castVector<glm::vec4>(moddedF, 4);
    return isEqual(glm::mod(glmX, glmY), glmModdedF, 0.00000001f);
}

+ (BOOL) modDoubleX: (double) x andDoubleY: (double) y withModdedDouble:(double) moddedF {
    return isEqual(glm::mod(x, y), moddedF, 0.00000001);
}

+ (BOOL) modDouble2X: (vector_double2) x andDoubleY: (double) y withModdedDouble:(vector_double2) moddedF {
    glm::dvec2 glmX = castVector<glm::dvec2>(x, 2);
    glm::dvec2 glmModdedF = castVector<glm::dvec2>(moddedF, 2);
    return isEqual(glm::mod(glmX, y), glmModdedF, 0.00000001);
}

+ (BOOL) modDouble3X: (vector_double3) x andDoubleY: (double) y withModdedDouble:(vector_double3) moddedF {
    glm::dvec3 glmX = castVector<glm::dvec3>(x, 3);
    glm::dvec3 glmModdedF = castVector<glm::dvec3>(moddedF, 3);
    return isEqual(glm::mod(glmX, y), glmModdedF, 0.00000001);
}

+ (BOOL) modDouble4X: (vector_double4) x andDoubleY: (double) y withModdedDouble:(vector_double4) moddedF {
    glm::dvec4 glmX = castVector<glm::dvec4>(x, 4);
    glm::dvec4 glmModdedF = castVector<glm::dvec4>(moddedF, 4);
    return isEqual(glm::mod(glmX, y), glmModdedF, 0.00000001);
}

+ (BOOL) modDouble2X: (vector_double2) x andDouble2Y: (vector_double2) y withModdedDouble2:(vector_double2) moddedF {
    glm::dvec2 glmX = castVector<glm::dvec2>(x, 2);
    glm::dvec2 glmY = castVector<glm::dvec2>(y, 2);
    glm::dvec2 glmModdedF = castVector<glm::dvec2>(moddedF, 2);
    return isEqual(glm::mod(glmX, glmY), glmModdedF, 0.00000001);
}

+ (BOOL) modDouble3X: (vector_double3) x andDouble3Y: (vector_double3) y withModdedDouble3:(vector_double3) moddedF {
    glm::dvec3 glmX = castVector<glm::dvec3>(x, 3);
    glm::dvec3 glmY = castVector<glm::dvec3>(y, 3);
    glm::dvec3 glmModdedF = castVector<glm::dvec3>(moddedF, 3);
    return isEqual(glm::mod(glmX, glmY), glmModdedF, 0.00000001);
}

+ (BOOL) modDouble4X: (vector_double4) x andDouble4Y: (vector_double4) y withModdedDouble4:(vector_double4) moddedF {
    glm::dvec4 glmX = castVector<glm::dvec4>(x, 4);
    glm::dvec4 glmY = castVector<glm::dvec4>(y, 4);
    glm::dvec4 glmModdedF = castVector<glm::dvec4>(moddedF, 4);
    return isEqual(glm::mod(glmX, glmY), glmModdedF, 0.00000001);
}

#pragma mark - Modf

+ (BOOL) modfFloat: (float) f withIntegerPart: (float) integerPart andFractionalType: (float) fractionalType {
    float glmIntegerPart;
    float fract = glm::modf(f, glmIntegerPart);
    return isEqual(fract, fractionalType, 0.00000001f) && glmIntegerPart == integerPart;
}

+ (BOOL) modfFloat2: (vector_float2) f withInteger2Part: (vector_float2) integerPart andFractional2Type: (vector_float2) fractionalType {
    glm::vec2 glmIntegerPart;
    glm::vec2 glmF = castVector<glm::vec2>(f, 2);
    glm::vec2 fract = glm::modf(glmF, glmIntegerPart);
    return glmIntegerPart == castVector<glm::vec2>(integerPart, 2) && isEqual(fract, castVector<glm::vec2>(fractionalType, 2), 0.00000001f);
}

+ (BOOL) modfFloat3: (vector_float3) f withInteger3Part: (vector_float3) integerPart andFractional3Type: (vector_float3) fractionalType {
    glm::vec3 glmIntegerPart;
    glm::vec3 glmF = castVector<glm::vec3>(f, 3);
    glm::vec3 fract = glm::modf(glmF, glmIntegerPart);
    return glmIntegerPart == castVector<glm::vec3>(integerPart, 3) && isEqual(fract, castVector<glm::vec3>(fractionalType, 3), 0.00000001f);
}

+ (BOOL) modfFloat4: (vector_float4) f withInteger4Part: (vector_float4) integerPart andFractional4Type: (vector_float4) fractionalType {
    glm::vec4 glmIntegerPart;
    glm::vec4 glmF = castVector<glm::vec4>(f, 4);
    glm::vec4 fract = glm::modf(glmF, glmIntegerPart);
    return glmIntegerPart == castVector<glm::vec4>(integerPart, 4) && isEqual(fract, castVector<glm::vec4>(fractionalType, 4), 0.00000001f);
}

+ (BOOL) modfDouble: (double) f withIntegerPart: (double) integerPart andFractionalType: (double) fractionalType {
    double glmIntegerPart;
    double fract = glm::modf(f, glmIntegerPart);
    return isEqual(fract, fractionalType, 0.00000001) && glmIntegerPart == integerPart;
}

+ (BOOL) modfDouble2: (vector_double2) f withInteger2Part: (vector_double2) integerPart andFractional2Type: (vector_double2) fractionalType {
    glm::dvec2 glmIntegerPart;
    glm::dvec2 glmF = castVector<glm::dvec2>(f, 2);
    glm::dvec2 fract = glm::modf(glmF, glmIntegerPart);
    return glmIntegerPart == castVector<glm::dvec2>(integerPart, 2) && isEqual(fract, castVector<glm::dvec2>(fractionalType, 2), 0.00000001);
}

+ (BOOL) modfDouble3: (vector_double3) f withInteger3Part: (vector_double3) integerPart andFractional3Type: (vector_double3) fractionalType {
    glm::dvec3 glmIntegerPart;
    glm::dvec3 glmF = castVector<glm::dvec3>(f, 3);
    glm::dvec3 fract = glm::modf(glmF, glmIntegerPart);
    return glmIntegerPart == castVector<glm::dvec3>(integerPart, 3) && isEqual(fract, castVector<glm::dvec3>(fractionalType, 3), 0.00000001);
}

+ (BOOL) modfDouble4: (vector_double4) f withInteger4Part: (vector_double4) integerPart andFractional4Type: (vector_double4) fractionalType {
    glm::dvec4 glmIntegerPart;
    glm::dvec4 glmF = castVector<glm::dvec4>(f, 4);
    glm::dvec4 fract = glm::modf(glmF, glmIntegerPart);
    return glmIntegerPart == castVector<glm::dvec4>(integerPart, 4) && isEqual(fract, castVector<glm::dvec4>(fractionalType, 4), 0.00000001);
}

#pragma mark - Smoothstep

+ (BOOL) smooothstepFloat: (float) f withEdge0: (float) edge0 andWithEdge1: (float) edge1 withSmoothsteppedFloat: (float) smoothsteppedFloat {
    return isEqual(glm::smoothstep(edge0, edge1, f), smoothsteppedFloat, 0.00000001f);
}

+ (BOOL) smooothstepDouble: (double) f withEdge0: (double) edge0 andWithEdge1: (double) edge1 withSmoothsteppedDouble: (double) smoothsteppedDouble {
    return isEqual(glm::smoothstep(edge0, edge1, f), smoothsteppedDouble, 0.00000001);
}

#pragma mark - Fma

+ (BOOL) fmaFloat2a: (vector_float2) a andFloat2b: (vector_float2) b andFloat2c: (vector_float2) c withResultFloat2: (vector_float2) result {
    glm::vec2 glmA = castVector<glm::vec2>(a, 2);
    glm::vec2 glmB = castVector<glm::vec2>(b, 2);
    glm::vec2 glmC = castVector<glm::vec2>(c, 2);
    glm::vec2 glmResult = castVector<glm::vec2>(result, 2);
    
    return isEqual(glm::fma(glmA, glmB, glmC), glmResult, 0.00000001f);
}

+ (BOOL) fmaFloat3a: (vector_float3) a andFloat3b: (vector_float3) b andFloat3c: (vector_float3) c withResultFloat3: (vector_float3) result {
    glm::vec3 glmA = castVector<glm::vec3>(a, 3);
    glm::vec3 glmB = castVector<glm::vec3>(b, 3);
    glm::vec3 glmC = castVector<glm::vec3>(c, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    
    return isEqual(glm::fma(glmA, glmB, glmC), glmResult, 0.00000001f);
}

+ (BOOL) fmaFloat4a: (vector_float4) a andFloat4b: (vector_float4) b andFloat4c: (vector_float4) c withResultFloat4: (vector_float4) result {
    glm::vec4 glmA = castVector<glm::vec4>(a, 4);
    glm::vec4 glmB = castVector<glm::vec4>(b, 4);
    glm::vec4 glmC = castVector<glm::vec4>(c, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    
    return isEqual(glm::fma(glmA, glmB, glmC), glmResult, 0.00000001f);
}

+ (BOOL) fmaDouble2a: (vector_double2) a andDouble2b: (vector_double2) b andDouble2c: (vector_double2) c withResultDouble2: (vector_double2) result {
    glm::dvec2 glmA = castVector<glm::dvec2>(a, 2);
    glm::dvec2 glmB = castVector<glm::dvec2>(b, 2);
    glm::dvec2 glmC = castVector<glm::dvec2>(c, 2);
    glm::dvec2 glmResult = castVector<glm::dvec2>(result, 2);
    
    return isEqual(glm::fma(glmA, glmB, glmC), glmResult, 0.00000001);
}

+ (BOOL) fmaDouble3a: (vector_double3) a andDouble3b: (vector_double3) b andDouble3c: (vector_double3) c withResultDouble3: (vector_double3) result {
    glm::dvec3 glmA = castVector<glm::dvec3>(a, 3);
    glm::dvec3 glmB = castVector<glm::dvec3>(b, 3);
    glm::dvec3 glmC = castVector<glm::dvec3>(c, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    
    return isEqual(glm::fma(glmA, glmB, glmC), glmResult, 0.00000001);
}

+ (BOOL) fmaDouble4a: (vector_double4) a andDouble4b: (vector_double4) b andDouble4c: (vector_double4) c withResultDouble4: (vector_double4) result {
    glm::dvec4 glmA = castVector<glm::dvec4>(a, 4);
    glm::dvec4 glmB = castVector<glm::dvec4>(b, 4);
    glm::dvec4 glmC = castVector<glm::dvec4>(c, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    
    return isEqual(glm::fma(glmA, glmB, glmC), glmResult, 0.00000001);
}

#pragma mark - frexp

+ (BOOL) frexp: (vector_float2) value withValFloat2:(vector_float2) val andExponent2: (vector_int2) exp {
    glm::vec2 glmValue = castVector<glm::vec2>(value, 2);
    glm::vec2 glmVal = castVector<glm::vec2>(val, 2);
    glm::ivec2 glmExp = castVector<glm::ivec2>(exp, 2);
    glm::ivec2 glmResExp;
    glm::vec2 glmResVal = glm::frexp(glmValue, glmResExp);
    
    return glmResExp == glmExp && isEqual(glmResVal, glmVal, 0.00000001f);
}

+ (BOOL) frexp: (vector_float3) value withValFloat3:(vector_float3) val andExponent3: (vector_int3) exp {
    glm::vec3 glmValue = castVector<glm::vec3>(value, 3);
    glm::vec3 glmVal = castVector<glm::vec3>(val, 3);
    glm::ivec3 glmExp = castVector<glm::ivec3>(exp, 3);
    glm::ivec3 glmResExp;
    glm::vec3 glmResVal = glm::frexp(glmValue, glmResExp);
    
    return glmResExp == glmExp && isEqual(glmResVal, glmVal, 0.00000001f);
}

+ (BOOL) frexp: (vector_float4) value withValFloat4:(vector_float4) val andExponent4: (vector_int4) exp {
    glm::vec4 glmValue = castVector<glm::vec4>(value, 4);
    glm::vec4 glmVal = castVector<glm::vec4>(val, 4);
    glm::ivec4 glmExp = castVector<glm::ivec4>(exp, 4);
    glm::ivec4 glmResExp;
    glm::vec4 glmResVal = glm::frexp(glmValue, glmResExp);
    
    return glmResExp == glmExp && isEqual(glmResVal, glmVal, 0.00000001f);
}

+ (BOOL) frexp: (vector_double2) value withValDouble2:(vector_double2) val andExponent2: (vector_int2) exp {
    glm::dvec2 glmValue = castVector<glm::dvec2>(value, 2);
    glm::dvec2 glmVal = castVector<glm::dvec2>(val, 2);
    glm::ivec2 glmExp = castVector<glm::ivec2>(exp, 2);
    glm::ivec2 glmResExp;
    glm::dvec2 glmResVal = glm::frexp(glmValue, glmResExp);
    
    return glmResExp == glmExp && isEqual(glmResVal, glmVal, 0.00000001);
}

+ (BOOL) frexp: (vector_double3) value withValDouble3:(vector_double3) val andExponent3: (vector_int3) exp {
    glm::dvec3 glmValue = castVector<glm::dvec3>(value, 3);
    glm::dvec3 glmVal = castVector<glm::dvec3>(val, 3);
    glm::ivec3 glmExp = castVector<glm::ivec3>(exp, 3);
    glm::ivec3 glmResExp;
    glm::dvec3 glmResVal = glm::frexp(glmValue, glmResExp);
    
    return glmResExp == glmExp && isEqual(glmResVal, glmVal, 0.00000001);
}

+ (BOOL) frexp: (vector_double4) value withValDouble4:(vector_double4) val andExponent4: (vector_int4) exp {
    glm::dvec4 glmValue = castVector<glm::dvec4>(value, 4);
    glm::dvec4 glmVal = castVector<glm::dvec4>(val, 4);
    glm::ivec4 glmExp = castVector<glm::ivec4>(exp, 4);
    glm::ivec4 glmResExp;
    glm::dvec4 glmResVal = glm::frexp(glmValue, glmResExp);
    
    return glmResExp == glmExp && isEqual(glmResVal, glmVal, 0.00000001);
}

#pragma mark - pow

+(BOOL) pow:(vector_float2) base withPowerFloat2:(vector_float2) exp andResult:(vector_float2) result {
    glm::vec2 glmBase = castVector<glm::vec2>(base, 2);
    glm::vec2 glmExp = castVector<glm::vec2>(exp, 2);
    glm::vec2 glmResult = castVector<glm::vec2>(result, 2);
    
    return isEqual(glm::pow(glmBase, glmExp), glmResult, 0.00000001f);
}

+(BOOL) pow:(vector_float3) base withPowerFloat3:(vector_float3) exp andResult:(vector_float3) result {
    glm::vec3 glmBase = castVector<glm::vec3>(base, 3);
    glm::vec3 glmExp = castVector<glm::vec3>(exp, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    
    return isEqual(glm::pow(glmBase, glmExp), glmResult, 0.00000001f);
}

+(BOOL) pow:(vector_float4) base withPowerFloat4:(vector_float4) exp andResult:(vector_float4) result {
    glm::vec4 glmBase = castVector<glm::vec4>(base, 4);
    glm::vec4 glmExp = castVector<glm::vec4>(exp, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    
    return isEqual(glm::pow(glmBase, glmExp), glmResult, 0.00000001f);
}

+(BOOL) pow:(vector_double2) base withPowerDouble2:(vector_double2) exp andResult:(vector_double2) result {
    glm::dvec2 glmBase = castVector<glm::dvec2>(base, 2);
    glm::dvec2 glmExp = castVector<glm::dvec2>(exp, 2);
    glm::dvec2 glmResult = castVector<glm::dvec2>(result, 2);
    
    return isEqual(glm::pow(glmBase, glmExp), glmResult, 0.00000001);
}

+(BOOL) pow:(vector_double3) base withPowerDouble3:(vector_double3) exp andResult:(vector_double3) result {
    glm::dvec3 glmBase = castVector<glm::dvec3>(base, 3);
    glm::dvec3 glmExp = castVector<glm::dvec3>(exp, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    
    return isEqual(glm::pow(glmBase, glmExp), glmResult, 0.00000001);
}

+(BOOL) pow:(vector_double4) base withPowerDouble4:(vector_double4) exp andResult:(vector_double4) result {
    glm::dvec4 glmBase = castVector<glm::dvec4>(base, 4);
    glm::dvec4 glmExp = castVector<glm::dvec4>(exp, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    
    return isEqual(glm::pow(glmBase, glmExp), glmResult, 0.00000001);
}

#pragma mark - exp

+(BOOL) expFloat2:(vector_float2) x andResult:(vector_float2) result {
    glm::vec2 glmX = castVector<glm::vec2>(x, 2);
    glm::vec2 glmResult = castVector<glm::vec2>(result, 2);
    
    return isEqual(glm::exp(glmX), glmResult, 0.00000001f);
}

+(BOOL) expFloat3:(vector_float3) x andResult:(vector_float3) result {
    glm::vec3 glmX = castVector<glm::vec3>(x, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    
    return isEqual(glm::exp(glmX), glmResult, 0.00000001f);
}

+(BOOL) expFloat4:(vector_float4) x andResult:(vector_float4) result {
    glm::vec4 glmX = castVector<glm::vec4>(x, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    
    return isEqual(glm::exp(glmX), glmResult, 0.00000001f);
}

+(BOOL) expDouble2:(vector_double2) x andResult:(vector_double2) result {
    glm::dvec2 glmX = castVector<glm::dvec2>(x, 2);
    glm::dvec2 glmResult = castVector<glm::dvec2>(result, 2);
    
    return isEqual(glm::exp(glmX), glmResult, 0.00000001);
}

+(BOOL) expDouble3:(vector_double3) x andResult:(vector_double3) result {
    glm::dvec3 glmX = castVector<glm::dvec3>(x, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    
    return isEqual(glm::exp(glmX), glmResult, 0.00000001);
}

+(BOOL) expDouble4:(vector_double4) x andResult:(vector_double4) result {
    glm::dvec4 glmX = castVector<glm::dvec4>(x, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    
    return isEqual(glm::exp(glmX), glmResult, 0.00000001);
}

#pragma mark - log

+(BOOL) logFloat2:(vector_float2) x andResult:(vector_float2) result {
    glm::vec2 glmX = castVector<glm::vec2>(x, 2);
    glm::vec2 glmResult = castVector<glm::vec2>(result, 2);
    
    return isEqual(glm::log(glmX), glmResult, 0.00000001f);
}

+(BOOL) logFloat3:(vector_float3) x andResult:(vector_float3) result {
    glm::vec3 glmX = castVector<glm::vec3>(x, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    
    return isEqual(glm::log(glmX), glmResult, 0.00000001f);
}

+(BOOL) logFloat4:(vector_float4) x andResult:(vector_float4) result {
    glm::vec4 glmX = castVector<glm::vec4>(x, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    
    return isEqual(glm::log(glmX), glmResult, 0.00000001f);
}

+(BOOL) logDouble2:(vector_double2) x andResult:(vector_double2) result {
    glm::dvec2 glmX = castVector<glm::dvec2>(x, 2);
    glm::dvec2 glmResult = castVector<glm::dvec2>(result, 2);
    
    return isEqual(glm::log(glmX), glmResult, 0.00000001);
}

+(BOOL) logDouble3:(vector_double3) x andResult:(vector_double3) result {
    glm::dvec3 glmX = castVector<glm::dvec3>(x, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    
    return isEqual(glm::log(glmX), glmResult, 0.00000001);
}

+(BOOL) logDouble4:(vector_double4) x andResult:(vector_double4) result {
    glm::dvec4 glmX = castVector<glm::dvec4>(x, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    
    return isEqual(glm::log(glmX), glmResult, 0.00000001);
}

#pragma mark - exp2

+(BOOL) exp2Float2:(vector_float2) x andResult:(vector_float2) result {
    glm::vec2 glmX = castVector<glm::vec2>(x, 2);
    glm::vec2 glmResult = castVector<glm::vec2>(result, 2);
    
    return isEqual(glm::exp2(glmX), glmResult, 0.00000001f);
}

+(BOOL) exp2Float3:(vector_float3) x andResult:(vector_float3) result {
    glm::vec3 glmX = castVector<glm::vec3>(x, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    
    return isEqual(glm::exp2(glmX), glmResult, 0.00000001f);
}

+(BOOL) exp2Float4:(vector_float4) x andResult:(vector_float4) result {
    glm::vec4 glmX = castVector<glm::vec4>(x, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    
    return isEqual(glm::exp2(glmX), glmResult, 0.00000001f);
}

+(BOOL) exp2Double2:(vector_double2) x andResult:(vector_double2) result {
    glm::dvec2 glmX = castVector<glm::dvec2>(x, 2);
    glm::dvec2 glmResult = castVector<glm::dvec2>(result, 2);
    
    return isEqual(glm::exp2(glmX), glmResult, 0.00000001);
}

+(BOOL) exp2Double3:(vector_double3) x andResult:(vector_double3) result {
    glm::dvec3 glmX = castVector<glm::dvec3>(x, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    
    return isEqual(glm::exp2(glmX), glmResult, 0.00000001);
}

+(BOOL) exp2Double4:(vector_double4) x andResult:(vector_double4) result {
    glm::dvec4 glmX = castVector<glm::dvec4>(x, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    
    return isEqual(glm::exp2(glmX), glmResult, 0.00000001);
}

#pragma mark - log

+(BOOL) log2Float2:(vector_float2) x andResult:(vector_float2) result {
    glm::vec2 glmX = castVector<glm::vec2>(x, 2);
    glm::vec2 glmResult = castVector<glm::vec2>(result, 2);
    
    return isEqual(glm::log2(glmX), glmResult, 0.00000001f);
}

+(BOOL) log2Float3:(vector_float3) x andResult:(vector_float3) result {
    glm::vec3 glmX = castVector<glm::vec3>(x, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    
    return isEqual(glm::log2(glmX), glmResult, 0.00000001f);
}

+(BOOL) log2Float4:(vector_float4) x andResult:(vector_float4) result {
    glm::vec4 glmX = castVector<glm::vec4>(x, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    
    return isEqual(glm::log2(glmX), glmResult, 0.00000001f);
}

+(BOOL) log2Double2:(vector_double2) x andResult:(vector_double2) result {
    glm::dvec2 glmX = castVector<glm::dvec2>(x, 2);
    glm::dvec2 glmResult = castVector<glm::dvec2>(result, 2);
    
    return isEqual(glm::log2(glmX), glmResult, 0.00000001);
}

+(BOOL) log2Double3:(vector_double3) x andResult:(vector_double3) result {
    glm::dvec3 glmX = castVector<glm::dvec3>(x, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    
    return isEqual(glm::log2(glmX), glmResult, 0.00000001);
}

+(BOOL) log2Double4:(vector_double4) x andResult:(vector_double4) result {
    glm::dvec4 glmX = castVector<glm::dvec4>(x, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    
    return isEqual(glm::log2(glmX), glmResult, 0.00000001);
}

#pragma mark - sqrt

+(BOOL) sqrtFloat2:(vector_float2) x andResult:(vector_float2) result {
    glm::vec2 glmX = castVector<glm::vec2>(x, 2);
    glm::vec2 glmResult = castVector<glm::vec2>(result, 2);
    
    return isEqual(glm::sqrt(glmX), glmResult, 0.00000001f);
}

+(BOOL) sqrtFloat3:(vector_float3) x andResult:(vector_float3) result {
    glm::vec3 glmX = castVector<glm::vec3>(x, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    
    return isEqual(glm::sqrt(glmX), glmResult, 0.00000001f);
}

+(BOOL) sqrtFloat4:(vector_float4) x andResult:(vector_float4) result {
    glm::vec4 glmX = castVector<glm::vec4>(x, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    
    return isEqual(glm::sqrt(glmX), glmResult, 0.00000001f);
}

+(BOOL) sqrtDouble2:(vector_double2) x andResult:(vector_double2) result {
    glm::dvec2 glmX = castVector<glm::dvec2>(x, 2);
    glm::dvec2 glmResult = castVector<glm::dvec2>(result, 2);
    
    return isEqual(glm::sqrt(glmX), glmResult, 0.00000001);
}

+(BOOL) sqrtDouble3:(vector_double3) x andResult:(vector_double3) result {
    glm::dvec3 glmX = castVector<glm::dvec3>(x, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    
    return isEqual(glm::sqrt(glmX), glmResult, 0.00000001);
}

+(BOOL) sqrtDouble4:(vector_double4) x andResult:(vector_double4) result {
    glm::dvec4 glmX = castVector<glm::dvec4>(x, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    
    return isEqual(sqrt(glmX), glmResult, 0.00000001);
}

#pragma mark - inversesqrt

+(BOOL) inversesqrtFloat2:(vector_float2) x andResult:(vector_float2) result {
    glm::vec2 glmX = castVector<glm::vec2>(x, 2);
    glm::vec2 glmResult = castVector<glm::vec2>(result, 2);
    
    return isEqual(glm::inversesqrt(glmX), glmResult, 0.00000001f);
}

+(BOOL) inversesqrtFloat3:(vector_float3) x andResult:(vector_float3) result {
    glm::vec3 glmX = castVector<glm::vec3>(x, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    
    return isEqual(glm::inversesqrt(glmX), glmResult, 0.00000001f);
}

+(BOOL) inversesqrtFloat4:(vector_float4) x andResult:(vector_float4) result {
    glm::vec4 glmX = castVector<glm::vec4>(x, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    
    return isEqual(glm::inversesqrt(glmX), glmResult, 0.00000001f);
}

+(BOOL) inversesqrtDouble2:(vector_double2) x andResult:(vector_double2) result {
    glm::dvec2 glmX = castVector<glm::dvec2>(x, 2);
    glm::dvec2 glmResult = castVector<glm::dvec2>(result, 2);
    
    return isEqual(glm::inversesqrt(glmX), glmResult, 0.00000001);
}

+(BOOL) inversesqrtDouble3:(vector_double3) x andResult:(vector_double3) result {
    glm::dvec3 glmX = castVector<glm::dvec3>(x, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    
    return isEqual(glm::inversesqrt(glmX), glmResult, 0.00000001);
}

+(BOOL) inversesqrtDouble4:(vector_double4) x andResult:(vector_double4) result {
    glm::dvec4 glmX = castVector<glm::dvec4>(x, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    
    return isEqual(glm::inversesqrt(glmX), glmResult, 0.00000001);
}

#pragma mark - faceforward

+(BOOL) faceforward:(vector_float2) N withI:(vector_float2) i withNref:(vector_float2) nRef andResultFloat2:(vector_float2) result {
    glm::vec2 glmN = castVector<glm::vec2>(N, 2);
    glm::vec2 glmI = castVector<glm::vec2>(i, 2);
    glm::vec2 glmNref = castVector<glm::vec2>(nRef, 2);
    glm::vec2 glmResult = castVector<glm::vec2>(result, 2);
    
    return isEqual(glm::faceforward(glmN, glmI, glmNref), glmResult, 0.00000001f);
}

+(BOOL) faceforward:(vector_float3) N withI:(vector_float3) i withNref:(vector_float3) nRef andResultFloat3:(vector_float3) result {
    glm::vec3 glmN = castVector<glm::vec3>(N, 3);
    glm::vec3 glmI = castVector<glm::vec3>(i, 3);
    glm::vec3 glmNref = castVector<glm::vec3>(nRef, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    
    return isEqual(glm::faceforward(glmN, glmI, glmNref), glmResult, 0.00000001f);
}

+(BOOL) faceforward:(vector_float4) N withI:(vector_float4) i withNref:(vector_float4) nRef andResultFloat4:(vector_float4) result {
    glm::vec4 glmN = castVector<glm::vec4>(N, 4);
    glm::vec4 glmI = castVector<glm::vec4>(i, 4);
    glm::vec4 glmNref = castVector<glm::vec4>(nRef, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    
    return isEqual(glm::faceforward(glmN, glmI, glmNref), glmResult, 0.00000001f);
}

+(BOOL) faceforward:(vector_double2) N withI:(vector_double2) i withNref:(vector_double2) nRef andResultDouble2:(vector_double2) result {
    glm::dvec2 glmN = castVector<glm::dvec2>(N, 2);
    glm::dvec2 glmI = castVector<glm::dvec2>(i, 2);
    glm::dvec2 glmNref = castVector<glm::dvec2>(nRef, 2);
    glm::dvec2 glmResult = castVector<glm::dvec2>(result, 2);
    
    return isEqual(glm::faceforward(glmN, glmI, glmNref), glmResult, 0.00000001);
}

+(BOOL) faceforward:(vector_double3) N withI:(vector_double3) i withNref:(vector_double3) nRef andResultDouble3:(vector_double3) result {
    glm::dvec3 glmN = castVector<glm::dvec3>(N, 3);
    glm::dvec3 glmI = castVector<glm::dvec3>(i, 3);
    glm::dvec3 glmNref = castVector<glm::dvec3>(nRef, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    
    return isEqual(glm::faceforward(glmN, glmI, glmNref), glmResult, 0.00000001);
}

+(BOOL) faceforward:(vector_double4) N withI:(vector_double4) i withNref:(vector_double4) nRef andResultDouble4:(vector_double4) result {
    glm::dvec4 glmN = castVector<glm::dvec4>(N, 4);
    glm::dvec4 glmI = castVector<glm::dvec4>(i, 4);
    glm::dvec4 glmNref = castVector<glm::dvec4>(nRef, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    
    return isEqual(glm::faceforward(glmN, glmI, glmNref), glmResult, 0.00000001);
}

#pragma mark - determinant

+(BOOL) determinant:(matrix_float2x2) M andResultFloat2x2:(float) result {
    glm::mat2 glmM = castMatrix<glm::mat2>(M, 2);
    return isEqual(glm::determinant(glmM), result, 0.00000001f);
}

+(BOOL) determinant:(matrix_float3x3) M andResultFloat3x3:(float) result {
    glm::mat3 glmM = castMatrix<glm::mat3>(M, 3);
    return isEqual(glm::determinant(glmM), result, 0.00000001f);
}

+(BOOL) determinant:(matrix_float4x4) M andResultFloat4x4:(float) result {
    glm::mat4 glmM = castMatrix<glm::mat4>(M, 4);
    return isEqual(glm::determinant(glmM), result, 0.00000001f);
}

+(BOOL) determinant:(matrix_double2x2) M andResultDouble2x2:(double) result {
    glm::dmat2 glmM = castMatrix<glm::dmat2>(M, 2);
    return isEqual(glm::determinant(glmM), result, 0.00000001);
}

+(BOOL) determinant:(matrix_double3x3) M andResultDouble3x3:(double) result {
    glm::dmat3 glmM = castMatrix<glm::dmat3>(M, 3);
    return isEqual(glm::determinant(glmM), result, 0.00000001);
}

+(BOOL) determinant:(matrix_double4x4) M andResultDouble4x4:(double) result {
    glm::dmat4 glmM = castMatrix<glm::dmat4>(M, 4);
    return isEqual(glm::determinant(glmM), result, 0.00000001);
}

#pragma mark - radians

+(BOOL) radiansFromDegrees:(float) degrees floatWithResult:(float) result {
    return isEqual(glm::radians(degrees), result, 0.00000001f);
}

+(BOOL) radiansFromDegrees:(vector_float2) degrees float2WithResult:(vector_float2) result {
    glm::vec2 glmDegrees = castVector<glm::vec2>(degrees, 2);
    glm::vec2 glmResult = castVector<glm::vec2>(result, 2);
    return isEqual(glm::radians(glmDegrees), glmResult, 0.00000001f);
}

+(BOOL) radiansFromDegrees:(vector_float3) degrees float3WithResult:(vector_float3) result {
    glm::vec3 glmDegrees = castVector<glm::vec3>(degrees, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    return isEqual(glm::radians(glmDegrees), glmResult, 0.00000001f);
}

+(BOOL) radiansFromDegrees:(vector_float4) degrees float4WithResult:(vector_float4) result {
    glm::vec4 glmDegrees = castVector<glm::vec4>(degrees, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    return isEqual(glm::radians(glmDegrees), glmResult, 0.00000001f);
}

+(BOOL) radiansFromDegrees:(double) degrees doubleWithResult:(double) result {
    return isEqual(glm::radians(degrees), result, 0.00000001);
}

+(BOOL) radiansFromDegrees:(vector_double2) degrees double2WithResult:(vector_double2) result {
    glm::dvec2 glmDegrees = castVector<glm::dvec2>(degrees, 2);
    glm::dvec2 glmResult = castVector<glm::dvec2>(result, 2);
    return isEqual(glm::radians(glmDegrees), glmResult, 0.00000001);
}

+(BOOL) radiansFromDegrees:(vector_double3) degrees double3WithResult:(vector_double3) result {
    glm::dvec3 glmDegrees = castVector<glm::dvec3>(degrees, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    return isEqual(glm::radians(glmDegrees), glmResult, 0.00000001);
}

+(BOOL) radiansFromDegrees:(vector_double4) degrees double4WithResult:(vector_double4) result {
    glm::dvec4 glmDegrees = castVector<glm::dvec4>(degrees, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    return isEqual(glm::radians(glmDegrees), glmResult, 0.00000001);
}

#pragma mark - degrees

+(BOOL) degreesFromRadians:(float) degrees floatWithResult:(float) result {
    return isEqual(glm::degrees(degrees), result, 0.00000001f);
}

+(BOOL) degreesFromRadians:(vector_float2) degrees float2WithResult:(vector_float2) result {
    glm::vec2 glmDegrees = castVector<glm::vec2>(degrees, 2);
    glm::vec2 glmResult = castVector<glm::vec2>(result, 2);
    return isEqual(glm::degrees(glmDegrees), glmResult, 0.00000001f);
}

+(BOOL) degreesFromRadians:(vector_float3) degrees float3WithResult:(vector_float3) result {
    glm::vec3 glmDegrees = castVector<glm::vec3>(degrees, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    return isEqual(glm::degrees(glmDegrees), glmResult, 0.00000001f);
}

+(BOOL) degreesFromRadians:(vector_float4) degrees float4WithResult:(vector_float4) result {
    glm::vec4 glmDegrees = castVector<glm::vec4>(degrees, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    return isEqual(glm::degrees(glmDegrees), glmResult, 0.00000001f);
}

+(BOOL) degreesFromRadians:(double) degrees doubleWithResult:(double) result {
    return isEqual(glm::degrees(degrees), result, 0.00000001);
}

+(BOOL) degreesFromRadians:(vector_double2) degrees double2WithResult:(vector_double2) result {
    glm::dvec2 glmDegrees = castVector<glm::dvec2>(degrees, 2);
    glm::dvec2 glmResult = castVector<glm::dvec2>(result, 2);
    return isEqual(glm::degrees(glmDegrees), glmResult, 0.00000001);
}

+(BOOL) degreesFromRadians:(vector_double3) degrees double3WithResult:(vector_double3) result {
    glm::dvec3 glmDegrees = castVector<glm::dvec3>(degrees, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    return isEqual(glm::degrees(glmDegrees), glmResult, 0.00000001);
}

+(BOOL) degreesFromRadians:(vector_double4) degrees double4WithResult:(vector_double4) result {
    glm::dvec4 glmDegrees = castVector<glm::dvec4>(degrees, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    return isEqual(glm::degrees(glmDegrees), glmResult, 0.00000001);
}

+(BOOL) translateFloat:(matrix_float4x4) m withVector:(vector_float3) v withResult:(matrix_float4x4) result {
    glm::vec3 glmV = castVector<glm::vec3>(v, 3);
    glm::mat4 glmM = castMatrix<glm::mat4>(m, 4);
    glm::mat4 glmResult = castMatrix<glm::mat4>(result, 4);
    return isEqualMatrix(glmResult, glm::translate(glmM, glmV),  0.00000001f);
}

+(BOOL) translateDouble:(matrix_double4x4) m withVector:(vector_double3) v withResult:(matrix_double4x4) result {
    glm::dvec3 glmV = castVector<glm::dvec3>(v, 3);
    glm::dmat4 glmM = castMatrix<glm::dmat4>(m, 4);
    glm::dmat4 glmResult = castMatrix<glm::dmat4>(result, 4);
    return isEqualMatrix(glmResult, glm::translate(glmM, glmV),  0.00000001);
}

+(BOOL) rotateFloat:(matrix_float4x4)m withAngle:(float) angle withAxis:(vector_float3) axis andResult:(matrix_float4x4) result {
    glm::mat4 glmM = castMatrix<glm::mat4>(m, 4);
    glm::vec3 glmAxis = castVector<glm::vec3>(axis, 3);
    glm::mat4 glmResult = castMatrix<glm::mat4>(result, 4);
    return isEqualMatrix(glmResult, glm::rotate(glmM, angle, glmAxis),  0.00000001f);
}

+(BOOL) rotateDouble:(matrix_double4x4)m withAngle:(double) angle withAxis:(vector_double3) axis andResult:(matrix_double4x4) result {
    glm::dmat4 glmM = castMatrix<glm::dmat4>(m, 4);
    glm::dvec3 glmAxis = castVector<glm::dvec3>(axis, 3);
    glm::dmat4 glmResult = castMatrix<glm::dmat4>(result, 4);
    return isEqualMatrix(glmResult, glm::rotate(glmM, angle, glmAxis),  0.00000001);
}

+(BOOL) scaleFloat:(matrix_float4x4)m withVector:(vector_float3) v andResult:(matrix_float4x4) result {
    glm::mat4 glmM = castMatrix<glm::mat4>(m, 4);
    glm::vec3 glmV = castVector<glm::vec3>(v, 3);
    glm::mat4 glmResult = castMatrix<glm::mat4>(result, 4);
    return isEqualMatrix(glmResult, glm::scale(glmM, glmV),  0.00000001f);
}

+(BOOL) scaleDouble:(matrix_double4x4)m withVector:(vector_double3) v andResult:(matrix_double4x4) result {
    glm::dmat4 glmM = castMatrix<glm::dmat4>(m, 4);
    glm::dvec3 glmV = castVector<glm::dvec3>(v, 3);
    glm::dmat4 glmResult = castMatrix<glm::dmat4>(result, 4);
    return isEqualMatrix(glmResult, glm::scale(glmM, glmV),  0.00000001);
}

+(BOOL) orthoFloat:(float)left withRight:(float)right withBottom:(float)bottom withTop:(float)top withZNear:(float)zNear withZFar:(float)zFar andResult:(matrix_float4x4) result {
    glm::mat4 glmResult = castMatrix<glm::mat4>(result, 4);
    return isEqualMatrix(glmResult, glm::ortho(left, right, bottom, top, zNear, zFar), 0.00000001f);
}

+(BOOL) orthoFloat:(float)left withRight:(float)right withBottom:(float)bottom withTop:(float)top andResult:(matrix_float4x4) result {
    glm::mat4 glmResult = castMatrix<glm::mat4>(result, 4);
    return isEqualMatrix(glmResult, glm::ortho(left, right, bottom, top), 0.00000001f);
}

+(BOOL) orthoDouble:(double)left withRight:(double)right withBottom:(double)bottom withTop:(double)top withZNear:(double)zNear withZFar:(double)zFar andResult:(matrix_double4x4) result {
    glm::dmat4 glmResult = castMatrix<glm::dmat4>(result, 4);
    return isEqualMatrix(glmResult, glm::ortho(left, right, bottom, top, zNear, zFar), 0.00000001);
}

+(BOOL) orthoDouble:(double)left withRight:(double)right withBottom:(double)bottom withTop:(double)top andResult:(matrix_double4x4) result {
    glm::dmat4 glmResult = castMatrix<glm::dmat4>(result, 4);
    return isEqualMatrix(glmResult, glm::ortho(left, right, bottom, top), 0.00000001);
}

+(BOOL) frustumFloat:(float)left withRight:(float)right withBottom:(float)bottom withTop:(float)top withNear:(float)near withFar:(float)far andResult:(matrix_float4x4) result {
    glm::mat4 glmResult = castMatrix<glm::mat4>(result, 4);
    return isEqualMatrix(glmResult, glm::frustum(left, right, bottom, top, near, far), 0.00000001f);
}

+(BOOL) frustumDouble:(double)left withRight:(double)right withBottom:(double)bottom withTop:(double)top withNear:(double)near withFar:(double)far andResult:(matrix_double4x4) result {
    glm::dmat4 glmResult = castMatrix<glm::dmat4>(result, 4);
    return isEqualMatrix(glmResult, glm::frustum(left, right, bottom, top, near, far), 0.00000001);
}

+(BOOL) perspectiveFloat:(float)fovy withAspect:(float)aspect withZNear:(float)zNear withZFar:(float) zFar andResult:(matrix_float4x4) result {
    glm::mat4 glmResult = castMatrix<glm::mat4>(result, 4);
    return isEqualMatrix(glmResult, glm::perspective(fovy, aspect, zNear, zFar), 0.00000001f);
}

+(BOOL) perspectiveDouble:(double)fovy withAspect:(double)aspect withZNear:(double)zNear withZFar:(double) zFar andResult:(matrix_double4x4) result {
    glm::dmat4 glmResult = castMatrix<glm::dmat4>(result, 4);
    return isEqualMatrix(glmResult, glm::perspective(fovy, aspect, zNear, zFar), 0.00000001);
}

+(BOOL) perspectiveFovFloat:(float)fovy withWidth:(float)width withHeight:(float)height withZNear:(float)zNear withZFar:(float) zFar andResult:(matrix_float4x4) result {
    
    glm::mat4 glmResult = castMatrix<glm::mat4>(result, 4);
    return isEqualMatrix(glmResult, glm::perspectiveFov(fovy, width, height, zNear, zFar), 0.00000001f);
}

+(BOOL) perspectiveFovDouble:(double)fovy withWidth:(double)width withHeight:(double)height withZNear:(double)zNear withZFar:(double) zFar andResult:(matrix_double4x4) result {
    
    glm::dmat4 glmResult = castMatrix<glm::dmat4>(result, 4);
    return isEqualMatrix(glmResult, glm::perspectiveFov(fovy, width, height, zNear, zFar), 0.00000001);
}

+(BOOL) infinitePerspectiveFloat:(float)fovy withAspect:(float)aspect withZNear:(float)zNear andResult:(matrix_float4x4) result {
    
    glm::mat4 glmResult = castMatrix<glm::mat4>(result, 4);
    return isEqualMatrix(glmResult, glm::infinitePerspective(fovy, aspect, zNear), 0.00000001f);
}

+(BOOL) infinitePerspectiveDouble:(double)fovy withAspect:(double)aspect withZNear:(double)zNear andResult:(matrix_double4x4) result {
    
    glm::dmat4 glmResult = castMatrix<glm::dmat4>(result, 4);
    return isEqualMatrix(glmResult, glm::infinitePerspective(fovy, aspect, zNear), 0.00000001);
}


+(BOOL) lookAtFloat:(vector_float3) eye withCenter:(vector_float3) center withUp:(vector_float3) up andResult:(matrix_float4x4) result {
    
    glm::vec3 glmEye = castVector<glm::vec3>(eye, 3);
    glm::vec3 glmCenter = castVector<glm::vec3>(center, 3);
    glm::vec3 glmUp = castVector<glm::vec3>(up, 3);
    glm::mat4 glmResult = castMatrix<glm::mat4>(result, 4);
    return isEqualMatrix(glmResult, glm::lookAt(glmEye, glmCenter, glmUp), 0.00000001f);
}

+(BOOL) lookAtDouble:(vector_double3) eye withCenter:(vector_double3) center withUp:(vector_double3) up andResult:(matrix_double4x4) result {
    
    glm::dvec3 glmEye = castVector<glm::dvec3>(eye, 3);
    glm::dvec3 glmCenter = castVector<glm::dvec3>(center, 3);
    glm::dvec3 glmUp = castVector<glm::dvec3>(up, 3);
    glm::dmat4 glmResult = castMatrix<glm::dmat4>(result, 4);
    return isEqualMatrix(glmResult, glm::lookAt(glmEye, glmCenter, glmUp), 0.00000001);
}



@end
