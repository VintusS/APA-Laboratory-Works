//
//  RecursiveMethod.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 14.02.2024.
//

import Foundation

func fibonacciRecursive(n: Int) -> Int {
    if n <= 1 {
        return n
    }
    return fibonacciRecursive(n: n - 1) + fibonacciRecursive(n: n - 2)
}
