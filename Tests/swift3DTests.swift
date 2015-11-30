//
//  swift3DTests.swift
//  swift3DTests
//
//  Created by Adrian Krupa on 01.11.2015.
//  Copyright © 2015 Adrian Krupa. All rights reserved.
//

import XCTest
@testable import swift3D

class swift_3D_testFract: XCTestCase {
    
    func testFractFloat() {
        let f1 : Float = 4.9
        let f2 : Float = -4.9
        XCTAssert(glm_to_swift.fractFloat(f1, withFractedFloat: fract(f1)))
        XCTAssert(glm_to_swift.fractFloat(f2, withFractedFloat: fract(f2)))
    }
    
    func testFractDouble() {
        let f1 : Double = 4.9
        let f2 : Double = -4.9
        XCTAssert(glm_to_swift.fractDouble(f1, withFractedDouble: fract(f1)))
        XCTAssert(glm_to_swift.fractDouble(f2, withFractedDouble: fract(f2)))
    }
}

class swift_3D_testRound: XCTestCase {
    
    func testRoundFloat2() {
        let f2 = float2(2.2, 2.8)
        let f2Rounded = round(f2)
        XCTAssert(glm_to_swift.roundFloat2(f2, withRoundedFloat2: f2Rounded))
    }
    
    func testRoundFloat3() {
        let f3 = float3(2.2, 2.8, 0.5)
        let f3Rounded = round(f3)
        XCTAssert(glm_to_swift.roundFloat3(f3, withRoundedFloat3: f3Rounded))
    }
    
    func testRoundFloat4() {
        let f4 = float4(2.2, 2.8, 0.5, -1.3)
        let f4Rounded = round(f4)
        XCTAssert(glm_to_swift.roundFloat4(f4, withRoundedFloat4: f4Rounded))
    }
    
    func testRoundDouble2() {
        let f2 = double2(2.2, 2.8)
        let f2Rounded = round(f2)
        XCTAssert(glm_to_swift.roundDouble2(f2, withRoundedDouble2: f2Rounded))
    }
    
    func testRoundDouble3() {
        let f3 = double3(2.2, 2.8, 0.5)
        let f3Rounded = round(f3)
        XCTAssert(glm_to_swift.roundDouble3(f3, withRoundedDouble3: f3Rounded))
    }
    
    func testRoundDouble4() {
        let f4 = double4(2.2, 2.8, 0.5, -1.3)
        let f4Rounded = round(f4)
        XCTAssert(glm_to_swift.roundDouble4(f4, withRoundedDouble4: f4Rounded))
    }
}

class swift_3D_testRoundEven: XCTestCase {
    
    func testRoundEvenFloat() {
        let f1 : Float = 4.5
        let f2 : Float = 4.9
        let f3 : Float = 3.5
        let f4 : Float = 3.1
        XCTAssert(glm_to_swift.roundEvenFloat(f1, withRoundedFloat: roundEven(f1)))
        XCTAssert(glm_to_swift.roundEvenFloat(f2, withRoundedFloat: roundEven(f2)))
        XCTAssert(glm_to_swift.roundEvenFloat(f3, withRoundedFloat: roundEven(f3)))
        XCTAssert(glm_to_swift.roundEvenFloat(f4, withRoundedFloat: roundEven(f4)))
    }
    
    func testRoundEvenFloat2() {
        let f = float2(3.5, 4.5)
        XCTAssert(glm_to_swift.roundEvenFloat2(f, withRoundedFloat2: roundEven(f)))
    }
    
    func testRoundEvenFloat3() {
        let f = float3(3.5, 4.5, 4.9)
        XCTAssert(glm_to_swift.roundEvenFloat3(f, withRoundedFloat3: roundEven(f)))
    }
    
    func testRoundEvenFloat4() {
        let f = float4(3.5, 4.5, 4.9, 3.1)
        XCTAssert(glm_to_swift.roundEvenFloat4(f, withRoundedFloat4: roundEven(f)))
    }
    
    func testRoundEvenDouble() {
        let f1 : Double = 4.5
        let f2 : Double = 4.9
        let f3 : Double = 3.5
        let f4 : Double = 3.1
        XCTAssert(glm_to_swift.roundEvenDouble(f1, withRoundedDouble: roundEven(f1)))
        XCTAssert(glm_to_swift.roundEvenDouble(f2, withRoundedDouble: roundEven(f2)))
        XCTAssert(glm_to_swift.roundEvenDouble(f3, withRoundedDouble: roundEven(f3)))
        XCTAssert(glm_to_swift.roundEvenDouble(f4, withRoundedDouble: roundEven(f4)))
    }
    
    func testRoundEvenDouble2() {
        let f = double2(3.5, 4.5)
        XCTAssert(glm_to_swift.roundEvenDouble2(f, withRoundedDouble2: roundEven(f)))
    }
    
    func testRoundEvenDouble3() {
        let f = double3(3.5, 4.5, 4.9)
        XCTAssert(glm_to_swift.roundEvenDouble3(f, withRoundedDouble3: roundEven(f)))
    }
    
    func testRoundEvenDouble4() {
        let f = double4(3.5, 4.5, 4.9, 3.1)
        XCTAssert(glm_to_swift.roundEvenDouble4(f, withRoundedDouble4: roundEven(f)))
    }
}

class swift_3D_testMod: XCTestCase {
    
    func testModFloatFloat() {
        let x : Float = 3.5
        let y : Float = 1.6
        XCTAssert(glm_to_swift.modFloatX(x, andFloatY: y, withModdedFloat: mod(x,y)))
    }
    
