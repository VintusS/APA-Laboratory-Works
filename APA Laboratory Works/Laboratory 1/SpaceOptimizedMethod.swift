//
//  SpaceOptimizedMethod.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 14.02.2024.
//

import Foundation

func fibonacciSpaceOptimized(n: Int) -> Int {
    var a = 0, b = 1, sum = 0
    if n == 0 { return a }
    for _ in 2...n {
        sum = a + b
        a = b
        b = sum
    }
    return b
}
