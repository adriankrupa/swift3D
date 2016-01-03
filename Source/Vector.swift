//
// Created by Adrian Krupa on 30.11.2015.
// Copyright (c) 2015 Adrian Krupa. All rights reserved.
//

import Foundation
import simd

public extension float3 {
    
    public init(_ v: float4) {
        self.init(v.x, v.y, v.z)
    }
}

public extension float4 {
    
    public init(_ v: float3, _ vw: Float) {
        self.init()
        x = v.x
        y = v.y
        z = v.z
        w = vw
    }
    
    public init(_ v: float3) {
        self.init()
        x = v.x
        y = v.y
        z = v.z
        w = 0
    }
    
    public init(_ q: quat) {
        self.init()
        x = q.x
        y = q.y
        z = q.z
        w = q.w
    }
}

public extension double3 {
    
    public init(_ v: double4) {
        self.init(v.x, v.y, v.z)
    }
}

public extension double4 {
    
    public init(_ v: double3, _ vw: Double) {
        self.init()
        x = v.x
        y = v.y
        z = v.z
        w = vw
    }
    
    public init(_ v: double3) {
        self.init()
        x = v.x
        y = v.y
        z = v.z
        w = 0
    }
    
    public init(_ q: dquat) {
        self.init()
        x = q.x
        y = q.y
        z = q.z
        w = q.w
    }
}

public func ==(a: float4, b: float4) -> Bool {
    for i in 0..<4 {
        if(a[i] != b[i]) {
            return false
        }
    }
    return true
}

public func !=(a: float4, b: float4) -> Bool {
    return !(a==b)
}

public func ==(a: float3, b: float3) -> Bool {
    for i in 0..<3 {
        if(a[i] != b[i]) {
            return false
        }
    }
    return true
}

public func !=(a: float3, b: float3) -> Bool {
    return !(a==b)
}

public func ==(a: float2, b: float2) -> Bool {
    for i in 0..<2 {
        if(a[i] != b[i]) {
            return false
        }
    }
    return true
}

public func !=(a: float2, b: float2) -> Bool {
    return !(a==b)
}

public func ==(a: double4, b: double4) -> Bool {
    for i in 0..<4 {
        if(a[i] != b[i]) {
            return false
        }
    }
    return true
}

public func !=(a: double4, b: double4) -> Bool {
    return !(a==b)
}

public func ==(a: double3, b: double3) -> Bool {
    for i in 0..<3 {
        if(a[i] != b[i]) {
            return false
        }
    }
    return true
}

public func !=(a: double3, b: double3) -> Bool {
    return !(a==b)
}

public func ==(a: double2, b: double2) -> Bool {
    for i in 0..<2 {
        if(a[i] != b[i]) {
            return false
        }
    }
    return true
}

public func !=(a: double2, b: double2) -> Bool {
    return !(a==b)
}