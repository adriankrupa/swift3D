//
//  swift3DQuaterionTests.swift
//  swift3D
//
//  Created by Adrian Krupa on 02.01.2016.
//  Copyright © 2016 Adrian Krupa. All rights reserved.
//

import XCTest
@testable import swift3D

class swift_3D_testQuaterionFloat: XCTestCase {
    
    func testQuaternionEmptyConstructor() {
        let q = quat()
        XCTAssert(glm_to_swift_quat.quatInitWithResult(float4(q)))
    }
    
    func testQuaternionValuesConstructor() {
        let w: Float = 0.3
        let x: Float = 2.2
        let y: Float = 1.7
        let z: Float = 2.5
        let q = quat(w, x, y, z)
        XCTAssert(glm_to_swift_quat.quatInitWithValuesW(w, valueX: x, valueY: y, valueZ: z, andResult: float4(q)))
    }
    
    func testQuaternionSandV3() {
        let s: Float = 0.5
        let v = float3(0.2, 0.5, 2.2)
        let q = quat(w: s, v: v)
        XCTAssert(glm_to_swift_quat.quatInitWithFloat(s, andVec3: v, andResult: float4(q)))
    }
    
    func testQuaternionInitAngleAxis() {
        let angle: Float = Float(M_PI_4)
        let v = normalize(float3(0.2, 0.5, 2.2))
        let q = quat(angle: angle, axis: v)
        XCTAssert(glm_to_swift_quat.quatInitWithAngle(angle, andAxis: v, andResult: float4(q)))
    }
    
    func testQuaternionQuaternionConstructor() {
        let w: Float = 0.3
        let x: Float = 2.2
        let y: Float = 1.7
        let z: Float = 2.5
        let q = quat(w, x, y, z)
        let q2 = quat(q)
        XCTAssert(glm_to_swift_quat.quatInitWithQuatWithInitValuesW(w, valueX: x, valueY: y, valueZ: z, andResult: float4(q2)))
    }
    
    func testQuaternionInitEulerAngles() {
        let angle = float3(-2.5, 33.213, 12.2)
        let q = quat(angle)
        
        XCTAssert(glm_to_swift_quat.quatInitWithEulerAngles(angle, andResult: float4(q)))
    }
    
    func testQuaternionNormalizedAxis() {
        let axis1 = normalize(float3(2.2, 12.6, -3.4))
        let axis2 = normalize(float3(13.4, -2.6, 0.003))
        
        let q = quat(axis1, axis2)
        XCTAssert(glm_to_swift_quat.quatInitWithNormalizedAxis(axis1, withAxis: axis2, andResult: float4(q)))
    }
    
    func testQuaternionMatrix3x3() {
        let m = float3x3([float3(3.3, -3, 2.8), float3(1.6, -12.7, 3.8), float3(6.123, 9.99, 0.0003)])
        let q = quat(m)
        let m2 = matrix_float3x3(columns: (m[0], m[1], m[2]))
        XCTAssert(glm_to_swift_quat.quatInitWithMat3x3(m2, andResult: float4(q)))
    }
    
    func testQuaternionMatrix4x4() {
        let m = float4x4([float4(3.3, -3, 2.8, 5.64532), float4(1.6, -12.7, 3.8, -3.45), float4(6.123, 9.99, 0.0003, 222.4322), float4(-11, -22, 345.23, 12.1)])
        let q = quat(m)
        let m2 = matrix_float4x4(columns: (m[0], m[1], m[2], m[3]))
        XCTAssert(glm_to_swift_quat.quatInitWithMat4x4(m2, andResult: float4(q)))
    }
    
    func testQuaternionPlus() {
        let q = quat(0.00001, -0.0001, 2.3, -5.6)
        XCTAssert(glm_to_swift_quat.quatPlus(float4(q), andResult: float4(+q)))
    }
    
    func testQuaternionMinus() {
        let q = quat(0.00001, -0.0001, 2.3, -5.6)
        XCTAssert(glm_to_swift_quat.quatMinus(float4(q), andResult: float4(-q)))
    }
    
