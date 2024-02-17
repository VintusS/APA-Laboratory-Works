//
//  GoldenRatioMethod.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 14.02.2024.
//

import Foundation

func fibonacciGoldenRatio(n: Int) -> Double {
    let phi = (1 + sqrt(5)) / 2
    return Double(round(pow(phi, Double(n)) / sqrt(5)))
}

func fibonacciGoldenRatioApplied(terms: [Int], runs: Int) {
    // Placeholder for time data across runs for each term
    var timeData: [[TimeInterval]] = []

    // Collect time data for the specified terms across multiple "runs"
    for _ in 1...runs {
        var runTimes: [TimeInterval] = []
        for term in terms {
            let startTime = Date()
            _ = fibonacciGoldenRatio(n: term) // Calculate Fibonacci number for the term
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