    func testModFloat2Float() {
        let x = float2(3.5, 1.1)
        let y : Float = 1.6
        XCTAssert(glm_to_swift.modFloat2X(x, andFloatY: y, withModdedFloat: mod(x,y)))
    }
    
    func testModFloat3Float() {
        let x = float3(3.5, 1.1, 2.5)
        let y : Float = 1.6
        XCTAssert(glm_to_swift.modFloat3X(x, andFloatY: y, withModdedFloat: mod(x,y)))
    }
    
    func testModFloat4Float() {
        let x = float4(3.5, 1.1, -1.0, 0.0)
        let y : Float = 1.6
        XCTAssert(glm_to_swift.modFloat4X(x, andFloatY: y, withModdedFloat: mod(x,y)))
    }
    
    func testModFloat2Float2() {
        let x = float2(3.5, 1.1)
        let y = float2(1.6, 2.9)
        XCTAssert(glm_to_swift.modFloat2X(x, andFloat2Y: y, withModdedFloat2: mod(x,y)))
    }
    
    func testModFloat3Float3() {
        let x = float3(3.5, 1.1, 2.5)
        let y = float3(1.8, 2.0, 0.3)
        XCTAssert(glm_to_swift.modFloat3X(x, andFloat3Y: y, withModdedFloat3: mod(x,y)))
    }
    
    func testModFloat4Float4() {
        let x = float4(3.5, 1.1, -1.0, 0.0)
        let y = float4(1.2, 3.1, 2.6, 2.5)
        XCTAssert(glm_to_swift.modFloat4X(x, andFloat4Y: y, withModdedFloat4: mod(x,y)))
    }
    
    func testModDoubleDouble() {
        let x : Double = 3.5
        let y : Double = 1.6
        XCTAssert(glm_to_swift.modDoubleX(x, andDoubleY: y, withModdedDouble: mod(x,y)))
    }
    
    func testModDouble2Double() {
        let x = double2(3.5, 1.1)
        let y : Double = 1.6
        XCTAssert(glm_to_swift.modDouble2X(x, andDoubleY: y, withModdedDouble: mod(x,y)))
    }
    
    func testModDouble3Double() {
        let x = double3(3.5, 1.1, 2.5)
        let y : Double = 1.6
        XCTAssert(glm_to_swift.modDouble3X(x, andDoubleY: y, withModdedDouble: mod(x,y)))
    }
    
    func testModDouble4Double() {
        let x = double4(3.5, 1.1, -1.0, 0.0)
        let y : Double = 1.6
        XCTAssert(glm_to_swift.modDouble4X(x, andDoubleY: y, withModdedDouble: mod(x,y)))
    }
    
    func testModDouble2Double2() {
        let x = double2(3.5, 1.1)
        let y = double2(1.6, 2.9)
        XCTAssert(glm_to_swift.modDouble2X(x, andDouble2Y: y, withModdedDouble2: mod(x,y)))
    }
    
    func testModDouble3Double3() {
        let x = double3(3.5, 1.1, 2.5)
        let y = double3(1.8, 2.0, 0.3)
        XCTAssert(glm_to_swift.modDouble3X(x, andDouble3Y: y, withModdedDouble3: mod(x,y)))
    }
    
    func testModDouble4Double4() {
        let x = double4(3.5, 1.1, -1.0, 0.0)
        let y = double4(1.2, 3.1, 2.6, 2.5)
        XCTAssert(glm_to_swift.modDouble4X(x, andDouble4Y: y, withModdedDouble4: mod(x,y)))
    }
}

class swift_3D_testModf: XCTestCase {
    
    func testModfFloat() {
        let f : Float = 1.37
        let (integerPart, fractionalPart) = modf(f)
        XCTAssert(glm_to_swift.modfFloat(f, withIntegerPart: integerPart, andFractionalType: fractionalPart))
    }
    
    func testModfFloat2() {
        let f = float2(1.37, -2.88)
        let (integerPart, fractionalPart) = modf(f)
        XCTAssert(glm_to_swift.modfFloat2(f, withInteger2Part: integerPart, andFractional2Type: fractionalPart))
    }
    
    func testModfFloat3() {
        let f = float3(1.37, -2.88, 0.12)
        let (integerPart, fractionalPart) = modf(f)
        XCTAssert(glm_to_swift.modfFloat3(f, withInteger3Part: integerPart, andFractional3Type: fractionalPart))
    }
    
    func testModfFloat4() {
        let f = float4(1.37, -2.88, 0.15, -0.22)
        let (integerPart, fractionalPart) = modf(f)
        XCTAssert(glm_to_swift.modfFloat4(f, withInteger4Part: integerPart, andFractional4Type: fractionalPart))
    }
    
    func testModfDouble() {
        let f : Double = 1.37
        let (integerPart, fractionalPart) = modf(f)
        XCTAssert(glm_to_swift.modfDouble(f, withIntegerPart: integerPart, andFractionalType: fractionalPart))
    }
    
    func testModfDouble2() {
        let f = double2(1.37, -2.88)
        let (integerPart, fractionalPart) = modf(f)
        XCTAssert(glm_to_swift.modfDouble2(f, withInteger2Part: integerPart, andFractional2Type: fractionalPart))
    }
    
    func testModfDouble3() {
        let f = double3(1.37, -2.88, 0.12)
        let (integerPart, fractionalPart) = modf(f)
        XCTAssert(glm_to_swift.modfDouble3(f, withInteger3Part: integerPart, andFractional3Type: fractionalPart))
    }
    