    func testQuaternionAddition() {
        let q1 = quat(1,2,3,4)
        let q2 = quat(5,6,7,8)
        XCTAssert(glm_to_swift_quat.quatAddition(float4(q1), withQuat: float4(q2), andResult: float4(q1+q2)))
        
        let q3 = quat(0.5, 2.3, 5.6, -2.01)
        let q4 = quat(0.00001, -0.0001, 2.3, -5.6)
        XCTAssert(glm_to_swift_quat.quatAddition(float4(q3), withQuat: float4(q4), andResult: float4(q3+q4)))
    }
    
    func testQuaternionMultiplication() {
        let q1 = quat(1,2,3,4)
        let q2 = quat(5,6,7,8)
        XCTAssert(glm_to_swift_quat.quatMultiplication(float4(q1), withQuat: float4(q2), andResult: float4(q1*q2)))
        
        let q3 = quat(0.5, 2.3, 5.6, -2.01)
        let q4 = quat(0.00001, -0.0001, 2.3, -5.6)
        XCTAssert(glm_to_swift_quat.quatMultiplication(float4(q3), withQuat: float4(q4), andResult: float4(q3*q4)))
    }
    
    func testQuaternionMultiplicationScalar() {
        let q = quat(0.5, 2.3, 5.6, -2.01)
        let v = Float(3.4)
        XCTAssert(glm_to_swift_quat.quatMultiplication(float4(q), withScalar: v, andResult: float4(q*v)))
    }
    
    func testQuaternionMultiplicationScalar_2() {
        let q = quat(0.5, 2.3, 5.6, -2.01)
        let v = Float(3.4)
        XCTAssert(glm_to_swift_quat.quatMultiplication_2(float4(q), withScalar: v, andResult: float4(v*q)))
    }
    
    func testQuaternionMultiplicationFloat3() {
        let q = quat(0.5, 2.3, 5.6, -2.01)
        let v = float3(3.4, -3.9, 233)
        XCTAssert(glm_to_swift_quat.quatMultiplication(float4(q), withVec3: v, andResult: q*v))
    }
    
    func testQuaternionMultiplicationFloat3_2() {
        let q = quat(0.5, 2.3, 5.6, -2.01)
        let v = float3(3.4, -3.9, 233)
        XCTAssert(glm_to_swift_quat.quatMultiplication_2(float4(q), withVec3: v, andResult: v*q))
    }
    
    func testQuaternionMultiplicationFloat4() {
        let q = quat(0.5, 2.3, 5.6, -2.01)
        let v = float4(3.4, -3.9, 233, -0.123)
        XCTAssert(glm_to_swift_quat.quatMultiplication(float4(q), withVec4: v, andResult: q*v))
    }
    
    func testQuaternionMultiplicationFloat4_2() {
        let q = quat(0.5, 2.3, 5.6, -2.01)
        let v = float4(3.4, -3.9, 233, -0.123)
        XCTAssert(glm_to_swift_quat.quatMultiplication_2(float4(q), withVec4: v, andResult: v*q))
    }
    
    func testQuaternionDivision() {
        let q1 = quat(1,2,3,4)
        let v1 = Float(3)
        XCTAssert(glm_to_swift_quat.quatDivision(float4(q1), withScalar: v1, andResult: float4(q1/v1)))
        
        let q2 = quat(0.5, 2.3, 5.6, -2.01)
        let v2 = Float(-0.3332)
        XCTAssert(glm_to_swift_quat.quatDivision(float4(q2), withScalar: v2, andResult: float4(q2/v2)))
    }
    
    func testQuaternionDot() {
        let q1 = quat(0.5, 2.3, 5.6, -2.01)
        let q2 = quat(0.00001, -0.0001, 2.3, -5.6)
        XCTAssert(glm_to_swift_quat.quatDot(float4(q1), withQuat: float4(q2), andResult: dot(q1,q2)))
    }
    
    func testQuaternionLength() {
        let q = quat(0.5, 2.3, 5.6, -2.01)
        XCTAssert(glm_to_swift_quat.quatLength(float4(q), andResult: length(q)))
    }
    
    func testQuaternionInverse() {
        let q = quat(0.5, 2.3, 5.6, -2.01)
        XCTAssert(glm_to_swift_quat.quatInverse(float4(q), andResult: float4(inverse(q))))
    }
    
    func testQuaterionNormalization() {
        let q = quat(3.3, 12.4, -3.111, 6.00003)
        
        XCTAssert(glm_to_swift_quat.quatNormalization(float4(q), andResult: float4(normalize(q))))
    }
    
