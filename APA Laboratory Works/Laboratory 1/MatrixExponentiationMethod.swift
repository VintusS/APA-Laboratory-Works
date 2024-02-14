//
//  MatrixExponentiationMethod.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 14.02.2024.
//

import Foundation

func multiply(_ a: [[Int]], _ b: [[Int]]) -> [[Int]] {
    let x = a[0][0] * b[0][0] + a[0][1] * b[1][0]
    let y = a[0][0] * b[0][1] + a[0][1] * b[1][1]
    let z = a[1][0] * b[0][0] + a[1][1] * b[1][0]
    let w = a[1][0] * b[0][1] + a[1][1] * b[1][1]
    return [[x, y], [z, w]]
}

func power(_ matrix: [[Int]], _ n: Int) -> [[Int]] {
    if n == 1 {
        return matrix
    } else if n % 2 == 0 {
        let halfPower = power(matrix, n / 2)
        return multiply(halfPower, halfPower)
    } else {
        return multiply(matrix, power(matrix, n - 1))
    }
}

func fibonacciMatrix(n: Int) -> Int {
    if n == 0 { return 0 }
    let matrix = [[1, 1], [1, 0]]
    let result = power(matrix, n - 1)
    return result[0][0]
}