    func testModfDouble4() {
        let f = double4(1.37, -2.88, 0.15, -0.22)
        let (integerPart, fractionalPart) = modf(f)
        XCTAssert(glm_to_swift.modfDouble4(f, withInteger4Part: integerPart, andFractional4Type: fractionalPart))
    }
}

class swift_3D_testSmoothstep: XCTestCase {
    
    func testSmoothstepFloat() {
        let x : Float = 2.0
        let edge1_1 : Float = 3.0
        let edge2_1 : Float = 4.0
        let edge1_2 : Float = 1.0
        let edge2_2 : Float = 1.5
        let edge1_3 : Float = 1.0
        let edge2_3 : Float = 3.0
        XCTAssert(glm_to_swift.smooothstepFloat(x, withEdge0: edge1_1, andWithEdge1: edge2_1, withSmoothsteppedFloat: smoothstep(x, edge0: edge1_1, edge1: edge2_1)))
        XCTAssert(glm_to_swift.smooothstepFloat(x, withEdge0: edge1_2, andWithEdge1: edge2_2, withSmoothsteppedFloat: smoothstep(x, edge0: edge1_2, edge1: edge2_2)))
        XCTAssert(glm_to_swift.smooothstepFloat(x, withEdge0: edge1_3, andWithEdge1: edge2_3, withSmoothsteppedFloat: smoothstep(x, edge0: edge1_3, edge1: edge2_3)))
    }
    
    func testSmoothstepDouble() {
        let x = 2.0
        let edge1_1 = 3.0
        let edge2_1 = 4.0
        let edge1_2 = 1.0
        let edge2_2 = 1.5
        let edge1_3 = 1.0
        let edge2_3 = 3.0
        XCTAssert(glm_to_swift.smooothstepDouble(x, withEdge0: edge1_1, andWithEdge1: edge2_1, withSmoothsteppedDouble: smoothstep(x, edge0: edge1_1, edge1: edge2_1)))
        XCTAssert(glm_to_swift.smooothstepDouble(x, withEdge0: edge1_2, andWithEdge1: edge2_2, withSmoothsteppedDouble: smoothstep(x, edge0: edge1_2, edge1: edge2_2)))
        XCTAssert(glm_to_swift.smooothstepDouble(x, withEdge0: edge1_3, andWithEdge1: edge2_3, withSmoothsteppedDouble: smoothstep(x, edge0: edge1_3, edge1: edge2_3)))
    }
}

class swift_3D_testFma: XCTestCase {
    
    func testFmaFloat2() {
        let a = float2(1.1, 2.2)
        let b = float2(0.3, 1.9)
        let c = float2(-1.3, 0.0)
        XCTAssert(glm_to_swift.fmaFloat2a(a, andFloat2b: b, andFloat2c: c, withResultFloat2: fma(a,b: b,c: c)))
    }
    
    func testFmaFloat3() {
        let a = float3(1.1, 2.2, -1.8)
        let b = float3(0.3, 1.9, 6.5)
        let c = float3(-1.3, 0.0, 3.3)
        XCTAssert(glm_to_swift.fmaFloat3a(a, andFloat3b: b, andFloat3c: c, withResultFloat3: fma(a,b: b,c: c)))
    }
    
    func testFmaFloat4() {
        let a = float4(1.1, 2.2, -1.3, 2.2)
        let b = float4(0.3, 1.9, 2.9, 0.9)
        let c = float4(-1.3, 0.0, 0.0, 1.2)
        XCTAssert(glm_to_swift.fmaFloat4a(a, andFloat4b: b, andFloat4c: c, withResultFloat4: fma(a,b: b,c: c)))
    }
    
    func testFmaDouble2() {
        let a = double2(1.1, 2.2)
        let b = double2(0.3, 1.9)
        let c = double2(-1.3, 0.0)
        XCTAssert(glm_to_swift.fmaDouble2a(a, andDouble2b: b, andDouble2c: c, withResultDouble2: fma(a,b: b,c: c)))
    }
    
    func testFmaDouble3() {
        let a = double3(1.1, 2.2, -1.8)
        let b = double3(0.3, 1.9, 6.5)
        let c = double3(-1.3, 0.0, 3.3)
        XCTAssert(glm_to_swift.fmaDouble3a(a, andDouble3b: b, andDouble3c: c, withResultDouble3: fma(a,b: b,c: c)))
    }
    
    func testFmaDouble4() {
        let a = double4(1.1, 2.2, -1.3, 2.2)
        let b = double4(0.3, 1.9, 2.9, 0.9)
        let c = double4(-1.3, 0.0, 0.0, 1.2)
        XCTAssert(glm_to_swift.fmaDouble4a(a, andDouble4b: b, andDouble4c: c, withResultDouble4: fma(a,b: b,c: c)))
    }
}

class swift_3D_testFrexp: XCTestCase {
    
    func testFrexpFloat2() {
        let v = float2(1.5, 2.7)
        let r = frexp(v)
        XCTAssert(glm_to_swift.frexp(v, withValFloat2: r.0, andExponent2: r.1))
    }
    
    func testFrexpFloat3() {
        let v = float3(1.5, 2.7, 1.0)
        let r = frexp(v)
        XCTAssert(glm_to_swift.frexp(v, withValFloat3: r.0, andExponent3: r.1))
    }
    
