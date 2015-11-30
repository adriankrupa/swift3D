//
//  Matrix_Transform.swift
//  swift3D
//
//  Created by Adrian Krupa on 26.11.2015.
//  Copyright © 2015 Adrian Krupa. All rights reserved.
//

import Foundation
import simd

/// Builds a translation 4 * 4 matrix created from a vector of 3 components.
@warn_unused_result
func translate(m: float4x4, v: float3) -> float4x4 {
    var result = m
    let vv = float4(v.x, v.y, v.z, 1)
    result[3] = m * vv
    return result
}

/// Builds a translation 4 * 4 matrix created from a vector of 3 components.
@warn_unused_result
func translate(m: double4x4, v: double3) -> double4x4 {
    var result = m
    let vv = double4(v.x, v.y, v.z, 1)
    result[3] = m * vv
    return result
}

/// Builds a rotation 4 * 4 matrix created from an axis vector and an angle.
@warn_unused_result
func rotate(m: float4x4, angle: Float, axis: float3) -> float4x4 {

    let a = angle
    let c = cos(a)
    let s = sin(a)
    
    let v = normalize(axis)
    let temp = (1 - c) * v
    
    var Rotate = float4x4(0)
    Rotate[0][0] = c + temp[0] * v[0]
    Rotate[0][1] = 0 + temp[0] * v[1] + s * v[2]
    Rotate[0][2] = 0 + temp[0] * v[2] - s * v[1]
    
    Rotate[1][0] = 0 + temp[1] * v[0] - s * v[2]
    Rotate[1][1] = c + temp[1] * v[1]
    Rotate[1][2] = 0 + temp[1] * v[2] + s * v[0]
    
    Rotate[2][0] = 0 + temp[2] * v[0] + s * v[1]
    Rotate[2][1] = 0 + temp[2] * v[1] - s * v[0]
    Rotate[2][2] = c + temp[2] * v[2]
    
    var Result = float4x4(0)
    Result[0] = m[0] * Rotate[0][0] + m[1] * Rotate[0][1] + m[2] * Rotate[0][2]
    Result[1] = m[0] * Rotate[1][0] + m[1] * Rotate[1][1] + m[2] * Rotate[1][2]
    Result[2] = m[0] * Rotate[2][0] + m[1] * Rotate[2][1] + m[2] * Rotate[2][2]
    Result[3] = m[3]
    return Result
}

/// Builds a rotation 4 * 4 matrix created from an axis vector and an angle.
@warn_unused_result
func rotate(m: double4x4, angle: Double, axis: double3) -> double4x4 {
    
    let a = angle
    let c = cos(a)
    let s = sin(a)
    
    let v = normalize(axis)
    let temp = (1 - c) * v
    
    var Rotate = double4x4(0)
    Rotate[0][0] = c + temp[0] * v[0]
    Rotate[0][1] = 0 + temp[0] * v[1] + s * v[2]
    Rotate[0][2] = 0 + temp[0] * v[2] - s * v[1]
    
    Rotate[1][0] = 0 + temp[1] * v[0] - s * v[2]
    Rotate[1][1] = c + temp[1] * v[1]
    Rotate[1][2] = 0 + temp[1] * v[2] + s * v[0]
    
    Rotate[2][0] = 0 + temp[2] * v[0] + s * v[1]
    Rotate[2][1] = 0 + temp[2] * v[1] - s * v[0]
    Rotate[2][2] = c + temp[2] * v[2]
    
    var Result = double4x4(0)
    Result[0] = m[0] * Rotate[0][0] + m[1] * Rotate[0][1] + m[2] * Rotate[0][2]
    Result[1] = m[0] * Rotate[1][0] + m[1] * Rotate[1][1] + m[2] * Rotate[1][2]
    Result[2] = m[0] * Rotate[2][0] + m[1] * Rotate[2][1] + m[2] * Rotate[2][2]
    Result[3] = m[3]
    return Result
}

/// Builds a scale 4 * 4 matrix created from 3 scalars.
@warn_unused_result
func scale(m: float4x4, v: float3) -> float4x4 {
    var Result = float4x4(0)
    Result[0] = m[0] * v[0];
    Result[1] = m[1] * v[1];
    Result[2] = m[2] * v[2];
    Result[3] = m[3];
    return Result;
}

/// Builds a scale 4 * 4 matrix created from 3 scalars.
@warn_unused_result
func scale(m: double4x4, v: double3) -> double4x4 {
    var Result = double4x4(0)
    Result[0] = m[0] * v[0];
    Result[1] = m[1] * v[1];
    Result[2] = m[2] * v[2];
    Result[3] = m[3];
    return Result;
}

