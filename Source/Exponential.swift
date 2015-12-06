//
//  File.swift
//  swift3D
//
//  Created by Adrian Krupa on 14.11.2015.
//  Copyright © 2015 Adrian Krupa. All rights reserved.
//

import Foundation
import simd

// MARK: pow

/// Returns 'base' raised to the power 'exp'.
@warn_unused_result
public func pow(base: float2, _ exp: float2) -> float2 {
    return float2(pow(base[0], exp[0]), pow(base[1], exp[1]))
}

/// Returns 'base' raised to the power 'exp'.
@warn_unused_result
public func pow(base: float3, _ exp: float3) -> float3 {
    return float3(pow(base[0], exp[0]), pow(base[1], exp[1]), pow(base[2], exp[2]))
}

/// Returns 'base' raised to the power 'exp'.
@warn_unused_result
public func pow(base: float4, _ exp: float4) -> float4 {
    return float4(pow(base[0], exp[0]), pow(base[1], exp[1]), pow(base[2], exp[2]), pow(base[3], exp[3]))
}

/// Returns 'base' raised to the power 'exp'.
@warn_unused_result
public func pow(base: double2, _ exp: double2) -> double2 {
    return double2(pow(base[0], exp[0]), pow(base[1], exp[1]))
}

/// Returns 'base' raised to the power 'exp'.
@warn_unused_result
public func pow(base: double3, _ exp: double3) -> double3 {
    return double3(pow(base[0], exp[0]), pow(base[1], exp[1]), pow(base[2], exp[2]))
}

/// Returns 'base' raised to the power 'exp'.
@warn_unused_result
public func pow(base: double4, _ exp: double4) -> double4 {
    return double4(pow(base[0], exp[0]), pow(base[1], exp[1]), pow(base[2], exp[2]), pow(base[3], exp[3]))
}

// MARK: exp

/// Returns the natural exponentiation of x, i.e., e^x.
@warn_unused_result
public func exp(x: float2) -> float2 {
    return float2(exp(x[0]), exp(x[1]))
}

/// Returns the natural exponentiation of x, i.e., e^x.
@warn_unused_result
public func exp(x: float3) -> float3 {
    return float3(exp(x[0]), exp(x[1]), exp(x[2]))
}

/// Returns the natural exponentiation of x, i.e., e^x.
@warn_unused_result
public func exp(x: float4) -> float4 {
    return float4(exp(x[0]), exp(x[1]), exp(x[2]), exp(x[3]))
}

/// Returns the natural exponentiation of x, i.e., e^x.
@warn_unused_result
public func exp(x: double2) -> double2 {
    return double2(exp(x[0]), exp(x[1]))
}

/// Returns the natural exponentiation of x, i.e., e^x.
@warn_unused_result
public func exp(x: double3) -> double3 {
    return double3(exp(x[0]), exp(x[1]), exp(x[2]))
}

/// Returns the natural exponentiation of x, i.e., e^x.
@warn_unused_result
public func exp(x: double4) -> double4 {
    return double4(exp(x[0]), exp(x[1]), exp(x[2]), exp(x[3]))
}

// MARK: log

/// Returns the natural logarithm of v, i.e.,
/// Returns the value y which satisfies the equation x = e^y.
/// Results are undefined if v <= 0.
@warn_unused_result
public func log(v: float2) -> float2 {
    return float2(log(v[0]), log(v[1]))
}

/// Returns the natural logarithm of v, i.e.,
/// Returns the value y which satisfies the equation x = e^y.
/// Results are undefined if v <= 0.
@warn_unused_result
public func log(v: float3) -> float3 {
    return float3(log(v[0]), log(v[1]), log(v[2]))
}

/// Returns the natural logarithm of v, i.e.,
/// Returns the value y which satisfies the equation x = e^y.
/// Results are undefined if v <= 0.
@warn_unused_result
public func log(v: float4) -> float4 {
    return float4(log(v[0]), log(v[1]), log(v[2]), log(v[3]))
}

/// Returns the natural logarithm of v, i.e.,
/// Returns the value y which satisfies the equation x = e^y.
/// Results are undefined if v <= 0.
@warn_unused_result
public func log(v: double2) -> double2 {
    return double2(log(v[0]), log(v[1]))
}

/// Returns the natural logarithm of v, i.e.,
/// Returns the value y which satisfies the equation x = e^y.
/// Results are undefined if v <= 0.
@warn_unused_result
public func log(v: double3) -> double3 {
    return double3(log(v[0]), log(v[1]), log(v[2]))
}

/// Returns the natural logarithm of v, i.e.,
/// Returns the value y which satisfies the equation x = e^y.
/// Results are undefined if v <= 0.
@warn_unused_result
public func log(v: double4) -> double4 {
    return double4(log(v[0]), log(v[1]), log(v[2]), log(v[3]))
}

// MARK: exp2

/// Returns 2 raised to the v power.
@warn_unused_result
public func exp2(v: float2) -> float2 {
    return float2(exp2(v[0]), exp2(v[1]))
}