    func testFrexpFloat4() {
        let v = float4(1.5, 2.7, 1.0, -2.5)
        let r = frexp(v)
        XCTAssert(glm_to_swift.frexp(v, withValFloat4: r.0, andExponent4: r.1))
    }
    
    func testFrexpDouble2() {
        let v = double2(1.5, 2.7)
        let r = frexp(v)
        XCTAssert(glm_to_swift.frexp(v, withValDouble2: r.0, andExponent2: r.1))
    }
    
    func testFrexpDouble3() {
        let v = double3(1.5, 2.7, 1.0)
        let r = frexp(v)
        XCTAssert(glm_to_swift.frexp(v, withValDouble3: r.0, andExponent3: r.1))
    }
    
    func testFrexpDouble4() {
        let v = double4(1.5, 2.7, 1.0, -2.5)
        let r = frexp(v)
        XCTAssert(glm_to_swift.frexp(v, withValDouble4: r.0, andExponent4: r.1))
    }
    
}

class swift_3D_testPow: XCTestCase {
    
    func testPowFloat2() {
        let base = float2(1.5, 2.7)
        let exp = float2(1.1, -2.3)
        XCTAssert(glm_to_swift.pow(base, withPowerFloat2: exp, andResult: pow(base, exp)))
    }
    
    func testPowFloat3() {
        let base = float3(1.5, 2.7, 2.5)
        let exp = float3(1.1, -2.3, 0.1)
        XCTAssert(glm_to_swift.pow(base, withPowerFloat3: exp, andResult: pow(base, exp)))
    }
    
    func testPowFloat4() {
        let base = float4(1.5, 2.7, 3.3, 1.0)
        let exp = float4(1.1, -2.3, 0.0, 5.0)
        XCTAssert(glm_to_swift.pow(base, withPowerFloat4: exp, andResult: pow(base, exp)))
    }
    
    func testPowDouble2() {
        let base = double2(1.5, 2.7)
        let exp = double2(1.1, -2.3)
        XCTAssert(glm_to_swift.pow(base, withPowerDouble2: exp, andResult: pow(base, exp)))
    }
    
    func testPowDouble3() {
        let base = double3(1.5, 2.7, 2.5)
        let exp = double3(1.1, -2.3, 0.1)
        XCTAssert(glm_to_swift.pow(base, withPowerDouble3: exp, andResult: pow(base, exp)))
    }
    
    func testPowDouble4() {
        let base = double4(1.5, 2.7, 3.3, 1.0)
        let exp = double4(1.1, -2.3, 0.0, 5.0)
        XCTAssert(glm_to_swift.pow(base, withPowerDouble4: exp, andResult: pow(base, exp)))
    }
}

class swift_3D_testExp: XCTestCase {
    
    func testExpFloat2() {
        let x = float2(1.5, 2.7)
        XCTAssert(glm_to_swift.expFloat2(x, andResult: exp(x)))
    }
    
    func testExpFloat3() {
        let x = float3(1.5, 2.7, 1.0)
        XCTAssert(glm_to_swift.expFloat3(x, andResult: exp(x)))
    }
    
    func testExpFloat4() {
        let x = float4(1.5, 2.7, -1.0, 5.5)
        XCTAssert(glm_to_swift.expFloat4(x, andResult: exp(x)))
    }
    func testExpDouble2() {
        let x = double2(1.5, 2.7)
        XCTAssert(glm_to_swift.expDouble2(x, andResult: exp(x)))
    }
    
    func testExpDouble3() {
        let x = double3(1.5, 2.7, 1.0)
        XCTAssert(glm_to_swift.expDouble3(x, andResult: exp(x)))
    }
    
    func testExpDouble4() {
        let x = double4(1.5, 2.7, -1.0, 5.5)
        XCTAssert(glm_to_swift.expDouble4(x, andResult: exp(x)))
    }
}

class swift_3D_testLog: XCTestCase {
    
    func testLogFloat2() {
        let x = float2(1.5, 2.7)
        XCTAssert(glm_to_swift.logFloat2(x, andResult: log(x)))
    }
    
    func testLogFloat3() {
        let x = float3(1.5, 2.7, 1.0)
        XCTAssert(glm_to_swift.logFloat3(x, andResult: log(x)))
    }
    
    func testLogFloat4() {
        let x = float4(1.5, 2.7, 1.0, 5.5)
        XCTAssert(glm_to_swift.logFloat4(x, andResult: log(x)))
    }
    func testLogDouble2() {
        let x = double2(1.5, 2.7)
        XCTAssert(glm_to_swift.logDouble2(x, andResult: log(x)))
    }
    
    func testLogDouble3() {
        let x = double3(1.5, 2.7, 1.0)
        XCTAssert(glm_to_swift.logDouble3(x, andResult: log(x)))
    }
    
    func testLogDouble4() {
        let x = double4(1.5, 2.7, 1.0, 5.5)
        XCTAssert(glm_to_swift.logDouble4(x, andResult: log(x)))
    }
}

class swift_3D_testExp2: XCTestCase {
    
    func testExp2Float2() {
        let x = float2(1.5, 2.7)
        XCTAssert(glm_to_swift.exp2Float2(x, andResult: exp2(x)))
    }
    
    func testExp2Float3() {
        let x = float3(1.5, 2.7, 1.0)
        XCTAssert(glm_to_swift.exp2Float3(x, andResult: exp2(x)))
    }
    