    func testQuaternionConjugate() {
        let q = quat(3.3, 12.4, -3.111, 6.00003)
        
        XCTAssert(glm_to_swift_quat.quatConjugate(float4(q), andResult: float4(conjugate(q))))
    }
    
    func testQuaternionMix() {
        let q1 = normalize(quat(3.3, 12.4, -3.111, 6.00003))
        let q2 = normalize(quat(0.00001, -0.0001, 2.3, -5.6))
        
        XCTAssert(glm_to_swift_quat.quatMix(float4(q1), with: float4(q2), at: 0, andResult: float4(mix(q1, q2, Float(0)))))
        XCTAssert(glm_to_swift_quat.quatMix(float4(q1), with: float4(q2), at: 0.33, andResult: float4(mix(q1, q2, Float(0.33)))))
        XCTAssert(glm_to_swift_quat.quatMix(float4(q1), with: float4(q2), at: 0.67, andResult: float4(mix(q1, q2, Float(0.67)))))
        XCTAssert(glm_to_swift_quat.quatMix(float4(q1), with: float4(q2), at: 1, andResult: float4(mix(q1, q2, Float(1)))))
        
        let q3 = normalize(quat(3.3, 12.4, -3.1, 6))
        let q4 = normalize(quat(3.3, 12.4, -3.1, 6))
        
        XCTAssert(glm_to_swift_quat.quatMix(float4(q3), with: float4(q4), at: 0, andResult: float4(mix(q3, q4, Float(0)))))
        XCTAssert(glm_to_swift_quat.quatMix(float4(q3), with: float4(q4), at: 0.33, andResult: float4(mix(q3, q3, Float(0.33)))))
        XCTAssert(glm_to_swift_quat.quatMix(float4(q3), with: float4(q4), at: 0.67, andResult: float4(mix(q3, q3, Float(0.67)))))
        XCTAssert(glm_to_swift_quat.quatMix(float4(q3), with: float4(q4), at: 1, andResult: float4(mix(q3, q4, Float(1)))))
    }
    
    func testQuaternionLerp() {
        let q1 = normalize(quat(3.3, 12.4, -3.111, 6.00003))
        let q2 = normalize(quat(0.00001, -0.0001, 2.3, -5.6))
        
        XCTAssert(glm_to_swift_quat.quatLerp(float4(q1), with: float4(q2), at: 0, andResult: float4(lerp(q1, q2, Float(0)))))
        XCTAssert(glm_to_swift_quat.quatLerp(float4(q1), with: float4(q2), at: 0.33, andResult: float4(lerp(q1, q2, Float(0.33)))))
        XCTAssert(glm_to_swift_quat.quatLerp(float4(q1), with: float4(q2), at: 0.67, andResult: float4(lerp(q1, q2, Float(0.67)))))
        XCTAssert(glm_to_swift_quat.quatLerp(float4(q1), with: float4(q2), at: 1, andResult: float4(lerp(q1, q2, Float(1)))))
        
        let q3 = normalize(quat(3.3, 12.4, -3.1, 6))
        let q4 = normalize(quat(3.3, 12.4, -3.1, 6))
        
        XCTAssert(glm_to_swift_quat.quatLerp(float4(q3), with: float4(q4), at: 0, andResult: float4(lerp(q3, q4, Float(0)))))
        XCTAssert(glm_to_swift_quat.quatLerp(float4(q3), with: float4(q4), at: 0.33, andResult: float4(lerp(q3, q3, Float(0.33)))))
        XCTAssert(glm_to_swift_quat.quatLerp(float4(q3), with: float4(q4), at: 0.67, andResult: float4(lerp(q3, q3, Float(0.67)))))
        XCTAssert(glm_to_swift_quat.quatLerp(float4(q3), with: float4(q4), at: 1, andResult: float4(lerp(q3, q4, Float(1)))))
    }
    
