//
//  glm-to-swift-quat.m
//  swift3D
//
//  Created by Adrian Krupa on 02.01.2016.
//  Copyright © 2016 Adrian Krupa. All rights reserved.
//

#include <algorithm>

#import "glm-to-swift-quat.h"
#import "glm/glm/glm.hpp"
#import "glm/glm/gtc/epsilon.hpp"

BOOL compare(vector_float4 v, glm::quat q) {
    return glm::epsilonEqual(v.x, q.x, 0.00000001f) &&
    glm::epsilonEqual(v.y, q.y, 0.00000001f) &&
    glm::epsilonEqual(v.z, q.z, 0.00000001f) &&
    glm::epsilonEqual(v.w, q.w, 0.00000001f);
}

BOOL compare(vector_double4 v, glm::dquat q) {
    return glm::epsilonEqual(v.x, q.x, 0.00000001) &&
    glm::epsilonEqual(v.y, q.y, 0.00000001) &&
    glm::epsilonEqual(v.z, q.z, 0.00000001) &&
    glm::epsilonEqual(v.w, q.w, 0.00000001);
}

template <class t, class u>
t castVector(u vec, int indexI) {
    t retVec;
    for (int i=0; i<indexI; i++) {
        retVec[i] = vec[i];
    }
    return retVec;
}

glm::quat castQuat(glm::vec4 vec) {
    glm::quat q;
    q.x = vec.x;
    q.y = vec.y;
    q.z = vec.z;
    q.w = vec.w;
    return q;
}

glm::dquat castQuat(glm::dvec4 vec) {
    glm::dquat q;
    q.x = vec.x;
    q.y = vec.y;
    q.z = vec.z;
    q.w = vec.w;
    return q;
}