    func testExp2Float4() {
        let x = float4(1.5, 2.7, -1.0, 5.5)
        XCTAssert(glm_to_swift.exp2Float4(x, andResult: exp2(x)))
    }
    func testExp2Double2() {
        let x = double2(1.5, 2.7)
        XCTAssert(glm_to_swift.exp2Double2(x, andResult: exp2(x)))
    }
    
    func testExp2Double3() {
        let x = double3(1.5, 2.7, 1.0)
        XCTAssert(glm_to_swift.exp2Double3(x, andResult: exp2(x)))
    }
    
    func testExp2Double4() {
        let x = double4(1.5, 2.7, -1.0, 5.5)
        XCTAssert(glm_to_swift.exp2Double4(x, andResult: exp2(x)))
    }
}

class swift_3D_testLog2: XCTestCase {
    
    func testLog2Float2() {
        let x = float2(1.5, 2.7)
        XCTAssert(glm_to_swift.log2Float2(x, andResult: log2(x)))
    }
    
    func testLog2Float3() {
        let x = float3(1.5, 2.7, 1.0)
        XCTAssert(glm_to_swift.log2Float3(x, andResult: log2(x)))
    }
    
    func testLog2Float4() {
        let x = float4(1.5, 2.7, 1.0, 5.5)
        XCTAssert(glm_to_swift.log2Float4(x, andResult: log2(x)))
    }
    func testLog2Double2() {
        let x = double2(1.5, 2.7)
        XCTAssert(glm_to_swift.log2Double2(x, andResult: log2(x)))
    }
    
    func testLog2Double3() {
        let x = double3(1.5, 2.7, 1.0)
        XCTAssert(glm_to_swift.log2Double3(x, andResult: log2(x)))
    }
    
    func testLog2Double4() {
        let x = double4(1.5, 2.7, 1.0, 5.5)
        XCTAssert(glm_to_swift.log2Double4(x, andResult: log2(x)))
    }
}

class swift_3D_testSqrt: XCTestCase {
    
    func testSqrtFloat2() {
        let x = float2(1.5, 2.7)
        XCTAssert(glm_to_swift.sqrtFloat2(x, andResult: sqrt(x)))
    }
    
    func testSqrtFloat3() {
        let x = float3(1.5, 2.7, 1.0)
        XCTAssert(glm_to_swift.sqrtFloat3(x, andResult: sqrt(x)))
    }
    
    func testSqrtFloat4() {
        let x = float4(1.5, 2.7, 1.0, 5.5)
        XCTAssert(glm_to_swift.sqrtFloat4(x, andResult: sqrt(x)))
    }
    func testSqrtDouble2() {
        let x = double2(1.5, 2.7)
        XCTAssert(glm_to_swift.sqrtDouble2(x, andResult: sqrt(x)))
    }
    
    func testSqrtDouble3() {
        let x = double3(1.5, 2.7, 1.0)
        XCTAssert(glm_to_swift.sqrtDouble3(x, andResult: sqrt(x)))
    }
    
    func testSqrtDouble4() {
        let x = double4(1.5, 2.7, 1.0, 5.5)
        XCTAssert(glm_to_swift.sqrtDouble4(x, andResult: sqrt(x)))
    }
}

class swift_3D_testInverseSqrt: XCTestCase {
    
    func testInverseSqrtFloat2() {
        let x = float2(1.5, 2.7)
        XCTAssert(glm_to_swift.inversesqrtFloat2(x, andResult: inversesqrt(x)))
    }
    
    func testInverseSqrtFloat3() {
        let x = float3(1.5, 2.7, 1.0)
        XCTAssert(glm_to_swift.inversesqrtFloat3(x, andResult: inversesqrt(x)))
    }
    
    func testInverseSqrtFloat4() {
        let x = float4(1.5, 2.7, 1.0, 5.5)
        XCTAssert(glm_to_swift.inversesqrtFloat4(x, andResult: inversesqrt(x)))
    }
    func testInverseSqrtDouble2() {
        let x = double2(1.5, 2.7)
        XCTAssert(glm_to_swift.inversesqrtDouble2(x, andResult: inversesqrt(x)))
    }
    
    func testInverseSqrtDouble3() {
        let x = double3(1.5, 2.7, 1.0)
        XCTAssert(glm_to_swift.inversesqrtDouble3(x, andResult: inversesqrt(x)))
    }
    
    func testInverseSqrtDouble4() {
        let x = double4(1.5, 2.7, 1.0, 5.5)
        XCTAssert(glm_to_swift.inversesqrtDouble4(x, andResult: inversesqrt(x)))
    }
}

class swift_3D_testFaceforward: XCTestCase {
    
    func testFaceforwardFloat2() {
        let N = float2(1.5, 2.7)
        let I = float2(2.0, -2.7)
        let Nref = float2(1.0, 1.0)
        
        XCTAssert(glm_to_swift.faceforward(N, withI: I, withNref: Nref, andResultFloat2: faceforward(N, I, Nref)))
    }
    
    func testFaceforwardFloat3() {
        let N = float3(1.5, 2.7, 2.0)
        let I = float3(2.0, -2.7, -8.0)
        let Nref = float3(1.0, 1.0, 6.0)
        
        XCTAssert(glm_to_swift.faceforward(N, withI: I, withNref: Nref, andResultFloat3: faceforward(N, I, Nref)))
    }
    
    func testFaceforwardFloat4() {
        let N = float4(1.5, 2.7, 2.0, -1.3)
        let I = float4(-2.0, 2.7, 8.0, 3.0)
        let Nref = float4(1.0, 1.0, 6.0, -3.4)
        
        XCTAssert(glm_to_swift.faceforward(N, withI: I, withNref: Nref, andResultFloat4: faceforward(N, I, Nref)))
    }
    