    func testQuaternionSlerp() {
        let q1 = normalize(quat(3.3, 12.4, -3.111, 6.00003))
        let q2 = normalize(quat(0.00001, -0.0001, 2.3, -5.6))
        
        XCTAssert(glm_to_swift_quat.quatSlerp(float4(q1), with: float4(q2), at: 0, andResult: float4(slerp(q1, q2, Float(0)))))
        XCTAssert(glm_to_swift_quat.quatSlerp(float4(q1), with: float4(q2), at: 0.33, andResult: float4(slerp(q1, q2, Float(0.33)))))
        XCTAssert(glm_to_swift_quat.quatSlerp(float4(q1), with: float4(q2), at: 0.67, andResult: float4(slerp(q1, q2, Float(0.67)))))
        XCTAssert(glm_to_swift_quat.quatSlerp(float4(q1), with: float4(q2), at: 1, andResult: float4(slerp(q1, q2, Float(1)))))
        
        let q3 = normalize(quat(3.3, 12.4, -3.1, 6))
        let q4 = normalize(quat(3.3, 12.4, -3.1, 6))
        
        XCTAssert(glm_to_swift_quat.quatSlerp(float4(q3), with: float4(q4), at: 0, andResult: float4(slerp(q3, q4, Float(0)))))
        XCTAssert(glm_to_swift_quat.quatSlerp(float4(q3), with: float4(q4), at: 0.33, andResult: float4(slerp(q3, q3, Float(0.33)))))
        XCTAssert(glm_to_swift_quat.quatSlerp(float4(q3), with: float4(q4), at: 0.67, andResult: float4(slerp(q3, q3, Float(0.67)))))
        XCTAssert(glm_to_swift_quat.quatSlerp(float4(q3), with: float4(q4), at: 1, andResult: float4(slerp(q3, q4, Float(1)))))
    }
    
    func testQuaternionRotate() {
        let q1 = quat()
        let axis1 = float3(0, 0, 1)
        let angle1 = Float(M_PI_2)
        XCTAssert(glm_to_swift_quat.quatRotate(float4(q1), withAngle: angle1, withAxis: axis1, andResult: float4(rotate(q1, angle: angle1, axis: axis1))))
        
        let q2 = normalize(quat(0.5, -0.5, -3, 6))
        let axis2 = float3(-0.33, 5.5, -1)
        let angle2 = Float(M_PI)
        XCTAssert(glm_to_swift_quat.quatRotate(float4(q2), withAngle: angle2, withAxis: axis2, andResult: float4(rotate(q2, angle: angle2, axis: axis2))))
        
        let q3 = normalize(quat(0.5, 0.5, 3, 6))
        let axis3 = normalize(float3(-0.33, 0.5, 1))
        let angle3 = Float(M_PI_4)
        XCTAssert(glm_to_swift_quat.quatRotate(float4(q3), withAngle: angle3, withAxis: axis3, andResult: float4(rotate(q3, angle: angle3, axis: axis3))))
    }
    
    func testQuaternionEulerAngles() {
        let q = normalize(quat(3.3, 12.4, -3.111, 6.00003))
        XCTAssert(glm_to_swift_quat.quatEulerAngles(float4(q), withResult: eulerAngles(q)))
    }
    
    func testQuaternionFloat3x3Cast() {
        let q = normalize(quat(3.3, 12.4, -3.111, 6.00003))
        let m = float3x3_cast(q)
        let m2 = matrix_float3x3(columns: (m[0], m[1], m[2]))
        XCTAssert(glm_to_swift_quat.quatFloat3x3Cast(float4(q), withResult: m2))
    }
    
    func testQuaternionFloat4x4Cast() {
        let q = normalize(quat(3.3, 12.4, -3.111, 6.00003))
        let m = float4x4_cast(q)
        let m2 = matrix_float4x4(columns: (m[0], m[1], m[2], m[3]))
        XCTAssert(glm_to_swift_quat.quatFloat4x4Cast(float4(q), withResult: m2))
    }
    
    func testQuaternionAxis() {
        let q = normalize(quat(3.3, 12.4, -3.111, 6.00003))
        XCTAssert(glm_to_swift_quat.quatAxis(float4(q), withResult: axis(q)))
    }
    
    func testQuaternionAngle() {
        let q = normalize(quat(3.3, 12.4, -3.111, 6.00003))
        XCTAssert(glm_to_swift_quat.quatAngle(float4(q), withResult: angle(q)))
    }
}

class swift_3D_testQuaterionDouble: XCTestCase {
    
