//
//  TabulationMethod.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 14.02.2024.
//

import Foundation

func fibonacciTabulation(n: Int) -> Decimal {
    if n <= 1 {
        return Decimal(n)
    }
    var fibNumbers: [Decimal] = [0, 1] + Array(repeating: 0, count: n - 1)
    for i in 2...n {
        fibNumbers[i] = fibNumbers[i - 1] + fibNumbers[i - 2]
    }
    return fibNumbers[n]
}

func fibonacciTabulationApplied(terms: [Int], runs: Int) {
    // Placeholder for time data across runs for each term
    var timeData: [[TimeInterval]] = []

    // Collect time data for the specified terms across multiple "runs"
    for _ in 1...runs {
        var runTimes: [TimeInterval] = []
        for term in terms {
            let startTime = Date()
            _ = fibonacciTabulation(n: term) // Calculate Fibonacci number for the term
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