    func testFaceforwardDouble2() {
        let N = double2(1.5, 2.7)
        let I = double2(2.0, -2.7)
        let Nref = double2(1.0, 1.0)
        
        XCTAssert(glm_to_swift.faceforward(N, withI: I, withNref: Nref, andResultDouble2: faceforward(N, I, Nref)))
    }
    
    func testFaceforwardDouble3() {
        let N = double3(1.5, 2.7, 2.0)
        let I = double3(2.0, -2.7, -8.0)
        let Nref = double3(1.0, 1.0, 6.0)
        
        XCTAssert(glm_to_swift.faceforward(N, withI: I, withNref: Nref, andResultDouble3: faceforward(N, I, Nref)))
    }
    
    func testFaceforwardDouble4() {
        let N = double4(1.5, 2.7, 2.0, -1.3)
        let I = double4(-2.0, 2.7, 8.0, 3.0)
        let Nref = double4(1.0, 1.0, 6.0, -3.4)
        
        XCTAssert(glm_to_swift.faceforward(N, withI: I, withNref: Nref, andResultDouble4: faceforward(N, I, Nref)))
    }
}

class swift_3D_testDeterminant: XCTestCase {
    
    func testDeterminantFloat2x2() {
        let M = matrix_float2x2(columns: (vector_float2(1,2), vector_float2(-2, 3)))
        XCTAssert(glm_to_swift.determinant(M, andResultFloat2x2: float2x2(M).determinant))
    }
    
    func testDeterminantFloat3x3() {
        let M = matrix_float3x3(columns: (vector_float3(1,2,-3), vector_float3(-2, 3, 0), vector_float3(3, -1, 2)))
        XCTAssert(glm_to_swift.determinant(M, andResultFloat3x3: float3x3(M).determinant))
    }
    
    func testDeterminantFloat4x4() {
        let M = matrix_float4x4(columns: (vector_float4(1,2,-3, 5), vector_float4(-2, 3, 0, 1), vector_float4(3, -1, 2, -6), vector_float4(0, -1, -2, 1)))
        XCTAssert(glm_to_swift.determinant(M, andResultFloat4x4: float4x4(M).determinant))
    }
    
    func testDeterminantDouble2x2() {
        let M = matrix_double2x2(columns: (vector_double2(1,2), vector_double2(-2, 3)))
        XCTAssert(glm_to_swift.determinant(M, andResultDouble2x2: double2x2(M).determinant))
    }
    
    func testDeterminantDouble3x3() {
        let M = matrix_double3x3(columns: (vector_double3(1,2,-3), vector_double3(-2, 3, 0), vector_double3(3, -1, 2)))
        XCTAssert(glm_to_swift.determinant(M, andResultDouble3x3: double3x3(M).determinant))
    }
    
    func testDeterminantDouble4x4() {
        let M = matrix_double4x4(columns: (vector_double4(1,2,-3, 5), vector_double4(-2, 3, 0, 1), vector_double4(3, -1, 2, -6), vector_double4(0, -1, -2, 1)))
        XCTAssert(glm_to_swift.determinant(M, andResultDouble4x4: double4x4(M).determinant))
    }
}

class swift_3D_testRadians: XCTestCase {
    
    func testRadiansFloat() {
        let degrees = Float(180.0)
        XCTAssert(glm_to_swift.radiansFromDegrees(degrees, floatWithResult: radians(degrees)))
    }
    
    func testRadiansFloat2() {
        let degrees = float2(180.0, -90.0)
        XCTAssert(glm_to_swift.radiansFromDegrees(degrees, float2WithResult: radians(degrees)))
    }
    
    func testRadiansFloat3() {
        let degrees = float3(180.0, -90.0, 0.0)
        XCTAssert(glm_to_swift.radiansFromDegrees(degrees, float3WithResult: radians(degrees)))
    }
    
    func testRadiansFloat4() {
        let degrees = float4(180.0, -90.0, -4.5, 200.0)
        XCTAssert(glm_to_swift.radiansFromDegrees(degrees, float4WithResult: radians(degrees)))
    }
    
    func testRadiansDouble() {
        let degrees = Double(180.0)
        XCTAssert(glm_to_swift.radiansFromDegrees(degrees, doubleWithResult: radians(degrees)))
    }
    
    func testRadiansDouble2() {
        let degrees = double2(180.0, -90.0)
        XCTAssert(glm_to_swift.radiansFromDegrees(degrees, double2WithResult: radians(degrees)))
    }
    
    func testRadiansDouble3() {
        let degrees = double3(180.0, -90.0, 0.0)
        XCTAssert(glm_to_swift.radiansFromDegrees(degrees, double3WithResult: radians(degrees)))
    }
    
    func testRadiansDouble4() {
        let degrees = double4(180.0, -90.0, -4.5, 200.0)
        XCTAssert(glm_to_swift.radiansFromDegrees(degrees, double4WithResult: radians(degrees)))
    }
}

class swift_3D_testDegrees: XCTestCase {
    
    func testDegreesFloat() {
        let radians = Float(180.0)
        XCTAssert(glm_to_swift.degreesFromRadians(radians, floatWithResult: degrees(radians)))
    }
    
    func testDegreesFloat2() {
        let radians = float2(180.0, -90.0)
        XCTAssert(glm_to_swift.degreesFromRadians(radians, float2WithResult: degrees(radians)))
    }
    