    func testQuaternionEmptyConstructor() {
        let q = dquat()
        XCTAssert(glm_to_swift_quat.quatInitWithResultDouble(double4(q)))
    }
    
    func testQuaternionValuesConstructor() {
        let w: Double = 0.3
        let x: Double = 2.2
        let y: Double = 1.7
        let z: Double = 2.5
        let q = dquat(w, x, y, z)
        XCTAssert(glm_to_swift_quat.quatInitWithValuesWDouble(w, valueX: x, valueY: y, valueZ: z, andResult: double4(q)))
    }
    
    func testQuaternionSandV3() {
        let s: Double = 0.5
        let v = double3(0.2, 0.5, 2.2)
        let q = dquat(w: s, v: v)
        XCTAssert(glm_to_swift_quat.quatInitWithDouble(s, andVec3: v, andResult: double4(q)))
    }
    
    func testQuaternionInitAngleAxis() {
        let angle: Double = Double(M_PI_4)
        let v = normalize(double3(0.2, 0.5, 2.2))
        let q = dquat(angle: angle, axis: v)
        XCTAssert(glm_to_swift_quat.quatInitWithAngleDouble(angle, andAxis: v, andResult: double4(q)))
    }
    
    func testQuaternionQuaternionConstructor() {
        let w: Double = 0.3
        let x: Double = 2.2
        let y: Double = 1.7
        let z: Double = 2.5
        let q = dquat(w, x, y, z)
        let q2 = dquat(q)
        XCTAssert(glm_to_swift_quat.quatInitWithQuatWithInitValuesWDouble(w, valueX: x, valueY: y, valueZ: z, andResult: double4(q2)))
    }
    
    func testQuaternionInitEulerAngles() {
        let angle = double3(-2.5, 33.213, 12.2)
        let q = dquat(angle)
        
        XCTAssert(glm_to_swift_quat.quatInitWithEulerAnglesDouble(angle, andResult: double4(q)))
    }
    
    func testQuaternionNormalizedAxis() {
        let axis1 = normalize(double3(2.2, 12.6, -3.4))
        let axis2 = normalize(double3(13.4, -2.6, 0.003))
        
        let q = dquat(axis1, axis2)
        XCTAssert(glm_to_swift_quat.quatInitWithNormalizedAxisDouble(axis1, withAxis: axis2, andResult: double4(q)))
    }
    
    func testQuaternionMatrix3x3() {
        let m = double3x3([double3(3.3, -3, 2.8), double3(1.6, -12.7, 3.8), double3(6.123, 9.99, 0.0003)])
        let q = dquat(m)
        let m2 = matrix_double3x3(columns: (m[0], m[1], m[2]))
        XCTAssert(glm_to_swift_quat.quatInitWithMat3x3Double(m2, andResult: double4(q)))
    }
    
    func testQuaternionMatrix4x4() {
        let m = double4x4([double4(3.3, -3, 2.8, 5.64532), double4(1.6, -12.7, 3.8, -3.45), double4(6.123, 9.99, 0.0003, 222.4322), double4(-11, -22, 345.23, 12.1)])
        let q = dquat(m)
        let m2 = matrix_double4x4(columns: (m[0], m[1], m[2], m[3]))
        XCTAssert(glm_to_swift_quat.quatInitWithMat4x4Double(m2, andResult: double4(q)))
    }
    
    func testQuaternionPlus() {
        let q = dquat(0.00001, -0.0001, 2.3, -5.6)
        XCTAssert(glm_to_swift_quat.quatPlusDouble(double4(q), andResult: double4(+q)))
    }
    
    func testQuaternionMinus() {
        let q = dquat(0.00001, -0.0001, 2.3, -5.6)
        XCTAssert(glm_to_swift_quat.quatMinusDouble(double4(q), andResult: double4(-q)))
    }
    
    func testQuaternionAddition() {
        let q1 = dquat(1,2,3,4)
        let q2 = dquat(5,6,7,8)
        XCTAssert(glm_to_swift_quat.quatAdditionDouble(double4(q1), withQuat: double4(q2), andResult: double4(q1+q2)))
        
        let q3 = dquat(0.5, 2.3, 5.6, -2.01)
        let q4 = dquat(0.00001, -0.0001, 2.3, -5.6)
        XCTAssert(glm_to_swift_quat.quatAdditionDouble(double4(q3), withQuat: double4(q4), andResult: double4(q3+q4)))
    }
    
