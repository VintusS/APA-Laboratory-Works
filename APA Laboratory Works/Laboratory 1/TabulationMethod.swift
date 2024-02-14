//
//  TabulationMethod.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 14.02.2024.
//

import Foundation

func fibonacciTabulation(n: Int) -> Int {
    if n <= 1 {
        return n
    }
    var fibNumbers = [0, 1] + Array(repeating: 0, count: n - 1)
    for i in 2...n {
        fibNumbers[i] = fibNumbers[i - 1] + fibNumbers[i - 2]
    }
    return fibNumbers[n]
}