    func testDegreesFloat3() {
        let radians = float3(180.0, -90.0, 0.0)
        XCTAssert(glm_to_swift.degreesFromRadians(radians, float3WithResult: degrees(radians)))
    }
    
    func testDegreesFloat4() {
        let radians = float4(180.0, -90.0, -4.5, 200.0)
        XCTAssert(glm_to_swift.degreesFromRadians(radians, float4WithResult: degrees(radians)))
    }
    
    func testDegreesDouble() {
        let radians = Double(180.0)
        XCTAssert(glm_to_swift.degreesFromRadians(radians, doubleWithResult: degrees(radians)))
    }
    
    func testDegreesDouble2() {
        let radians = double2(180.0, -90.0)
        XCTAssert(glm_to_swift.degreesFromRadians(radians, double2WithResult: degrees(radians)))
    }
    
    func testDegreesDouble3() {
        let radians = double3(180.0, -90.0, 0.0)
        XCTAssert(glm_to_swift.degreesFromRadians(radians, double3WithResult: degrees(radians)))
    }
    
    func testDegreesDouble4() {
        let radians = double4(180.0, -90.0, -4.5, 200.0)
        XCTAssert(glm_to_swift.degreesFromRadians(radians, double4WithResult: degrees(radians)))
    }
}

class swift_3D_testMatrixTransforms: XCTestCase {
    
    func testTranslateFloat() {
        let M = matrix_float4x4(columns: (vector_float4(1,2,-3, 5), vector_float4(-2, 3, 0, 1), vector_float4(3, -1, 2, -6), vector_float4(0, -1, -2, 1)))
        let V = float3(2, -1, 3)
        let result = translate(float4x4(M), v: V)
        let result2 = matrix_float4x4(columns: (result[0], result[1], result[2], result[3]))
        XCTAssert(glm_to_swift.translateFloat(M, withVector: V, withResult: result2))
    }
    
    func testTranslateDouble() {
        let M = matrix_double4x4(columns: (vector_double4(1,2,-3, 5), vector_double4(-2, 3, 0, 1), vector_double4(3, -1, 2, -6), vector_double4(0, -1, -2, 1)))
        let V = double3(2, -1, 3)
        let result = translate(double4x4(M), v: V)
        let result2 = matrix_double4x4(columns: (result[0], result[1], result[2], result[3]))
        XCTAssert(glm_to_swift.translateDouble(M, withVector: V, withResult: result2))
    }
    