    func testQuaternionMultiplication() {
        let q1 = dquat(1,2,3,4)
        let q2 = dquat(5,6,7,8)
        XCTAssert(glm_to_swift_quat.quatMultiplicationDouble(double4(q1), withQuat: double4(q2), andResult: double4(q1*q2)))
        
        let q3 = dquat(0.5, 2.3, 5.6, -2.01)
        let q4 = dquat(0.00001, -0.0001, 2.3, -5.6)
        XCTAssert(glm_to_swift_quat.quatMultiplicationDouble(double4(q3), withQuat: double4(q4), andResult: double4(q3*q4)))
    }
    
    func testQuaternionMultiplicationScalar() {
        let q = dquat(0.5, 2.3, 5.6, -2.01)
        let v = Double(3.4)
        XCTAssert(glm_to_swift_quat.quatMultiplicationDouble(double4(q), withScalar: v, andResult: double4(q*v)))
    }
    
    func testQuaternionMultiplicationScalar_2() {
        let q = dquat(0.5, 2.3, 5.6, -2.01)
        let v = Double(3.4)
        XCTAssert(glm_to_swift_quat.quatMultiplication_2Double(double4(q), withScalar: v, andResult: double4(v*q)))
    }
    
    func testQuaternionMultiplicationdouble3() {
        let q = dquat(0.5, 2.3, 5.6, -2.01)
        let v = double3(3.4, -3.9, 233)
        XCTAssert(glm_to_swift_quat.quatMultiplicationDouble(double4(q), withVec3: v, andResult: q*v))
    }
    
    func testQuaternionMultiplicationdouble3_2() {
        let q = dquat(0.5, 2.3, 5.6, -2.01)
        let v = double3(3.4, -3.9, 233)
        XCTAssert(glm_to_swift_quat.quatMultiplication_2Double(double4(q), withVec3: v, andResult: v*q))
    }
    
    func testQuaternionMultiplicationdouble4() {
        let q = dquat(0.5, 2.3, 5.6, -2.01)
        let v = double4(3.4, -3.9, 233, -0.123)
        XCTAssert(glm_to_swift_quat.quatMultiplicationDouble(double4(q), withVec4: v, andResult: q*v))
    }
    
    func testQuaternionMultiplicationdouble4_2() {
        let q = dquat(0.5, 2.3, 5.6, -2.01)
        let v = double4(3.4, -3.9, 233, -0.123)
        XCTAssert(glm_to_swift_quat.quatMultiplication_2Double(double4(q), withVec4: v, andResult: v*q))
    }
    
    func testQuaternionDivision() {
        let q1 = dquat(1,2,3,4)
        let v1 = Double(3)
        XCTAssert(glm_to_swift_quat.quatDivisionDouble(double4(q1), withScalar: v1, andResult: double4(q1/v1)))
        
        let q2 = dquat(0.5, 2.3, 5.6, -2.01)
        let v2 = Double(-0.3332)
        XCTAssert(glm_to_swift_quat.quatDivisionDouble(double4(q2), withScalar: v2, andResult: double4(q2/v2)))
    }
    
    func testQuaternionDot() {
        let q1 = dquat(0.5, 2.3, 5.6, -2.01)
        let q2 = dquat(0.00001, -0.0001, 2.3, -5.6)
        XCTAssert(glm_to_swift_quat.quatDotDouble(double4(q1), withQuat: double4(q2), andResult: dot(q1,q2)))
    }
    
    func testQuaternionLength() {
        let q = dquat(0.5, 2.3, 5.6, -2.01)
        XCTAssert(glm_to_swift_quat.quatLengthDouble(double4(q), andResult: length(q)))
    }
    
    func testQuaternionInverse() {
        let q = dquat(0.5, 2.3, 5.6, -2.01)
        XCTAssert(glm_to_swift_quat.quatInverseDouble(double4(q), andResult: double4(inverse(q))))
    }
    
    func testQuaterionNormalization() {
        let q = dquat(3.3, 12.4, -3.111, 6.00003)
        
        XCTAssert(glm_to_swift_quat.quatNormalizationDouble(double4(q), andResult: double4(normalize(q))))
    }
    
