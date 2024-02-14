//
//  MemoizationMethod.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 14.02.2024.
//

import Foundation

var memo = [Int: Int]()
func fibonacciMemoization(n: Int) -> Int {
    if n <= 1 {
        return n
    }
    if let result = memo[n] {
        return result
    }
    memo[n] = fibonacciMemoization(n: n - 1) + fibonacciMemoization(n: n - 2)
    return memo[n]!
}
