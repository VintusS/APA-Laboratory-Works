//
//  RecursiveMethod.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 14.02.2024.
//

import Foundation

func fibonacciRecursive(n: Int) -> Int {
    if n == 1 {
        return 0
    } else if n == 2 {
        return 1
    }
    return fibonacciRecursive(n: n - 1) + fibonacciRecursive(n: n - 2)
}

func measureRecursiveFibonacciTimes(n: Int, runs: Int) {
    var timeData: [[TimeInterval]] = []

    // Collect time data
    for _ in 1...runs {
        var runTimes: [TimeInterval] = []
        for i in 1...n {
            let startTime = Date()
            _ = fibonacciRecursive(n: i)
            let endTime = Date()
            runTimes.append(endTime.timeIntervalSince(startTime))
        }
        timeData.append(runTimes)
    }

    // Print table header
    let header = (1...n).map { "Term \($0)" }.joined(separator: " | ")
    print(header)
    print(String(repeating: "-", count: header.count))

    // Print each row of time data
    for run in timeData {
        let row = run.map { String(format: "%.5f", $0) }.joined(separator: " | ")
        print(row)
    }
}