    func testRotateFloat() {
        let M = matrix_float4x4(columns: (vector_float4(1,2,-3, 5), vector_float4(-2, 3, 0, 1), vector_float4(3, -1, 2, -6), vector_float4(0, -1, -2, 1)))
        let angle = Float(M_PI_4)
        let axis = float3(2, 2, 1)
        let result = rotate(float4x4(M), angle: angle, axis: axis)
        let result2 = matrix_float4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.rotateFloat(M, withAngle: angle, withAxis: axis, andResult: result2))
    }
    
    func testRotateDouble() {
        let M = matrix_double4x4(columns: (vector_double4(1,2,-3, 5), vector_double4(-2, 3, 0, 1), vector_double4(3, -1, 2, -6), vector_double4(0, -1, -2, 1)))
        let angle = Double(M_PI_4)
        let axis = double3(2, 2, 1)
        let result = rotate(double4x4(M), angle: angle, axis: axis)
        let result2 = matrix_double4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.rotateDouble(M, withAngle: angle, withAxis: axis, andResult: result2))
    }
    
    func testScaleFloat() {
        let M = matrix_float4x4(columns: (vector_float4(1,2,-3, 5), vector_float4(-2, 3, 0, 1), vector_float4(3, -1, 2, -6), vector_float4(0, -1, -2, 1)))
        let v = float3(3, -2, 1)
        let result = scale(float4x4(M), v: v)
        let result2 = matrix_float4x4(columns: (result[0], result[1], result[2], result[3]))

        XCTAssert(glm_to_swift.scaleFloat(M, withVector: v, andResult: result2))
    }
    
    func testScaleDouble() {
        let M = matrix_double4x4(columns: (vector_double4(1,2,-3, 5), vector_double4(-2, 3, 0, 1), vector_double4(3, -1, 2, -6), vector_double4(0, -1, -2, 1)))
        let v = double3(3, -2, 1)
        let result = scale(double4x4(M), v: v)
        let result2 = matrix_double4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.scaleDouble(M, withVector: v, andResult: result2))
    }
    
    func testOrthoFloat1() {
        let left : Float = -2.3
        let right : Float = 3.5
        let top : Float = 4.4
        let bottom : Float = 2.0
        let zNear : Float = 0.1
        let zFar : Float = 1000
        let result = ortho(left, right: right, bottom: bottom, top: top, zNear: zNear, zFar: zFar)
        let result2 = matrix_float4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.orthoFloat(left, withRight: right, withBottom: bottom, withTop: top, withZNear: zNear, withZFar: zFar, andResult: result2))
    }
    
    func testOrthoFloat2() {
        let left : Float = -2.3
        let right : Float = 3.5
        let top : Float = 4.4
        let bottom : Float = 2.0
        let result = ortho(left, right: right, bottom: bottom, top: top)
        let result2 = matrix_float4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.orthoFloat(left, withRight: right, withBottom: bottom, withTop: top, andResult: result2))
    }
    
    func testOrthoDouble1() {
        let left : Double = -2.3
        let right : Double = 3.5
        let top : Double = 4.4
        let bottom : Double = 2.0
        let zNear : Double = 0.1
        let zFar : Double = 1000
        let result = ortho(left, right: right, bottom: bottom, top: top, zNear: zNear, zFar: zFar)
        let result2 = matrix_double4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.orthoDouble(left, withRight: right, withBottom: bottom, withTop: top, withZNear: zNear, withZFar: zFar, andResult: result2))
    }
    
    func testOrthoDouble2() {
        let left : Double = -2.3
        let right : Double = 3.5
        let top : Double = 4.4
        let bottom : Double = 2.0
        let result = ortho(left, right: right, bottom: bottom, top: top)
        let result2 = matrix_double4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.orthoDouble(left, withRight: right, withBottom: bottom, withTop: top, andResult: result2))
    }
    
    func testFrustumFloat() {
        let left : Float = -2.3
        let right : Float = 3.5
        let top : Float = 4.4
        let bottom : Float = 2.0
        let near : Float = 0.1
        let far : Float = 1000
        let result = frustum(left, right: right, bottom: bottom, top: top, near: near, far: far)
        let result2 = matrix_float4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.frustumFloat(left, withRight: right, withBottom: bottom, withTop: top, withNear: near, withFar: far, andResult: result2))
    }
    
    func testFrustumDouble() {
        let left : Double = -2.3
        let right : Double = 3.5
        let top : Double = 4.4
        let bottom : Double = 2.0
        let near : Double = 0.1
        let far : Double = 1000
        let result = frustum(left, right: right, bottom: bottom, top: top, near: near, far: far)
        let result2 = matrix_double4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.frustumDouble(left, withRight: right, withBottom: bottom, withTop: top, withNear: near, withFar: far, andResult: result2))
    }
    
    func testPerspectiveFloat() {
        let fovy = Float(M_PI_4)
        let aspect = Float(16)/Float(9)
        let zNear = Float(0.1)
        let zFar = Float(100)
        let result = perspective(fovy, aspect: aspect, zNear: zNear, zFar: zFar)
        let result2 = matrix_float4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.perspectiveFloat(fovy, withAspect: aspect, withZNear: zNear, withZFar: zFar, andResult: result2))
    }
    
    func testPerspectiveDouble() {
        let fovy = Double(M_PI_4)
        let aspect = Double(16)/Double(9)
        let zNear = Double(0.1)
        let zFar = Double(100)
        let result = perspective(fovy, aspect: aspect, zNear: zNear, zFar: zFar)
        let result2 = matrix_double4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.perspectiveDouble(fovy, withAspect: aspect, withZNear: zNear, withZFar: zFar, andResult: result2))
    }
    
    func testPerspectiveFovFloat() {
        let fovy = Float(M_PI_4)
        let width = Float(1024)
        let height = Float(768)
        let zNear = Float(0.1)
        let zFar = Float(100)
        let result = perspectiveFov(fovy, width: width, height: height, zNear: zNear, zFar: zFar)
        let result2 = matrix_float4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.perspectiveFovFloat(fovy, withWidth: width, withHeight: height, withZNear: zNear, withZFar: zFar, andResult: result2))
    }
    
    func testPerspectiveFovDouble() {
        let fovy = Double(M_PI_4)
        let width = Double(1024)
        let height = Double(768)
        let zNear = Double(0.1)
        let zFar = Double(100)
        let result = perspectiveFov(fovy, width: width, height: height, zNear: zNear, zFar: zFar)
        let result2 = matrix_double4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.perspectiveFovDouble(fovy, withWidth: width, withHeight: height, withZNear: zNear, withZFar: zFar, andResult: result2))
    }
    
    func testInfinitePerspectiveFloat() {
        let fovy = Float(M_PI_4)
        let aspect = Float(16)/Float(9)
        let zNear = Float(0.1)
        let result = infinitePerspective(fovy, aspect: aspect, zNear: zNear)
        let result2 = matrix_float4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.infinitePerspectiveFloat(fovy, withAspect: aspect, withZNear: zNear, andResult: result2))
    }
    
    func testInfinitePerspectiveDouble() {
        let fovy = Double(M_PI_4)
        let aspect = Double(16)/Double(9)
        let zNear = Double(0.1)
        let result = infinitePerspective(fovy, aspect: aspect, zNear: zNear)
        let result2 = matrix_double4x4(columns: (result[0], result[1], result[2], result[3]))
        
        XCTAssert(glm_to_swift.infinitePerspectiveDouble(fovy, withAspect: aspect, withZNear: zNear, andResult: result2))
    }
    
    func testLookAtFloat() {
        let center = float3(0.5, 2, -3.1)
        let eye = float3(10, 12, -3)
        let up = float3(0,0,1)
        let result = lookAt(eye, center: center, up: up)
        let result2 = matrix_float4x4(columns: (result[0], result[1], result[2], result[3]))
        XCTAssert(glm_to_swift.lookAtFloat(eye, withCenter: center, withUp: up, andResult: result2))
    }
    
    func testLookAtDouble() {
        let center = double3(0.5, 2, -3.1)
        let eye = double3(10, 12, -3)
        let up = double3(0,0,1)
        let result = lookAt(eye, center: center, up: up)
        let result2 = matrix_double4x4(columns: (result[0], result[1], result[2], result[3]))
        XCTAssert(glm_to_swift.lookAtDouble(eye, withCenter: center, withUp: up, andResult: result2))
    }
}

// TODO: sin cos tests