    func testQuaternionConjugate() {
        let q = dquat(3.3, 12.4, -3.111, 6.00003)
        
        XCTAssert(glm_to_swift_quat.quatConjugateDouble(double4(q), andResult: double4(conjugate(q))))
    }
    
    func testQuaternionMix() {
        let q1 = normalize(dquat(3.3, 12.4, -3.111, 6.00003))
        let q2 = normalize(dquat(0.00001, -0.0001, 2.3, -5.6))
        
        XCTAssert(glm_to_swift_quat.quatMixDouble(double4(q1), with: double4(q2), at: 0, andResult: double4(mix(q1, q2, Double(0)))))
        XCTAssert(glm_to_swift_quat.quatMixDouble(double4(q1), with: double4(q2), at: 0.33, andResult: double4(mix(q1, q2, Double(0.33)))))
        XCTAssert(glm_to_swift_quat.quatMixDouble(double4(q1), with: double4(q2), at: 0.67, andResult: double4(mix(q1, q2, Double(0.67)))))
        XCTAssert(glm_to_swift_quat.quatMixDouble(double4(q1), with: double4(q2), at: 1, andResult: double4(mix(q1, q2, Double(1)))))
        
        let q3 = normalize(dquat(3.3, 12.4, -3.1, 6))
        let q4 = normalize(dquat(3.3, 12.4, -3.1, 6))
        
        XCTAssert(glm_to_swift_quat.quatMixDouble(double4(q3), with: double4(q4), at: 0, andResult: double4(mix(q3, q4, Double(0)))))
        XCTAssert(glm_to_swift_quat.quatMixDouble(double4(q3), with: double4(q4), at: 0.33, andResult: double4(mix(q3, q3, Double(0.33)))))
        XCTAssert(glm_to_swift_quat.quatMixDouble(double4(q3), with: double4(q4), at: 0.67, andResult: double4(mix(q3, q3, Double(0.67)))))
        XCTAssert(glm_to_swift_quat.quatMixDouble(double4(q3), with: double4(q4), at: 1, andResult: double4(mix(q3, q4, Double(1)))))
    }
    
    func testQuaternionLerp() {
        let q1 = normalize(dquat(3.3, 12.4, -3.111, 6.00003))
        let q2 = normalize(dquat(0.00001, -0.0001, 2.3, -5.6))
        
        XCTAssert(glm_to_swift_quat.quatLerpDouble(double4(q1), with: double4(q2), at: 0, andResult: double4(lerp(q1, q2, Double(0)))))
        XCTAssert(glm_to_swift_quat.quatLerpDouble(double4(q1), with: double4(q2), at: 0.33, andResult: double4(lerp(q1, q2, Double(0.33)))))
        XCTAssert(glm_to_swift_quat.quatLerpDouble(double4(q1), with: double4(q2), at: 0.67, andResult: double4(lerp(q1, q2, Double(0.67)))))
        XCTAssert(glm_to_swift_quat.quatLerpDouble(double4(q1), with: double4(q2), at: 1, andResult: double4(lerp(q1, q2, Double(1)))))
        
        let q3 = normalize(dquat(3.3, 12.4, -3.1, 6))
        let q4 = normalize(dquat(3.3, 12.4, -3.1, 6))
        
        XCTAssert(glm_to_swift_quat.quatLerpDouble(double4(q3), with: double4(q4), at: 0, andResult: double4(lerp(q3, q4, Double(0)))))
        XCTAssert(glm_to_swift_quat.quatLerpDouble(double4(q3), with: double4(q4), at: 0.33, andResult: double4(lerp(q3, q3, Double(0.33)))))
        XCTAssert(glm_to_swift_quat.quatLerpDouble(double4(q3), with: double4(q4), at: 0.67, andResult: double4(lerp(q3, q3, Double(0.67)))))
        XCTAssert(glm_to_swift_quat.quatLerpDouble(double4(q3), with: double4(q4), at: 1, andResult: double4(lerp(q3, q4, Double(1)))))
    }
    