BOOL isEqual(const glm::quat& q1, const glm::quat& q2, float eps) {
    return glm::epsilonEqual(q1.x, q2.x, eps) &&
        glm::epsilonEqual(q1.y, q2.y, eps) &&
        glm::epsilonEqual(q1.z, q2.z, eps) &&
        glm::epsilonEqual(q1.w, q2.w, eps);
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

@implementation glm_to_swift_quat

+ (BOOL) quatInitWithResult:(vector_float4) result {
    
    glm::quat q;
    
    return compare(result, q);
}

+(BOOL) quatInitWithValuesW:(float) w ValueX:(float) x ValueY:(float) y ValueZ:(float) z AndResult:(vector_float4) result {
    
    glm::quat q(w, x, y, z);
    return compare(result, q);
}

+(BOOL) quatInitWithQuatWithInitValuesW:(float) w ValueX:(float) x ValueY:(float) y ValueZ:(float) z andResult:(vector_float4) result {
    
    glm::quat q(w, x, y, z);
    glm::quat q2(q);
    
    return compare(result, q2);
}

+(BOOL) quatInitWithFloat:(float) s andVec3:(vector_float3) v andResult:(vector_float4) result {
    glm::vec3 glmV = castVector<glm::vec3>(v, 3);
    glm::quat q(s, glmV);
    return compare(result, q);
}

+(BOOL) quatInitWithAngle:(float)angle andAxis:(vector_float3)axis andResult:(vector_float4) result {
    glm::vec3 glmAxis = castVector<glm::vec3>(axis, 3);
    glm::quat glmResult = castQuat(castVector<glm::vec4>(result, 4));

    return isEqual(glmResult, glm::angleAxis(angle, glmAxis), 0.00000001f);
}

+(BOOL) quatInitWithEulerAngles:(vector_float3) angles andResult:(vector_float4) result {
    glm::vec3 glmAngles = castVector<glm::vec3>(angles, 3);
    glm::quat q(glmAngles);
    
    return compare(result, q);
}

+(BOOL) quatInitWithNormalizedAxis:(vector_float3) axis1 withAxis:(vector_float3) axis2 andResult:(vector_float4) result {
    glm::vec3 glmAxis1 = castVector<glm::vec3>(axis1, 3);
    glm::vec3 glmAxis2 = castVector<glm::vec3>(axis2, 3);
    glm::quat q(glmAxis1, glmAxis2);
    
    return compare(result, q);
}

+(BOOL) quatInitWithMat3x3:(matrix_float3x3) mat andResult:(vector_float4) result {
    glm::mat3 glmMat = castMatrix<glm::mat3>(mat, 3);
    glm::quat q(glmMat);
    
    return compare(result, q);
}

+(BOOL) quatInitWithMat4x4:(matrix_float4x4) mat andResult:(vector_float4) result {
    glm::mat4 glmMat = castMatrix<glm::mat4>(mat, 4);
    glm::quat q(glmMat);
    
    return compare(result, q);
}

+(BOOL) quatPlus:(vector_float4)v andResult:(vector_float4) result {
    glm::quat q = castQuat(castVector<glm::vec4>(v, 4));
    return compare(result, +q);
}

+(BOOL) quatMinus:(vector_float4)v andResult:(vector_float4) result {
    glm::quat q = castQuat(castVector<glm::vec4>(v, 4));
    return compare(result, -q);
}

+(BOOL) quatAddition:(vector_float4)v1 withQuat:(vector_float4)v2 andResult:(vector_float4) result {
    
    glm::quat q1 = castQuat(castVector<glm::vec4>(v1, 4));
    glm::quat q2 = castQuat(castVector<glm::vec4>(v2, 4));
    return compare(result, q1+q2);
}

+(BOOL) quatMultiplication:(vector_float4)v1 withQuat:(vector_float4)v2 andResult:(vector_float4) result {
    
    glm::quat q1 = castQuat(castVector<glm::vec4>(v1, 4));
    glm::quat q2 = castQuat(castVector<glm::vec4>(v2, 4));
    return compare(result, q1*q2);
}

+(BOOL) quatMultiplication:(vector_float4)v1 withScalar:(float)f andResult:(vector_float4) result {
    glm::quat q1 = castQuat(castVector<glm::vec4>(v1, 4));
    return compare(result, q1*f);
}

+(BOOL) quatMultiplication_2:(vector_float4)v1 withScalar:(float)f andResult:(vector_float4) result {
    glm::quat q1 = castQuat(castVector<glm::vec4>(v1, 4));
    return compare(result, f*q1);
}

+(BOOL) quatMultiplication:(vector_float4)v1 withVec3:(vector_float3)v2 andResult:(vector_float3) result {
    glm::quat q = castQuat(castVector<glm::vec4>(v1, 4));
    glm::vec3 v = castVector<glm::vec3>(v2, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    return isEqual(q*v, glmResult, 0.00000001f);
}

+(BOOL) quatMultiplication_2:(vector_float4)v1 withVec3:(vector_float3)v2 andResult:(vector_float3) result {
    glm::quat q = castQuat(castVector<glm::vec4>(v1, 4));
    glm::vec3 v = castVector<glm::vec3>(v2, 3);
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    return isEqual(v*q, glmResult, 0.00000001f);
}

+(BOOL) quatMultiplication:(vector_float4)v1 withVec4:(vector_float4)v2 andResult:(vector_float4) result {
    glm::quat q = castQuat(castVector<glm::vec4>(v1, 4));
    glm::vec4 v = castVector<glm::vec4>(v2, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    return isEqual(q*v, glmResult, 0.00000001f);
}

+(BOOL) quatMultiplication_2:(vector_float4)v1 withVec4:(vector_float4)v2 andResult:(vector_float4) result {
    glm::quat q = castQuat(castVector<glm::vec4>(v1, 4));
    glm::vec4 v = castVector<glm::vec4>(v2, 4);
    glm::vec4 glmResult = castVector<glm::vec4>(result, 4);
    return isEqual(v*q, glmResult, 0.00000001f);
}

+(BOOL) quatDivision:(vector_float4)v1 withScalar:(float)f andResult:(vector_float4) result {
    
    glm::quat q = castQuat(castVector<glm::vec4>(v1, 4));
    return compare(result, q / f);
}

+(BOOL) quatDot:(vector_float4)v1 withQuat:(vector_float4)v2 andResult:(float) result {
    glm::quat q1 = castQuat(castVector<glm::vec4>(v1, 4));
    glm::quat q2 = castQuat(castVector<glm::vec4>(v2, 4));
    return glm::epsilonEqual(result, dot(q1,q2), 0.00000001f);
}

+(BOOL) quatLength:(vector_float4)v andResult:(float) result {
    glm::quat q = castQuat(castVector<glm::vec4>(v, 4));
    return glm::epsilonEqual(result, glm::length(q), 0.00000001f);
}

+(BOOL) quatInverse:(vector_float4)v andResult:(vector_float4) result {
    glm::quat q = castQuat(castVector<glm::vec4>(v, 4));
    return compare(result, glm::inverse(q));
}

+(BOOL) quatNormalization:(vector_float4) source andResult:(vector_float4) result {
    glm::quat q = castQuat(castVector<glm::vec4>(source, 4));
    
    return compare(result, glm::normalize(q));
}

+(BOOL) quatConjugate:(vector_float4) source andResult:(vector_float4) result {
    glm::quat q = castQuat(castVector<glm::vec4>(source, 4));
    
    return compare(result, glm::conjugate(q));
}

+(BOOL) quatMix:(vector_float4)q1 with:(vector_float4)q2 at:(float)t andResult:(vector_float4) result {
    glm::quat glmQ1 = castQuat(castVector<glm::vec4>(q1, 4));
    glm::quat glmQ2 = castQuat(castVector<glm::vec4>(q2, 4));
    glm::quat glmResult = castQuat(castVector<glm::vec4>(result, 4));
    
    return isEqual(glmResult, glm::mix(glmQ1, glmQ2, t), 0.00000001f);
}

+(BOOL) quatLerp:(vector_float4)q1 with:(vector_float4)q2 at:(float)t andResult:(vector_float4) result {
    glm::quat glmQ1 = castQuat(castVector<glm::vec4>(q1, 4));
    glm::quat glmQ2 = castQuat(castVector<glm::vec4>(q2, 4));
    glm::quat glmResult = castQuat(castVector<glm::vec4>(result, 4));
    
    return isEqual(glmResult, glm::lerp(glmQ1, glmQ2, t), 0.00000001f);
}

+(BOOL) quatSlerp:(vector_float4)q1 with:(vector_float4)q2 at:(float)t andResult:(vector_float4) result {
    glm::quat glmQ1 = castQuat(castVector<glm::vec4>(q1, 4));
    glm::quat glmQ2 = castQuat(castVector<glm::vec4>(q2, 4));
    glm::quat glmResult = castQuat(castVector<glm::vec4>(result, 4));
    
    return isEqual(glmResult, glm::slerp(glmQ1, glmQ2, t), 0.00000001f);
}

+(BOOL) quatRotate:(vector_float4)q withAngle:(float)angle withAxis:(vector_float3)axis andResult:(vector_float4) result {
    glm::quat glmQ = castQuat(castVector<glm::vec4>(q, 4));
    glm::vec3 glmAxis = castVector<glm::vec3>(axis, 3);
    glm::quat glmResult = castQuat(castVector<glm::vec4>(result, 4));

    return isEqual(glmResult, glm::rotate(glmQ, angle, glmAxis), 0.00000001f);
}

+(BOOL) quatEulerAngles:(vector_float4)q withResult:(vector_float3) result {
    glm::quat glmQ = castQuat(castVector<glm::vec4>(q, 4));
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    
    return isEqual(glmResult, glm::eulerAngles(glmQ), 0.00000001f);
}

+(BOOL) quatFloat3x3Cast:(vector_float4)q withResult:(matrix_float3x3) result {
    glm::mat3 glmResult = castMatrix<glm::mat3>(result, 3);
    glm::quat glmQ = castQuat(castVector<glm::vec4>(q, 4));
    
    return isEqualMatrix(glmResult, glm::mat3_cast(glmQ), 0.00000001f);
}

+(BOOL) quatFloat4x4Cast:(vector_float4)q withResult:(matrix_float4x4) result {
    glm::mat4 glmResult = castMatrix<glm::mat4>(result, 4);
    glm::quat glmQ = castQuat(castVector<glm::vec4>(q, 4));
    
    return isEqualMatrix(glmResult, glm::mat4_cast(glmQ), 0.00000001f);
}

+(BOOL) quatAngle:(vector_float4)q withResult:(float) result {
    glm::quat glmQ = castQuat(castVector<glm::vec4>(q, 4));
    return glm::epsilonEqual(result, glm::angle(glmQ), 0.00000001f);
}

+(BOOL) quatAxis:(vector_float4)q withResult:(vector_float3) result {
    glm::quat glmQ = castQuat(castVector<glm::vec4>(q, 4));
    glm::vec3 glmResult = castVector<glm::vec3>(result, 3);
    return isEqual(glmResult, glm::axis(glmQ), 0.00000001f);
}



+ (BOOL) quatInitWithResultDouble:(vector_double4) result {
    
    glm::dquat q;
    
    return compare(result, q);
}

+(BOOL) quatInitWithValuesWDouble:(double) w ValueX:(double) x ValueY:(double) y ValueZ:(double) z AndResult:(vector_double4) result {
    
    glm::dquat q(w, x, y, z);
    return compare(result, q);
}

+(BOOL) quatInitWithQuatWithInitValuesWDouble:(double) w ValueX:(double) x ValueY:(double) y ValueZ:(double) z andResult:(vector_double4) result {
    
    glm::dquat q(w, x, y, z);
    glm::dquat q2(q);
    
    return compare(result, q2);
}

+(BOOL) quatInitWithDouble:(double) s andVec3:(vector_double3) v andResult:(vector_double4) result {
    glm::dvec3 glmV = castVector<glm::dvec3>(v, 3);
    glm::dquat q(s, glmV);
    return compare(result, q);
}

+(BOOL) quatInitWithAngleDouble:(double)angle andAxis:(vector_double3)axis andResult:(vector_double4) result {
    glm::dvec3 glmAxis = castVector<glm::dvec3>(axis, 3);
    glm::dquat glmResult = castQuat(castVector<glm::dvec4>(result, 4));
    
    return isEqual(glmResult, glm::angleAxis(angle, glmAxis), 0.00000001);
}

+(BOOL) quatInitWithEulerAnglesDouble:(vector_double3) angles andResult:(vector_double4) result {
    glm::dvec3 glmAngles = castVector<glm::dvec3>(angles, 3);
    glm::dquat q(glmAngles);
    
    return compare(result, q);
}

+(BOOL) quatInitWithNormalizedAxisDouble:(vector_double3) axis1 withAxis:(vector_double3) axis2 andResult:(vector_double4) result {
    glm::dvec3 glmAxis1 = castVector<glm::dvec3>(axis1, 3);
    glm::dvec3 glmAxis2 = castVector<glm::dvec3>(axis2, 3);
    glm::dquat q(glmAxis1, glmAxis2);
    
    return compare(result, q);
}

+(BOOL) quatInitWithMat3x3Double:(matrix_double3x3) mat andResult:(vector_double4) result {
    glm::dmat3 glmMat = castMatrix<glm::dmat3>(mat, 3);
    glm::dquat q(glmMat);
    
    return compare(result, q);
}

+(BOOL) quatInitWithMat4x4Double:(matrix_double4x4) mat andResult:(vector_double4) result {
    glm::dmat4 glmMat = castMatrix<glm::dmat4>(mat, 4);
    glm::dquat q(glmMat);
    
    return compare(result, q);
}

+(BOOL) quatPlusDouble:(vector_double4)v andResult:(vector_double4) result {
    glm::dquat q = castQuat(castVector<glm::dvec4>(v, 4));
    return compare(result, +q);
}

+(BOOL) quatMinusDouble:(vector_double4)v andResult:(vector_double4) result {
    glm::dquat q = castQuat(castVector<glm::dvec4>(v, 4));
    return compare(result, -q);
}

+(BOOL) quatAdditionDouble:(vector_double4)v1 withQuat:(vector_double4)v2 andResult:(vector_double4) result {
    
    glm::dquat q1 = castQuat(castVector<glm::dvec4>(v1, 4));
    glm::dquat q2 = castQuat(castVector<glm::dvec4>(v2, 4));
    return compare(result, q1+q2);
}

+(BOOL) quatMultiplicationDouble:(vector_double4)v1 withQuat:(vector_double4)v2 andResult:(vector_double4) result {
    
    glm::dquat q1 = castQuat(castVector<glm::dvec4>(v1, 4));
    glm::dquat q2 = castQuat(castVector<glm::dvec4>(v2, 4));
    return compare(result, q1*q2);
}

+(BOOL) quatMultiplicationDouble:(vector_double4)v1 withScalar:(double)f andResult:(vector_double4) result {
    glm::dquat q1 = castQuat(castVector<glm::dvec4>(v1, 4));
    return compare(result, q1*f);
}

+(BOOL) quatMultiplication_2Double:(vector_double4)v1 withScalar:(double)f andResult:(vector_double4) result {
    glm::dquat q1 = castQuat(castVector<glm::dvec4>(v1, 4));
    return compare(result, f*q1);
}

+(BOOL) quatMultiplicationDouble:(vector_double4)v1 withVec3:(vector_double3)v2 andResult:(vector_double3) result {
    glm::dquat q = castQuat(castVector<glm::dvec4>(v1, 4));
    glm::dvec3 v = castVector<glm::dvec3>(v2, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    return isEqual(q*v, glmResult, 0.00000001);
}

+(BOOL) quatMultiplication_2Double:(vector_double4)v1 withVec3:(vector_double3)v2 andResult:(vector_double3) result {
    glm::dquat q = castQuat(castVector<glm::dvec4>(v1, 4));
    glm::dvec3 v = castVector<glm::dvec3>(v2, 3);
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    return isEqual(v*q, glmResult, 0.00000001);
}

+(BOOL) quatMultiplicationDouble:(vector_double4)v1 withVec4:(vector_double4)v2 andResult:(vector_double4) result {
    glm::dquat q = castQuat(castVector<glm::dvec4>(v1, 4));
    glm::dvec4 v = castVector<glm::dvec4>(v2, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    return isEqual(q*v, glmResult, 0.00000001);
}

+(BOOL) quatMultiplication_2Double:(vector_double4)v1 withVec4:(vector_double4)v2 andResult:(vector_double4) result {
    glm::dquat q = castQuat(castVector<glm::dvec4>(v1, 4));
    glm::dvec4 v = castVector<glm::dvec4>(v2, 4);
    glm::dvec4 glmResult = castVector<glm::dvec4>(result, 4);
    return isEqual(v*q, glmResult, 0.00000001);
}

+(BOOL) quatDivisionDouble:(vector_double4)v1 withScalar:(double)f andResult:(vector_double4) result {
    
    glm::dquat q = castQuat(castVector<glm::dvec4>(v1, 4));
    return compare(result, q / f);
}

+(BOOL) quatDotDouble:(vector_double4)v1 withQuat:(vector_double4)v2 andResult:(double) result {
    glm::dquat q1 = castQuat(castVector<glm::dvec4>(v1, 4));
    glm::dquat q2 = castQuat(castVector<glm::dvec4>(v2, 4));
    return glm::epsilonEqual(result, dot(q1,q2), 0.00000001);
}

+(BOOL) quatLengthDouble:(vector_double4)v andResult:(double) result {
    glm::dquat q = castQuat(castVector<glm::dvec4>(v, 4));
    return glm::epsilonEqual(result, glm::length(q), 0.00000001);
}

+(BOOL) quatInverseDouble:(vector_double4)v andResult:(vector_double4) result {
    glm::dquat q = castQuat(castVector<glm::dvec4>(v, 4));
    return compare(result, glm::inverse(q));
}

+(BOOL) quatNormalizationDouble:(vector_double4) source andResult:(vector_double4) result {
    glm::dquat q = castQuat(castVector<glm::dvec4>(source, 4));
    
    return compare(result, glm::normalize(q));
}

+(BOOL) quatConjugateDouble:(vector_double4) source andResult:(vector_double4) result {
    glm::dquat q = castQuat(castVector<glm::dvec4>(source, 4));
    
    return compare(result, glm::conjugate(q));
}

+(BOOL) quatMixDouble:(vector_double4)q1 with:(vector_double4)q2 at:(double)t andResult:(vector_double4) result {
    glm::dquat glmQ1 = castQuat(castVector<glm::dvec4>(q1, 4));
    glm::dquat glmQ2 = castQuat(castVector<glm::dvec4>(q2, 4));
    glm::dquat glmResult = castQuat(castVector<glm::dvec4>(result, 4));
    
    return isEqual(glmResult, glm::mix(glmQ1, glmQ2, t), 0.00000001);
}

+(BOOL) quatLerpDouble:(vector_double4)q1 with:(vector_double4)q2 at:(double)t andResult:(vector_double4) result {
    glm::dquat glmQ1 = castQuat(castVector<glm::dvec4>(q1, 4));
    glm::dquat glmQ2 = castQuat(castVector<glm::dvec4>(q2, 4));
    glm::dquat glmResult = castQuat(castVector<glm::dvec4>(result, 4));
    
    return isEqual(glmResult, glm::lerp(glmQ1, glmQ2, t), 0.00000001);
}

+(BOOL) quatSlerpDouble:(vector_double4)q1 with:(vector_double4)q2 at:(double)t andResult:(vector_double4) result {
    glm::dquat glmQ1 = castQuat(castVector<glm::dvec4>(q1, 4));
    glm::dquat glmQ2 = castQuat(castVector<glm::dvec4>(q2, 4));
    glm::dquat glmResult = castQuat(castVector<glm::dvec4>(result, 4));
    
    return isEqual(glmResult, glm::slerp(glmQ1, glmQ2, t), 0.00000001);
}

+(BOOL) quatRotateDouble:(vector_double4)q withAngle:(double)angle withAxis:(vector_double3)axis andResult:(vector_double4) result {
    glm::dquat glmQ = castQuat(castVector<glm::dvec4>(q, 4));
    glm::dvec3 glmAxis = castVector<glm::dvec3>(axis, 3);
    glm::dquat glmResult = castQuat(castVector<glm::dvec4>(result, 4));
    
    return isEqual(glmResult, glm::rotate(glmQ, angle, glmAxis), 0.00000001);
}

+(BOOL) quatEulerAnglesDouble:(vector_double4)q withResult:(vector_double3) result {
    glm::dquat glmQ = castQuat(castVector<glm::dvec4>(q, 4));
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    
    return isEqual(glmResult, glm::eulerAngles(glmQ), 0.00000001);
}

+(BOOL) quatdouble3x3CastDouble:(vector_double4)q withResult:(matrix_double3x3) result {
    glm::dmat3 glmResult = castMatrix<glm::dmat3>(result, 3);
    glm::dquat glmQ = castQuat(castVector<glm::dvec4>(q, 4));
    
    return isEqualMatrix(glmResult, glm::mat3_cast(glmQ), 0.00000001);
}

+(BOOL) quatdouble4x4CastDouble:(vector_double4)q withResult:(matrix_double4x4) result {
    glm::dmat4 glmResult = castMatrix<glm::dmat4>(result, 4);
    glm::dquat glmQ = castQuat(castVector<glm::dvec4>(q, 4));
    
    return isEqualMatrix(glmResult, glm::mat4_cast(glmQ), 0.00000001);
}

+(BOOL) quatAngleDouble:(vector_double4)q withResult:(double) result {
    glm::dquat glmQ = castQuat(castVector<glm::dvec4>(q, 4));
    return glm::epsilonEqual(result, glm::angle(glmQ), 0.00000001);
}

+(BOOL) quatAxisDouble:(vector_double4)q withResult:(vector_double3) result {
    glm::dquat glmQ = castQuat(castVector<glm::dvec4>(q, 4));
    glm::dvec3 glmResult = castVector<glm::dvec3>(result, 3);
    return isEqual(glmResult, glm::axis(glmQ), 0.00000001);
}

@end