/// Creates a matrix for an orthographic parallel viewing volume.
@warn_unused_result
func ortho(left: Float, right: Float, bottom: Float, top: Float, zNear: Float, zFar: Float) -> float4x4 {
    var Result = float4x4(1)
    Result[0][0] = Float(2) / (right - left)
    Result[1][1] = Float(2) / (top - bottom)
    Result[2][2] = -Float(2) / (zFar - zNear)
    Result[3][0] = -(right + left) / (right - left)
    Result[3][1] = -(top + bottom) / (top - bottom)
    Result[3][2] = -(zFar + zNear) / (zFar - zNear)
    return Result
}

/// Creates a matrix for projecting two-dimensional coordinates onto the screen.
@warn_unused_result
func ortho(left: Float, right: Float, bottom: Float, top: Float) -> float4x4 {
    var Result = float4x4(1)
    Result[0][0] = Float(2) / (right - left)
    Result[1][1] = Float(2) / (top - bottom)
    Result[2][2] = -Float(1)
    Result[3][0] = -(right + left) / (right - left)
    Result[3][1] = -(top + bottom) / (top - bottom)
    return Result
}

/// Creates a matrix for an orthographic parallel viewing volume.
@warn_unused_result
func ortho(left: Double, right: Double, bottom: Double, top: Double, zNear: Double, zFar: Double) -> double4x4 {
    var Result = double4x4(1)
    Result[0][0] = Double(2) / (right - left)
    Result[1][1] = Double(2) / (top - bottom)
    Result[2][2] = -Double(2) / (zFar - zNear)
    Result[3][0] = -(right + left) / (right - left)
    Result[3][1] = -(top + bottom) / (top - bottom)
    Result[3][2] = -(zFar + zNear) / (zFar - zNear)
    return Result
}

/// Creates a matrix for projecting two-dimensional coordinates onto the screen.
@warn_unused_result
func ortho(left: Double, right: Double, bottom: Double, top: Double) -> double4x4 {
    var Result = double4x4(1)
    Result[0][0] = Double(2) / (right - left)
    Result[1][1] = Double(2) / (top - bottom)
    Result[2][2] = -Double(1)
    Result[3][0] = -(right + left) / (right - left)
    Result[3][1] = -(top + bottom) / (top - bottom)
    return Result
}

/// Creates a frustum matrix.
@warn_unused_result
func frustum(left: Float, right: Float, bottom: Float, top: Float, near: Float, far: Float) -> float4x4 {
    var Result = float4x4(0)
    Result[0][0] = (Float(2) * near) / (right - left)
    Result[1][1] = (Float(2) * near) / (top - bottom)
    Result[2][0] = (right + left) / (right - left)
    Result[2][1] = (top + bottom) / (top - bottom)
    Result[2][2] = -(far + near) / (far - near)
    Result[2][3] = Float(-1)
    Result[3][2] = -(Float(2) * far * near) / (far - near)
    return Result
}

/// Creates a frustum matrix.
@warn_unused_result
func frustum(left: Double, right: Double, bottom: Double, top: Double, near: Double, far: Double) -> double4x4 {
    var Result = double4x4(0)
    Result[0][0] = (Double(2) * near) / (right - left)
    Result[1][1] = (Double(2) * near) / (top - bottom)
    Result[2][0] = (right + left) / (right - left)
    Result[2][1] = (top + bottom) / (top - bottom)
    Result[2][2] = -(far + near) / (far - near)
    Result[2][3] = Double(-1)
    Result[3][2] = -(Double(2) * far * near) / (far - near)
    return Result
}

/// Creates a matrix for a symetric perspective-view.
@warn_unused_result
func perspective(fovy: Float, aspect: Float, zNear: Float, zFar: Float) -> float4x4 {
    
    assert(abs(aspect) > Float(0), "")
    
    let tanHalfFovy = tan(fovy / Float(2))
    
    var Result = float4x4(0)
    Result[0][0] = Float(1) / (aspect * tanHalfFovy)
    Result[1][1] = Float(1) / (tanHalfFovy)
    Result[2][2] = -(zFar + zNear) / (zFar - zNear)
    Result[2][3] = -Float(1)
    Result[3][2] = -(Float(2) * zFar * zNear) / (zFar - zNear)
    return Result
}

/// Creates a matrix for a symetric perspective-view.
@warn_unused_result
func perspective(fovy: Double, aspect: Double, zNear: Double, zFar: Double) -> double4x4 {
    
    assert(abs(aspect) > Double(0), "")
    
    let tanHalfFovy = tan(fovy / Double(2))
    
    var Result = double4x4(0)
    Result[0][0] = Double(1) / (aspect * tanHalfFovy)
    Result[1][1] = Double(1) / (tanHalfFovy)
    Result[2][2] = -(zFar + zNear) / (zFar - zNear)
    Result[2][3] = -Double(1)
    Result[3][2] = -(Double(2) * zFar * zNear) / (zFar - zNear)
    return Result
}

