//
//  MatrixExponentiationMethod.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 14.02.2024.
//

import Foundation

func multiply(_ a: [[Double]], _ b: [[Double]]) -> [[Double]] {
    let x = a[0][0] * b[0][0] + a[0][1] * b[1][0]
    let y = a[0][0] * b[0][1] + a[0][1] * b[1][1]
    let z = a[1][0] * b[0][0] + a[1][1] * b[1][0]
    let w = a[1][0] * b[0][1] + a[1][1] * b[1][1]
    return [[x, y], [z, w]]
}

func power(_ matrix: [[Double]], _ n: Int) -> [[Double]] {
    if n == 1 {
        return matrix
    } else if n % 2 == 0 {
        let halfPower = power(matrix, n / 2)
        return multiply(halfPower, halfPower)
    } else {
        return multiply(matrix, power(matrix, n - 1))
    }
}

func fibonacciMatrix(n: Int) -> Double {
    if n == 0 { return 0.0 }
    let matrix = [[1.0, 1.0], [1.0, 0.0]]
    let result = power(matrix, n - 1)
    return result[0][0]
}


func fibonacciMatrixExponentiationApplied(terms: [Int], runs: Int) {
    // Placeholder for time data across runs for each term
    var timeData: [[TimeInterval]] = []

    // Collect time data for the specified terms across multiple "runs"
    for _ in 1...runs {
        var runTimes: [TimeInterval] = []
        for term in terms {
            let startTime = Date()
            _ = fibonacciMatrix(n: term) // Calculate Fibonacci number for the term
            let endTime = Date()
            runTimes.append(endTime.timeIntervalSince(startTime)) // Measure time taken
        }
        timeData.append(runTimes)
    }

    // Print table header for specified terms
    let header = terms.map { "Term \($0)" }.joined(separator: " | ")
    print(header)
    print(String(repeating: "-", count: header.utf16.count))

    // Print each row of time data
    for runTimes in timeData {
        let timeStrings = runTimes.map { String(format: "%.5f s", $0) }
        let row = timeStrings.joined(separator: " | ")
        print(row)
    }
}