/// Returns 2 raised to the v power.
@warn_unused_result
public func exp2(v: float3) -> float3 {
    return float3(exp2(v[0]), exp2(v[1]), exp2(v[2]))
}

/// Returns 2 raised to the v power.
@warn_unused_result
public func exp2(v: float4) -> float4 {
    return float4(exp2(v[0]), exp2(v[1]), exp2(v[2]), exp2(v[3]))
}

/// Returns 2 raised to the v power.
@warn_unused_result
public func exp2(v: double2) -> double2 {
    return double2(exp2(v[0]), exp2(v[1]))
}

/// Returns 2 raised to the v power.
@warn_unused_result
public func exp2(v: double3) -> double3 {
    return double3(exp2(v[0]), exp2(v[1]), exp2(v[2]))
}

/// Returns 2 raised to the v power.
@warn_unused_result
public func exp2(v: double4) -> double4 {
    return double4(exp2(v[0]), exp2(v[1]), exp2(v[2]), exp2(v[3]))
}

// MARK: log2

/// Returns the base 2 log of x, i.e., returns the value y,
/// which satisfies the equation x = 2 ^ y.
@warn_unused_result
public func log2(x: float2) -> float2 {
    return float2(log2(x[0]), log2(x[1]))
}

/// Returns the base 2 log of x, i.e., returns the value y,
/// which satisfies the equation x = 2 ^ y.
@warn_unused_result
public func log2(x: float3) -> float3 {
    return float3(log2(x[0]), log2(x[1]), log2(x[2]))
}

/// Returns the base 2 log of x, i.e., returns the value y,
/// which satisfies the equation x = 2 ^ y.
@warn_unused_result
public func log2(x: float4) -> float4 {
    return float4(log2(x[0]), log2(x[1]), log2(x[2]), log2(x[3]))
}

/// Returns the base 2 log of x, i.e., returns the value y,
/// which satisfies the equation x = 2 ^ y.
@warn_unused_result
public func log2(x: double2) -> double2 {
    return double2(log2(x[0]), log2(x[1]))
}

/// Returns the base 2 log of x, i.e., returns the value y,
/// which satisfies the equation x = 2 ^ y.
@warn_unused_result
public func log2(x: double3) -> double3 {
    return double3(log2(x[0]), log2(x[1]), log2(x[2]))
}

/// Returns the base 2 log of x, i.e., returns the value y,
/// which satisfies the equation x = 2 ^ y.
@warn_unused_result
public func log2(x: double4) -> double4 {
    return double4(log2(x[0]), log2(x[1]), log2(x[2]), log2(x[3]))
}

// MARK: sqrt

/// Returns the positive square root of v.
@warn_unused_result
public func sqrt(v: float2) -> float2 {
    return float2(sqrt(v[0]), sqrt(v[1]))
}

/// Returns the positive square root of v.
@warn_unused_result
public func sqrt(v: float3) -> float3 {
    return float3(sqrt(v[0]), sqrt(v[1]), sqrt(v[2]))
}

/// Returns the positive square root of v.
@warn_unused_result
public func sqrt(v: float4) -> float4 {
    return float4(sqrt(v[0]), sqrt(v[1]), sqrt(v[2]), sqrt(v[3]))
}

/// Returns the positive square root of v.
@warn_unused_result
public func sqrt(v: double2) -> double2 {
    return double2(sqrt(v[0]), sqrt(v[1]))
}

/// Returns the positive square root of v.
@warn_unused_result
public func sqrt(v: double3) -> double3 {
    return double3(sqrt(v[0]), sqrt(v[1]), sqrt(v[2]))
}

/// Returns the positive square root of v.
@warn_unused_result
public func sqrt(v: double4) -> double4 {
    return double4(sqrt(v[0]), sqrt(v[1]), sqrt(v[2]), sqrt(v[3]))
}

// MARK: inversesqrt

/// Returns the reciprocal of the positive square root of v.
@warn_unused_result
public func inversesqrt(v: float2) -> float2 {
    return float2(1) / sqrt(v)
}

/// Returns the reciprocal of the positive square root of v.
@warn_unused_result
public func inversesqrt(v: float3) -> float3 {
    return float3(1) / sqrt(v)
}

/// Returns the reciprocal of the positive square root of v.
@warn_unused_result
public func inversesqrt(v: float4) -> float4 {
    return float4(1) / sqrt(v)
}

/// Returns the reciprocal of the positive square root of v.
@warn_unused_result
public func inversesqrt(v: double2) -> double2 {
    return double2(1) / sqrt(v)
}

/// Returns the reciprocal of the positive square root of v.
@warn_unused_result
public func inversesqrt(v: double3) -> double3 {
    return double3(1) / sqrt(v)
}

/// Returns the reciprocal of the positive square root of v.
@warn_unused_result
public func inversesqrt(v: double4) -> double4 {
    return double4(1) / sqrt(v)
}