/// Builds a perspective projection matrix based on a field of view.
@warn_unused_result
func perspectiveFov(fov: Float, width: Float, height: Float, zNear: Float, zFar: Float) -> float4x4 {
    assert(width > Float(0))
    assert(height > Float(0))
    assert(fov > Float(0))
    
    let rad = fov
    let h = cos(Float(0.5) * rad) / sin(Float(0.5) * rad)
    let w = h * height / width
    
    var Result = float4x4(0)
    Result[0][0] = w
    Result[1][1] = h
    Result[2][2] = -(zFar + zNear) / (zFar - zNear)
    Result[2][3] = -Float(1)
    Result[3][2] = -(Float(2) * zFar * zNear) / (zFar - zNear)
    return Result;
}

/// Builds a perspective projection matrix based on a field of view.
@warn_unused_result
func perspectiveFov(fov: Double, width: Double, height: Double, zNear: Double, zFar: Double) -> double4x4 {
    assert(width > Double(0))
    assert(height > Double(0))
    assert(fov > Double(0))
    
    let rad = fov
    let h = cos(Double(0.5) * rad) / sin(Double(0.5) * rad)
    let w = h * height / width
    
    var Result = double4x4(0)
    Result[0][0] = w
    Result[1][1] = h
    Result[2][2] = -(zFar + zNear) / (zFar - zNear)
    Result[2][3] = -Double(1)
    Result[3][2] = -(Double(2) * zFar * zNear) / (zFar - zNear)
    return Result;
}

/// Creates a matrix for a symmetric perspective-view frustum with far plane at infinite.
@warn_unused_result
func infinitePerspective(fovy : Float, aspect: Float, zNear : Float) -> float4x4 {
    let range = tan(fovy / Float(2)) * zNear;
    let left = -range * aspect;
    let right = range * aspect;
    let bottom = -range;
    let top = range;
    
    var Result = float4x4(0)
    Result[0][0] = (Float(2) * zNear) / (right - left);
    Result[1][1] = (Float(2) * zNear) / (top - bottom);
    Result[2][2] = -Float(1);
    Result[2][3] = -Float(1);
    Result[3][2] = -Float(2) * zNear;
    return Result;
}

/// Creates a matrix for a symmetric perspective-view frustum with far plane at infinite.
@warn_unused_result
func infinitePerspective(fovy : Double, aspect: Double, zNear : Double) -> double4x4 {
    let range = tan(fovy / Double(2)) * zNear;
    let left = -range * aspect;
    let right = range * aspect;
    let bottom = -range;
    let top = range;
    
    var Result = double4x4(0)
    Result[0][0] = (Double(2) * zNear) / (right - left);
    Result[1][1] = (Double(2) * zNear) / (top - bottom);
    Result[2][2] = -Double(1);
    Result[2][3] = -Double(1);
    Result[3][2] = -Double(2) * zNear;
    return Result;
}

/// Build a look at view matrix.
@warn_unused_result
func lookAt(eye: float3, center: float3, up: float3) -> float4x4 {
    
    let f = normalize(center - eye);
    let s = normalize(cross(f, up));
    let u = cross(s, f);
    
    var Result = float4x4(1);
    Result[0][0] = s.x;
    Result[1][0] = s.y;
    Result[2][0] = s.z;
    Result[0][1] = u.x;
    Result[1][1] = u.y;
    Result[2][1] = u.z;
    Result[0][2] = -f.x;
    Result[1][2] = -f.y;
    Result[2][2] = -f.z;
    Result[3][0] = -dot(s, eye);
    Result[3][1] = -dot(u, eye);
    Result[3][2] = dot(f, eye);
    return Result
}

/// Build a look at view matrix.
@warn_unused_result
func lookAt(eye: double3, center: double3, up: double3) -> double4x4 {
    
    let f = normalize(center - eye);
    let s = normalize(cross(f, up));
    let u = cross(s, f);
    
    var Result = double4x4(1);
    Result[0][0] = s.x;
    Result[1][0] = s.y;
    Result[2][0] = s.z;
    Result[0][1] = u.x;
    Result[1][1] = u.y;
    Result[2][1] = u.z;
    Result[0][2] = -f.x;
    Result[1][2] = -f.y;
    Result[2][2] = -f.z;
    Result[3][0] = -dot(s, eye);
    Result[3][1] = -dot(u, eye);
    Result[3][2] = dot(f, eye);
    return Result
}