    func testQuaternionSlerp() {
        let q1 = normalize(dquat(3.3, 12.4, -3.111, 6.00003))
        let q2 = normalize(dquat(0.00001, -0.0001, 2.3, -5.6))
        
        XCTAssert(glm_to_swift_quat.quatSlerpDouble(double4(q1), with: double4(q2), at: 0, andResult: double4(slerp(q1, q2, Double(0)))))
        XCTAssert(glm_to_swift_quat.quatSlerpDouble(double4(q1), with: double4(q2), at: 0.33, andResult: double4(slerp(q1, q2, Double(0.33)))))
        XCTAssert(glm_to_swift_quat.quatSlerpDouble(double4(q1), with: double4(q2), at: 0.67, andResult: double4(slerp(q1, q2, Double(0.67)))))
        XCTAssert(glm_to_swift_quat.quatSlerpDouble(double4(q1), with: double4(q2), at: 1, andResult: double4(slerp(q1, q2, Double(1)))))
        
        let q3 = normalize(dquat(3.3, 12.4, -3.1, 6))
        let q4 = normalize(dquat(3.3, 12.4, -3.1, 6))
        
        XCTAssert(glm_to_swift_quat.quatSlerpDouble(double4(q3), with: double4(q4), at: 0, andResult: double4(slerp(q3, q4, Double(0)))))
        XCTAssert(glm_to_swift_quat.quatSlerpDouble(double4(q3), with: double4(q4), at: 0.33, andResult: double4(slerp(q3, q3, Double(0.33)))))
        XCTAssert(glm_to_swift_quat.quatSlerpDouble(double4(q3), with: double4(q4), at: 0.67, andResult: double4(slerp(q3, q3, Double(0.67)))))
        XCTAssert(glm_to_swift_quat.quatSlerpDouble(double4(q3), with: double4(q4), at: 1, andResult: double4(slerp(q3, q4, Double(1)))))
    }
    
    func testQuaternionRotate() {
        let q1 = dquat()
        let axis1 = double3(0, 0, 1)
        let angle1 = Double(M_PI_2)
        XCTAssert(glm_to_swift_quat.quatRotateDouble(double4(q1), withAngle: angle1, withAxis: axis1, andResult: double4(rotate(q1, angle: angle1, axis: axis1))))
        
        let q2 = normalize(dquat(0.5, -0.5, -3, 6))
        let axis2 = double3(-0.33, 5.5, -1)
        let angle2 = Double(M_PI)
        XCTAssert(glm_to_swift_quat.quatRotateDouble(double4(q2), withAngle: angle2, withAxis: axis2, andResult: double4(rotate(q2, angle: angle2, axis: axis2))))
        
        let q3 = normalize(dquat(0.5, 0.5, 3, 6))
        let axis3 = normalize(double3(-0.33, 0.5, 1))
        let angle3 = Double(M_PI_4)
        XCTAssert(glm_to_swift_quat.quatRotateDouble(double4(q3), withAngle: angle3, withAxis: axis3, andResult: double4(rotate(q3, angle: angle3, axis: axis3))))
    }
    
    func testQuaternionEulerAngles() {
        let q = normalize(dquat(3.3, 12.4, -3.111, 6.00003))
        XCTAssert(glm_to_swift_quat.quatEulerAnglesDouble(double4(q), withResult: eulerAngles(q)))
    }
    
    func testQuaterniondouble3x3Cast() {
        let q = normalize(dquat(3.3, 12.4, -3.111, 6.00003))
        let m = double3x3_cast(q)
        let m2 = matrix_double3x3(columns: (m[0], m[1], m[2]))
        XCTAssert(glm_to_swift_quat.quatdouble3x3CastDouble(double4(q), withResult: m2))
    }
    
    func testQuaterniondouble4x4Cast() {
        let q = normalize(dquat(3.3, 12.4, -3.111, 6.00003))
        let m = double4x4_cast(q)
        let m2 = matrix_double4x4(columns: (m[0], m[1], m[2], m[3]))
        XCTAssert(glm_to_swift_quat.quatdouble4x4CastDouble(double4(q), withResult: m2))
    }
    
    func testQuaternionAxis() {
        let q = normalize(dquat(3.3, 12.4, -3.111, 6.00003))
        XCTAssert(glm_to_swift_quat.quatAxisDouble(double4(q), withResult: axis(q)))
    }
    
    func testQuaternionAngle() {
        let q = normalize(dquat(3.3, 12.4, -3.111, 6.00003))
        XCTAssert(glm_to_swift_quat.quatAngleDouble(double4(q), withResult: angle(q)))
    }
}